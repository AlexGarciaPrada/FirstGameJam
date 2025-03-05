extends Node2D 
var nextscene = 0

func ItsUsed (integer:int):
	var aux = false
	var index = 0
	while index < len(Singleton.UsedLevels) and aux ==false:
		aux = integer == (Singleton.UsedLevels[index])
		index+=1
	return aux
func nswitchscene():
	if Singleton.number  % 3 == 0 and Singleton.number !=1:
		get_tree().change_scene_to_file ("res://ability_scene.tscn")
	else:
		randomize()
		nextscene = randi_range(1,11)
		while ItsUsed(nextscene):
			randomize()
			nextscene = randi_range(1,11)
		Singleton.UsedLevels.append(nextscene)
		get_tree().change_scene_to_file("res://ProceduralScenes/scene"+str(nextscene)+".tscn")
		Singleton.habserviceuse = true
func _physics_process(delta):
	if get_tree().get_nodes_in_group("ENEMIES").size() == 0:
		Singleton.activation = false
		nswitchscene()
