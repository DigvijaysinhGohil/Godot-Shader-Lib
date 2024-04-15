# Rounded Rectangle node
Generates a rounded rectangle shape based on input UV at the size specified by inputs <b><i>width</i></b> and <b><i>height</i></b>. The radius of each corner is defined by input <b><i>radius</i></b>. The generated shape can be offset or tiled by connecting a <b><i>[TilingAndOffset](/documentation/Nodes/UV/TilingAndOffset.md)</i></b> node. Note that in order to preserve the ability to offset the shape within the UV space the shape will not automatically repeat if tiled. To achieve a repeating rounded rectangle effect first connect your <b><i>TilingAndOffset</i></b> output through a <b><i>Fract</i></b> node.
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|UV|Input UV value|
|width|float|none|Rounded rectangle width|
|height|float|none|Rounded rectangle height|
|radius|float|none|Corner radius|
  
**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|output|float|None|Output rounded rectangle value|

**ShaderInc location**
<br>`res://addons/ShaderLib/Procedural/Shapes/RoundedRectangle.gdshaderinc`

**Method signature**
<br>`float rounded_rectangle_shape(vec2 uv, float width, float height, float radius)`

**Parameters**
|Name|Type|Description|
|---|---|---|
|uv|vec2|Input UV value|
|width|float|Rectangle width|
|height|float|Rectangle height|
|radius|float|Corner radius|
___