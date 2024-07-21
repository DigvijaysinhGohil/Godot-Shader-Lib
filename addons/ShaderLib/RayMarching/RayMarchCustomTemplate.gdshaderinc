// For in depth ray marching or sphere tracing info check out the playlist
// https://www.youtube.com/watch?v=68G3V5Yr8FY&list=PLaE0_uENxXqvzte-A0Ux2pav0zrUrTJ1V

float sdf_custom(vec3 p) {
	// Basic example of Sphere SDF with radius of .3
	// Put your custom logic here
	float radius = .3;
	return length(p) - radius;
}

float ray_march_custom(vec3 ray_origin, vec3 ray_dir, int max_steps, float max_dist, float dist_threshold) {
	ray_dir = normalize(ray_dir);
	dist_threshold = abs(dist_threshold);
	float dist_from_origin = 0.;
	float dist_to_surface;
	for(int i = 0; i < max_steps; i++) {
		vec3 point = ray_origin + dist_from_origin * ray_dir;
		dist_to_surface = sdf_custom(point);
		dist_from_origin += dist_to_surface;
		if(dist_to_surface < dist_threshold || dist_to_surface > max_dist)
			break;
	}
	return dist_from_origin;
}