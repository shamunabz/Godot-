extends Area2D
export var speed=100
var screen_size
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size=get_viewport_rect().size 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	var velocity=Vector2.ZERO
	if (Input.is_action_pressed("ui_down")):
		velocity.y-=1
	if (Input.is_action_pressed("ui_up")):
		velocity.y+=1
	if (Input.is_action_pressed("ui_left")):
		velocity.x-=1
	if (Input.is_action_pressed("ui_right")):
		velocity.x+=1
	if velocity.length()>0:
		velocity=velocity.normalized() *speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	position+= velocity *delta
	position.x=clamp(position.x,0, screen_size.x)
	position.y=clamp(position.y,0, screen_size.y)
