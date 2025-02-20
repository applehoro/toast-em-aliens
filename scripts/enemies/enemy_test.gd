extends Area3D

var is_active = false;
var vel = 4.0;
var hp = 3.0;
var shoot_c = 4.0;
var motion_phase = 0.0;

func _physics_process(delta: float) -> void:
	if( is_active ):
		shoot_c -= delta;
		if( shoot_c <= 0.0 ):
			shoot_c = 1.0;
			Global.spawn( "proj_circle", global_position, 0.0 );
		
		motion_phase += delta*0.5;
		if( motion_phase > 1.0 ):
			motion_phase -= 1.0;
		
		global_position.x += sin( motion_phase*PI*2.0 )*vel*delta;
		
		global_position.z -= vel*delta;
		if( global_position.z < -20 ):
			queue_free();
	
	elif( global_position.z < 32 ):
		is_active = true;
	
	for obj in get_overlapping_areas():
		if( obj.is_in_group( "player" ) ):
			obj.damage( 1.0 );

func damage( d ):
	if( is_active ):
		hp -= d;
		if( hp <= 0.0 ):
			die();

func die():
	queue_free();
