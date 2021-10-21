extends Node


var control_node : Node = get_parent()
export var initial_state : String
onready var state : State = get_state(initial_state)

func get_state(target : String) -> State:
    return get_node(target) as State

func transition(target : String, payload : Dictionary = {}) -> void:
    state.exit()
    state = get_state(target)
    state.enter(payload)

func register(node : State) -> void:
    node.control_node = control_node
    node.connect("transition", self, "transition")

# register all the children and enter the first state

func _ready() -> void:
    for child in get_children():
        register(child)
    
    state.enter()

# delegate

func _process(delta : float) -> void:
    state.process(delta)

func _physics_process(delta : float) -> void:
    state.physics_process(delta)

func _unhandled_input(event : InputEvent) -> void:
    state.handle_input(event)