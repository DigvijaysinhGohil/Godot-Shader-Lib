@tool
class_name VisualShaderNodeGeometryMeshNode extends VisualShaderNodeCustom

func _get_name() -> String:
	return "MeshNode"

func _get_category() -> String:
	return "Geometry"

func _get_description() -> String:
	return "Provides accees to node scale in world space."

func _get_input_port_count() -> int:
	return 0

func _get_input_port_name(port: int) -> String:
	return ""

func _get_return_icon_type() -> VisualShaderNode.PortType:
	return PORT_TYPE_VECTOR_3D

func _get_output_port_count() -> int:
	return 2

func _get_output_port_name(port: int) -> String:
	match port:
		0:
			return "position"
		_:
			return "scale"

func _get_output_port_type(port: int) -> VisualShaderNode.PortType:
	return PORT_TYPE_VECTOR_3D

func _is_available(mode: Shader.Mode, type: VisualShader.Type) -> bool:
	match mode:
		0:
			return true
		1:
			return type==0
		_:
			return false

func _get_global_code(mode: Shader.Mode) -> String:
	var code: String = preload("MeshNode.gdshaderinc").code
	return code

func _get_code(input_vars: Array[String], output_vars: Array[String], mode: Shader.Mode, type: VisualShader.Type) -> String:
	var code: String
	code = "%s = NODE_POSITION_WORLD;" % output_vars[0]
	code += "\n%s = geometry_node_scale_world(MODEL_MATRIX);" % output_vars[1]
	return code
