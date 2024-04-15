# Rotate node
Rotates value of input UV around a reference point defined by input <b><i>center</i></b> by the amount of input <b><i>rotation</i></b>.<br><br><i>Default value for uv input will be vec2(0, 0) for shader modes <i>PARTICLES</i>, <i>SKY</i> and <i>FOG</i> to avoid errors becouse UV variable is not available for these modes.</i>
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|UV|Input UV value|
|center|vec2|none|Center reference point|
|rotation|float|none|Rotation amount|

**Controls**
|Name|Options|Description|
|---|---|---|
|Units|Degrees, Radians|Specifies the unit for <i><b>rotation</b></i> input|

**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|None|Output UV value|

**ShaderInc location**
<br>`res://addons/ShaderLib/UV/RotateUV.gdshaderinc`

**Method signature**
<br>`vec2 rotate_uv(vec2 uv, vec2 center, float rotation, bool use_degrees)`

**Parameters**
|Name|Type|Description|
|---|---|---|
|uv|vec2|Input uv|
|center|vec2|Center reference point|
|rotation|float|Rotation amount|
|use_degrees|bool|Specifies the unit for rotation, true = Degrees, false = Radians|
___