@tool
class_name VisualShaderNodeVectorTransform extends VisualShaderNodeCustom

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
	return "input"

func _get_input_port_type(port: int) -> PortType:
	return PORT_TYPE_VECTOR_3D

func _get_input_port_default_value(port: int) -> Variant:
	match port:
		0:
			return Vector3(0.0, 0.0, 0.0)
		_:
			return null

func _get_output_port_count() -> int:
	return 1

func _get_output_port_name(port: int) -> String:
	return "output"

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

func _get_global_code(mode: Shader.Mode) -> String:
	var code: String = preload("VectorTransform.gdshaderinc").code
	return code

func _get_code(input_vars: Array[String], output_vars: Array[String], mode: Shader.Mode, type: VisualShader.Type) -> String:
	var code: String
	var from_coord_space_index: int = get_option_index(0)
	var to_coord_space_index: int = get_option_index(1)

	#match from_coord_space_index:
		#0:
		#1:
		#2:
		#3:
		#4:

	code = "%s = some_function(%s)" % [input_vars[0], output_vars[0]]
	return output_vars[0] + " = 0.0;"
