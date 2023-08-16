sampler2D input : register(s0);

#define SamplesNum 1

uniform float3x3 weights : register(c0) = {
    0.1111, 0.1111, 0.1111,
    0.1111, 0.1111, 0.1111,
    0.1111, 0.1111, 0.1111
};

float4 main(float2 uv : TEXCOORD) : COLOR
{
    float4 color = 0;
    float weightSum = 0;

    for (int x = -1; x <= 1; x++)
    {
        for (int y = -1; y <= 1; y++)
        {
            float4 currentColor = tex2D(input, uv + float2(x, y) / SamplesNum);
            color += currentColor * weights[x+1][y+1];
            weightSum += weights[x+1][y+1];
        }
    }

    return color / weightSum;
}