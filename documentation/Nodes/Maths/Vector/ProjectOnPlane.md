# Project On Plane node
Projects a vector onto a plane defined by a normal orthogonal to the plane.
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|vector|vector3|none|Vector to project|
|plane normal|vector3|none|Normal orthogonal of the plane|

**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|vector|vector3|None|Output vector|

**ShaderInc location**
<br>`res://addons/ShaderLib/Maths/Vector/ProjectOnPlane.gdshaderinc`

**Method signature**
<br>`vec3 project_on_plane(vec3 vector, vec3 plane_normal)`

**Parameters**
|Name|Type|Description|
|---|---|---|
|vector|vec3|Input vector|
|plane_normal|vec3|Normal vector to the plane|
___