vec4 sawtooth_wave(vec4 input) {
	return 2. * (input - floor(.5 + input));
}