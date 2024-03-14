# Hue node
Offsets the hue of input <b><i>in</i></b> by the amount of input <b><i>offset</i></b>. The unit of the offset can be set with the parameter <b><i>Range</i></b>. Offset in <b><i>Degrees</i></b> is in the range -180 to 180. In <b><i>Normalize</b></i> it is -1 to 1.
<hr>

**Controls**
|Name|Options|Description|
|---|---|---|
|Range|Degrees, Normalize|The unit used for the input offset|

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|in|vec3|none|Input value|
|offset|float|none|Amount to offset hue|
  
**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|out|vec3|None|Output value|
___