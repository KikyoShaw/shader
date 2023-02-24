/// <class>LumAlpha</class>
/// <description>An effect that dims all but the brightest pixels.</description>
sampler2D input1 : register(S0);

/// <summary>The brightness offset.</summary>
/// <minValue>0</minValue>
/// <maxValue>360</maxValue>
/// <defaultValue>0</defaultValue>
float Hue : register(C0); // 0..360, default 0
/// <summary>The brightness offset.</summary>
/// <minValue>0</minValue>
/// <maxValue>2</maxValue>
/// <defaultValue>1</defaultValue>
float Saturation : register(C1); // 0..2, default 1
/// <summary>The brightness offset.</summary>
/// <minValue>-1</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0</defaultValue>
float Luminosity : register(C2); // -1..1, default 0
/// <summary>Pos.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>1</defaultValue>
float Pos : register(C3); // 0..1, default 1

static float3x3 matrixH =
{
  0.8164966f,  0,           0.5352037f,
 -0.4082483f,  0.70710677f, 1.0548190f,
 -0.4082483f, -0.70710677f, 0.1420281f
};

static float3x3 matrixH2 =
{
  0.84630f, -0.37844f, -0.37844f,
 -0.37265f,  0.33446f, -1.07975f,
  0.57735f,  0.57735f,  0.57735f
};

float4 ColorProcessing(float4 c, float h, float s, float l)
{
	float a = c.a;
	float3x3 rotateZ =
  {
    cos(radians(h)), sin(radians(h)), 0,
   -sin(radians(h)), cos(radians(h)), 0,
    0,                 0,                 1
  };
  matrixH = mul(matrixH, rotateZ);
  matrixH = mul(matrixH, matrixH2);

  float i = 1 - s;
  float3x3 matrixS =
  {
    i*0.3086f+s, i*0.3086f,   i*0.3086f,
    i*0.6094f,   i*0.6094f+s, i*0.6094f,
    i*0.0820f,   i*0.0820f,   i*0.0820f+s
  };
  matrixH = mul(matrixH, matrixS);

  float3 c1 = mul(c, matrixH);
  c1 += l;
  return float4(c1, c.a);
}

float pi = 3.14;

float4 main(float2 uv : TEXCOORD) : COLOR
{
  float4 c = tex2D(input1, uv);
  
  if(uv.y <= Pos)
  	return ColorProcessing(c, Hue, Saturation, Luminosity) ;
  	
  float alp = c.a;
 	//float total = 1.0 - Pos;
  //float cur = uv.y - Pos;
  //c.a *=  1.0 - (cur / total);
  
  //float k2 = 3.14 / (2*Pos - 2);
	//float b2 = -k2;
	//c.a *= sin(uv.y*k2+b2); 
	
	//float k = -(1/(1-Pos));
	//float b = -k;
	//c.a *= (uv.y*k + b);
	
	float fade = 1.0 - Pos;
	float v = smoothstep(0., fade, 1.0 - uv.y);
	//c.a *= v;
	
	//float k = 3.14/(2 - 2*Pos);
	//float b = 3.14/2 - k;
  //c.a *= cos(uv.y*k + b);
  
	c.rgba *= v;
	
 	return ColorProcessing(c, Hue, Saturation, Luminosity) ;
}