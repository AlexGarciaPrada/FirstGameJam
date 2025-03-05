extends Node2D
@onready var FinalScore = $FinalScore

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	FinalScore.text = "SCORE: "+ str(Singleton.score) 


func _on_retry_pressed():
	randomize ( )
	var firstlevel = randi_range (1,11)
	Singleton.UsedLevels.append(firstlevel)
	get_tree().change_scene_to_file("res://ProceduralScenes/scene"+str(firstlevel)+".tscn")
	Singleton.number = 1
	Singleton.activation = false
	Singleton.score = 0
	Singleton.BigBall = false
	Singleton.BigBall2= false
	Singleton.HabService = false
	Singleton.Run = false
	Singleton.UsedLevels = []
	Singleton.Shield = false
	Singleton.UsedHab= []
	Singleton.habserviceuse =true


func _on_exit_pressed():
	get_tree().quit()
