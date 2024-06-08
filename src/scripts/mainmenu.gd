extends Node2D
func _ready():
	pass

func _process(delta):
	pass
# Buttons + Scene Switch
func _scene(scene: String):
	get_tree().change_scene_to_file("res://scenes/" + scene + ".tscn")

func _on_to_impulse_pressed():
	_scene("impulse")

func _on_to_rollen_orte_konflikte_pressed():
	pass

func _on_to_stimmungen_pressed():
	pass

func _on_to_emojis_pressed():
	pass	
