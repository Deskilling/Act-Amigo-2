extends Node2D

var time = 0
var is_rolling = false

var index = 0

const HEIGHT = 240.0
const SPEED = 5000.0
const DECCELERATION = 0.5

var velocity = SPEED

var label_string = ""
var audioPlayer

var played_sound = false

func roll():
	is_rolling = true
	$Sprite2D/Label.text = label_string
	position.y = -index * HEIGHT

func _process(delta):
	
	
	if is_rolling:
		velocity = lerpf(velocity, 0, delta * DECCELERATION)
		#velocity *= delta * DECCELERATION
		position.y += velocity * delta
		var lerp_scale = Vector2(1.0, 1.0)
		if abs(position.y) < HEIGHT/2:
			lerp_scale = Vector2(1.0, 1.0)
			if !played_sound:
				audioPlayer.play()
				played_sound = true
		else:
			lerp_scale = Vector2(0.95, 0.95)
		scale = lerp(scale, lerp_scale, delta * 20)
		if velocity <= 50:
			is_rolling = false
