extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var direction = Vector2(0,0)

@export var projetil: PackedScene

func _physics_process(delta: float) -> void:
	
	rotacionar_corpo()
	
	mover()
	
	move_and_slide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("atirar"):
		disparar()

func disparar():
	var nova_bala = projetil.instantiate()
	nova_bala.global_position = $EmissorBala
func mover():
	
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	velocity = SPEED * direction
		
func rotacionar_corpo():
	look_at(get_global_mouse_position())
	
