vec2 koch_fractal_direction(float angle){
	return vec2(sin(angle), cos(angle));
}

float koch_fractal(vec2 uv, float outline, int iteration, float shape_width, float shape_height, out vec2 koch_uv) {
	float tiling = 3.0;
	vec2 center = uv - vec2(.5);
	shape_width =  .85 * (shape_width / 1.);
	shape_height = .85 * (shape_height / 1.);
	center.x /= shape_width;
	center.y /= shape_height;

	center.x = abs(center.x);
	center.y += tan(.833 * PI) * .5;
	vec2 dir = koch_fractal_direction(.833 * PI);
	float dist = dot(center - vec2(tiling / (2. * tiling), 0), dir);
	center -= dir * max(0, dist) * 2.0;

	dir = koch_fractal_direction(.6667 * PI);
	float scale = 1.0;
	center.x += .5;
	for(int i = 0; i < iteration; i++){
		center *= tiling;
		scale *= tiling;
		center.x -= .5 * tiling;

		center.x = abs(center.x);
		center.x -= .5;
		center -= dir * min(0.0, dot(center, dir)) * 2.0;
	}

	dist = length(center - vec2(clamp(center.x, -1.0, 1.0), 0));
	dist += step(outline / 100.0, dist / scale);
	koch_uv = abs(center);
	return 1.0 - dist;
}