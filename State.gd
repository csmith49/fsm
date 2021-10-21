extends Node

# transition signal, emitted to indicate a new state should be made active
signal transition(target, payload)

var control_node : Node = null

# set up and tear down for the state
func enter(_payload : Dictionary = {}) -> void:
    pass

func exit() -> void:
    pass

# virtual methods
func process(_delta : float) -> void:
    pass

func physics_process(_delta : float) -> void:
    pass

func handle_input(_event : InputEvent) -> void:
    pass