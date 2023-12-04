extends RigidBody2D
class_name FruitBase

signal fruits_collided

@export var fruit_id = SUIKA.FRUITS

var disabled = false

func _init():
	contact_monitor = true
	max_contacts_reported = 5


func _physics_process(delta):
	var contacts = get_colliding_bodies()
	var num = get_contact_count()
	print(num)
	for body in contacts:
		if body is FruitBase:
			if not body.disabled:
				if fruit_id == body.fruit_id:
					disabled = true
					body.disabled = true
					body.queue_free()
					fruits_collided.emit(position, fruit_id)
					queue_free()
