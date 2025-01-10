extends Node3D

var pos = Vector2();
var motion = Vector2();
var vel = 0.2;

func _physics_process(delta: float) -> void:
	if( Global.mouse_control ):
		update_mouse( delta );
	else:
		update_standard( delta );

func update_standard( delta: float ):
	var control = Input.get_vector( "left", "right", "up", "down" );
	if( control.length() > 1.0 ):
		control = control.normalized();
	
	pos -= control*vel;
	pos.x = clampf( pos.x, -10, 10 );
	pos.y = clampf( pos.y, -10, 10 );
	
	global_position = Vector3( pos.x, 0.0, pos.y );

func update_mouse( delta: float ):
	var target = Vector2(
		clampf( Global.mouse_pos.x, -10, 10 ),
		clampf( Global.mouse_pos.z, -10, 10 ) );
	
	var offset = target - pos;
	
	if( offset.length() > 1.0 ):
		pos += offset.normalized()*vel;
	else:
		pos += offset*vel;
	
	global_position = Vector3( pos.x, 0.0, pos.y );
