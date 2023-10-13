void voronoi_noise(vec2 uv, float cell_density, float angle_offset, out float output, out float cells){
	vec2 _g = floor(uv * cell_density);
	vec2 _f = fract(uv * cell_density);
	vec3 _res = vec3(8.0, 0.0, 0.0);
	mat2 _matrix = mat2(vec2(15.27, 47.63), vec2(99.41, 89.98));
	
	for(int y=-1; y<=1; y++)
	{
		for(int x=-1; x<=1; x++)
		{
			vec2 lattice = vec2(float(x), float(y));
			vec2 new_uv = lattice + _g;
			new_uv = fract(sin(new_uv * _matrix) * 46839.32);
			vec2 offset = vec2(sin(new_uv.y * angle_offset) * 0.5 + 0.5, cos(new_uv.x * angle_offset) * 0.5 + 0.5);
			float d = distance(lattice + offset, _f);
			if(d < _res.x)
			{
				_res = vec3(d, offset.x, offset.y);
				output = _res.x;
				cells = _res.y;
			}
		}
	}
}