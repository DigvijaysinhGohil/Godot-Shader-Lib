# Parallax mapping node
The Parallax Mapping node lets you create a parallax effect that displaces a Material's UVs to create the illusion of depth inside a Material.<br><br><i>This node is only available in shader modes SPATIAL and CANVAS ITEM.<br><br>Default value for uv input will be vec2(0, 0) for shader modes <i>PARTICLES</i>, <i>SKY</i> and <i>FOG</i> to avoid errors becouse UV variable is not available for these modes.</i>
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|height map|sampler2D|none|Height map texture|
|amplitude|float|none|amplitude or depth of the effect|

**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|None|Output UV value|

**ShaderInc location**
<br>`res://addons/ShaderLib/UV/ParallaxMappingUV.gdshaderinc`

**Method signature**
<br>`vec2 parallax_mapping_uv(sampler2D height, float amplitude, vec2 uv, vec3 tangent, vec3 normal, vec3 binormal, vec3 view)`

**Parameters**
|Name|Type|Description|
|---|---|---|
|height|sampler2D|Height map texture|
|amplitude|float|amplitude or depth of the effect|
|uv|vec2|Input uv|
|tangent|vec3|Tangent vector|
|normal|vec3|Normal vector|
|binormal|vec3|Binormal vector|
|view|vec3|View vector|
___