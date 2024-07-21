# Contrast node
Adjusts the contrast of input <b><i>in</i></b> by the amount of input <b><i>contrast</i></b>. A contrast value of 1 will return the input unaltered. A contrast value of 0 will return the midpoint of the input.
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|in|vec3|none|Input value|
|contrast|float|none|Contrast value|
  
**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|out|vec3|None|Output value|

**ShaderInc location**
<br>`res://addons/ShaderLib/Artistic/Artistic.gdshaderinc`

**Method signature**
<br>`vec3 contrast(input, contrast)`

**Parameters**
|Name|Type|Description|
|---|---|---|
|input|vec3|Input color|
|contrast|float|contrast value|
___