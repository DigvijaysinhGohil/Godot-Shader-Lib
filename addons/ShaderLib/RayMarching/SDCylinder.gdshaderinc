float sd_cylinder(vec3 point, vec3 cylinder_pos, float height, float radius, vec3 eulers) {
	vec3 orientation = vec3(0, 1, 0);
	orientation.yz *= rm_rotation(eulers.x);
	orientation.xy *= rm_rotation(eulers.z);
	orientation.xz *= rm_rotation(-eulers.y);

	vec3 top_point = point + orientation * (height * .5);
	vec3 bottom_point = point - orientation * (height * .5);

	vec3 height_vector = bottom_point - top_point;
	vec3 top_distance = cylinder_pos - top_point;

	float t = dot(height_vector, top_distance) / dot(height_vector, height_vector);
	vec3 hit_point = top_point + t * height_vector;

	float x = length(cylinder_pos - hit_point) - radius;
	float y = (abs(t - .5) - .5) * length(height_vector);
	float e = length(max(vec2(x, y), 0));
	float i = min(max(x, y), 0.);

	return e + i;
}

float ray_march_sd_cylinder(vec3 ray_origin, vec3 ray_dir, int max_steps, float max_dist, float dist_threshold, vec3 cylinder_pos, float cylinder_height, float cylinder_radius, vec3 eulers) {
	ray_dir = normalize(ray_dir);
	dist_threshold = abs(dist_threshold);
	float dist_from_origin = 0.;
	float dist_to_surface;
	for(int i = 0; i < max_steps; i++) {
		vec3 point = ray_origin + dist_from_origin * ray_dir;
		dist_to_surface = sd_cylinder(point, cylinder_pos, cylinder_height, cylinder_radius, eulers);
		dist_from_origin += dist_to_surface;
		if(dist_to_surface < dist_threshold || dist_to_surface > max_dist)
			break;
	}
	return dist_from_origin;
}