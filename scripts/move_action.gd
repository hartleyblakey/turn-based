extends TurnAction

class_name MoveAction

func _init(target: Vector2i):
	targets = [target]
	action_type = Type.Move
	action_name = "Move"
