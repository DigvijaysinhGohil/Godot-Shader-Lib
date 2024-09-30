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
	return 3

func _get_property_default_index(index: int) -> int:
	match index:
		0, 1:
			return 0
		_:
			return 1

func _get_property_name(index: int) -> String:
	match index:
		0:
			return "Vector Type"
		1:
			return "From"
		_:
			return "To"

func _get_property_options(index: int) -> PackedStringArray:
	match index:
		0:
			return ["Positional", "Directional"]
		_:
			return ["Local", "World", "View", "Clip", "Tangent"]

func _is_available(mode: Shader.Mode, type: VisualShader.Type) -> bool:
	return mode == Shader.MODE_SPATIAL

func _get_code(input_vars: Array[String], output_vars: Array[String], mode: Shader.Mode, type: VisualShader.Type) -> String:
	var code: String
	var vector_type: int = get_option_index(0)
	var from_coord_space_index: int = get_option_index(1)
	var to_coord_space_index: int = get_option_index(2)
	var input_vector: String = input_vars[0] if input_vars[0] else "vec3(0.0, 0.0, 0.0)"
	var w_component: String = "1.0" if vector_type == 0 else "0.0"

	match from_coord_space_index:
		0:
			match to_coord_space_index:
				0:
					code = "%s = %s;" % [output_vars[0], input_vector]
				1:
					code = "%s = (MODEL_MATRIX * vec4(%s, %s)).xyz;" % [output_vars[0], input_vector, w_component]
				2:
					code = "%s = (VIEW_MATRIX * MODEL_MATRIX * vec4(%s, %s)).xyz;" % [output_vars[0], input_vector, w_component]
				3:
					code = "%s = (PROJECTION_MATRIX * VIEW_MATRIX * MODEL_MATRIX * vec4(%s, %s)).xyz;" % [output_vars[0], input_vector, w_component]
				4:
					code = """
vec3 normal = (inverse(MODEL_MATRIX) * INV_VIEW_MATRIX * vec4(NORMAL, 0.0)).xyz;
mat4 local_to_tangent_mat = mat4(vec4(TANGENT, 1.0), vec4(BINORMAL, 1.0), vec4(normal, 1.0), vec4(0.0, 0.0, 0.0, 1.0));
"""
					code += "%s = (local_to_tangent_mat * vec4(%s, %s)).xyz;" % [output_vars[0], input_vector, w_component]
		1:
			match to_coord_space_index:
				0:
					code = "%s = (inverse(MODEL_MATRIX) * vec4(%s, %s)).xyz;" % [output_vars[0], input_vector, w_component]
				1:
					code = "%s = %s;" % [output_vars[0], input_vector]
				2:
					code = "%s = (VIEW_MATRIX * vec4(%s, %s)).xyz;" % [output_vars[0], input_vector, w_component]
				3:
					code = "%s =(PROJECTION_MATRIX * VIEW_MATRIX * vec4(%s, %s)).xyz;" % [output_vars[0], input_vector, w_component]
				4:
					code = """
vec3 normal = (inverse(MODEL_MATRIX) * INV_VIEW_MATRIX * vec4(NORMAL, 0.0)).xyz;
mat4 local_to_tangent_mat = mat4(vec4(TANGENT, 1.0), vec4(BINORMAL, 1.0), vec4(normal, 1.0), vec4(0.0, 0.0, 0.0, 1.0));
"""
					code += "%s = (local_to_tangent_mat * inverse(MODEL_MATRIX) * vec4(%s, %s)).xyz;" % [output_vars[0], input_vector, w_component]
		2:
			match to_coord_space_index:
				0:
					code = "%s = (inverse(MODEL_MATRIX) * INV_VIEW_MATRIX * vec4(%s, %s)).xyz;" % [output_vars[0], input_vector, w_component]
				1:
					code = "%s = (INV_VIEW_MATRIX * vec4(%s, %s)).xyz;" % [output_vars[0], input_vector, w_component]
				2:
					code = "%s = %s;" % [output_vars[0], input_vector]
				3:
					code = "%s = (PROJECTION_MATRIX * vec4(%s, %s)).xyz;" % [output_vars[0], input_vector, w_component]
				4:
					code = """
vec3 normal = (inverse(MODEL_MATRIX) * INV_VIEW_MATRIX * vec4(NORMAL, 0.0)).xyz;
mat4 local_to_tangent_mat = mat4(vec4(TANGENT, 1.0), vec4(BINORMAL, 1.0), vec4(normal, 1.0), vec4(0.0, 0.0, 0.0, 1.0));
"""
					code += "%s = (local_to_tangent_mat * inverse(MODEL_MATRIX) * INV_VIEW_MATRIX * vec4(%s, %s)).xyz;" % [output_vars[0], input_vector, w_component]
		3:
			match to_coord_space_index:
				0:
					code = "%s = (inverse(MODEL_MATRIX) * INV_VIEW_MATRIX * INV_PROJECTION_MATRIX * vec4(%s, %s)).xyz;" % [output_vars[0], input_vector, w_component]
				1:
					code = "%s = (INV_VIEW_MATRIX * INV_PROJECTION_MATRIX * vec4(%s, %s)).xyz;" % [output_vars[0], input_vector, w_component]
				2:
					code = "%s = (INV_PROJECTION_MATRIX * vec4(%s, %s)).xyz;" % [output_vars[0], input_vector, w_component]
				3:
					code = "%s = %s;" % [output_vars[0], input_vector]
				4:
					code = """
vec3 normal = (inverse(MODEL_MATRIX) * INV_VIEW_MATRIX * vec4(NORMAL, 0.0)).xyz;
mat4 local_to_tangent_mat = mat4(vec4(TANGENT, 1.0), vec4(BINORMAL, 1.0), vec4(normal, 1.0), vec4(0.0, 0.0, 0.0, 1.0));
"""
					code += "%s = (local_to_tangent_mat * inverse(MODEL_MATRIX) * INV_VIEW_MATRIX * INV_PROJECTION_MATRIX * vec4(%s, %s)).xyz;" % [output_vars[0], input_vector, w_component]
		4:
			code = """
vec3 normal = (inverse(MODEL_MATRIX) * INV_VIEW_MATRIX * vec4(NORMAL, 0.0)).xyz;
mat4 tangent_to_local_mat = inverse(mat4(vec4(TANGENT, 1.0), vec4(BINORMAL, 1.0), vec4(normal, 1.0), vec4(0.0, 0.0, 0.0, 1.0)));
"""
			match to_coord_space_index:
				0:
					code += "%s = (tangent_to_local_mat * vec4(%s, %s)).xyz;" % [output_vars[0], input_vector, w_component]
				1:
					code += "%s = (MODEL_MATRIX * tangent_to_local_mat * vec4(%s, %s)).xyz;" % [output_vars[0], input_vector, w_component]
				2:
					code += "%s = (VIEW_MATRIX * MODEL_MATRIX * tangent_to_local_mat * vec4(%s, %s)).xyz;" % [output_vars[0], input_vector, w_component]
				3:
					code += "%s = (PROJECTION_MATRIX * VIEW_MATRIX * MODEL_MATRIX * tangent_to_local_mat * vec4(%s, %s)).xyz;" % [output_vars[0], input_vector, w_component]
				4:
					code = "%s = %s;" % [output_vars[0], input_vector]

	return code
