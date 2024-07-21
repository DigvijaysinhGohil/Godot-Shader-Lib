# Twirl node
Applies a twirl warping effect similar to a black hole to the value of input UV. Very similar to <b><i>[Swirl node](/documentation/Nodes/UV/Swirl.md)</b></i>, key difference is it uses the length of a vector.<br><br><i>Default value for uv input will be vec2(0, 0) for shader modes <i>PARTICLES</i>, <i>SKY</i> and <i>FOG</i> to avoid errors becouse UV variable is not available for these modes.</i>
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|UV|Input UV value|
|center|vec2|none|Center reference point|
|strength|float|none|Strength of the effect|
|offset|vec2|none|Individual channel offsets|

**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|None|Output UV value|

**ShaderInc location**
<br>`res://addons/ShaderLib/UV/UV.gdshaderinc`

**Method signature**
<br>`vec2 twirl_uv(vec2 uv, vec2 center, float strength, vec2 offset)`

**Parameters**
|Name|Type|Description|
|---|---|---|
|uv|vec2|Input uv|
|center|vec2|Center reference point|
|strength|float|Strength of the effect|
|offset|vec2|Individual channel offsets|
___