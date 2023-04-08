#include "Basic.hlsli"

// 像素着色器(2D)
float4 PS(VertexPosHTex pIn) : SV_Target
{
   //g_Tex.Sample(g_SamLinear, pIn.tex)根据纹理坐标取出纹理对应位置最为接近的像素
   //Sample方法，需要提供采样器状态和2D纹理坐标方可使用，然后返回一个包含RGBA信息的float4向量
   return g_Tex.Sample(g_SamLinear, pIn.tex);
}