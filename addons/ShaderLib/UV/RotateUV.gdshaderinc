vec2 rotate_uv(vec2 uv, vec2 center, float rotation, bool use_degrees){
	float _angle = rotation;
	if(use_degrees){
		_angle = rotation * (3.1415926/180.0);
	}
	vec2 _delta = uv - center;
	float _x = cos(_angle) * _delta.x - sin(_angle) * _delta.y;
	float _y = sin(_angle) * _delta.x + cos(_angle) * _delta.y;
	return vec2(_x + center.x, _y + center.y);
}