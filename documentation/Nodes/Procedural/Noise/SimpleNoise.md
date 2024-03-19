# Simple Noise node
Generates a simplex, or value noise based on input UV. The resulting <b><i>output</i></b> values will be between 0 and 1.
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|UV|Input UV value|
|scale|float|none|Noise scale|
|octaves|int|none|Octaves/Layers of noise, <b><i>octaves</i></b> input is clamped between 1 and 6.|
  
**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|output|float|None|Output noise value|
___