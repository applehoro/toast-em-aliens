extends Node3D

@onready var node_scroll = $scroll;
@onready var node_camera = $scroll/camera;
@onready var node_player = $scroll/player;

func _ready() -> void:
	var p = node_scroll.global_position*( 1.0 - 0.1 ) + node_player.global_position*( 0.1 );
	node_camera.look_at( p );

func _process(delta: float) -> void:
	var p = node_scroll.global_position*( 1.0 - 0.1 ) + node_player.global_position*( 0.1 );
	node_camera.look_at( p );

func _physics_process(delta: float) -> void:
	var drop_plane  = Plane( Vector3( 0.0, 1.0, 0.0 ), 0.0 );
	Global.mouse_pos = drop_plane.intersects_ray(
		node_camera.project_ray_origin( get_viewport().get_mouse_position() ),
		node_camera.project_ray_normal( get_viewport().get_mouse_position() ) );
