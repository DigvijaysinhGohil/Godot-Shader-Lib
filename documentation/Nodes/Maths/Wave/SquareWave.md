# Square Wave node
Returns a square wave from the value of input <b><i>in</i></b>. Resulting output values will be between -1 and 1.
<hr>

**Controls**
|Options|Description|
|---|---|
|Vector1, Vector2, Vector3, Vector4|Vector type to use for calculation|

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|in|Dynamic vector|none|Input value|
  
**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|out|Dynamic vector|None|Output value|

**ShaderInc location**
<br>`res://addons/ShaderLib/Maths/Maths.gdshaderinc`

**Method signature**
<br>`vec4 square	_wave(vec4 input)`

**Parameters**
|Name|Type|Description|
|---|---|---|
|input|vec4|Input vector|
___