extends Node2D

@onready var _cherry_img = $Cherry
@onready var _strawberry_img = $Strawberry
@onready var _grape_img = $Grape
@onready var _orangish_img = $Orangish
@onready var _orange_img = $Orange
@onready var _tomato_img = $Tomato
@onready var _pomello_img = $Pomello
@onready var _peach_img = $Peach
@onready var _pineapple_img = $Pineapple
@onready var _melon_img = $Melon
@onready var _watermelon_img = $Watermelon


@onready var _rng = RandomNumberGenerator.new()

var _fruit_list

signal dropped_fruit

var _current_fruit
var _current_fruit_id

const CLOUD_SPEED = 4
const DROP_COOLDOWN = 50
var _tick = 0
var _waiting_to_spawn = false


func _pick_random_fruit():
	return _rng.randi_range(0, 4)

func _spawn_new_fruit():
	_current_fruit_id = _pick_random_fruit()
	_current_fruit = _fruit_list[_current_fruit_id]
	_current_fruit.show()

func _ready():
	_set_up_list()
	_spawn_new_fruit()

	
func _drop():
	_current_fruit.hide()
	_waiting_to_spawn = true
	dropped_fruit.emit(position, _current_fruit_id)

func _physics_process(delta):
	if Input.is_action_pressed("left"):
		position.x -= CLOUD_SPEED
	if Input.is_action_pressed("right"):
		position.x += CLOUD_SPEED
	if Input.is_action_just_pressed("drop"):
		_drop()
	
	if _waiting_to_spawn:
		_ticker()

func _ticker():
	_tick += 1
	if _tick > DROP_COOLDOWN:
		_tick = 0
		_spawn_new_fruit()
		_waiting_to_spawn = false

func _set_up_list():
	_fruit_list = [
	_cherry_img,
	_strawberry_img,
	_grape_img,
	_orangish_img,
	_orange_img
	]
