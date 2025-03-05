extends CharacterBody2D
@onready var player= $"../../CharacterBody2D"
var run_speed = 175
@onready var counting = 0
@onready var enemysprite = $Sprite2D
func rotateenemysprite():
	if velocity.x < 0:
		enemysprite.set_flip_h(false)
	if velocity.x > 0:
		enemysprite.set_flip_h(true)
func _on_area_2d_area_entered(area):
	queue_free()
	counting +=1
	Singleton.score += 100
	
	
	
func _physics_process(delta):
	if get_tree().get_nodes_in_group("ENEMIES").size() != 0 and Singleton.activation ==true:
		velocity = Vector2.ZERO
		velocity = position.direction_to(player.position) * run_speed
		rotateenemysprite()
		move_and_slide()
