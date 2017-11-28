Shader "Custom/Test3"
{
	Properties
	{
        _Color ("Color", Color) = (1.0,1.0,1.0,1.0)
        _Tex ("Texture", 2D) = "White"{}
	}

    SubShader
    {
        Tags{"RenderType" = "Opaque"}
        //Tags{"RenderType" = "Transparent"}
        CGPROGRAM
            #pragma surface surf Lambert vertex:vert
            //#pragma surface surf Lambert alpha
            struct Input {
                float4 color : COLOR;
                float2 uv;
            };
            float4 _Color;
            sampler2D _Tex;

            void vert(inout appdata_full v) {
                v.vertex.y -= (v.vertex.z * v.vertex.z) / (5.0 * 5.0);
            }

            void surf(Input IN, inout SurfaceOutput o) {
                o.Albedo =  _Color.rgb;
                //o.Albedo = tex2D(_Tex, IN.uv).rgb;
                //o.Normal = _Color.rgb;
                //o.Emission = _Color.rgb;

                //o.Alpha = 0.9;
            }
        ENDCG
    }
    Fallback "Diffuse"

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
}
