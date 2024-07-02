vec4 square_wave(vec4 input) {
	return 1. - 2. * round(fract(input));
}