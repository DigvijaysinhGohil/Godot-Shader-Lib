# Swirl node
Applies a swirl warping effect similar to a black hole to the value of input UV. Very similar to <b><i>[Twirl node](/documentation/Nodes/UV/Twirl.md)</b></i>, key difference is it uses the inverse of vector length (One minus).<br><br><i>Default value for uv input will be vec2(0, 0) for shader modes <i>PARTICLES</i>, <i>SKY</i> and <i>FOG</i> to avoid errors becouse UV variable is not available for these modes.</i>
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
___