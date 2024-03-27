# Gyroid Noise node
Generates a gyroid noise based on input UV. The resulting <b><i>output</i></b> values will be between 0 and 1.
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|UV|Input UV value|
|scale|float|none|Noise scale|
|ratio|vec2|none|Noise ratio for X and Y Axes|
|height|float|none|Noise height|
|thickness|float|none|Noise thickness, clamped between 0 and 1|
  
**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|output|float|None|Output noise value|
___