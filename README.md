# Godot-Shader-Lib
Visual shader node library for Godot engine. The addon supports Godot versions 4.x!

Adds various extra nodes to use in built-in visual shader editor.
# Installation
Copy the contents of **_addons/ShaderLib_** into the same folder in your project. No activation needed. Custom visual shader nodes work the same way as standard visual shader nodes.

If you don't immediatly see new nodes under **_Addons_** category, simply reload your project.
# Uninstallation
Delete the contents of **_addons/ShaderLib_** folder from your project. Make sure to delete it using the Godot editor instead of your default file system program.
# Nodes documentation
<details open>
<summary><h1>Geometry nodes</h1></summary>
<details>
<summary><h3>Node Scale World node</h3></summary>
Provides accees to node scale in world space.
<hr>

**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|scale|vec3|None|Node/object scale in world space|
___
</details>
</details>
<hr>
<details open>
<summary><h1>Maths nodes</h1></summary>
<details open>
<summary><h2>Wave</h2></summary>
<details>
<summary><h3>Noise Sine Wave node</h3></summary>
Returns the sine of the value of input <b><i>in</i></b>. For variance, psuedo-random noise is added to the amplitude of the sine wave, within a range determined by input <b><i>min max</i></b>.
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|in|Dynamic vector|none|Input value|
|min max|vec2|none|Minimum and Maximum values for noise intensity|
  
**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|out|Dynamic vector|None|Output value|
___
</details>
<details>
<summary><h3>Sawtooth Wave node</h3></summary>
Returns a sawtooth wave from the value of input <b><i>in</i></b>. Resulting output values will be between -1 and 1.
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|in|Dynamic vector|none|Input value|
  
**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|out|Dynamic vector|None|Output value|
___
</details>
<details>
<summary><h3>Square Wave node</h3></summary>
Returns a square wave from the value of input <b><i>in</i></b>. Resulting output values will be between -1 and 1.
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|in|Dynamic vector|none|Input value|
  
**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|out|Dynamic vector|None|Output value|
___
</details>
<details>
<summary><h3>Triangle Wave node</h3></summary>
Returns a triangle wave from the value of input <b><i>in</i></b>. Resulting output values will be between -1 and 1.
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|in|Dynamic vector|none|Input value|
  
**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|out|Dynamic vector|None|Output value|
___
</details>
</details>
</details>
<hr>
<details open>
<summary><h1>Procedural nodes</h1></summary>
<details>
<summary><h3>Checker Board node</h3></summary>
Generates a checkerboard of alternating colors between inputs <b><i>color A</i></b> and <b><i>color B</i></b> based on input UV.
<hr>  

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|UV|Input UV value|
|color a|vec3|none|First checker color|
|color b|vec3|none|Second checker color|
|frequency|vec2|none|Scale of checkerboard per axis|
  
**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|output|vec3|None|Output checkerboard value|
___
</details>
<details open>
<summary><h2>Noise</h2></summary>
<details>
<summary><h3>Gradient Noise node</h3></summary>
Generates a gradient, or Perlin noise based on input UV. The resulting <b><i>output</i></b> values will be between -1 and 1.
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|UV|Input UV value|
|scale|float|none|Noise scale|
  
**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|output|float|None|Output noise value|
___
</details>
<details>
<summary><h3>Pseudo Random Noise node</h3></summary>
Generates a pseudo random noise based on input seed. The resulting <b><i>output</i></b> values will be between 0 and 1.
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|seed|float|none|Input seed|
  
**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|output|float|None|Output noise value|
___
</details>
<details>
<summary><h3>Simple Noise node</h3></summary>
Generates a simplex, or value noise based on input UV. The resulting <b><i>output</i></b> values will be between 0 and 1.
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|UV|Input UV value|
|scale|float|none|Noise scale|
  
**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|output|float|None|Output noise value|
___
</details>
<details>
<summary><h3>Voronoi node</h3></summary>
Generates a Voronoi or Worley noise based on input UV. Voronoi noise is generated by calculating distances between a pixel and a lattice of points. By offsetting these points by a pseudo-random number, controlled by <b><i>angle offset</i></b>, a cluster of cells can be generated.
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|UV|Input UV value|
|cell density|float|none|Density of generated cells|
|angle offset|float|none|Offset values for points|
  
**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|output|float|None|Output noise value|
|cells|float|None|Raw cell data|
___
</details>
</details>
<details open>
<summary><h2>Shapes</h2></summary>
<details>
<summary><h3>Ellipse node</h3></summary>
Generates an ellipse shape based on input UV at the size specified by inputs <b><i>width</i></b> and <b><i>height</i></b>. The generated shape can be offset or tiled by connecting a <b><i>TilingAndOffset</i></b> node. Note that in order to preserve the ability to offset the shape within the UV space the shape will not automatically repeat if tiled. To achieve a repeating dot effect first connect your <b><i>TilingAndOffset</i></b> output through a <b><i>Fract</i></b> node.
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|UV|Input UV value|
|width|float|none|Ellipse width|
|height|float|none|Ellipse height|
  
**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|output|float|None|Output ellipse value|
___
</details>
<details>
<summary><h3>Polygon node</h3></summary>
Generates a regular polygon shape based on input UV at the size specified by inputs <b><i>width</i></b> and <b><i>height</i></b>. The polygon's amount of sides is determined by input <b><i>sides</i></b>. The generated shape can be offset or tiled by connecting a <b><i>TilingAndOffset</i></b> node. Note that in order to preserve the ability to offset the shape within the UV space the shape will not automatically repeat if tiled. To achieve a repeating polygon effect first connect your <b><i>TilingAndOffset</i></b> output through a <b><i>Fract</i></b> node.
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|UV|Input UV value|
|sides|int|none|Number of sides of the polygon|
|width|float|none|Polygon width|
|height|float|none|Polygon height|
  
**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|output|float|None|Output polygon value|
___
</details>
<details>
<summary><h3>Rectangle node</h3></summary>
Generates a rectangle shape based on input UV at the size specified by inputs <b><i>width</i></b> and <b><i>height</i></b>. The generated shape can be offset or tiled by connecting a <b><i>TilingAndOffset</i></b> node. Note that in order to preserve the ability to offset the shape within the UV space the shape will not automatically repeat if tiled. To achieve a repeating rectangle effect first connect your <b><i>TilingAndOffset</i></b> output through a <b><i>Fract</i></b> node.
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|UV|Input UV value|
|width|float|none|Rectangle width|
|height|float|none|Rectangle height|
  
**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|output|float|None|Output rectangle value|
___
</details>
<details>
<summary><h3>Rounded Polygon node</h3></summary>
Generates a rounded polygon shape based on input UV at the size specified by inputs <b><i>width</i></b> and <b><i>height</i></b>. The polygon's amount of sides is determined by input <b><i>sides</i></b>. The radius of each corner is defined by input <b><i>roundnesss</i></b>. The generated shape can be offset or tiled by connecting a <b><i>TilingAndOffset</i></b> node. Note that in order to preserve the ability to offset the shape within the UV space the shape will not automatically repeat if tiled. To achieve a repeating rounded polygon effect first connect your <b><i>TilingAndOffset</i></b> output through a <b><i>Fract</i></b> node.
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|UV|Input UV value|
|width|float|none|Rounded polygon width|
|height|float|none|Rounded polygon height|
|sides|int|none|Number of sides of the polygon|
|roundness|float|none|Corner radius|
  
**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|output|float|None|Output rounded polygon value|
___
</details>
<details>
<summary><h3>Rounded Rectangle node</h3></summary>
Generates a rounded rectangle shape based on input UV at the size specified by inputs <b><i>width</i></b> and <b><i>height</i></b>. The radius of each corner is defined by input <b><i>radius</i></b>. The generated shape can be offset or tiled by connecting a <b><i>TilingAndOffset</i></b> node. Note that in order to preserve the ability to offset the shape within the UV space the shape will not automatically repeat if tiled. To achieve a repeating rounded rectangle effect first connect your <b><i>TilingAndOffset</i></b> output through a <b><i>Fract</i></b> node.
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|UV|Input UV value|
|width|float|none|Rounded rectangle width|
|height|float|none|Rounded rectangle height|
|radius|float|none|Corner radius|
  
**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|output|float|None|Output rounded rectangle value|
___
</details>
</details>
</details>
<hr>
<details open>
<summary><h1>UV nodes</h1></summary>
Default value for uv input will be vec2(0, 0) for shader modes <i>PARTICLES</i>, <i>SKY</i> and <i>FOG</i> to avoid errors becouse UV variable is not available for these modes.
<details>
<summary><h3>Flipbook node</h3></summary>
Creates a flipbook, or texture sheet animation, of the UVs supplied to input UV. The amount of tiles on the sheet are defined by the values of the inputs <b><i>rows</i></b> and <b><i>columns</i></b>.
This node can be used to create a texture animation functionality, commonly used for particle effects and sprites.<br><br><i>This node is only available in shader modes SPATIAL and CANVAS ITEM.</i>
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|UV|Input UV value|
|rows|int|none|Amount of horizontal tiles in texture sheet|
|columns|int|none|Amount of vertical tiles in texture sheet|
|start frame|int|none|Start tile index texture sheet|
|end frame|int|none|End tile index texture sheet|
|anim speed|float|none|Animation speed|

**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|None|Output UV value|
___
</details>
<details>
<summary><h3>Parallax mapping node</h3></summary>
The Parallax Mapping node lets you create a parallax effect that displaces a Material's UVs to create the illusion of depth inside a Material.<br><br><i>This node is only available in shader modes SPATIAL and CANVAS ITEM.</i>
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|height map|sampler2D|none|Height map texture|
|amplitude|float|none|amplitude or depth of the effect|

**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|None|Output UV value|
___
</details>
<details>
<summary><h3>Radial Shear node</h3></summary>
Applies a radial shear warping effect similar to a wave to the value of input UV.
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|UV|Input UV value|
|center|vec2|none|Center reference point|
|strength|float|none|Strength of the effect|
|offset|vec2|none|Individual channel offsets|

**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|None|Output UV value|
___
</details>
<details>
<summary><h3>Rotate node</h3></summary>
Rotates value of input UV around a reference point defined by input <b><i>center</i></b> by the amount of input <b><i>rotation</i></b>.
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|UV|Input UV value|
|center|vec2|none|Center reference point|
|rotation|float|none|Rotation amount in radians|
|use degrees|bool|none|Use degrees instead of radians for <b><i>rotation</i></b> amount|

**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|None|Output UV value|
___
</details>
<details>
<summary><h3>Spherize node</h3></summary>
Applies a spherical warping effect similar to a fisheye camera lens to the value of input UV.
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|UV|Input UV value|
|center|vec2|none|Center reference point|
|strength|float|none|Strength of the effect|
|offset|vec2|none|Individual channel offsets|

**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|None|Output UV value|
___
</details>
<details>
<summary><h3>Swirl node</h3></summary>
Applies a swirl warping effect similar to a black hole to the value of input UV. Very similar to <b><i>Twirl node</b></i>, key difference is it uses the inverse of vector length (One minus).
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|UV|Input UV value|
|center|vec2|none|Center reference point|
|strength|float|none|Strength of the effect|
|offset|vec2|none|Individual channel offsets|

**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|None|Output UV value|
___
</details>
<details>
<summary><h3>Tiling and Offset node</h3></summary>
Tiles and offsets the value of input UV by the inputs <b><i>tiling</i></b> and <b><i>offset</i></b> respectively. This is commonly used for detail maps and scrolling textures over TIME.
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|UV|Input UV value|
|tiling|vec2|none|Amount of tiling to apply per channel|
|offset|vec2|none|Amount of offset to apply per channel|

**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|None|Output UV value|
___
</details>
<details>
<summary><h3>Twirl node</h3></summary>
Applies a twirl warping effect similar to a black hole to the value of input UV. Very similar to <b><i>Swirl node</b></i>, key difference is it uses the length of a vector.
<hr>

**Inputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|UV|Input UV value|
|center|vec2|none|Center reference point|
|strength|float|none|Strength of the effect|
|offset|vec2|none|Individual channel offsets|

**Outputs**
|Name|Type|Binding|Description|
|---|---|---|---|
|uv|vec2|None|Output UV value|
___
</details>
</details>