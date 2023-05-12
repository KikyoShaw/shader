/// <class>GaussianBlur1</class>
/// <description>An effect that dims all but the brightest pixels.</description>
sampler2D input1 : register(S0);

/// <summary>The brightness offset.</summary>
/// <minValue>0</minValue>
/// <maxValue>30</maxValue>
/// <defaultValue>15</defaultValue>
float SamplesNum : register(C0); // 0..30, default 15
/// <summary>The brightness offset.</summary>
/// <minValue>0</minValue>
/// <maxValue>10</maxValue>
/// <defaultValue>5</defaultValue>
float Sigma : register(C1); // 0..10, default 5
/// <summary>The brightness offset.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>1</defaultValue>
float Temp : register(C1); // 0..1, default1

float Gaussian(float x, float sigma)
{
    return exp(-(x * x) / (2 * sigma * sigma)) / sqrt(2 * 3.14 * sigma * sigma);
}

static float weights[9] = {
        Gaussian(-1, Sigma), Gaussian(0, Sigma), Gaussian(1, Sigma),
        Gaussian(-1, Sigma), Gaussian(0, Sigma), Gaussian(1, Sigma),
        Gaussian(-1, Sigma), Gaussian(0, Sigma), Gaussian(1, Sigma)
};

float4 main(float2 uv : TEXCOORD) : COLOR
{
		float4 color = 0;
    float weightSum = 0;
   
    for (int x = -1; x <= 1; x++)
    {
        for (int y = -1; y <= 1; y++)
        {
            float weight = weights[(x + 1) + (y + 1) * 3];
            float4 currentColor = tex2D(input1, uv + float2(x, y) * Temp);
            color += currentColor * weight;
            weightSum += weight;
        }
		}
     
    return color / weightSum;
}