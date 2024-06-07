extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _scene(scene):
	get_tree().change_scene_to_file("res://"+ scene + ".tscn")

func _on_to_main_pressed():
	_scene("mainmenu")


func _on_http_request_request_completed(result, response_code, headers, body):
	pass # Replace with function body.
