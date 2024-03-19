float manhattan_distance_3d(vec3 point1, vec3 point2) {
	vec3 d = point1 - point2;
	return abs(d.x) + abs(d.y) + abs(d.z);
}