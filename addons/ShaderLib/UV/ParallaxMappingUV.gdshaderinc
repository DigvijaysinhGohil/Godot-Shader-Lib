vec2 parallax_mapping_uv(sampler2D height_map, float bump_scale, vec3 view_direction, mat4 inv_view_matrix, vec2 uv){
	vec3 _eye = -(inv_view_matrix * vec4(view_direction, 0.0)).xyz;
	_eye = normalize(view_direction);
	float _depth = texture(height_map, uv).w;
	vec2 _half_offset = normalize(_eye).xy * (_depth) * bump_scale;
	_depth = (_depth + texture(height_map, uv + _half_offset).x) * 0.5;
	_half_offset = normalize(_eye).xy * (_depth) * bump_scale;
	_depth = (_depth + texture(height_map, uv + _half_offset).x) * 0.5;
	_half_offset = normalize(_eye).xy * (_depth) * bump_scale;
	return uv + _half_offset;
}