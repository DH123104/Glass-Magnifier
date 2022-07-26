#ifndef UTILS_CGINC
#define UTILS_CGINC

#include "UnityCG.cginc"

sampler2D _MainTex;
float4 _SimpleDarkColor, _SimpleBrightColor;
float _SimpleFadingEdge;
#define MG_DECLARE_UNIFORM(n)\
	float4 _SimpleCenterRadial##n;\
	float  _SimpleAmount##n;\
	float4 _ComplicatedCenterRadial##n;\
	float  _ComplicatedAmount##n;\
	float  _ComplicatedRadiusInner##n;\
	float  _ComplicatedRadiusOuter##n;

bool MagnifyingGlassSimple_IsInCircle (float2 uv, float4 cr)
{
	float2 ray = uv - cr.xy;
	float len = length(ray / cr.zw);
	if (len > 1.0)
		return false;
	else
		return true;
}
float4 MagnifyingGlassSimple_SampleTexture (float2 uv, float4 cr, float amount)
{
	float2 ray = uv - cr.xy;
	float2 newUv = cr.xy + (1.0 - amount) * ray;
	return tex2D(_MainTex, newUv);
}
float4 MagnifyingGlassSimple (float2 uv, float4 cr, float amount, float4 origColor)
{
	float2 ray = uv - cr.xy;
	float len = length(ray / cr.zw);
	float lp = step(len, 0.5);
	lp = smoothstep(0.5, 0.5 + _SimpleFadingEdge, 1.0 - len);
	float2 newUv = cr.xy + (1.0 - amount) * ray;

	float4 magn = tex2D(_MainTex, newUv);
	float4 lc = lerp(_SimpleDarkColor, _SimpleBrightColor, lp);
	return lerp(origColor, magn, lp) * lc;
}
bool MagnifyingGlassComplicated_IsInCircle (float2 uv, float4 cr, float radiusOuter)
{
	float2 ray = uv - cr.xy;
	float len = length(ray / cr.zw);
	if (len < radiusOuter)
		return true;
	else
		return false;
}
float4 MagnifyingGlassComplicated_SampleTexture (float2 uv, float4 cr, float amount, float radiusInner, float radiusOuter)
{
	float2 ray = uv - cr.xy;
	float len = length(ray / cr.zw);
	
	float2 newUV;
	float amt = 1 - amount;
	if (len < radiusInner)
	{
		newUV = cr.xy + (ray * amt);
	}
	else
	{
		float diff = radiusOuter - radiusInner;
		float ratio = (len - radiusInner) / diff;   // 0 ~ 1
		ratio = ratio * 3.14159;                    // -pi/2 ~ pi/2
		float c = cos(ratio);                       // -1 ~ 1
		c = c + 1;                                  // 0 ~ 2
		c = c / 2;                                  // 0 ~ 1
		newUV = ((cr.xy + ray * amt) * c) + (uv * (1 - c));
	}
	return tex2D(_MainTex, newUV);
}

#endif