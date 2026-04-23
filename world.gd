extends Node2D

var game_over = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	game_loop()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func game_loop() -> void:
	while !game_over:
		print("new round")
		SignalBus.new_round.emit()
		await SignalBus.round_over
		print("round over")
		await get_tree().create_timer(0.1).timeout
