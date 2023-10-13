float rounded_polygon_shape(vec2 uv, float width, float height, float sides, float roundness){
	uv = uv * 2.0 + vec2(-1.0);
	roundness /= 10.0;
	float _epsilon = 1e-6;
	uv.x = uv.x / ( width + ((width>-_epsilon && width<_epsilon) ? 1.0 : 0.0 * _epsilon));
	uv.y = uv.y / ( height +  ((height>-_epsilon && height<_epsilon) ? 1.0 : 0.0 * _epsilon));
	roundness = clamp(roundness, 1e-6, 1.0);
	float _i_sides = floor( abs( sides ) );
	float _full_angle = 2.0 * PI / _i_sides;
	float _half_angle = _full_angle / 2.;
	float _diagonal = 1.0 / cos( _half_angle );
	float _chamfer_angle = roundness * _half_angle;
	float _remaining_angle = _half_angle - _chamfer_angle;
	float _ratio = tan(_remaining_angle) / tan(_half_angle);
	vec2 _chamfer_center = vec2(cos(_half_angle) , sin(_half_angle))* _ratio * _diagonal;
    
	float _dist_a = length(_chamfer_center);
	float _dist_b = 1.0 - _chamfer_center.x;
	float _uv_scale = _diagonal;
	uv *= _uv_scale;
	vec2 _polar_uv = vec2(atan(uv.y, uv.x), length(uv));
	
	_polar_uv.x += PI / 2.0 + TAU;
	_polar_uv.x = mod(_polar_uv.x + _half_angle, _full_angle );
	_polar_uv.x = abs(_polar_uv.x - _half_angle);
	uv = vec2(cos(_polar_uv.x), sin(_polar_uv.x)) * _polar_uv.y;
	float _angle_ratio = 1.0 - (_polar_uv.x-_remaining_angle) / _chamfer_angle;
	float _dist_c = sqrt(_dist_a * _dist_a + _dist_b * _dist_b - 2.0 * _dist_a *_dist_b * cos(PI - _half_angle * _angle_ratio));
	float output = uv.x;
	float _chamfer_zone = (_half_angle - _polar_uv.x) < _chamfer_angle ? 1.0 : 0.0;
	output = mix(uv.x, _polar_uv.y / _dist_c, _chamfer_zone);
	output = clamp((1.0 - output) / fwidth(output), 0.0, 1.0);
	return output;
}