# Noise Sine Wave node
Returns the sine of the value of input <b><i>in</i></b>. For variance, psuedo-random noise is added to the amplitude of the sine wave, within a range determined by input <b><i>min max</i></b>.
<hr>

**Controls**
|Options|Description|
|---|---|
|Vector1, Vector2, Vector3, Vector4|Vector type to use for calculation|

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|in|Dynamic vector|none|Input value|
|min max|vec2|none|Minimum and Maximum values for noise intensity|
  
**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|out|Dynamic vector|None|Output value|

**ShaderInc location**
<br>`res://addons/ShaderLib/Maths/Wave/NoiseSineWave.gdshaderinc`

**Method signature**
<br>`vec4 noise_sine_wave(vec4 input, vec2 min_max)`

**Parameters**
|Name|Type|Description|
|---|---|---|
|input|vec4|Input vector|
|min_max|vec2|Minimum and Maximum values for noise intensity|
___