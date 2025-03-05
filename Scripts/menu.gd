extends Node2D

var usednumbers = []

func _on_play_pressed():
	randomize ( )
	var firstlevel = randi_range (1,11)
	Singleton.UsedLevels.append(firstlevel)
	get_tree().change_scene_to_file("res://ProceduralScenes/scene"+str(firstlevel)+".tscn")



func _on_exit_pressed():
	get_tree().quit() 
