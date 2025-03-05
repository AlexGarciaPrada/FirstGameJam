extends Node2D
@onready var label = $Label

func _physics_process(delta):
	label.text = str(Singleton.number)
	if get_tree().get_nodes_in_group("ENEMIES").size() == 0:
		$AudioStreamPlayer.play()
		
	
