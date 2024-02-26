# Flipbook node
Creates a flipbook, or texture sheet animation, of the UVs supplied to input UV. The amount of tiles on the sheet are defined by the values of the inputs <b><i>rows</i></b> and <b><i>columns</i></b>.
This node can be used to create a texture animation functionality, commonly used for particle effects and sprites. Animation frames will go from top left to bottom right.<br><br><i>This node is only available in shader modes SPATIAL and CANVAS ITEM.<br><br>Default value for uv input will be vec2(0, 0) for shader modes <i>PARTICLES</i>, <i>SKY</i> and <i>FOG</i> to avoid errors becouse UV variable is not available for these modes.</i>
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|UV|Input UV value|
|rows|int|none|Amount of horizontal tiles in texture sheet|
|columns|int|none|Amount of vertical tiles in texture sheet|
|anim speed|float|none|Animation speed|

**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|None|Output UV value|
___