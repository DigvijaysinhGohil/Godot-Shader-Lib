void voronoi_noise(vec2 uv, float cell_density, float angle_offset, out float output, out float cells){
	vec2 g = floor(uv * cell_density);
	vec2 f = fract(uv * cell_density);
	float t = 8.0;
	vec3 res = vec3(8.0, 0.0, 0.0);
	mat2 m = mat2(vec2(15.27, 47.63), vec2(99.41, 89.98));
	
	for(int y=-1; y<=1; y++)
	{
		for(int x=-1; x<=1; x++)
		{
			vec2 lattice = vec2(float(x), float(y));
			vec2 new_uv = lattice + g;
			new_uv = fract(sin(new_uv * m) * 46839.32);
			vec2 offset = vec2(sin(new_uv.y * angle_offset) * 0.5 + 0.5, cos(new_uv.x * angle_offset) * 0.5 + 0.5);
			float d = distance(lattice + offset, f);
			if(d < res.x)
			{
				res = vec3(d, offset.x, offset.y);
				output = res.x;
				cells = res.y;
			}
		}
	}
}