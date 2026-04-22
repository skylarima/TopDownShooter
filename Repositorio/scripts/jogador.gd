extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var direction = Vector2(0,0)

@onready var ponta_arma = $mira
@export var projetil: PackedScene
@onready var som_tiro =$efeitotiro

	
func _physics_process(delta: float) -> void:
	
	rotacionar_corpo()
	
	mover()
	
	move_and_slide()
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("atirar"):
		disparar()
		
func disparar():
	var nova_bala = projetil.instantiate()
	nova_bala.global_position = ponta_arma.global_position
	
	nova_bala.direcao = (get_global_mouse_position() - self.global_position).normalized()
	
	nova_bala.global_position = ponta_arma.global_position
	
	get_tree().current_scene.add_child(nova_bala)
	
	som_tiro.play(0)
	
	await get_tree().create_timer(0.8).timeout
	
	som_tiro.stop()
func mover():
	
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	velocity = SPEED * direction
	
func rotacionar_corpo():
	look_at(get_global_mouse_position())
