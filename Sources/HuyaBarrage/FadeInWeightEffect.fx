/// <class>FadeInWeightEffect </class>
sampler2D input : register(s0);

// new HLSL shader
// modify the comment parameters to reflect your shader parameters


/// <summary>ImgFade.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>1</defaultValue>
float ImgFade : register(C0); // -1..1, default 0
/// <summary>FramMargin.</summary>
///  <type>Point4D</type>
/// <minValue>0,0,0,0</minValue>
/// <maxValue>1,1,1,1</maxValue>
/// <defaultValue>1,1,1,1</defaultValue>
float4 FageMargin : register(C1); // -1..1, default 0

#define mat float3
#define vec2 float2
#define vec3 float3
#define vec4 float4
#define fract frac
#define mix lerp
#define mat2 float2x2
#define mat3 float3x3
#define mod fmod 
#define texture tex2D

float getFadeInWeight(vec2 uv)
{
        float fade = 1.0 - ImgFade;
        float edge = (fade)*abs(sin(fade));
        // taken FabriceNeyret2's advice
        vec4 v = smoothstep(0., fade*FageMargin, vec4(uv, 1. - uv));
        return v.x* v.y * v.z  * v.w;
}

float4 main(float2 uv : TEXCOORD) : COLOR 
{    
    float4 fragColor = float4(0,0,0,0); 
    fragColor= tex2D( input , uv.xy);  
    float alpha = getFadeInWeight(uv);
    fragColor = lerp(vec4(0,0,0,0), fragColor, alpha);
    return fragColor; 
}