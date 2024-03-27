float chebyshev_distance_3d(vec3 point1, vec3 point2, float power) {
	vec3 p = abs(point1 - point2);
	return pow(pow(p.x, power) + pow(p.y, power) + pow(p.z, power), 1. / power);
}