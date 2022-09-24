extends KinematicBody2D
var visiblecos = NAN
#This is gonna be the json
var data = '{'

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print(data)
	data = JSON.parse(data).result
	print(data)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
