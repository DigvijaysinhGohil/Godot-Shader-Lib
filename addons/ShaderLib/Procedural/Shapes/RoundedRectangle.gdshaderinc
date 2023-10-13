float rounded_rectangle_shape(vec2 uv, float width, float height, float radius){
	radius /= 10.0;
	radius = max(min(min(abs(radius * 2.0), abs(width)), abs(height)), 1e-5);
	uv = abs(uv * 2.0 - 1.0) - vec2(width, height) + radius;
	float _distance = length(max(vec2(0.0), uv)) / radius;
	return clamp((1.0 - _distance) / fwidth(_distance), 0.0, 1.0);
}