extends Label

@onready var number = Singleton.number
func ready():
	self.text= str(number)
func _physics_process(delta):
	ready()
