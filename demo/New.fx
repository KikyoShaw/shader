/// <class>LumAlpha</class>
/// <description>An effect that dims all but the brightest pixels.</description>
sampler2D input1 : register(S0);

float4 main(float2 uv : TEXCOORD) : COLOR
{
  float4 c = tex2D(input1, uv);
  
  vec4 o = vec4(0);
  vec2 p = vec2(0), c=p, u=FC.xy*2.-iResolution.xy;
  float a;
  for (float i=0; i<4e2; i++) {
    a = i/2e2-1.;
    p = cos(i*2.4+iTime+vec2(0,11))*sqrt(1.-a*a);
    c = u/iResolution.y+vec2(p.x,a)/(p.y+2.);
    o += (cos(i+vec4(0,2,4,0))+1.)/dot(c,c)*(1.-p.y)/3e4;
  }
  return o;
  
  
  return c;
}