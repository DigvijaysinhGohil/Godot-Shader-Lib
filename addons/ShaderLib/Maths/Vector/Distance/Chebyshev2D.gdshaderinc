float chebyshev_distance_2d(vec2 point1, vec2 point2, float power) {
	vec2 p = abs(point1 - point2);
	return pow(pow(p.x, power) + pow(p.y, power), 1. / power);
}