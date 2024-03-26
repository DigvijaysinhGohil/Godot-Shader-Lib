# Ray March node
A simple ray marcher.
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|signed distance|float|none|Signed distance calculated from Signed Distance Functions (SDFs)|
|ray origin|vec3|none|Ray origin|
|ray direction|vec3|none|Normalized ray direction|
|max steps|int|none|Maximum number steps for ray marching|
|max distance|float|none|Maximum distance to march along the <b><i>ray direction</i></b>|
|distance threshold|float|none|Threshold to check against <b><i>signed distance</i></b> to determine the ray intersection point.|
  
**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|distance|float|None|Output ray intersection distance|
___