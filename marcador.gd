extends CanvasLayer

var puntos = 0

func _on_jugador_puntos() -> void:
	puntos += 1
	$Numero.frame = puntos%10
	$Numero2.frame = puntos/10
