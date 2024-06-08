extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _scene(scene):
	get_tree().change_scene_to_file("res://scenes/"+ scene + ".tscn")

func _on_to_impulse_pressed():
	_scene("impulse")

func _on_to_rollen_orte_konflikte_pressed():
	_scene("random_selection_screen")

func _on_to_stimmungen_pressed():
	pass # Replace with function body.

func _on_to_emojis_pressed():
	pass # Replace with function body.
 
 
