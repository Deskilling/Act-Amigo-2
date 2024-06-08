extends Node2D

var itemcontainer = preload("res://scenes/item_container.tscn")
var item_chain = []

var spin_duration = 5.0

const CHAIN_SIZE = 100

@onready var impulse_database = "res://assets/text/impulse.txt"

# Called when the node enters the scene tree for the first time.
func _ready():
	generate_chain()
	


func generate_chain():
	var speed = (randi() % 5000 + 5000)
	for i in range(0, CHAIN_SIZE):
		var item_container_instance = itemcontainer.instantiate()
		add_child(item_container_instance)
		item_chain.append(item_container_instance)
		item_container_instance.index = i
		item_container_instance.label_string = random_impulse()
		item_container_instance.audioPlayer = $AudioStreamPlayer
		item_container_instance.audioPlayer2 = $AudioStreamPlayer2
		item_container_instance.speed = speed
		
		item_container_instance.roll()
		
func random_impulse():
	var file = FileAccess.open(impulse_database, FileAccess.READ)
	var label_string = "schere"
	for i in range(0, randi() % 66):
		label_string = file.get_line()
	return label_string
	
func select(label_string : String):
	$"../item_display/AnimationPlayer".play("fade_in")
	hide()
	$"../Sprite2D".hide()
	$"../item_display/Label2".text = label_string
	$"../item_display".show()
	$AudioStreamPlayer3.play()

