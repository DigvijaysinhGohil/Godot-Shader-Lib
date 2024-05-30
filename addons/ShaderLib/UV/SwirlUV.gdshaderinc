vec2 swirl_uv(vec2 uv, vec2 center, float strength, vec2 offset){
	vec2 _delta = uv - center;
	float _angle = strength * max(pow(1. - length(_delta), 3), 0);
	mat2 _rotation = mat2(
		vec2(cos(_angle), -sin(_angle)),
		vec2(sin(_angle), cos(_angle))
	);
	_delta = _rotation * _delta;
	return _delta + center;
}