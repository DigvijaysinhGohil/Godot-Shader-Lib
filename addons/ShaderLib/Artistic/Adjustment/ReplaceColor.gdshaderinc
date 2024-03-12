vec3 replace_color(vec3 input, vec3 from, vec3 to, float range, float fuzziness){
	float dist = distance(from, input);
	return mix(to, input, clamp((dist - range) / max(fuzziness, 1.0e-5), 0.0, 1.0));
}