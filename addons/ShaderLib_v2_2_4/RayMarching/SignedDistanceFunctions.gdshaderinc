mat2 rm_rotation(float angle) {
	angle = -angle * (3.1415926 / 180.);
	return mat2(
		vec2(cos(angle), -sin(angle)),
		vec2(sin(angle), cos(angle))
	);
}

float sd_box(vec3 point, vec3 size, vec3 eulers) {
	point.yz *= rm_rotation(eulers.x);
	point.xy *= rm_rotation(eulers.z);
	point.xz *= rm_rotation(-eulers.y);
	vec3 box_distances = abs(point) - size;
	float external_dist = length(max(box_distances, 0));
	float internal_dist = min(max(box_distances.x, max(box_distances.y, box_distances.z)), 0);
	return external_dist + internal_dist;
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

float sd_capsule(vec3 point, vec3 capsule_pos, float height, float radius, vec3 eulers) {
	vec3 orientation = vec3(0, 1, 0);
	orientation.yz *= rm_rotation(eulers.x);
	orientation.xy *= rm_rotation(eulers.z);
	orientation.xz *= rm_rotation(-eulers.y);

	vec3 top_point = point + orientation * (height * .5);
	vec3 bottom_point = point - orientation * (height * .5);

	vec3 height_vector = bottom_point - top_point;
	vec3 top_distance = capsule_pos - top_point;

	float t = dot(height_vector, top_distance) / dot(height_vector, height_vector);
	t = clamp(t, 0., 1.);
	vec3 hit_point = top_point + t * height_vector;

	return length(capsule_pos - hit_point) - radius;
}

float ray_march_sd_capsule(vec3 ray_origin, vec3 ray_dir, int max_steps, float max_dist, float dist_threshold, vec3 capsule_pos, float capsule_height, float capsule_radius, vec3 eulers) {
	ray_dir = normalize(ray_dir);
	dist_threshold = abs(dist_threshold);
	float dist_from_origin = 0.;
	float dist_to_surface;
	for(int i = 0; i < max_steps; i++) {
		vec3 point = ray_origin + dist_from_origin * ray_dir;
		dist_to_surface = sd_capsule(point, capsule_pos, capsule_height, capsule_radius, eulers);
		dist_from_origin += dist_to_surface;
		if(dist_to_surface < dist_threshold || dist_to_surface > max_dist)
			break;
	}
	return dist_from_origin;
}

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

float sd_torus(vec3 point, float small_radius, float big_radius, vec3 eulers) {
	point.yz *= rm_rotation(eulers.x);
	point.xy *= rm_rotation(eulers.z);
	point.xz *= rm_rotation(-eulers.y);
	return length(vec2(length(point.xz) - big_radius, point.y)) - small_radius;
}

float ray_march_sd_torus(vec3 ray_origin, vec3 ray_dir, int max_steps, float max_dist, float dist_threshold, vec3 torus_pos, vec3 eulers, float small_radius, float big_radius) {
	ray_dir = normalize(ray_dir);
	dist_threshold = abs(dist_threshold);
	float dist_from_origin = 0.;
	float dist_to_surface;
	for(int i = 0; i < max_steps; i++) {
		vec3 point = ray_origin + dist_from_origin * ray_dir;
		dist_to_surface = sd_torus(point - torus_pos, small_radius, big_radius, eulers);
		dist_from_origin += dist_to_surface;
		if(dist_to_surface < dist_threshold || dist_to_surface > max_dist)
			break;
	}
	return dist_from_origin;
}