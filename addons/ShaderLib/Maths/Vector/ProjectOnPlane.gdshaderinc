vec3 project_on_plane(vec3 vector, vec3 plane_normal) {
	return vector - (plane_normal * (dot(vector, plane_normal) / dot(plane_normal, plane_normal)));
}