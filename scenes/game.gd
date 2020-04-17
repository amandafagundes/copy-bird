extends Node2D

onready var bird = get_node("Bird")
onready var timer = get_node("TimeToReplay")
onready var backgroundAnimatiom = get_node("BackAnim")
onready var label = get_node("LabelNode/Control/Label")

var points = 0
var state = 1

const PLAYING = 1
const LOSING = 2

func _ready():
	pass

func kill():
	get_node("HitSound").play()
	bird.apply_impulse(Vector2(0, 0), Vector2(-1000, 0))
	backgroundAnimatiom.stop()
	state = LOSING
	timer.start()
	

func _on_TimeToReplay_timeout():
	get_tree().reload_current_scene()
	
func incrementPoints():
	get_node("ScoreSound").play()
	points += 1
	label.set_text(str(points))
