# Godot-Shader-Lib
Visual shader node library for Godot engine.

Adds various extra nodes to use in built-in visual shader editor.
## Installation
Copy the contents of **_addons/ShaderLib_** into the same folder in your project. No activation needed. Custom visual shader nodes work the same way as standart visual shader nodes.
## Uninstallation
Delete the contents of **_addons/ShaderLib_** folder from your project. Make sure to delete it using the Godot editor instead of your default file system program.
## Nodes documentation
### UV nodes
___
#### Flipbook uv node
Creates a flipbook, or texture sheet animation, of the UVs supplied to input UV. The amount of tiles on the sheet are defined by the values of the inputs **_rows_** and **_columns_**.
This node can be used to create a texture animation functionality, commonly used for particle effects and sprites, by supplying Time to the input Tile and outputting to the UV input slot of a Texture Sampler.

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
#### Radial Shear uv node
Applies a radial shear warping effect similar to a wave to the value of input UV.

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
