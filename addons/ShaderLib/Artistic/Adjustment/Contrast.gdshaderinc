vec3 contrast(vec3 input, float contrast){
	float midpoint = pow(0.5, 2.2);
	return (input - midpoint) * contrast + midpoint;
}