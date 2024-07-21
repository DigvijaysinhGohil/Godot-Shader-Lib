# SmoothMax node
Returns the maximum value between A and B, but smooths out the intersections of A and B based on T. T is the smoothing value. If 0 is passed at T, function will act as a standard max(), if negative value is passed it will act as <b><i>[SmoothMin node](/documentation/Nodes/Maths/Scalar/SmoothMin.md)</b></i>.
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|a|float|none|Input A|
|b|float|none|Input B|
|t|float|none|Smoothing input|

**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|op|float|None|Smooth maximum between A and B|

**ShaderInc location**
<br>`res://addons/ShaderLib/Maths/Maths.gdshaderinc`

**Method signature**
<br>`float smoothmax(float a, float b, float t)`

**Parameters**
|Name|Type|Description|
|---|---|---|
|a|float|Input A|
|b|float|Input B|
|t|float|Smoothing input|
___