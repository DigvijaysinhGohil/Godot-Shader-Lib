@tool
class_name VisualShaderNodeVectorProjectOnPlane extends ShaderLib

func _get_name() -> String:
	return "ProjectOnPlane"

func _get_category() -> String:
	return "Maths/Vector"

func _get_description() -> String:
	return "Projects a vector onto a plane defined by a normal orthogonal to the plane."

func _get_return_icon_type() -> PortType:
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
	return PORT_TYPE_VECTOR_3D

func _get_output_port_count() -> int:
	return 1

func _get_output_port_name(port: int) -> String:
	return "vector"

func _get_output_port_type(port: int) -> PortType:
	return PORT_TYPE_VECTOR_3D

func _get_global_code(mode: Shader.Mode) -> String:
	return "#include \"res://addons/ShaderLib_%s/Maths/Maths.gdshaderinc\"" % [version]

func _get_code(input_vars: Array[String], output_vars: Array[String], mode: Shader.Mode, type: VisualShader.Type) -> String:
	var vector_a: String = input_vars[0]
	var plane_normal: String = input_vars[1]
	return output_vars[0] + " = project_on_plane(%s, %s);" % [vector_a, plane_normal]
