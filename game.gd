extends Node2D

var _cherry_scene = preload("res://cherry.tscn")
var _strawberry_scene = preload("res://strawberry.tscn")
var _grape_scene = preload("res://grape.tscn")
var _orangish_scene = preload("res://orangish.tscn")
var _orange_scene = preload("res://orange.tscn")
var _tomato_scene = preload("res://tomato.tscn")
var _pomello_scene = preload("res://pomello.tscn")
var _peach_scene = preload("res://peach.tscn")
var _pineapple_scene = preload("res://pineapple.tscn")
var _melon_scene = preload("res://melon.tscn")
var _watermelon_scene = preload("res://watermelon.tscn")

var _current_fruit
var _fruit_list = [_cherry_scene, _strawberry_scene, _grape_scene, _orangish_scene, _orange_scene,
_tomato_scene, _pomello_scene, _peach_scene, _pineapple_scene,_melon_scene, _watermelon_scene]


func _physics_process(delta):
	if Input.is_action_just_pressed("close"):
		get_tree().quit()
	

func _spawn_fruit(pos, fruit_id):
	_current_fruit = _fruit_list[fruit_id].instantiate()
	add_child(_current_fruit)
	_current_fruit.fruits_collided.connect(_spawn_next_fruit)
	_current_fruit.position = pos

func _on_cloud_dropped_fruit(pos, fruit_id):
	_spawn_fruit(pos, fruit_id)
	
func _spawn_next_fruit(position, fruit_id):
	var fruit_id_to_spawn = fruit_id + 1
	_spawn_fruit(position, fruit_id_to_spawn)

	
