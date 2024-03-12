# Color Mask node
Creates a mask from values in input <b><i>in</i></b> equal to input <b><i>mask color</i></b>. Input <b><i>range</i></b> can be used to define a wider range of values around input <b><i>mask color</i></b> to create the mask. Colors within this range will return 1, otherwise the node will return 0. Input <b><i>fuzziness</i></b> can be used to soften the edges around the selection similar to anti-aliasing.
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|in|vec3|none|Input value|
|color mask|vec3|none|Color to use for mask|
|range|float|none|Select colors within this range from input <b><i>mask color</i></b>|
|fuzziness|float|none|Feather edges around selection. Higher values result in a softer selection mask.|
  
**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|out|vec3|None|Output mask value|
___