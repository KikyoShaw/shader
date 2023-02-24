/// <class>OldVideo</class>

sampler2D iChannel0 : register(S0);

/// <summary>iTime.</summary>
/// <minValue>1</minValue>
/// <maxValue>9999</maxValue>
/// <defaultValue>1</defaultValue>
float Time : register(C0);

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

/// <summary>ImgHue.</summary>
/// <minValue>0</minValue>
/// <maxValue>360</maxValue>
/// <defaultValue>0</defaultValue>
float ImgHue : register(C5); // 0..360, default 0

/// <summary>ImgSat.</summary>
/// <minValue>0</minValue>
/// <maxValue>2</maxValue>
/// <defaultValue>1</defaultValue>
float ImgSat : register(C6); // 0..2, default 1
/// <summary>ImgLum.</summary>
/// <minValue>-1</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0</defaultValue>
float ImgLum : register(C7); // -1..1, default 0

/// <summary>Frequency.</summary>
/// <minValue>0</minValue>
/// <maxValue>32</maxValue>
/// <defaultValue>16</defaultValue>
float Frequency : register(C8); // -1..1, default 0

/// <summary>zoomMovePic.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0</defaultValue>
float zoomMovePic : register(C9); // -0.5..1, default 0

/// <summary>The center of the swirl. (100,100) is lower right corner </summary>
/// <minValue>0,0</minValue>
/// <maxValue>1,1</maxValue>
/// <defaultValue>0.5,0.5</defaultValue>
float2 MouseOffset : register(C10); // 1..10, default 5

/// <summary>IsBlackWhile.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0</defaultValue>
float IsBlackWhile : register(C11); // -1..1, default 0
/// <summary>IsLinesflicker.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>1</defaultValue>
float IsLinesflicker : register(C12); // -1..1, default 0
/// <summary>IsBlotches.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>1</defaultValue>
float IsBlotches : register(C13); // -1..1, default 0
/// <summary>IsGrain.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>1</defaultValue>
float IsGrain : register(C14); // -1..1, default 0




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

float rand(float2 co) {
	return frac(sin(dot(co.xy, float2(12.9898, 78.233))) * 43758.5453);
}

float rand(float c) {
	return rand(float2(c, 1.0));
}

float randomLine(float2 uv, float seed)
{
	float b = 0.01 * rand(seed);
	float a = rand(seed + 1.0);
	float c = rand(seed + 2.0) - 0.5;
	float mu = rand(seed + 3.0);

	float l = 1.0;

	if (mu > 0.2)
		l = pow(abs(a * uv.x + b * uv.y + c), 1.0 / 8.0);
	else
		l = 2.0 - pow(abs(a * uv.x + b * uv.y + c), 1.0 / 8.0);

	return lerp(0.5, 1.0, l);
}

// Generate some blotches.
float randomBlotch(float2 uv, float2 iResolution, float seed)
{
	float x = rand(seed);
	float y = rand(seed + 1.0);
	float s = 0.01 * rand(seed + 2.0);

	float2 p = float2(x, y) - uv;
	p.x *= iResolution.x / iResolution.y;
	float a = atan2(p.y, p.x);
	float v = 1.0;
	float ss = s * s * (sin(6.2831 * a * x) * 0.1 + 1.0);

	if (dot(p, p) < ss) v = 0.2;
	else
		v = pow(dot(p, p) - ss, 1.0 / 16.0);

	return lerp(0.3 + 0.2 * (1.0 - (s / 0.02)), 1.0, v);
}

float4 main(float2 uvin : TEXCOORD) : COLOR
{

    float4 bg = float4(0, 0, 0, 0);
    
    float2 uvbg = uvin;
    float2 offsetEff = MouseOffset, offsetImg = MouseOffset;
    if (UpDownReverse != 0)
    {
        uvbg.y = 1.0 - uvbg.y;
        offsetImg.y = 1.0 - offsetImg.y;
    }

    if (direction != 0)
    {
        uvbg.x = 1.0 - uvbg.x;
        offsetImg.x = 1.0 - offsetImg.x;
    }
    float zoomPic = zoomMovePic;
    float realZoomPic = 1.0 + zoomPic;
    float offsetPic_x = offsetImg.x * (zoomPic / realZoomPic);
    float offsetPic_y = offsetImg.y * (zoomPic / realZoomPic);
    uvbg = float2(offsetPic_x + uvbg.x / realZoomPic, offsetPic_y + uvbg.y / realZoomPic);
	
	
	
    float2 uvout = uvbg;
    
    
    float2 iRes = float2(1.0, 1.0);
    float2 fragCoord = float2(uvout.x, uvout.y);
    float iTime = Time;
    float4 fragColor = float4(0,0,0,0);
    float2 uv = fragCoord.xy / iRes.xy;

	// Set frequency of global effect to 15 variations per second
	float t = float(int(iTime * Frequency));

	// Get some image movement
	float2 suv = uv + 0.002 * float2(rand(t), rand(t + 23.0));

	float3 image = tex2D( iChannel0, float2(suv.x, suv.y) ).xyz;
	float3 oldImage = float3(0, 0, 0);
	if (IsBlackWhile != 0.0)
	{
		float luma = dot(float3(0.2126, 0.7152, 0.0722), image);
		oldImage = luma * float3(0.7, 0.7, 0.7);
	}
	else
	{
		oldImage = image;
	}

	// Create a time-varying vignetting effect
	float vI = 16.0 * (uv.x * (1.0 - uv.x) * uv.y * (1.0 - uv.y));
	vI *= lerp(0.7, 1.0, rand(t + 0.5));

	// Add additive flicker
	vI += 1.0 + 0.4 * rand(t + 8.);

	// Add a fixed vignetting (independent of the flicker)
	vI *= pow(16.0 * uv.x * (1.0 - uv.x) * uv.y * (1.0 - uv.y), 0.4);

	// Add some random lines (and some multiplicative flicker. Oh well.)
	if (IsLinesflicker != 0.0)
	{
		int l = int(8.0 * rand(t + 7.0));

		if (0 < l) vI *= randomLine(uv, t + 6.0 + 17. * float(0));
		if (1 < l) vI *= randomLine(uv, t + 6.0 + 17. * float(1));
		if (2 < l) vI *= randomLine(uv, t + 6.0 + 17. * float(2));
		if (3 < l) vI *= randomLine(uv, t + 6.0 + 17. * float(3));
		if (4 < l) vI *= randomLine(uv, t + 6.0 + 17. * float(4));
		if (5 < l) vI *= randomLine(uv, t + 6.0 + 17. * float(5));
		if (6 < l) vI *= randomLine(uv, t + 6.0 + 17. * float(6));
		if (7 < l) vI *= randomLine(uv, t + 6.0 + 17. * float(7));
	}


	// Add some random blotches.
	if (IsBlotches != 0.0)
	{
		int s = int(max(8.0 * rand(t + 18.0) - 2.0, 0.0));

		if (0 < s) vI *= randomBlotch(uv, iRes, t + 6.0 + 19. * float(0));
		if (1 < s) vI *= randomBlotch(uv, iRes, t + 6.0 + 19. * float(1));
		if (2 < s) vI *= randomBlotch(uv, iRes, t + 6.0 + 19. * float(2));
		if (3 < s) vI *= randomBlotch(uv, iRes, t + 6.0 + 19. * float(3));
		if (4 < s) vI *= randomBlotch(uv, iRes, t + 6.0 + 19. * float(4));
		if (5 < s) vI *= randomBlotch(uv, iRes, t + 6.0 + 19. * float(5));
	}

	// Show the image modulated by the defects
	fragColor.xyz = oldImage * vI;

	// Add some grain (thanks, Jose!)
	if (IsGrain != 0.0)
	{
		fragColor.xyz *= (1.0 + (rand(uv + t * .01) - .2) * .15);
	}
   fragColor.a = 1.0;
	//float4 fragColor = bg + float4(result, result, result, result) * 0.7;
	
	fragColor = ColorProcessing(fragColor, ImgHue, ImgSat, ImgLum);
    return fragColor;
}


