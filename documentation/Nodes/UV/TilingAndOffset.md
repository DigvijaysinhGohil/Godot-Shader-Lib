# Tiling and Offset node
Tiles and offsets the value of input UV by the inputs <b><i>tiling</i></b> and <b><i>offset</i></b> respectively. This is commonly used for detail maps and scrolling textures over TIME.<br><br><i>Default value for uv input will be vec2(0, 0) for shader modes <i>PARTICLES</i>, <i>SKY</i> and <i>FOG</i> to avoid errors becouse UV variable is not available for these modes.</i>
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|UV|Input UV value|
|tiling|vec2|none|Amount of tiling to apply per channel|
|offset|vec2|none|Amount of offset to apply per channel|

**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|None|Output UV value|
___