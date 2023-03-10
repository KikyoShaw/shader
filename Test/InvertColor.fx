//--------------------------------------------------------------------------------------
// 
// WPF ShaderEffect HLSL -- InvertColorEffect
//
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
// Sampler Inputs (Brushes, including ImplicitInput)
//--------------------------------------------------------------------------------------

/// <summary>InvertVal.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>1</defaultValue>
float InvertVal : register(C1);// 0..1, default 1

sampler2D implicitInputSampler : register(S0);

//--------------------------------------------------------------------------------------
// Pixel Shader
//--------------------------------------------------------------------------------------

float4 main(float2 uv : TEXCOORD) : COLOR
{
   float4 color = tex2D( implicitInputSampler, uv );
   float4 inverted_color = InvertVal - color;
   inverted_color.a = color.a;
   inverted_color.rgb *= inverted_color.a;
   return inverted_color;
}
