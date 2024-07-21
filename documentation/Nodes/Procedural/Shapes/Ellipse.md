# Ellipse node
Generates an ellipse shape based on input UV at the size specified by inputs <b><i>width</i></b> and <b><i>height</i></b>. The generated shape can be offset or tiled by connecting a <b><i>[TilingAndOffset](/documentation/Nodes/UV/TilingAndOffset.md)</i></b> node. Note that in order to preserve the ability to offset the shape within the UV space the shape will not automatically repeat if tiled. To achieve a repeating dot effect first connect your <b><i>TilingAndOffset</i></b> output through a <b><i>Fract</i></b> node.
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|UV|Input UV value|
|width|float|none|Ellipse width|
|height|float|none|Ellipse height|
  
**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|output|float|None|Output ellipse value|

**ShaderInc location**
<br>`res://addons/ShaderLib/Procedural/Procedural.gdshaderinc`

**Method signature**
<br>`float ellipse_shape(vec2 uv, float width, float height)`

**Parameters**
|Name|Type|Description|
|---|---|---|
|uv|vec2|Input UV value|
|width|float|Ellipse width|
|height|float|Ellipse height|
___