extends Node3D

var vel = 8.0;
var damage = 1.0;

func _physics_process(delta: float) -> void:
	global_position -= global_basis.z*vel*delta;
	if( global_position.z > 30 ):
		die();

func die():
	queue_free();

func _on_area_entered(area: Area3D) -> void:
	if( area.is_in_group( "player" ) ):
		area.damage( damage );
		die();
