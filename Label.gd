extends Label

@onready var number = 1
func ready():
	self.text= str(number)
func _physics_process(delta):
	ready()
