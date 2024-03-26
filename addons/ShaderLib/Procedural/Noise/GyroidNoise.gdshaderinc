float gyroid_noise(vec2 uv, float scale, vec2 ratio, float height, float thickness) {
	scale *= 10.;
	thickness = clamp(thickness, 0., 1.);
	vec3 vector = vec3(uv, height);
	vector *= scale;
	return abs(dot(sin(vector * ratio.x), cos(vector.zxy * ratio.y))) - thickness;
}