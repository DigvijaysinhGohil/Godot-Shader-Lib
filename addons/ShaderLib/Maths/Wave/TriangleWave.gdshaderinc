vec4 triangle_wave(vec4 input) {
	return 2. * abs(2. * (input - floor(.5 + input))) - 1.;
}