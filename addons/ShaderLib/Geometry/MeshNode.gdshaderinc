vec3 geometry_node_scale_world(mat4 model_matrix){
	vec3 _axis_x = model_matrix[0].xyz;
	vec3 _axis_y = model_matrix[1].xyz;
	vec3 _axis_z = model_matrix[2].xyz;

	float _scale_x = length(_axis_x);
	float _scale_y = length(_axis_y);
	float _scale_z = length(_axis_z);

	return vec3(_scale_x, _scale_y, _scale_z);
}