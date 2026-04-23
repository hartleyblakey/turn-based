class_name TurnAction

extends Resource

@export var action_name: String = "unnamed action"
@export var action_type: Type = Type.EndTurn

enum Type {Move, Attack, EndTurn}

var targets: Array[Vector2i]

func _init(p_action_name = "unnamed action"):
	action_name = p_action_name
	action_type = Type.EndTurn
	targets = []

static func attack(targets: Array[Vector2i]) -> TurnAction:
	var val = TurnAction.new()
	val.targets = targets
	val.action_type = Type.Attack
	val.action_name = "Attack"
	return val


static func move(target: Vector2i) -> TurnAction:
	var val = TurnAction.new()
	val.targets = [target] as Array[Vector2i]
	val.action_type = Type.Move
	val.action_name = "Move"
	return val
	
static func end_turn() -> TurnAction:
	var val = TurnAction.new()
	val.action_type = Type.EndTurn
	val.action_name = "End Turn"
	return val
