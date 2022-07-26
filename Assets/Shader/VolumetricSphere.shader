Shader "Magnifying Glass/Volumetric Sphere" {
	Properties {
		_MainTex ("Main", 2D) = "white" {}
		_Center ("Center", Vector) = (0.5, 0.5, 0, 0)
		_Radius ("Radius", Float) = 2
		_Distortion ("Distortion", Float) = 2
		_Form ("Form", Float) = 0.2
	}
	CGINCLUDE
		#include "UnityCG.cginc"
		sampler2D _MainTex;
		float _Radius, _Distortion, _Form;
		float2 _Center;
		
		float4 frag (v2f_img i) : SV_Target
		{
			float2 uv = i.uv;
			float2 center = _Center;
			float f1 = _Form;
			float ax = ((uv.x - center.x) * (uv.x - center.x)) / (f1 * f1) + ((uv.y - center.y) * (uv.y - center.y)) / (f1 / (_ScreenParams.x / _ScreenParams.y));
			float depth = _Radius / _Distortion;
			float dx = (-depth / _Radius) * ax + (depth / (_Radius * _Radius)) * ax * ax;
			float f = ax + dx;
			if (ax > _Radius) f = ax;
			float2 magnifierArea = center + (uv - center) * f / ax;
			return float4(tex2D(_MainTex, magnifierArea).rgb, 1.0);
       	}
	ENDCG
	SubShader {
		ZTest Off Cull Off ZWrite Off Blend Off
	  	Fog { Mode off }
		Pass {
			CGPROGRAM
			#pragma vertex vert_img
			#pragma fragment frag
			ENDCG
		}
	}
	FallBack Off
}