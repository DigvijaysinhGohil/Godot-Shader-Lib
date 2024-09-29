#include "res://addons/ShaderLib_v2_2_4/Maths/Maths.gdshaderinc"

vec3 checker_board(vec2 uv, vec3 color_a, vec3 color_b, vec2 frequency) {
	uv = (uv.xy + 0.5) * frequency;
	vec4 derivatives = vec4(dFdx(uv), dFdy(uv));
	vec2 duv_length = sqrt(vec2(dot(derivatives.xz, derivatives.xz), dot(derivatives.yw, derivatives.yw)));
	float width = 1.0;
	vec2 distance3 = 4.0 * abs(fract(uv + 0.25) - 0.5) - width;
	vec2 scale = 0.35 / duv_length.xy;
	float frequency_limiter = sqrt(clamp(1.1f - max(duv_length.x, duv_length.y), 0.0, 1.0));
	vec2 vector_alpha = clamp(distance3 * scale.xy, -1.0, 1.0);
	float alpha = clamp(0.5f + 0.5f * vector_alpha.x * vector_alpha.y * frequency_limiter, 0.0, 1.0);
	return mix(color_b, color_a, alpha);
}

vec2 koch_fractal_direction(float angle) {
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

vec2 gradient_modulo(vec2 divident, vec2 divisor) {
	vec2 positive_divident = mod(divident, divisor) + divisor;
	return mod(positive_divident, divisor);
}

vec2 gradient_random(vec2 uv) {
	uv = vec2(dot(uv, vec2(127.1,311.7)), dot(uv, vec2(269.5,183.3)));
	return -1.0 + 2.0 * fract(sin(uv) * 43758.5453123);
}

float gradient_noise(vec2 uv, float scale) {
	uv = uv * float(scale);
	vec2 period = vec2(30.0, 60.0);
	vec2 cells_minimum = floor(uv);
	vec2 cells_maximum = ceil(uv);
	vec2 uv_fract = fract(uv);
	cells_minimum = gradient_modulo(cells_minimum, period);
	cells_maximum = gradient_modulo(cells_maximum, period);
	vec2 blur = smoothstep(0.0, 1.0, uv_fract);
	vec2 lowerLeftDirection = gradient_random(vec2(cells_minimum.x, cells_minimum.y));
	vec2 lowerRightDirection = gradient_random(vec2(cells_maximum.x, cells_minimum.y));
	vec2 upperLeftDirection = gradient_random(vec2(cells_minimum.x, cells_maximum.y));
	vec2 upperRightDirection = gradient_random(vec2(cells_maximum.x, cells_maximum.y));
	vec2 fraction = fract(uv);
	float mix_one = mix(dot(lowerLeftDirection, fraction - vec2(0, 0)), dot(lowerRightDirection, fraction - vec2(1, 0)), blur.x);
	float mix_two = mix(dot(upperLeftDirection, fraction - vec2(0, 1)), dot(upperRightDirection, fraction - vec2(1, 1)), blur.x);
	return mix(mix_one, mix_two, blur.y) * 0.8 + 0.5;
}

float gyroid_noise(vec2 uv, float scale, vec2 ratio, float height, float thickness) {
	scale *= 10.;
	thickness = clamp(thickness, 0., 1.);
	vec3 vector = vec3(uv, height);
	vector *= scale;
	return abs(dot(sin(vector * ratio.x), cos(vector.zxy * ratio.y))) - thickness;
}

float pseudo_random_noise(vec2 uv, float seed) {
	return fract(sin(dot(uv.xy + seed, vec2(12.9898,78.233))) * 43758.5453123);
}

float simple_noise_random(vec2 point) {
	return fract(sin(point.x * 100. + point.y * 654.125) * 55647.8745);
}

float value_noise(vec2 uv) {
	vec2 grid_uv = fract(uv);
	vec2 grid_id = floor(uv);
	grid_uv = grid_uv * grid_uv * (3. - 2. * grid_uv);

	float bottom_left = simple_noise_random(grid_id);
	float bottom_right = simple_noise_random(grid_id + vec2(1, 0));
	float bottom = mix(bottom_left, bottom_right, grid_uv.x);

	float top_left = simple_noise_random(grid_id + vec2(0, 1));
	float top_right = simple_noise_random(grid_id + vec2(1, 1));
	float top = mix(top_left, top_right, grid_uv.x);

	return mix(bottom, top, grid_uv.y);
}

float simple_noise(vec2 uv, float scale, int octaves) {
	octaves = clamp(octaves, 1, 6);
	float noise = value_noise(uv * scale);
	float amplitude = 1.;

	for(int i = 1; i < octaves; i++) {
		scale *= 2.;
		amplitude /= 2.;
		noise += value_noise(uv * scale) * amplitude;
	}

	return noise / 2.;
}

vec2 voronoi_random_vector(vec2 p) {
	mat2 matrix = mat2(vec2(15.27, 47.63), vec2(99.41, 89.98));
	return fract(sin(p * matrix) * 46839.32);
}

float voronoi_noise_euclidean(vec2 uv, float cell_density, float angle_offset, out float cells){
	vec2 grid_uv = fract(uv * cell_density);
	vec2 grid_id = floor(uv * cell_density);
	vec2 cell_id = vec2(0);
	float min_dist = 100.;

	for(float y = -1.; y <= 1.; y++) {
		for(float x = -1.; x <= 1.; x++) {
			vec2 offset = vec2(x, y);
			vec2 n = voronoi_random_vector(grid_id + offset);
			vec2 p = offset + vec2(sin(n.x + angle_offset) * .5 + .5, cos(n.y + angle_offset) * .5 + .5);
			float d = min_dist;
			d = distance(grid_uv, p);
			if(d < min_dist) {
				min_dist = d;
				cell_id = voronoi_random_vector(grid_id + offset);
			}
		}
	}

	cells = cell_id.y;
	return min_dist;
}

float voronoi_noise_manhattan(vec2 uv, float cell_density, float angle_offset, out float cells){
	vec2 grid_uv = fract(uv * cell_density);
	vec2 grid_id = floor(uv * cell_density);
	vec2 cell_id = vec2(0);
	float min_dist = 100.;

	for(float y = -1.; y <= 1.; y++) {
		for(float x = -1.; x <= 1.; x++) {
			vec2 offset = vec2(x, y);
			vec2 n = voronoi_random_vector(grid_id + offset);
			vec2 p = offset + vec2(sin(n.x + angle_offset) * .5 + .5, cos(n.y + angle_offset) * .5 + .5);
			float d = min_dist;
			d = manhattan_distance_2d(grid_uv, p);

			if(d < min_dist) {
				min_dist = d;
				cell_id = voronoi_random_vector(grid_id + offset);
			}
		}
	}

	cells = cell_id.y;
	return min_dist;
}

float voronoi_noise_chebyshev(vec2 uv, float cell_density, float angle_offset, float chebyshev_power, out float cells){
	vec2 grid_uv = fract(uv * cell_density);
	vec2 grid_id = floor(uv * cell_density);
	vec2 cell_id = vec2(0);
	float min_dist = 100.;

	for(float y = -1.; y <= 1.; y++) {
		for(float x = -1.; x <= 1.; x++) {
			vec2 offset = vec2(x, y);
			vec2 n = voronoi_random_vector(grid_id + offset);
			vec2 p = offset + vec2(sin(n.x + angle_offset) * .5 + .5, cos(n.y + angle_offset) * .5 + .5);
			float d = min_dist;
			d = chebyshev_distance_2d(grid_uv, p, chebyshev_power);

			if(d < min_dist) {
				min_dist = d;
				cell_id = voronoi_random_vector(grid_id + offset);
			}
		}
	}

	cells = cell_id.y;
	return min_dist;
}

float ellipse_shape(vec2 uv, float width, float height) {
	float dist = length((uv * 2.0 - 1.0) / vec2(width, height));
	return clamp((1.0 - dist) / fwidth(dist), 0.0, 1.0);
}

float polygon_shape(vec2 uv, int sides, float width, float height) {
	float a_width = width * cos(PI / float(sides));
	float a_height = height * cos(PI / float(sides));
	uv = (uv * 2.0 - 1.0) / vec2(a_width, a_height);
	uv.y *= -1.0;
	float polar_coords = atan(uv.x, uv.y);
	float radius = 2.0 * PI / float(sides);
	float dist = cos(floor(0.5 + polar_coords / radius) * radius - polar_coords) * length(uv);
	return clamp((1.0 - dist) / fwidth(dist), 0.0, 1.0);
}

float rectangle_shape(vec2 uv, float width, float height) {
    vec2 dist = abs(uv * 2.0 - 1.0) - vec2(width, height);
    dist = 1.0 - dist / fwidth(dist);
    return clamp(min(dist.x, dist.y), 0.0, 1.0);
}

float rounded_polygon_shape(vec2 uv, float width, float height, float sides, float roundness){
	uv = uv * 2.0 + vec2(-1.0);
	roundness /= 10.0;
	float epsilon = 1e-6;
	uv.x = uv.x / ( width + ((width > -epsilon && width < epsilon) ? 1.0 : 0.0 * epsilon));
	uv.y = uv.y / ( height +  ((height > -epsilon && height < epsilon) ? 1.0 : 0.0 * epsilon));
	roundness = clamp(roundness, 1e-6, 1.0);
	float i_sides = floor( abs( sides ) );
	float full_angle = 2.0 * PI / i_sides;
	float half_angle = full_angle / 2.;
	float diagonal = 1.0 / cos( half_angle );
	float chamfer_angle = roundness * half_angle;
	float remaining_angle = half_angle - chamfer_angle;
	float ratio = tan(remaining_angle) / tan(half_angle);
	vec2 chamfer_center = vec2(cos(half_angle) , sin(half_angle))* ratio * diagonal;

	float dist_a = length(chamfer_center);
	float dist_b = 1.0 - chamfer_center.x;
	float uv_scale = diagonal;
	uv *= uv_scale;
	vec2 polar_uv = vec2(atan(uv.y, uv.x), length(uv));

	polar_uv.x += PI / 2.0 + TAU;
	polar_uv.x = mod(polar_uv.x + half_angle, full_angle );
	polar_uv.x = abs(polar_uv.x - half_angle);
	uv = vec2(cos(polar_uv.x), sin(polar_uv.x)) * polar_uv.y;
	float angle_ratio = 1.0 - (polar_uv.x- remaining_angle) / chamfer_angle;
	float dist_c = sqrt(dist_a * dist_a + dist_b * dist_b - 2.0 * dist_a * dist_b * cos(PI - half_angle * angle_ratio));
	float output = uv.x;
	float chamfer_zone = (half_angle - polar_uv.x) < chamfer_angle ? 1.0 : 0.0;
	output = mix(uv.x, polar_uv.y / dist_c, chamfer_zone);
	output = clamp((1.0 - output) / fwidth(output), 0.0, 1.0);
	return output;
}

float rounded_rectangle_shape(vec2 uv, float width, float height, float radius){
	radius /= 10.0;
	radius = max(min(min(abs(radius * 2.0), abs(width)), abs(height)), 1e-5);
	uv = abs(uv * 2.0 - 1.0) - vec2(width, height) + radius;
	float dist = length(max(vec2(0.0), uv)) / radius;
	return clamp((1.0 - dist) / fwidth(dist), 0.0, 1.0);
}

vec3 heigth_to_normal(sampler2D height_map, vec2 uv, float bump_strength) {
	float pixel_width = .002;
	float height = texture(height_map, uv).r;
	float r = height - texture(height_map, uv + vec2(pixel_width, 0)).r;
	float l = height - texture(height_map, uv - vec2(pixel_width, 0)).r;
	float u = height - texture(height_map, uv + vec2(0, pixel_width)).r;
	float d = height - texture(height_map, uv - vec2(0, pixel_width)).r;
	float h = (r - l) / pixel_width;
    float v = (u - d) / pixel_width;
	vec3 n = vec3(h, v, 1.);
	n.x = n.x * (pixel_width * bump_strength * .5) + .5;
	n.y = n.y * (pixel_width * bump_strength * .5) + .5;
	return normalize(n);
}