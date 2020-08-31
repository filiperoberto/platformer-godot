extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 20
const MOVE_SPEED = 200
const JUMP_HEIGHT = 400

var extra_jump = 1

var move = Vector2()

func _physics_process(delta):
	
	move.y += GRAVITY
	
	if Input.is_action_pressed("ui_right"):
		move.x = MOVE_SPEED
		$Sprite.play("Run")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		move.x = -MOVE_SPEED
		$Sprite.play("Run")
		$Sprite.flip_h = true
	else:
		move.x = 0
		if Input.is_action_pressed("ui_down"):
			$Sprite.play("Crouch")
		else:
			$Sprite.play("Idle")

	if Input.is_action_just_pressed("ui_up") and extra_jump > 0:
		move.y = -JUMP_HEIGHT
		extra_jump -= 1

	if is_on_floor() or is_on_wall():
		extra_jump = 1
		
	if (!is_on_floor()): 
		$Sprite.play("Jump")
	
	move = move_and_slide(move, UP)
