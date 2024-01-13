vec3 vector_transform_world_to_local(mat4 model_matrix, vec3 vector){
	return (transpose(model_matrix) * vec4(vector, 0.0)).xyz;
}

vec3 vector_transform_world_to_view(mat4 view_matrix, vec3 vector){
	return (view_matrix * vec4(vector, 0.0)).xyz;
}

vec3 vector_transform_world_to_screen(mat4 view_matrix, mat4 projection_matrix, vec3 vector){
	vec3 vector_view = vector_transform_world_to_view(view_matrix, vector);
	return (projection_matrix * vec4(vector_view, 0.0)).xyz;
}

vec3 vector_transform_world_to_tangent(mat4 model_matrix, vec3 normal, vec3 binormal, vec3 tangent, vec3 vector){
	mat3 local_to_tangent_matrix = mat3(tangent, binormal, normal);
	vec3 vector_local = vector_transform_world_to_local(model_matrix, vector);
	return local_to_tangent_matrix * vector_local;
}

vec3 vector_transform_local_to_world(mat4 model_matrix, vec3 vector){
	return (model_matrix * vec4(vector, 0.0)).xyz;
}

vec3 vector_transform_local_to_view(mat4 model_matrix, mat4 view_matrix, vec3 vector){
	vec3 vector_world = vector_transform_local_to_world(model_matrix, vector);
	return (view_matrix * vec4(vector_world, 0.0)).xyz;
}

vec3 vector_transform_local_to_screen(mat4 model_matrix, mat4 view_matrix, mat4 projection_matrix, vec3 vector){
	vec3 vector_view = vector_transform_local_to_view(model_matrix, view_matrix, vector);
	return (projection_matrix * vec4(vector_view, 0.0)).xyz;
}

vec3 vector_transform_local_to_tangent(vec3 normal, vec3 binormal, vec3 tangent, vec3 vector){
	mat3 local_to_tangent_matrix = mat3(tangent, binormal, normal);
	return local_to_tangent_matrix * vector;
}

vec3 vector_transform_view_to_world(mat4 inv_view_matrix, vec3 vector){
	return (inv_view_matrix * vec4(vector, 0.0)).xyz;;
}

vec3 vector_transform_view_to_local(mat4 inv_view_matrix, mat4 model_matrix, vec3 vector){
	vec3 vector_world = vector_transform_view_to_world(inv_view_matrix, vector);
	return vector_transform_world_to_local(model_matrix, vector_world);
}

vec3 vector_transform_view_to_screen(mat4 projection_matrix, vec3 vector){
	return (projection_matrix * vec4(vector, 0.0)).xyz;
}

vec3 vector_transform_view_to_tangent(mat4 inv_view_matrix, mat4 model_matrix, vec3 normal, vec3 binormal, vec3 tangent, vec3 vector){
	mat3 local_to_tangent_matrix = mat3(tangent, binormal, normal);
	vec3 vector_local = vector_transform_view_to_local(inv_view_matrix, model_matrix, vector);
	return vector_transform_local_to_tangent(normal, binormal, tangent, vector_local);
}

vec3 vector_transform_screen_to_view(mat4 inv_projection_matrix, vec3 vector){
	return (inv_projection_matrix * vec4(vector, 0.0)).xyz;;
}

vec3 vector_transform_screen_to_local(mat4 inv_projection_matrix, mat4 inv_view_matrix, mat4 model_matrix, vec3 vector){
	vec3 vector_view = vector_transform_screen_to_view(inv_projection_matrix, vector);
	return vector_transform_view_to_local(inv_view_matrix, model_matrix, vector_view);
}

vec3 vector_transform_screen_to_world(mat4 inv_projection_matrix, mat4 inv_view_matrix, vec3 vector){
	vec3 vector_view = vector_transform_screen_to_view(inv_projection_matrix, vector);
	return vector_transform_view_to_world(inv_view_matrix, vector_view);
}

vec3 vector_transform_screen_to_tangent(mat4 inv_projection_matrix, mat4 inv_view_matrix, mat4 model_matrix, vec3 normal, vec3 binormal, vec3 tangent, vec3 vector){
	mat3 local_to_tangent_matrix = mat3(tangent, binormal, normal);
	vec3 vector_local = vector_transform_screen_to_local(inv_projection_matrix, inv_view_matrix, model_matrix, vector);
	return local_to_tangent_matrix * vector_local;
}

vec3 vector_transform_tangent_to_local(vec3 normal, vec3 binormal, vec3 tangent, vec3 vector){
	mat3 tangent_to_local_matrix = transpose(mat3(tangent, binormal, normal));
	return tangent_to_local_matrix * vector;
}

vec3 vector_transform_tangent_to_world(mat4 model_matrix, vec3 normal, vec3 binormal, vec3 tangent, vec3 vector){
	mat3 tangent_to_local_matrix = transpose(mat3(tangent, binormal, normal));
	vec3 vector_local = tangent_to_local_matrix * vector;
	return vector_transform_local_to_world(model_matrix, vector_local);
}

vec3 vector_transform_tangent_to_view(mat4 model_matrix, mat4 view_matrix, vec3 normal, vec3 binormal, vec3 tangent, vec3 vector){
	mat3 tangent_to_local_matrix = transpose(mat3(tangent, binormal, normal));
	vec3 vector_local = tangent_to_local_matrix * vector;
	return vector_transform_local_to_view(model_matrix, view_matrix, vector_local);
}

vec3 vector_transform_tangent_to_screen(mat4 model_matrix, mat4 view_matrix, mat4 projection_matrix, vec3 normal, vec3 binormal, vec3 tangent, vec3 vector){
	mat3 tangent_to_local_matrix = transpose(mat3(tangent, binormal, normal));
	vec3 vector_local = tangent_to_local_matrix * vector;
	return vector_transform_local_to_screen(model_matrix, view_matrix, projection_matrix, vector_local);
}
