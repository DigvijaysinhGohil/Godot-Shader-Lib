vec2 gradient_modulo(vec2 divident, vec2 divisor){
	vec2 _positive_divident = mod(divident, divisor) + divisor;
	return mod(_positive_divident, divisor);
}

vec2 gradient_random(vec2 uv){
	uv = vec2(dot(uv, vec2(127.1,311.7)), dot(uv, vec2(269.5,183.3)));
	return -1.0 + 2.0 * fract(sin(uv) * 43758.5453123);
}

float gradient_noise(vec2 uv, float scale) {
	uv = uv * float(scale);
	vec2 _period = vec2(30.0, 60.0);
	vec2 _cells_minimum = floor(uv);
	vec2 _cells_maximum = ceil(uv);
	vec2 _uv_fract = fract(uv);
	_cells_minimum = gradient_modulo(_cells_minimum, _period);
	_cells_maximum = gradient_modulo(_cells_maximum, _period);
	vec2 _blur = smoothstep(0.0, 1.0, _uv_fract);
	vec2 _lowerLeftDirection = gradient_random(vec2(_cells_minimum.x, _cells_minimum.y));
	vec2 _lowerRightDirection = gradient_random(vec2(_cells_maximum.x, _cells_minimum.y));
	vec2 _upperLeftDirection = gradient_random(vec2(_cells_minimum.x, _cells_maximum.y));
	vec2 _upperRightDirection = gradient_random(vec2(_cells_maximum.x, _cells_maximum.y));
	vec2 _fraction = fract(uv);
	float _mix_one = mix(dot(_lowerLeftDirection, _fraction - vec2(0, 0)), dot(_lowerRightDirection, _fraction - vec2(1, 0)), _blur.x);
	float _mix_two = mix(dot(_upperLeftDirection, _fraction - vec2(0, 1)), dot(_upperRightDirection, _fraction - vec2(1, 1)), _blur.x);
	return mix(_mix_one, _mix_two, _blur.y) * 0.8 + 0.5;
}