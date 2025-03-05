extends CharacterBody2D
@onready var enemy = $"../Enemies/Enemy"
@onready var player = $"../CharacterBody2D"
@onready var bounce = $AudioStreamPlayer
var velocity2 = Vector2 (300,300)
var direction = Vector2()
var angle = 0.0
var n = 0
func bigball():
	if Singleton.BigBall and n==0:
		scale = Vector2(2,2)
	if n!=0:
		scale = Vector2 ( 1,1)
func bigball2():
	if Singleton.BigBall2 and n==0:
		scale = Vector2(3,3)
	if n!=0:
		scale = Vector2 ( 1,1)
func service():
		rotation += 0.1
		angle +=0.1
		if Input.is_action_just_pressed("space"):
			Singleton.activation = true
			$Sprite2D/Arrow.hide()
			if velocity2.x == 300 and velocity2.y == 300:
				direction = Vector2 (cos (angle), sin (angle)) 
			if velocity2.x == -300 and velocity2.y == 300:
				direction = Vector2 (-cos (angle), sin (angle)) 
			if velocity2.x == 300 and velocity2.y == -300:
				direction = Vector2 (cos (angle), -sin (angle)) 
			if velocity2.x == -300 and velocity2.y == -300:
				direction = Vector2 (-cos (angle), -sin (angle)) 
func habservice():
	if Input.is_action_just_pressed("Service") and Singleton.HabService and Singleton.habserviceuse:
		Singleton.activation = false
		$Sprite2D/Arrow.show()	
		Singleton.habserviceuse= false
func _on_area_2d_area_entered(area):
	$AudioStreamPlayer2.play()

func _physics_process(delta):
	bigball()
	bigball2()
	if Singleton.activation ==false:
		service()
	if Singleton.activation ==true:	
		habservice()
		var collision = move_and_collide(velocity2 * direction * delta * (1 + 0.05 * n))
		if collision:
			velocity2 = velocity2.bounce(collision.get_normal())  
			bounce.play()
			
				
			n+=1
		
	if get_tree().get_nodes_in_group("ENEMIES").size() == 0:
		Singleton.activation = false
	
