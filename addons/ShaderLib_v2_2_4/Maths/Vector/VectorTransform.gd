@tool
class_name VisualShaderNodeVectorTransform extends ShaderLib

func _get_name() -> String:
	return "VectorTransform"

func _get_category() -> String:
	return "Maths/Vector"

func _get_description() -> String:
	return "Returns the transformed vector of the input value from one coordinate space to another."

func _get_return_icon_type() -> PortType:
	return PORT_TYPE_VECTOR_3D

func _get_input_port_count() -> int:
	return 1

func _get_input_port_name(port: int) -> String:
	return "in"

func _get_input_port_type(port: int) -> PortType:
	return PORT_TYPE_VECTOR_3D

func _get_output_port_count() -> int:
	return 1

func _get_output_port_name(port: int) -> String:
	return "out"

func _get_output_port_type(port: int) -> PortType:
	return PORT_TYPE_VECTOR_3D

func _get_property_count() -> int:
	return 2

func _get_property_default_index(index: int) -> int:
	match index:
		0:
			return 0
		_:
			return 1

func _get_property_name(index: int) -> String:
	match index:
		0:
			return "From"
		_:
			return "To"

func _get_property_options(index: int) -> PackedStringArray:
	return ["Local", "World", "View", "Screen", "Tangent"]

func _is_available(mode: Shader.Mode, type: VisualShader.Type) -> bool:
	return mode == Shader.MODE_SPATIAL

func _get_global_code(mode: Shader.Mode) -> String:
	return "#include \"res://addons/ShaderLib_%s/Maths/Maths.gdshaderinc\"" % [version]

func _get_code(input_vars: Array[String], output_vars: Array[String], mode: Shader.Mode, type: VisualShader.Type) -> String:
	var code: String
	var from_coord_space_index: int = get_option_index(0)
	var to_coord_space_index: int = get_option_index(1)
	var input_vector: String = input_vars[0] if input_vars[0] else "vec3(0.0, 0.0, 0.0)"

	match from_coord_space_index:
		0:
			match to_coord_space_index:
				0:
					code = "%s = %s;" % [output_vars[0], input_vector]
				1:
					code = "%s = vector_transform_local_to_world(MODEL_MATRIX, %s);" % [output_vars[0], input_vector]
				2:
					code = "%s = vector_transform_local_to_view(MODEL_MATRIX, VIEW_MATRIX, %s);" % [output_vars[0], input_vector]
				3:
					code = "%s = vector_transform_local_to_screen(MODEL_MATRIX, VIEW_MATRIX, PROJECTION_MATRIX, %s);" % [output_vars[0], input_vector]
				4:
					code = "%s = vector_transform_local_to_tangent(NORMAL, BINORMAL, TANGENT, %s);" % [output_vars[0], input_vector]
		1:
			match to_coord_space_index:
				0:
					code = "%s = vector_transform_world_to_local(MODEL_MATRIX, %s);" % [output_vars[0], input_vector]
				1:
					code = "%s = %s;" % [output_vars[0], input_vector]
				2:
					code = "%s = vector_transform_world_to_view(VIEW_MATRIX, %s);" % [output_vars[0], input_vector]
				3:
					code = "%s = vector_transform_world_to_screen(VIEW_MATRIX, PROJECTION_MATRIX, %s);" % [output_vars[0], input_vector]
				4:
					code = "%s = vector_transform_world_to_tangent(MODEL_MATRIX, NORMAL, BINORMAL, TANGENT, %s);" % [output_vars[0], input_vector]
		2:
			match to_coord_space_index:
				0:
					code = "%s = vector_transform_view_to_local(INV_VIEW_MATRIX, MODEL_MATRIX, %s);" % [output_vars[0], input_vector]
				1:
					code = "%s = vector_transform_view_to_world(INV_VIEW_MATRIX, %s);" % [output_vars[0], input_vector]
				2:
					code = "%s = %s;" % [output_vars[0], input_vector]
				3:
					code = "%s = vector_transform_view_to_screen(PROJECTION_MATRIX, %s);" % [output_vars[0], input_vector]
				4:
					code = "%s = vector_transform_view_to_tangent(INV_VIEW_MATRIX, MODEL_MATRIX, NORMAL, BINORMAL, TANGENT, %s);" % [output_vars[0], input_vector]
		3:
			match to_coord_space_index:
				0:
					code = "%s = vector_transform_screen_to_local(INV_PROJECTION_MATRIX, INV_VIEW_MATRIX, MODEL_MATRIX, %s);" % [output_vars[0], input_vector]
				1:
					code = "%s = vector_transform_screen_to_world(INV_PROJECTION_MATRIX, INV_VIEW_MATRIX, %s);" % [output_vars[0], input_vector]
				2:
					code = "%s = vector_transform_screen_to_view(INV_PROJECTION_MATRIX, %s);" % [output_vars[0], input_vector]
				3:
					code = "%s = %s;" % [output_vars[0], input_vector]
				4:
					code = "%s = vector_transform_screen_to_tangent(INV_PROJECTION_MATRIX, INV_VIEW_MATRIX, MODEL_MATRIX, NORMAL, BINORMAL, TANGENT, %s);" % [output_vars[0], input_vector]
		4:
			match to_coord_space_index:
				0:
					code = "%s = vector_transform_tangent_to_local(NORMAL, BINORMAL, TANGENT, %s);" % [output_vars[0], input_vector]
				1:
					code = "%s = vector_transform_tangent_to_world(MODEL_MATRIX, NORMAL, BINORMAL, TANGENT, %s);" % [output_vars[0], input_vector]
				2:
					code = "%s = vector_transform_tangent_to_view(MODEL_MATRIX, VIEW_MATRIX, NORMAL, BINORMAL, TANGENT, %s);" % [output_vars[0], input_vector]
				3:
					code = "%s = vector_transform_tangent_to_screen(MODEL_MATRIX, VIEW_MATRIX, PROJECTION_MATRIX, NORMAL, BINORMAL, TANGENT, %s);" % [output_vars[0], input_vector]
				4:
					code = "%s = %s;" % [output_vars[0], input_vector]

	return code
