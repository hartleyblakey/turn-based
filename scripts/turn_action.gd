class_name TurnAction

@export var action_name: String = "unnamed action"
@export var action_type: Type = Type.EndTurn

enum Type {Move, Attack, EndTurn}

var targets: Array[Vector2i]

func __init(p_action_name = "unnamed action"):
	action_name = p_action_name
	action_type = Type.EndTurn
	targets = []


## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
