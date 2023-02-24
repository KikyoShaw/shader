//--------------------------------------------------------------------------------------
// 
// WPF ShaderEffect HLSL -- ColorKeyAlphaEffect
//
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
// Sampler Inputs (Brushes, including ImplicitInput)
//--------------------------------------------------------------------------------------

/// <summary>Alpha</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>1</defaultValue>
float Alpha : register(C0); // 0..1, default 1


sampler2D  implicitInputSampler : register(S0);

//--------------------------------------------------------------------------------------
// Pixel Shader
//--------------------------------------------------------------------------------------

float4 main(float2 uv : TEXCOORD) : COLOR
{
   float4 color = tex2D( implicitInputSampler, uv );
   
   color.rgba *= Alpha;
   
   return color;
}
