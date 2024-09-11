vec3 contrast(vec3 input, float contrast) {
	float midpoint = pow(0.5, 2.2);
	return (input - midpoint) * contrast + midpoint;
}

vec3 hue(vec3 input, float offset, int range_index) {
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

vec3 replace_color(vec3 input, vec3 from, vec3 to, float range, float fuzziness) {
	float dist = distance(from, input);
	return mix(to, input, clamp((dist - range) / max(fuzziness, 1.0e-5), 0.0, 1.0));
}

vec3 saturation(vec3 input, float saturation) {
	float luma = dot(input, vec3(0.2126729, 0.7151522, 0.0721750));
	return luma + saturation * (input - vec3(luma));
}

vec3 white_balance(vec3 input, float temperature, float tint) {
	float t1 = temperature * 10.0 / 6.0;
	float t2 = tint * 10.0 / 6.0;

	float x = 0.31271 - t1 * (t1 < 0.0 ? 0.1 : 0.05);
	float standard_illuminant_y = 2.87 * x - 3.0 * x * x - 0.27509507;
	float y = standard_illuminant_y + t2 * 0.05;

	vec3 w1 = vec3(0.949237, 1.03542, 1.08728);

	float Y = 1.;
	float X = Y * x / y;
	float Z = Y * (1. - x - y) / y;
	float L = 0.7328 * X + 0.4296 * Y - 0.1624 * Z;
	float M = -0.7036 * X + 1.6975 * Y + 0.0061 * Z;
	float S = 0.0030 * X + 0.0136 * Y + 0.9834 * Z;
	vec3 w2 = vec3(L, M, S);

	vec3 balance = vec3(w1.x / w2.x, w1.y / w2.y, w1.z / w2.z);

	mat3 LIN_2_LMS_MAT = mat3(
		vec3(3.90405e-1, 5.49941e-1, 8.92632e-3),
		vec3(7.08416e-2, 9.63172e-1, 1.35775e-3),
		vec3(2.31082e-2, 1.28021e-1, 9.36245e-1)
	);

	mat3 LMS_2_LIN_MAT = mat3(
		vec3(2.85847, -1.62879, -2.48910),
		vec3(-2.10182e-1,  1.15820e+0,  3.24281e-4),
		vec3(-4.18120e-2, -1.18169e-1,  1.06867e+0)
		);

	vec3 lms = LIN_2_LMS_MAT * input;
	lms *= balance;
	return LMS_2_LIN_MAT * lms;
}

vec4 color_mask(vec3 input, vec3 mask_color, float range, float fuzziness) {
	float dist = distance(mask_color, input);
	return vec4(clamp(1. - (dist - range) / max(fuzziness, 1e-5), 0., 1.));
}