extends Node

var node_world = null;
var node_player = null;

var layer_player = 0b0000000000000010;
var layer_enemies = 0b0000000000000100;

var pre = {
	"player_proj": preload( "res://objects/proj/player_proj.tscn" ),
	"proj_circle": preload( "res://objects/proj/proj_circle.tscn" ),
};

func raycast( from, to, exclude = [], mask = 0xFFFFFFFF ):
	var space_state = node_world.get_world_3d().direct_space_state;
	var query = PhysicsRayQueryParameters3D.create( from, to );
	query.exclude = exclude;
	query.collision_mask = mask;
	query.collide_with_areas = true;
	query.collide_with_bodies = false;
	query.hit_from_inside = true;
	return space_state.intersect_ray( query );

func spawn( id, pos, rot ):
	if( pre.has( id ) ):
		var c = pre[ id ].instantiate();
		node_world.add_child( c );
		c.global_position = pos;
		c.rotation.y = rot;
		
		return c;
	return null;
