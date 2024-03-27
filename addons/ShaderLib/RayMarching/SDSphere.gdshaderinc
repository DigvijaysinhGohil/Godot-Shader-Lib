float sd_sphere(vec3 point, vec3 eulers, vec3 scale) {
	float radius = 1.;
	point.yz *= rm_rotation(eulers.x);
	point.xy *= rm_rotation(eulers.z);
	point.xz *= rm_rotation(-eulers.y);
	point /= scale;
	return (length(point) - radius) * min(scale.x, min(scale.y, scale.z));
}

float ray_march_sd_sphere(vec3 ray_origin, vec3 ray_dir, int max_steps, float max_dist, float dist_threshold, vec3 sphere_pos, vec3 eulers, vec3 scale) {
	ray_dir = normalize(ray_dir);
	dist_threshold = abs(dist_threshold);
	float dist_from_origin = 0.;
	float dist_to_surface;
	for(int i = 0; i < max_steps; i++) {
		vec3 point = ray_origin + dist_from_origin * ray_dir;
		dist_to_surface = sd_sphere(point - sphere_pos, eulers, scale);
		dist_from_origin += dist_to_surface;
		if(dist_to_surface < dist_threshold || dist_to_surface > max_dist)
			break;
	}
	return dist_from_origin;
}