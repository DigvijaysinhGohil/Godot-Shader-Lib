# Manhattan Distance node
Returns the distance between two points using Manhattan distance matrix.
<hr>

**Controls**
|Options|Description|
|---|---|
|Vector2, Vector3|Vector type to use for calculation|

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|a|Dynamic vector|none|Point a|
|b|Dynamic vector|none|Point b|

**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|distance|float|None|Distance between 2 points|

**ShaderInc location**
<br>`res://addons/ShaderLib/Maths/Maths.gdshaderinc`

**Method signature**
<br>For 2D - `float manhattan_distance_2d(vec2 point1, vec2 point2)`
<br>For 3D - `float manhattan_distance_3d(vec3 point1, vec3 point2)`

**Parameters for 2D**
|Name|Type|Description|
|---|---|---|
|point1|vec2|Point a|
|point2|vec2|Point b|

**Parameters for 3D**
|Name|Type|Description|
|---|---|---|
|point1|vec3|Point a|
|point2|vec3|Point b|
___