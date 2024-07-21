vec2 flipbook_uv(vec2 uv, int rows, int columns, float anim_speed){
	int start_frame = 1;
	int end_frame = rows * columns;
	start_frame += int(fract(TIME * anim_speed) * float(end_frame));
	float _frame = float(clamp(start_frame, 0, end_frame));
	vec2 _off_per_frame = vec2((1.0 / float(columns)), (1.0 / float(rows)));
	vec2 _sprite_size = vec2(uv.x / float(columns), uv.y / float(rows));
	vec2 _current_sprite = vec2(0.0, 1.0 - _off_per_frame.y);
	_current_sprite.x += _frame * _off_per_frame.x;
	float _row_index;
	float _mod = modf(_frame / float(columns), _row_index);
	_current_sprite.y -= 1.0 - (_row_index * _off_per_frame.y);
	_current_sprite.x -= _row_index * float(columns) * _off_per_frame.x;
	vec2 _sprite_uv = (_sprite_size + _current_sprite);
	return _sprite_uv;
}

vec2 parallax_mapping_uv_offset_1_step(float height, float amplitude, vec3 view_dir_tangent)
{
    height = height * amplitude - amplitude / 2.0;
    vec3 _vector = view_dir_tangent;
    _vector.y += 0.42;
    return height * (_vector.xz / _vector.y);
}

vec2 parallax_mapping_uv(sampler2D height, float amplitude, vec2 uv, vec3 tangent, vec3 normal, vec3 binormal, vec3 view)
{
	float depth = amplitude / 10.0;
	mat3 _tangent_matrix = mat3(tangent, normal, -binormal); // VIEW TO TANGENT SPACE
	vec3 _view_tangent = transpose(_tangent_matrix) * view;
	float _parallaxHeight = texture(height, uv).r;
    vec2 _parallaxOffset = parallax_mapping_uv_offset_1_step(_parallaxHeight, depth, _view_tangent);
    return _parallaxOffset + uv;
}

vec2 radial_shear_uv(vec2 uv, vec2 center, float strength, vec2 offset){
	vec2 _delta = uv - center;
	float _delta2 = dot(_delta.xy, _delta.xy);
	vec2 _delta_offset = vec2(_delta2 * strength);
	return uv + vec2(_delta.y, -_delta.x) * _delta_offset + offset;
}

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

vec2 spherize_uv(vec2 uv, vec2 center, float strength, vec2 offset){
	vec2 _delta = uv - center;
	float _delta2 = dot(_delta.xy, _delta.xy);
	float _delta4 = _delta2 * _delta2;
	vec2 _delta_offset = vec2(_delta4 * strength);
	return uv + _delta * _delta_offset + offset;
}

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

vec2 twirl_uv(vec2 uv, vec2 center, float strength, vec2 offset){
	vec2 _delta = uv - center;
	float _angle = strength * length(_delta);
	mat2 _rotation = mat2(
		vec2(cos(_angle), -sin(_angle)),
		vec2(sin(_angle), cos(_angle))
	);
	_delta = _rotation * _delta;
	return _delta + center;
}