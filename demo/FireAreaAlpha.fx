/// <class>VolumetricFireAlpha</class>
sampler2D iChannel0 : register(S0);

/// <summary>Time.</summary>
/// <minValue>1</minValue>
/// <maxValue>9999</maxValue>
/// <defaultValue>1</defaultValue>
float Time : register(C0);

/// <summary>resolutionX.</summary>
/// <minValue>1</minValue>
/// <maxValue>9999</maxValue>
/// <defaultValue>1280</defaultValue>
float resolutionX : register(C1);

/// <summary>resolutionY.</summary>
/// <minValue>1</minValue>
/// <maxValue>9999</maxValue>
/// <defaultValue>1024</defaultValue>
float resolutionY : register(C2);

/// <summary>direction.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0</defaultValue>
float direction : register(C3);

/// <summary>UpDownReverse.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0</defaultValue>
float UpDownReverse : register(C4);
/// <summary>EffHue.</summary>
/// <minValue>0</minValue>
/// <maxValue>360</maxValue>
/// <defaultValue>0</defaultValue>
float EffHue : register(C5); // 0..360, default 0
/// <summary>EffSat.</summary>
/// <minValue>0</minValue>
/// <maxValue>2</maxValue>
/// <defaultValue>1</defaultValue>
float EffSat : register(C6); // 0..2, default 1
/// <summary>EffLum.</summary>
/// <minValue>-1</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0</defaultValue>
float EffLum : register(C7); // -1..1, default 0
/// <summary>EffAlpha.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>1</defaultValue>
float EffAlpha : register(C8); // -1..1, default 0


/// <summary>ImgFade.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0.9</defaultValue>
float ImgFade : register(C9); // -1..1, default 0
/// <summary>ImgFade.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0.9</defaultValue>
float ImgTaper : register(C10); // -1..1, default 0
/// <summary>FadePos.</summary>
/// <minValue>-0.5,-0.5</minValue>
/// <maxValue>0.5,0.5</maxValue>
/// <defaultValue>0,0</defaultValue>
float2 FadePos : register(C11); // -1..1, default 0

/// <summary>FadeRatio.</summary>
/// <minValue>0.1,0.1</minValue>
/// <maxValue>2,2</maxValue>
/// <defaultValue>1,1</defaultValue>
float2 FadeRatio : register(C12); // -1..1, default 0

/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0</defaultValue>
float userMask : register(C13); // -1..1, default 0

/// <summary>inverseMark.</summary>
/// <minValue>-1</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0</defaultValue>
float MaskVal : register(C14); // -1..1, default 0

/// <summary>DistiorMargin</summary>
///  <type>Point4D</type>
/// <minValue>0,0,0,0</minValue>
/// <maxValue>1,1,1,1</maxValue>
/// <defaultValue>0.,0,0.,0</defaultValue>
float4 DistiorMargin : register(C15);

/// <defaultValue>#EC4A06</defaultValue>
float4 EffColor : register(C16); 

/// <defaultValue>#000000</defaultValue>
float4 ShadowColor : register(C17);
/// <summary>Zoom.</summary>
/// <minValue>0.1</minValue>
/// <maxValue>1.25</maxValue>
/// <defaultValue>1</defaultValue>
float Zoom : register(C18);
/// <summary>iMouse.</summary>
/// <minValue>-1000,-1000</minValue>
/// <maxValue>1000,1000</maxValue>
/// <defaultValue>0,0</defaultValue>
float2 iMouse : register(C19); // -1..1, default 0

#define M_PI 3.14159265359
#define PI 3.14159265359
#define N 64.0

float4 ColorProcessing(float4 c, float h, float s, float l)
{
    float3x3 matrixH =
    {
        0.8164966f, 0, 0.5352037f,
     -0.4082483f, 0.70710677f, 1.0548190f,
     -0.4082483f, -0.70710677f, 0.1420281f
    };

    float3x3 matrixH2 =
    {
        0.84630f, -0.37844f, -0.37844f,
     -0.37265f, 0.33446f, -1.07975f,
      0.57735f, 0.57735f, 0.57735f
    };

    float a = c.a;
    float3x3 rotateZ =
    {
        cos(radians(h)), sin(radians(h)), 0,
   -sin(radians(h)), cos(radians(h)), 0,
    0, 0, 1
    };
    matrixH = mul(matrixH, rotateZ);
    matrixH = mul(matrixH, matrixH2);

    float i = 1 - s;
    float3x3 matrixS =
    {
        i * 0.3086f + s, i * 0.3086f, i * 0.3086f,
    i * 0.6094f, i * 0.6094f + s, i * 0.6094f,
    i * 0.0820f, i * 0.0820f, i * 0.0820f + s
    };
    matrixH = mul(matrixH, matrixS);

    float3 c1 = mul(c, matrixH);
    c1 += l;
    return saturate(float4(c1, c.a));
}

float2 ws(float2 p, float s, float r, float w)
{
    float d = Time * s, x = w * (1.0 + r) * (p.x + d), y = w * (1.0 + r) * (p.y + d);
    return float2(cos(x - y) * cos(y), sin(x + y) * sin(y));
}
float2 waterProcessing2(float2 uvin, float s, float rand, float width)
{
    float2 uvout = uvin;
    uvout.y = 1.0 - uvout.y;

    float2 iResolution = float2(resolutionX, resolutionY);
    float2 fragCoord = float2(iResolution.x * uvout.x, iResolution.y * uvout.y);

    float2 r = fragCoord / iResolution, q = r + 2. / iResolution.x * (ws(r, s, rand, width) - ws(r + iResolution, s, rand, width));

    q.y = 1. - q.y;
    q.y = max(0, q.y);
    q.x = max(0, q.x);
    q.y = min(1, q.y);
    q.x = min(1, q.x);
    return q;
}


float LimitOne(float v)
{
    int i = ((int)v) % 2;
    if (i == 0)
    {
        return frac(v);
    }
    else
    {
        return 1.0 - frac(v);
    }
}
float2 LimitTwo(float2 uv)
{
    return float2(LimitOne(uv.x), LimitOne(uv.y));
}
float3 LimitThree(float3 uv)
{
    return float3(LimitOne(uv.x), LimitOne(uv.y), LimitOne(uv.z));
}


float edgeFade(float2 uv, float taper, float fade_begin)
{
    uv = uv * 2.0 - 1.0; // [-1,1] uv range.
    uv -= FadePos;
    taper = taper * 2.0;
    fade_begin = (1.0 - fade_begin) * 2.0;
    return 1.0 - pow(length(uv.xy * FadeRatio * fade_begin), taper);
}

float getFadeInWeight(float2 uv)
{
    uv -= FadePos;
    float fade = 1.0 - ImgFade;
    float edge = (fade)*abs(sin(fade));
    // taken FabriceNeyret2's advice
    float4 v = smoothstep(0., edge, float4(uv, 1. - (uv*FadeRatio)));
    return v.x * v.y * v.z * v.w;
}

float GetImgFade(float2 uv, float taper, float fade_begin)
{
    if (taper == 1.0)
    {
        return getFadeInWeight(uv);
    }
    else
    {
        return edgeFade(uv, taper, fade_begin);
    }
}

float GetMark(sampler2D iChannel, float2 uvin)
{
    if (userMask != 0)
    {
        float3 mask = tex2D(iChannel, uvin).rgb;
        
        float m = 0.299 * mask.r + 0.587 * mask.g + 0.114 * mask.b;

        if (MaskVal > 0)
            return m > MaskVal ? 1.0 : 0.0;
        else
            return m < abs(MaskVal) ? 1.0 : 0.0;
    }
    return 1.0;
}

float3 spiral_rainbow(float x) {
    float3 xyz = abs(fmod(x + float3(0.5,1.5,2.5), 3.) - 1.5);
    return 1.0 - pow(
        max(float3(0.0,0.0,0.0), xyz * 2. - 1.)
    , float3(2.,2,2));
}

float4 spiralRainbow(float2 fragCoord)
{
    float2 iResolution = float2(1, 1);
    float2 uv = fragCoord - 0.5 * (iResolution.xy);

    // Time varying pixel color
    float dist = log(dot(uv, uv));
    float angle = atan2(uv.y, uv.x) / 6.28318530718;
    float3 col = spiral_rainbow(dist * -0.35 + angle * 3.0 + sin(Time * 2.0 + dist * -5.0) * -0.05 + (sin(10.5 + -Time + dist * 0.7)-1.1) * -0.2);

    // Output to screen
    
    float4 fragColor = float4(col, 1.0) * 1;
    fragColor.b *= 3.0;
    fragColor.r *= 2.0;
    fragColor.g *= 1.5;
    return fragColor;    
}

float4 SlidingRainbow(float2 fragCoord)
{
    const float SlidingSpeed = 0.1;
    const float SlidingSpeed2 = 5.5;
    const float SlidingScale = 0.25;
    const float SlidingScale2 = 3.0;
    float2 iResolution = float2(1, 1);
    //fragCoord.y-=0.3;
   float3 color = 0.5 + 0.5 * sin(fragCoord.y*SlidingScale2 + sin((fragCoord.x*SlidingScale + Time*SlidingSpeed + float3(0.0, iResolution.x / 3.0, iResolution.x / 2.0)) * (PI / (iResolution.x / 3.0))));

    float4 fragColor = float4(color, 1.0);
    return fragColor;    
}

float snoise(float3 uv, float res)
{
    const float3 s = float3(1e0, 1e2, 1e3);
	
    uv *= res;
	
	float3 uv0 = floor(fmod(uv, res)) * s;
	float3 uv1 = floor(fmod(uv + float3(1.,1.,1.), res)) * s;
	
	float3 f = frac(uv);
    f = f * f * (3.0 - 2.0 * f);

	float4 v = float4(uv0.x + uv0.y + uv0.z, uv1.x + uv0.y + uv0.z,
		      	  uv0.x + uv1.y + uv0.z, uv1.x + uv1.y + uv0.z);

	float4 r = frac(sin(v * 1e-1) * 1e3);
    float r0 = lerp(lerp(r.x, r.y, f.x), lerp(r.z, r.w, f.x), f.y);
	
    r = frac(sin((v + uv1.z - uv0.z) * 1e-1) * 1e3);
    float r1 = lerp(lerp(r.x, r.y, f.x), lerp(r.z, r.w, f.x), f.y);
	
    return lerp(r0, r1, f.z) * 2. - 1.;
}

float noise(float2 uv, float baseres)
{
    float n = 0.0;
    for (int i = 0; i < 7; i++)
    {
        float v = pow(2.0, float(i));
        n += (1.5 / v) * snoise(float3(uv + float2(1., 1.) * (float(i) / 17.), 1), v * baseres);
    }
    return clamp((1.0 - n) * .5, 0., 1.);
}


float4 mainEffect(float2 uvout)
{
    float4 fragColor = float4(0, 0, 0, 0);
    float2 iResolution = float2(resolutionX, resolutionY);
    float2 fragCoord = float2(iResolution.x * uvout.x, iResolution.y * uvout.y);
    
    float2 uv = (fragCoord / iResolution.xy);
    
    // Tweaking vars
    float4 color = EffColor;
    float2 tiling = float2(1.0, .6);
    float2 speed1 = float2(0.05, -0.32);
    float2 speed2 = float2(-0.10, -0.39);
    float ss_min = 0.2;
    float ss_max = ss_min + 0.5;
    float noise_sz = 8.0f;
    
    // Tiled UV
    float2 tuv = float2(fmod(uv.x * tiling.x, 1.0), fmod(uv.y * tiling.y, 1.0));
    
    // Samplings
    float2 uv1 = tuv + (speed1 * Time);
    float2 uv2 = tuv + (speed2 * Time);
    
    // Mask
    float2 uvt = float2(uv.x, pow(1.0 - uv.y, 2.2));
    float2 nuvt = (uvt * 2.0) - 1.0;
    float v = 1. - length(nuvt);
    v = ((v * .6) + (pow(v, 4.3) * 4.55));
    
    float samplings = noise(uv1, noise_sz) * noise(uv2, noise_sz);
    float mask = pow(v, 1.2) * samplings;
    float amask = smoothstep(ss_min, ss_max, mask);

    // Output to screen
    fragColor = color + (color * pow((1.0 - uv.y), 3.0) * .3);
    fragColor += samplings * .3;
    fragColor *= (2. * amask);
    
    // Output to screen
    return saturate(fragColor);
}

//void mainImage(out float4 fragColor, in float2 fragCoord)
float4 main(float2 uvin : TEXCOORD) : COLOR
{

    if(uvin.x < DistiorMargin.x || (1.0-uvin.x) < DistiorMargin.z||
       uvin.y < DistiorMargin.y || (1.0-uvin.y) < DistiorMargin.w)
    {
      return float4(0,0,0,0);
    }

    float mark = GetMark(iChannel0, uvin);
    if (mark == 0)
      return float4(0,0,0,0);
    float alpha = GetImgFade(uvin, ImgTaper, ImgFade);
    if (alpha < 0.001)
    {
        return float4(0,0,0,0);
    }
    float2 uv2 = uvin ;
    float2 uvbg = uv2;
    float2 uvout = uv2;
    if (UpDownReverse == 0)
    {
        uvout.y = 1.0 - uvout.y;
    }

    if (direction != 0)
    {
        uvout.x = 1.0 - uvout.x;
    }
    

    float4 fragColor = float4(0, 0, 0, 0);
    
    fragColor = mainEffect(uvout);    
    fragColor.rgb = ColorProcessing(fragColor, EffHue, EffSat, EffLum).rgb;
    fragColor *= EffAlpha;
    fragColor = lerp(float4(0,0,0,0), fragColor, alpha);
    //fragColor.a = 1.0;
    return fragColor;
    

}
