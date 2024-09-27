# Installation
Hit download as zip button in the git repo. Copy the contents of **_addons/ShaderLib_** into the same folder in your project. No activation needed. Custom visual shader nodes work the same way as standard visual shader nodes.

If you don't immediatly see new nodes under **_Addons_** category, simply reload your project.
# Uninstallation
Delete the contents of **_addons/ShaderLib_** folder from your project. Make sure to delete it using the Godot editor instead of your default file system program.
# Special Note
Even if you don't use visual shader, you can still use this addon for writing your custom shaders.

For example if you want to rotate UV in your **_.gdshader_** file, you can use `rotate_uv()` of this addon using `#include` keyword as following.
`#include "res://addons/ShaderLib/UV/RotateUV.gdshaderinc"`
# Available Nodes
<h2>Artistic nodes</h2>

<h3>&emsp;Adjustment</h3>

<h4><a href="/documentation/Nodes/Artistic/Adjustment/ContrastNode.md">&emsp;&emsp;Contrast node</a></h4>
<h4><a href="/documentation/Nodes/Artistic/Adjustment/HueNode.md">&emsp;&emsp;Hue node</a></h4>
<h4><a href="/documentation/Nodes/Artistic/Adjustment/ReplaceColorNode.md">&emsp;&emsp;Replace Color node</a></h4>
<h4><a href="/documentation/Nodes/Artistic/Adjustment/SaturationNode.md">&emsp;&emsp;Saturation node</a></h4>
<h4><a href="/documentation/Nodes/Artistic/Adjustment/WhiteBalanceNode.md">&emsp;&emsp;White Balance node</a></h4>

<h3>&emsp;Mask</h3>

<h4><a href="/documentation/Nodes/Artistic/Mask/ColorMaskNode.md">&emsp;&emsp;Color Mask node</a></h4>

<h2>Geometry nodes</h2>

<h4><a href="/documentation/Nodes/Geometry/Mesh.md">&emsp;Mesh node</a></h4>

<h2>Maths nodes</h2>

<h3>&emsp;Scalar</h3>

<h4><a href="/documentation/Nodes/Maths/Scalar/SmoothMax.md">&emsp;&emsp;SmoothMax node</a></h4>
<h4><a href="/documentation/Nodes/Maths/Scalar/SmoothMin.md">&emsp;&emsp;SmoothMin node</a></h4>

<h3>&emsp;Vector</h3>

<h3>&emsp;&emsp;Distance</h3>

<h4><a href="/documentation/Nodes/Maths/Vector/Distance/ChebyshevDistance.md">&emsp;&emsp;&emsp;Chebyshev Distance node</a></h4>
<h4><a href="/documentation/Nodes/Maths/Vector/Distance/ManhattanDistance.md">&emsp;&emsp;&emsp;Manhattan Distance node</a></h4>

<h4><a href="/documentation/Nodes/Maths/Vector/Project.md">&emsp;&emsp;Project node</a></h4>
<h4><a href="/documentation/Nodes/Maths/Vector/ProjectOnPlane.md">&emsp;&emsp;Project On Plane node</a></h4>
<h4><a href="/documentation/Nodes/Maths/Vector/VectorTransform.md">&emsp;&emsp;Vector Transform node</a></h4>

<h3>&emsp;Wave</h3>

<h4><a href="/documentation/Nodes/Maths/Wave/NoiseSineWave.md">&emsp;&emsp;Noise Sine Wave node</a></h4>
<h4><a href="/documentation/Nodes/Maths/Wave/SawtoothWave.md">&emsp;&emsp;Sawtooth Wave node</a></h4>
<h4><a href="/documentation/Nodes/Maths/Wave/SquareWave.md">&emsp;&emsp;Square Wave node</a></h4>
<h4><a href="/documentation/Nodes/Maths/Wave/TriangleWave.md">&emsp;&emsp;Triangle Wave node</a></h4>

<h2>Procedural nodes</h2>

<h4><a href="/documentation/Nodes/Procedural/CheckerBoard.md">&emsp;Checker Board node</a></h4>
<h4><a href="/documentation/Nodes/Procedural/HeightToNormal.md">&emsp;Height To Normal node</a></h4>

<h3>&emsp;Fractals</h3>

<h4><a href="/documentation/Nodes/Procedural/Fractals/KochFractal.md">&emsp;&emsp;Koch Fractal node</a></h4>

<h3>&emsp;Noise</h3>

<h4><a href="/documentation/Nodes/Procedural/Noise/GradientNoise.md">&emsp;&emsp;Gradient Noise node</a></h4>
<h4><a href="/documentation/Nodes/Procedural/Noise/GyroidNoise.md">&emsp;&emsp;Gyroid Noise node</a></h4>
<h4><a href="/documentation/Nodes/Procedural/Noise/PseudoRandomNoise.md">&emsp;&emsp;Pseudo Random Noise node</a></h4>
<h4><a href="/documentation/Nodes/Procedural/Noise/SimpleNoise.md">&emsp;&emsp;Simple Noise node</a></h4>
<h4><a href="/documentation/Nodes/Procedural/Noise/Voronoi.md">&emsp;&emsp;Voronoi node</a></h4>

<h3>&emsp;Shapes</h3>

<h4><a href="/documentation/Nodes/Procedural/Shapes/Ellipse.md">&emsp;&emsp;Ellipse node</a></h4>
<h4><a href="/documentation/Nodes/Procedural/Shapes/Polygon.md">&emsp;&emsp;Polygon node</a></h4>
<h4><a href="/documentation/Nodes/Procedural/Shapes/Rectangle.md">&emsp;&emsp;Rectangle node</a></h4>
<h4><a href="/documentation/Nodes/Procedural/Shapes/RoundedPolygon.md">&emsp;&emsp;Rounded Polygon node</a></h4>
<h4><a href="/documentation/Nodes/Procedural/Shapes/RoundedRectangle.md">&emsp;&emsp;Rounded Rectangle node</a></h4>

<h2>Ray marching nodes</h2>

<h4><a href="/documentation/Nodes/RayMarching/RayMarch.md">&emsp;Ray March node</a></h4>

<h2>UV nodes</h2>

<h4><a href="/documentation/Nodes/UV/Flipbook.md">&emsp;Flipbook node</a></h4>
<h4><a href="/documentation/Nodes/UV/ParallaxMapping.md">&emsp;Parallax Mapping node</a></h4>
<h4><a href="/documentation/Nodes/UV/RadialShear.md">&emsp;Radial Shear node</a></h4>
<h4><a href="/documentation/Nodes/UV/Rotate.md">&emsp;Rotate node</a></h4>
<h4><a href="/documentation/Nodes/UV/Spherize.md">&emsp;Spherize node</a></h4>
<h4><a href="/documentation/Nodes/UV/Swirl.md">&emsp;Swirl node</a></h4>
<h4><a href="/documentation/Nodes/UV/TilingAndOffset.md">&emsp;Tiling and Offset node</a></h4>
<h4><a href="/documentation/Nodes/UV/Twirl.md">&emsp;Twirl node</a></h4>