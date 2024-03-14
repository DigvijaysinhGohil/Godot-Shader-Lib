@tool
class_name VisualShaderNodeVectorProjectOnPlane extends VisualShaderNodeCustom

func _get_name() -> String:
	return "ProjectOnPlane"

func _get_category() -> String:
	return "Maths/Vector"

func _get_description() -> String:
	return "Projects a vector onto a plane defined by a normal orthogonal to the plane."

func _get_return_icon_type() -> PortType:
	var vector_index: int = get_option_index(0)
	match vector_index:
		0:
			return PORT_TYPE_VECTOR_2D
		_:
			return PORT_TYPE_VECTOR_3D

func _get_input_port_count() -> int:
	return 2

func _get_input_port_name(port: int) -> String:
	match port:
		0:
			return "vector"
		_:
			return "plane normal"

func _get_input_port_type(port: int) -> PortType:
	var vector_index: int = get_option_index(0)
	match vector_index:
		0:
			return PORT_TYPE_VECTOR_2D
		_:
			return PORT_TYPE_VECTOR_3D

func _get_output_port_count() -> int:
	return 1

func _get_output_port_name(port: int) -> String:
	return "vector"

func _get_output_port_type(port: int) -> PortType:
	var vector_index: int = get_option_index(0)
	match vector_index:
		0:
			return PORT_TYPE_VECTOR_2D
		_:
			return PORT_TYPE_VECTOR_3D

func _get_property_count() -> int:
	return 1

func _get_property_default_index(index: int) -> int:
	return 0

func _get_property_name(index: int) -> String:
	return ""

func _get_property_options(index: int) -> PackedStringArray:
	return ["Vector2", "Vector3"]

func _get_code(input_vars: Array[String], output_vars: Array[String], mode: Shader.Mode, type: VisualShader.Type) -> String:
	var vector_a: String = input_vars[0]
	var plane_normal: String = input_vars[1]
	var vector_index: int = get_option_index(0)
	match vector_index:
		0:
			return output_vars[0] + " = %s.xy - (%s.xy * (dot(%s.xy, %s.xy) / dot(%s.xy, %s.xy)));" % [vector_a, plane_normal, vector_a, plane_normal, plane_normal, plane_normal]
		_:
			return output_vars[0] + " = %s - (%s * (dot(%s, %s) / dot(%s, %s)));" % [vector_a, plane_normal, vector_a, plane_normal, plane_normal, plane_normal]
