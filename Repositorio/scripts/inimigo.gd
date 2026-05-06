extends CharacterBody2D

@export var SPEED = 200.0

@onready var jogador = %jogador

@export var projetilini: PackedScene

@onready var ponta_arma = $mirainimigo

var direcao_jogador = Vector2.ZERO

func _physics_process(delta: float) -> void:
	
	if %jogador:
		mover()
		virar() 
	
	move_and_slide()
	
func mover():
	direcao_jogador = (jogador.global_position - self.global_position).normalized()
	
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

func virar(): 
	if direcao_jogador.x>0: 
		$spritecorpo.flip_h= false
		$spritearma.flip_h= false
		$spritearma.position= Vector2(246,4)
		$mirainimigo.position= Vector2(368,0)
	elif direcao_jogador.x <0:
		$spritecorpo.flip_h= true
		$spritearma.flip_h= true
		$spritearma.position= Vector2(-246,4)
		$mirainimigo.position= Vector2(-368,0)
		
