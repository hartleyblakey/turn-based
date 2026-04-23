extends Node

@export var tilemap: TileMapLayer

var new_turn_takers = []
var remaining_turn_takers = []
var all_entities = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.new_round.connect(process_next_round)

	pass # Replace with function body.

func add_turn_taker(new_entity) -> void:
	new_turn_takers.push_front(new_entity)
	all_entities.push_front(new_entity)
	pass

func process_next_round() -> void:
	initialize_round()
	while true:
		var processed = await process_next_turn()
		if !processed:
			break;
	SignalBus.round_over.emit()

func initialize_round() -> void:
	new_turn_takers.clear()
	remaining_turn_takers.clear()
	all_entities.clear()
	for turn_taker in get_tree().get_nodes_in_group('turn_taker'):
		add_turn_taker(turn_taker)
	
	
func process_next_turn() -> bool:
	# add any new turn takers
	#for i in new_turn_takers.size():
		## loop backwards so push_front inserts turn takers in the proper order
		#new_turn_taker = new_turn_takers[-i-1]
		#remaining_turn_takers.push_front(new_turn_taker)
	remaining_turn_takers.append_array(new_turn_takers)
	new_turn_takers.clear()
	
	var turn_taker = remaining_turn_takers.pop_front()
	
	if turn_taker == null:
		return false
	
	
	await turn_taker.begin_turn(tilemap, all_entities)


	return true
	
	
	
