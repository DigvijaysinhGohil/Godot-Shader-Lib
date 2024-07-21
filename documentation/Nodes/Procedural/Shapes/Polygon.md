# Polygon node
Generates a regular polygon shape based on input UV at the size specified by inputs <b><i>width</i></b> and <b><i>height</i></b>. The polygon's amount of sides is determined by input <b><i>sides</i></b>. The generated shape can be offset or tiled by connecting a <b><i>[TilingAndOffset](/documentation/Nodes/UV/TilingAndOffset.md)</i></b> node. Note that in order to preserve the ability to offset the shape within the UV space the shape will not automatically repeat if tiled. To achieve a repeating polygon effect first connect your <b><i>TilingAndOffset</i></b> output through a <b><i>Fract</i></b> node.
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|UV|Input UV value|
|sides|int|none|Number of sides of the polygon|
|width|float|none|Polygon width|
|height|float|none|Polygon height|
  
**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|output|float|None|Output polygon value|

**ShaderInc location**
<br>`res://addons/ShaderLib/Procedural/Procedural.gdshaderinc`

**Method signature**
<br>`float polygon_shape(vec2 uv, int sides, float width, float height)`

**Parameters**
|Name|Type|Description|
|---|---|---|
|uv|vec2|Input UV value|
|sides|int|Number of sides of the polygon|
|width|float|Polygon width|
|height|float|Polygon height|
___