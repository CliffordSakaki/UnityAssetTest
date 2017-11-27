Shader "Custom/Test3"
{
	Properties
	{
        _Color ("Color", Color) = (1.0,1.0,1.0,1.0)
	}
	SubShader
	{
		Pass
		{
            Material{
                Diffuse[_Color]
                Ambient[_Color]
            }
            Lighting On
		}
	}

    SubShader
    {
        Tags{"RenderType" = "Opaque"}
        CGPROGRAM
            #pragma surface surf Lambert
            struct Input {
                float4 color : COLOR;
            };
            float4 _Color;
            void surf(Input IN, inout SurfaceOutput o) {
                o.Albedo = _Color.rgb;
            }
        ENDCG
    }
    Fallback "Diffuse"
}
