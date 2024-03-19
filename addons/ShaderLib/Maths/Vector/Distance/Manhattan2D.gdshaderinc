float manhattan_distance_2d(vec2 point1, vec2 point2) {
	vec2 d = point1 - point2;
	return abs(d.x) + abs(d.y);
}