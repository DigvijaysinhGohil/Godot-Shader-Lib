vec3 node_scale_world(mat4 model_matrix) {
	vec3 axis_x = model_matrix[0].xyz;
	vec3 axis_y = model_matrix[1].xyz;
	vec3 axis_z = model_matrix[2].xyz;

	float scale_x = length(axis_x);
	float scale_y = length(axis_y);
	float scale_z = length(axis_z);

	return vec3(scale_x, scale_y, scale_z);
}