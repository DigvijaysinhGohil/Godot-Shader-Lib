vec2 project_2d(vec2 a, vec2 b) {
	return b * (dot(a, b) / dot(b, b));
}

vec3 project_3d(vec3 a, vec3 b) {
	return b * (dot(a, b) / dot(b, b));
}