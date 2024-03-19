#include "res://addons/ShaderLib/Maths/Vector/Distance/Manhattan2D.gdshaderinc"
#include "res://addons/ShaderLib/Maths/Vector/Distance/Chebyshev2D.gdshaderinc"

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