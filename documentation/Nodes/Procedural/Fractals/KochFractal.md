# Koch Fractal node
Generates an koch curve similar to ice fractal shape based on input UV at the size specified by inputs <b><i>width</i></b> and <b><i>height</i></b>. The generated shape can be offset or tiled by connecting a <b><i>[TilingAndOffset](/documentation/Nodes/UV/TilingAndOffset.md)</i></b> node. Note that in order to preserve the ability to offset the shape within the UV space the shape will not automatically repeat if tiled. To achieve a repeating effect first connect your <b><i>TilingAndOffset</i></b> output through a <b><i>Fract</i></b> node.
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|UV|Input UV value|
|thickness|float|none|Shape outline thickness|
|iterations|int|none|Number of steps to repeat the fractal shape|
|width|float|none|Fractal width|
|height|float|none|Fractal height|
  
**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|out|float|None|Output fractal value|
|uv|vec2|None|Output UV value|

**ShaderInc location**
<br>`res://addons/ShaderLib/Procedural/Procedural.gdshaderinc`

**Method signature**
<br>`float koch_fractal(vec2 uv, float outline, int iteration, float shape_width, float shape_height, out vec2 koch_uv)`

**Parameters**
|Name|Type|Description|
|---|---|---|
|uv|vec2|Input UV value|
|outline|float|Shape outline thickness|
|iterations|int|Number of steps to repeat the fractal shape|
|shape_width|float|Fractal width|
|shape_height|float|Fractal height|
|koch_uv|out vec2|Returns Koch fractal UV|
___