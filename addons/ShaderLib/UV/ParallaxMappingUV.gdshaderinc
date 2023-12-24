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