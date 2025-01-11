extends Node3D

var vel = 24.0;
var damage = 1;

func _physics_process(delta: float) -> void:
	var np = global_position + global_basis.z*vel*delta;
	var r = Global.raycast( global_position, np, [ Global.node_player ] );
	if( r ):
		var obj = r[ "collider" ];
		if( obj.has_method( "damage" ) ):
			obj.damage( damage );
		queue_free();
	
	else:
		global_position = np;
		if( global_position.z > 30 ):
			queue_free();
