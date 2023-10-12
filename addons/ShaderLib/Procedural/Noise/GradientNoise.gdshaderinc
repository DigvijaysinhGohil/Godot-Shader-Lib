vec2 gradient_noise_dir(vec2 p){
	p = vec2(mod(p.x,289.0), mod(p.y, 289.0));
	float x = (34.0 * p.x + 1.0) * mod(p.x, 289.0) + p.y;
	x = (34.0 * x + 1.0) * mod(x, 289.0);
	x = fract(x / 41.0) * 2.0 - 1.0;
	return normalize(vec2(x - floor(x + 0.5), abs(x) - 0.5));
}

float gradient_noise(vec2 uv, float scale){
	vec2 p = uv * scale;
	vec2 ip = floor(p);
	vec2 fp = fract(p);
	float d00 = dot(gradient_noise_dir(ip), fp);
	float d01 = dot(gradient_noise_dir(ip + vec2(0, 1)), fp - vec2(0, 1));
	float d10 = dot(gradient_noise_dir(ip + vec2(1, 0)), fp - vec2(1, 0));
	float d11 = dot(gradient_noise_dir(ip + vec2(1, 1)), fp - vec2(1, 1));
	fp = fp * fp * fp * (fp * (fp * 6.0 - 15.0) + 10.0);
	return mix(mix(d00, d01, fp.y), mix(d10, d11, fp.y), fp.x) + 0.5;
}