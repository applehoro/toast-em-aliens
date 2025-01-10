extends Node3D

@onready var node_scroll = $scroll;
@onready var node_camera = $camera;
@onready var node_player = $player;
@onready var node_center = $center;

var camera_player_influence = 0.1;
var scroll_speed = 2.0;

func _ready() -> void:
	var p = node_center.global_position*( 1.0 - camera_player_influence ) + node_player.global_position*( camera_player_influence );
	node_camera.look_at( p );

func _process(delta: float) -> void:
	var p = node_center.global_position*( 1.0 - camera_player_influence ) + node_player.global_position*( camera_player_influence );
	node_camera.look_at( p );

func _physics_process(delta: float) -> void:
	node_scroll.global_position += Vector3( 0.0, 0.0, -scroll_speed*delta );

