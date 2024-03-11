# Ellipse node
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
|output|float|None|Output ellipse value|
___