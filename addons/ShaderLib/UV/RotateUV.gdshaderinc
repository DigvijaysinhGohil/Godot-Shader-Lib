vec2 rotate_uv(vec2 uv, vec2 center, float rotation, bool use_degrees){
	if(use_degrees){
		rotation = rotation * (3.1415926/180.0);
	}
	vec2 _uv = uv;
	_uv -= center;
	float _s = sin(rotation);
	float _c = cos(rotation);
	mat2 _rotation_matrix = mat2(vec2(_c, -_s), vec2(_s, _c));
	_rotation_matrix *= 0.5;
	_rotation_matrix += 0.5;
	_rotation_matrix = _rotation_matrix * 2.0 - 1.0;
	_uv.xy = _uv.xy * _rotation_matrix;
	_uv += center;
	return _uv;
}