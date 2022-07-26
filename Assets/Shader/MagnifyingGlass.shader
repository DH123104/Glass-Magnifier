Shader "Magnifying Glass/Circle" {
	Properties {
		[HideInInspector] _MainTex ("Main", 2D) = "white" {}
		_SimpleDarkColor     ("Dark Color", Color) = (0.2, 0.2, 0.2, 1)
		_SimpleBrightColor   ("Bright Color", Color) = (1, 1, 1, 1)
		_SimpleFadingEdge    ("Fading Edge", Range(0, 0.1)) = 0.05
		_SimpleCenterRadial1 ("Center Radial 1", Vector) = (0, 0, 0, 0)
		_SimpleAmount1       ("Amount 1", Float) = 0.5
		_SimpleCenterRadial2 ("Center Radial 2", Vector) = (0, 0, 0, 0)
		_SimpleAmount2       ("Amount 2", Float) = 0.5
		_SimpleCenterRadial3 ("Center Radial 3", Vector) = (0, 0, 0, 0)
		_SimpleAmount3       ("Amount 3", Float) = 0.5
		_SimpleCenterRadial4 ("Center Radial 4", Vector) = (0, 0, 0, 0)
		_SimpleAmount4       ("Amount 4", Float) = 0.5
		_SimpleCenterRadial5 ("Center Radial 5", Vector) = (0, 0, 0, 0)
		_SimpleAmount5       ("Amount 5", Float) = 0.5
		_SimpleCenterRadial6 ("Center Radial 6", Vector) = (0, 0, 0, 0)
		_SimpleAmount6       ("Amount 6", Float) = 0.5
		_SimpleCenterRadial7 ("Center Radial 7", Vector) = (0, 0, 0, 0)
		_SimpleAmount7       ("Amount 7", Float) = 0.5
		_SimpleCenterRadial8 ("Center Radial 8", Vector) = (0, 0, 0, 0)
		_SimpleAmount8       ("Amount 8", Float) = 0.5
		
		_ComplicatedCenterRadial1 ("Complicated Center Radial 1", Vector) = (0, 0, 0, 0)
		_ComplicatedAmount1       ("Complicated Amount 1", Float) = 0.85
		_ComplicatedRadiusInner1  ("Complicated Radius Inner 1", Float) = 0.2
		_ComplicatedRadiusOuter1  ("Complicated Radius Outer 1", Float) = 0.27
		_ComplicatedCenterRadial2 ("Complicated Center Radial 2", Vector) = (0, 0, 0, 0)
		_ComplicatedAmount2       ("Complicated Amount 2", Float) = 0.85
		_ComplicatedRadiusInner2  ("Complicated Radius Inner 2", Float) = 0.2
		_ComplicatedRadiusOuter2  ("Complicated Radius Outer 2", Float) = 0.27
		_ComplicatedCenterRadial3 ("Complicated Center Radial 3", Vector) = (0, 0, 0, 0)
		_ComplicatedAmount3       ("Complicated Amount 3", Float) = 0.85
		_ComplicatedRadiusInner3  ("Complicated Radius Inner 3", Float) = 0.2
		_ComplicatedRadiusOuter3  ("Complicated Radius Outer 3", Float) = 0.27
		_ComplicatedCenterRadial4 ("Complicated Center Radial 4", Vector) = (0, 0, 0, 0)
		_ComplicatedAmount4       ("Complicated Amount 4", Float) = 0.85
		_ComplicatedRadiusInner4  ("Complicated Radius Inner 4", Float) = 0.2
		_ComplicatedRadiusOuter4  ("Complicated Radius Outer 4", Float) = 0.27
		_ComplicatedCenterRadial5 ("Complicated Center Radial 5", Vector) = (0, 0, 0, 0)
		_ComplicatedAmount5       ("Complicated Amount 5", Float) = 0.85
		_ComplicatedRadiusInner5  ("Complicated Radius Inner 5", Float) = 0.2
		_ComplicatedRadiusOuter5  ("Complicated Radius Outer 5", Float) = 0.27
		_ComplicatedCenterRadial6 ("Complicated Center Radial 6", Vector) = (0, 0, 0, 0)
		_ComplicatedAmount6       ("Complicated Amount 6", Float) = 0.85
		_ComplicatedRadiusInner6  ("Complicated Radius Inner 6", Float) = 0.2
		_ComplicatedRadiusOuter6  ("Complicated Radius Outer 6", Float) = 0.27
		_ComplicatedCenterRadial7 ("Complicated Center Radial 7", Vector) = (0, 0, 0, 0)
		_ComplicatedAmount7       ("Complicated Amount 7", Float) = 0.85
		_ComplicatedRadiusInner7  ("Complicated Radius Inner 7", Float) = 0.2
		_ComplicatedRadiusOuter7  ("Complicated Radius Outer 7", Float) = 0.27
		_ComplicatedCenterRadial8 ("Complicated Center Radial 8", Vector) = (0, 0, 0, 0)
		_ComplicatedAmount8       ("Complicated Amount 8", Float) = 0.85
		_ComplicatedRadiusInner8  ("Complicated Radius Inner 8", Float) = 0.2
		_ComplicatedRadiusOuter8  ("Complicated Radius Outer 8", Float) = 0.27
	}
	CGINCLUDE
		#include "Utils.cginc"
		MG_DECLARE_UNIFORM(1);
		MG_DECLARE_UNIFORM(2);
		MG_DECLARE_UNIFORM(3);
		MG_DECLARE_UNIFORM(4);
		MG_DECLARE_UNIFORM(5);
		MG_DECLARE_UNIFORM(6);
		MG_DECLARE_UNIFORM(7);
		MG_DECLARE_UNIFORM(8);
		
		float4 fragSimple_Single (v2f_img i) : SV_Target
		{
			float4 c = tex2D(_MainTex, i.uv);
			return MagnifyingGlassSimple(i.uv, _SimpleCenterRadial1, _SimpleAmount1, c);
		}
		float4 fragSimple_Multiple (v2f_img i) : SV_Target
		{
			float4 c = 0;
			if (MagnifyingGlassSimple_IsInCircle (i.uv, _SimpleCenterRadial1))
				c = MagnifyingGlassSimple_SampleTexture (i.uv, _SimpleCenterRadial1, _SimpleAmount1);
			else if (MagnifyingGlassSimple_IsInCircle (i.uv, _SimpleCenterRadial2))
				c = MagnifyingGlassSimple_SampleTexture (i.uv, _SimpleCenterRadial2, _SimpleAmount2);
			else if (MagnifyingGlassSimple_IsInCircle (i.uv, _SimpleCenterRadial3))
				c = MagnifyingGlassSimple_SampleTexture (i.uv, _SimpleCenterRadial3, _SimpleAmount3);
			else if (MagnifyingGlassSimple_IsInCircle (i.uv, _SimpleCenterRadial4))
				c = MagnifyingGlassSimple_SampleTexture (i.uv, _SimpleCenterRadial4, _SimpleAmount4);
			else if (MagnifyingGlassSimple_IsInCircle (i.uv, _SimpleCenterRadial5))
				c = MagnifyingGlassSimple_SampleTexture (i.uv, _SimpleCenterRadial5, _SimpleAmount5);
			else if (MagnifyingGlassSimple_IsInCircle (i.uv, _SimpleCenterRadial6))
				c = MagnifyingGlassSimple_SampleTexture (i.uv, _SimpleCenterRadial6, _SimpleAmount6);
			else if (MagnifyingGlassSimple_IsInCircle (i.uv, _SimpleCenterRadial7))
				c = MagnifyingGlassSimple_SampleTexture (i.uv, _SimpleCenterRadial7, _SimpleAmount7);
			else if (MagnifyingGlassSimple_IsInCircle (i.uv, _SimpleCenterRadial8))
				c = MagnifyingGlassSimple_SampleTexture (i.uv, _SimpleCenterRadial8, _SimpleAmount8);
			else
				c = tex2D(_MainTex, i.uv);
			return c;
		}
		float4 fragComplicated_Single (v2f_img i) : SV_Target
		{
			float4 c;
			if (MagnifyingGlassComplicated_IsInCircle (i.uv, _ComplicatedCenterRadial1, _ComplicatedRadiusOuter1))
				c = MagnifyingGlassComplicated_SampleTexture (i.uv, _ComplicatedCenterRadial1, _ComplicatedAmount1, _ComplicatedRadiusInner1, _ComplicatedRadiusOuter1);
			else
				c = tex2D(_MainTex, i.uv);
			return c;
       	}
		float4 fragComplicated_Multiple (v2f_img i) : SV_Target
		{
			float4 c;
			if (MagnifyingGlassComplicated_IsInCircle (i.uv, _ComplicatedCenterRadial1, _ComplicatedRadiusOuter1))
				c = MagnifyingGlassComplicated_SampleTexture (i.uv, _ComplicatedCenterRadial1, _ComplicatedAmount1, _ComplicatedRadiusInner1, _ComplicatedRadiusOuter1);
			else if (MagnifyingGlassComplicated_IsInCircle (i.uv, _ComplicatedCenterRadial2, _ComplicatedRadiusOuter2))
				c = MagnifyingGlassComplicated_SampleTexture (i.uv, _ComplicatedCenterRadial2, _ComplicatedAmount2, _ComplicatedRadiusInner2, _ComplicatedRadiusOuter2);
			else if (MagnifyingGlassComplicated_IsInCircle (i.uv, _ComplicatedCenterRadial3, _ComplicatedRadiusOuter3))
				c = MagnifyingGlassComplicated_SampleTexture (i.uv, _ComplicatedCenterRadial3, _ComplicatedAmount3, _ComplicatedRadiusInner3, _ComplicatedRadiusOuter3);
			else if (MagnifyingGlassComplicated_IsInCircle (i.uv, _ComplicatedCenterRadial4, _ComplicatedRadiusOuter4))
				c = MagnifyingGlassComplicated_SampleTexture (i.uv, _ComplicatedCenterRadial4, _ComplicatedAmount4, _ComplicatedRadiusInner4, _ComplicatedRadiusOuter4);
			else if (MagnifyingGlassComplicated_IsInCircle (i.uv, _ComplicatedCenterRadial5, _ComplicatedRadiusOuter5))
				c = MagnifyingGlassComplicated_SampleTexture (i.uv, _ComplicatedCenterRadial5, _ComplicatedAmount5, _ComplicatedRadiusInner5, _ComplicatedRadiusOuter5);
			else if (MagnifyingGlassComplicated_IsInCircle (i.uv, _ComplicatedCenterRadial6, _ComplicatedRadiusOuter6))
				c = MagnifyingGlassComplicated_SampleTexture (i.uv, _ComplicatedCenterRadial6, _ComplicatedAmount6, _ComplicatedRadiusInner6, _ComplicatedRadiusOuter6);
			else if (MagnifyingGlassComplicated_IsInCircle (i.uv, _ComplicatedCenterRadial7, _ComplicatedRadiusOuter7))
				c = MagnifyingGlassComplicated_SampleTexture (i.uv, _ComplicatedCenterRadial7, _ComplicatedAmount7, _ComplicatedRadiusInner7, _ComplicatedRadiusOuter7);
			else if (MagnifyingGlassComplicated_IsInCircle (i.uv, _ComplicatedCenterRadial8, _ComplicatedRadiusOuter8))
				c = MagnifyingGlassComplicated_SampleTexture (i.uv, _ComplicatedCenterRadial8, _ComplicatedAmount8, _ComplicatedRadiusInner8, _ComplicatedRadiusOuter8);
			else
				c = tex2D(_MainTex, i.uv);
			return c;
		}
	ENDCG
	SubShader {
		ZTest Off Cull Off ZWrite Off Blend Off
	  	Fog { Mode off }
		Pass {   // 0
			CGPROGRAM
			#pragma vertex vert_img
			#pragma fragment fragSimple_Single
			ENDCG
		}
		Pass {   // 1
			CGPROGRAM
			#pragma vertex vert_img
			#pragma fragment fragSimple_Multiple
			ENDCG
		}
		Pass {   // 2
			CGPROGRAM
			#pragma vertex vert_img
			#pragma fragment fragComplicated_Single
			ENDCG
		}
		Pass {   // 3
			CGPROGRAM
			#pragma vertex vert_img
			#pragma fragment fragComplicated_Multiple
			ENDCG
		}
	}
	FallBack Off
}