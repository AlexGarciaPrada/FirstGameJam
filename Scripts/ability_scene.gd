extends Node2D
@onready var HabText =$Label2
var cadena =""
var ab1 = 0
var ab2 = 0
var firstlevel = 0
var abselected = false
func Selectability (num:int) :
	if num == 1:
		cadena =" When pressing MAYUS the demon can go 1.5 faster right and left"
	if num ==2:
		cadena = "At the service the ball has 2X size"
	if num ==3:
		cadena = "Once a level, the demon is able to do a secound service pressing X"
	if num ==4:
		cadena = "A powerful shield that protects you from one hit"
	if num == 5:
		cadena = "At the service the ball has 3X size"
func ItsUsed (integer:int):
	var aux = false
	var index = 0
	while index < len(Singleton.UsedHab) and aux ==false:
		aux = integer == (Singleton.UsedHab[index])
		index+=1
	return aux
func Number1():
	randomize()
	ab1 = randi_range(1,4)
	if ItsUsed(4):
		while  ItsUsed(ab1):
			randomize()
			ab1 = randi_range(1,5)
	else:
		while ab2 == ab1 or ItsUsed(ab1):
			randomize()
			ab1 = randi_range(1,4)
func Number2():
	randomize()
	ab2 = randi_range(1,4)
	if ItsUsed(4):
		while ab2 == ab1 or ItsUsed(ab2):
			randomize()
			ab2 = randi_range(1,5)
	else:
		while ab2 == ab1 or ItsUsed(ab2):
			randomize()
			ab2 = randi_range(1,4)
func _on_i_pressed():
	if ab1 == 1:
		Singleton.Run = true
	if ab1 == 2:
		Singleton.BigBall = true
	if ab1 == 3:
		Singleton.HabService= true
	if ab1 == 4:
		Singleton.Shield = true
	if ab1 == 5:
		Singleton.BigBall2 = true
	Singleton.UsedHab.append(ab1)
	randomize()
	firstlevel = randi_range(11 * Singleton.number /5 +  Singleton.number /5 ,11 * Singleton.number /5 +  Singleton.number / 5 +10 )
	get_tree().change_scene_to_file("res://ProceduralScenes/scene"+str(firstlevel)+".tscn")
func _on_ii_pressed():
	if ab2 == 1:
		Singleton.Run = true
	if ab2 == 2:
		Singleton.BigBall = true
	if ab2 == 3:
		Singleton.HabService= true
	if ab2 == 4:
		Singleton.Shield = true
	if ab2 == 5:
		Singleton.BigBall2 = true
	Singleton.UsedHab.append(ab2)
	randomize()
	firstlevel = randi_range(11 * Singleton.number /5 +  Singleton.number /5 ,11 * Singleton.number /5 +  Singleton.number/5 + 10)
	get_tree().change_scene_to_file("res://ProceduralScenes/scene"+str(firstlevel)+".tscn")
func _on_i_mouse_entered():	
		Selectability(ab1)	
		HabText.show()
		HabText.text = cadena
func _on_i_mouse_exited():
		HabText.hide()

func _on_ii_mouse_entered():
	Selectability(ab2)
	HabText.show()
	HabText.text = cadena
func _on_ii_mouse_exited():
	HabText.hide()
func _ready():
	Number1()
	Number2()
func _process(delta):
	pass # Replace with function body.
