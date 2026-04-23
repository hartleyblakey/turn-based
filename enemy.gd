extends Node2D

class_name Enemy

@export var faction = "Enemy"

var turn_count: int = 0

func begin_turn(tilemap: TileMapLayer, entities) -> void:
	for i in range(randi() % 10):
		await move_random()
	var opponent = find_closest_opponent(tilemap, entities)
	opponent.take_damage(5)
	pass

func move_random():
	await get_tree().create_timer(0.3).timeout
	var axis = randi() % 2
	var sign = randi() % 2
	var dir = Vector2i(0, 0)
	dir[axis] = 25
	if sign:
		dir[axis] = -dir[axis]
	
	self.translate(dir)
	
func find_opponents(entities):
	var opponents = []
	for entity in entities:
		if entity.faction != faction:
			opponents.append(entity)
	return opponents

func find_closest_opponent(tilemap: TileMapLayer, entities):
	var opponents = find_opponents(entities)
	var closest = null
	var best_dist = INF
	var tile = tilemap.local_to_map(position)
	for opponent in opponents:
		var dist = tile.distance_to(tilemap.local_to_map(opponent.position))
		if dist < best_dist:
			best_dist = dist
			closest = opponent
	return closest

func take_damage(dmg: int):
	print("Enemy took %d damage" % dmg)
