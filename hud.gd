extends CanvasLayer

var awaiting_player_action = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.request_player_action.connect(_on_request_player_action)
	pass # Replace with function body.

func _on_request_player_action():
	self.visible = true
	awaiting_player_action = true

func _input(event):
	if event.is_action_pressed("pass_turn"):
		_on_end_turn_button_pressed()
	if event.is_action_pressed("move_left"):
		_on_request_move(Vector2i(-1, 0))
	if event.is_action_pressed("move_right"):
		_on_request_move(Vector2i(1, 0))

func _on_end_turn_button_pressed() -> void:
	if !awaiting_player_action:
		return
	var end_turn_action = EndTurnAction.new()
	take_action(end_turn_action)
	
func _on_request_move(delta: Vector2i):
	var move_action = MoveAction.new(delta)
	take_action(move_action)

func take_action(action):
	awaiting_player_action = false
	self.visible = false
	SignalBus.player_action_response.emit(action)
