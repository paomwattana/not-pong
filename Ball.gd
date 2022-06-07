extends RigidBody2D


var life = 13

func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	# randomize position, keeps height at 50px from the top
	set_position(Vector2(rng.randi_range(0, 1024), 50))
	
	# randomize linear velocity
	linear_velocity = Vector2(rng.randi_range(-100, 100), rng.randi_range(-100, 100))
	pass


# destroy ball after hitting, otherwise it'd cause memory hog

# alternative: make ball automatically destroy itself after 3 sec
# 	(should be longer than time taken to spawn)


func _on_BallLifespanTimer_timeout():
	life -= 1
	print(str(scale.x) + " " + str(scale.y))
	
	scale.x *= 0.8
	scale.y *= 0.8
	if (life <= 0):
		queue_free()
