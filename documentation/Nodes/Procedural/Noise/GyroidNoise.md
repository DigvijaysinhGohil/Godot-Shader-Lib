# Gyroid Noise node
Generates a gyroid noise based on input UV. The resulting <b><i>output</i></b> values will be between 0 and 1.
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|UV|Input UV value|
|scale|float|none|Noise scale|
|ratio|vec2|none|Noise ratio for X and Y Axes|
|height|float|none|Noise height|
|thickness|float|none|Noise thickness, clamped between 0 and 1|
  
**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|output|float|None|Output noise value|

**ShaderInc location**
<br>`res://addons/ShaderLib/Procedural/Procedural.gdshaderinc`

**Method signature**
<br>`float gyroid_noise(vec2 uv, float scale, vec2 ratio, float height, float thickness)`

**Parameters**
|Name|Type|Description|
|---|---|---|
|uv|vec2|Input UV value|
|scale|float|Noise scale|
|ratio|vec2|Noise ratio for X and Y axes|
|height|float|Noise height|
|thickness|float|Noise thickness, clamped between 0 and 1|
___