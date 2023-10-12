vec3 checker_board(vec2 uv, vec3 color_a, vec3 color_b, vec2 frequency){
	uv = (uv.xy + 0.5) * frequency;
	vec4 _derivatives = vec4(dFdx(uv), dFdy(uv));
	vec2 _duv_length = sqrt(vec2(dot(_derivatives.xz, _derivatives.xz), dot(_derivatives.yw, _derivatives.yw)));
	float _width = 1.0;
	vec2 _distance3 = 4.0 * abs(fract(uv + 0.25) - 0.5) - _width;
	vec2 _scale = 0.35 / _duv_length.xy;
	float _frequency_limiter = sqrt(clamp(1.1f - max(_duv_length.x, _duv_length.y), 0.0, 1.0));
	vec2 _vector_alpha = clamp(_distance3 * _scale.xy, -1.0, 1.0);
	float _alpha = clamp(0.5f + 0.5f * _vector_alpha.x * _vector_alpha.y * _frequency_limiter, 0.0, 1.0);
	return mix(color_b, color_a, _alpha);
}