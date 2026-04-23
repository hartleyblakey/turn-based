extends Node2D

signal any_key_pressed

var faction = "Player"

var turn_count: int = 0

func _input(event):
	if event is InputEventKey and event.pressed:
		any_key_pressed.emit()

func begin_turn(tilemap: TileMapLayer, entities) -> void:
	print("Taking a turn on tilemap " + tilemap.name + " " + str(turn_count))
	SignalBus.request_player_action.emit()
	var turn_action = await SignalBus.player_action_response
	
	while turn_action.action_type != TurnAction.Type.EndTurn:
	
		if turn_action.action_type == TurnAction.Type.Move:
			self.translate(Vector2(50.0, 0.0) * Vector2(turn_action.targets[0]))
			
		SignalBus.request_player_action.emit()
		turn_action = await SignalBus.player_action_response
	
	pass


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
