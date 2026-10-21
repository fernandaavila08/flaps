extends CharacterBody2D

signal perder
signal puntos
const JUMP_VELOCITY = -400.0
var active = false
var points = 0

func _physics_process(delta: float) -> void:
	#gravedad
	#manejar salto
	if active == true:
		velocity += get_gravity() * delta
		if Input.is_action_just_pressed("salto"):
			$flap.play()
			velocity.y = JUMP_VELOCITY
		move_and_slide()
	elif Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
	velocity.y = clamp(velocity.y, -500, 500)
	rotacion()
	#Ejecutar movimiento

func rotacion():
	var deg = velocity.y * 65 / 500
	$AnimatedSprite2D.rotation_degrees = deg

func score():
	$score.play()
	emit_signal("puntos")


func _on_ui_empezar() -> void:
	active = true
	velocity.y = JUMP_VELOCITY

func stop():
	$lose.play()
	active = false
	$AnimatedSprite2D.stop()
	emit_signal("perder")
