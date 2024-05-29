vec2 rotate_uv(vec2 uv, vec2 center, float rotation, bool use_degrees){
	float _angle = rotation;
	if(use_degrees){
		_angle = rotation * (3.1415926/180.0);
	}
	mat2 _rotation = mat2(
		vec2(cos(_angle), -sin(_angle)),
		vec2(sin(_angle), cos(_angle))
	);
	vec2 _delta = uv - center;
	_delta = _rotation * _delta;
	return _delta + center;
}