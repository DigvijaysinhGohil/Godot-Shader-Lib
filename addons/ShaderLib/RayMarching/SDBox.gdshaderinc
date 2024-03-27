float sd_box(vec3 point, vec3 size, vec3 eulers) {
	point.yz *= rm_rotation(eulers.x);
	point.xy *= rm_rotation(eulers.z);
	point.xz *= rm_rotation(-eulers.y);
	return length(max(abs(point) - size, vec3(0)));
}

float ray_march_sd_box(vec3 ray_origin, vec3 ray_dir, int max_steps, float max_dist, float dist_threshold, vec3 cube_pos, vec3 eulers, vec3 size) {
	ray_dir = normalize(ray_dir);
	dist_threshold = abs(dist_threshold);
	float dist_from_origin = 0.;
	float dist_to_surface;
	for(int i = 0; i < max_steps; i++) {
		vec3 point = ray_origin + dist_from_origin * ray_dir;
		dist_to_surface = sd_box(point - cube_pos, size, eulers);
		dist_from_origin += dist_to_surface;
		if(dist_to_surface < dist_threshold || dist_to_surface > max_dist)
			break;
	}
	return dist_from_origin;
}