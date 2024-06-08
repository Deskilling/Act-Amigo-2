extends Node2D

var n = 0
var txts = ["impulse.txt"]
var url = "https://raw.githubusercontent.com/Deskilling/Act-Amigo-2/main/src/assets/text/"
@onready var http_request = $network/HTTPRequest

@onready var text_file = $Status/file
@onready var text_index = $Status/index
@onready var text_saved = $Status/saved
@onready var text_response_code = $Status/response_code

func _update_text(textvalue,update,bbcode):
	textvalue.text = "[" + str(bbcode) + "]"+ str(update) + "[/" + str(bbcode) + "]"

func _scene(scene: String):
	get_tree().change_scene_to_file("res://" + scene + ".tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	http_request.request_completed.connect(_on_http_request_request_completed)
	_request()

func _request():
	if n < txts.size():
		http_request.request(url + txts[n])
		_update_text(text_file,txts[n],"center")
		_update_text(text_index,n,"center")
	else:
		await get_tree().create_timer(1).timeout 
		_scene("mainmenu")

func _save(content):
	var file = FileAccess.open("user://assets/text/" + txts[n], FileAccess.WRITE)
	_update_text(text_saved,"user://assets/text/" + txts[n],"center")
	file.store_string(content)

func _on_http_request_request_completed(result, response_code, headers, body):
	if response_code == 200:
		var requested_text = body.get_string_from_utf8()
		_save(requested_text)
	else:
		var repsone_code = 404

	_update_text(text_response_code,response_code,"center")
	n += 1
	_request()
