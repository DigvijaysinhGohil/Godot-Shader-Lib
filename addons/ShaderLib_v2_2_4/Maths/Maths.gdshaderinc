float chebyshev_distance_2d(vec2 point1, vec2 point2, float power) {
	vec2 p = abs(point1 - point2);
	return pow(pow(p.x, power) + pow(p.y, power), 1. / power);
}

float chebyshev_distance_3d(vec3 point1, vec3 point2, float power) {
	vec3 p = abs(point1 - point2);
	return pow(pow(p.x, power) + pow(p.y, power) + pow(p.z, power), 1. / power);
}

float manhattan_distance_2d(vec2 point1, vec2 point2) {
	vec2 d = point1 - point2;
	return abs(d.x) + abs(d.y);
}

float manhattan_distance_3d(vec3 point1, vec3 point2) {
	vec3 d = point1 - point2;
	return abs(d.x) + abs(d.y) + abs(d.z);
}

vec2 project_2d(vec2 a, vec2 b) {
	return b * (dot(a, b) / dot(b, b));
}

vec3 project_3d(vec3 a, vec3 b) {
	return b * (dot(a, b) / dot(b, b));
}

vec3 project_on_plane(vec3 vector, vec3 plane_normal) {
	return vector - (plane_normal * (dot(vector, plane_normal) / dot(plane_normal, plane_normal)));
}

float smoothmin(float a, float b, float t) {
	float h = clamp(.5 + .5 * (b - a) / t, 0, 1);
	return mix(b, a, h) - t * h * (1. - h);
}

float smoothmax(float a, float b, float t) {
	float h = clamp(.5 + .5 * (b - a) / -t, 0, 1);
	return mix(b, a, h) + t * h * (1. - h);
}

vec3 vector_transform_world_to_local(mat4 model_matrix, vec3 vector) {
	return (inverse(model_matrix) * vec4(vector, 1.0)).xyz;
}

vec3 vector_transform_world_to_view(mat4 view_matrix, vec3 vector) {
	return (view_matrix * vec4(vector, 1.0)).xyz;
}

vec3 vector_transform_world_to_screen(mat4 view_matrix, mat4 projection_matrix, vec3 vector) {
	vec3 vector_view = vector_transform_world_to_view(view_matrix, vector);
	return (projection_matrix * vec4(vector_view, 1.0)).xyz;
}

vec3 vector_transform_world_to_tangent(mat4 model_matrix, vec3 normal, vec3 binormal, vec3 tangent, vec3 vector) {
	mat3 local_to_tangent_matrix = mat3(tangent, binormal, normal);
	vec3 vector_local = vector_transform_world_to_local(model_matrix, vector);
	return local_to_tangent_matrix * vector_local;
}

vec3 vector_transform_local_to_world(mat4 model_matrix, vec3 vector) {
	return (model_matrix * vec4(vector, 1.0)).xyz;
}

vec3 vector_transform_local_to_view(mat4 model_matrix, mat4 view_matrix, vec3 vector) {
	vec3 vector_world = vector_transform_local_to_world(model_matrix, vector);
	return (view_matrix * vec4(vector_world, 1.0)).xyz;
}

vec3 vector_transform_local_to_screen(mat4 model_matrix, mat4 view_matrix, mat4 projection_matrix, vec3 vector) {
	vec3 vector_view = vector_transform_local_to_view(model_matrix, view_matrix, vector);
	return (projection_matrix * vec4(vector_view, 1.0)).xyz;
}

vec3 vector_transform_local_to_tangent(vec3 normal, vec3 binormal, vec3 tangent, vec3 vector) {
	mat3 local_to_tangent_matrix = mat3(tangent, binormal, normal);
	return local_to_tangent_matrix * vector;
}

vec3 vector_transform_view_to_world(mat4 inv_view_matrix, vec3 vector) {
	return (inv_view_matrix * vec4(vector, 1.0)).xyz;;
}

vec3 vector_transform_view_to_local(mat4 inv_view_matrix, mat4 model_matrix, vec3 vector) {
	vec3 vector_world = vector_transform_view_to_world(inv_view_matrix, vector);
	return vector_transform_world_to_local(model_matrix, vector_world);
}

vec3 vector_transform_view_to_screen(mat4 projection_matrix, vec3 vector) {
	return (projection_matrix * vec4(vector, 1.0)).xyz;
}

vec3 vector_transform_view_to_tangent(mat4 inv_view_matrix, mat4 model_matrix, vec3 normal, vec3 binormal, vec3 tangent, vec3 vector) {
	mat3 local_to_tangent_matrix = mat3(tangent, binormal, normal);
	vec3 vector_local = vector_transform_view_to_local(inv_view_matrix, model_matrix, vector);
	return vector_transform_local_to_tangent(normal, binormal, tangent, vector_local);
}

vec3 vector_transform_screen_to_view(mat4 inv_projection_matrix, vec3 vector) {
	return (inv_projection_matrix * vec4(vector, 1.0)).xyz;;
}

vec3 vector_transform_screen_to_local(mat4 inv_projection_matrix, mat4 inv_view_matrix, mat4 model_matrix, vec3 vector) {
	vec3 vector_view = vector_transform_screen_to_view(inv_projection_matrix, vector);
	return vector_transform_view_to_local(inv_view_matrix, model_matrix, vector_view);
}

vec3 vector_transform_screen_to_world(mat4 inv_projection_matrix, mat4 inv_view_matrix, vec3 vector) {
	vec3 vector_view = vector_transform_screen_to_view(inv_projection_matrix, vector);
	return vector_transform_view_to_world(inv_view_matrix, vector_view);
}

vec3 vector_transform_screen_to_tangent(mat4 inv_projection_matrix, mat4 inv_view_matrix, mat4 model_matrix, vec3 normal, vec3 binormal, vec3 tangent, vec3 vector) {
	mat3 local_to_tangent_matrix = mat3(tangent, binormal, normal);
	vec3 vector_local = vector_transform_screen_to_local(inv_projection_matrix, inv_view_matrix, model_matrix, vector);
	return local_to_tangent_matrix * vector_local;
}

vec3 vector_transform_tangent_to_local(vec3 normal, vec3 binormal, vec3 tangent, vec3 vector) {
	mat3 tangent_to_local_matrix = inverse(mat3(tangent, binormal, normal));
	return tangent_to_local_matrix * vector;
}

vec3 vector_transform_tangent_to_world(mat4 model_matrix, vec3 normal, vec3 binormal, vec3 tangent, vec3 vector) {
	mat3 tangent_to_local_matrix = inverse(mat3(tangent, binormal, normal));
	vec3 vector_local = tangent_to_local_matrix * vector;
	return vector_transform_local_to_world(model_matrix, vector_local);
}

vec3 vector_transform_tangent_to_view(mat4 model_matrix, mat4 view_matrix, vec3 normal, vec3 binormal, vec3 tangent, vec3 vector) {
	mat3 tangent_to_local_matrix = inverse(mat3(tangent, binormal, normal));
	vec3 vector_local = tangent_to_local_matrix * vector;
	return vector_transform_local_to_view(model_matrix, view_matrix, vector_local);
}

vec3 vector_transform_tangent_to_screen(mat4 model_matrix, mat4 view_matrix, mat4 projection_matrix, vec3 normal, vec3 binormal, vec3 tangent, vec3 vector) {
	mat3 tangent_to_local_matrix = inverse(mat3(tangent, binormal, normal));
	vec3 vector_local = tangent_to_local_matrix * vector;
	return vector_transform_local_to_screen(model_matrix, view_matrix, projection_matrix, vector_local);
}

vec4 noise_sine_wave(vec4 input, vec2 min_max) {
    vec4 sin_in = sin(input);
    vec4 sin_in_offset = sin(input + 1.0);
    vec4 random_number =  fract(sin((sin_in - sin_in_offset) * (12.9898 + 78.233)) * 43758.5453);
    float noise = mix(min_max.x, min_max.y, random_number.x);
    return sin_in + vec4(noise);
}

vec4 sawtooth_wave(vec4 input) {
	return 2. * (input - floor(.5 + input));
}

vec4 square_wave(vec4 input) {
	return 1. - 2. * round(fract(input));
}

vec4 triangle_wave(vec4 input) {
	return 2. * abs(2. * (input - floor(.5 + input))) - 1.;
}