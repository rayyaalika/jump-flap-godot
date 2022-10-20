extends KinematicBody2D



const UP = Vector2(0, -1)
const FLAP = 200
const MAXFALLSPEED = 200
const GRAVITY = 10

var motion = Vector2()
var Wall = preload("res://WallNode.tscn")
var score = 0

func _ready():
	pass # Replace with function body.
	
	
func _physics_process(delta):
	
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
	if Input.is_action_just_pressed("FLAP"):
		motion.y = -FLAP
		$Sprite.play("fly")
	if Input.is_action_just_released("FLAP"):
		$Sprite.play("fly")
	
	motion = move_and_slide(motion, UP)
	
	get_parent().get_parent().get_node("CanvasLayer/Label").text = "Score : " + str(score)
	
	

func _on_Detect_area_entered(area):
	if area.name == "PointArea":
		score = score + 1

func _on_Detect_body_entered(body):
	if body.name == "Walls":
		get_tree().reload_current_scene()
