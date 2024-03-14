vec3 hue(vec3 input, float offset, int range_index){
	// RGB to HSV
	vec4 k = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
	vec4 p = mix(vec4(input.bg, k.wz), vec4(input.gb, k.xy), step(input.b, input.g));
	vec4 q = mix(vec4(p.xyw, input.r), vec4(input.r, p.yzx), step(p.x, input.r));
	float d = q.x - min(q.w, q.y);
	float e = 1.0e-10;
	vec3 hsv = vec3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);

	offset = (range_index == 0) ? offset / 360.0 : offset;
	float hue = hsv.x + offset;
	if(hue < 0.0){
		hsv.x = hue + 1.;
	}
	else if(hue > 1.){
		hsv.x = hue - 1.;
	}
	else{
		hsv.x = hue;
	}

	// HSV to RGB
	vec4 k2 = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
	vec3 p2 = abs(fract(hsv.xxx + k2.xyz) * 6.0 - k2.www);
	vec3 rgb = hsv.z * mix(k2.xxx, clamp(p2 - k2.xxx, 0.0, 1.0), hsv.y);
	return rgb;
}