vec2 flipbook_uv(vec2 uv, int rows, int columns, int start_frame, int end_frame, float anim_speed){
	start_frame += int(fract(TIME * anim_speed) * float(end_frame));
	float _frame = float(clamp(start_frame, 0, end_frame));
	vec2 _off_per_frame = vec2((1.0 / float(columns)), (1.0 / float(rows)));
	vec2 _sprite_size = vec2(uv.x / float(columns), uv.y / float(rows));
	vec2 _current_sprite = vec2(0.0, 1.0 - _off_per_frame.y);
	_current_sprite.x += _frame * _off_per_frame.x;
	float _row_index;
	float _mod = modf(_frame / float(columns), _row_index);
	_current_sprite.y -= _row_index * _off_per_frame.y;
	_current_sprite.x -= _row_index * float(columns) * _off_per_frame.x;
	vec2 _sprite_uv = (_sprite_size + _current_sprite);
	return _sprite_uv;
}