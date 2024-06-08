extends Node2D

var time = 0
var is_rolling = false

var index = 0

const HEIGHT = 240.0
var speed = 5000.0
const DECCELERATION = 0.5

var velocity = speed

var label_string = ""
var audioPlayer
var audioPlayer2

var played_sound = false

func roll():
	velocity = speed
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
			lerp_scale = Vector2(0.98, 0.98)
		scale = lerp(scale, lerp_scale, delta * 20)
		
		if velocity <= 1000:
			if !audioPlayer2.playing:
				audioPlayer2.play()
		if position.y > 500:
			queue_free()
		if velocity <= 50:
			is_rolling = false
			if abs(position.y) < HEIGHT/2:
				$"..".select(label_string)
