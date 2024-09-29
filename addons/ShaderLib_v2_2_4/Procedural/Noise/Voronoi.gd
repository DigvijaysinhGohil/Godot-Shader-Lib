@tool
class_name VisualShaderNodeProceduralVoronoi extends ShaderLib

func _get_name() -> String:
	return "Voronoi"

func _get_category() -> String:
	return "Procedural/Noise"

func _get_description() -> String:
	return "Generates a Voronoi or Worley noise based on input UV."

func _get_return_icon_type() -> VisualShaderNode.PortType:
	return PORT_TYPE_SCALAR

func _get_input_port_count() -> int:
	var distance_index: int = get_option_index(0)
	match distance_index:
		2:
			return 4
		_:
			return 3

func _get_input_port_name(port: int) -> String:
	var distance_index: int = get_option_index(0)
	match distance_index:
		2:
			match port:
				0:
					return "uv"
				1:
					return "cell density"
				2:
					return "angle offset"
				_:
					return "chebyshev power"
		_:
			match port:
				0:
					return "uv"
				1:
					return "cell density"
				_:
					return "angle offset"

func _get_input_port_type(port: int) -> VisualShaderNode.PortType:
	match port:
		0:
			return PORT_TYPE_VECTOR_2D
		_:
			return PORT_TYPE_SCALAR

func _get_input_port_default_value(port: int) -> Variant:
	var distance_index: int = get_option_index(0)
	match distance_index:
		2:
			match port:
				1:
					return 5.0
				2:
					return 2.0
				3:
					return 5.0
				_:
					return null
		_:
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
		_:
			return "cells"

func _get_output_port_type(port: int) -> VisualShaderNode.PortType:
	return PORT_TYPE_SCALAR

func _get_property_count() -> int:
	return 1

func _get_property_name(index: int) -> String:
	return "Distance"

func _get_property_default_index(index: int) -> int:
	return 0

func _get_property_options(index: int) -> PackedStringArray:
	return ["Euclidean", "Manhattan", "Chebyshev"]

func _get_global_code(mode: Shader.Mode) -> String:
	return "#include \"res://addons/ShaderLib_%s/Procedural/Procedural.gdshaderinc\"" % [version]

func _get_code(input_vars: Array[String], output_vars: Array[String], mode: Shader.Mode, type: VisualShader.Type) -> String:
	var uv: String = "UV"

	if input_vars[0]:
		uv = input_vars[0]

	var distance_index: int = get_option_index(0)

	var cell_density: String = input_vars[1]
	var angle_offset: String = input_vars[2]

	var output: String = output_vars[0]
	var cells: String = output_vars[1]

	match distance_index:
		1:
			return "%s = voronoi_noise_manhattan(%s, %s, %s, %s);" % [output, uv, cell_density, angle_offset, cells]
		2:
			var chebyshev_power: String = input_vars[3]
			return "%s = voronoi_noise_chebyshev(%s, %s, %s, %s, %s);" % [output, uv, cell_density, angle_offset, chebyshev_power, cells]
		_:
			return "%s = voronoi_noise_euclidean(%s, %s, %s, %s);" % [output, uv, cell_density, angle_offset, cells]
