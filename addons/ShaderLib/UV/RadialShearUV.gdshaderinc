vec2 radial_shear_uv(vec2 uv, vec2 center, float strength, vec2 offset){
	vec2 _delta = uv - center;
	float _delta2 = dot(_delta.xy, _delta.xy);
	vec2 _delta_offset = vec2(_delta2 * strength);
	return uv + vec2(_delta.y, -_delta.x) * _delta_offset + offset;
}