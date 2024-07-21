#include "res://addons/ShaderLib/Maths/Maths.gdshaderinc"

vec3 checker_board(vec2 uv, vec3 color_a, vec3 color_b, vec2 frequency){
	uv = (uv.xy + 0.5) * frequency;
	vec4 _derivatives = vec4(dFdx(uv), dFdy(uv));
	vec2 _duv_length = sqrt(vec2(dot(_derivatives.xz, _derivatives.xz), dot(_derivatives.yw, _derivatives.yw)));
	float _width = 1.0;
	vec2 _distance3 = 4.0 * abs(fract(uv + 0.25) - 0.5) - _width;
	vec2 _scale = 0.35 / _duv_length.xy;
	float _frequency_limiter = sqrt(clamp(1.1f - max(_duv_length.x, _duv_length.y), 0.0, 1.0));
	vec2 _vector_alpha = clamp(_distance3 * _scale.xy, -1.0, 1.0);
	float _alpha = clamp(0.5f + 0.5f * _vector_alpha.x * _vector_alpha.y * _frequency_limiter, 0.0, 1.0);
	return mix(color_b, color_a, _alpha);
}

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

vec2 gradient_modulo(vec2 divident, vec2 divisor){
	vec2 _positive_divident = mod(divident, divisor) + divisor;
	return mod(_positive_divident, divisor);
}

vec2 gradient_random(vec2 uv){
	uv = vec2(dot(uv, vec2(127.1,311.7)), dot(uv, vec2(269.5,183.3)));
	return -1.0 + 2.0 * fract(sin(uv) * 43758.5453123);
}

float gradient_noise(vec2 uv, float scale) {
	uv = uv * float(scale);
	vec2 _period = vec2(30.0, 60.0);
	vec2 _cells_minimum = floor(uv);
	vec2 _cells_maximum = ceil(uv);
	vec2 _uv_fract = fract(uv);
	_cells_minimum = gradient_modulo(_cells_minimum, _period);
	_cells_maximum = gradient_modulo(_cells_maximum, _period);
	vec2 _blur = smoothstep(0.0, 1.0, _uv_fract);
	vec2 _lowerLeftDirection = gradient_random(vec2(_cells_minimum.x, _cells_minimum.y));
	vec2 _lowerRightDirection = gradient_random(vec2(_cells_maximum.x, _cells_minimum.y));
	vec2 _upperLeftDirection = gradient_random(vec2(_cells_minimum.x, _cells_maximum.y));
	vec2 _upperRightDirection = gradient_random(vec2(_cells_maximum.x, _cells_maximum.y));
	vec2 _fraction = fract(uv);
	float _mix_one = mix(dot(_lowerLeftDirection, _fraction - vec2(0, 0)), dot(_lowerRightDirection, _fraction - vec2(1, 0)), _blur.x);
	float _mix_two = mix(dot(_upperLeftDirection, _fraction - vec2(0, 1)), dot(_upperRightDirection, _fraction - vec2(1, 1)), _blur.x);
	return mix(_mix_one, _mix_two, _blur.y) * 0.8 + 0.5;
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

void voronoi_noise(vec2 uv, float cell_density, float angle_offset, int distance_index, float chebyshev_power, out float output, out float cells){
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

			switch(distance_index){
				case 1:
					d = manhattan_distance_2d(grid_uv, p);
					break;
				case 2:
					d = chebyshev_distance_2d(grid_uv, p, chebyshev_power);
					break;
				default:
					d = distance(grid_uv, p);
					break;
			}

			if(d < min_dist) {
				min_dist = d;
				cell_id = voronoi_random_vector(grid_id + offset);
			}
		}
	}

	output = min_dist;
	cells = cell_id.y;
}

float ellipse_shape(vec2 uv, float width, float height){
	float _distance = length((uv * 2.0 - 1.0) / vec2(width, height));
	return clamp((1.0 - _distance) / fwidth(_distance), 0.0, 1.0);
}

float polygon_shape(vec2 uv, int sides, float width, float height){
	float _a_width = width * cos(PI / float(sides));
	float _a_height = height * cos(PI / float(sides));
	uv = (uv * 2.0 - 1.0) / vec2(_a_width, _a_height);
	uv.y *= -1.0;
	float _polar_coords = atan(uv.x, uv.y);
	float _radius = 2.0 * PI / float(sides);
	float _distance = cos(floor(0.5 + _polar_coords / _radius) * _radius - _polar_coords) * length(uv);
	return clamp((1.0 - _distance) / fwidth(_distance), 0.0, 1.0);
}

float rectangle_shape(vec2 uv, float width, float height){
    vec2 _distance = abs(uv * 2.0 - 1.0) - vec2(width, height);
    _distance = 1.0 - _distance / fwidth(_distance);
    return clamp(min(_distance.x, _distance.y), 0.0, 1.0);
}

float rounded_polygon_shape(vec2 uv, float width, float height, float sides, float roundness){
	uv = uv * 2.0 + vec2(-1.0);
	roundness /= 10.0;
	float _epsilon = 1e-6;
	uv.x = uv.x / ( width + ((width>-_epsilon && width<_epsilon) ? 1.0 : 0.0 * _epsilon));
	uv.y = uv.y / ( height +  ((height>-_epsilon && height<_epsilon) ? 1.0 : 0.0 * _epsilon));
	roundness = clamp(roundness, 1e-6, 1.0);
	float _i_sides = floor( abs( sides ) );
	float _full_angle = 2.0 * PI / _i_sides;
	float _half_angle = _full_angle / 2.;
	float _diagonal = 1.0 / cos( _half_angle );
	float _chamfer_angle = roundness * _half_angle;
	float _remaining_angle = _half_angle - _chamfer_angle;
	float _ratio = tan(_remaining_angle) / tan(_half_angle);
	vec2 _chamfer_center = vec2(cos(_half_angle) , sin(_half_angle))* _ratio * _diagonal;

	float _dist_a = length(_chamfer_center);
	float _dist_b = 1.0 - _chamfer_center.x;
	float _uv_scale = _diagonal;
	uv *= _uv_scale;
	vec2 _polar_uv = vec2(atan(uv.y, uv.x), length(uv));

	_polar_uv.x += PI / 2.0 + TAU;
	_polar_uv.x = mod(_polar_uv.x + _half_angle, _full_angle );
	_polar_uv.x = abs(_polar_uv.x - _half_angle);
	uv = vec2(cos(_polar_uv.x), sin(_polar_uv.x)) * _polar_uv.y;
	float _angle_ratio = 1.0 - (_polar_uv.x-_remaining_angle) / _chamfer_angle;
	float _dist_c = sqrt(_dist_a * _dist_a + _dist_b * _dist_b - 2.0 * _dist_a *_dist_b * cos(PI - _half_angle * _angle_ratio));
	float output = uv.x;
	float _chamfer_zone = (_half_angle - _polar_uv.x) < _chamfer_angle ? 1.0 : 0.0;
	output = mix(uv.x, _polar_uv.y / _dist_c, _chamfer_zone);
	output = clamp((1.0 - output) / fwidth(output), 0.0, 1.0);
	return output;
}

float rounded_rectangle_shape(vec2 uv, float width, float height, float radius){
	radius /= 10.0;
	radius = max(min(min(abs(radius * 2.0), abs(width)), abs(height)), 1e-5);
	uv = abs(uv * 2.0 - 1.0) - vec2(width, height) + radius;
	float _distance = length(max(vec2(0.0), uv)) / radius;
	return clamp((1.0 - _distance) / fwidth(_distance), 0.0, 1.0);
}