# Vector Transform node
Returns the transformed vector of the input value <i><b>in</b></i> from one coordinate space to another.<br><br><i>This node is only available in shader mode SPATIAL.</i>
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|in|vector3|none|Input vector|

**Controls**
|Name|Options|Description|
|---|---|---|
|Vector type|Positional, Directional|Positional will take into account translation data, Directional won't|
|From|Local, World, View, Screen, Tangent|Coordinate space from which you want to transform the input vector|
|To|Local, World, View, Screen, Tangent|Coordinate space to which you want to transform the input vector|
  
**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|out|vector3|None|Output vector|
___