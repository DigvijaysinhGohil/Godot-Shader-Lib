float rectangle_shape(vec2 uv, float width, float height){
    vec2 _distance = abs(uv * 2.0 - 1.0) - vec2(width, height);
    _distance = 1.0 - _distance / fwidth(_distance);
    return clamp(min(_distance.x, _distance.y), 0.0, 1.0);
}