extends CharacterBody2D
@export var speed = 600
@onready var dashspeed = 1.5
@onready var sprite = $SpritePlayer
@onready var shieldsprite= $Sprite2D
@onready var area =	$Area2D
func destroyplayer():	
		get_tree().change_scene_to_file("res://game_over.tscn")
func _on_area_2d_area_entered(area):
	if Singleton.Shield ==true:
		shieldsprite.hide()
		sprite.show()
		Singleton.UsedHab.erase(4)
	else:
		$AudioStreamPlayer.play()
		destroyplayer()
func _on_area_2d_area_exited(area):
	$AudioStreamPlayer2.play()
	Singleton.Shield = false
func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
func rotatesprite():
	if velocity.x < 0:
		sprite.set_flip_h(true)
	if velocity.x > 0:
		sprite.set_flip_h(false)
func shield():
	if Singleton.Shield == true:
		
		sprite.hide()
		shieldsprite.show()
	else:
		shieldsprite.hide()
		sprite.show()
func run():
	if Input.is_action_pressed("dash") and Singleton.Run == true:
			velocity.x = velocity.x * dashspeed 
func _physics_process(delta):
	
	shield()
	if Singleton.activation == true:
		get_input()
		rotatesprite()
		run()
		move_and_slide()
		
	







	
