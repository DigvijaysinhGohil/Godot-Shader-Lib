# Gradient Noise node
Generates a gradient, or Perlin noise based on input UV. The resulting <b><i>output</i></b> values will be between -1 and 1.
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|UV|Input UV value|
|scale|float|none|Noise scale|
  
**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|output|float|None|Output noise value|

**ShaderInc location**
<br>`res://addons/ShaderLib/Procedural/Noise/GradientNoise.gdshaderinc`

**Method signature**
<br>`float gradient_noise(vec2 uv, float scale)`

**Parameters**
|Name|Type|Description|
|---|---|---|
|uv|vec2|Input UV value|
|scale|float|Noise scale|
___