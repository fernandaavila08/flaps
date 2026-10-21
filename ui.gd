extends Sprite2D

signal empezar

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("salto"):
		emit_signal("empezar")
		queue_free()
