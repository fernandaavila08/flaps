
extends Node2D

var tuberias = preload("res://tuberias.tscn")

func _on_timer_timeout() -> void:
	add()

func add():
	var tuberias_instance = tuberias.instantiate()
	tuberias_instance.global_position = global_position
	add_child(tuberias_instance)

func _on_ui_empezar() -> void:
	add()
	$Timer.start()


func _on_jugador_perder() -> void:
	$Timer.stop()
	for i in get_children():
		if i != $Timer:
			i.velocity.x = 0
