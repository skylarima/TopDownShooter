extends CharacterBody2D

@onready var jogador = %jogador

const SPEED = 300.0

func _physics_process(delta: float) -> void:
	if jogador:
		mover()
	
	move_and_slide()
	
func mover():
	var direcao_jogador = (jogador.global_position - self.global_position).normalized()
	
	velocity = SPEED * direcao_jogador 
