/// <class>LightraysChromeKey</class>
/// <description>An effect that makes pixels of a particular color transparent.</description>

sampler2D input0 : register(S0);
sampler2D input1 : register(S1);

/// <summary>Time.</summary>
/// <minValue>1</minValue>
/// <maxValue>9999</maxValue>
/// <defaultValue>1</defaultValue>
float Time : register(C0);
/// <summary>ResolutionX.</summary>
/// <minValue>1</minValue>
/// <maxValue>9999</maxValue>
/// <defaultValue>1280</defaultValue>
float resolutionX : register(C1);
/// <summary>ResolutionY.</summary>
/// <minValue>1</minValue>
/// <maxValue>9999</maxValue>
/// <defaultValue>1024</defaultValue>
float resolutionY : register(C2);

/// <summary>The color that becomes transparent.</summary>
/// <defaultValue>#000000</defaultValue>
float4 ColorKey : register(C3);

/// <summary>The tolerance in color differences.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0.3</defaultValue>
float Tolerance : register(C4);
/// <summary>The tolerance in color differences.</summary>
/// <minValue>0</minValue>
/// <maxValue>2</maxValue>
/// <defaultValue>1</defaultValue>
float alpha1 : register(C5);
/// <summary>The tolerance in color differences.</summary>
/// <minValue>0</minValue>
/// <maxValue>2</maxValue>
/// <defaultValue>1</defaultValue>
float alpha2 : register(C6);
/// <summary>The tolerance in color differences.</summary>
/// <minValue>0</minValue>
/// <maxValue>3</maxValue>
/// <defaultValue>2</defaultValue>
float maskColorChannel : register(C7);

/// <summary>direction.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0</defaultValue>
float direction : register(C8);

/// <summary>UpDownReverse.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0</defaultValue>
float UpDownReverse : register(C9);


/// <summary>imgDirection.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0</defaultValue>
float imgDirection : register(C10);

/// <summary>imgUpDownReverse.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0</defaultValue>
float imgUpDownReverse : register(C11);


/// <summary>ImgHue.</summary>
/// <minValue>0</minValue>
/// <maxValue>360</maxValue>
/// <defaultValue>0</defaultValue>
float ImgHue : register(C12); // 0..360, default 0
/// <summary>ImgSat.</summary>
/// <minValue>0</minValue>
/// <maxValue>2</maxValue>
/// <defaultValue>1</defaultValue>
float ImgSat : register(C13); // 0..2, default 1
/// <summary>ImgLum.</summary>
/// <minValue>-1</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0</defaultValue>
float ImgLum : register(C14); // -1..1, default 0


/// <summary>EffHue.</summary>
/// <minValue>0</minValue>
/// <maxValue>360</maxValue>
/// <defaultValue>0</defaultValue>
float EffHue : register(C15); // 0..360, default 0
/// <summary>EffSat.</summary>
/// <minValue>0</minValue>
/// <maxValue>2</maxValue>
/// <defaultValue>1</defaultValue>
float EffSat : register(C16); // 0..2, default 1
/// <summary>EffLum.</summary>
/// <minValue>-1</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0</defaultValue>
float EffLum : register(C17); // -1..1, default 0

/// <defaultValue>#ffffff</defaultValue>
float4 EffColor : register(C18); // -1..1, default 0

/// <summary>colours.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0</defaultValue>
float colours : register(C19);


/// <defaultValue>#ffffff</defaultValue>
float4 LightraysColor : register(C20);

/// <summary>LightraysOffX.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0.5</defaultValue>
float LightraysOffX : register(C21);

/// <summary>LightraysAlpha.</summary>
/// <minValue>0</minValue>
/// <maxValue>2</maxValue>
/// <defaultValue>1</defaultValue>
float LightraysAlpha : register(C22);

/// <summary>LightraysUpDownReverse.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0</defaultValue>
float LightraysUpDownReverse : register(C23);

/// <summary>LightraysDensity.</summary>
/// <minValue>0</minValue>
/// <maxValue>10</maxValue>
/// <defaultValue>1</defaultValue>
float LightraysDensity : register(C24);

/// <summary>LightraysHue.</summary>
/// <minValue>0</minValue>
/// <maxValue>360</maxValue>
/// <defaultValue>0</defaultValue>
float LightraysHue : register(C25); // 0..360, default 0
/// <summary>LightraysSat.</summary>
/// <minValue>0</minValue>
/// <maxValue>2</maxValue>
/// <defaultValue>1</defaultValue>
float LightraysSat : register(C26); // 0..2, default 1
/// <summary>LightraysLum.</summary>
/// <minValue>-1</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0</defaultValue>
float LightraysLum : register(C27); // -1..1, default 0
/// <summary>UseLightraysLum.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>1</defaultValue>
float UseLightraysLum : register(C28); // -1..1, default 0


/// <summary>Imgshake.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>1</defaultValue>
float Imgshake : register(C29);

/// <summary>ImgshakeSpeed.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0.3</defaultValue>
float ImgshakeSpeed : register(C30);

/// <summary>ImgshakeSize.</summary>
/// <minValue>0</minValue>
/// <maxValue>100</maxValue>
/// <defaultValue>10</defaultValue>
float ImgshakeSize : register(C31);

/// <summary>ImgshakeRang.</summary>
/// <minValue>0</minValue>
/// <maxValue>10</maxValue>
/// <defaultValue>3</defaultValue>
float ImgshakeRange: register(C32);

float ToleranceBack : register(C33);     // ColorKey和输入图像的容差
float ToleranceEdge1 : register(C34);    // 表示ColorKey最大的颜色值与余下两个颜色值之差的容差
float ToleranceEdge2 : register(C35);    // 表示ColorKey最大的颜色值的两个颜色值之差的容差
float MaxColor : register(C36);          // 知识ColorKey中最大的颜色值是哪一个

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

float rayStrength(float2 raySource, float2 rayRefDirection, float2 coord, float seedA, float seedB, float speed)
{
    float2 sourceToCoord = coord - raySource;
    float cosAngle = dot(normalize(sourceToCoord), rayRefDirection);
	
    return clamp(
		(0.45 + 0.15 * sin(cosAngle * seedA + Time * speed)) +
		(0.3 + 0.2 * cos(-cosAngle * seedB + Time * speed)),
		0.0, 1.0) *
		clamp((resolutionX - length(sourceToCoord)) / resolutionX, 0.5, 1.0);
}

vec2 ws(vec2 p, float s, float r, float w)
{
	float d = Time * s, x = w * (1.0 + r) * (p.x + d), y = w * (1.0 + r) * (p.y + d);
	return vec2(cos(x - y) * cos(y), sin(x + y) * sin(y));
}

vec2 waterProcessing2(vec2 uvin, float s, float rand,  float width)
{
	float2 uvout = uvin;
	uvout.y = 1.0 - uvout.y;

	float2 iResolution = float2(resolutionX, resolutionY);
	float2 fragCoord = float2(iResolution.x * uvout.x, iResolution.y * uvout.y);

	vec2 r = fragCoord / iResolution, q = r + 2. / iResolution.x * (ws(r, s, rand, width) - ws(r + iResolution, s, rand,width));

	q.y = 1. - q.y;
	q.y = max(0, q.y);
	q.x = max(0, q.x);
	q.y = min(1, q.y);
	q.x = min(1, q.x);
	return q;
}

float4 main(float2 uvin : TEXCOORD) : COLOR
{

    float2 uvbg = uvin;
    if (imgUpDownReverse != 0)
        uvbg.y = 1.0 - uvbg.y;

    if (imgDirection != 0)
        uvbg.x = 1.0 - uvbg.x;


    float2 uvout = uvin;
    if (UpDownReverse != 0)
        uvout.y = 1.0 - uvout.y;
    if (direction != 0)
        uvout.x = 1.0 - uvout.x;

    float4 color = tex2D(input1, uvout) * alpha1;
    float4 color2 = vec4(0, 0, 0, 0); //tex2D(input0, uvbg) * alpha2;
    

    if (Imgshake != 0)
    {
        float2 iResolution = float2(resolutionX, resolutionY);
        float2 fragCoord = float2(iResolution.x * uvbg.x, iResolution.y * -uvbg.y);
        color2 = tex2D(input0, waterProcessing2(uvbg, ImgshakeSpeed, ImgshakeRange, ImgshakeSize)) * alpha2 ;
    }
    else
    {
        color2 = tex2D(input0, uvbg) * alpha2;
    }
 
    float2 iResolution = float2(resolutionX, resolutionY);
    float2 fragCoord = float2(iResolution.x * uvout.x, iResolution.y * -uvout.y);
    if (maskColorChannel > 0)
    {
        if (maskColorChannel <= 1)
        {
            color.r = clamp((color.g + color.b) / 2.0, 0, 1);
        }
        else if (maskColorChannel <= 2)
        {
            color.g = clamp((color.r + color.b) / 2.0, 0, 1);
        }
        else if (maskColorChannel <= 3)
        {
            color.b = clamp((color.r + color.b) / 2.0, 0, 1);
        }
    }
   
    float r3 = abs(color.r - ColorKey.r);
    float g3 = abs(color.g - ColorKey.g);
    float b3 = abs(color.b - ColorKey.b);

    float diff = sqrt(r3 * r3 + g3 * g3 + b3 * b3) * Tolerance;
   

    color2 = ColorProcessing(color2, ImgHue, ImgSat, ImgLum);

   vec4 effCol = vec4(0, 0, 0, 1.);
    if (colours != 0)
        effCol.xyz = vec3(asin(uvout.x * 1.0), acos(uvout.y * 1.0), asin(atan2(uvout.x, uvout.y) * 1.0));
    else
        effCol = EffColor;

    color *= effCol;
    color = ColorProcessing(color, EffHue, EffSat, EffLum);
    if (diff >= 1)
        color = color * clamp((diff) * (alpha1), 0, 1);
    else if (diff <= 0.05)
        color = color2 * clamp((1 - diff) * (alpha2), 0, 1);
    else
    {
        float alpha = clamp((diff) * (alpha1), 0, 1);
        color.rgb = color.rgb * clamp((diff) * (alpha1), 0, 1) + color2.rgb * clamp((1 - diff) * (alpha2), 0, 1);
    }
		
    if (UseLightraysLum == 0)
        return color;

    //Lightrays
    iResolution = float2(resolutionX * LightraysDensity, resolutionY);
    if (LightraysUpDownReverse == 1)
        fragCoord.y = -fragCoord.y;
    
    float2 coord = float2(fragCoord.x, iResolution.y - fragCoord.y);
	
	  // Set the parameters of the sun rays
    float2 rayPos1 = float2(iResolution.x * LightraysOffX, iResolution.y * -0.4);
    float2 rayRefDir1 = normalize(float2(1.0, -0.116));
    float raySeedA1 = 36.2214;
    float raySeedB1 = 21.11349;
    float raySpeed1 = 1.5;
	
    float2 rayPos2 = float2(iResolution.x * LightraysOffX - 0.1, iResolution.y * -0.6);
    float2 rayRefDir2 = normalize(float2(1.0, 0.241));
    const float raySeedA2 = 22.39910;
    const float raySeedB2 = 18.0234;
    const float raySpeed2 = 1.1;
	
	// Calculate the colour of the sun rays on the current fragment
    float4 rays1 =
		float4(1.0, 1.0, 1.0, 1.0) *
		rayStrength(rayPos1, rayRefDir1, coord, raySeedA1, raySeedB1, raySpeed1);
	 
    float4 rays2 =
		float4(1.0, 1.0, 1.0, 1.0) *
		rayStrength(rayPos2, rayRefDir2, coord, raySeedA2, raySeedB2, raySpeed2);
	
    float4 fragColor = rays1 * 0.5 + rays2 * 0.4;
	
	// Attenuate brightness towards the bottom, simulating light-loss due to depth.
	// Give the whole thing a blue-green tinge as well.
    float brightness = 1.0 - (coord.y / iResolution.y);
    fragColor.x *= 0.5 + (brightness * 0.5);
    fragColor.y *= 0.5 + (brightness * 0.5);
    fragColor.z *= 0.5 + (brightness * 0.5);
    fragColor.w = 1.0;

    float4 tmpcolor = LightraysColor * fragColor;
    tmpcolor = ColorProcessing(tmpcolor, LightraysHue, LightraysSat, LightraysLum);
    tmpcolor *= LightraysAlpha;
    //return tmpcolor;
    color = color + tmpcolor;
    color.a = 1;

    // 如果ColorKey的最大颜色是红色
    if (abs(MaxColor - 1) < 0.000001) {
        // 则计算红色和其余两色差值，以及两个颜色之间的差值
        // 判断是否符合容差值
        if (((color.r - color.g) + (color.r - color.b)) / 2 > ToleranceEdge1
            && (abs(color.g - color.b)) < ToleranceEdge2)
        {
            // 尝试恢复原始的透明度，原始数据已经丢失难以计算，采用经验值进行恢复
            color.a = (1 - color.r) / 2 + (1 - color.g) / 4 + (1 - color.b) / 4;
            // 尝试恢复原始颜色的灰度值
            color.r = color.r * 0.299 + color.g * 0.587 + color.b * 0.114;
            color.g = color.r;
            color.b = color.r;
            // 融合背景的颜色值
            color.rgb = color.rgb * color.a + (1 - color.a) * color2.rgb;
            color.a = 1;
        }
    }
    else if (abs(MaxColor - 2) < 0.000001) {
        if (((color.g - color.r) + (color.g - color.b)) / 2 > ToleranceEdge1
            && (abs(color.r - color.b)) < ToleranceEdge2)
        {
            color.a = (1 - color.g) / 2 + (1 - color.r) / 4 + (1 - color.b) / 4;
            color.g = color.r * 0.299 + color.g * 0.587 + color.b * 0.114;
            color.r = color.g;
            color.b = color.g;
            color.rgb = color.rgb * color.a + (1 - color.a) * color2.rgb;
            color.a = 1;
        }
    }
    else if (abs(MaxColor - 3) < 0.000001) {
        if (((color.b - color.b) + (color.b - color.r)) / 2 > ToleranceEdge1
            && (abs(color.g - color.r)) < ToleranceEdge2)
        {
            color.a = (1 - color.b) / 2 + (1 - color.r) / 4 + (1 - color.g) / 4;
            color.b = color.r * 0.299 + color.g * 0.587 + color.b * 0.114;
            color.r = color.b;
            color.g = color.b;
            color.rgb = color.rgb * color.a + (1 - color.a) * color2.rgb;
            color.a = 1;
        }
    }

    return color;
}
