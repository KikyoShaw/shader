sampler2D iChannel0 : register(S0);
sampler2D iChannel1 : register(S1);

// new HLSL shader
// modify the comment parameters to reflect your shader parameters

/// <summary>Explain the purpose of this variable.</summary>
/// <minValue>05/minValue>
/// <maxValue>10</maxValue>
/// <defaultValue>3.5</defaultValue>
float SampleInputParam : register(C0);

float4 main(float2 uv : TEXCOORD) : COLOR 
{ 
	
	float4 color, mask; 
	color= tex2D( iChannel0 , uv.xy); 
	mask = tex2D( iChannel1 , uv.xy);
	color.a *= (1-mask.a);

	return color; 
}