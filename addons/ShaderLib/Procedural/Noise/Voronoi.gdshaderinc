vec2 voronoi_random_vector(vec2 p) {
	mat2 matrix = mat2(vec2(15.27, 47.63), vec2(99.41, 89.98));
	return fract(sin(p * matrix) * 46839.32);
}

float voronoi_euclidean_distance(vec2 point1, vec2 point2){
	return distance(point1, point2);
}

float voronoi_manhattan_distance(vec2 point1, vec2 point2) {
	vec2 d = point1 - point2;
	return abs(d.x) + abs(d.y);
}

float voronoi_chebyshev_distance(vec2 point1, vec2 point2, float power) {
	vec2 p = point1 - point2;
	return pow(pow(p.x, power) + pow(p.y, power), 1. / power);
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
			vec2 p = offset + sin(n + angle_offset) * .5 + .5;
			float d = min_dist;

			switch(distance_index){
				case 1:
					d = voronoi_manhattan_distance(grid_uv, p);
					break;
				case 2:
					d = voronoi_chebyshev_distance(grid_uv, p, chebyshev_power);
					break;
				default:
					d = voronoi_euclidean_distance(grid_uv, p);
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