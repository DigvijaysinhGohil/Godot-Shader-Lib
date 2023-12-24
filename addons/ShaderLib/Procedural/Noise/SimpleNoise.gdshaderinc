float noise_random_value(vec2 uv){
	return fract(sin(dot(uv.xy, vec2(12.9898,78.233))) * 43758.5453123);
}

float value_noise(vec2 uv){
	vec2 _floor = floor(uv);
	vec2 _fraction = fract(uv);
	_fraction = _fraction * _fraction * (3.0 - 2.0 * _fraction);
	vec2 _corner = vec2(1.0, 0.0);

	float _c0 = noise_random_value(_floor + _corner.yy);
	float _c1 = noise_random_value(_floor + _corner.xy);
	float _c2 = noise_random_value(_floor + _corner.yx);
	float _c3 = noise_random_value(_floor + _corner.xx);

	vec2 _blur = smoothstep(0.0, 1.0, _fraction);
	float mix_one = mix(_c0, _c1, _blur.x) + (_c2 - _c0) * _blur.y * (1.0 - _blur.x) + (_c3 - _c1) * _blur.x * _blur.y;
	return mix_one;
}

float simple_noise(vec2 uv, float scale){
	int octaves = 6;
	float amplitude = 0.25;
	float value = 0.0;

	for(int i = 0; i < octaves; i++) {
		value += amplitude * value_noise(scale * uv);
		amplitude *= 0.85;
		scale *= 3.0;
	}
	return value;
}