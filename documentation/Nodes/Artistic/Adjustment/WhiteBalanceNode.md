# White Balance node
Adjusts the temperature and tint of input <b><i>in</i></b> by the amount of inputs <b><i>temperature</i></b> and <b><i>tint</i></b> respectively. Temperature has the effect of shifting the values towards yellow or blue. Tint has the effect of shifting towards pink or green.
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|in|vec3|none|Input value|
|temperature|float|none|Temperature offset value|
|tint|float|none|Tint offset value|
  
**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|out|vec3|None|Output value|

**ShaderInc location**
<br>`res://addons/ShaderLib/Artistic/Adjustment/WhiteBalance.gdshaderinc`

**Method signature**
<br>`vec3 white_balance(input, temperature, tint)`

**Parameters**
|Name|Type|Description|
|---|---|---|
|input|vec3|Input color|
|temperature|float|Temperature offset value|
|tint|float|Tint offset value|
___