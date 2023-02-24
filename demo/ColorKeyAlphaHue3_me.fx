/// <class>ColorKeyAlphaHue3</class>

sampler2D input1 : register(S0);
sampler2D input2 : register(S1);

/// <summary>The color that becomes transparent.</summary>
/// <defaultValue>#00FE19</defaultValue>
float4 ColorKey : register(C0);

/// <summary>The tolerance in color differences.</summary>
/// <minValue>0</minValue>
/// <maxValue>1</maxValue>
/// <defaultValue>0.1</defaultValue>
float Tolerance : register(C1);


// Ĭ�������ͼƬ������͸������ɫ���Ǵ���ɫ
float4 main(float2 uv : TEXCOORD) : COLOR {

   float4 color = tex2D(input1, uv);
   float4 color2 = tex2D(input2, uv);

   // ���͸���Ƚϸߣ�����ɫ��Ƚ����ƣ�����ֱ���������
   if (all(abs(color.rgb - ColorKey.rgb) < Tolerance)) {
      color.rgba = 0;
      return color2;
   }

   // �ֱ����������ɫͨ�������ɫ������1��֮��
   // �Ӷ����Ƶ�ǰͨ�����ܵ�͸����ֵ
   float a1 = (color.r - ColorKey.r) / (1 - ColorKey.r);
   float a2 = (color.g - ColorKey.g) / (1 - ColorKey.g);
   float a3 = (color.b - ColorKey.b) / (1 - ColorKey.b);

   float alpha = 0;
   int times = 0;
   if (abs(color.r - ColorKey.r) > Tolerance) {
        alpha += a1;
        times += 1;
   }
   if (abs(color.g - ColorKey.g) > Tolerance) {
        alpha += a2;
        times += 2;
   }
   if (abs(color.b - ColorKey.b) > Tolerance) {
        alpha += a3;
        times += 4;
   }
   
   if (times == 1 || times == 2 || times == 4) {
       color.r = color2.r * (1 - alpha) + alpha;
       color.g = color2.g * (1 - alpha) + alpha;
       color.b = color2.b * (1 - alpha) + alpha;
       return color;
   }


   return color;
}
