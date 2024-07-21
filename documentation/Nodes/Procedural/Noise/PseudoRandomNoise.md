# Pseudo Random Noise node
Generates a pseudo random noise based on input seed. The resulting <b><i>output</i></b> values will be between 0 and 1.
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|seed|float|none|Input seed|
  
**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|output|float|None|Output noise value|

**ShaderInc location**
<br>`res://addons/ShaderLib/Procedural/Procedural.gdshaderinc`

**Method signature**
<br>`float pseudo_random_noise(vec2 uv, float seed)`

**Parameters**
|Name|Type|Description|
|---|---|---|
|uv|vec2|Input UV value|
|seed|float|Noise seed|
___