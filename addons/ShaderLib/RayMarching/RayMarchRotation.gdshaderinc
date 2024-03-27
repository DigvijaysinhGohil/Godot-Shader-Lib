mat2 rm_rotation(float angle) {
	angle = -angle * (3.1415926 / 180.);
	return mat2(
		vec2(cos(angle), -sin(angle)),
		vec2(sin(angle), cos(angle))
	);
}
