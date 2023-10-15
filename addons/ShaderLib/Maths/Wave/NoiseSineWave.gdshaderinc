vec4 noise_sine_wave(vec4 input, vec2 min_max)
{
    vec4 _sin_in = sin(input);
    vec4 _sin_in_offset = sin(input + 1.0);
    vec4 _random_number =  fract(sin((_sin_in - _sin_in_offset) * (12.9898 + 78.233))*43758.5453);
    float _noise = mix(min_max.x, min_max.y, _random_number.x);
    return _sin_in + vec4(_noise);
}