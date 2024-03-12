vec4 color_mask(vec3 input, vec3 mask_color, float range, float fuzziness){
	float dist = distance(mask_color, input);
	return vec4(clamp(1. - (dist - range) / max(fuzziness, 1e-5), 0., 1.));
}