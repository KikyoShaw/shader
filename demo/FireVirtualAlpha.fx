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

/// <defaultValue>#ffffff</defaultValue>
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
#define M_PI 3.14159265359
#define PI 3.14159265359
#define N 64.0
#define Scale vec3(.8, .8, .8)
#define K 19.19


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
    return vec2(LimitOne(uv.x), LimitOne(uv.y));
}
float3 LimitThree(float3 uv)
{
    return vec3(LimitOne(uv.x), LimitOne(uv.y), LimitOne(uv.z));
}


float edgeFade(vec2 uv, float taper, float fade_begin)
{
    uv = uv * 2.0 - 1.0; // [-1,1] uv range.
    uv -= FadePos;
    taper = taper * 2.0;
    fade_begin = (1.0 - fade_begin) * 2.0;
    return 1.0 - pow(length(uv.xy * FadeRatio * fade_begin), taper);
}

float getFadeInWeight(vec2 uv)
{
    uv -= FadePos;
    float fade = 1.0 - ImgFade;
    float edge = (fade)*abs(sin(fade));
    // taken FabriceNeyret2's advice
    vec4 v = smoothstep(0., edge, vec4(uv, 1. - (uv*FadeRatio)));
    return v.x * v.y * v.z * v.w;
}

float GetImgFade(vec2 uv, float taper, float fade_begin)
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

float GetMark(sampler2D iChannel, vec2 uvin)
{
    if (userMask != 0)
    {
        float3 mask = texture(iChannel, uvin).rgb;
        
        float m = 0.299 * mask.r + 0.587 * mask.g + 0.114 * mask.b;

        if (MaskVal > 0)
            return m > MaskVal ? 1.0 : 0.0;
        else
            return m < abs(MaskVal) ? 1.0 : 0.0;
    }
    return 1.0;
}

vec3 spiral_rainbow(float x) {
    vec3 xyz = abs(mod(x + vec3(0.5,1.5,2.5), 3.) - 1.5);
    return 1.0 - pow(
        max(vec3(0.0,0.0,0.0), xyz * 2. - 1.)
    , vec3(2.,2,2));
}

vec4 spiralRainbow(vec2 fragCoord)
{
    vec2 iResolution = vec2(1, 1);
    vec2 uv = fragCoord - 0.5 * (iResolution.xy);

    // Time varying pixel color
    float dist = log(dot(uv, uv));
    float angle = atan2(uv.y, uv.x) / 6.28318530718;
    vec3 col = spiral_rainbow(dist * -0.35 + angle * 3.0 + sin(Time * 2.0 + dist * -5.0) * -0.05 + (sin(10.5 + -Time + dist * 0.7)-1.1) * -0.2);

    // Output to screen
    
    vec4 fragColor = vec4(col, 1.0) * 1;
    fragColor.b *= 3.0;
    fragColor.r *= 2.0;
    fragColor.g *= 1.5;
    return fragColor;    
}

vec4 SlidingRainbow(vec2 fragCoord)
{
    const float SlidingSpeed = 0.1;
    const float SlidingSpeed2 = 5.5;
    const float SlidingScale = 0.25;
    const float SlidingScale2 = 3.0;
    vec2 iResolution = vec2(1, 1);
    //fragCoord.y-=0.3;
   vec3 color = 0.5 + 0.5 * sin(fragCoord.y*SlidingScale2 + sin((fragCoord.x*SlidingScale + Time*SlidingSpeed + vec3(0.0, iResolution.x / 3.0, iResolution.x / 2.0)) * (PI / (iResolution.x / 3.0))));

    vec4 fragColor = vec4(color, 1.0);
    return fragColor;    
}

vec3 hash(vec3 p3)
{
	p3 = fract(p3 * Scale);
    p3 += dot(p3, p3.yxz+19.19);
    return fract((p3.xxy + p3.yxx)*p3.zyx);

}

vec3 noise( in vec3 x )
{
    vec3 p = floor(x);
    vec3 f = fract(x);
    f = f*f*(3.0-2.0*f);
	
    return mix(mix(mix( hash(p+vec3(0,0,0)), 
                        hash(p+vec3(1,0,0)),f.x),
                   mix( hash(p+vec3(0,1,0)), 
                        hash(p+vec3(1,1,0)),f.x),f.y),
               mix(mix( hash(p+vec3(0,0,1)), 
                        hash(p+vec3(1,0,1)),f.x),
                   mix( hash(p+vec3(0,1,1)), 
                        hash(p+vec3(1,1,1)),f.x),f.y),f.z);
}

vec3 fbm(in vec3 q)
{
    const mat3 m = mat3( 0.00,  0.80,  0.60,
                    -0.80,  0.36, -0.48,
                    -0.60, -0.48,  0.64 );
    vec3 f = 0.5000 * noise(q);
    q = mul(m, q * 2.01);
    f += 0.2500 * noise(q);
    q = mul(m, q * 2.02);
    f += 0.1250 * noise(q);
    q = mul(m, q * 2.03);
    f += 0.0625 * noise(q);
    q = mul(m, q * 2.04);
    f += 0.03125 * noise(q);
    q = mul(m, q * 2.05);
    f += 0.015625 * noise(q);
    q = mul(m, q * 2.06);
    f += 0.0078125 * noise(q);
    q = mul(m, q * 2.07);
    f += 0.00390625 * noise(q);
    q = mul(m, q * 2.08);
    return vec3(f);
}

float smin( float a, float b )
{
	float k = .1;
    float h = clamp( .5+.5*(b-a)/k, 0., 1. );
    return mix( b, a, h ) - k*h*(1.0-h);
}


float sdSphere(in vec3 p, in float r)
{
    return length(p) - r;
}

vec3 Fire(in vec3 q)
{
    vec3 s = vec3(q) - vec3(0.0,Time*1.8, 0.0);
    s = fbm(s);
    return vec3(max((s.x)*0.9, 0.5*abs(q.x)), smin(s.y, q.y), q.z);
}

float map(in vec3 p)
{
    vec3 q = Fire(p);
    
    float sphere = sdSphere(q, 1.0);
    
    return sphere;
}

float intersect(in vec3 ro, in vec3 rd)
{
    float maxD = 5.0;
    int iterations = 4;
    float h = 1.0;
    float t = 0.0;
    
    for(int i = 0; i < iterations; i++)
    {
        if(h < 0.001 || t > maxD)
            break;
        h = map(ro+rd*t);
        t += h;
    }
    if( t>maxD ) t=-1.0;
    return t;
    
}


vec4 mainEffect(float2 uvout)
{
    vec4 fragColor = vec4(0, 0, 0, 0);
    float2 iResolution = float2(resolutionX, resolutionY);
    float2 fragCoord = float2(iResolution.x * uvout.x, iResolution.y * uvout.y);
    
    vec2 uv = fragCoord.xy / iResolution.xy;
    uv = uv * 2.0 - 1.0;
    uv.x *= iResolution.x/iResolution.y;
    
    //uv=floor(uv*iResolution.xy/6.0)*6.0;
    //uv=uv/iResolution.xy;
    
    vec3 ro = vec3(0.0, 0.85, 2.15);
    vec3 rd = normalize(vec3(uv, -1.0));
    float t = 0.0;
    
    
    t = intersect(ro, rd);
    vec3 pos = ro+rd*t;
    vec3 fire = vec3(0.0,0.0,0.0);
    
    if(t > 0.0)
    {
        vec3 pos = ro+rd*t;
        float tmp = t*t-1.0;
        fire = 1.0 - vec3(tmp,tmp,tmp);
        fire = vec3((fire.x+1.0)*1.5-pos.y, (fire.x+0.8)*1.3-pos.y, (1.9+fire.x*2.0) * smoothstep(-0.1, 0.5, pos.y) );
    }
    
    // Output to screen
    fragColor = vec4(fire,fire.x);
    return saturate(fragColor);
}

//void mainImage(out vec4 fragColor, in vec2 fragCoord)
float4 main(float2 uvin : TEXCOORD) : COLOR
{

    if(uvin.x < DistiorMargin.x || (1.0-uvin.x) < DistiorMargin.z||
       uvin.y < DistiorMargin.y || (1.0-uvin.y) < DistiorMargin.w)
    {
      return vec4(0,0,0,0);
    }

    float mark = GetMark(iChannel0, uvin);
    if (mark == 0)
      return vec4(0,0,0,0);
    float alpha = GetImgFade(uvin, ImgTaper, ImgFade);
    if (alpha < 0.001)
    {
        return vec4(0,0,0,0);
    }
    vec2 uv2 = uvin ;
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
    

    vec4 fragColor = vec4(0, 0, 0, 0);
    
    fragColor = mainEffect(uvout);    
    fragColor.rgb = ColorProcessing(fragColor, EffHue, EffSat, EffLum).rgb;
    fragColor *= EffAlpha;
    fragColor = lerp(vec4(0,0,0,0), fragColor, alpha);
    //fragColor.a = 1.0;
    return fragColor;
    

}
