/// <class>ImageAlphaFadeEffect</class>

sampler2D input0 : register(S0);

/// <summary>Time.</summary>
/// <minValue>1</minValue>
/// <maxValue>9999</maxValue>
/// <defaultValue>1</defaultValue>
float Time : register(C0);
/// <summary>The color that becomes transparent.</summary>
/// <defaultValue>Green</defaultValue>
float4 ColorKey : register(C1);

/// <summary>The tolerance in color differences.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0.3</defaultValue>
float Tolerance : register(C2);

/// <summary>ImgHue.</summary>
/// <minValue>0</minValue>
/// <maxValue>360</maxValue>
/// <defaultValue>0</defaultValue>
float Hue : register(C3); // 0..360, default 0
/// <summary>ImgSat.</summary>
/// <minValue>0</minValue>
/// <maxValue>2</maxValue>
/// <defaultValue>1</defaultValue>
float Sat : register(C4); // 0..2, default 1
/// <summary>ImgLum.</summary>
/// <minValue>-1</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0</defaultValue>
float Lum : register(C5); // -1..1, default 0
/// <summary>Alpha.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>1</defaultValue>
float Alpha : register(C6); // -1..1, default 0
/// <summary>direction.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0</defaultValue>
float Direction : register(C7);
/// <summary>UpDownReverse.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0</defaultValue>
float UpDownReverse : register(C8);

/// <summary>Imgshake.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>1</defaultValue>
float Imgshake : register(C9);

/// <summary>ImgshakeSpeed.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0.3</defaultValue>
float ImgshakeSpeed : register(C10);

/// <summary>ImgshakeSize.</summary>
/// <minValue>0</minValue>
/// <maxValue>100</maxValue>
/// <defaultValue>10</defaultValue>
float ImgshakeSize : register(C11);

/// <summary>ImgshakeRang.</summary>
/// <minValue>0</minValue>
/// <maxValue>10</maxValue>
/// <defaultValue>8</defaultValue>
float ImgshakeRange : register(C12);

/// <summary>ImgFade.</summary>
/// <minValue>0</minValue>
/// <maxValue>1.0</maxValue>
/// <defaultValue>0.5</defaultValue>
float ImgFade : register(C13);
#define vec2 float2
#define vec3 float3
#define vec4 float4

float4 ColorProcessing(float4 c, float h, float s, float l)
{
	float3x3 matrixH =
	{
	  0.8164966f,  0,           0.5352037f,
	 -0.4082483f,  0.70710677f, 1.0548190f,
	 -0.4082483f, -0.70710677f, 0.1420281f
	};

	float3x3 matrixH2 =
	{
	  0.84630f, -0.37844f, -0.37844f,
	 -0.37265f,  0.33446f, -1.07975f,
	  0.57735f,  0.57735f,  0.57735f
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
		mi * 0.3086f + s, mi * 0.3086f,            mi * 0.3086f,
		mi * 0.6094f,            mi * 0.6094f + s, mi * 0.6094f,
		mi * 0.0820f,            mi * 0.0820f,            mi * 0.0820f + s
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

	float2 iResolution = float2(1280, 1024);
	float2 fragCoord = float2(iResolution.x * uvout.x, iResolution.y * uvout.y);

	vec2 r = fragCoord / iResolution, q = r + 2. / iResolution.x * (ws(r, s, rand, width) - ws(r + iResolution, s, rand, width));

	q.y = 1. - q.y;
	q.y = max(0, q.y);
	q.x = max(0, q.x);
	q.y = min(1, q.y);
	q.x = min(1, q.x);
	return q;
}


float getFadeInWeight(vec2 uv)
{
	float edge = ImgFade * abs(sin(ImgFade));
	// taken FabriceNeyret2's advice
	vec4 v = smoothstep(0., edge, vec4(uv, 1. - uv));
	return v.x * v.y * v.z * v.w;
}

float4 main(float2 uv : TEXCOORD) : COLOR
{
    if (UpDownReverse != 0)
    {
        uv.y = 1.0 - uv.y;
    }

    if (Direction != 0)
    {
        uv.x = 1.0 - uv.x;
    }

	float4 color = float4(0, 0, 0, 0);

	if (Imgshake != 0)
	{
		uv = waterProcessing2(uv, ImgshakeSpeed, ImgshakeRange, ImgshakeSize);
	}
	

	color = tex2D(input0, uv);
   if (all(abs(color.rgb - ColorKey.rgb) < Tolerance)) {
      color.rgba = 0;
      return color;
   }
   color = ColorProcessing(color, Hue, Sat, Lum);
   color *= Alpha;

   float alpha = getFadeInWeight(uv);
   color = lerp(vec4(0,0,0,0), color, alpha);
   return color;
}
