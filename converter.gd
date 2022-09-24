extends KinematicBody2D
var visiblecos = NAN
var data = '{'

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print(data)
	data = to_json(data)
	var file = File.new()
	file.open(data, File.READ)
	data = parse_json(file.get_as_text())
	print(data)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
