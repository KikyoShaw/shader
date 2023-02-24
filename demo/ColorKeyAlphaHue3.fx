sampler2D input1 : register(S0);        // �滻͸���㲢ѹ�����ͼƬ
sampler2D input2 : register(S1);        // ѡ��������ı�����
                                        // ����չʾ������ɫ�ı����������ͨ��shader��̺���Ϊ͸����

float4 ColorKey : register(C0);         // �滻͸����ı���ɫ
float ToleranceBack : register(C1);     // ColorKey������ͼ����ݲ�
float ToleranceEdge1 : register(C2);    // ��ʾColorKey������ɫֵ������������ɫֵ֮����ݲ�
float ToleranceEdge2 : register(C3);    // ��ʾColorKey������ɫֵ��������ɫֵ֮����ݲ�
float MaxColor : register(C4);          // ֪ʶColorKey��������ɫֵ����һ��


float4 main(float2 uv : TEXCOORD) : COLOR
{
    // ��ȡ����ͼ��ǰ���ص���ɫֵ
    float4 color = tex2D(input1, uv);
    float4 color2 = tex2D(input2, uv);

    // ���ColorKey����ɫ��ѹ��ͼ�����ɫС�ڱ����ݲ�
    // ����Ϊ��һ������ȫ͸���ģ����ر���ͼ�����ɫ
    if (all(abs(color.rgb - ColorKey.rgb) < ToleranceBack)) {
        color.rgba = 0;
        return color2;
    }

    // ���ColorKey�������ɫ�Ǻ�ɫ
    if (abs(MaxColor - 1) < 0.000001) {
        // ������ɫ��������ɫ��ֵ���Լ�������ɫ֮��Ĳ�ֵ
        // �ж��Ƿ�����ݲ�ֵ
        if (((color.r - color.g) + (color.r - color.b)) / 2 > ToleranceEdge1
            && (abs(color.g - color.b)) < ToleranceEdge2)
        {
            // ���Իָ�ԭʼ��͸���ȣ�ԭʼ�����Ѿ���ʧ���Լ��㣬���þ���ֵ���лָ�
            color.a = (1 - color.r) / 2 + (1 - color.g) / 4 + (1 - color.b) / 4;
            // ���Իָ�ԭʼ��ɫ�ĻҶ�ֵ
            color.r = color.r * 0.299 + color.g * 0.587 + color.b * 0.114;
            color.g = color.r;
            color.b = color.r;
            // �ںϱ�������ɫֵ
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
