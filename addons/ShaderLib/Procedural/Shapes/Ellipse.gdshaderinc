float ellipse_shape(vec2 uv, float width, float height){
	float _distance = length((uv * 2.0 - 1.0) / vec2(width, height));
	return clamp((1.0 - _distance) / fwidth(_distance), 0.0, 1.0);
}