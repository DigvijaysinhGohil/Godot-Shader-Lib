# Chebyshev Distance node
Returns the distance between two points using Chebyshev distance matrix.
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
|power|float|none|Power to use for Chebyshev distance|

**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|distance|float|None|Distance between 2 points|

**ShaderInc location**
<br>For 2D - `res://addons/ShaderLib/Maths/Vector/Distance/Chebyshev2D.gdshaderinc`
<br>For 3D - `res://addons/ShaderLib/Maths/Vector/Distance/Chebyshev3D.gdshaderinc`

**Method signature**
<br>For 2D - `float chebyshev_distance_2d(vec2 point1, vec2 point2, float power)`
<br>For 3D - `float chebyshev_distance_3d(vec3 point1, vec3 point2, float power)`

**Parameters for 2D**
|Name|Type|Description|
|---|---|---|
|point1|vec2|Point a|
|point2|vec2|Point b|
|power|float|Power for Chebyshev distance|

**Parameters for 3D**
|Name|Type|Description|
|---|---|---|
|point1|vec3|Point a|
|point2|vec3|Point b|
|power|float|Power for Chebyshev distance|
___