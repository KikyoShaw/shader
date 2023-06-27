/// <class>SimplicityGalaxy</class>

sampler2D iChannel0 : register(S0);
//sampler2D iChannel1 : register(S1);

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

/// <summary>ImgHue.</summary>
/// <minValue>0</minValue>
/// <maxValue>360</maxValue>
/// <defaultValue>0</defaultValue>
float ImgHue : register(C3); // 0..360, default 0
/// <summary>ImgSat.</summary>
/// <minValue>0</minValue>
/// <maxValue>2</maxValue>
/// <defaultValue>1</defaultValue>
float ImgSat : register(C4); // 0..2, default 1
/// <summary>ImgLum.</summary>
/// <minValue>-1</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0</defaultValue>
float ImgLum : register(C5); // -1..1, default 0

/// <summary>direction.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0</defaultValue>
float imgDirection : register(C6);
/// <summary>UpDownReverse.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0</defaultValue>
float imgUpDownReverse : register(C7);

/// <summary>EffHue.</summary>
/// <minValue>0</minValue>
/// <maxValue>360</maxValue>
/// <defaultValue>0</defaultValue>
float EffHue : register(C8); // 0..360, default 0
/// <summary>EffSat.</summary>
/// <minValue>0</minValue>
/// <maxValue>2</maxValue>
/// <defaultValue>1</defaultValue>
float EffSat : register(C9); // 0..2, default 1
/// <summary>EffLum.</summary>
/// <minValue>-1</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0</defaultValue>
float EffLum : register(C10); // -1..1, default 0
/// <summary>direction.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0</defaultValue>
float direction : register(C11);

/// <summary>dropDown.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0</defaultValue>
float UpDownReverse : register(C12);


/// <summary>Imgshake.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>1</defaultValue>
float Imgshake : register(C13);

/// <summary>ImgshakeSpeed.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0.3</defaultValue>
float ImgshakeSpeed : register(C14);

/// <summary>ImgshakeSize.</summary>
/// <minValue>0</minValue>
/// <maxValue>100</maxValue>
/// <defaultValue>10</defaultValue>
float ImgshakeSize : register(C15);

/// <summary>ImgshakeRang.</summary>
/// <minValue>0</minValue>
/// <maxValue>10</maxValue>
/// <defaultValue>8</defaultValue>
float ImgshakeRange : register(C16);
/// <summary>ImgshakeRang.</summary>
/// <minValue>10</minValue>
/// <maxValue>32</maxValue>
/// <defaultValue>18</defaultValue>
float fieldLayout : register(C17);
/// <summary>The center of the swirl. (100,100) is lower right corner </summary>
/// <minValue>0,0</minValue>
/// <maxValue>70,70</maxValue>
/// <defaultValue>60,60</defaultValue>
float2 starsLayout : register(C18); // 1..10, default 5

/// <summary>clrRatio.</summary>
/// <minValue>0,0,0</minValue>
/// <maxValue>2,2,2</maxValue>
/// <defaultValue>1.3,1.8,1.3</defaultValue>
float3 clrRatio : register(C19); // -0.5..1, default 0

/// <summary>Colorize.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>1</defaultValue>
float Colorize : register(C20); // -0.5..1, default 0

/// <summary>zoomMove.</summary>
/// <minValue>0,0</minValue>
/// <maxValue>1,1</maxValue>
/// <defaultValue>0,0</defaultValue>
float2 zoomMove : register(C21); // -0.5..1, default 0
/// <summary>The center of the swirl. (100,100) is lower right corner </summary>
/// <minValue>0,0</minValue>
/// <maxValue>1,1</maxValue>
/// <defaultValue>0.5,0.5</defaultValue>
float2 MouseOffset : register(C22); // 1..10, default 5
/// <summary>The center of the swirl. (100,100) is lower right corner </summary>
/// <minValue>-1</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0</defaultValue>
float MouseMoveSync : register(C23); // 1..10, default 5

/// <summary>MaskType.</summary>
/// <minValue>0</minValue>
/// <maxValue>3</maxValue>
/// <defaultValue>0</defaultValue>
float MaskType : register(C24); // -1..1, default 0

/// <summary>InversionMask.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0</defaultValue>
float InversionMask : register(C25);

/// <summary>MaskValue.</summary>
/// <minValue>0</minValue>
/// <maxValue>3</maxValue>
/// <defaultValue>0</defaultValue>
float MaskValue : register(C26); // -1..1, default 0

/// <defaultValue>#000000</defaultValue>
float4 MaskColor : register(C27); // -1..1, default 0

/// <summary>alphaMode.</summary>
/// <minValue>0</minValue>
/// <maxValue>12</maxValue>
/// <defaultValue>1</defaultValue>
float alphaMode : register(C28); // -1..1, default 0
/// <summary>The radius of the Poisson disk (in pixels).</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>1</defaultValue>
float alpha : register(C29);
/// <summary>The radius of the Poisson disk (in pixels).</summary>
///  <type>Point4D</type>
/// <minValue>0,0,0,0</minValue>
/// <maxValue>1,1,1,1</maxValue>
/// <defaultValue>0.5,0.5,0.5,0.5</defaultValue>
float4 freqsRatio : register(C30);
/// <summary>The radius of the Poisson disk (in pixels).</summary>
///  <type>Point4D</type>
/// <minValue>0.1</minValue>
/// <maxValue>2</maxValue>
/// <defaultValue>1.2</defaultValue>
float StarZoom : register(C31);

#define mat float3
#define vec2 float2
#define vec3 float3
#define vec4 float4
#define fract frac
#define mix lerp
#define mat3 float3x3
#define mat2 float2x2
#define mod fmod
#define texture tex2D
#define M_PI 3.14159265359


float4 ColorProcessing(float4 c, float h, float s, float l)
{
    if (h == 0 && s == 1 && l == 0)
        return c;

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


    float3x3 rotateZ =
    {
        cos(radians(h)), sin(radians(h)), 0,
		-sin(radians(h)), cos(radians(h)), 0,
		0, 0, 1
    };
    matrixH = mul(matrixH, rotateZ);
    matrixH = mul(matrixH, matrixH2);

    float mi = 1 - s;
    float3x3 matrixS =
    {
        mi * 0.3086f + s, mi * 0.3086f, mi * 0.3086f,
		mi * 0.6094f, mi * 0.6094f + s, mi * 0.6094f,
		mi * 0.0820f, mi * 0.0820f, mi * 0.0820f + s
    };
    matrixH = mul(matrixH, matrixS);

    float3 c1 = mul(c, matrixH);
    c1 += l;
    return saturate(float4(c1, c.a));
}

vec2 ws(vec2 p, float s, float r, float w)
{
    float d = Time * s, x = w * (1.0 + r) * (p.x + d), y = w * (1.0 + r) * (p.y + d);
    return vec2(cos(x - y) * cos(y), sin(x + y) * sin(y));
}
vec2 waterProcessing2(vec2 uvin, float s, float rand, float width)
{
    float2 uvout = uvin;
    uvout.y = 1.0 - uvout.y;

    float2 iResolution = float2(resolutionX, resolutionY);
    float2 fragCoord = float2(iResolution.x * uvout.x, iResolution.y * uvout.y);

	vec2 r = fragCoord / iResolution, q = r + 2. / iResolution.x * (ws(r, s, rand, width) - ws(r + iResolution, s, rand, width));

    q.y = 1. - q.y;
    q.y = max(0, q.y);
    q.x = max(0, q.x);
    q.y = min(1, q.y);
    q.x = min(1, q.x);
    return q;
}


vec4 SlidingRainbow(vec2 fragCoord)
{
    const float SlidingSpeed = -0.1;
    const float SlidingSpeed2 = 5.5;
    const float SlidingScale = 0.55;
    const float SlidingScale2 = 3.0;
    vec2 iResolution = vec2(1, 1);
    //fragCoord.y-=0.3;
   vec3 color = 0.5 + 0.5 * sin(fragCoord.y*SlidingScale2 + sin((fragCoord.x*SlidingScale + Time*SlidingSpeed + vec3(0.0, iResolution.x / 3.0, iResolution.x / 2.0)) * (M_PI / (iResolution.x / 3.0))));

    vec4 fragColor = vec4(color, 1.0);
    return fragColor;    
}
float4 GetEffectColor(vec2 uvin)
{
    vec4 col;
    if (Colorize == 1.0)
    {

        col = SlidingRainbow(uvin);
        col.r *= clrRatio.r ;
        col.g *= clrRatio.g ;
        col.b *= clrRatio.b ;
    }
    else
    {
        col.rgb = clrRatio.rgb;
    }
    return col;
}


//#alphaMoe
float4 GetblendColor(vec4 bg, vec4 fragColor, float grayOrg)
{
    if (alphaMode <= 1)
    {
        grayOrg = alpha * (1 - grayOrg);
        fragColor.rgb *= (grayOrg);
        float grayEffect = 0.299 * fragColor.r + 0.587 * fragColor.g + 0.114 * fragColor.b;
        fragColor.rgb = bg.rgb * (1.0 - grayEffect) + fragColor.rgb;
    }
    else if (alphaMode <= 2)
    {
        grayOrg = alpha * (1 - grayOrg);
        fragColor.rgb = bg.rgb + fragColor.rgb * grayOrg;
    }
    else if (alphaMode <= 3)
    {
        grayOrg = max(grayOrg, 0.3);
        grayOrg = alpha * (1 - grayOrg);
        fragColor.rgb = bg.rgb * (1 - grayOrg) + fragColor.rgb * (grayOrg);
    }
    else if (alphaMode <= 4)
    {
        fragColor *= alpha;
        float grayEffect = 0.299 * fragColor.r + 0.587 * fragColor.g + 0.114 * fragColor.b;
        grayOrg = (1 - grayOrg) * grayEffect;
        fragColor.rgb = bg.rgb + fragColor.rgb * grayOrg;
    }
    else if (alphaMode <= 5)
    {
        fragColor *= alpha;
        float grayEffect = 0.299 * fragColor.r + 0.587 * fragColor.g + 0.114 * fragColor.b;
        grayOrg = (1 - grayOrg) * grayEffect;
        fragColor.rgb = bg.rgb + fragColor.rgb * (grayOrg);
    }
    else if (alphaMode <= 6)
    {
        fragColor *= alpha;
        float grayEffect = 0.299 * fragColor.r + 0.587 * fragColor.g + 0.114 * fragColor.b;
        grayOrg = (1 - grayOrg) * grayEffect;
        fragColor.rgb = bg.rgb * (1 - grayOrg) + fragColor.rgb * (grayOrg);
    }
    else if (alphaMode <= 7)
    {
        fragColor *= alpha;
        float grayEffect = 0.299 * fragColor.r + 0.587 * fragColor.g + 0.114 * fragColor.b;
        grayOrg = sqrt((1 - grayOrg) * (grayEffect));
        fragColor.rgb = bg.rgb + fragColor.rgb * grayOrg;
        
    }
    else if (alphaMode <= 8)
    {
        fragColor *= alpha;
        float grayEffect = 0.299 * fragColor.r + 0.587 * fragColor.g + 0.114 * fragColor.b;
        grayOrg = sqrt((1 - grayOrg) * (grayEffect));
        fragColor.rgb = bg.rgb * (1 - grayEffect) + fragColor.rgb * (grayOrg);
    }
    else if (alphaMode <= 9)
    {
        fragColor *= alpha;
        fragColor = min(fragColor, 1);
        float grayEffect = 0.299 * fragColor.r + 0.587 * fragColor.g + 0.114 * fragColor.b;
        grayOrg = ((1 - grayOrg) + grayEffect) * 0.5;
        fragColor.rgb = bg.rgb * (1 - grayEffect) + fragColor.rgb * (grayOrg);
    }
    else if (alphaMode <= 10)
    {
        grayOrg = max(grayOrg, 0.15);
        fragColor *= alpha;
        float grayEffect = 0.299 * fragColor.r + 0.587 * fragColor.g + 0.114 * fragColor.b;
        grayOrg = (grayOrg + grayEffect) * 0.5;
        grayOrg = (1 - grayOrg);
        fragColor.rgb = bg.rgb * (grayOrg) + fragColor.rgb * (1 - grayOrg);
    }
    else if (alphaMode <= 11)
    {
        grayOrg = alpha * (1 - grayOrg);
        float grayEffect = 0.299 * fragColor.r + 0.587 * fragColor.g + 0.114 * fragColor.b;
        float grayBg = 0.299 * bg.r + 0.587 * bg.g + 0.114 * bg.b;
        grayOrg = (grayOrg + (grayEffect + grayBg) * 0.5) * 0.5;
        grayOrg = (1 - grayOrg);
        fragColor.rgb = bg.rgb * (grayOrg) + fragColor.rgb * (1 - grayOrg);
    }
    else if (alphaMode <= 12)
    {
        grayOrg = alpha * (1 - grayOrg);
        float grayEffect = 0.299 * fragColor.r + 0.587 * fragColor.g + 0.114 * fragColor.b;
        float grayBg = 0.299 * bg.r + 0.587 * bg.g + 0.114 * bg.b;
        grayOrg = (grayOrg + (grayEffect + grayBg) * 0.5) * 0.5;
        grayOrg = (1 - grayOrg);
        fragColor.rgb = bg.rgb * (grayBg) + fragColor.rgb * (1 - grayOrg);
    }
    return saturate(fragColor);
}
float GetMaskValue(vec4 bg, vec2 uvbg)
{
    float grayOrg = 0;
    if (MaskType <= 1)
    {
        float mask = 0.0;
        mask = bg.a;
        if (InversionMask != 0)
            mask = 1.0 - mask;
        
        grayOrg = mask * MaskValue;
    }
    else if (MaskType <= 2)
    {
        vec3 diffCor = vec3(0, 0, 0);
        diffCor.r = abs(bg.r - MaskColor.r);
        diffCor.g = abs(bg.g - MaskColor.g);
        diffCor.b = abs(bg.b - MaskColor.b);
        if (InversionMask != 0)
        {
            diffCor.r = 1.0 - diffCor.r;
            diffCor.g = 1.0 - diffCor.g;
            diffCor.b = 1.0 - diffCor.b;
        }
        grayOrg = (sqrt(diffCor.r * diffCor.r + diffCor.g * diffCor.g + diffCor.b * diffCor.b)) * (MaskValue);
    }
    else
    {
        float bggray = 0.299 * bg.r + 0.587 * bg.g + 0.114 * bg.b;
        float maskGray = 0.299 * MaskColor.r + 0.587 * MaskColor.g + 0.114 * MaskColor.b;
        grayOrg = abs(bggray - maskGray);
        grayOrg = bggray;
        if (InversionMask != 0)
        {
            grayOrg = 1.0 - grayOrg;

        }
        grayOrg = grayOrg * MaskValue;
    }
    return grayOrg;
}

float mod289(float x)
{
    return x - floor(x * (1.0 / 289.0)) * 289.0;
}
vec4 mod289(vec4 x)
{
    return x - floor(x * (1.0 / 289.0)) * 289.0;
}
vec4 perm(vec4 x)
{
    return mod289(((x * 34.0) + 1.0) * x);
}


float noise(vec3 p)
{
    vec3 a = floor(p);
    vec3 d = p - a;
    d = d * d * (3.0 - 2.0 * d);

    vec4 b = a.xxyy + vec4(0.0, 1.0, 0.0, 1.0);
    vec4 k1 = perm(b.xyxy);
    vec4 k2 = perm(k1.xyxy + b.zzww);

    vec4 c = k2 + a.zzzz;
    vec4 k3 = perm(c);
    vec4 k4 = perm(c + 1.0);

    vec4 o1 = fract(k3 * (1.0 / 41.0));
    vec4 o2 = fract(k4 * (1.0 / 41.0));

    vec4 o3 = o2 * d.z + o1 * (1.0 - d.z);
    vec2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);

    return o4.y * d.y + o4.x * (1.0 - d.y);
}
float field(in vec3 p, float s)
{
    float strength = 7. + .03 * log(1.e-6 + fract(sin(Time) * 4373.11));
    float accum = s / 4.;
    float prev = 0.;
    float tw = 0.;
    for (int i = 0; i < 26; ++i)
    {
        float mag = dot(p, p);
        p = abs(p) / mag + vec3(-.5, -.4, -1.5);
        float w = exp(-float(i) / 7.);
        accum += w * exp(-strength * pow(abs(mag - prev), 2.2));
        tw += w;
        prev = mag;
    }
    return max(0., 5. * accum / tw - .7);
}

// Less iterations for second layer
float field2(in vec3 p, float s)
{
    float strength = 7. + .03 * log(1.e-6 + fract(sin(Time) * 4373.11));
    float accum = s / 4.;
    float prev = 0.;
    float tw = 0.;
    for (int i = 0; i < 18; ++i)
    {
        float mag = dot(p, p);
        p = abs(p) / mag + vec3(-.5, -.4, -1.5);
        float w = exp(-float(i) / 7.);
        accum += w * exp(-strength * pow(abs(mag - prev), 2.2));
        tw += w;
        prev = mag;
    }
    return max(0., 5. * accum / tw - .7);
}

vec3 nrand3(vec2 co)
{
	vec3 a = fract(cos(co.x * 8.3e-3 + co.y ) * vec3(1.3e5, 4.7e5, 2.9e5));
	vec3 b = fract(sin(co.x * 0.3e-3 + co.y) * vec3(8.1e5, 1.0e5, 0.1e5));
	vec3 c = mix(a, b, 0.5);
	
    return c;
}


vec4 mainEffect2(float2 uvout, vec4 effColor)
{
    float4 fragColor = vec4(0, 0, 0, 1.);
    float2 iResolution = float2(resolutionX, resolutionY);
    float2 fragCoord = float2(iResolution.x * uvout.x, iResolution.y * uvout.y);
    
    vec2 uv = 2. * fragCoord.xy / iResolution.xy - 1.;
    vec2 uvs = uv * iResolution.xy / max(iResolution.x, iResolution.y);
    vec3 p = vec3(uvs / 4., 0) + vec3(1., -1.3, 0.);
    p += .2 * vec3(sin(Time / 16.), sin(Time / 12.), sin(Time / 128.));

    float freqs[4] = { 0, 0, 0, 0 };
	

    float v = (1. - exp((abs(uv.x) - 1.) * 6.)) * (1. - exp((abs(uv.y) - 1.) * 6.));
    
    //Second Layer
    vec3 p2 = vec3(uvs / (4. + sin(Time * 0.11) * 0.2 + 0.2 + sin(Time * 0.15) * 0.3 + 0.4), 1.5) + vec3(2., -1.3, -1.);
    p2 += 0.25 * vec3(sin(Time / 16.), sin(Time / 12.), sin(Time / 128.));
    float t2 = field2(p2, freqs[3]);
    
    float3 tmp = effColor;
    vec4 c2 = mix(.4, 1., v) * vec4(tmp.r * t2 * t2 * t2, tmp.g * t2 * t2, t2 * tmp.b, t2);
    
	
    float sc = 0.0;
    vec4 starcolor = vec4(0, 0, 0, 0);
    if (starsLayout.x > 0)
    {
        vec2 seed = p.xy * 2.0 * StarZoom;
        seed = floor(seed * iResolution.x);
        vec3 rnd = nrand3(seed);
        sc = pow(abs(rnd.y), 100.0 - starsLayout.x);
        starcolor = vec4(sc, sc, sc, sc);
    }
    if (starsLayout.y > 0)
    {
        //Second Layer
        vec2 seed2 = p2.xy * 2.0 * StarZoom;
        seed2 = floor(seed2 * iResolution.x);
        vec3 rnd2 = nrand3(seed2);
        sc = pow(abs(rnd2.y), 100.0 - starsLayout.y);
        starcolor += vec4(sc, sc, sc, sc);
    }
    
    fragColor = mix(freqs[3] - .3, 1., v) * vec4(1.5 * freqs[2], 1.2 * freqs[1], freqs[3], 1.0) + c2 + starcolor;

    fragColor.a = 1.0;
	
    return fragColor;
}

vec4 mainEffect(float2 uvout, vec4 effColor)
{
    float4 fragColor = vec4(0, 0, 0, 1.);
    float2 iResolution = float2(resolutionX, resolutionY);
    float2 fragCoord = float2(iResolution.x * uvout.x, iResolution.y * uvout.y);
    vec2 uv = 2. * fragCoord.xy / iResolution.xy - 1.;
    vec2 uvs = uv * iResolution.xy / max(iResolution.x, iResolution.y);
    vec3 p = vec3(uvs / 4., 0) + vec3(1., -1.3, 0.);
    p += .2 * vec3(sin(Time / 16.), sin(Time / 12.), sin(Time / 128.));
    
    float freqs[4];
    freqs[0] = noise(vec3(0.01 * 100.0, 0.25, Time / 10.0)) * freqsRatio.r;
    freqs[1] = noise(vec3(0.07 * 100.0, 0.25, Time / 10.0)) * freqsRatio.g;
    freqs[2] = noise(vec3(0.15 * 100.0, 0.25, Time / 10.0)) * freqsRatio.b;
    freqs[3] = noise(vec3(0.30 * 100.0, 0.25, Time / 10.0)) * freqsRatio.a;

    float t = field(p, freqs[2]);
    float v = (1. - exp((abs(uv.x) - 1.) * 6.)) * (1. - exp((abs(uv.y) - 1.) * 6.));
	
    //Second Layer
    vec3 p2 = vec3(uvs / (4. + sin(Time * 0.11) * 0.2 + 0.2 + sin(Time * 0.15) * 0.3 + 0.4), 1.5) + vec3(2., -1.3, -1.);
    p2 += 0.25 * vec3(sin(Time / 16.), sin(Time / 12.), sin(Time / 128.));
    float t2 = field2(p2, freqs[3]);
    float3 tmp = effColor;
    vec4 c2 = mix(.4, 1., v) * vec4(tmp.r * t2 * t2 * t2, tmp.g * t2 * t2, t2 * tmp.b * freqs[0], t2);
    
   
    float sc = 0.0;
    vec4 starcolor = vec4(0, 0, 0, 0);
    if (starsLayout.x > 0)
    {
        vec2 seed = p.xy * 2.0 * StarZoom;
        seed = floor(seed * iResolution.x);
        vec3 rnd = nrand3(seed);
        sc = pow(abs(rnd.y), 100.0 - starsLayout.x);
        starcolor = vec4(sc, sc, sc, sc);
    }
    if (starsLayout.y > 0)
    {
        //Second Layer
        vec2 seed2 = p2.xy * 2.0 * StarZoom;
        seed2 = floor(seed2 * iResolution.x);
        vec3 rnd2 = nrand3(seed2);
        sc = pow(abs(rnd2.y), 100.0 - starsLayout.y);
        starcolor += vec4(sc, sc, sc, sc);
    }

    fragColor = mix(freqs[3] - .3, 1., v) * vec4(1.5 * freqs[2] * t * t * t, 1.2 * freqs[1] * t * t, freqs[3] * t, 1.0) + c2 + starcolor;

    fragColor.a = 1.0;
    return fragColor;
}
//void mainImage(out vec4 fragColor, in vec2 fragCoord)
float4 main(float2 uvin : TEXCOORD) : COLOR
{
    
    float2 uvbg = uvin;
    vec2 offsetEff = MouseOffset, offsetImg = MouseOffset;
    if (imgUpDownReverse != 0)
    {
        uvbg.y = 1.0 - uvbg.y;
        offsetImg.y = 1.0 - offsetImg.y;
    }

    if (imgDirection != 0)
    {
        uvbg.x = 1.0 - uvbg.x;
        offsetImg.x = 1.0 - offsetImg.x;
    }

    float2 uvout = uvin;
    if (UpDownReverse == 0)
    {
        uvout.y = 1.0 - uvout.y;
        offsetEff.y = 1.0 - offsetEff.y;
    }

    if (direction != 0)
    {
        uvout.x = 1.0 - uvout.x;
        offsetEff.x = 1.0 - offsetEff.x;
    }


    float zoomEff = zoomMove.x;
    float realZoom = 1.0 + zoomEff;
    if (MouseMoveSync == -1)
    {
        offsetEff.x = (1.0 - offsetEff.x);
        offsetEff.y = (1.0 - offsetEff.y);
    }
    float offset_x = offsetEff.x * (zoomEff / realZoom);
    float offset_y = offsetEff.y * (zoomEff / realZoom);

    float zoomPic = zoomMove.y;
    float realZoomPic = 1.0 + zoomPic;

    if (MouseMoveSync == 1)
    {
        offsetImg.x = (1.0 - offsetImg.x);
        offsetImg.y = (1.0 - offsetImg.y);
    }
    float offsetPic_x = offsetImg.x * (zoomPic / realZoomPic);
    float offsetPic_y = offsetImg.y * (zoomPic / realZoomPic);

    uvout = vec2(offset_x + uvout.x / realZoom, offset_y + uvout.y / realZoom);
    uvbg = vec2(offsetPic_x + uvbg.x / realZoomPic, offsetPic_y + uvbg.y / realZoomPic);
    
    
    
    float4 bg = float4(0, 0, 0, 0);
    vec4 fragColor = vec4(0, 0, 0, 0);
    if (Imgshake != 0)
        uvbg = waterProcessing2(uvbg, ImgshakeSpeed, ImgshakeRange, ImgshakeSize);
    bg = texture(iChannel0, uvbg);

    if (alpha == 0)
    {
        bg.a = 1.0;
        return ColorProcessing(bg, ImgHue, ImgSat, ImgLum);
    }     
    else if (MaskType == 0 || MaskValue == 0 || alphaMode == 0)
    {
        vec4 effColor = GetEffectColor(uvin);
        fragColor = mainEffect(uvout,effColor);
        fragColor = ColorProcessing(fragColor, EffHue, EffSat, EffLum);
        bg = ColorProcessing(bg, ImgHue, ImgSat, ImgLum);
		//return bg + fragColor * alpha;
        fragColor = GetblendColor(bg, fragColor, 0);
        fragColor.a = 1.0;
        return fragColor;
    }
	
    float grayOrg = GetMaskValue(bg, uvbg);
    bg = ColorProcessing(bg, ImgHue, ImgSat, ImgLum);
    if (grayOrg >= 1.0)
    {
        bg.a = 1.0;
        return bg;
    }
       
    vec4 effColor = GetEffectColor(uvin);
    fragColor = mainEffect(uvout,effColor);
    fragColor = ColorProcessing(fragColor, EffHue, EffSat, EffLum);
    fragColor = GetblendColor(bg, fragColor, grayOrg);
    
    fragColor.a = 1.0;

    return fragColor;
}
