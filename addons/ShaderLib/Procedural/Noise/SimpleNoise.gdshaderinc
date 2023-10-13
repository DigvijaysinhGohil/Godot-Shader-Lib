float noise_random_value(vec2 uv){
	return fract(sin(dot(uv.xy, vec2(12.9898,78.233))) * 43758.5453123);
}

float value_noise(vec2 uv) {
	vec2 uv_index = floor(uv);
	vec2 uv_fract = fract(uv);
	float a = noise_random_value(uv_index);
	float b = noise_random_value(uv_index + vec2(1.0, 0.0));
	float c = noise_random_value(uv_index + vec2(0.0, 1.0));
	float d = noise_random_value(uv_index + vec2(1.0, 1.0));
	vec2 blur = smoothstep(0.0, 1.0, uv_fract);
	return mix(a, b, blur.x) + ((c - a) * blur.y * (1.0 - blur.x)) + ((d - b) * blur.x * blur.y);
}

float simple_noise(vec2 uv, float scale){
	int octaves = 6;
	float amplitude = 0.5;
	float frequency = scale;
	float value = 0.0;

	for(int i = 0; i < octaves; i++) {
		value += amplitude * value_noise(frequency * uv);
		amplitude *= 0.5;
		frequency *= 2.0;
	}
	return value;
}