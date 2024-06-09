extends Node2D

var itemcontainer_consumer = preload("res://scenes/impulse/item_container_consumer.tscn")
var itemcontainer_industrial = preload("res://scenes/impulse/item_container_industrial.tscn")
var itemcontainer_milspec = preload("res://scenes/impulse/item_container_milspec.tscn")
var itemcontainer_restricted = preload("res://scenes/impulse/item_container_restricted.tscn")
var itemcontainer_classified = preload("res://scenes/impulse/item_container_classified.tscn")
var itemcontainer_covert = preload("res://scenes/impulse/item_container_covert.tscn")
var itemcontainer_contraband =preload("res://scenes/impulse/item_container_contraband.tscn")
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
		var rng = RandomNumberGenerator.new()
		var item_container_instance = null
		var rng_number = rng.randf_range(0.0, 100.0)
		if rng_number < 0.26:
			item_container_instance = itemcontainer_contraband.instantiate()
		elif rng_number < 0.9:
			item_container_instance = itemcontainer_covert.instantiate()
		elif rng_number < 4.1:
			item_container_instance = itemcontainer_classified.instantiate()
		elif rng_number < 20:
			item_container_instance = itemcontainer_restricted.instantiate()
		elif rng_number < 35:
			item_container_instance = itemcontainer_milspec.instantiate()
		elif rng_number < 70:
			item_container_instance = itemcontainer_industrial.instantiate()
		else:
			item_container_instance = itemcontainer_consumer.instantiate()
		
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
	var label_string = "das hat nicht geklappt schade schokolade marmelade :(("
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
