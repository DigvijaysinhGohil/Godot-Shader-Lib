vec2 flipbook_uv(vec2 uv, int rows, int columns, float anim_speed) {
	int start_frame = 1;
	int end_frame = rows * columns;
	start_frame += int(fract(TIME * anim_speed) * float(end_frame));
	float frame = float(clamp(start_frame, 0, end_frame));
	vec2 off_per_frame = vec2((1.0 / float(columns)), (1.0 / float(rows)));
	vec2 sprite_size = vec2(uv.x / float(columns), uv.y / float(rows));
	vec2 current_sprite = vec2(0.0, 1.0 - off_per_frame.y);
	current_sprite.x += frame * off_per_frame.x;
	float row_index;
	current_sprite.y -= 1.0 - (row_index * off_per_frame.y);
	current_sprite.x -= row_index * float(columns) * off_per_frame.x;
	vec2 sprite_uv = (sprite_size + current_sprite);
	return sprite_uv;
}

vec2 parallax_mapping_uv_offset_1_step(float height, float amplitude, vec3 view_dir_tangent) {
    height = height * amplitude - amplitude / 2.0;
    vec3 vector = view_dir_tangent;
    vector.y += 0.42;
    return height * (vector.xz / vector.y);
}

vec2 parallax_mapping_uv(sampler2D height, float amplitude, vec2 uv, vec3 tangent, vec3 normal, vec3 binormal, vec3 view) {
	float depth = amplitude / 10.0;
	mat3 tangent_matrix = mat3(tangent, normal, -binormal); // VIEW TO TANGENT SPACE
	vec3 view_tangent = transpose(tangent_matrix) * view;
	float parallaxHeight = texture(height, uv).r;
    vec2 parallaxOffset = parallax_mapping_uv_offset_1_step(parallaxHeight, depth, view_tangent);
    return parallaxOffset + uv;
}

vec2 radial_shear_uv(vec2 uv, vec2 center, float strength, vec2 offset) {
	vec2 delta = uv - center;
	float delta2 = dot(delta.xy, delta.xy);
	vec2 delta_offset = vec2(delta2 * strength);
	return uv + vec2(delta.y, -delta.x) * delta_offset + offset;
}

mat2 rotation_mat2(float angle) {
	return mat2(
		vec2(cos(angle), -sin(angle)),
		vec2(sin(angle), cos(angle))
	);
}

vec2 rotate_uv(vec2 uv, vec2 center, float rotation, bool use_degrees) {
	float angle = rotation;
	if(use_degrees){
		angle = rotation * (3.1415926/180.0);
	}
	vec2 delta = uv - center;
	delta = rotation_mat2(angle) * delta;
	return delta + center;
}

vec2 spherize_uv(vec2 uv, vec2 center, float strength, vec2 offset) {
	vec2 delta = uv - center;
	float delta2 = dot(delta.xy, delta.xy);
	float delta4 = delta2 * delta2;
	vec2 delta_offset = vec2(delta4 * strength);
	return uv + delta * delta_offset + offset;
}

vec2 swirl_uv(vec2 uv, vec2 center, float strength, vec2 offset) {
	vec2 delta = uv - center;
	float angle = strength * max(pow(1. - length(delta), 3), 0);
	delta = rotation_mat2(angle) * delta;
	return delta + center + offset;
}

vec2 twirl_uv(vec2 uv, vec2 center, float strength, vec2 offset) {
	vec2 delta = uv - center;
	float angle = strength * length(delta);
	delta = rotation_mat2(angle) * delta;
	return delta + center + offset;
}