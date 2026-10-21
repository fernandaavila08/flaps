extends CharacterBody2D

func _ready() -> void:
	velocity.x = -120
	position.y += randf_range(-100, 100)

func _physics_process(delta: float) -> void:
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	body.score()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
