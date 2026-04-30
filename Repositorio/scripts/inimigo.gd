extends CharacterBody2D

@export var SPEED = 200.0

@onready var jogador = %jogador


func _physics_process(delta: float) -> void:
	
	if %jogador:
		mover()
	
	move_and_slide()
	
func mover():
	var direcao_jogador = (jogador.global_position - self.global_position).normalized()
	
	velocity = SPEED * direcao_jogador 
	
func tomar_dano():
	
	self.queue_free()
