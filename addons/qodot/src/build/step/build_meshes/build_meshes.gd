class_name QodotBuildMeshes
extends QodotBuildStep

# Determine whether the given brush should create a set of visual face meshes
func should_spawn_brush_mesh(entity_definitions: Dictionary, entity_properties: Dictionary, brush: QuakeBrush) -> bool:
	if(brush.is_clip_brush()):
		return false

	if('classname' in entity_properties):
		var classname = entity_properties['classname']
		if classname in entity_definitions.keys():
			return entity_definitions[classname].is_worldspawn

	# Default to true for entities with empty classnames
	return true

# Determine whether the given face should spawn a visual mesh
func should_spawn_face_mesh(entity_properties: Dictionary, brush: QuakeBrush, face: QuakeFace) -> bool:
	# Don't spawn a mesh if the face is textured with SKIP
	if(face.texture.findn('skip') > -1):
		return false

	return true

func should_smooth_face_normals(entity_properties: Dictionary) -> bool:
	if '_phong' in entity_properties:
		if entity_properties['_phong'] == '1':
			return true

	return false
