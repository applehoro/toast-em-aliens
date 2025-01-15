extends MeshInstance3D

var phase = 0.0;
var phase3 = 0.0;
var pos = Vector2();
var pos3 = Vector2();

func _ready() -> void:
	get_active_material(0).albedo_texture = $water_tex.get_texture();

func _process(delta: float) -> void:
	phase += delta/3.5;
	pos.x = sin( phase*PI*2.0 )*6;
	
	if( pos.x < 0 ):
		pos.x += 64;
	if( pos.x >= 64 ):
		pos.x -= 64;
	if( pos.y < 0 ):
		pos.y += 64;
	if( pos.y >= 64 ):
		pos.y -= 64;
	
	$water_tex/water.region_rect.position = pos;
	
	phase3 += delta/6.8;
	pos3.y = -24 - sin( phase3*PI*2.0 )*12;
	pos3.y = -32 + sin( phase3*PI*2.0 )*3;
	
	$water_tex/water_3.offset = pos3;
	
	if( global_position.z < 12 ):
		global_position.z += 12;
