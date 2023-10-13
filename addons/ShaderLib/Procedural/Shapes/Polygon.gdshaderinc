float polygon_shape(vec2 uv, int sides, float width, float height){
	float _a_width = width * cos(PI / float(sides));
	float _a_height = height * cos(PI / float(sides));
	uv = (uv * 2.0 - 1.0) / vec2(_a_width, _a_height);
	uv.y *= -1.0;
	float _polar_coords = atan(uv.x, uv.y);
	float _radius = 2.0 * PI / float(sides);
	float _distance = cos(floor(0.5 + _polar_coords / _radius) * _radius - _polar_coords) * length(uv);
	return clamp((1.0 - _distance) / fwidth(_distance), 0.0, 1.0);
}