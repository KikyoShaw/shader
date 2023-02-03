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

/// <summary>Alpha.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>1</defaultValue>
float Alpha : register(C3); // -1..1, default 0

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
    i*0.3086f+s, i*0.3086f,            i*0.3086f,
    i*0.6094f,            i*0.6094f+s, i*0.6094f,
    i*0.0820f,            i*0.0820f,            i*0.0820f+s
  };
  matrixH = mul(matrixH, matrixS);

  float3 c1 = mul(c, matrixH);
  c1 += l;
  return float4(c1, c.a);
}

float4 main(float2 uv : TEXCOORD) : COLOR
{
  float4 c = tex2D(input1, uv);
  c.a = (c.r + c.g + c.b) / 3.0 / Alpha;
  return ColorProcessing(c, Hue, Saturation, Luminosity) ;
}