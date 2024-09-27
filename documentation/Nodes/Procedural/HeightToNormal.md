# Height To Normal node
Generates a normal map from a height map.
<hr>  

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|height map|sampler2D|none|Height map|
|uv|vec2|UV|Input UV value|
|bump strength|float|none|Bump strength for the height|
  
**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|Normal|vec3|None|Normal map|

**ShaderInc location**
<br>`res://addons/ShaderLib/Procedural/Procedural.gdshaderinc`

**Method signature**
<br>`vec3 heigth_to_normal(sampler2D height_map, vec2 uv, float bump_strength)`

**Parameters**
|Name|Type|Description|
|---|---|---|
|height_map|sampler2D|Height map|
|uv|vec2|Input UV value|
|bump_strength|float|Bump strength for the height|
___