vec3 saturation(vec3 input, float saturation){
	float luma = dot(input, vec3(0.2126729, 0.7151522, 0.0721750));
	return luma + saturation * (input - vec3(luma));
}