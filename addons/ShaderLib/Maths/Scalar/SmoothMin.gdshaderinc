float smoothmin(float a, float b, float t) {
	float h = clamp(.5 + .5 * (b - a) / t, 0, 1);
	return mix(b, a, h) - t * h * (1. - h);
}