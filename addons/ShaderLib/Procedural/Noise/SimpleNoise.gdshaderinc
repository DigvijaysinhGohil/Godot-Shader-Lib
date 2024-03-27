float simple_noise_random(vec2 point) {
	return fract(sin(point.x * 100. + point.y * 654.125) * 55647.8745);
}

float value_noise(vec2 uv) {
	vec2 grid_uv = fract(uv);
	vec2 grid_id = floor(uv);
	grid_uv = grid_uv * grid_uv * (3. - 2. * grid_uv);

	float bottom_left = simple_noise_random(grid_id);
	float bottom_right = simple_noise_random(grid_id + vec2(1, 0));
	float bottom = mix(bottom_left, bottom_right, grid_uv.x);

	float top_left = simple_noise_random(grid_id + vec2(0, 1));
	float top_right = simple_noise_random(grid_id + vec2(1, 1));
	float top = mix(top_left, top_right, grid_uv.x);

	return mix(bottom, top, grid_uv.y);
}

float simple_noise(vec2 uv, float scale, int octaves) {
	octaves = clamp(octaves, 1, 6);
	float noise = value_noise(uv * scale);
	float amplitude = 1.;

	for(int i = 1; i < octaves; i++) {
		scale *= 2.;
		amplitude /= 2.;
		noise += value_noise(uv * scale) * amplitude;
	}

	return noise / 2.;
}