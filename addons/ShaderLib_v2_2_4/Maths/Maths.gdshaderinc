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