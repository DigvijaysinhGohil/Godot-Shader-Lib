# Saturation node
Adjusts the saturation of input <b><i>in</i></b> by the amount of input <b><i>saturation</i></b>. A Saturation value of 1 will return the input unaltered. A Saturation value of 0 will return the input completely desaturated.
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|in|vec3|none|Input value|
|saturation|float|none|Saturation value|
  
**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|out|vec3|None|Output value|

**ShaderInc location**
<br>`res://addons/ShaderLib/Artistic/Artistic.gdshaderinc`

**Method signature**
<br>`vec3 saturation(input, saturation)`

**Parameters**
|Name|Type|Description|
|---|---|---|
|input|vec3|Input color|
|saturation|float|Saturation value|
___