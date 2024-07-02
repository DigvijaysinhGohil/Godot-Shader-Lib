# Project node
Projects <i><b>vector A</b></i> onto <i><b>vector B</b></i>.
<hr>

**Controls**
|Options|Description|
|---|---|
|Vector2, Vector3|Vector type to use for calculation|

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|vector A|Dynamic vector|none|Vector to project|
|vector B|Dynamic vector|none|Vector on which vector A will be projected|

**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|vector|vector3|None|Output vector|

**ShaderInc location**
<br>`res://addons/ShaderLib/Maths/Vector/Project.gdshaderinc`

**Method signature**
<br>`vec2 project_2d(vec2 a, vec2 b)`
<br>`vec3 project_3d(vec3 a, vec3 b)`

**Parameters for 2D**
|Name|Type|Description|
|---|---|---|
|a|vec2|Vector A|
|b|vec2|Vector B|

**Parameters for 3D**
|Name|Type|Description|
|---|---|---|
|a|vec3|Vector A|
|b|vec3|Vector B|
___