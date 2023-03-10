extends CharacterBody2D

const SPEED = 100
var motion = Vector2.ZERO
@onready var playerAnimation = $AnimatedSprite2D
var movingRight = false

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	
	#get movement input
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	input_vector = input_vector.normalized()
	
	#update animation sprite
	if input_vector == Vector2.ZERO: 
		pass
	else:
		if input_vector.x > 0: 
			if input_vector.y == 0:
				playerAnimation.play("move_left")
			if movingRight == false:
				movingRight = true
				playerAnimation.flip_h = true
			
		elif input_vector.x < 0: 
			if input_vector.y == 0:
				playerAnimation.play("move_left")
			movingRight = false
			playerAnimation.flip_h = false
		if input_vector.y > 0: 
			if input_vector.x == 0:
				playerAnimation.play("move_down")
		elif input_vector.y < 0: 
			if input_vector.x == 0:
				playerAnimation.play("move_up")
			
	#update movement
	move_and_collide(input_vector * SPEED * delta)
	
