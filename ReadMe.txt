Magnifying effect is designed as a fullscreen postprocess effect.
The shader has two exposed input parameters.
  1. _CenterRadial ( Vector4 )
     xy component means the center position of the magnifying glass.
	 zw component means the radial length of the magnifying glass. 
	 
  2. _Amount ( float )
     means the intensity of magnifying effect.

The script "MagnifyingGlass.cs" is a camera script for demonstrate effect.
It implements a tiny UI so you can tweak the effect through it, and make the magnifying glass follow our mouse when you press left button.

  Implement rectangular magnifying glass effect !
  The script "MagnifyingGlassQuad.cs" is the rectangular magnifying glass behaviour.
  Try demo "DemoQuadGlass.unity" to see the effect.

  Implement volumetric sphere magnifying glass effect !
  The script "MagnifyingGlassVolumetricSphere.cs" and shader "Magnifying Glass/Volumetric Sphere" are the new magic.
  Try demo "DemoVolumetricSphereGlass.unity" to see the effect.

  Separated dark / bright color.
