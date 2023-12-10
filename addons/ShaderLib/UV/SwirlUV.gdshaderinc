vec2 swirl_uv(vec2 uv, vec2 center, float strength, vec2 offset){
	vec2 _delta = uv - center;
	float _inverse_length = 1.0 - length(_delta);
	float _angle = strength * _inverse_length;
	float _x = cos(_angle) * _delta.x - sin(_angle) * _delta.y;
	float _y = sin(_angle) * _delta.x + cos(_angle) * _delta.y;
	return vec2(_x + center.x + offset.x, _y + center.y + offset.y);
}