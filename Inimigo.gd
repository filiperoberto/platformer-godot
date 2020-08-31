extends StaticBody2D

var flip = true
var initialPosition
var finalPosition;
var dying = false

var velocidade = 0.3

func _ready():
	$Sprite.play("Walk")
	initialPosition = $".".position.x
	finalPosition = initialPosition + 100

func _process(delta):
	
	$Sprite.flip_h = flip
	
	if dying:
		$Sprite.stop()
		return
	
	if (initialPosition <= finalPosition and flip):
		$".".position.x += velocidade
		flip = $".".position.x < finalPosition

	if ($".".position.x >= initialPosition and !flip):
		$".".position.x -= velocidade
		flip = $".".position.x <= initialPosition

func dano():
	dying = true
	get_node("AnimationPlayer").play("Die")

func die():
	$".".queue_free()
