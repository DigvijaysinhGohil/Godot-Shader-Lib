@tool
class_name VisualShaderNodeProceduralVoronoi extends VisualShaderNodeCustom

func _init() -> void:
	output_port_for_preview = 0

func _get_name() -> String:
	return "Voronoi"

func _get_category() -> String:
	return "Procedural/Noise"

func _get_description() -> String:
	return "Generates a Voronoi or Worley noise based on input UV."

func _get_return_icon_type() -> VisualShaderNode.PortType:
	return PORT_TYPE_SCALAR

func _get_input_port_count() -> int:
	return 3

func _get_input_port_name(port: int) -> String:
	match port:
		0:
			return "uv"
		1:
			return "cell density"
		2:
			return "angle offset"
	return ""

func _get_input_port_type(port: int) -> VisualShaderNode.PortType:
	match port:
		0:
			return PORT_TYPE_VECTOR_2D
		1, 2:
			return PORT_TYPE_SCALAR
	return PORT_TYPE_SCALAR

func _get_input_port_default_value(port: int) -> Variant:
	match port:
		1:
			return 5.0
		2:
			return 2.0
		_:
			return null

func _get_output_port_count() -> int:
	return 2

func _get_output_port_name(port: int) -> String:
	match port:
		0:
			return "output"
		1:
			return "cells"
	return ""

func _get_output_port_type(port: int) -> VisualShaderNode.PortType:
	return PORT_TYPE_SCALAR

func _get_global_code(mode: Shader.Mode) -> String:
	var code: String = preload("Voronoi.gdshaderinc").code
	return code

func _get_code(input_vars: Array[String], output_vars: Array[String], mode: Shader.Mode, type: VisualShader.Type) -> String:
	var uv: String = "UV"

	if input_vars[0]:
		uv = input_vars[0]

	var cell_density: String = input_vars[1]
	var angle_offset: String = input_vars[2]
	var output: String = output_vars[0]
	var cells: String = output_vars[1]

	return "voronoi_noise(%s,%s, %s, %s, %s);" % [uv, cell_density, angle_offset, output, cells]
