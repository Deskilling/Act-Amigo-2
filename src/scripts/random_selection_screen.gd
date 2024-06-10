extends Node2D

@export var toggled: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _scene(scene):
	get_tree().change_scene_to_file("res://"+ scene + ".tscn")

func _on_button_pressed():
	_scene("mainmenu")

func _on_respin_pressed():
	_scene("scenes/impulse/random_selection_screen")
