extends Node3D

var pos = Vector2();
var motion = Vector2();
var vel = 3.0;
var weapon_c = 0.0;


func _physics_process(delta: float) -> void:
	var control = Input.get_vector( "left", "right", "up", "down" );
	if( control.length() > 1.0 ):
		control = control.normalized();
	
	motion *= 1.0 - delta*12.0;
	motion += control*vel*delta;
	
	pos -= motion;
	pos.x = clampf( pos.x, -10, 10 );
	pos.y = clampf( pos.y, -10, 10 );
	
	global_position = Vector3( pos.x, 0.0, pos.y );
	
	rotation = Vector3( deg_to_rad( -motion.y*60.0 ), deg_to_rad( -motion.x*45.0 ), deg_to_rad( motion.x*45.0 ) );
	
	if( weapon_c > 0.0 ):
		weapon_c -= delta;
	elif( Input.is_action_pressed( "shoot" ) ):
		Global.spawn( "player_proj", global_position, 0.0 );
		weapon_c = 0.1;
