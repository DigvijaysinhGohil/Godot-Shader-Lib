# Mesh node
Provides accees to node's position and scale in world space.
<hr>

**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|position|vec3|None|Node/object position in world space|
|scale|vec3|None|Node/object scale in world space|

**ShaderInc location**
<br>`res://addons/ShaderLib/Geometry/Geometry.gdshaderinc`

**Method signature**
<br>`vec3 geometry_node_scale_world(mat4 model_matrix)`

**Parameters**
|Name|Type|Description|
|---|---|---|
|model_matrix|mat4|Model matrix of the mesh|
___