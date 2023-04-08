#include "LightHelper.hlsli"

//保存了2D纹理的信息
Texture2D g_Tex : register(t0);
//确定采样器应如何进行采样
SamplerState g_SamLinear : register(s0);

//利用的是混合纹理，那么需要两个纹理资源和采样器
Texture2D g_Tex1 : register(t1);//以索引为1起始槽
SamplerState g_SamLinear1 : register(s1); //以索引为1起始槽

cbuffer VSConstantBuffer : register(b0)
{
    matrix g_World; 
    matrix g_View;  
    matrix g_Proj;  
    matrix g_WorldInvTranspose;
    //声明一个旋转矩阵,用于纹理旋转
    matrix  g_RotationMatrix;
}

cbuffer PSConstantBuffer : register(b1)
{
    DirectionalLight g_DirLight[10];
    PointLight g_PointLight[10];
    SpotLight g_SpotLight[10];
    Material g_Material;
    int g_NumDirLight;
    int g_NumPointLight;
    int g_NumSpotLight;
    float g_Pad1;

    float3 g_EyePosW;
    float g_Pad2;
}


struct VertexPosNormalTex
{
    float3 posL : POSITION;
    float3 normalL : NORMAL;
    float2 tex : TEXCOORD;
};

struct VertexPosTex
{
    float3 posL : POSITION;
    float2 tex : TEXCOORD;
};

struct VertexPosHWNormalTex
{
    float4 posH : SV_POSITION;
    float3 posW : POSITION;     // 在世界中的位置
    float3 normalW : NORMAL;    // 法向量在世界中的方向
    float2 tex : TEXCOORD;
};

struct VertexPosHTex
{
    float4 posH : SV_POSITION;
    float2 tex : TEXCOORD;
};










