# Replace Color node
Replaces values in input <b><i>in</i></b> equal to input <b><i>from</i></b> to the value of input <b><i>to</i></b>. Input <b><i>range</i></b> can be used to define a wider range of values around input <b><i>from</i></b> to replace. Input <b><i>fuzziness</i></b> can be used to soften the edges around the selection similar to anti-aliasing.
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|in|vec3|none|Input value|
|from|vec3|none|Color to replace|
|to|vec3|none|Color to replace with|
|range|float|none|Replace colors within this range from input <b><i>from</i></b>|
|fuzziness|float|none|Soften edges around selection|
  
**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|out|vec3|None|Output value|
___