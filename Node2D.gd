extends Node
var temp = 0
var data = {
	"d1": "Test."
}

func _ready():
	var file = File.new()
	file.open("res://assets/project.json", File.READ)
	data = parse_json(file.get_as_text())
	addsprites()
	
func addsprites():
	while not temp >= data.targets.size():
		var node = KinematicBody2D.new()
		node.set_name(data.targets[temp].name)
		add_child(node)
		var temp2 = 0
		get_node(str(node.name)).set_script(load("res://converter.gd"))
		
		while not temp2 >= data.targets[temp].costumes.size():
			var ha = str(data.targets[temp].costumes[temp2].md5ext)
			var hat = str(data.targets[temp].costumes[temp2].name)
			print(ha)
			var image = Sprite.new()
			image.set_name(hat)
			node.add_child(image)
			print(str(node)+'/'+str(image))
			get_node(str(node.name)+'/'+str(image.name)).texture = load('res://assets/'+str(ha))
			if temp2 == data.targets[temp].costumes.size()-1:
				get_node(str(node.name)).data = get_node(str(node.name)).data + '"' + str(temp2) + '":' + '"' + str(hat) + '"'
			else:
				get_node(str(node.name)).data = get_node(str(node.name)).data + '"' + str(temp2) + '":' + '"' + str(hat) + '",'
			#node.add_child(load('res://assets/' + str(ha)))
			temp2 += 1
		get_node(str(node.name)).data = get_node(str(node.name)).data + '}'
		var ez = data.targets[temp]
		get_node(str(node.name)).visiblecos = ez.currentCostume
		get_node(str(node.name))._ready()
		temp += 1
	
