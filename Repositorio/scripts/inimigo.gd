extends CharacterBody2D

@export var SPEED = 200.0

@onready var jogador = %jogador

@export var projetilini: PackedScene

@onready var ponta_arma = $mirainimigo

func _physics_process(delta: float) -> void:
	
	if %jogador:
		mover()
	
	move_and_slide()
	
func mover():
	var direcao_jogador = (jogador.global_position - self.global_position).normalized()
	
	velocity = SPEED * direcao_jogador 
	
func tomar_dano():
	
	self.queue_free()

func disparar():
	var nova_bala = projetilini.instantiate()
	nova_bala.global_position = ponta_arma.global_position
	
	nova_bala.direcao = (jogador.global_position - self.global_position).normalized()
	
	nova_bala.look_at(jogador.global_position)
	
	get_tree().current_scene.add_child(nova_bala)


func _on_timer_timeout() -> void:
	disparar () # Replace with function body.
