# Checker Board node
Generates a checkerboard of alternating colors between inputs <b><i>color A</i></b> and <b><i>color B</i></b> based on input UV.
<hr>  

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|UV|Input UV value|
|color a|vec3|none|First checker color|
|color b|vec3|none|Second checker color|
|frequency|vec2|none|Scale of checkerboard per axis|
  
**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|output|vec3|None|Output checkerboard value|

**ShaderInc location**
<br>`res://addons/ShaderLib/Procedural/CheckerBoard.gdshaderinc`

**Method signature**
<br>`vec3 checker_board(vec2 uv, vec3 color_a, vec3 color_b, vec2 frequency)`

**Parameters**
|Name|Type|Description|
|---|---|---|
|uv|vec2|Input UV value|
|color a|vec3|First checker color|
|color b|vec3|Second checker color|
|frequency|vec2|Scale of checkerboard per axis|
___