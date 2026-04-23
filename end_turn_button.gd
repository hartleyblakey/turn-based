extends Button

signal end_turn_pressed

func _on_button_presseda() -> void:
	print("button pressed")
	end_turn_pressed.emit()
	pass
