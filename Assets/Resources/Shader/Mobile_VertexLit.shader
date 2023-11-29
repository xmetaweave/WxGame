//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Mobile/VertexLit" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
}
SubShader {
 LOD 80
 Tags { "RenderType" = "Opaque" }
 Pass {
  LOD 80
  Tags { "LIGHTMODE" = "Vertex" "RenderType" = "Opaque" }
  Fog {
   Mode Off
  }
  GpuProgramID 156332
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
int u_xlati15;
mediump float u_xlat16_18;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat0.z = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat16_3.xyz = glstate_lightmodel_ambient.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat16_18 = dot(u_xlat0.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_18 = max(u_xlat16_18, 0.0);
        u_xlat16_4.xyz = vec3(u_xlat16_18) * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0.w = 1.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
int u_xlati15;
mediump float u_xlat16_18;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat0.z = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat16_3.xyz = glstate_lightmodel_ambient.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat16_18 = dot(u_xlat0.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_18 = max(u_xlat16_18, 0.0);
        u_xlat16_4.xyz = vec3(u_xlat16_18) * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0.w = 1.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
int u_xlati15;
mediump float u_xlat16_18;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat0.z = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat16_3.xyz = glstate_lightmodel_ambient.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat16_18 = dot(u_xlat0.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_18 = max(u_xlat16_18, 0.0);
        u_xlat16_4.xyz = vec3(u_xlat16_18) * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    }
    vs_COLOR0.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0.w = 1.0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 339
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %161 %245 %258 %259 %271 %318 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %21 0 RelaxedPrecision 
                                                      OpMemberDecorate %21 0 Offset 21 
                                                      OpMemberDecorate %21 1 Offset 21 
                                                      OpMemberDecorate %21 2 Offset 21 
                                                      OpMemberDecorate %21 3 Offset 21 
                                                      OpMemberDecorate %21 4 RelaxedPrecision 
                                                      OpMemberDecorate %21 4 Offset 21 
                                                      OpMemberDecorate %21 5 Offset 21 
                                                      OpMemberDecorate %21 6 Offset 21 
                                                      OpMemberDecorate %21 7 Offset 21 
                                                      OpMemberDecorate %21 8 Offset 21 
                                                      OpDecorate %21 Block 
                                                      OpDecorate %23 DescriptorSet 23 
                                                      OpDecorate %23 Binding 23 
                                                      OpDecorate %161 Location 161 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %245 Location 245 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 258 
                                                      OpDecorate %259 Location 259 
                                                      OpDecorate %271 Location 271 
                                                      OpMemberDecorate %316 0 BuiltIn 316 
                                                      OpMemberDecorate %316 1 BuiltIn 316 
                                                      OpMemberDecorate %316 2 BuiltIn 316 
                                                      OpDecorate %316 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 8 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                          u32 %14 = OpConstant 4 
                                              %15 = OpTypeArray %7 %14 
                                              %16 = OpTypeArray %7 %14 
                                              %17 = OpTypeArray %7 %14 
                                              %18 = OpTypeArray %7 %14 
                                              %19 = OpTypeInt 32 1 
                                              %20 = OpTypeVector %19 4 
                                              %21 = OpTypeStruct %12 %13 %15 %16 %7 %17 %18 %20 %7 
                                              %22 = OpTypePointer Uniform %21 
Uniform struct {f32_4[8]; f32_4[8]; f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4[4]; i32_4; f32_4;}* %23 = OpVariable Uniform 
                                          i32 %24 = OpConstant 3 
                                          i32 %25 = OpConstant 1 
                                              %26 = OpTypeVector %6 3 
                                              %27 = OpTypePointer Uniform %7 
                                          i32 %31 = OpConstant 5 
                                          i32 %32 = OpConstant 0 
                                          i32 %51 = OpConstant 2 
                               Private f32_4* %76 = OpVariable Private 
                                             %122 = OpTypePointer Private %26 
                              Private f32_3* %123 = OpVariable Private 
                                             %160 = OpTypePointer Input %26 
                                Input f32_3* %161 = OpVariable Input 
                                         u32 %164 = OpConstant 0 
                                             %165 = OpTypePointer Private %6 
                                         u32 %171 = OpConstant 1 
                                         u32 %176 = OpConstant 2 
                                Private f32* %178 = OpVariable Private 
                              Private f32_3* %193 = OpVariable Private 
                                         i32 %194 = OpConstant 4 
                                             %198 = OpTypePointer Function %19 
                                         i32 %206 = OpConstant 7 
                                             %207 = OpTypePointer Uniform %19 
                                             %210 = OpTypeBool 
                                Private f32* %212 = OpVariable Private 
                                         f32 %221 = OpConstant 3.674022E-40 
                              Private f32_3* %223 = OpVariable Private 
                                         f32 %232 = OpConstant 3.674022E-40 
                                       f32_3 %233 = OpConstantComposite %232 %232 %232 
                                         f32 %236 = OpConstant 3.674022E-40 
                                       f32_3 %237 = OpConstantComposite %236 %236 %236 
                                             %244 = OpTypePointer Output %7 
                               Output f32_4* %245 = OpVariable Output 
                                             %256 = OpTypeVector %6 2 
                                             %257 = OpTypePointer Output %256 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_3* %259 = OpVariable Input 
                                         i32 %262 = OpConstant 8 
                                Input f32_3* %271 = OpVariable Input 
                                         i32 %297 = OpConstant 6 
                                             %315 = OpTypeArray %6 %171 
                                             %316 = OpTypeStruct %7 %6 %315 
                                             %317 = OpTypePointer Output %316 
        Output struct {f32_4; f32; f32[1];}* %318 = OpVariable Output 
                                         u32 %327 = OpConstant 3 
                                             %328 = OpTypePointer Output %6 
                                             %335 = OpTypePointer Private %210 
                               Private bool* %336 = OpVariable Private 
                                             %337 = OpTypePointer Private %19 
                                Private i32* %338 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function i32* %199 = OpVariable Function 
                               Uniform f32_4* %28 = OpAccessChain %23 %24 %25 
                                        f32_4 %29 = OpLoad %28 
                                        f32_3 %30 = OpVectorShuffle %29 %29 0 1 2 
                               Uniform f32_4* %33 = OpAccessChain %23 %31 %32 
                                        f32_4 %34 = OpLoad %33 
                                        f32_3 %35 = OpVectorShuffle %34 %34 1 1 1 
                                        f32_3 %36 = OpFMul %30 %35 
                                        f32_4 %37 = OpLoad %9 
                                        f32_4 %38 = OpVectorShuffle %37 %36 4 5 6 3 
                                                      OpStore %9 %38 
                               Uniform f32_4* %39 = OpAccessChain %23 %24 %32 
                                        f32_4 %40 = OpLoad %39 
                                        f32_3 %41 = OpVectorShuffle %40 %40 0 1 2 
                               Uniform f32_4* %42 = OpAccessChain %23 %31 %32 
                                        f32_4 %43 = OpLoad %42 
                                        f32_3 %44 = OpVectorShuffle %43 %43 0 0 0 
                                        f32_3 %45 = OpFMul %41 %44 
                                        f32_4 %46 = OpLoad %9 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                                        f32_3 %48 = OpFAdd %45 %47 
                                        f32_4 %49 = OpLoad %9 
                                        f32_4 %50 = OpVectorShuffle %49 %48 4 5 6 3 
                                                      OpStore %9 %50 
                               Uniform f32_4* %52 = OpAccessChain %23 %24 %51 
                                        f32_4 %53 = OpLoad %52 
                                        f32_3 %54 = OpVectorShuffle %53 %53 0 1 2 
                               Uniform f32_4* %55 = OpAccessChain %23 %31 %32 
                                        f32_4 %56 = OpLoad %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 2 2 2 
                                        f32_3 %58 = OpFMul %54 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFAdd %58 %60 
                                        f32_4 %62 = OpLoad %9 
                                        f32_4 %63 = OpVectorShuffle %62 %61 4 5 6 3 
                                                      OpStore %9 %63 
                               Uniform f32_4* %64 = OpAccessChain %23 %24 %24 
                                        f32_4 %65 = OpLoad %64 
                                        f32_3 %66 = OpVectorShuffle %65 %65 0 1 2 
                               Uniform f32_4* %67 = OpAccessChain %23 %31 %32 
                                        f32_4 %68 = OpLoad %67 
                                        f32_3 %69 = OpVectorShuffle %68 %68 3 3 3 
                                        f32_3 %70 = OpFMul %66 %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_3 %72 = OpVectorShuffle %71 %71 0 1 2 
                                        f32_3 %73 = OpFAdd %70 %72 
                                        f32_4 %74 = OpLoad %9 
                                        f32_4 %75 = OpVectorShuffle %74 %73 4 5 6 3 
                                                      OpStore %9 %75 
                               Uniform f32_4* %77 = OpAccessChain %23 %24 %25 
                                        f32_4 %78 = OpLoad %77 
                                        f32_3 %79 = OpVectorShuffle %78 %78 0 1 2 
                               Uniform f32_4* %80 = OpAccessChain %23 %31 %25 
                                        f32_4 %81 = OpLoad %80 
                                        f32_3 %82 = OpVectorShuffle %81 %81 1 1 1 
                                        f32_3 %83 = OpFMul %79 %82 
                                        f32_4 %84 = OpLoad %76 
                                        f32_4 %85 = OpVectorShuffle %84 %83 4 5 6 3 
                                                      OpStore %76 %85 
                               Uniform f32_4* %86 = OpAccessChain %23 %24 %32 
                                        f32_4 %87 = OpLoad %86 
                                        f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
                               Uniform f32_4* %89 = OpAccessChain %23 %31 %25 
                                        f32_4 %90 = OpLoad %89 
                                        f32_3 %91 = OpVectorShuffle %90 %90 0 0 0 
                                        f32_3 %92 = OpFMul %88 %91 
                                        f32_4 %93 = OpLoad %76 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                        f32_3 %95 = OpFAdd %92 %94 
                                        f32_4 %96 = OpLoad %76 
                                        f32_4 %97 = OpVectorShuffle %96 %95 4 5 6 3 
                                                      OpStore %76 %97 
                               Uniform f32_4* %98 = OpAccessChain %23 %24 %51 
                                        f32_4 %99 = OpLoad %98 
                                       f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                              Uniform f32_4* %101 = OpAccessChain %23 %31 %25 
                                       f32_4 %102 = OpLoad %101 
                                       f32_3 %103 = OpVectorShuffle %102 %102 2 2 2 
                                       f32_3 %104 = OpFMul %100 %103 
                                       f32_4 %105 = OpLoad %76 
                                       f32_3 %106 = OpVectorShuffle %105 %105 0 1 2 
                                       f32_3 %107 = OpFAdd %104 %106 
                                       f32_4 %108 = OpLoad %76 
                                       f32_4 %109 = OpVectorShuffle %108 %107 4 5 6 3 
                                                      OpStore %76 %109 
                              Uniform f32_4* %110 = OpAccessChain %23 %24 %24 
                                       f32_4 %111 = OpLoad %110 
                                       f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
                              Uniform f32_4* %113 = OpAccessChain %23 %31 %25 
                                       f32_4 %114 = OpLoad %113 
                                       f32_3 %115 = OpVectorShuffle %114 %114 3 3 3 
                                       f32_3 %116 = OpFMul %112 %115 
                                       f32_4 %117 = OpLoad %76 
                                       f32_3 %118 = OpVectorShuffle %117 %117 0 1 2 
                                       f32_3 %119 = OpFAdd %116 %118 
                                       f32_4 %120 = OpLoad %76 
                                       f32_4 %121 = OpVectorShuffle %120 %119 4 5 6 3 
                                                      OpStore %76 %121 
                              Uniform f32_4* %124 = OpAccessChain %23 %24 %25 
                                       f32_4 %125 = OpLoad %124 
                                       f32_3 %126 = OpVectorShuffle %125 %125 0 1 2 
                              Uniform f32_4* %127 = OpAccessChain %23 %31 %51 
                                       f32_4 %128 = OpLoad %127 
                                       f32_3 %129 = OpVectorShuffle %128 %128 1 1 1 
                                       f32_3 %130 = OpFMul %126 %129 
                                                      OpStore %123 %130 
                              Uniform f32_4* %131 = OpAccessChain %23 %24 %32 
                                       f32_4 %132 = OpLoad %131 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                              Uniform f32_4* %134 = OpAccessChain %23 %31 %51 
                                       f32_4 %135 = OpLoad %134 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 0 0 
                                       f32_3 %137 = OpFMul %133 %136 
                                       f32_3 %138 = OpLoad %123 
                                       f32_3 %139 = OpFAdd %137 %138 
                                                      OpStore %123 %139 
                              Uniform f32_4* %140 = OpAccessChain %23 %24 %51 
                                       f32_4 %141 = OpLoad %140 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                              Uniform f32_4* %143 = OpAccessChain %23 %31 %51 
                                       f32_4 %144 = OpLoad %143 
                                       f32_3 %145 = OpVectorShuffle %144 %144 2 2 2 
                                       f32_3 %146 = OpFMul %142 %145 
                                       f32_3 %147 = OpLoad %123 
                                       f32_3 %148 = OpFAdd %146 %147 
                                                      OpStore %123 %148 
                              Uniform f32_4* %149 = OpAccessChain %23 %24 %24 
                                       f32_4 %150 = OpLoad %149 
                                       f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                              Uniform f32_4* %152 = OpAccessChain %23 %31 %51 
                                       f32_4 %153 = OpLoad %152 
                                       f32_3 %154 = OpVectorShuffle %153 %153 3 3 3 
                                       f32_3 %155 = OpFMul %151 %154 
                                       f32_3 %156 = OpLoad %123 
                                       f32_3 %157 = OpFAdd %155 %156 
                                                      OpStore %123 %157 
                                       f32_4 %158 = OpLoad %9 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                       f32_3 %162 = OpLoad %161 
                                         f32 %163 = OpDot %159 %162 
                                Private f32* %166 = OpAccessChain %9 %164 
                                                      OpStore %166 %163 
                                       f32_4 %167 = OpLoad %76 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_3 %169 = OpLoad %161 
                                         f32 %170 = OpDot %168 %169 
                                Private f32* %172 = OpAccessChain %9 %171 
                                                      OpStore %172 %170 
                                       f32_3 %173 = OpLoad %123 
                                       f32_3 %174 = OpLoad %161 
                                         f32 %175 = OpDot %173 %174 
                                Private f32* %177 = OpAccessChain %9 %176 
                                                      OpStore %177 %175 
                                       f32_4 %179 = OpLoad %9 
                                       f32_3 %180 = OpVectorShuffle %179 %179 0 1 2 
                                       f32_4 %181 = OpLoad %9 
                                       f32_3 %182 = OpVectorShuffle %181 %181 0 1 2 
                                         f32 %183 = OpDot %180 %182 
                                                      OpStore %178 %183 
                                         f32 %184 = OpLoad %178 
                                         f32 %185 = OpExtInst %1 32 %184 
                                                      OpStore %178 %185 
                                         f32 %186 = OpLoad %178 
                                       f32_3 %187 = OpCompositeConstruct %186 %186 %186 
                                       f32_4 %188 = OpLoad %9 
                                       f32_3 %189 = OpVectorShuffle %188 %188 0 1 2 
                                       f32_3 %190 = OpFMul %187 %189 
                                       f32_4 %191 = OpLoad %9 
                                       f32_4 %192 = OpVectorShuffle %191 %190 4 5 6 3 
                                                      OpStore %9 %192 
                              Uniform f32_4* %195 = OpAccessChain %23 %194 
                                       f32_4 %196 = OpLoad %195 
                                       f32_3 %197 = OpVectorShuffle %196 %196 0 1 2 
                                                      OpStore %193 %197 
                                                      OpStore %199 %32 
                                                      OpBranch %200 
                                             %200 = OpLabel 
                                                      OpLoopMerge %202 %203 None 
                                                      OpBranch %204 
                                             %204 = OpLabel 
                                         i32 %205 = OpLoad %199 
                                Uniform i32* %208 = OpAccessChain %23 %206 %164 
                                         i32 %209 = OpLoad %208 
                                        bool %211 = OpSLessThan %205 %209 
                                                      OpBranchConditional %211 %201 %202 
                                             %201 = OpLabel 
                                       f32_4 %213 = OpLoad %9 
                                       f32_3 %214 = OpVectorShuffle %213 %213 0 1 2 
                                         i32 %215 = OpLoad %199 
                              Uniform f32_4* %216 = OpAccessChain %23 %25 %215 
                                       f32_4 %217 = OpLoad %216 
                                       f32_3 %218 = OpVectorShuffle %217 %217 0 1 2 
                                         f32 %219 = OpDot %214 %218 
                                                      OpStore %212 %219 
                                         f32 %220 = OpLoad %212 
                                         f32 %222 = OpExtInst %1 40 %220 %221 
                                                      OpStore %212 %222 
                                         f32 %224 = OpLoad %212 
                                       f32_3 %225 = OpCompositeConstruct %224 %224 %224 
                                         i32 %226 = OpLoad %199 
                              Uniform f32_4* %227 = OpAccessChain %23 %32 %226 
                                       f32_4 %228 = OpLoad %227 
                                       f32_3 %229 = OpVectorShuffle %228 %228 0 1 2 
                                       f32_3 %230 = OpFMul %225 %229 
                                                      OpStore %223 %230 
                                       f32_3 %231 = OpLoad %223 
                                       f32_3 %234 = OpFMul %231 %233 
                                                      OpStore %223 %234 
                                       f32_3 %235 = OpLoad %223 
                                       f32_3 %238 = OpExtInst %1 37 %235 %237 
                                                      OpStore %223 %238 
                                       f32_3 %239 = OpLoad %193 
                                       f32_3 %240 = OpLoad %223 
                                       f32_3 %241 = OpFAdd %239 %240 
                                                      OpStore %193 %241 
                                                      OpBranch %203 
                                             %203 = OpLabel 
                                         i32 %242 = OpLoad %199 
                                         i32 %243 = OpIAdd %242 %25 
                                                      OpStore %199 %243 
                                                      OpBranch %200 
                                             %202 = OpLabel 
                                       f32_3 %246 = OpLoad %193 
                                       f32_4 %247 = OpLoad %245 
                                       f32_4 %248 = OpVectorShuffle %247 %246 4 5 6 3 
                                                      OpStore %245 %248 
                                       f32_4 %249 = OpLoad %245 
                                       f32_3 %250 = OpVectorShuffle %249 %249 0 1 2 
                                       f32_3 %251 = OpCompositeConstruct %221 %221 %221 
                                       f32_3 %252 = OpCompositeConstruct %236 %236 %236 
                                       f32_3 %253 = OpExtInst %1 43 %250 %251 %252 
                                       f32_4 %254 = OpLoad %245 
                                       f32_4 %255 = OpVectorShuffle %254 %253 4 5 6 3 
                                                      OpStore %245 %255 
                                       f32_3 %260 = OpLoad %259 
                                       f32_2 %261 = OpVectorShuffle %260 %260 0 1 
                              Uniform f32_4* %263 = OpAccessChain %23 %262 
                                       f32_4 %264 = OpLoad %263 
                                       f32_2 %265 = OpVectorShuffle %264 %264 0 1 
                                       f32_2 %266 = OpFMul %261 %265 
                              Uniform f32_4* %267 = OpAccessChain %23 %262 
                                       f32_4 %268 = OpLoad %267 
                                       f32_2 %269 = OpVectorShuffle %268 %268 2 3 
                                       f32_2 %270 = OpFAdd %266 %269 
                                                      OpStore vs_TEXCOORD0 %270 
                                       f32_3 %272 = OpLoad %271 
                                       f32_4 %273 = OpVectorShuffle %272 %272 1 1 1 1 
                              Uniform f32_4* %274 = OpAccessChain %23 %51 %25 
                                       f32_4 %275 = OpLoad %274 
                                       f32_4 %276 = OpFMul %273 %275 
                                                      OpStore %9 %276 
                              Uniform f32_4* %277 = OpAccessChain %23 %51 %32 
                                       f32_4 %278 = OpLoad %277 
                                       f32_3 %279 = OpLoad %271 
                                       f32_4 %280 = OpVectorShuffle %279 %279 0 0 0 0 
                                       f32_4 %281 = OpFMul %278 %280 
                                       f32_4 %282 = OpLoad %9 
                                       f32_4 %283 = OpFAdd %281 %282 
                                                      OpStore %9 %283 
                              Uniform f32_4* %284 = OpAccessChain %23 %51 %51 
                                       f32_4 %285 = OpLoad %284 
                                       f32_3 %286 = OpLoad %271 
                                       f32_4 %287 = OpVectorShuffle %286 %286 2 2 2 2 
                                       f32_4 %288 = OpFMul %285 %287 
                                       f32_4 %289 = OpLoad %9 
                                       f32_4 %290 = OpFAdd %288 %289 
                                                      OpStore %9 %290 
                                       f32_4 %291 = OpLoad %9 
                              Uniform f32_4* %292 = OpAccessChain %23 %51 %24 
                                       f32_4 %293 = OpLoad %292 
                                       f32_4 %294 = OpFAdd %291 %293 
                                                      OpStore %9 %294 
                                       f32_4 %295 = OpLoad %9 
                                       f32_4 %296 = OpVectorShuffle %295 %295 1 1 1 1 
                              Uniform f32_4* %298 = OpAccessChain %23 %297 %25 
                                       f32_4 %299 = OpLoad %298 
                                       f32_4 %300 = OpFMul %296 %299 
                                                      OpStore %76 %300 
                              Uniform f32_4* %301 = OpAccessChain %23 %297 %32 
                                       f32_4 %302 = OpLoad %301 
                                       f32_4 %303 = OpLoad %9 
                                       f32_4 %304 = OpVectorShuffle %303 %303 0 0 0 0 
                                       f32_4 %305 = OpFMul %302 %304 
                                       f32_4 %306 = OpLoad %76 
                                       f32_4 %307 = OpFAdd %305 %306 
                                                      OpStore %76 %307 
                              Uniform f32_4* %308 = OpAccessChain %23 %297 %51 
                                       f32_4 %309 = OpLoad %308 
                                       f32_4 %310 = OpLoad %9 
                                       f32_4 %311 = OpVectorShuffle %310 %310 2 2 2 2 
                                       f32_4 %312 = OpFMul %309 %311 
                                       f32_4 %313 = OpLoad %76 
                                       f32_4 %314 = OpFAdd %312 %313 
                                                      OpStore %76 %314 
                              Uniform f32_4* %319 = OpAccessChain %23 %297 %24 
                                       f32_4 %320 = OpLoad %319 
                                       f32_4 %321 = OpLoad %9 
                                       f32_4 %322 = OpVectorShuffle %321 %321 3 3 3 3 
                                       f32_4 %323 = OpFMul %320 %322 
                                       f32_4 %324 = OpLoad %76 
                                       f32_4 %325 = OpFAdd %323 %324 
                               Output f32_4* %326 = OpAccessChain %318 %32 
                                                      OpStore %326 %325 
                                 Output f32* %329 = OpAccessChain %245 %327 
                                                      OpStore %329 %236 
                                 Output f32* %330 = OpAccessChain %318 %32 %171 
                                         f32 %331 = OpLoad %330 
                                         f32 %332 = OpFNegate %331 
                                 Output f32* %333 = OpAccessChain %318 %32 %171 
                                                      OpStore %333 %332 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 47
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %30 %35 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %9 RelaxedPrecision 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %13 RelaxedPrecision 
                                             OpDecorate %16 RelaxedPrecision 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %17 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %26 RelaxedPrecision 
                                             OpDecorate %27 RelaxedPrecision 
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %30 RelaxedPrecision 
                                             OpDecorate %30 Location 30 
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate %33 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %35 Location 35 
                                             OpDecorate %36 RelaxedPrecision 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %24 = OpTypeVector %6 4 
                      Private f32_3* %27 = OpVariable Private 
                                     %29 = OpTypePointer Input %24 
                        Input f32_4* %30 = OpVariable Input 
                                     %34 = OpTypePointer Output %24 
                       Output f32_4* %35 = OpVariable Output 
                                 f32 %41 = OpConstant 3.674022E-40 
                                     %42 = OpTypeInt 32 0 
                                 u32 %43 = OpConstant 3 
                                     %44 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
                                             OpStore %9 %26 
                               f32_3 %28 = OpLoad %9 
                               f32_4 %31 = OpLoad %30 
                               f32_3 %32 = OpVectorShuffle %31 %31 0 1 2 
                               f32_3 %33 = OpFMul %28 %32 
                                             OpStore %27 %33 
                               f32_3 %36 = OpLoad %27 
                               f32_3 %37 = OpLoad %27 
                               f32_3 %38 = OpFAdd %36 %37 
                               f32_4 %39 = OpLoad %35 
                               f32_4 %40 = OpVectorShuffle %39 %38 4 5 6 3 
                                             OpStore %35 %40 
                         Output f32* %45 = OpAccessChain %35 %43 
                                             OpStore %45 %41 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 339
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %161 %245 %258 %259 %271 %318 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %21 0 RelaxedPrecision 
                                                      OpMemberDecorate %21 0 Offset 21 
                                                      OpMemberDecorate %21 1 Offset 21 
                                                      OpMemberDecorate %21 2 Offset 21 
                                                      OpMemberDecorate %21 3 Offset 21 
                                                      OpMemberDecorate %21 4 RelaxedPrecision 
                                                      OpMemberDecorate %21 4 Offset 21 
                                                      OpMemberDecorate %21 5 Offset 21 
                                                      OpMemberDecorate %21 6 Offset 21 
                                                      OpMemberDecorate %21 7 Offset 21 
                                                      OpMemberDecorate %21 8 Offset 21 
                                                      OpDecorate %21 Block 
                                                      OpDecorate %23 DescriptorSet 23 
                                                      OpDecorate %23 Binding 23 
                                                      OpDecorate %161 Location 161 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %245 Location 245 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 258 
                                                      OpDecorate %259 Location 259 
                                                      OpDecorate %271 Location 271 
                                                      OpMemberDecorate %316 0 BuiltIn 316 
                                                      OpMemberDecorate %316 1 BuiltIn 316 
                                                      OpMemberDecorate %316 2 BuiltIn 316 
                                                      OpDecorate %316 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 8 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                          u32 %14 = OpConstant 4 
                                              %15 = OpTypeArray %7 %14 
                                              %16 = OpTypeArray %7 %14 
                                              %17 = OpTypeArray %7 %14 
                                              %18 = OpTypeArray %7 %14 
                                              %19 = OpTypeInt 32 1 
                                              %20 = OpTypeVector %19 4 
                                              %21 = OpTypeStruct %12 %13 %15 %16 %7 %17 %18 %20 %7 
                                              %22 = OpTypePointer Uniform %21 
Uniform struct {f32_4[8]; f32_4[8]; f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4[4]; i32_4; f32_4;}* %23 = OpVariable Uniform 
                                          i32 %24 = OpConstant 3 
                                          i32 %25 = OpConstant 1 
                                              %26 = OpTypeVector %6 3 
                                              %27 = OpTypePointer Uniform %7 
                                          i32 %31 = OpConstant 5 
                                          i32 %32 = OpConstant 0 
                                          i32 %51 = OpConstant 2 
                               Private f32_4* %76 = OpVariable Private 
                                             %122 = OpTypePointer Private %26 
                              Private f32_3* %123 = OpVariable Private 
                                             %160 = OpTypePointer Input %26 
                                Input f32_3* %161 = OpVariable Input 
                                         u32 %164 = OpConstant 0 
                                             %165 = OpTypePointer Private %6 
                                         u32 %171 = OpConstant 1 
                                         u32 %176 = OpConstant 2 
                                Private f32* %178 = OpVariable Private 
                              Private f32_3* %193 = OpVariable Private 
                                         i32 %194 = OpConstant 4 
                                             %198 = OpTypePointer Function %19 
                                         i32 %206 = OpConstant 7 
                                             %207 = OpTypePointer Uniform %19 
                                             %210 = OpTypeBool 
                                Private f32* %212 = OpVariable Private 
                                         f32 %221 = OpConstant 3.674022E-40 
                              Private f32_3* %223 = OpVariable Private 
                                         f32 %232 = OpConstant 3.674022E-40 
                                       f32_3 %233 = OpConstantComposite %232 %232 %232 
                                         f32 %236 = OpConstant 3.674022E-40 
                                       f32_3 %237 = OpConstantComposite %236 %236 %236 
                                             %244 = OpTypePointer Output %7 
                               Output f32_4* %245 = OpVariable Output 
                                             %256 = OpTypeVector %6 2 
                                             %257 = OpTypePointer Output %256 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_3* %259 = OpVariable Input 
                                         i32 %262 = OpConstant 8 
                                Input f32_3* %271 = OpVariable Input 
                                         i32 %297 = OpConstant 6 
                                             %315 = OpTypeArray %6 %171 
                                             %316 = OpTypeStruct %7 %6 %315 
                                             %317 = OpTypePointer Output %316 
        Output struct {f32_4; f32; f32[1];}* %318 = OpVariable Output 
                                         u32 %327 = OpConstant 3 
                                             %328 = OpTypePointer Output %6 
                                             %335 = OpTypePointer Private %210 
                               Private bool* %336 = OpVariable Private 
                                             %337 = OpTypePointer Private %19 
                                Private i32* %338 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function i32* %199 = OpVariable Function 
                               Uniform f32_4* %28 = OpAccessChain %23 %24 %25 
                                        f32_4 %29 = OpLoad %28 
                                        f32_3 %30 = OpVectorShuffle %29 %29 0 1 2 
                               Uniform f32_4* %33 = OpAccessChain %23 %31 %32 
                                        f32_4 %34 = OpLoad %33 
                                        f32_3 %35 = OpVectorShuffle %34 %34 1 1 1 
                                        f32_3 %36 = OpFMul %30 %35 
                                        f32_4 %37 = OpLoad %9 
                                        f32_4 %38 = OpVectorShuffle %37 %36 4 5 6 3 
                                                      OpStore %9 %38 
                               Uniform f32_4* %39 = OpAccessChain %23 %24 %32 
                                        f32_4 %40 = OpLoad %39 
                                        f32_3 %41 = OpVectorShuffle %40 %40 0 1 2 
                               Uniform f32_4* %42 = OpAccessChain %23 %31 %32 
                                        f32_4 %43 = OpLoad %42 
                                        f32_3 %44 = OpVectorShuffle %43 %43 0 0 0 
                                        f32_3 %45 = OpFMul %41 %44 
                                        f32_4 %46 = OpLoad %9 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                                        f32_3 %48 = OpFAdd %45 %47 
                                        f32_4 %49 = OpLoad %9 
                                        f32_4 %50 = OpVectorShuffle %49 %48 4 5 6 3 
                                                      OpStore %9 %50 
                               Uniform f32_4* %52 = OpAccessChain %23 %24 %51 
                                        f32_4 %53 = OpLoad %52 
                                        f32_3 %54 = OpVectorShuffle %53 %53 0 1 2 
                               Uniform f32_4* %55 = OpAccessChain %23 %31 %32 
                                        f32_4 %56 = OpLoad %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 2 2 2 
                                        f32_3 %58 = OpFMul %54 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFAdd %58 %60 
                                        f32_4 %62 = OpLoad %9 
                                        f32_4 %63 = OpVectorShuffle %62 %61 4 5 6 3 
                                                      OpStore %9 %63 
                               Uniform f32_4* %64 = OpAccessChain %23 %24 %24 
                                        f32_4 %65 = OpLoad %64 
                                        f32_3 %66 = OpVectorShuffle %65 %65 0 1 2 
                               Uniform f32_4* %67 = OpAccessChain %23 %31 %32 
                                        f32_4 %68 = OpLoad %67 
                                        f32_3 %69 = OpVectorShuffle %68 %68 3 3 3 
                                        f32_3 %70 = OpFMul %66 %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_3 %72 = OpVectorShuffle %71 %71 0 1 2 
                                        f32_3 %73 = OpFAdd %70 %72 
                                        f32_4 %74 = OpLoad %9 
                                        f32_4 %75 = OpVectorShuffle %74 %73 4 5 6 3 
                                                      OpStore %9 %75 
                               Uniform f32_4* %77 = OpAccessChain %23 %24 %25 
                                        f32_4 %78 = OpLoad %77 
                                        f32_3 %79 = OpVectorShuffle %78 %78 0 1 2 
                               Uniform f32_4* %80 = OpAccessChain %23 %31 %25 
                                        f32_4 %81 = OpLoad %80 
                                        f32_3 %82 = OpVectorShuffle %81 %81 1 1 1 
                                        f32_3 %83 = OpFMul %79 %82 
                                        f32_4 %84 = OpLoad %76 
                                        f32_4 %85 = OpVectorShuffle %84 %83 4 5 6 3 
                                                      OpStore %76 %85 
                               Uniform f32_4* %86 = OpAccessChain %23 %24 %32 
                                        f32_4 %87 = OpLoad %86 
                                        f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
                               Uniform f32_4* %89 = OpAccessChain %23 %31 %25 
                                        f32_4 %90 = OpLoad %89 
                                        f32_3 %91 = OpVectorShuffle %90 %90 0 0 0 
                                        f32_3 %92 = OpFMul %88 %91 
                                        f32_4 %93 = OpLoad %76 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                        f32_3 %95 = OpFAdd %92 %94 
                                        f32_4 %96 = OpLoad %76 
                                        f32_4 %97 = OpVectorShuffle %96 %95 4 5 6 3 
                                                      OpStore %76 %97 
                               Uniform f32_4* %98 = OpAccessChain %23 %24 %51 
                                        f32_4 %99 = OpLoad %98 
                                       f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                              Uniform f32_4* %101 = OpAccessChain %23 %31 %25 
                                       f32_4 %102 = OpLoad %101 
                                       f32_3 %103 = OpVectorShuffle %102 %102 2 2 2 
                                       f32_3 %104 = OpFMul %100 %103 
                                       f32_4 %105 = OpLoad %76 
                                       f32_3 %106 = OpVectorShuffle %105 %105 0 1 2 
                                       f32_3 %107 = OpFAdd %104 %106 
                                       f32_4 %108 = OpLoad %76 
                                       f32_4 %109 = OpVectorShuffle %108 %107 4 5 6 3 
                                                      OpStore %76 %109 
                              Uniform f32_4* %110 = OpAccessChain %23 %24 %24 
                                       f32_4 %111 = OpLoad %110 
                                       f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
                              Uniform f32_4* %113 = OpAccessChain %23 %31 %25 
                                       f32_4 %114 = OpLoad %113 
                                       f32_3 %115 = OpVectorShuffle %114 %114 3 3 3 
                                       f32_3 %116 = OpFMul %112 %115 
                                       f32_4 %117 = OpLoad %76 
                                       f32_3 %118 = OpVectorShuffle %117 %117 0 1 2 
                                       f32_3 %119 = OpFAdd %116 %118 
                                       f32_4 %120 = OpLoad %76 
                                       f32_4 %121 = OpVectorShuffle %120 %119 4 5 6 3 
                                                      OpStore %76 %121 
                              Uniform f32_4* %124 = OpAccessChain %23 %24 %25 
                                       f32_4 %125 = OpLoad %124 
                                       f32_3 %126 = OpVectorShuffle %125 %125 0 1 2 
                              Uniform f32_4* %127 = OpAccessChain %23 %31 %51 
                                       f32_4 %128 = OpLoad %127 
                                       f32_3 %129 = OpVectorShuffle %128 %128 1 1 1 
                                       f32_3 %130 = OpFMul %126 %129 
                                                      OpStore %123 %130 
                              Uniform f32_4* %131 = OpAccessChain %23 %24 %32 
                                       f32_4 %132 = OpLoad %131 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                              Uniform f32_4* %134 = OpAccessChain %23 %31 %51 
                                       f32_4 %135 = OpLoad %134 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 0 0 
                                       f32_3 %137 = OpFMul %133 %136 
                                       f32_3 %138 = OpLoad %123 
                                       f32_3 %139 = OpFAdd %137 %138 
                                                      OpStore %123 %139 
                              Uniform f32_4* %140 = OpAccessChain %23 %24 %51 
                                       f32_4 %141 = OpLoad %140 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                              Uniform f32_4* %143 = OpAccessChain %23 %31 %51 
                                       f32_4 %144 = OpLoad %143 
                                       f32_3 %145 = OpVectorShuffle %144 %144 2 2 2 
                                       f32_3 %146 = OpFMul %142 %145 
                                       f32_3 %147 = OpLoad %123 
                                       f32_3 %148 = OpFAdd %146 %147 
                                                      OpStore %123 %148 
                              Uniform f32_4* %149 = OpAccessChain %23 %24 %24 
                                       f32_4 %150 = OpLoad %149 
                                       f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                              Uniform f32_4* %152 = OpAccessChain %23 %31 %51 
                                       f32_4 %153 = OpLoad %152 
                                       f32_3 %154 = OpVectorShuffle %153 %153 3 3 3 
                                       f32_3 %155 = OpFMul %151 %154 
                                       f32_3 %156 = OpLoad %123 
                                       f32_3 %157 = OpFAdd %155 %156 
                                                      OpStore %123 %157 
                                       f32_4 %158 = OpLoad %9 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                       f32_3 %162 = OpLoad %161 
                                         f32 %163 = OpDot %159 %162 
                                Private f32* %166 = OpAccessChain %9 %164 
                                                      OpStore %166 %163 
                                       f32_4 %167 = OpLoad %76 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_3 %169 = OpLoad %161 
                                         f32 %170 = OpDot %168 %169 
                                Private f32* %172 = OpAccessChain %9 %171 
                                                      OpStore %172 %170 
                                       f32_3 %173 = OpLoad %123 
                                       f32_3 %174 = OpLoad %161 
                                         f32 %175 = OpDot %173 %174 
                                Private f32* %177 = OpAccessChain %9 %176 
                                                      OpStore %177 %175 
                                       f32_4 %179 = OpLoad %9 
                                       f32_3 %180 = OpVectorShuffle %179 %179 0 1 2 
                                       f32_4 %181 = OpLoad %9 
                                       f32_3 %182 = OpVectorShuffle %181 %181 0 1 2 
                                         f32 %183 = OpDot %180 %182 
                                                      OpStore %178 %183 
                                         f32 %184 = OpLoad %178 
                                         f32 %185 = OpExtInst %1 32 %184 
                                                      OpStore %178 %185 
                                         f32 %186 = OpLoad %178 
                                       f32_3 %187 = OpCompositeConstruct %186 %186 %186 
                                       f32_4 %188 = OpLoad %9 
                                       f32_3 %189 = OpVectorShuffle %188 %188 0 1 2 
                                       f32_3 %190 = OpFMul %187 %189 
                                       f32_4 %191 = OpLoad %9 
                                       f32_4 %192 = OpVectorShuffle %191 %190 4 5 6 3 
                                                      OpStore %9 %192 
                              Uniform f32_4* %195 = OpAccessChain %23 %194 
                                       f32_4 %196 = OpLoad %195 
                                       f32_3 %197 = OpVectorShuffle %196 %196 0 1 2 
                                                      OpStore %193 %197 
                                                      OpStore %199 %32 
                                                      OpBranch %200 
                                             %200 = OpLabel 
                                                      OpLoopMerge %202 %203 None 
                                                      OpBranch %204 
                                             %204 = OpLabel 
                                         i32 %205 = OpLoad %199 
                                Uniform i32* %208 = OpAccessChain %23 %206 %164 
                                         i32 %209 = OpLoad %208 
                                        bool %211 = OpSLessThan %205 %209 
                                                      OpBranchConditional %211 %201 %202 
                                             %201 = OpLabel 
                                       f32_4 %213 = OpLoad %9 
                                       f32_3 %214 = OpVectorShuffle %213 %213 0 1 2 
                                         i32 %215 = OpLoad %199 
                              Uniform f32_4* %216 = OpAccessChain %23 %25 %215 
                                       f32_4 %217 = OpLoad %216 
                                       f32_3 %218 = OpVectorShuffle %217 %217 0 1 2 
                                         f32 %219 = OpDot %214 %218 
                                                      OpStore %212 %219 
                                         f32 %220 = OpLoad %212 
                                         f32 %222 = OpExtInst %1 40 %220 %221 
                                                      OpStore %212 %222 
                                         f32 %224 = OpLoad %212 
                                       f32_3 %225 = OpCompositeConstruct %224 %224 %224 
                                         i32 %226 = OpLoad %199 
                              Uniform f32_4* %227 = OpAccessChain %23 %32 %226 
                                       f32_4 %228 = OpLoad %227 
                                       f32_3 %229 = OpVectorShuffle %228 %228 0 1 2 
                                       f32_3 %230 = OpFMul %225 %229 
                                                      OpStore %223 %230 
                                       f32_3 %231 = OpLoad %223 
                                       f32_3 %234 = OpFMul %231 %233 
                                                      OpStore %223 %234 
                                       f32_3 %235 = OpLoad %223 
                                       f32_3 %238 = OpExtInst %1 37 %235 %237 
                                                      OpStore %223 %238 
                                       f32_3 %239 = OpLoad %193 
                                       f32_3 %240 = OpLoad %223 
                                       f32_3 %241 = OpFAdd %239 %240 
                                                      OpStore %193 %241 
                                                      OpBranch %203 
                                             %203 = OpLabel 
                                         i32 %242 = OpLoad %199 
                                         i32 %243 = OpIAdd %242 %25 
                                                      OpStore %199 %243 
                                                      OpBranch %200 
                                             %202 = OpLabel 
                                       f32_3 %246 = OpLoad %193 
                                       f32_4 %247 = OpLoad %245 
                                       f32_4 %248 = OpVectorShuffle %247 %246 4 5 6 3 
                                                      OpStore %245 %248 
                                       f32_4 %249 = OpLoad %245 
                                       f32_3 %250 = OpVectorShuffle %249 %249 0 1 2 
                                       f32_3 %251 = OpCompositeConstruct %221 %221 %221 
                                       f32_3 %252 = OpCompositeConstruct %236 %236 %236 
                                       f32_3 %253 = OpExtInst %1 43 %250 %251 %252 
                                       f32_4 %254 = OpLoad %245 
                                       f32_4 %255 = OpVectorShuffle %254 %253 4 5 6 3 
                                                      OpStore %245 %255 
                                       f32_3 %260 = OpLoad %259 
                                       f32_2 %261 = OpVectorShuffle %260 %260 0 1 
                              Uniform f32_4* %263 = OpAccessChain %23 %262 
                                       f32_4 %264 = OpLoad %263 
                                       f32_2 %265 = OpVectorShuffle %264 %264 0 1 
                                       f32_2 %266 = OpFMul %261 %265 
                              Uniform f32_4* %267 = OpAccessChain %23 %262 
                                       f32_4 %268 = OpLoad %267 
                                       f32_2 %269 = OpVectorShuffle %268 %268 2 3 
                                       f32_2 %270 = OpFAdd %266 %269 
                                                      OpStore vs_TEXCOORD0 %270 
                                       f32_3 %272 = OpLoad %271 
                                       f32_4 %273 = OpVectorShuffle %272 %272 1 1 1 1 
                              Uniform f32_4* %274 = OpAccessChain %23 %51 %25 
                                       f32_4 %275 = OpLoad %274 
                                       f32_4 %276 = OpFMul %273 %275 
                                                      OpStore %9 %276 
                              Uniform f32_4* %277 = OpAccessChain %23 %51 %32 
                                       f32_4 %278 = OpLoad %277 
                                       f32_3 %279 = OpLoad %271 
                                       f32_4 %280 = OpVectorShuffle %279 %279 0 0 0 0 
                                       f32_4 %281 = OpFMul %278 %280 
                                       f32_4 %282 = OpLoad %9 
                                       f32_4 %283 = OpFAdd %281 %282 
                                                      OpStore %9 %283 
                              Uniform f32_4* %284 = OpAccessChain %23 %51 %51 
                                       f32_4 %285 = OpLoad %284 
                                       f32_3 %286 = OpLoad %271 
                                       f32_4 %287 = OpVectorShuffle %286 %286 2 2 2 2 
                                       f32_4 %288 = OpFMul %285 %287 
                                       f32_4 %289 = OpLoad %9 
                                       f32_4 %290 = OpFAdd %288 %289 
                                                      OpStore %9 %290 
                                       f32_4 %291 = OpLoad %9 
                              Uniform f32_4* %292 = OpAccessChain %23 %51 %24 
                                       f32_4 %293 = OpLoad %292 
                                       f32_4 %294 = OpFAdd %291 %293 
                                                      OpStore %9 %294 
                                       f32_4 %295 = OpLoad %9 
                                       f32_4 %296 = OpVectorShuffle %295 %295 1 1 1 1 
                              Uniform f32_4* %298 = OpAccessChain %23 %297 %25 
                                       f32_4 %299 = OpLoad %298 
                                       f32_4 %300 = OpFMul %296 %299 
                                                      OpStore %76 %300 
                              Uniform f32_4* %301 = OpAccessChain %23 %297 %32 
                                       f32_4 %302 = OpLoad %301 
                                       f32_4 %303 = OpLoad %9 
                                       f32_4 %304 = OpVectorShuffle %303 %303 0 0 0 0 
                                       f32_4 %305 = OpFMul %302 %304 
                                       f32_4 %306 = OpLoad %76 
                                       f32_4 %307 = OpFAdd %305 %306 
                                                      OpStore %76 %307 
                              Uniform f32_4* %308 = OpAccessChain %23 %297 %51 
                                       f32_4 %309 = OpLoad %308 
                                       f32_4 %310 = OpLoad %9 
                                       f32_4 %311 = OpVectorShuffle %310 %310 2 2 2 2 
                                       f32_4 %312 = OpFMul %309 %311 
                                       f32_4 %313 = OpLoad %76 
                                       f32_4 %314 = OpFAdd %312 %313 
                                                      OpStore %76 %314 
                              Uniform f32_4* %319 = OpAccessChain %23 %297 %24 
                                       f32_4 %320 = OpLoad %319 
                                       f32_4 %321 = OpLoad %9 
                                       f32_4 %322 = OpVectorShuffle %321 %321 3 3 3 3 
                                       f32_4 %323 = OpFMul %320 %322 
                                       f32_4 %324 = OpLoad %76 
                                       f32_4 %325 = OpFAdd %323 %324 
                               Output f32_4* %326 = OpAccessChain %318 %32 
                                                      OpStore %326 %325 
                                 Output f32* %329 = OpAccessChain %245 %327 
                                                      OpStore %329 %236 
                                 Output f32* %330 = OpAccessChain %318 %32 %171 
                                         f32 %331 = OpLoad %330 
                                         f32 %332 = OpFNegate %331 
                                 Output f32* %333 = OpAccessChain %318 %32 %171 
                                                      OpStore %333 %332 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 47
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %30 %35 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %9 RelaxedPrecision 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %13 RelaxedPrecision 
                                             OpDecorate %16 RelaxedPrecision 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %17 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %26 RelaxedPrecision 
                                             OpDecorate %27 RelaxedPrecision 
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %30 RelaxedPrecision 
                                             OpDecorate %30 Location 30 
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate %33 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %35 Location 35 
                                             OpDecorate %36 RelaxedPrecision 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %24 = OpTypeVector %6 4 
                      Private f32_3* %27 = OpVariable Private 
                                     %29 = OpTypePointer Input %24 
                        Input f32_4* %30 = OpVariable Input 
                                     %34 = OpTypePointer Output %24 
                       Output f32_4* %35 = OpVariable Output 
                                 f32 %41 = OpConstant 3.674022E-40 
                                     %42 = OpTypeInt 32 0 
                                 u32 %43 = OpConstant 3 
                                     %44 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
                                             OpStore %9 %26 
                               f32_3 %28 = OpLoad %9 
                               f32_4 %31 = OpLoad %30 
                               f32_3 %32 = OpVectorShuffle %31 %31 0 1 2 
                               f32_3 %33 = OpFMul %28 %32 
                                             OpStore %27 %33 
                               f32_3 %36 = OpLoad %27 
                               f32_3 %37 = OpLoad %27 
                               f32_3 %38 = OpFAdd %36 %37 
                               f32_4 %39 = OpLoad %35 
                               f32_4 %40 = OpVectorShuffle %39 %38 4 5 6 3 
                                             OpStore %35 %40 
                         Output f32* %45 = OpAccessChain %35 %43 
                                             OpStore %45 %41 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 339
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %161 %245 %258 %259 %271 %318 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %21 0 RelaxedPrecision 
                                                      OpMemberDecorate %21 0 Offset 21 
                                                      OpMemberDecorate %21 1 Offset 21 
                                                      OpMemberDecorate %21 2 Offset 21 
                                                      OpMemberDecorate %21 3 Offset 21 
                                                      OpMemberDecorate %21 4 RelaxedPrecision 
                                                      OpMemberDecorate %21 4 Offset 21 
                                                      OpMemberDecorate %21 5 Offset 21 
                                                      OpMemberDecorate %21 6 Offset 21 
                                                      OpMemberDecorate %21 7 Offset 21 
                                                      OpMemberDecorate %21 8 Offset 21 
                                                      OpDecorate %21 Block 
                                                      OpDecorate %23 DescriptorSet 23 
                                                      OpDecorate %23 Binding 23 
                                                      OpDecorate %161 Location 161 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %245 Location 245 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 258 
                                                      OpDecorate %259 Location 259 
                                                      OpDecorate %271 Location 271 
                                                      OpMemberDecorate %316 0 BuiltIn 316 
                                                      OpMemberDecorate %316 1 BuiltIn 316 
                                                      OpMemberDecorate %316 2 BuiltIn 316 
                                                      OpDecorate %316 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 8 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                          u32 %14 = OpConstant 4 
                                              %15 = OpTypeArray %7 %14 
                                              %16 = OpTypeArray %7 %14 
                                              %17 = OpTypeArray %7 %14 
                                              %18 = OpTypeArray %7 %14 
                                              %19 = OpTypeInt 32 1 
                                              %20 = OpTypeVector %19 4 
                                              %21 = OpTypeStruct %12 %13 %15 %16 %7 %17 %18 %20 %7 
                                              %22 = OpTypePointer Uniform %21 
Uniform struct {f32_4[8]; f32_4[8]; f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4[4]; i32_4; f32_4;}* %23 = OpVariable Uniform 
                                          i32 %24 = OpConstant 3 
                                          i32 %25 = OpConstant 1 
                                              %26 = OpTypeVector %6 3 
                                              %27 = OpTypePointer Uniform %7 
                                          i32 %31 = OpConstant 5 
                                          i32 %32 = OpConstant 0 
                                          i32 %51 = OpConstant 2 
                               Private f32_4* %76 = OpVariable Private 
                                             %122 = OpTypePointer Private %26 
                              Private f32_3* %123 = OpVariable Private 
                                             %160 = OpTypePointer Input %26 
                                Input f32_3* %161 = OpVariable Input 
                                         u32 %164 = OpConstant 0 
                                             %165 = OpTypePointer Private %6 
                                         u32 %171 = OpConstant 1 
                                         u32 %176 = OpConstant 2 
                                Private f32* %178 = OpVariable Private 
                              Private f32_3* %193 = OpVariable Private 
                                         i32 %194 = OpConstant 4 
                                             %198 = OpTypePointer Function %19 
                                         i32 %206 = OpConstant 7 
                                             %207 = OpTypePointer Uniform %19 
                                             %210 = OpTypeBool 
                                Private f32* %212 = OpVariable Private 
                                         f32 %221 = OpConstant 3.674022E-40 
                              Private f32_3* %223 = OpVariable Private 
                                         f32 %232 = OpConstant 3.674022E-40 
                                       f32_3 %233 = OpConstantComposite %232 %232 %232 
                                         f32 %236 = OpConstant 3.674022E-40 
                                       f32_3 %237 = OpConstantComposite %236 %236 %236 
                                             %244 = OpTypePointer Output %7 
                               Output f32_4* %245 = OpVariable Output 
                                             %256 = OpTypeVector %6 2 
                                             %257 = OpTypePointer Output %256 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_3* %259 = OpVariable Input 
                                         i32 %262 = OpConstant 8 
                                Input f32_3* %271 = OpVariable Input 
                                         i32 %297 = OpConstant 6 
                                             %315 = OpTypeArray %6 %171 
                                             %316 = OpTypeStruct %7 %6 %315 
                                             %317 = OpTypePointer Output %316 
        Output struct {f32_4; f32; f32[1];}* %318 = OpVariable Output 
                                         u32 %327 = OpConstant 3 
                                             %328 = OpTypePointer Output %6 
                                             %335 = OpTypePointer Private %210 
                               Private bool* %336 = OpVariable Private 
                                             %337 = OpTypePointer Private %19 
                                Private i32* %338 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function i32* %199 = OpVariable Function 
                               Uniform f32_4* %28 = OpAccessChain %23 %24 %25 
                                        f32_4 %29 = OpLoad %28 
                                        f32_3 %30 = OpVectorShuffle %29 %29 0 1 2 
                               Uniform f32_4* %33 = OpAccessChain %23 %31 %32 
                                        f32_4 %34 = OpLoad %33 
                                        f32_3 %35 = OpVectorShuffle %34 %34 1 1 1 
                                        f32_3 %36 = OpFMul %30 %35 
                                        f32_4 %37 = OpLoad %9 
                                        f32_4 %38 = OpVectorShuffle %37 %36 4 5 6 3 
                                                      OpStore %9 %38 
                               Uniform f32_4* %39 = OpAccessChain %23 %24 %32 
                                        f32_4 %40 = OpLoad %39 
                                        f32_3 %41 = OpVectorShuffle %40 %40 0 1 2 
                               Uniform f32_4* %42 = OpAccessChain %23 %31 %32 
                                        f32_4 %43 = OpLoad %42 
                                        f32_3 %44 = OpVectorShuffle %43 %43 0 0 0 
                                        f32_3 %45 = OpFMul %41 %44 
                                        f32_4 %46 = OpLoad %9 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                                        f32_3 %48 = OpFAdd %45 %47 
                                        f32_4 %49 = OpLoad %9 
                                        f32_4 %50 = OpVectorShuffle %49 %48 4 5 6 3 
                                                      OpStore %9 %50 
                               Uniform f32_4* %52 = OpAccessChain %23 %24 %51 
                                        f32_4 %53 = OpLoad %52 
                                        f32_3 %54 = OpVectorShuffle %53 %53 0 1 2 
                               Uniform f32_4* %55 = OpAccessChain %23 %31 %32 
                                        f32_4 %56 = OpLoad %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 2 2 2 
                                        f32_3 %58 = OpFMul %54 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFAdd %58 %60 
                                        f32_4 %62 = OpLoad %9 
                                        f32_4 %63 = OpVectorShuffle %62 %61 4 5 6 3 
                                                      OpStore %9 %63 
                               Uniform f32_4* %64 = OpAccessChain %23 %24 %24 
                                        f32_4 %65 = OpLoad %64 
                                        f32_3 %66 = OpVectorShuffle %65 %65 0 1 2 
                               Uniform f32_4* %67 = OpAccessChain %23 %31 %32 
                                        f32_4 %68 = OpLoad %67 
                                        f32_3 %69 = OpVectorShuffle %68 %68 3 3 3 
                                        f32_3 %70 = OpFMul %66 %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_3 %72 = OpVectorShuffle %71 %71 0 1 2 
                                        f32_3 %73 = OpFAdd %70 %72 
                                        f32_4 %74 = OpLoad %9 
                                        f32_4 %75 = OpVectorShuffle %74 %73 4 5 6 3 
                                                      OpStore %9 %75 
                               Uniform f32_4* %77 = OpAccessChain %23 %24 %25 
                                        f32_4 %78 = OpLoad %77 
                                        f32_3 %79 = OpVectorShuffle %78 %78 0 1 2 
                               Uniform f32_4* %80 = OpAccessChain %23 %31 %25 
                                        f32_4 %81 = OpLoad %80 
                                        f32_3 %82 = OpVectorShuffle %81 %81 1 1 1 
                                        f32_3 %83 = OpFMul %79 %82 
                                        f32_4 %84 = OpLoad %76 
                                        f32_4 %85 = OpVectorShuffle %84 %83 4 5 6 3 
                                                      OpStore %76 %85 
                               Uniform f32_4* %86 = OpAccessChain %23 %24 %32 
                                        f32_4 %87 = OpLoad %86 
                                        f32_3 %88 = OpVectorShuffle %87 %87 0 1 2 
                               Uniform f32_4* %89 = OpAccessChain %23 %31 %25 
                                        f32_4 %90 = OpLoad %89 
                                        f32_3 %91 = OpVectorShuffle %90 %90 0 0 0 
                                        f32_3 %92 = OpFMul %88 %91 
                                        f32_4 %93 = OpLoad %76 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                        f32_3 %95 = OpFAdd %92 %94 
                                        f32_4 %96 = OpLoad %76 
                                        f32_4 %97 = OpVectorShuffle %96 %95 4 5 6 3 
                                                      OpStore %76 %97 
                               Uniform f32_4* %98 = OpAccessChain %23 %24 %51 
                                        f32_4 %99 = OpLoad %98 
                                       f32_3 %100 = OpVectorShuffle %99 %99 0 1 2 
                              Uniform f32_4* %101 = OpAccessChain %23 %31 %25 
                                       f32_4 %102 = OpLoad %101 
                                       f32_3 %103 = OpVectorShuffle %102 %102 2 2 2 
                                       f32_3 %104 = OpFMul %100 %103 
                                       f32_4 %105 = OpLoad %76 
                                       f32_3 %106 = OpVectorShuffle %105 %105 0 1 2 
                                       f32_3 %107 = OpFAdd %104 %106 
                                       f32_4 %108 = OpLoad %76 
                                       f32_4 %109 = OpVectorShuffle %108 %107 4 5 6 3 
                                                      OpStore %76 %109 
                              Uniform f32_4* %110 = OpAccessChain %23 %24 %24 
                                       f32_4 %111 = OpLoad %110 
                                       f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
                              Uniform f32_4* %113 = OpAccessChain %23 %31 %25 
                                       f32_4 %114 = OpLoad %113 
                                       f32_3 %115 = OpVectorShuffle %114 %114 3 3 3 
                                       f32_3 %116 = OpFMul %112 %115 
                                       f32_4 %117 = OpLoad %76 
                                       f32_3 %118 = OpVectorShuffle %117 %117 0 1 2 
                                       f32_3 %119 = OpFAdd %116 %118 
                                       f32_4 %120 = OpLoad %76 
                                       f32_4 %121 = OpVectorShuffle %120 %119 4 5 6 3 
                                                      OpStore %76 %121 
                              Uniform f32_4* %124 = OpAccessChain %23 %24 %25 
                                       f32_4 %125 = OpLoad %124 
                                       f32_3 %126 = OpVectorShuffle %125 %125 0 1 2 
                              Uniform f32_4* %127 = OpAccessChain %23 %31 %51 
                                       f32_4 %128 = OpLoad %127 
                                       f32_3 %129 = OpVectorShuffle %128 %128 1 1 1 
                                       f32_3 %130 = OpFMul %126 %129 
                                                      OpStore %123 %130 
                              Uniform f32_4* %131 = OpAccessChain %23 %24 %32 
                                       f32_4 %132 = OpLoad %131 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                              Uniform f32_4* %134 = OpAccessChain %23 %31 %51 
                                       f32_4 %135 = OpLoad %134 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 0 0 
                                       f32_3 %137 = OpFMul %133 %136 
                                       f32_3 %138 = OpLoad %123 
                                       f32_3 %139 = OpFAdd %137 %138 
                                                      OpStore %123 %139 
                              Uniform f32_4* %140 = OpAccessChain %23 %24 %51 
                                       f32_4 %141 = OpLoad %140 
                                       f32_3 %142 = OpVectorShuffle %141 %141 0 1 2 
                              Uniform f32_4* %143 = OpAccessChain %23 %31 %51 
                                       f32_4 %144 = OpLoad %143 
                                       f32_3 %145 = OpVectorShuffle %144 %144 2 2 2 
                                       f32_3 %146 = OpFMul %142 %145 
                                       f32_3 %147 = OpLoad %123 
                                       f32_3 %148 = OpFAdd %146 %147 
                                                      OpStore %123 %148 
                              Uniform f32_4* %149 = OpAccessChain %23 %24 %24 
                                       f32_4 %150 = OpLoad %149 
                                       f32_3 %151 = OpVectorShuffle %150 %150 0 1 2 
                              Uniform f32_4* %152 = OpAccessChain %23 %31 %51 
                                       f32_4 %153 = OpLoad %152 
                                       f32_3 %154 = OpVectorShuffle %153 %153 3 3 3 
                                       f32_3 %155 = OpFMul %151 %154 
                                       f32_3 %156 = OpLoad %123 
                                       f32_3 %157 = OpFAdd %155 %156 
                                                      OpStore %123 %157 
                                       f32_4 %158 = OpLoad %9 
                                       f32_3 %159 = OpVectorShuffle %158 %158 0 1 2 
                                       f32_3 %162 = OpLoad %161 
                                         f32 %163 = OpDot %159 %162 
                                Private f32* %166 = OpAccessChain %9 %164 
                                                      OpStore %166 %163 
                                       f32_4 %167 = OpLoad %76 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_3 %169 = OpLoad %161 
                                         f32 %170 = OpDot %168 %169 
                                Private f32* %172 = OpAccessChain %9 %171 
                                                      OpStore %172 %170 
                                       f32_3 %173 = OpLoad %123 
                                       f32_3 %174 = OpLoad %161 
                                         f32 %175 = OpDot %173 %174 
                                Private f32* %177 = OpAccessChain %9 %176 
                                                      OpStore %177 %175 
                                       f32_4 %179 = OpLoad %9 
                                       f32_3 %180 = OpVectorShuffle %179 %179 0 1 2 
                                       f32_4 %181 = OpLoad %9 
                                       f32_3 %182 = OpVectorShuffle %181 %181 0 1 2 
                                         f32 %183 = OpDot %180 %182 
                                                      OpStore %178 %183 
                                         f32 %184 = OpLoad %178 
                                         f32 %185 = OpExtInst %1 32 %184 
                                                      OpStore %178 %185 
                                         f32 %186 = OpLoad %178 
                                       f32_3 %187 = OpCompositeConstruct %186 %186 %186 
                                       f32_4 %188 = OpLoad %9 
                                       f32_3 %189 = OpVectorShuffle %188 %188 0 1 2 
                                       f32_3 %190 = OpFMul %187 %189 
                                       f32_4 %191 = OpLoad %9 
                                       f32_4 %192 = OpVectorShuffle %191 %190 4 5 6 3 
                                                      OpStore %9 %192 
                              Uniform f32_4* %195 = OpAccessChain %23 %194 
                                       f32_4 %196 = OpLoad %195 
                                       f32_3 %197 = OpVectorShuffle %196 %196 0 1 2 
                                                      OpStore %193 %197 
                                                      OpStore %199 %32 
                                                      OpBranch %200 
                                             %200 = OpLabel 
                                                      OpLoopMerge %202 %203 None 
                                                      OpBranch %204 
                                             %204 = OpLabel 
                                         i32 %205 = OpLoad %199 
                                Uniform i32* %208 = OpAccessChain %23 %206 %164 
                                         i32 %209 = OpLoad %208 
                                        bool %211 = OpSLessThan %205 %209 
                                                      OpBranchConditional %211 %201 %202 
                                             %201 = OpLabel 
                                       f32_4 %213 = OpLoad %9 
                                       f32_3 %214 = OpVectorShuffle %213 %213 0 1 2 
                                         i32 %215 = OpLoad %199 
                              Uniform f32_4* %216 = OpAccessChain %23 %25 %215 
                                       f32_4 %217 = OpLoad %216 
                                       f32_3 %218 = OpVectorShuffle %217 %217 0 1 2 
                                         f32 %219 = OpDot %214 %218 
                                                      OpStore %212 %219 
                                         f32 %220 = OpLoad %212 
                                         f32 %222 = OpExtInst %1 40 %220 %221 
                                                      OpStore %212 %222 
                                         f32 %224 = OpLoad %212 
                                       f32_3 %225 = OpCompositeConstruct %224 %224 %224 
                                         i32 %226 = OpLoad %199 
                              Uniform f32_4* %227 = OpAccessChain %23 %32 %226 
                                       f32_4 %228 = OpLoad %227 
                                       f32_3 %229 = OpVectorShuffle %228 %228 0 1 2 
                                       f32_3 %230 = OpFMul %225 %229 
                                                      OpStore %223 %230 
                                       f32_3 %231 = OpLoad %223 
                                       f32_3 %234 = OpFMul %231 %233 
                                                      OpStore %223 %234 
                                       f32_3 %235 = OpLoad %223 
                                       f32_3 %238 = OpExtInst %1 37 %235 %237 
                                                      OpStore %223 %238 
                                       f32_3 %239 = OpLoad %193 
                                       f32_3 %240 = OpLoad %223 
                                       f32_3 %241 = OpFAdd %239 %240 
                                                      OpStore %193 %241 
                                                      OpBranch %203 
                                             %203 = OpLabel 
                                         i32 %242 = OpLoad %199 
                                         i32 %243 = OpIAdd %242 %25 
                                                      OpStore %199 %243 
                                                      OpBranch %200 
                                             %202 = OpLabel 
                                       f32_3 %246 = OpLoad %193 
                                       f32_4 %247 = OpLoad %245 
                                       f32_4 %248 = OpVectorShuffle %247 %246 4 5 6 3 
                                                      OpStore %245 %248 
                                       f32_4 %249 = OpLoad %245 
                                       f32_3 %250 = OpVectorShuffle %249 %249 0 1 2 
                                       f32_3 %251 = OpCompositeConstruct %221 %221 %221 
                                       f32_3 %252 = OpCompositeConstruct %236 %236 %236 
                                       f32_3 %253 = OpExtInst %1 43 %250 %251 %252 
                                       f32_4 %254 = OpLoad %245 
                                       f32_4 %255 = OpVectorShuffle %254 %253 4 5 6 3 
                                                      OpStore %245 %255 
                                       f32_3 %260 = OpLoad %259 
                                       f32_2 %261 = OpVectorShuffle %260 %260 0 1 
                              Uniform f32_4* %263 = OpAccessChain %23 %262 
                                       f32_4 %264 = OpLoad %263 
                                       f32_2 %265 = OpVectorShuffle %264 %264 0 1 
                                       f32_2 %266 = OpFMul %261 %265 
                              Uniform f32_4* %267 = OpAccessChain %23 %262 
                                       f32_4 %268 = OpLoad %267 
                                       f32_2 %269 = OpVectorShuffle %268 %268 2 3 
                                       f32_2 %270 = OpFAdd %266 %269 
                                                      OpStore vs_TEXCOORD0 %270 
                                       f32_3 %272 = OpLoad %271 
                                       f32_4 %273 = OpVectorShuffle %272 %272 1 1 1 1 
                              Uniform f32_4* %274 = OpAccessChain %23 %51 %25 
                                       f32_4 %275 = OpLoad %274 
                                       f32_4 %276 = OpFMul %273 %275 
                                                      OpStore %9 %276 
                              Uniform f32_4* %277 = OpAccessChain %23 %51 %32 
                                       f32_4 %278 = OpLoad %277 
                                       f32_3 %279 = OpLoad %271 
                                       f32_4 %280 = OpVectorShuffle %279 %279 0 0 0 0 
                                       f32_4 %281 = OpFMul %278 %280 
                                       f32_4 %282 = OpLoad %9 
                                       f32_4 %283 = OpFAdd %281 %282 
                                                      OpStore %9 %283 
                              Uniform f32_4* %284 = OpAccessChain %23 %51 %51 
                                       f32_4 %285 = OpLoad %284 
                                       f32_3 %286 = OpLoad %271 
                                       f32_4 %287 = OpVectorShuffle %286 %286 2 2 2 2 
                                       f32_4 %288 = OpFMul %285 %287 
                                       f32_4 %289 = OpLoad %9 
                                       f32_4 %290 = OpFAdd %288 %289 
                                                      OpStore %9 %290 
                                       f32_4 %291 = OpLoad %9 
                              Uniform f32_4* %292 = OpAccessChain %23 %51 %24 
                                       f32_4 %293 = OpLoad %292 
                                       f32_4 %294 = OpFAdd %291 %293 
                                                      OpStore %9 %294 
                                       f32_4 %295 = OpLoad %9 
                                       f32_4 %296 = OpVectorShuffle %295 %295 1 1 1 1 
                              Uniform f32_4* %298 = OpAccessChain %23 %297 %25 
                                       f32_4 %299 = OpLoad %298 
                                       f32_4 %300 = OpFMul %296 %299 
                                                      OpStore %76 %300 
                              Uniform f32_4* %301 = OpAccessChain %23 %297 %32 
                                       f32_4 %302 = OpLoad %301 
                                       f32_4 %303 = OpLoad %9 
                                       f32_4 %304 = OpVectorShuffle %303 %303 0 0 0 0 
                                       f32_4 %305 = OpFMul %302 %304 
                                       f32_4 %306 = OpLoad %76 
                                       f32_4 %307 = OpFAdd %305 %306 
                                                      OpStore %76 %307 
                              Uniform f32_4* %308 = OpAccessChain %23 %297 %51 
                                       f32_4 %309 = OpLoad %308 
                                       f32_4 %310 = OpLoad %9 
                                       f32_4 %311 = OpVectorShuffle %310 %310 2 2 2 2 
                                       f32_4 %312 = OpFMul %309 %311 
                                       f32_4 %313 = OpLoad %76 
                                       f32_4 %314 = OpFAdd %312 %313 
                                                      OpStore %76 %314 
                              Uniform f32_4* %319 = OpAccessChain %23 %297 %24 
                                       f32_4 %320 = OpLoad %319 
                                       f32_4 %321 = OpLoad %9 
                                       f32_4 %322 = OpVectorShuffle %321 %321 3 3 3 3 
                                       f32_4 %323 = OpFMul %320 %322 
                                       f32_4 %324 = OpLoad %76 
                                       f32_4 %325 = OpFAdd %323 %324 
                               Output f32_4* %326 = OpAccessChain %318 %32 
                                                      OpStore %326 %325 
                                 Output f32* %329 = OpAccessChain %245 %327 
                                                      OpStore %329 %236 
                                 Output f32* %330 = OpAccessChain %318 %32 %171 
                                         f32 %331 = OpLoad %330 
                                         f32 %332 = OpFNegate %331 
                                 Output f32* %333 = OpAccessChain %318 %32 %171 
                                                      OpStore %333 %332 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 47
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %30 %35 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %9 RelaxedPrecision 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %13 RelaxedPrecision 
                                             OpDecorate %16 RelaxedPrecision 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %17 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %26 RelaxedPrecision 
                                             OpDecorate %27 RelaxedPrecision 
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %30 RelaxedPrecision 
                                             OpDecorate %30 Location 30 
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate %33 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %35 Location 35 
                                             OpDecorate %36 RelaxedPrecision 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %24 = OpTypeVector %6 4 
                      Private f32_3* %27 = OpVariable Private 
                                     %29 = OpTypePointer Input %24 
                        Input f32_4* %30 = OpVariable Input 
                                     %34 = OpTypePointer Output %24 
                       Output f32_4* %35 = OpVariable Output 
                                 f32 %41 = OpConstant 3.674022E-40 
                                     %42 = OpTypeInt 32 0 
                                 u32 %43 = OpConstant 3 
                                     %44 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
                                             OpStore %9 %26 
                               f32_3 %28 = OpLoad %9 
                               f32_4 %31 = OpLoad %30 
                               f32_3 %32 = OpVectorShuffle %31 %31 0 1 2 
                               f32_3 %33 = OpFMul %28 %32 
                                             OpStore %27 %33 
                               f32_3 %36 = OpLoad %27 
                               f32_3 %37 = OpLoad %27 
                               f32_3 %38 = OpFAdd %36 %37 
                               f32_4 %39 = OpLoad %35 
                               f32_4 %40 = OpVectorShuffle %39 %38 4 5 6 3 
                                             OpStore %35 %40 
                         Output f32* %45 = OpAccessChain %35 %43 
                                             OpStore %45 %41 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
mediump vec3 u_xlat16_5;
float u_xlat6;
vec3 u_xlat7;
bool u_xlatb7;
mediump vec3 u_xlat16_9;
float u_xlat10;
bool u_xlatb10;
bool u_xlatb12;
float u_xlat13;
float u_xlat18;
int u_xlati18;
bool u_xlatb18;
bool u_xlatb19;
float u_xlat20;
bool u_xlatb20;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightAtten[1].w<u_xlat18);
#else
    u_xlatb19 = unity_LightAtten[1].w<u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb2 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlatb19 = u_xlatb19 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat18 + 1.0;
    u_xlat18 = max(u_xlat18, 9.99999997e-07);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = float(1.0) / u_xlat2.x;
    u_xlat18 = u_xlat18 * 0.5;
    u_xlat16_3.x = (u_xlatb19) ? 0.0 : u_xlat18;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat4.xyz;
    u_xlat2.y = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat4.xyz;
    u_xlat2.z = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat16_9.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
    u_xlat16_9.xyz = u_xlat16_9.xxx * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_9.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightAtten[0].w<u_xlat18);
#else
    u_xlatb19 = unity_LightAtten[0].w<u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb20 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb19 = u_xlatb19 && u_xlatb20;
    u_xlat20 = unity_LightAtten[0].z * u_xlat18 + 1.0;
    u_xlat18 = max(u_xlat18, 9.99999997e-07);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[0].xyz;
    u_xlat18 = float(1.0) / u_xlat20;
    u_xlat18 = u_xlat18 * 0.5;
    u_xlat16_21 = (u_xlatb19) ? 0.0 : u_xlat18;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz + glstate_lightmodel_ambient.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb18 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb18)) ? u_xlat16_5.xyz : glstate_lightmodel_ambient.xyz;
    u_xlati18 = u_xlatb18 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlati18 = (u_xlatb1) ? 2 : u_xlati18;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[2].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[2].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[2].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[2].xyz;
    u_xlat7.x = float(1.0) / u_xlat10;
    u_xlat7.x = u_xlat7.x * 0.5;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat7.x;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[3].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[3].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[3].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[3].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 3 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[4].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[4].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[4].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[4].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 4 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[5].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[5].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[5].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[5].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 5 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[6].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[6].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[6].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[6].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 6 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat13 = max(u_xlat7.x, 9.99999997e-07);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat13);
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[7].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightAtten[7].w<u_xlat7.x);
#else
    u_xlatb0 = unity_LightAtten[7].w<u_xlat7.x;
#endif
    u_xlat6 = unity_LightAtten[7].z * u_xlat7.x + 1.0;
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat6 = u_xlat6 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb12 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb12;
    u_xlat16_21 = (u_xlatb0) ? 0.0 : u_xlat6;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb0 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb1;
    vs_COLOR0.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = 1.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
mediump vec3 u_xlat16_5;
float u_xlat6;
vec3 u_xlat7;
bool u_xlatb7;
mediump vec3 u_xlat16_9;
float u_xlat10;
bool u_xlatb10;
bool u_xlatb12;
float u_xlat13;
float u_xlat18;
int u_xlati18;
bool u_xlatb18;
bool u_xlatb19;
float u_xlat20;
bool u_xlatb20;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightAtten[1].w<u_xlat18);
#else
    u_xlatb19 = unity_LightAtten[1].w<u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb2 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlatb19 = u_xlatb19 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat18 + 1.0;
    u_xlat18 = max(u_xlat18, 9.99999997e-07);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = float(1.0) / u_xlat2.x;
    u_xlat18 = u_xlat18 * 0.5;
    u_xlat16_3.x = (u_xlatb19) ? 0.0 : u_xlat18;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat4.xyz;
    u_xlat2.y = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat4.xyz;
    u_xlat2.z = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat16_9.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
    u_xlat16_9.xyz = u_xlat16_9.xxx * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_9.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightAtten[0].w<u_xlat18);
#else
    u_xlatb19 = unity_LightAtten[0].w<u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb20 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb19 = u_xlatb19 && u_xlatb20;
    u_xlat20 = unity_LightAtten[0].z * u_xlat18 + 1.0;
    u_xlat18 = max(u_xlat18, 9.99999997e-07);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[0].xyz;
    u_xlat18 = float(1.0) / u_xlat20;
    u_xlat18 = u_xlat18 * 0.5;
    u_xlat16_21 = (u_xlatb19) ? 0.0 : u_xlat18;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz + glstate_lightmodel_ambient.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb18 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb18)) ? u_xlat16_5.xyz : glstate_lightmodel_ambient.xyz;
    u_xlati18 = u_xlatb18 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlati18 = (u_xlatb1) ? 2 : u_xlati18;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[2].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[2].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[2].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[2].xyz;
    u_xlat7.x = float(1.0) / u_xlat10;
    u_xlat7.x = u_xlat7.x * 0.5;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat7.x;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[3].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[3].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[3].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[3].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 3 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[4].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[4].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[4].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[4].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 4 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[5].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[5].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[5].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[5].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 5 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[6].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[6].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[6].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[6].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 6 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat13 = max(u_xlat7.x, 9.99999997e-07);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat13);
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[7].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightAtten[7].w<u_xlat7.x);
#else
    u_xlatb0 = unity_LightAtten[7].w<u_xlat7.x;
#endif
    u_xlat6 = unity_LightAtten[7].z * u_xlat7.x + 1.0;
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat6 = u_xlat6 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb12 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb12;
    u_xlat16_21 = (u_xlatb0) ? 0.0 : u_xlat6;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb0 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb1;
    vs_COLOR0.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = 1.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
mediump vec3 u_xlat16_5;
float u_xlat6;
vec3 u_xlat7;
bool u_xlatb7;
mediump vec3 u_xlat16_9;
float u_xlat10;
bool u_xlatb10;
bool u_xlatb12;
float u_xlat13;
float u_xlat18;
int u_xlati18;
bool u_xlatb18;
bool u_xlatb19;
float u_xlat20;
bool u_xlatb20;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightAtten[1].w<u_xlat18);
#else
    u_xlatb19 = unity_LightAtten[1].w<u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb2 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlatb19 = u_xlatb19 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat18 + 1.0;
    u_xlat18 = max(u_xlat18, 9.99999997e-07);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = float(1.0) / u_xlat2.x;
    u_xlat18 = u_xlat18 * 0.5;
    u_xlat16_3.x = (u_xlatb19) ? 0.0 : u_xlat18;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat4.xyz;
    u_xlat2.y = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat4.xyz;
    u_xlat2.z = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat16_9.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
    u_xlat16_9.xyz = u_xlat16_9.xxx * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_9.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightAtten[0].w<u_xlat18);
#else
    u_xlatb19 = unity_LightAtten[0].w<u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb20 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb19 = u_xlatb19 && u_xlatb20;
    u_xlat20 = unity_LightAtten[0].z * u_xlat18 + 1.0;
    u_xlat18 = max(u_xlat18, 9.99999997e-07);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[0].xyz;
    u_xlat18 = float(1.0) / u_xlat20;
    u_xlat18 = u_xlat18 * 0.5;
    u_xlat16_21 = (u_xlatb19) ? 0.0 : u_xlat18;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz + glstate_lightmodel_ambient.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb18 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb18)) ? u_xlat16_5.xyz : glstate_lightmodel_ambient.xyz;
    u_xlati18 = u_xlatb18 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlati18 = (u_xlatb1) ? 2 : u_xlati18;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[2].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[2].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[2].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[2].xyz;
    u_xlat7.x = float(1.0) / u_xlat10;
    u_xlat7.x = u_xlat7.x * 0.5;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat7.x;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[3].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[3].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[3].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[3].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 3 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[4].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[4].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[4].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[4].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 4 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[5].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[5].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[5].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[5].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 5 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat4.x = max(u_xlat20, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat7.xyz = u_xlat7.xyz * u_xlat4.xxx;
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[6].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(unity_LightAtten[6].w<u_xlat20);
#else
    u_xlatb7 = unity_LightAtten[6].w<u_xlat20;
#endif
    u_xlat13 = unity_LightAtten[6].z * u_xlat20 + 1.0;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat13 = u_xlat13 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb19 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb7 = u_xlatb7 && u_xlatb19;
    u_xlat16_21 = (u_xlatb7) ? 0.0 : u_xlat13;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 6 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat13 = max(u_xlat7.x, 9.99999997e-07);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat13);
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[7].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightAtten[7].w<u_xlat7.x);
#else
    u_xlatb0 = unity_LightAtten[7].w<u_xlat7.x;
#endif
    u_xlat6 = unity_LightAtten[7].z * u_xlat7.x + 1.0;
    u_xlat6 = float(1.0) / u_xlat6;
    u_xlat6 = u_xlat6 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb12 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb12;
    u_xlat16_21 = (u_xlatb0) ? 0.0 : u_xlat6;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb0 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb1;
    vs_COLOR0.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = 1.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "POINT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 569
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %305 %337 %478 %491 %492 %550 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpMemberDecorate %23 0 RelaxedPrecision 
                                                      OpMemberDecorate %23 0 Offset 23 
                                                      OpMemberDecorate %23 1 Offset 23 
                                                      OpMemberDecorate %23 2 RelaxedPrecision 
                                                      OpMemberDecorate %23 2 Offset 23 
                                                      OpMemberDecorate %23 3 Offset 23 
                                                      OpMemberDecorate %23 4 Offset 23 
                                                      OpMemberDecorate %23 5 RelaxedPrecision 
                                                      OpMemberDecorate %23 5 Offset 23 
                                                      OpMemberDecorate %23 6 Offset 23 
                                                      OpMemberDecorate %23 7 Offset 23 
                                                      OpMemberDecorate %23 8 Offset 23 
                                                      OpMemberDecorate %23 9 Offset 23 
                                                      OpMemberDecorate %23 10 Offset 23 
                                                      OpDecorate %23 Block 
                                                      OpDecorate %25 DescriptorSet 25 
                                                      OpDecorate %25 Binding 25 
                                                      OpDecorate %305 Location 305 
                                                      OpDecorate %337 Location 337 
                                                      OpDecorate %368 RelaxedPrecision 
                                                      OpDecorate %371 RelaxedPrecision 
                                                      OpDecorate %372 RelaxedPrecision 
                                                      OpDecorate %408 RelaxedPrecision 
                                                      OpDecorate %426 RelaxedPrecision 
                                                      OpDecorate %444 RelaxedPrecision 
                                                      OpDecorate %448 RelaxedPrecision 
                                                      OpDecorate %455 RelaxedPrecision 
                                                      OpDecorate %456 RelaxedPrecision 
                                                      OpDecorate %458 RelaxedPrecision 
                                                      OpDecorate %459 RelaxedPrecision 
                                                      OpDecorate %462 RelaxedPrecision 
                                                      OpDecorate %463 RelaxedPrecision 
                                                      OpDecorate %464 RelaxedPrecision 
                                                      OpDecorate %465 RelaxedPrecision 
                                                      OpDecorate %466 RelaxedPrecision 
                                                      OpDecorate %467 RelaxedPrecision 
                                                      OpDecorate %468 RelaxedPrecision 
                                                      OpDecorate %469 RelaxedPrecision 
                                                      OpDecorate %471 RelaxedPrecision 
                                                      OpDecorate %472 RelaxedPrecision 
                                                      OpDecorate %473 RelaxedPrecision 
                                                      OpDecorate %474 RelaxedPrecision 
                                                      OpDecorate %478 RelaxedPrecision 
                                                      OpDecorate %478 Location 478 
                                                      OpDecorate %479 RelaxedPrecision 
                                                      OpDecorate %482 RelaxedPrecision 
                                                      OpDecorate %483 RelaxedPrecision 
                                                      OpDecorate %484 RelaxedPrecision 
                                                      OpDecorate %485 RelaxedPrecision 
                                                      OpDecorate %486 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 491 
                                                      OpDecorate %492 Location 492 
                                                      OpMemberDecorate %548 0 BuiltIn 548 
                                                      OpMemberDecorate %548 1 BuiltIn 548 
                                                      OpMemberDecorate %548 2 BuiltIn 548 
                                                      OpDecorate %548 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 8 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                              %14 = OpTypeArray %7 %11 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeArray %7 %15 
                                              %20 = OpTypeArray %7 %15 
                                              %21 = OpTypeInt 32 1 
                                              %22 = OpTypeVector %21 4 
                                              %23 = OpTypeStruct %12 %13 %14 %16 %17 %7 %18 %19 %20 %22 %7 
                                              %24 = OpTypePointer Uniform %23 
Uniform struct {f32_4[8]; f32_4[8]; f32_4[8]; f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; i32_4; f32_4;}* %25 = OpVariable Uniform 
                                          i32 %26 = OpConstant 3 
                                          i32 %27 = OpConstant 0 
                                              %28 = OpTypeVector %6 3 
                                              %29 = OpTypePointer Uniform %7 
                                          i32 %33 = OpConstant 6 
                                          i32 %34 = OpConstant 1 
                                          i32 %53 = OpConstant 2 
                               Private f32_4* %78 = OpVariable Private 
                                             %124 = OpTypePointer Private %28 
                              Private f32_3* %125 = OpVariable Private 
                              Private f32_3* %160 = OpVariable Private 
                              Private f32_3* %195 = OpVariable Private 
                                         i32 %196 = OpConstant 4 
                                         i32 %200 = OpConstant 7 
                              Private f32_3* %232 = OpVariable Private 
                              Private f32_3* %267 = OpVariable Private 
                                             %304 = OpTypePointer Input %28 
                                Input f32_3* %305 = OpVariable Input 
                                Input f32_3* %337 = OpVariable Input 
                                         u32 %340 = OpConstant 0 
                                             %341 = OpTypePointer Private %6 
                                         u32 %346 = OpConstant 1 
                                         u32 %351 = OpConstant 2 
                                Private f32* %353 = OpVariable Private 
                              Private f32_3* %368 = OpVariable Private 
                                         i32 %369 = OpConstant 5 
                                             %373 = OpTypePointer Function %21 
                                         i32 %381 = OpConstant 9 
                                             %382 = OpTypePointer Uniform %21 
                                             %385 = OpTypeBool 
                                Private f32* %400 = OpVariable Private 
                                Private f32* %404 = OpVariable Private 
                                             %406 = OpTypePointer Uniform %6 
                                         f32 %411 = OpConstant 3.674022E-40 
                                             %415 = OpTypePointer Private %385 
                               Private bool* %416 = OpVariable Private 
                                         f32 %417 = OpConstant 3.674022E-40 
                                         u32 %419 = OpConstant 3 
                               Private bool* %423 = OpVariable Private 
                                         f32 %433 = OpConstant 3.674022E-40 
                                         f32 %442 = OpConstant 3.674022E-40 
                                Private f32* %444 = OpVariable Private 
                              Private f32_3* %448 = OpVariable Private 
                                       f32_3 %470 = OpConstantComposite %411 %411 %411 
                                             %477 = OpTypePointer Output %7 
                               Output f32_4* %478 = OpVariable Output 
                                             %489 = OpTypeVector %6 2 
                                             %490 = OpTypePointer Output %489 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_3* %492 = OpVariable Input 
                                         i32 %495 = OpConstant 10 
                                         i32 %529 = OpConstant 8 
                                             %547 = OpTypeArray %6 %346 
                                             %548 = OpTypeStruct %7 %6 %547 
                                             %549 = OpTypePointer Output %548 
        Output struct {f32_4; f32; f32[1];}* %550 = OpVariable Output 
                                             %559 = OpTypePointer Output %6 
                                             %566 = OpTypePointer Private %21 
                                Private i32* %567 = OpVariable Private 
                               Private bool* %568 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function i32* %374 = OpVariable Function 
                               Uniform f32_4* %30 = OpAccessChain %25 %26 %27 
                                        f32_4 %31 = OpLoad %30 
                                        f32_3 %32 = OpVectorShuffle %31 %31 1 1 1 
                               Uniform f32_4* %35 = OpAccessChain %25 %33 %34 
                                        f32_4 %36 = OpLoad %35 
                                        f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
                                        f32_3 %38 = OpFMul %32 %37 
                                        f32_4 %39 = OpLoad %9 
                                        f32_4 %40 = OpVectorShuffle %39 %38 4 5 6 3 
                                                      OpStore %9 %40 
                               Uniform f32_4* %41 = OpAccessChain %25 %33 %27 
                                        f32_4 %42 = OpLoad %41 
                                        f32_3 %43 = OpVectorShuffle %42 %42 0 1 2 
                               Uniform f32_4* %44 = OpAccessChain %25 %26 %27 
                                        f32_4 %45 = OpLoad %44 
                                        f32_3 %46 = OpVectorShuffle %45 %45 0 0 0 
                                        f32_3 %47 = OpFMul %43 %46 
                                        f32_4 %48 = OpLoad %9 
                                        f32_3 %49 = OpVectorShuffle %48 %48 0 1 2 
                                        f32_3 %50 = OpFAdd %47 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_4 %52 = OpVectorShuffle %51 %50 4 5 6 3 
                                                      OpStore %9 %52 
                               Uniform f32_4* %54 = OpAccessChain %25 %33 %53 
                                        f32_4 %55 = OpLoad %54 
                                        f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                               Uniform f32_4* %57 = OpAccessChain %25 %26 %27 
                                        f32_4 %58 = OpLoad %57 
                                        f32_3 %59 = OpVectorShuffle %58 %58 2 2 2 
                                        f32_3 %60 = OpFMul %56 %59 
                                        f32_4 %61 = OpLoad %9 
                                        f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                        f32_3 %63 = OpFAdd %60 %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %63 4 5 6 3 
                                                      OpStore %9 %65 
                               Uniform f32_4* %66 = OpAccessChain %25 %33 %26 
                                        f32_4 %67 = OpLoad %66 
                                        f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
                               Uniform f32_4* %69 = OpAccessChain %25 %26 %27 
                                        f32_4 %70 = OpLoad %69 
                                        f32_3 %71 = OpVectorShuffle %70 %70 3 3 3 
                                        f32_3 %72 = OpFMul %68 %71 
                                        f32_4 %73 = OpLoad %9 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
                                        f32_3 %75 = OpFAdd %72 %74 
                                        f32_4 %76 = OpLoad %9 
                                        f32_4 %77 = OpVectorShuffle %76 %75 4 5 6 3 
                                                      OpStore %9 %77 
                               Uniform f32_4* %79 = OpAccessChain %25 %26 %34 
                                        f32_4 %80 = OpLoad %79 
                                        f32_3 %81 = OpVectorShuffle %80 %80 1 1 1 
                               Uniform f32_4* %82 = OpAccessChain %25 %33 %34 
                                        f32_4 %83 = OpLoad %82 
                                        f32_3 %84 = OpVectorShuffle %83 %83 0 1 2 
                                        f32_3 %85 = OpFMul %81 %84 
                                        f32_4 %86 = OpLoad %78 
                                        f32_4 %87 = OpVectorShuffle %86 %85 4 5 6 3 
                                                      OpStore %78 %87 
                               Uniform f32_4* %88 = OpAccessChain %25 %33 %27 
                                        f32_4 %89 = OpLoad %88 
                                        f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                               Uniform f32_4* %91 = OpAccessChain %25 %26 %34 
                                        f32_4 %92 = OpLoad %91 
                                        f32_3 %93 = OpVectorShuffle %92 %92 0 0 0 
                                        f32_3 %94 = OpFMul %90 %93 
                                        f32_4 %95 = OpLoad %78 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                        f32_3 %97 = OpFAdd %94 %96 
                                        f32_4 %98 = OpLoad %78 
                                        f32_4 %99 = OpVectorShuffle %98 %97 4 5 6 3 
                                                      OpStore %78 %99 
                              Uniform f32_4* %100 = OpAccessChain %25 %33 %53 
                                       f32_4 %101 = OpLoad %100 
                                       f32_3 %102 = OpVectorShuffle %101 %101 0 1 2 
                              Uniform f32_4* %103 = OpAccessChain %25 %26 %34 
                                       f32_4 %104 = OpLoad %103 
                                       f32_3 %105 = OpVectorShuffle %104 %104 2 2 2 
                                       f32_3 %106 = OpFMul %102 %105 
                                       f32_4 %107 = OpLoad %78 
                                       f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                       f32_3 %109 = OpFAdd %106 %108 
                                       f32_4 %110 = OpLoad %78 
                                       f32_4 %111 = OpVectorShuffle %110 %109 4 5 6 3 
                                                      OpStore %78 %111 
                              Uniform f32_4* %112 = OpAccessChain %25 %33 %26 
                                       f32_4 %113 = OpLoad %112 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                              Uniform f32_4* %115 = OpAccessChain %25 %26 %34 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 3 3 3 
                                       f32_3 %118 = OpFMul %114 %117 
                                       f32_4 %119 = OpLoad %78 
                                       f32_3 %120 = OpVectorShuffle %119 %119 0 1 2 
                                       f32_3 %121 = OpFAdd %118 %120 
                                       f32_4 %122 = OpLoad %78 
                                       f32_4 %123 = OpVectorShuffle %122 %121 4 5 6 3 
                                                      OpStore %78 %123 
                              Uniform f32_4* %126 = OpAccessChain %25 %26 %53 
                                       f32_4 %127 = OpLoad %126 
                                       f32_3 %128 = OpVectorShuffle %127 %127 1 1 1 
                              Uniform f32_4* %129 = OpAccessChain %25 %33 %34 
                                       f32_4 %130 = OpLoad %129 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_3 %132 = OpFMul %128 %131 
                                                      OpStore %125 %132 
                              Uniform f32_4* %133 = OpAccessChain %25 %33 %27 
                                       f32_4 %134 = OpLoad %133 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                              Uniform f32_4* %136 = OpAccessChain %25 %26 %53 
                                       f32_4 %137 = OpLoad %136 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 0 0 
                                       f32_3 %139 = OpFMul %135 %138 
                                       f32_3 %140 = OpLoad %125 
                                       f32_3 %141 = OpFAdd %139 %140 
                                                      OpStore %125 %141 
                              Uniform f32_4* %142 = OpAccessChain %25 %33 %53 
                                       f32_4 %143 = OpLoad %142 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                              Uniform f32_4* %145 = OpAccessChain %25 %26 %53 
                                       f32_4 %146 = OpLoad %145 
                                       f32_3 %147 = OpVectorShuffle %146 %146 2 2 2 
                                       f32_3 %148 = OpFMul %144 %147 
                                       f32_3 %149 = OpLoad %125 
                                       f32_3 %150 = OpFAdd %148 %149 
                                                      OpStore %125 %150 
                              Uniform f32_4* %151 = OpAccessChain %25 %33 %26 
                                       f32_4 %152 = OpLoad %151 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                              Uniform f32_4* %154 = OpAccessChain %25 %26 %53 
                                       f32_4 %155 = OpLoad %154 
                                       f32_3 %156 = OpVectorShuffle %155 %155 3 3 3 
                                       f32_3 %157 = OpFMul %153 %156 
                                       f32_3 %158 = OpLoad %125 
                                       f32_3 %159 = OpFAdd %157 %158 
                                                      OpStore %125 %159 
                              Uniform f32_4* %161 = OpAccessChain %25 %26 %26 
                                       f32_4 %162 = OpLoad %161 
                                       f32_3 %163 = OpVectorShuffle %162 %162 1 1 1 
                              Uniform f32_4* %164 = OpAccessChain %25 %33 %34 
                                       f32_4 %165 = OpLoad %164 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                       f32_3 %167 = OpFMul %163 %166 
                                                      OpStore %160 %167 
                              Uniform f32_4* %168 = OpAccessChain %25 %33 %27 
                                       f32_4 %169 = OpLoad %168 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
                              Uniform f32_4* %171 = OpAccessChain %25 %26 %26 
                                       f32_4 %172 = OpLoad %171 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 0 0 
                                       f32_3 %174 = OpFMul %170 %173 
                                       f32_3 %175 = OpLoad %160 
                                       f32_3 %176 = OpFAdd %174 %175 
                                                      OpStore %160 %176 
                              Uniform f32_4* %177 = OpAccessChain %25 %33 %53 
                                       f32_4 %178 = OpLoad %177 
                                       f32_3 %179 = OpVectorShuffle %178 %178 0 1 2 
                              Uniform f32_4* %180 = OpAccessChain %25 %26 %26 
                                       f32_4 %181 = OpLoad %180 
                                       f32_3 %182 = OpVectorShuffle %181 %181 2 2 2 
                                       f32_3 %183 = OpFMul %179 %182 
                                       f32_3 %184 = OpLoad %160 
                                       f32_3 %185 = OpFAdd %183 %184 
                                                      OpStore %160 %185 
                              Uniform f32_4* %186 = OpAccessChain %25 %33 %26 
                                       f32_4 %187 = OpLoad %186 
                                       f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
                              Uniform f32_4* %189 = OpAccessChain %25 %26 %26 
                                       f32_4 %190 = OpLoad %189 
                                       f32_3 %191 = OpVectorShuffle %190 %190 3 3 3 
                                       f32_3 %192 = OpFMul %188 %191 
                                       f32_3 %193 = OpLoad %160 
                                       f32_3 %194 = OpFAdd %192 %193 
                                                      OpStore %160 %194 
                              Uniform f32_4* %197 = OpAccessChain %25 %196 %34 
                                       f32_4 %198 = OpLoad %197 
                                       f32_3 %199 = OpVectorShuffle %198 %198 0 1 2 
                              Uniform f32_4* %201 = OpAccessChain %25 %200 %27 
                                       f32_4 %202 = OpLoad %201 
                                       f32_3 %203 = OpVectorShuffle %202 %202 1 1 1 
                                       f32_3 %204 = OpFMul %199 %203 
                                                      OpStore %195 %204 
                              Uniform f32_4* %205 = OpAccessChain %25 %196 %27 
                                       f32_4 %206 = OpLoad %205 
                                       f32_3 %207 = OpVectorShuffle %206 %206 0 1 2 
                              Uniform f32_4* %208 = OpAccessChain %25 %200 %27 
                                       f32_4 %209 = OpLoad %208 
                                       f32_3 %210 = OpVectorShuffle %209 %209 0 0 0 
                                       f32_3 %211 = OpFMul %207 %210 
                                       f32_3 %212 = OpLoad %195 
                                       f32_3 %213 = OpFAdd %211 %212 
                                                      OpStore %195 %213 
                              Uniform f32_4* %214 = OpAccessChain %25 %196 %53 
                                       f32_4 %215 = OpLoad %214 
                                       f32_3 %216 = OpVectorShuffle %215 %215 0 1 2 
                              Uniform f32_4* %217 = OpAccessChain %25 %200 %27 
                                       f32_4 %218 = OpLoad %217 
                                       f32_3 %219 = OpVectorShuffle %218 %218 2 2 2 
                                       f32_3 %220 = OpFMul %216 %219 
                                       f32_3 %221 = OpLoad %195 
                                       f32_3 %222 = OpFAdd %220 %221 
                                                      OpStore %195 %222 
                              Uniform f32_4* %223 = OpAccessChain %25 %196 %26 
                                       f32_4 %224 = OpLoad %223 
                                       f32_3 %225 = OpVectorShuffle %224 %224 0 1 2 
                              Uniform f32_4* %226 = OpAccessChain %25 %200 %27 
                                       f32_4 %227 = OpLoad %226 
                                       f32_3 %228 = OpVectorShuffle %227 %227 3 3 3 
                                       f32_3 %229 = OpFMul %225 %228 
                                       f32_3 %230 = OpLoad %195 
                                       f32_3 %231 = OpFAdd %229 %230 
                                                      OpStore %195 %231 
                              Uniform f32_4* %233 = OpAccessChain %25 %196 %34 
                                       f32_4 %234 = OpLoad %233 
                                       f32_3 %235 = OpVectorShuffle %234 %234 0 1 2 
                              Uniform f32_4* %236 = OpAccessChain %25 %200 %34 
                                       f32_4 %237 = OpLoad %236 
                                       f32_3 %238 = OpVectorShuffle %237 %237 1 1 1 
                                       f32_3 %239 = OpFMul %235 %238 
                                                      OpStore %232 %239 
                              Uniform f32_4* %240 = OpAccessChain %25 %196 %27 
                                       f32_4 %241 = OpLoad %240 
                                       f32_3 %242 = OpVectorShuffle %241 %241 0 1 2 
                              Uniform f32_4* %243 = OpAccessChain %25 %200 %34 
                                       f32_4 %244 = OpLoad %243 
                                       f32_3 %245 = OpVectorShuffle %244 %244 0 0 0 
                                       f32_3 %246 = OpFMul %242 %245 
                                       f32_3 %247 = OpLoad %232 
                                       f32_3 %248 = OpFAdd %246 %247 
                                                      OpStore %232 %248 
                              Uniform f32_4* %249 = OpAccessChain %25 %196 %53 
                                       f32_4 %250 = OpLoad %249 
                                       f32_3 %251 = OpVectorShuffle %250 %250 0 1 2 
                              Uniform f32_4* %252 = OpAccessChain %25 %200 %34 
                                       f32_4 %253 = OpLoad %252 
                                       f32_3 %254 = OpVectorShuffle %253 %253 2 2 2 
                                       f32_3 %255 = OpFMul %251 %254 
                                       f32_3 %256 = OpLoad %232 
                                       f32_3 %257 = OpFAdd %255 %256 
                                                      OpStore %232 %257 
                              Uniform f32_4* %258 = OpAccessChain %25 %196 %26 
                                       f32_4 %259 = OpLoad %258 
                                       f32_3 %260 = OpVectorShuffle %259 %259 0 1 2 
                              Uniform f32_4* %261 = OpAccessChain %25 %200 %34 
                                       f32_4 %262 = OpLoad %261 
                                       f32_3 %263 = OpVectorShuffle %262 %262 3 3 3 
                                       f32_3 %264 = OpFMul %260 %263 
                                       f32_3 %265 = OpLoad %232 
                                       f32_3 %266 = OpFAdd %264 %265 
                                                      OpStore %232 %266 
                              Uniform f32_4* %268 = OpAccessChain %25 %196 %34 
                                       f32_4 %269 = OpLoad %268 
                                       f32_3 %270 = OpVectorShuffle %269 %269 0 1 2 
                              Uniform f32_4* %271 = OpAccessChain %25 %200 %53 
                                       f32_4 %272 = OpLoad %271 
                                       f32_3 %273 = OpVectorShuffle %272 %272 1 1 1 
                                       f32_3 %274 = OpFMul %270 %273 
                                                      OpStore %267 %274 
                              Uniform f32_4* %275 = OpAccessChain %25 %196 %27 
                                       f32_4 %276 = OpLoad %275 
                                       f32_3 %277 = OpVectorShuffle %276 %276 0 1 2 
                              Uniform f32_4* %278 = OpAccessChain %25 %200 %53 
                                       f32_4 %279 = OpLoad %278 
                                       f32_3 %280 = OpVectorShuffle %279 %279 0 0 0 
                                       f32_3 %281 = OpFMul %277 %280 
                                       f32_3 %282 = OpLoad %267 
                                       f32_3 %283 = OpFAdd %281 %282 
                                                      OpStore %267 %283 
                              Uniform f32_4* %284 = OpAccessChain %25 %196 %53 
                                       f32_4 %285 = OpLoad %284 
                                       f32_3 %286 = OpVectorShuffle %285 %285 0 1 2 
                              Uniform f32_4* %287 = OpAccessChain %25 %200 %53 
                                       f32_4 %288 = OpLoad %287 
                                       f32_3 %289 = OpVectorShuffle %288 %288 2 2 2 
                                       f32_3 %290 = OpFMul %286 %289 
                                       f32_3 %291 = OpLoad %267 
                                       f32_3 %292 = OpFAdd %290 %291 
                                                      OpStore %267 %292 
                              Uniform f32_4* %293 = OpAccessChain %25 %196 %26 
                                       f32_4 %294 = OpLoad %293 
                                       f32_3 %295 = OpVectorShuffle %294 %294 0 1 2 
                              Uniform f32_4* %296 = OpAccessChain %25 %200 %53 
                                       f32_4 %297 = OpLoad %296 
                                       f32_3 %298 = OpVectorShuffle %297 %297 3 3 3 
                                       f32_3 %299 = OpFMul %295 %298 
                                       f32_3 %300 = OpLoad %267 
                                       f32_3 %301 = OpFAdd %299 %300 
                                                      OpStore %267 %301 
                                       f32_4 %302 = OpLoad %78 
                                       f32_3 %303 = OpVectorShuffle %302 %302 0 1 2 
                                       f32_3 %306 = OpLoad %305 
                                       f32_3 %307 = OpVectorShuffle %306 %306 1 1 1 
                                       f32_3 %308 = OpFMul %303 %307 
                                       f32_4 %309 = OpLoad %78 
                                       f32_4 %310 = OpVectorShuffle %309 %308 4 5 6 3 
                                                      OpStore %78 %310 
                                       f32_4 %311 = OpLoad %9 
                                       f32_3 %312 = OpVectorShuffle %311 %311 0 1 2 
                                       f32_3 %313 = OpLoad %305 
                                       f32_3 %314 = OpVectorShuffle %313 %313 0 0 0 
                                       f32_3 %315 = OpFMul %312 %314 
                                       f32_4 %316 = OpLoad %78 
                                       f32_3 %317 = OpVectorShuffle %316 %316 0 1 2 
                                       f32_3 %318 = OpFAdd %315 %317 
                                       f32_4 %319 = OpLoad %9 
                                       f32_4 %320 = OpVectorShuffle %319 %318 4 5 6 3 
                                                      OpStore %9 %320 
                                       f32_3 %321 = OpLoad %125 
                                       f32_3 %322 = OpLoad %305 
                                       f32_3 %323 = OpVectorShuffle %322 %322 2 2 2 
                                       f32_3 %324 = OpFMul %321 %323 
                                       f32_4 %325 = OpLoad %9 
                                       f32_3 %326 = OpVectorShuffle %325 %325 0 1 2 
                                       f32_3 %327 = OpFAdd %324 %326 
                                       f32_4 %328 = OpLoad %9 
                                       f32_4 %329 = OpVectorShuffle %328 %327 4 5 6 3 
                                                      OpStore %9 %329 
                                       f32_3 %330 = OpLoad %160 
                                       f32_4 %331 = OpLoad %9 
                                       f32_3 %332 = OpVectorShuffle %331 %331 0 1 2 
                                       f32_3 %333 = OpFAdd %330 %332 
                                       f32_4 %334 = OpLoad %9 
                                       f32_4 %335 = OpVectorShuffle %334 %333 4 5 6 3 
                                                      OpStore %9 %335 
                                       f32_3 %336 = OpLoad %195 
                                       f32_3 %338 = OpLoad %337 
                                         f32 %339 = OpDot %336 %338 
                                Private f32* %342 = OpAccessChain %78 %340 
                                                      OpStore %342 %339 
                                       f32_3 %343 = OpLoad %232 
                                       f32_3 %344 = OpLoad %337 
                                         f32 %345 = OpDot %343 %344 
                                Private f32* %347 = OpAccessChain %78 %346 
                                                      OpStore %347 %345 
                                       f32_3 %348 = OpLoad %267 
                                       f32_3 %349 = OpLoad %337 
                                         f32 %350 = OpDot %348 %349 
                                Private f32* %352 = OpAccessChain %78 %351 
                                                      OpStore %352 %350 
                                       f32_4 %354 = OpLoad %78 
                                       f32_3 %355 = OpVectorShuffle %354 %354 0 1 2 
                                       f32_4 %356 = OpLoad %78 
                                       f32_3 %357 = OpVectorShuffle %356 %356 0 1 2 
                                         f32 %358 = OpDot %355 %357 
                                                      OpStore %353 %358 
                                         f32 %359 = OpLoad %353 
                                         f32 %360 = OpExtInst %1 32 %359 
                                                      OpStore %353 %360 
                                         f32 %361 = OpLoad %353 
                                       f32_3 %362 = OpCompositeConstruct %361 %361 %361 
                                       f32_4 %363 = OpLoad %78 
                                       f32_3 %364 = OpVectorShuffle %363 %363 0 1 2 
                                       f32_3 %365 = OpFMul %362 %364 
                                       f32_4 %366 = OpLoad %78 
                                       f32_4 %367 = OpVectorShuffle %366 %365 4 5 6 3 
                                                      OpStore %78 %367 
                              Uniform f32_4* %370 = OpAccessChain %25 %369 
                                       f32_4 %371 = OpLoad %370 
                                       f32_3 %372 = OpVectorShuffle %371 %371 0 1 2 
                                                      OpStore %368 %372 
                                                      OpStore %374 %27 
                                                      OpBranch %375 
                                             %375 = OpLabel 
                                                      OpLoopMerge %377 %378 None 
                                                      OpBranch %379 
                                             %379 = OpLabel 
                                         i32 %380 = OpLoad %374 
                                Uniform i32* %383 = OpAccessChain %25 %381 %340 
                                         i32 %384 = OpLoad %383 
                                        bool %386 = OpSLessThan %380 %384 
                                                      OpBranchConditional %386 %376 %377 
                                             %376 = OpLabel 
                                       f32_4 %387 = OpLoad %9 
                                       f32_3 %388 = OpVectorShuffle %387 %387 0 1 2 
                                       f32_3 %389 = OpFNegate %388 
                                         i32 %390 = OpLoad %374 
                              Uniform f32_4* %391 = OpAccessChain %25 %34 %390 
                                       f32_4 %392 = OpLoad %391 
                                       f32_3 %393 = OpVectorShuffle %392 %392 3 3 3 
                                       f32_3 %394 = OpFMul %389 %393 
                                         i32 %395 = OpLoad %374 
                              Uniform f32_4* %396 = OpAccessChain %25 %34 %395 
                                       f32_4 %397 = OpLoad %396 
                                       f32_3 %398 = OpVectorShuffle %397 %397 0 1 2 
                                       f32_3 %399 = OpFAdd %394 %398 
                                                      OpStore %125 %399 
                                       f32_3 %401 = OpLoad %125 
                                       f32_3 %402 = OpLoad %125 
                                         f32 %403 = OpDot %401 %402 
                                                      OpStore %400 %403 
                                         i32 %405 = OpLoad %374 
                                Uniform f32* %407 = OpAccessChain %25 %53 %405 %351 
                                         f32 %408 = OpLoad %407 
                                         f32 %409 = OpLoad %400 
                                         f32 %410 = OpFMul %408 %409 
                                         f32 %412 = OpFAdd %410 %411 
                                                      OpStore %404 %412 
                                         f32 %413 = OpLoad %404 
                                         f32 %414 = OpFDiv %411 %413 
                                                      OpStore %404 %414 
                                         i32 %418 = OpLoad %374 
                                Uniform f32* %420 = OpAccessChain %25 %34 %418 %419 
                                         f32 %421 = OpLoad %420 
                                        bool %422 = OpFOrdNotEqual %417 %421 
                                                      OpStore %416 %422 
                                         i32 %424 = OpLoad %374 
                                Uniform f32* %425 = OpAccessChain %25 %53 %424 %419 
                                         f32 %426 = OpLoad %425 
                                         f32 %427 = OpLoad %400 
                                        bool %428 = OpFOrdLessThan %426 %427 
                                                      OpStore %423 %428 
                                        bool %429 = OpLoad %423 
                                        bool %430 = OpLoad %416 
                                        bool %431 = OpLogicalAnd %429 %430 
                                                      OpStore %416 %431 
                                         f32 %432 = OpLoad %400 
                                         f32 %434 = OpExtInst %1 40 %432 %433 
                                                      OpStore %400 %434 
                                         f32 %435 = OpLoad %400 
                                         f32 %436 = OpExtInst %1 32 %435 
                                                      OpStore %400 %436 
                                         f32 %437 = OpLoad %400 
                                       f32_3 %438 = OpCompositeConstruct %437 %437 %437 
                                       f32_3 %439 = OpLoad %125 
                                       f32_3 %440 = OpFMul %438 %439 
                                                      OpStore %125 %440 
                                         f32 %441 = OpLoad %404 
                                         f32 %443 = OpFMul %441 %442 
                                                      OpStore %400 %443 
                                        bool %445 = OpLoad %416 
                                         f32 %446 = OpLoad %400 
                                         f32 %447 = OpSelect %445 %417 %446 
                                                      OpStore %444 %447 
                                       f32_4 %449 = OpLoad %78 
                                       f32_3 %450 = OpVectorShuffle %449 %449 0 1 2 
                                       f32_3 %451 = OpLoad %125 
                                         f32 %452 = OpDot %450 %451 
                                Private f32* %453 = OpAccessChain %448 %340 
                                                      OpStore %453 %452 
                                Private f32* %454 = OpAccessChain %448 %340 
                                         f32 %455 = OpLoad %454 
                                         f32 %456 = OpExtInst %1 40 %455 %417 
                                Private f32* %457 = OpAccessChain %448 %340 
                                                      OpStore %457 %456 
                                       f32_3 %458 = OpLoad %448 
                                       f32_3 %459 = OpVectorShuffle %458 %458 0 0 0 
                                         i32 %460 = OpLoad %374 
                              Uniform f32_4* %461 = OpAccessChain %25 %27 %460 
                                       f32_4 %462 = OpLoad %461 
                                       f32_3 %463 = OpVectorShuffle %462 %462 0 1 2 
                                       f32_3 %464 = OpFMul %459 %463 
                                                      OpStore %448 %464 
                                         f32 %465 = OpLoad %444 
                                       f32_3 %466 = OpCompositeConstruct %465 %465 %465 
                                       f32_3 %467 = OpLoad %448 
                                       f32_3 %468 = OpFMul %466 %467 
                                                      OpStore %448 %468 
                                       f32_3 %469 = OpLoad %448 
                                       f32_3 %471 = OpExtInst %1 37 %469 %470 
                                                      OpStore %448 %471 
                                       f32_3 %472 = OpLoad %368 
                                       f32_3 %473 = OpLoad %448 
                                       f32_3 %474 = OpFAdd %472 %473 
                                                      OpStore %368 %474 
                                                      OpBranch %378 
                                             %378 = OpLabel 
                                         i32 %475 = OpLoad %374 
                                         i32 %476 = OpIAdd %475 %34 
                                                      OpStore %374 %476 
                                                      OpBranch %375 
                                             %377 = OpLabel 
                                       f32_3 %479 = OpLoad %368 
                                       f32_4 %480 = OpLoad %478 
                                       f32_4 %481 = OpVectorShuffle %480 %479 4 5 6 3 
                                                      OpStore %478 %481 
                                       f32_4 %482 = OpLoad %478 
                                       f32_3 %483 = OpVectorShuffle %482 %482 0 1 2 
                                       f32_3 %484 = OpCompositeConstruct %417 %417 %417 
                                       f32_3 %485 = OpCompositeConstruct %411 %411 %411 
                                       f32_3 %486 = OpExtInst %1 43 %483 %484 %485 
                                       f32_4 %487 = OpLoad %478 
                                       f32_4 %488 = OpVectorShuffle %487 %486 4 5 6 3 
                                                      OpStore %478 %488 
                                       f32_3 %493 = OpLoad %492 
                                       f32_2 %494 = OpVectorShuffle %493 %493 0 1 
                              Uniform f32_4* %496 = OpAccessChain %25 %495 
                                       f32_4 %497 = OpLoad %496 
                                       f32_2 %498 = OpVectorShuffle %497 %497 0 1 
                                       f32_2 %499 = OpFMul %494 %498 
                              Uniform f32_4* %500 = OpAccessChain %25 %495 
                                       f32_4 %501 = OpLoad %500 
                                       f32_2 %502 = OpVectorShuffle %501 %501 2 3 
                                       f32_2 %503 = OpFAdd %499 %502 
                                                      OpStore vs_TEXCOORD0 %503 
                                       f32_3 %504 = OpLoad %305 
                                       f32_4 %505 = OpVectorShuffle %504 %504 1 1 1 1 
                              Uniform f32_4* %506 = OpAccessChain %25 %26 %34 
                                       f32_4 %507 = OpLoad %506 
                                       f32_4 %508 = OpFMul %505 %507 
                                                      OpStore %9 %508 
                              Uniform f32_4* %509 = OpAccessChain %25 %26 %27 
                                       f32_4 %510 = OpLoad %509 
                                       f32_3 %511 = OpLoad %305 
                                       f32_4 %512 = OpVectorShuffle %511 %511 0 0 0 0 
                                       f32_4 %513 = OpFMul %510 %512 
                                       f32_4 %514 = OpLoad %9 
                                       f32_4 %515 = OpFAdd %513 %514 
                                                      OpStore %9 %515 
                              Uniform f32_4* %516 = OpAccessChain %25 %26 %53 
                                       f32_4 %517 = OpLoad %516 
                                       f32_3 %518 = OpLoad %305 
                                       f32_4 %519 = OpVectorShuffle %518 %518 2 2 2 2 
                                       f32_4 %520 = OpFMul %517 %519 
                                       f32_4 %521 = OpLoad %9 
                                       f32_4 %522 = OpFAdd %520 %521 
                                                      OpStore %9 %522 
                                       f32_4 %523 = OpLoad %9 
                              Uniform f32_4* %524 = OpAccessChain %25 %26 %26 
                                       f32_4 %525 = OpLoad %524 
                                       f32_4 %526 = OpFAdd %523 %525 
                                                      OpStore %9 %526 
                                       f32_4 %527 = OpLoad %9 
                                       f32_4 %528 = OpVectorShuffle %527 %527 1 1 1 1 
                              Uniform f32_4* %530 = OpAccessChain %25 %529 %34 
                                       f32_4 %531 = OpLoad %530 
                                       f32_4 %532 = OpFMul %528 %531 
                                                      OpStore %78 %532 
                              Uniform f32_4* %533 = OpAccessChain %25 %529 %27 
                                       f32_4 %534 = OpLoad %533 
                                       f32_4 %535 = OpLoad %9 
                                       f32_4 %536 = OpVectorShuffle %535 %535 0 0 0 0 
                                       f32_4 %537 = OpFMul %534 %536 
                                       f32_4 %538 = OpLoad %78 
                                       f32_4 %539 = OpFAdd %537 %538 
                                                      OpStore %78 %539 
                              Uniform f32_4* %540 = OpAccessChain %25 %529 %53 
                                       f32_4 %541 = OpLoad %540 
                                       f32_4 %542 = OpLoad %9 
                                       f32_4 %543 = OpVectorShuffle %542 %542 2 2 2 2 
                                       f32_4 %544 = OpFMul %541 %543 
                                       f32_4 %545 = OpLoad %78 
                                       f32_4 %546 = OpFAdd %544 %545 
                                                      OpStore %78 %546 
                              Uniform f32_4* %551 = OpAccessChain %25 %529 %26 
                                       f32_4 %552 = OpLoad %551 
                                       f32_4 %553 = OpLoad %9 
                                       f32_4 %554 = OpVectorShuffle %553 %553 3 3 3 3 
                                       f32_4 %555 = OpFMul %552 %554 
                                       f32_4 %556 = OpLoad %78 
                                       f32_4 %557 = OpFAdd %555 %556 
                               Output f32_4* %558 = OpAccessChain %550 %27 
                                                      OpStore %558 %557 
                                 Output f32* %560 = OpAccessChain %478 %419 
                                                      OpStore %560 %411 
                                 Output f32* %561 = OpAccessChain %550 %27 %346 
                                         f32 %562 = OpLoad %561 
                                         f32 %563 = OpFNegate %562 
                                 Output f32* %564 = OpAccessChain %550 %27 %346 
                                                      OpStore %564 %563 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 47
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %30 %35 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %9 RelaxedPrecision 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %13 RelaxedPrecision 
                                             OpDecorate %16 RelaxedPrecision 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %17 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %26 RelaxedPrecision 
                                             OpDecorate %27 RelaxedPrecision 
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %30 RelaxedPrecision 
                                             OpDecorate %30 Location 30 
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate %33 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %35 Location 35 
                                             OpDecorate %36 RelaxedPrecision 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %24 = OpTypeVector %6 4 
                      Private f32_3* %27 = OpVariable Private 
                                     %29 = OpTypePointer Input %24 
                        Input f32_4* %30 = OpVariable Input 
                                     %34 = OpTypePointer Output %24 
                       Output f32_4* %35 = OpVariable Output 
                                 f32 %41 = OpConstant 3.674022E-40 
                                     %42 = OpTypeInt 32 0 
                                 u32 %43 = OpConstant 3 
                                     %44 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
                                             OpStore %9 %26 
                               f32_3 %28 = OpLoad %9 
                               f32_4 %31 = OpLoad %30 
                               f32_3 %32 = OpVectorShuffle %31 %31 0 1 2 
                               f32_3 %33 = OpFMul %28 %32 
                                             OpStore %27 %33 
                               f32_3 %36 = OpLoad %27 
                               f32_3 %37 = OpLoad %27 
                               f32_3 %38 = OpFAdd %36 %37 
                               f32_4 %39 = OpLoad %35 
                               f32_4 %40 = OpVectorShuffle %39 %38 4 5 6 3 
                                             OpStore %35 %40 
                         Output f32* %45 = OpAccessChain %35 %43 
                                             OpStore %45 %41 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "POINT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 569
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %305 %337 %478 %491 %492 %550 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpMemberDecorate %23 0 RelaxedPrecision 
                                                      OpMemberDecorate %23 0 Offset 23 
                                                      OpMemberDecorate %23 1 Offset 23 
                                                      OpMemberDecorate %23 2 RelaxedPrecision 
                                                      OpMemberDecorate %23 2 Offset 23 
                                                      OpMemberDecorate %23 3 Offset 23 
                                                      OpMemberDecorate %23 4 Offset 23 
                                                      OpMemberDecorate %23 5 RelaxedPrecision 
                                                      OpMemberDecorate %23 5 Offset 23 
                                                      OpMemberDecorate %23 6 Offset 23 
                                                      OpMemberDecorate %23 7 Offset 23 
                                                      OpMemberDecorate %23 8 Offset 23 
                                                      OpMemberDecorate %23 9 Offset 23 
                                                      OpMemberDecorate %23 10 Offset 23 
                                                      OpDecorate %23 Block 
                                                      OpDecorate %25 DescriptorSet 25 
                                                      OpDecorate %25 Binding 25 
                                                      OpDecorate %305 Location 305 
                                                      OpDecorate %337 Location 337 
                                                      OpDecorate %368 RelaxedPrecision 
                                                      OpDecorate %371 RelaxedPrecision 
                                                      OpDecorate %372 RelaxedPrecision 
                                                      OpDecorate %408 RelaxedPrecision 
                                                      OpDecorate %426 RelaxedPrecision 
                                                      OpDecorate %444 RelaxedPrecision 
                                                      OpDecorate %448 RelaxedPrecision 
                                                      OpDecorate %455 RelaxedPrecision 
                                                      OpDecorate %456 RelaxedPrecision 
                                                      OpDecorate %458 RelaxedPrecision 
                                                      OpDecorate %459 RelaxedPrecision 
                                                      OpDecorate %462 RelaxedPrecision 
                                                      OpDecorate %463 RelaxedPrecision 
                                                      OpDecorate %464 RelaxedPrecision 
                                                      OpDecorate %465 RelaxedPrecision 
                                                      OpDecorate %466 RelaxedPrecision 
                                                      OpDecorate %467 RelaxedPrecision 
                                                      OpDecorate %468 RelaxedPrecision 
                                                      OpDecorate %469 RelaxedPrecision 
                                                      OpDecorate %471 RelaxedPrecision 
                                                      OpDecorate %472 RelaxedPrecision 
                                                      OpDecorate %473 RelaxedPrecision 
                                                      OpDecorate %474 RelaxedPrecision 
                                                      OpDecorate %478 RelaxedPrecision 
                                                      OpDecorate %478 Location 478 
                                                      OpDecorate %479 RelaxedPrecision 
                                                      OpDecorate %482 RelaxedPrecision 
                                                      OpDecorate %483 RelaxedPrecision 
                                                      OpDecorate %484 RelaxedPrecision 
                                                      OpDecorate %485 RelaxedPrecision 
                                                      OpDecorate %486 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 491 
                                                      OpDecorate %492 Location 492 
                                                      OpMemberDecorate %548 0 BuiltIn 548 
                                                      OpMemberDecorate %548 1 BuiltIn 548 
                                                      OpMemberDecorate %548 2 BuiltIn 548 
                                                      OpDecorate %548 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 8 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                              %14 = OpTypeArray %7 %11 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeArray %7 %15 
                                              %20 = OpTypeArray %7 %15 
                                              %21 = OpTypeInt 32 1 
                                              %22 = OpTypeVector %21 4 
                                              %23 = OpTypeStruct %12 %13 %14 %16 %17 %7 %18 %19 %20 %22 %7 
                                              %24 = OpTypePointer Uniform %23 
Uniform struct {f32_4[8]; f32_4[8]; f32_4[8]; f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; i32_4; f32_4;}* %25 = OpVariable Uniform 
                                          i32 %26 = OpConstant 3 
                                          i32 %27 = OpConstant 0 
                                              %28 = OpTypeVector %6 3 
                                              %29 = OpTypePointer Uniform %7 
                                          i32 %33 = OpConstant 6 
                                          i32 %34 = OpConstant 1 
                                          i32 %53 = OpConstant 2 
                               Private f32_4* %78 = OpVariable Private 
                                             %124 = OpTypePointer Private %28 
                              Private f32_3* %125 = OpVariable Private 
                              Private f32_3* %160 = OpVariable Private 
                              Private f32_3* %195 = OpVariable Private 
                                         i32 %196 = OpConstant 4 
                                         i32 %200 = OpConstant 7 
                              Private f32_3* %232 = OpVariable Private 
                              Private f32_3* %267 = OpVariable Private 
                                             %304 = OpTypePointer Input %28 
                                Input f32_3* %305 = OpVariable Input 
                                Input f32_3* %337 = OpVariable Input 
                                         u32 %340 = OpConstant 0 
                                             %341 = OpTypePointer Private %6 
                                         u32 %346 = OpConstant 1 
                                         u32 %351 = OpConstant 2 
                                Private f32* %353 = OpVariable Private 
                              Private f32_3* %368 = OpVariable Private 
                                         i32 %369 = OpConstant 5 
                                             %373 = OpTypePointer Function %21 
                                         i32 %381 = OpConstant 9 
                                             %382 = OpTypePointer Uniform %21 
                                             %385 = OpTypeBool 
                                Private f32* %400 = OpVariable Private 
                                Private f32* %404 = OpVariable Private 
                                             %406 = OpTypePointer Uniform %6 
                                         f32 %411 = OpConstant 3.674022E-40 
                                             %415 = OpTypePointer Private %385 
                               Private bool* %416 = OpVariable Private 
                                         f32 %417 = OpConstant 3.674022E-40 
                                         u32 %419 = OpConstant 3 
                               Private bool* %423 = OpVariable Private 
                                         f32 %433 = OpConstant 3.674022E-40 
                                         f32 %442 = OpConstant 3.674022E-40 
                                Private f32* %444 = OpVariable Private 
                              Private f32_3* %448 = OpVariable Private 
                                       f32_3 %470 = OpConstantComposite %411 %411 %411 
                                             %477 = OpTypePointer Output %7 
                               Output f32_4* %478 = OpVariable Output 
                                             %489 = OpTypeVector %6 2 
                                             %490 = OpTypePointer Output %489 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_3* %492 = OpVariable Input 
                                         i32 %495 = OpConstant 10 
                                         i32 %529 = OpConstant 8 
                                             %547 = OpTypeArray %6 %346 
                                             %548 = OpTypeStruct %7 %6 %547 
                                             %549 = OpTypePointer Output %548 
        Output struct {f32_4; f32; f32[1];}* %550 = OpVariable Output 
                                             %559 = OpTypePointer Output %6 
                                             %566 = OpTypePointer Private %21 
                                Private i32* %567 = OpVariable Private 
                               Private bool* %568 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function i32* %374 = OpVariable Function 
                               Uniform f32_4* %30 = OpAccessChain %25 %26 %27 
                                        f32_4 %31 = OpLoad %30 
                                        f32_3 %32 = OpVectorShuffle %31 %31 1 1 1 
                               Uniform f32_4* %35 = OpAccessChain %25 %33 %34 
                                        f32_4 %36 = OpLoad %35 
                                        f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
                                        f32_3 %38 = OpFMul %32 %37 
                                        f32_4 %39 = OpLoad %9 
                                        f32_4 %40 = OpVectorShuffle %39 %38 4 5 6 3 
                                                      OpStore %9 %40 
                               Uniform f32_4* %41 = OpAccessChain %25 %33 %27 
                                        f32_4 %42 = OpLoad %41 
                                        f32_3 %43 = OpVectorShuffle %42 %42 0 1 2 
                               Uniform f32_4* %44 = OpAccessChain %25 %26 %27 
                                        f32_4 %45 = OpLoad %44 
                                        f32_3 %46 = OpVectorShuffle %45 %45 0 0 0 
                                        f32_3 %47 = OpFMul %43 %46 
                                        f32_4 %48 = OpLoad %9 
                                        f32_3 %49 = OpVectorShuffle %48 %48 0 1 2 
                                        f32_3 %50 = OpFAdd %47 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_4 %52 = OpVectorShuffle %51 %50 4 5 6 3 
                                                      OpStore %9 %52 
                               Uniform f32_4* %54 = OpAccessChain %25 %33 %53 
                                        f32_4 %55 = OpLoad %54 
                                        f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                               Uniform f32_4* %57 = OpAccessChain %25 %26 %27 
                                        f32_4 %58 = OpLoad %57 
                                        f32_3 %59 = OpVectorShuffle %58 %58 2 2 2 
                                        f32_3 %60 = OpFMul %56 %59 
                                        f32_4 %61 = OpLoad %9 
                                        f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                        f32_3 %63 = OpFAdd %60 %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %63 4 5 6 3 
                                                      OpStore %9 %65 
                               Uniform f32_4* %66 = OpAccessChain %25 %33 %26 
                                        f32_4 %67 = OpLoad %66 
                                        f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
                               Uniform f32_4* %69 = OpAccessChain %25 %26 %27 
                                        f32_4 %70 = OpLoad %69 
                                        f32_3 %71 = OpVectorShuffle %70 %70 3 3 3 
                                        f32_3 %72 = OpFMul %68 %71 
                                        f32_4 %73 = OpLoad %9 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
                                        f32_3 %75 = OpFAdd %72 %74 
                                        f32_4 %76 = OpLoad %9 
                                        f32_4 %77 = OpVectorShuffle %76 %75 4 5 6 3 
                                                      OpStore %9 %77 
                               Uniform f32_4* %79 = OpAccessChain %25 %26 %34 
                                        f32_4 %80 = OpLoad %79 
                                        f32_3 %81 = OpVectorShuffle %80 %80 1 1 1 
                               Uniform f32_4* %82 = OpAccessChain %25 %33 %34 
                                        f32_4 %83 = OpLoad %82 
                                        f32_3 %84 = OpVectorShuffle %83 %83 0 1 2 
                                        f32_3 %85 = OpFMul %81 %84 
                                        f32_4 %86 = OpLoad %78 
                                        f32_4 %87 = OpVectorShuffle %86 %85 4 5 6 3 
                                                      OpStore %78 %87 
                               Uniform f32_4* %88 = OpAccessChain %25 %33 %27 
                                        f32_4 %89 = OpLoad %88 
                                        f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                               Uniform f32_4* %91 = OpAccessChain %25 %26 %34 
                                        f32_4 %92 = OpLoad %91 
                                        f32_3 %93 = OpVectorShuffle %92 %92 0 0 0 
                                        f32_3 %94 = OpFMul %90 %93 
                                        f32_4 %95 = OpLoad %78 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                        f32_3 %97 = OpFAdd %94 %96 
                                        f32_4 %98 = OpLoad %78 
                                        f32_4 %99 = OpVectorShuffle %98 %97 4 5 6 3 
                                                      OpStore %78 %99 
                              Uniform f32_4* %100 = OpAccessChain %25 %33 %53 
                                       f32_4 %101 = OpLoad %100 
                                       f32_3 %102 = OpVectorShuffle %101 %101 0 1 2 
                              Uniform f32_4* %103 = OpAccessChain %25 %26 %34 
                                       f32_4 %104 = OpLoad %103 
                                       f32_3 %105 = OpVectorShuffle %104 %104 2 2 2 
                                       f32_3 %106 = OpFMul %102 %105 
                                       f32_4 %107 = OpLoad %78 
                                       f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                       f32_3 %109 = OpFAdd %106 %108 
                                       f32_4 %110 = OpLoad %78 
                                       f32_4 %111 = OpVectorShuffle %110 %109 4 5 6 3 
                                                      OpStore %78 %111 
                              Uniform f32_4* %112 = OpAccessChain %25 %33 %26 
                                       f32_4 %113 = OpLoad %112 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                              Uniform f32_4* %115 = OpAccessChain %25 %26 %34 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 3 3 3 
                                       f32_3 %118 = OpFMul %114 %117 
                                       f32_4 %119 = OpLoad %78 
                                       f32_3 %120 = OpVectorShuffle %119 %119 0 1 2 
                                       f32_3 %121 = OpFAdd %118 %120 
                                       f32_4 %122 = OpLoad %78 
                                       f32_4 %123 = OpVectorShuffle %122 %121 4 5 6 3 
                                                      OpStore %78 %123 
                              Uniform f32_4* %126 = OpAccessChain %25 %26 %53 
                                       f32_4 %127 = OpLoad %126 
                                       f32_3 %128 = OpVectorShuffle %127 %127 1 1 1 
                              Uniform f32_4* %129 = OpAccessChain %25 %33 %34 
                                       f32_4 %130 = OpLoad %129 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_3 %132 = OpFMul %128 %131 
                                                      OpStore %125 %132 
                              Uniform f32_4* %133 = OpAccessChain %25 %33 %27 
                                       f32_4 %134 = OpLoad %133 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                              Uniform f32_4* %136 = OpAccessChain %25 %26 %53 
                                       f32_4 %137 = OpLoad %136 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 0 0 
                                       f32_3 %139 = OpFMul %135 %138 
                                       f32_3 %140 = OpLoad %125 
                                       f32_3 %141 = OpFAdd %139 %140 
                                                      OpStore %125 %141 
                              Uniform f32_4* %142 = OpAccessChain %25 %33 %53 
                                       f32_4 %143 = OpLoad %142 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                              Uniform f32_4* %145 = OpAccessChain %25 %26 %53 
                                       f32_4 %146 = OpLoad %145 
                                       f32_3 %147 = OpVectorShuffle %146 %146 2 2 2 
                                       f32_3 %148 = OpFMul %144 %147 
                                       f32_3 %149 = OpLoad %125 
                                       f32_3 %150 = OpFAdd %148 %149 
                                                      OpStore %125 %150 
                              Uniform f32_4* %151 = OpAccessChain %25 %33 %26 
                                       f32_4 %152 = OpLoad %151 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                              Uniform f32_4* %154 = OpAccessChain %25 %26 %53 
                                       f32_4 %155 = OpLoad %154 
                                       f32_3 %156 = OpVectorShuffle %155 %155 3 3 3 
                                       f32_3 %157 = OpFMul %153 %156 
                                       f32_3 %158 = OpLoad %125 
                                       f32_3 %159 = OpFAdd %157 %158 
                                                      OpStore %125 %159 
                              Uniform f32_4* %161 = OpAccessChain %25 %26 %26 
                                       f32_4 %162 = OpLoad %161 
                                       f32_3 %163 = OpVectorShuffle %162 %162 1 1 1 
                              Uniform f32_4* %164 = OpAccessChain %25 %33 %34 
                                       f32_4 %165 = OpLoad %164 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                       f32_3 %167 = OpFMul %163 %166 
                                                      OpStore %160 %167 
                              Uniform f32_4* %168 = OpAccessChain %25 %33 %27 
                                       f32_4 %169 = OpLoad %168 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
                              Uniform f32_4* %171 = OpAccessChain %25 %26 %26 
                                       f32_4 %172 = OpLoad %171 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 0 0 
                                       f32_3 %174 = OpFMul %170 %173 
                                       f32_3 %175 = OpLoad %160 
                                       f32_3 %176 = OpFAdd %174 %175 
                                                      OpStore %160 %176 
                              Uniform f32_4* %177 = OpAccessChain %25 %33 %53 
                                       f32_4 %178 = OpLoad %177 
                                       f32_3 %179 = OpVectorShuffle %178 %178 0 1 2 
                              Uniform f32_4* %180 = OpAccessChain %25 %26 %26 
                                       f32_4 %181 = OpLoad %180 
                                       f32_3 %182 = OpVectorShuffle %181 %181 2 2 2 
                                       f32_3 %183 = OpFMul %179 %182 
                                       f32_3 %184 = OpLoad %160 
                                       f32_3 %185 = OpFAdd %183 %184 
                                                      OpStore %160 %185 
                              Uniform f32_4* %186 = OpAccessChain %25 %33 %26 
                                       f32_4 %187 = OpLoad %186 
                                       f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
                              Uniform f32_4* %189 = OpAccessChain %25 %26 %26 
                                       f32_4 %190 = OpLoad %189 
                                       f32_3 %191 = OpVectorShuffle %190 %190 3 3 3 
                                       f32_3 %192 = OpFMul %188 %191 
                                       f32_3 %193 = OpLoad %160 
                                       f32_3 %194 = OpFAdd %192 %193 
                                                      OpStore %160 %194 
                              Uniform f32_4* %197 = OpAccessChain %25 %196 %34 
                                       f32_4 %198 = OpLoad %197 
                                       f32_3 %199 = OpVectorShuffle %198 %198 0 1 2 
                              Uniform f32_4* %201 = OpAccessChain %25 %200 %27 
                                       f32_4 %202 = OpLoad %201 
                                       f32_3 %203 = OpVectorShuffle %202 %202 1 1 1 
                                       f32_3 %204 = OpFMul %199 %203 
                                                      OpStore %195 %204 
                              Uniform f32_4* %205 = OpAccessChain %25 %196 %27 
                                       f32_4 %206 = OpLoad %205 
                                       f32_3 %207 = OpVectorShuffle %206 %206 0 1 2 
                              Uniform f32_4* %208 = OpAccessChain %25 %200 %27 
                                       f32_4 %209 = OpLoad %208 
                                       f32_3 %210 = OpVectorShuffle %209 %209 0 0 0 
                                       f32_3 %211 = OpFMul %207 %210 
                                       f32_3 %212 = OpLoad %195 
                                       f32_3 %213 = OpFAdd %211 %212 
                                                      OpStore %195 %213 
                              Uniform f32_4* %214 = OpAccessChain %25 %196 %53 
                                       f32_4 %215 = OpLoad %214 
                                       f32_3 %216 = OpVectorShuffle %215 %215 0 1 2 
                              Uniform f32_4* %217 = OpAccessChain %25 %200 %27 
                                       f32_4 %218 = OpLoad %217 
                                       f32_3 %219 = OpVectorShuffle %218 %218 2 2 2 
                                       f32_3 %220 = OpFMul %216 %219 
                                       f32_3 %221 = OpLoad %195 
                                       f32_3 %222 = OpFAdd %220 %221 
                                                      OpStore %195 %222 
                              Uniform f32_4* %223 = OpAccessChain %25 %196 %26 
                                       f32_4 %224 = OpLoad %223 
                                       f32_3 %225 = OpVectorShuffle %224 %224 0 1 2 
                              Uniform f32_4* %226 = OpAccessChain %25 %200 %27 
                                       f32_4 %227 = OpLoad %226 
                                       f32_3 %228 = OpVectorShuffle %227 %227 3 3 3 
                                       f32_3 %229 = OpFMul %225 %228 
                                       f32_3 %230 = OpLoad %195 
                                       f32_3 %231 = OpFAdd %229 %230 
                                                      OpStore %195 %231 
                              Uniform f32_4* %233 = OpAccessChain %25 %196 %34 
                                       f32_4 %234 = OpLoad %233 
                                       f32_3 %235 = OpVectorShuffle %234 %234 0 1 2 
                              Uniform f32_4* %236 = OpAccessChain %25 %200 %34 
                                       f32_4 %237 = OpLoad %236 
                                       f32_3 %238 = OpVectorShuffle %237 %237 1 1 1 
                                       f32_3 %239 = OpFMul %235 %238 
                                                      OpStore %232 %239 
                              Uniform f32_4* %240 = OpAccessChain %25 %196 %27 
                                       f32_4 %241 = OpLoad %240 
                                       f32_3 %242 = OpVectorShuffle %241 %241 0 1 2 
                              Uniform f32_4* %243 = OpAccessChain %25 %200 %34 
                                       f32_4 %244 = OpLoad %243 
                                       f32_3 %245 = OpVectorShuffle %244 %244 0 0 0 
                                       f32_3 %246 = OpFMul %242 %245 
                                       f32_3 %247 = OpLoad %232 
                                       f32_3 %248 = OpFAdd %246 %247 
                                                      OpStore %232 %248 
                              Uniform f32_4* %249 = OpAccessChain %25 %196 %53 
                                       f32_4 %250 = OpLoad %249 
                                       f32_3 %251 = OpVectorShuffle %250 %250 0 1 2 
                              Uniform f32_4* %252 = OpAccessChain %25 %200 %34 
                                       f32_4 %253 = OpLoad %252 
                                       f32_3 %254 = OpVectorShuffle %253 %253 2 2 2 
                                       f32_3 %255 = OpFMul %251 %254 
                                       f32_3 %256 = OpLoad %232 
                                       f32_3 %257 = OpFAdd %255 %256 
                                                      OpStore %232 %257 
                              Uniform f32_4* %258 = OpAccessChain %25 %196 %26 
                                       f32_4 %259 = OpLoad %258 
                                       f32_3 %260 = OpVectorShuffle %259 %259 0 1 2 
                              Uniform f32_4* %261 = OpAccessChain %25 %200 %34 
                                       f32_4 %262 = OpLoad %261 
                                       f32_3 %263 = OpVectorShuffle %262 %262 3 3 3 
                                       f32_3 %264 = OpFMul %260 %263 
                                       f32_3 %265 = OpLoad %232 
                                       f32_3 %266 = OpFAdd %264 %265 
                                                      OpStore %232 %266 
                              Uniform f32_4* %268 = OpAccessChain %25 %196 %34 
                                       f32_4 %269 = OpLoad %268 
                                       f32_3 %270 = OpVectorShuffle %269 %269 0 1 2 
                              Uniform f32_4* %271 = OpAccessChain %25 %200 %53 
                                       f32_4 %272 = OpLoad %271 
                                       f32_3 %273 = OpVectorShuffle %272 %272 1 1 1 
                                       f32_3 %274 = OpFMul %270 %273 
                                                      OpStore %267 %274 
                              Uniform f32_4* %275 = OpAccessChain %25 %196 %27 
                                       f32_4 %276 = OpLoad %275 
                                       f32_3 %277 = OpVectorShuffle %276 %276 0 1 2 
                              Uniform f32_4* %278 = OpAccessChain %25 %200 %53 
                                       f32_4 %279 = OpLoad %278 
                                       f32_3 %280 = OpVectorShuffle %279 %279 0 0 0 
                                       f32_3 %281 = OpFMul %277 %280 
                                       f32_3 %282 = OpLoad %267 
                                       f32_3 %283 = OpFAdd %281 %282 
                                                      OpStore %267 %283 
                              Uniform f32_4* %284 = OpAccessChain %25 %196 %53 
                                       f32_4 %285 = OpLoad %284 
                                       f32_3 %286 = OpVectorShuffle %285 %285 0 1 2 
                              Uniform f32_4* %287 = OpAccessChain %25 %200 %53 
                                       f32_4 %288 = OpLoad %287 
                                       f32_3 %289 = OpVectorShuffle %288 %288 2 2 2 
                                       f32_3 %290 = OpFMul %286 %289 
                                       f32_3 %291 = OpLoad %267 
                                       f32_3 %292 = OpFAdd %290 %291 
                                                      OpStore %267 %292 
                              Uniform f32_4* %293 = OpAccessChain %25 %196 %26 
                                       f32_4 %294 = OpLoad %293 
                                       f32_3 %295 = OpVectorShuffle %294 %294 0 1 2 
                              Uniform f32_4* %296 = OpAccessChain %25 %200 %53 
                                       f32_4 %297 = OpLoad %296 
                                       f32_3 %298 = OpVectorShuffle %297 %297 3 3 3 
                                       f32_3 %299 = OpFMul %295 %298 
                                       f32_3 %300 = OpLoad %267 
                                       f32_3 %301 = OpFAdd %299 %300 
                                                      OpStore %267 %301 
                                       f32_4 %302 = OpLoad %78 
                                       f32_3 %303 = OpVectorShuffle %302 %302 0 1 2 
                                       f32_3 %306 = OpLoad %305 
                                       f32_3 %307 = OpVectorShuffle %306 %306 1 1 1 
                                       f32_3 %308 = OpFMul %303 %307 
                                       f32_4 %309 = OpLoad %78 
                                       f32_4 %310 = OpVectorShuffle %309 %308 4 5 6 3 
                                                      OpStore %78 %310 
                                       f32_4 %311 = OpLoad %9 
                                       f32_3 %312 = OpVectorShuffle %311 %311 0 1 2 
                                       f32_3 %313 = OpLoad %305 
                                       f32_3 %314 = OpVectorShuffle %313 %313 0 0 0 
                                       f32_3 %315 = OpFMul %312 %314 
                                       f32_4 %316 = OpLoad %78 
                                       f32_3 %317 = OpVectorShuffle %316 %316 0 1 2 
                                       f32_3 %318 = OpFAdd %315 %317 
                                       f32_4 %319 = OpLoad %9 
                                       f32_4 %320 = OpVectorShuffle %319 %318 4 5 6 3 
                                                      OpStore %9 %320 
                                       f32_3 %321 = OpLoad %125 
                                       f32_3 %322 = OpLoad %305 
                                       f32_3 %323 = OpVectorShuffle %322 %322 2 2 2 
                                       f32_3 %324 = OpFMul %321 %323 
                                       f32_4 %325 = OpLoad %9 
                                       f32_3 %326 = OpVectorShuffle %325 %325 0 1 2 
                                       f32_3 %327 = OpFAdd %324 %326 
                                       f32_4 %328 = OpLoad %9 
                                       f32_4 %329 = OpVectorShuffle %328 %327 4 5 6 3 
                                                      OpStore %9 %329 
                                       f32_3 %330 = OpLoad %160 
                                       f32_4 %331 = OpLoad %9 
                                       f32_3 %332 = OpVectorShuffle %331 %331 0 1 2 
                                       f32_3 %333 = OpFAdd %330 %332 
                                       f32_4 %334 = OpLoad %9 
                                       f32_4 %335 = OpVectorShuffle %334 %333 4 5 6 3 
                                                      OpStore %9 %335 
                                       f32_3 %336 = OpLoad %195 
                                       f32_3 %338 = OpLoad %337 
                                         f32 %339 = OpDot %336 %338 
                                Private f32* %342 = OpAccessChain %78 %340 
                                                      OpStore %342 %339 
                                       f32_3 %343 = OpLoad %232 
                                       f32_3 %344 = OpLoad %337 
                                         f32 %345 = OpDot %343 %344 
                                Private f32* %347 = OpAccessChain %78 %346 
                                                      OpStore %347 %345 
                                       f32_3 %348 = OpLoad %267 
                                       f32_3 %349 = OpLoad %337 
                                         f32 %350 = OpDot %348 %349 
                                Private f32* %352 = OpAccessChain %78 %351 
                                                      OpStore %352 %350 
                                       f32_4 %354 = OpLoad %78 
                                       f32_3 %355 = OpVectorShuffle %354 %354 0 1 2 
                                       f32_4 %356 = OpLoad %78 
                                       f32_3 %357 = OpVectorShuffle %356 %356 0 1 2 
                                         f32 %358 = OpDot %355 %357 
                                                      OpStore %353 %358 
                                         f32 %359 = OpLoad %353 
                                         f32 %360 = OpExtInst %1 32 %359 
                                                      OpStore %353 %360 
                                         f32 %361 = OpLoad %353 
                                       f32_3 %362 = OpCompositeConstruct %361 %361 %361 
                                       f32_4 %363 = OpLoad %78 
                                       f32_3 %364 = OpVectorShuffle %363 %363 0 1 2 
                                       f32_3 %365 = OpFMul %362 %364 
                                       f32_4 %366 = OpLoad %78 
                                       f32_4 %367 = OpVectorShuffle %366 %365 4 5 6 3 
                                                      OpStore %78 %367 
                              Uniform f32_4* %370 = OpAccessChain %25 %369 
                                       f32_4 %371 = OpLoad %370 
                                       f32_3 %372 = OpVectorShuffle %371 %371 0 1 2 
                                                      OpStore %368 %372 
                                                      OpStore %374 %27 
                                                      OpBranch %375 
                                             %375 = OpLabel 
                                                      OpLoopMerge %377 %378 None 
                                                      OpBranch %379 
                                             %379 = OpLabel 
                                         i32 %380 = OpLoad %374 
                                Uniform i32* %383 = OpAccessChain %25 %381 %340 
                                         i32 %384 = OpLoad %383 
                                        bool %386 = OpSLessThan %380 %384 
                                                      OpBranchConditional %386 %376 %377 
                                             %376 = OpLabel 
                                       f32_4 %387 = OpLoad %9 
                                       f32_3 %388 = OpVectorShuffle %387 %387 0 1 2 
                                       f32_3 %389 = OpFNegate %388 
                                         i32 %390 = OpLoad %374 
                              Uniform f32_4* %391 = OpAccessChain %25 %34 %390 
                                       f32_4 %392 = OpLoad %391 
                                       f32_3 %393 = OpVectorShuffle %392 %392 3 3 3 
                                       f32_3 %394 = OpFMul %389 %393 
                                         i32 %395 = OpLoad %374 
                              Uniform f32_4* %396 = OpAccessChain %25 %34 %395 
                                       f32_4 %397 = OpLoad %396 
                                       f32_3 %398 = OpVectorShuffle %397 %397 0 1 2 
                                       f32_3 %399 = OpFAdd %394 %398 
                                                      OpStore %125 %399 
                                       f32_3 %401 = OpLoad %125 
                                       f32_3 %402 = OpLoad %125 
                                         f32 %403 = OpDot %401 %402 
                                                      OpStore %400 %403 
                                         i32 %405 = OpLoad %374 
                                Uniform f32* %407 = OpAccessChain %25 %53 %405 %351 
                                         f32 %408 = OpLoad %407 
                                         f32 %409 = OpLoad %400 
                                         f32 %410 = OpFMul %408 %409 
                                         f32 %412 = OpFAdd %410 %411 
                                                      OpStore %404 %412 
                                         f32 %413 = OpLoad %404 
                                         f32 %414 = OpFDiv %411 %413 
                                                      OpStore %404 %414 
                                         i32 %418 = OpLoad %374 
                                Uniform f32* %420 = OpAccessChain %25 %34 %418 %419 
                                         f32 %421 = OpLoad %420 
                                        bool %422 = OpFOrdNotEqual %417 %421 
                                                      OpStore %416 %422 
                                         i32 %424 = OpLoad %374 
                                Uniform f32* %425 = OpAccessChain %25 %53 %424 %419 
                                         f32 %426 = OpLoad %425 
                                         f32 %427 = OpLoad %400 
                                        bool %428 = OpFOrdLessThan %426 %427 
                                                      OpStore %423 %428 
                                        bool %429 = OpLoad %423 
                                        bool %430 = OpLoad %416 
                                        bool %431 = OpLogicalAnd %429 %430 
                                                      OpStore %416 %431 
                                         f32 %432 = OpLoad %400 
                                         f32 %434 = OpExtInst %1 40 %432 %433 
                                                      OpStore %400 %434 
                                         f32 %435 = OpLoad %400 
                                         f32 %436 = OpExtInst %1 32 %435 
                                                      OpStore %400 %436 
                                         f32 %437 = OpLoad %400 
                                       f32_3 %438 = OpCompositeConstruct %437 %437 %437 
                                       f32_3 %439 = OpLoad %125 
                                       f32_3 %440 = OpFMul %438 %439 
                                                      OpStore %125 %440 
                                         f32 %441 = OpLoad %404 
                                         f32 %443 = OpFMul %441 %442 
                                                      OpStore %400 %443 
                                        bool %445 = OpLoad %416 
                                         f32 %446 = OpLoad %400 
                                         f32 %447 = OpSelect %445 %417 %446 
                                                      OpStore %444 %447 
                                       f32_4 %449 = OpLoad %78 
                                       f32_3 %450 = OpVectorShuffle %449 %449 0 1 2 
                                       f32_3 %451 = OpLoad %125 
                                         f32 %452 = OpDot %450 %451 
                                Private f32* %453 = OpAccessChain %448 %340 
                                                      OpStore %453 %452 
                                Private f32* %454 = OpAccessChain %448 %340 
                                         f32 %455 = OpLoad %454 
                                         f32 %456 = OpExtInst %1 40 %455 %417 
                                Private f32* %457 = OpAccessChain %448 %340 
                                                      OpStore %457 %456 
                                       f32_3 %458 = OpLoad %448 
                                       f32_3 %459 = OpVectorShuffle %458 %458 0 0 0 
                                         i32 %460 = OpLoad %374 
                              Uniform f32_4* %461 = OpAccessChain %25 %27 %460 
                                       f32_4 %462 = OpLoad %461 
                                       f32_3 %463 = OpVectorShuffle %462 %462 0 1 2 
                                       f32_3 %464 = OpFMul %459 %463 
                                                      OpStore %448 %464 
                                         f32 %465 = OpLoad %444 
                                       f32_3 %466 = OpCompositeConstruct %465 %465 %465 
                                       f32_3 %467 = OpLoad %448 
                                       f32_3 %468 = OpFMul %466 %467 
                                                      OpStore %448 %468 
                                       f32_3 %469 = OpLoad %448 
                                       f32_3 %471 = OpExtInst %1 37 %469 %470 
                                                      OpStore %448 %471 
                                       f32_3 %472 = OpLoad %368 
                                       f32_3 %473 = OpLoad %448 
                                       f32_3 %474 = OpFAdd %472 %473 
                                                      OpStore %368 %474 
                                                      OpBranch %378 
                                             %378 = OpLabel 
                                         i32 %475 = OpLoad %374 
                                         i32 %476 = OpIAdd %475 %34 
                                                      OpStore %374 %476 
                                                      OpBranch %375 
                                             %377 = OpLabel 
                                       f32_3 %479 = OpLoad %368 
                                       f32_4 %480 = OpLoad %478 
                                       f32_4 %481 = OpVectorShuffle %480 %479 4 5 6 3 
                                                      OpStore %478 %481 
                                       f32_4 %482 = OpLoad %478 
                                       f32_3 %483 = OpVectorShuffle %482 %482 0 1 2 
                                       f32_3 %484 = OpCompositeConstruct %417 %417 %417 
                                       f32_3 %485 = OpCompositeConstruct %411 %411 %411 
                                       f32_3 %486 = OpExtInst %1 43 %483 %484 %485 
                                       f32_4 %487 = OpLoad %478 
                                       f32_4 %488 = OpVectorShuffle %487 %486 4 5 6 3 
                                                      OpStore %478 %488 
                                       f32_3 %493 = OpLoad %492 
                                       f32_2 %494 = OpVectorShuffle %493 %493 0 1 
                              Uniform f32_4* %496 = OpAccessChain %25 %495 
                                       f32_4 %497 = OpLoad %496 
                                       f32_2 %498 = OpVectorShuffle %497 %497 0 1 
                                       f32_2 %499 = OpFMul %494 %498 
                              Uniform f32_4* %500 = OpAccessChain %25 %495 
                                       f32_4 %501 = OpLoad %500 
                                       f32_2 %502 = OpVectorShuffle %501 %501 2 3 
                                       f32_2 %503 = OpFAdd %499 %502 
                                                      OpStore vs_TEXCOORD0 %503 
                                       f32_3 %504 = OpLoad %305 
                                       f32_4 %505 = OpVectorShuffle %504 %504 1 1 1 1 
                              Uniform f32_4* %506 = OpAccessChain %25 %26 %34 
                                       f32_4 %507 = OpLoad %506 
                                       f32_4 %508 = OpFMul %505 %507 
                                                      OpStore %9 %508 
                              Uniform f32_4* %509 = OpAccessChain %25 %26 %27 
                                       f32_4 %510 = OpLoad %509 
                                       f32_3 %511 = OpLoad %305 
                                       f32_4 %512 = OpVectorShuffle %511 %511 0 0 0 0 
                                       f32_4 %513 = OpFMul %510 %512 
                                       f32_4 %514 = OpLoad %9 
                                       f32_4 %515 = OpFAdd %513 %514 
                                                      OpStore %9 %515 
                              Uniform f32_4* %516 = OpAccessChain %25 %26 %53 
                                       f32_4 %517 = OpLoad %516 
                                       f32_3 %518 = OpLoad %305 
                                       f32_4 %519 = OpVectorShuffle %518 %518 2 2 2 2 
                                       f32_4 %520 = OpFMul %517 %519 
                                       f32_4 %521 = OpLoad %9 
                                       f32_4 %522 = OpFAdd %520 %521 
                                                      OpStore %9 %522 
                                       f32_4 %523 = OpLoad %9 
                              Uniform f32_4* %524 = OpAccessChain %25 %26 %26 
                                       f32_4 %525 = OpLoad %524 
                                       f32_4 %526 = OpFAdd %523 %525 
                                                      OpStore %9 %526 
                                       f32_4 %527 = OpLoad %9 
                                       f32_4 %528 = OpVectorShuffle %527 %527 1 1 1 1 
                              Uniform f32_4* %530 = OpAccessChain %25 %529 %34 
                                       f32_4 %531 = OpLoad %530 
                                       f32_4 %532 = OpFMul %528 %531 
                                                      OpStore %78 %532 
                              Uniform f32_4* %533 = OpAccessChain %25 %529 %27 
                                       f32_4 %534 = OpLoad %533 
                                       f32_4 %535 = OpLoad %9 
                                       f32_4 %536 = OpVectorShuffle %535 %535 0 0 0 0 
                                       f32_4 %537 = OpFMul %534 %536 
                                       f32_4 %538 = OpLoad %78 
                                       f32_4 %539 = OpFAdd %537 %538 
                                                      OpStore %78 %539 
                              Uniform f32_4* %540 = OpAccessChain %25 %529 %53 
                                       f32_4 %541 = OpLoad %540 
                                       f32_4 %542 = OpLoad %9 
                                       f32_4 %543 = OpVectorShuffle %542 %542 2 2 2 2 
                                       f32_4 %544 = OpFMul %541 %543 
                                       f32_4 %545 = OpLoad %78 
                                       f32_4 %546 = OpFAdd %544 %545 
                                                      OpStore %78 %546 
                              Uniform f32_4* %551 = OpAccessChain %25 %529 %26 
                                       f32_4 %552 = OpLoad %551 
                                       f32_4 %553 = OpLoad %9 
                                       f32_4 %554 = OpVectorShuffle %553 %553 3 3 3 3 
                                       f32_4 %555 = OpFMul %552 %554 
                                       f32_4 %556 = OpLoad %78 
                                       f32_4 %557 = OpFAdd %555 %556 
                               Output f32_4* %558 = OpAccessChain %550 %27 
                                                      OpStore %558 %557 
                                 Output f32* %560 = OpAccessChain %478 %419 
                                                      OpStore %560 %411 
                                 Output f32* %561 = OpAccessChain %550 %27 %346 
                                         f32 %562 = OpLoad %561 
                                         f32 %563 = OpFNegate %562 
                                 Output f32* %564 = OpAccessChain %550 %27 %346 
                                                      OpStore %564 %563 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 47
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %30 %35 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %9 RelaxedPrecision 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %13 RelaxedPrecision 
                                             OpDecorate %16 RelaxedPrecision 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %17 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %26 RelaxedPrecision 
                                             OpDecorate %27 RelaxedPrecision 
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %30 RelaxedPrecision 
                                             OpDecorate %30 Location 30 
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate %33 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %35 Location 35 
                                             OpDecorate %36 RelaxedPrecision 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %24 = OpTypeVector %6 4 
                      Private f32_3* %27 = OpVariable Private 
                                     %29 = OpTypePointer Input %24 
                        Input f32_4* %30 = OpVariable Input 
                                     %34 = OpTypePointer Output %24 
                       Output f32_4* %35 = OpVariable Output 
                                 f32 %41 = OpConstant 3.674022E-40 
                                     %42 = OpTypeInt 32 0 
                                 u32 %43 = OpConstant 3 
                                     %44 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
                                             OpStore %9 %26 
                               f32_3 %28 = OpLoad %9 
                               f32_4 %31 = OpLoad %30 
                               f32_3 %32 = OpVectorShuffle %31 %31 0 1 2 
                               f32_3 %33 = OpFMul %28 %32 
                                             OpStore %27 %33 
                               f32_3 %36 = OpLoad %27 
                               f32_3 %37 = OpLoad %27 
                               f32_3 %38 = OpFAdd %36 %37 
                               f32_4 %39 = OpLoad %35 
                               f32_4 %40 = OpVectorShuffle %39 %38 4 5 6 3 
                                             OpStore %35 %40 
                         Output f32* %45 = OpAccessChain %35 %43 
                                             OpStore %45 %41 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "POINT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 569
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %305 %337 %478 %491 %492 %550 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpMemberDecorate %23 0 RelaxedPrecision 
                                                      OpMemberDecorate %23 0 Offset 23 
                                                      OpMemberDecorate %23 1 Offset 23 
                                                      OpMemberDecorate %23 2 RelaxedPrecision 
                                                      OpMemberDecorate %23 2 Offset 23 
                                                      OpMemberDecorate %23 3 Offset 23 
                                                      OpMemberDecorate %23 4 Offset 23 
                                                      OpMemberDecorate %23 5 RelaxedPrecision 
                                                      OpMemberDecorate %23 5 Offset 23 
                                                      OpMemberDecorate %23 6 Offset 23 
                                                      OpMemberDecorate %23 7 Offset 23 
                                                      OpMemberDecorate %23 8 Offset 23 
                                                      OpMemberDecorate %23 9 Offset 23 
                                                      OpMemberDecorate %23 10 Offset 23 
                                                      OpDecorate %23 Block 
                                                      OpDecorate %25 DescriptorSet 25 
                                                      OpDecorate %25 Binding 25 
                                                      OpDecorate %305 Location 305 
                                                      OpDecorate %337 Location 337 
                                                      OpDecorate %368 RelaxedPrecision 
                                                      OpDecorate %371 RelaxedPrecision 
                                                      OpDecorate %372 RelaxedPrecision 
                                                      OpDecorate %408 RelaxedPrecision 
                                                      OpDecorate %426 RelaxedPrecision 
                                                      OpDecorate %444 RelaxedPrecision 
                                                      OpDecorate %448 RelaxedPrecision 
                                                      OpDecorate %455 RelaxedPrecision 
                                                      OpDecorate %456 RelaxedPrecision 
                                                      OpDecorate %458 RelaxedPrecision 
                                                      OpDecorate %459 RelaxedPrecision 
                                                      OpDecorate %462 RelaxedPrecision 
                                                      OpDecorate %463 RelaxedPrecision 
                                                      OpDecorate %464 RelaxedPrecision 
                                                      OpDecorate %465 RelaxedPrecision 
                                                      OpDecorate %466 RelaxedPrecision 
                                                      OpDecorate %467 RelaxedPrecision 
                                                      OpDecorate %468 RelaxedPrecision 
                                                      OpDecorate %469 RelaxedPrecision 
                                                      OpDecorate %471 RelaxedPrecision 
                                                      OpDecorate %472 RelaxedPrecision 
                                                      OpDecorate %473 RelaxedPrecision 
                                                      OpDecorate %474 RelaxedPrecision 
                                                      OpDecorate %478 RelaxedPrecision 
                                                      OpDecorate %478 Location 478 
                                                      OpDecorate %479 RelaxedPrecision 
                                                      OpDecorate %482 RelaxedPrecision 
                                                      OpDecorate %483 RelaxedPrecision 
                                                      OpDecorate %484 RelaxedPrecision 
                                                      OpDecorate %485 RelaxedPrecision 
                                                      OpDecorate %486 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 491 
                                                      OpDecorate %492 Location 492 
                                                      OpMemberDecorate %548 0 BuiltIn 548 
                                                      OpMemberDecorate %548 1 BuiltIn 548 
                                                      OpMemberDecorate %548 2 BuiltIn 548 
                                                      OpDecorate %548 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 8 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                              %14 = OpTypeArray %7 %11 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeArray %7 %15 
                                              %20 = OpTypeArray %7 %15 
                                              %21 = OpTypeInt 32 1 
                                              %22 = OpTypeVector %21 4 
                                              %23 = OpTypeStruct %12 %13 %14 %16 %17 %7 %18 %19 %20 %22 %7 
                                              %24 = OpTypePointer Uniform %23 
Uniform struct {f32_4[8]; f32_4[8]; f32_4[8]; f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; i32_4; f32_4;}* %25 = OpVariable Uniform 
                                          i32 %26 = OpConstant 3 
                                          i32 %27 = OpConstant 0 
                                              %28 = OpTypeVector %6 3 
                                              %29 = OpTypePointer Uniform %7 
                                          i32 %33 = OpConstant 6 
                                          i32 %34 = OpConstant 1 
                                          i32 %53 = OpConstant 2 
                               Private f32_4* %78 = OpVariable Private 
                                             %124 = OpTypePointer Private %28 
                              Private f32_3* %125 = OpVariable Private 
                              Private f32_3* %160 = OpVariable Private 
                              Private f32_3* %195 = OpVariable Private 
                                         i32 %196 = OpConstant 4 
                                         i32 %200 = OpConstant 7 
                              Private f32_3* %232 = OpVariable Private 
                              Private f32_3* %267 = OpVariable Private 
                                             %304 = OpTypePointer Input %28 
                                Input f32_3* %305 = OpVariable Input 
                                Input f32_3* %337 = OpVariable Input 
                                         u32 %340 = OpConstant 0 
                                             %341 = OpTypePointer Private %6 
                                         u32 %346 = OpConstant 1 
                                         u32 %351 = OpConstant 2 
                                Private f32* %353 = OpVariable Private 
                              Private f32_3* %368 = OpVariable Private 
                                         i32 %369 = OpConstant 5 
                                             %373 = OpTypePointer Function %21 
                                         i32 %381 = OpConstant 9 
                                             %382 = OpTypePointer Uniform %21 
                                             %385 = OpTypeBool 
                                Private f32* %400 = OpVariable Private 
                                Private f32* %404 = OpVariable Private 
                                             %406 = OpTypePointer Uniform %6 
                                         f32 %411 = OpConstant 3.674022E-40 
                                             %415 = OpTypePointer Private %385 
                               Private bool* %416 = OpVariable Private 
                                         f32 %417 = OpConstant 3.674022E-40 
                                         u32 %419 = OpConstant 3 
                               Private bool* %423 = OpVariable Private 
                                         f32 %433 = OpConstant 3.674022E-40 
                                         f32 %442 = OpConstant 3.674022E-40 
                                Private f32* %444 = OpVariable Private 
                              Private f32_3* %448 = OpVariable Private 
                                       f32_3 %470 = OpConstantComposite %411 %411 %411 
                                             %477 = OpTypePointer Output %7 
                               Output f32_4* %478 = OpVariable Output 
                                             %489 = OpTypeVector %6 2 
                                             %490 = OpTypePointer Output %489 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_3* %492 = OpVariable Input 
                                         i32 %495 = OpConstant 10 
                                         i32 %529 = OpConstant 8 
                                             %547 = OpTypeArray %6 %346 
                                             %548 = OpTypeStruct %7 %6 %547 
                                             %549 = OpTypePointer Output %548 
        Output struct {f32_4; f32; f32[1];}* %550 = OpVariable Output 
                                             %559 = OpTypePointer Output %6 
                                             %566 = OpTypePointer Private %21 
                                Private i32* %567 = OpVariable Private 
                               Private bool* %568 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function i32* %374 = OpVariable Function 
                               Uniform f32_4* %30 = OpAccessChain %25 %26 %27 
                                        f32_4 %31 = OpLoad %30 
                                        f32_3 %32 = OpVectorShuffle %31 %31 1 1 1 
                               Uniform f32_4* %35 = OpAccessChain %25 %33 %34 
                                        f32_4 %36 = OpLoad %35 
                                        f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
                                        f32_3 %38 = OpFMul %32 %37 
                                        f32_4 %39 = OpLoad %9 
                                        f32_4 %40 = OpVectorShuffle %39 %38 4 5 6 3 
                                                      OpStore %9 %40 
                               Uniform f32_4* %41 = OpAccessChain %25 %33 %27 
                                        f32_4 %42 = OpLoad %41 
                                        f32_3 %43 = OpVectorShuffle %42 %42 0 1 2 
                               Uniform f32_4* %44 = OpAccessChain %25 %26 %27 
                                        f32_4 %45 = OpLoad %44 
                                        f32_3 %46 = OpVectorShuffle %45 %45 0 0 0 
                                        f32_3 %47 = OpFMul %43 %46 
                                        f32_4 %48 = OpLoad %9 
                                        f32_3 %49 = OpVectorShuffle %48 %48 0 1 2 
                                        f32_3 %50 = OpFAdd %47 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_4 %52 = OpVectorShuffle %51 %50 4 5 6 3 
                                                      OpStore %9 %52 
                               Uniform f32_4* %54 = OpAccessChain %25 %33 %53 
                                        f32_4 %55 = OpLoad %54 
                                        f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                               Uniform f32_4* %57 = OpAccessChain %25 %26 %27 
                                        f32_4 %58 = OpLoad %57 
                                        f32_3 %59 = OpVectorShuffle %58 %58 2 2 2 
                                        f32_3 %60 = OpFMul %56 %59 
                                        f32_4 %61 = OpLoad %9 
                                        f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                        f32_3 %63 = OpFAdd %60 %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %63 4 5 6 3 
                                                      OpStore %9 %65 
                               Uniform f32_4* %66 = OpAccessChain %25 %33 %26 
                                        f32_4 %67 = OpLoad %66 
                                        f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
                               Uniform f32_4* %69 = OpAccessChain %25 %26 %27 
                                        f32_4 %70 = OpLoad %69 
                                        f32_3 %71 = OpVectorShuffle %70 %70 3 3 3 
                                        f32_3 %72 = OpFMul %68 %71 
                                        f32_4 %73 = OpLoad %9 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
                                        f32_3 %75 = OpFAdd %72 %74 
                                        f32_4 %76 = OpLoad %9 
                                        f32_4 %77 = OpVectorShuffle %76 %75 4 5 6 3 
                                                      OpStore %9 %77 
                               Uniform f32_4* %79 = OpAccessChain %25 %26 %34 
                                        f32_4 %80 = OpLoad %79 
                                        f32_3 %81 = OpVectorShuffle %80 %80 1 1 1 
                               Uniform f32_4* %82 = OpAccessChain %25 %33 %34 
                                        f32_4 %83 = OpLoad %82 
                                        f32_3 %84 = OpVectorShuffle %83 %83 0 1 2 
                                        f32_3 %85 = OpFMul %81 %84 
                                        f32_4 %86 = OpLoad %78 
                                        f32_4 %87 = OpVectorShuffle %86 %85 4 5 6 3 
                                                      OpStore %78 %87 
                               Uniform f32_4* %88 = OpAccessChain %25 %33 %27 
                                        f32_4 %89 = OpLoad %88 
                                        f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                               Uniform f32_4* %91 = OpAccessChain %25 %26 %34 
                                        f32_4 %92 = OpLoad %91 
                                        f32_3 %93 = OpVectorShuffle %92 %92 0 0 0 
                                        f32_3 %94 = OpFMul %90 %93 
                                        f32_4 %95 = OpLoad %78 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                        f32_3 %97 = OpFAdd %94 %96 
                                        f32_4 %98 = OpLoad %78 
                                        f32_4 %99 = OpVectorShuffle %98 %97 4 5 6 3 
                                                      OpStore %78 %99 
                              Uniform f32_4* %100 = OpAccessChain %25 %33 %53 
                                       f32_4 %101 = OpLoad %100 
                                       f32_3 %102 = OpVectorShuffle %101 %101 0 1 2 
                              Uniform f32_4* %103 = OpAccessChain %25 %26 %34 
                                       f32_4 %104 = OpLoad %103 
                                       f32_3 %105 = OpVectorShuffle %104 %104 2 2 2 
                                       f32_3 %106 = OpFMul %102 %105 
                                       f32_4 %107 = OpLoad %78 
                                       f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                       f32_3 %109 = OpFAdd %106 %108 
                                       f32_4 %110 = OpLoad %78 
                                       f32_4 %111 = OpVectorShuffle %110 %109 4 5 6 3 
                                                      OpStore %78 %111 
                              Uniform f32_4* %112 = OpAccessChain %25 %33 %26 
                                       f32_4 %113 = OpLoad %112 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                              Uniform f32_4* %115 = OpAccessChain %25 %26 %34 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 3 3 3 
                                       f32_3 %118 = OpFMul %114 %117 
                                       f32_4 %119 = OpLoad %78 
                                       f32_3 %120 = OpVectorShuffle %119 %119 0 1 2 
                                       f32_3 %121 = OpFAdd %118 %120 
                                       f32_4 %122 = OpLoad %78 
                                       f32_4 %123 = OpVectorShuffle %122 %121 4 5 6 3 
                                                      OpStore %78 %123 
                              Uniform f32_4* %126 = OpAccessChain %25 %26 %53 
                                       f32_4 %127 = OpLoad %126 
                                       f32_3 %128 = OpVectorShuffle %127 %127 1 1 1 
                              Uniform f32_4* %129 = OpAccessChain %25 %33 %34 
                                       f32_4 %130 = OpLoad %129 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 1 2 
                                       f32_3 %132 = OpFMul %128 %131 
                                                      OpStore %125 %132 
                              Uniform f32_4* %133 = OpAccessChain %25 %33 %27 
                                       f32_4 %134 = OpLoad %133 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                              Uniform f32_4* %136 = OpAccessChain %25 %26 %53 
                                       f32_4 %137 = OpLoad %136 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 0 0 
                                       f32_3 %139 = OpFMul %135 %138 
                                       f32_3 %140 = OpLoad %125 
                                       f32_3 %141 = OpFAdd %139 %140 
                                                      OpStore %125 %141 
                              Uniform f32_4* %142 = OpAccessChain %25 %33 %53 
                                       f32_4 %143 = OpLoad %142 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                              Uniform f32_4* %145 = OpAccessChain %25 %26 %53 
                                       f32_4 %146 = OpLoad %145 
                                       f32_3 %147 = OpVectorShuffle %146 %146 2 2 2 
                                       f32_3 %148 = OpFMul %144 %147 
                                       f32_3 %149 = OpLoad %125 
                                       f32_3 %150 = OpFAdd %148 %149 
                                                      OpStore %125 %150 
                              Uniform f32_4* %151 = OpAccessChain %25 %33 %26 
                                       f32_4 %152 = OpLoad %151 
                                       f32_3 %153 = OpVectorShuffle %152 %152 0 1 2 
                              Uniform f32_4* %154 = OpAccessChain %25 %26 %53 
                                       f32_4 %155 = OpLoad %154 
                                       f32_3 %156 = OpVectorShuffle %155 %155 3 3 3 
                                       f32_3 %157 = OpFMul %153 %156 
                                       f32_3 %158 = OpLoad %125 
                                       f32_3 %159 = OpFAdd %157 %158 
                                                      OpStore %125 %159 
                              Uniform f32_4* %161 = OpAccessChain %25 %26 %26 
                                       f32_4 %162 = OpLoad %161 
                                       f32_3 %163 = OpVectorShuffle %162 %162 1 1 1 
                              Uniform f32_4* %164 = OpAccessChain %25 %33 %34 
                                       f32_4 %165 = OpLoad %164 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                       f32_3 %167 = OpFMul %163 %166 
                                                      OpStore %160 %167 
                              Uniform f32_4* %168 = OpAccessChain %25 %33 %27 
                                       f32_4 %169 = OpLoad %168 
                                       f32_3 %170 = OpVectorShuffle %169 %169 0 1 2 
                              Uniform f32_4* %171 = OpAccessChain %25 %26 %26 
                                       f32_4 %172 = OpLoad %171 
                                       f32_3 %173 = OpVectorShuffle %172 %172 0 0 0 
                                       f32_3 %174 = OpFMul %170 %173 
                                       f32_3 %175 = OpLoad %160 
                                       f32_3 %176 = OpFAdd %174 %175 
                                                      OpStore %160 %176 
                              Uniform f32_4* %177 = OpAccessChain %25 %33 %53 
                                       f32_4 %178 = OpLoad %177 
                                       f32_3 %179 = OpVectorShuffle %178 %178 0 1 2 
                              Uniform f32_4* %180 = OpAccessChain %25 %26 %26 
                                       f32_4 %181 = OpLoad %180 
                                       f32_3 %182 = OpVectorShuffle %181 %181 2 2 2 
                                       f32_3 %183 = OpFMul %179 %182 
                                       f32_3 %184 = OpLoad %160 
                                       f32_3 %185 = OpFAdd %183 %184 
                                                      OpStore %160 %185 
                              Uniform f32_4* %186 = OpAccessChain %25 %33 %26 
                                       f32_4 %187 = OpLoad %186 
                                       f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
                              Uniform f32_4* %189 = OpAccessChain %25 %26 %26 
                                       f32_4 %190 = OpLoad %189 
                                       f32_3 %191 = OpVectorShuffle %190 %190 3 3 3 
                                       f32_3 %192 = OpFMul %188 %191 
                                       f32_3 %193 = OpLoad %160 
                                       f32_3 %194 = OpFAdd %192 %193 
                                                      OpStore %160 %194 
                              Uniform f32_4* %197 = OpAccessChain %25 %196 %34 
                                       f32_4 %198 = OpLoad %197 
                                       f32_3 %199 = OpVectorShuffle %198 %198 0 1 2 
                              Uniform f32_4* %201 = OpAccessChain %25 %200 %27 
                                       f32_4 %202 = OpLoad %201 
                                       f32_3 %203 = OpVectorShuffle %202 %202 1 1 1 
                                       f32_3 %204 = OpFMul %199 %203 
                                                      OpStore %195 %204 
                              Uniform f32_4* %205 = OpAccessChain %25 %196 %27 
                                       f32_4 %206 = OpLoad %205 
                                       f32_3 %207 = OpVectorShuffle %206 %206 0 1 2 
                              Uniform f32_4* %208 = OpAccessChain %25 %200 %27 
                                       f32_4 %209 = OpLoad %208 
                                       f32_3 %210 = OpVectorShuffle %209 %209 0 0 0 
                                       f32_3 %211 = OpFMul %207 %210 
                                       f32_3 %212 = OpLoad %195 
                                       f32_3 %213 = OpFAdd %211 %212 
                                                      OpStore %195 %213 
                              Uniform f32_4* %214 = OpAccessChain %25 %196 %53 
                                       f32_4 %215 = OpLoad %214 
                                       f32_3 %216 = OpVectorShuffle %215 %215 0 1 2 
                              Uniform f32_4* %217 = OpAccessChain %25 %200 %27 
                                       f32_4 %218 = OpLoad %217 
                                       f32_3 %219 = OpVectorShuffle %218 %218 2 2 2 
                                       f32_3 %220 = OpFMul %216 %219 
                                       f32_3 %221 = OpLoad %195 
                                       f32_3 %222 = OpFAdd %220 %221 
                                                      OpStore %195 %222 
                              Uniform f32_4* %223 = OpAccessChain %25 %196 %26 
                                       f32_4 %224 = OpLoad %223 
                                       f32_3 %225 = OpVectorShuffle %224 %224 0 1 2 
                              Uniform f32_4* %226 = OpAccessChain %25 %200 %27 
                                       f32_4 %227 = OpLoad %226 
                                       f32_3 %228 = OpVectorShuffle %227 %227 3 3 3 
                                       f32_3 %229 = OpFMul %225 %228 
                                       f32_3 %230 = OpLoad %195 
                                       f32_3 %231 = OpFAdd %229 %230 
                                                      OpStore %195 %231 
                              Uniform f32_4* %233 = OpAccessChain %25 %196 %34 
                                       f32_4 %234 = OpLoad %233 
                                       f32_3 %235 = OpVectorShuffle %234 %234 0 1 2 
                              Uniform f32_4* %236 = OpAccessChain %25 %200 %34 
                                       f32_4 %237 = OpLoad %236 
                                       f32_3 %238 = OpVectorShuffle %237 %237 1 1 1 
                                       f32_3 %239 = OpFMul %235 %238 
                                                      OpStore %232 %239 
                              Uniform f32_4* %240 = OpAccessChain %25 %196 %27 
                                       f32_4 %241 = OpLoad %240 
                                       f32_3 %242 = OpVectorShuffle %241 %241 0 1 2 
                              Uniform f32_4* %243 = OpAccessChain %25 %200 %34 
                                       f32_4 %244 = OpLoad %243 
                                       f32_3 %245 = OpVectorShuffle %244 %244 0 0 0 
                                       f32_3 %246 = OpFMul %242 %245 
                                       f32_3 %247 = OpLoad %232 
                                       f32_3 %248 = OpFAdd %246 %247 
                                                      OpStore %232 %248 
                              Uniform f32_4* %249 = OpAccessChain %25 %196 %53 
                                       f32_4 %250 = OpLoad %249 
                                       f32_3 %251 = OpVectorShuffle %250 %250 0 1 2 
                              Uniform f32_4* %252 = OpAccessChain %25 %200 %34 
                                       f32_4 %253 = OpLoad %252 
                                       f32_3 %254 = OpVectorShuffle %253 %253 2 2 2 
                                       f32_3 %255 = OpFMul %251 %254 
                                       f32_3 %256 = OpLoad %232 
                                       f32_3 %257 = OpFAdd %255 %256 
                                                      OpStore %232 %257 
                              Uniform f32_4* %258 = OpAccessChain %25 %196 %26 
                                       f32_4 %259 = OpLoad %258 
                                       f32_3 %260 = OpVectorShuffle %259 %259 0 1 2 
                              Uniform f32_4* %261 = OpAccessChain %25 %200 %34 
                                       f32_4 %262 = OpLoad %261 
                                       f32_3 %263 = OpVectorShuffle %262 %262 3 3 3 
                                       f32_3 %264 = OpFMul %260 %263 
                                       f32_3 %265 = OpLoad %232 
                                       f32_3 %266 = OpFAdd %264 %265 
                                                      OpStore %232 %266 
                              Uniform f32_4* %268 = OpAccessChain %25 %196 %34 
                                       f32_4 %269 = OpLoad %268 
                                       f32_3 %270 = OpVectorShuffle %269 %269 0 1 2 
                              Uniform f32_4* %271 = OpAccessChain %25 %200 %53 
                                       f32_4 %272 = OpLoad %271 
                                       f32_3 %273 = OpVectorShuffle %272 %272 1 1 1 
                                       f32_3 %274 = OpFMul %270 %273 
                                                      OpStore %267 %274 
                              Uniform f32_4* %275 = OpAccessChain %25 %196 %27 
                                       f32_4 %276 = OpLoad %275 
                                       f32_3 %277 = OpVectorShuffle %276 %276 0 1 2 
                              Uniform f32_4* %278 = OpAccessChain %25 %200 %53 
                                       f32_4 %279 = OpLoad %278 
                                       f32_3 %280 = OpVectorShuffle %279 %279 0 0 0 
                                       f32_3 %281 = OpFMul %277 %280 
                                       f32_3 %282 = OpLoad %267 
                                       f32_3 %283 = OpFAdd %281 %282 
                                                      OpStore %267 %283 
                              Uniform f32_4* %284 = OpAccessChain %25 %196 %53 
                                       f32_4 %285 = OpLoad %284 
                                       f32_3 %286 = OpVectorShuffle %285 %285 0 1 2 
                              Uniform f32_4* %287 = OpAccessChain %25 %200 %53 
                                       f32_4 %288 = OpLoad %287 
                                       f32_3 %289 = OpVectorShuffle %288 %288 2 2 2 
                                       f32_3 %290 = OpFMul %286 %289 
                                       f32_3 %291 = OpLoad %267 
                                       f32_3 %292 = OpFAdd %290 %291 
                                                      OpStore %267 %292 
                              Uniform f32_4* %293 = OpAccessChain %25 %196 %26 
                                       f32_4 %294 = OpLoad %293 
                                       f32_3 %295 = OpVectorShuffle %294 %294 0 1 2 
                              Uniform f32_4* %296 = OpAccessChain %25 %200 %53 
                                       f32_4 %297 = OpLoad %296 
                                       f32_3 %298 = OpVectorShuffle %297 %297 3 3 3 
                                       f32_3 %299 = OpFMul %295 %298 
                                       f32_3 %300 = OpLoad %267 
                                       f32_3 %301 = OpFAdd %299 %300 
                                                      OpStore %267 %301 
                                       f32_4 %302 = OpLoad %78 
                                       f32_3 %303 = OpVectorShuffle %302 %302 0 1 2 
                                       f32_3 %306 = OpLoad %305 
                                       f32_3 %307 = OpVectorShuffle %306 %306 1 1 1 
                                       f32_3 %308 = OpFMul %303 %307 
                                       f32_4 %309 = OpLoad %78 
                                       f32_4 %310 = OpVectorShuffle %309 %308 4 5 6 3 
                                                      OpStore %78 %310 
                                       f32_4 %311 = OpLoad %9 
                                       f32_3 %312 = OpVectorShuffle %311 %311 0 1 2 
                                       f32_3 %313 = OpLoad %305 
                                       f32_3 %314 = OpVectorShuffle %313 %313 0 0 0 
                                       f32_3 %315 = OpFMul %312 %314 
                                       f32_4 %316 = OpLoad %78 
                                       f32_3 %317 = OpVectorShuffle %316 %316 0 1 2 
                                       f32_3 %318 = OpFAdd %315 %317 
                                       f32_4 %319 = OpLoad %9 
                                       f32_4 %320 = OpVectorShuffle %319 %318 4 5 6 3 
                                                      OpStore %9 %320 
                                       f32_3 %321 = OpLoad %125 
                                       f32_3 %322 = OpLoad %305 
                                       f32_3 %323 = OpVectorShuffle %322 %322 2 2 2 
                                       f32_3 %324 = OpFMul %321 %323 
                                       f32_4 %325 = OpLoad %9 
                                       f32_3 %326 = OpVectorShuffle %325 %325 0 1 2 
                                       f32_3 %327 = OpFAdd %324 %326 
                                       f32_4 %328 = OpLoad %9 
                                       f32_4 %329 = OpVectorShuffle %328 %327 4 5 6 3 
                                                      OpStore %9 %329 
                                       f32_3 %330 = OpLoad %160 
                                       f32_4 %331 = OpLoad %9 
                                       f32_3 %332 = OpVectorShuffle %331 %331 0 1 2 
                                       f32_3 %333 = OpFAdd %330 %332 
                                       f32_4 %334 = OpLoad %9 
                                       f32_4 %335 = OpVectorShuffle %334 %333 4 5 6 3 
                                                      OpStore %9 %335 
                                       f32_3 %336 = OpLoad %195 
                                       f32_3 %338 = OpLoad %337 
                                         f32 %339 = OpDot %336 %338 
                                Private f32* %342 = OpAccessChain %78 %340 
                                                      OpStore %342 %339 
                                       f32_3 %343 = OpLoad %232 
                                       f32_3 %344 = OpLoad %337 
                                         f32 %345 = OpDot %343 %344 
                                Private f32* %347 = OpAccessChain %78 %346 
                                                      OpStore %347 %345 
                                       f32_3 %348 = OpLoad %267 
                                       f32_3 %349 = OpLoad %337 
                                         f32 %350 = OpDot %348 %349 
                                Private f32* %352 = OpAccessChain %78 %351 
                                                      OpStore %352 %350 
                                       f32_4 %354 = OpLoad %78 
                                       f32_3 %355 = OpVectorShuffle %354 %354 0 1 2 
                                       f32_4 %356 = OpLoad %78 
                                       f32_3 %357 = OpVectorShuffle %356 %356 0 1 2 
                                         f32 %358 = OpDot %355 %357 
                                                      OpStore %353 %358 
                                         f32 %359 = OpLoad %353 
                                         f32 %360 = OpExtInst %1 32 %359 
                                                      OpStore %353 %360 
                                         f32 %361 = OpLoad %353 
                                       f32_3 %362 = OpCompositeConstruct %361 %361 %361 
                                       f32_4 %363 = OpLoad %78 
                                       f32_3 %364 = OpVectorShuffle %363 %363 0 1 2 
                                       f32_3 %365 = OpFMul %362 %364 
                                       f32_4 %366 = OpLoad %78 
                                       f32_4 %367 = OpVectorShuffle %366 %365 4 5 6 3 
                                                      OpStore %78 %367 
                              Uniform f32_4* %370 = OpAccessChain %25 %369 
                                       f32_4 %371 = OpLoad %370 
                                       f32_3 %372 = OpVectorShuffle %371 %371 0 1 2 
                                                      OpStore %368 %372 
                                                      OpStore %374 %27 
                                                      OpBranch %375 
                                             %375 = OpLabel 
                                                      OpLoopMerge %377 %378 None 
                                                      OpBranch %379 
                                             %379 = OpLabel 
                                         i32 %380 = OpLoad %374 
                                Uniform i32* %383 = OpAccessChain %25 %381 %340 
                                         i32 %384 = OpLoad %383 
                                        bool %386 = OpSLessThan %380 %384 
                                                      OpBranchConditional %386 %376 %377 
                                             %376 = OpLabel 
                                       f32_4 %387 = OpLoad %9 
                                       f32_3 %388 = OpVectorShuffle %387 %387 0 1 2 
                                       f32_3 %389 = OpFNegate %388 
                                         i32 %390 = OpLoad %374 
                              Uniform f32_4* %391 = OpAccessChain %25 %34 %390 
                                       f32_4 %392 = OpLoad %391 
                                       f32_3 %393 = OpVectorShuffle %392 %392 3 3 3 
                                       f32_3 %394 = OpFMul %389 %393 
                                         i32 %395 = OpLoad %374 
                              Uniform f32_4* %396 = OpAccessChain %25 %34 %395 
                                       f32_4 %397 = OpLoad %396 
                                       f32_3 %398 = OpVectorShuffle %397 %397 0 1 2 
                                       f32_3 %399 = OpFAdd %394 %398 
                                                      OpStore %125 %399 
                                       f32_3 %401 = OpLoad %125 
                                       f32_3 %402 = OpLoad %125 
                                         f32 %403 = OpDot %401 %402 
                                                      OpStore %400 %403 
                                         i32 %405 = OpLoad %374 
                                Uniform f32* %407 = OpAccessChain %25 %53 %405 %351 
                                         f32 %408 = OpLoad %407 
                                         f32 %409 = OpLoad %400 
                                         f32 %410 = OpFMul %408 %409 
                                         f32 %412 = OpFAdd %410 %411 
                                                      OpStore %404 %412 
                                         f32 %413 = OpLoad %404 
                                         f32 %414 = OpFDiv %411 %413 
                                                      OpStore %404 %414 
                                         i32 %418 = OpLoad %374 
                                Uniform f32* %420 = OpAccessChain %25 %34 %418 %419 
                                         f32 %421 = OpLoad %420 
                                        bool %422 = OpFOrdNotEqual %417 %421 
                                                      OpStore %416 %422 
                                         i32 %424 = OpLoad %374 
                                Uniform f32* %425 = OpAccessChain %25 %53 %424 %419 
                                         f32 %426 = OpLoad %425 
                                         f32 %427 = OpLoad %400 
                                        bool %428 = OpFOrdLessThan %426 %427 
                                                      OpStore %423 %428 
                                        bool %429 = OpLoad %423 
                                        bool %430 = OpLoad %416 
                                        bool %431 = OpLogicalAnd %429 %430 
                                                      OpStore %416 %431 
                                         f32 %432 = OpLoad %400 
                                         f32 %434 = OpExtInst %1 40 %432 %433 
                                                      OpStore %400 %434 
                                         f32 %435 = OpLoad %400 
                                         f32 %436 = OpExtInst %1 32 %435 
                                                      OpStore %400 %436 
                                         f32 %437 = OpLoad %400 
                                       f32_3 %438 = OpCompositeConstruct %437 %437 %437 
                                       f32_3 %439 = OpLoad %125 
                                       f32_3 %440 = OpFMul %438 %439 
                                                      OpStore %125 %440 
                                         f32 %441 = OpLoad %404 
                                         f32 %443 = OpFMul %441 %442 
                                                      OpStore %400 %443 
                                        bool %445 = OpLoad %416 
                                         f32 %446 = OpLoad %400 
                                         f32 %447 = OpSelect %445 %417 %446 
                                                      OpStore %444 %447 
                                       f32_4 %449 = OpLoad %78 
                                       f32_3 %450 = OpVectorShuffle %449 %449 0 1 2 
                                       f32_3 %451 = OpLoad %125 
                                         f32 %452 = OpDot %450 %451 
                                Private f32* %453 = OpAccessChain %448 %340 
                                                      OpStore %453 %452 
                                Private f32* %454 = OpAccessChain %448 %340 
                                         f32 %455 = OpLoad %454 
                                         f32 %456 = OpExtInst %1 40 %455 %417 
                                Private f32* %457 = OpAccessChain %448 %340 
                                                      OpStore %457 %456 
                                       f32_3 %458 = OpLoad %448 
                                       f32_3 %459 = OpVectorShuffle %458 %458 0 0 0 
                                         i32 %460 = OpLoad %374 
                              Uniform f32_4* %461 = OpAccessChain %25 %27 %460 
                                       f32_4 %462 = OpLoad %461 
                                       f32_3 %463 = OpVectorShuffle %462 %462 0 1 2 
                                       f32_3 %464 = OpFMul %459 %463 
                                                      OpStore %448 %464 
                                         f32 %465 = OpLoad %444 
                                       f32_3 %466 = OpCompositeConstruct %465 %465 %465 
                                       f32_3 %467 = OpLoad %448 
                                       f32_3 %468 = OpFMul %466 %467 
                                                      OpStore %448 %468 
                                       f32_3 %469 = OpLoad %448 
                                       f32_3 %471 = OpExtInst %1 37 %469 %470 
                                                      OpStore %448 %471 
                                       f32_3 %472 = OpLoad %368 
                                       f32_3 %473 = OpLoad %448 
                                       f32_3 %474 = OpFAdd %472 %473 
                                                      OpStore %368 %474 
                                                      OpBranch %378 
                                             %378 = OpLabel 
                                         i32 %475 = OpLoad %374 
                                         i32 %476 = OpIAdd %475 %34 
                                                      OpStore %374 %476 
                                                      OpBranch %375 
                                             %377 = OpLabel 
                                       f32_3 %479 = OpLoad %368 
                                       f32_4 %480 = OpLoad %478 
                                       f32_4 %481 = OpVectorShuffle %480 %479 4 5 6 3 
                                                      OpStore %478 %481 
                                       f32_4 %482 = OpLoad %478 
                                       f32_3 %483 = OpVectorShuffle %482 %482 0 1 2 
                                       f32_3 %484 = OpCompositeConstruct %417 %417 %417 
                                       f32_3 %485 = OpCompositeConstruct %411 %411 %411 
                                       f32_3 %486 = OpExtInst %1 43 %483 %484 %485 
                                       f32_4 %487 = OpLoad %478 
                                       f32_4 %488 = OpVectorShuffle %487 %486 4 5 6 3 
                                                      OpStore %478 %488 
                                       f32_3 %493 = OpLoad %492 
                                       f32_2 %494 = OpVectorShuffle %493 %493 0 1 
                              Uniform f32_4* %496 = OpAccessChain %25 %495 
                                       f32_4 %497 = OpLoad %496 
                                       f32_2 %498 = OpVectorShuffle %497 %497 0 1 
                                       f32_2 %499 = OpFMul %494 %498 
                              Uniform f32_4* %500 = OpAccessChain %25 %495 
                                       f32_4 %501 = OpLoad %500 
                                       f32_2 %502 = OpVectorShuffle %501 %501 2 3 
                                       f32_2 %503 = OpFAdd %499 %502 
                                                      OpStore vs_TEXCOORD0 %503 
                                       f32_3 %504 = OpLoad %305 
                                       f32_4 %505 = OpVectorShuffle %504 %504 1 1 1 1 
                              Uniform f32_4* %506 = OpAccessChain %25 %26 %34 
                                       f32_4 %507 = OpLoad %506 
                                       f32_4 %508 = OpFMul %505 %507 
                                                      OpStore %9 %508 
                              Uniform f32_4* %509 = OpAccessChain %25 %26 %27 
                                       f32_4 %510 = OpLoad %509 
                                       f32_3 %511 = OpLoad %305 
                                       f32_4 %512 = OpVectorShuffle %511 %511 0 0 0 0 
                                       f32_4 %513 = OpFMul %510 %512 
                                       f32_4 %514 = OpLoad %9 
                                       f32_4 %515 = OpFAdd %513 %514 
                                                      OpStore %9 %515 
                              Uniform f32_4* %516 = OpAccessChain %25 %26 %53 
                                       f32_4 %517 = OpLoad %516 
                                       f32_3 %518 = OpLoad %305 
                                       f32_4 %519 = OpVectorShuffle %518 %518 2 2 2 2 
                                       f32_4 %520 = OpFMul %517 %519 
                                       f32_4 %521 = OpLoad %9 
                                       f32_4 %522 = OpFAdd %520 %521 
                                                      OpStore %9 %522 
                                       f32_4 %523 = OpLoad %9 
                              Uniform f32_4* %524 = OpAccessChain %25 %26 %26 
                                       f32_4 %525 = OpLoad %524 
                                       f32_4 %526 = OpFAdd %523 %525 
                                                      OpStore %9 %526 
                                       f32_4 %527 = OpLoad %9 
                                       f32_4 %528 = OpVectorShuffle %527 %527 1 1 1 1 
                              Uniform f32_4* %530 = OpAccessChain %25 %529 %34 
                                       f32_4 %531 = OpLoad %530 
                                       f32_4 %532 = OpFMul %528 %531 
                                                      OpStore %78 %532 
                              Uniform f32_4* %533 = OpAccessChain %25 %529 %27 
                                       f32_4 %534 = OpLoad %533 
                                       f32_4 %535 = OpLoad %9 
                                       f32_4 %536 = OpVectorShuffle %535 %535 0 0 0 0 
                                       f32_4 %537 = OpFMul %534 %536 
                                       f32_4 %538 = OpLoad %78 
                                       f32_4 %539 = OpFAdd %537 %538 
                                                      OpStore %78 %539 
                              Uniform f32_4* %540 = OpAccessChain %25 %529 %53 
                                       f32_4 %541 = OpLoad %540 
                                       f32_4 %542 = OpLoad %9 
                                       f32_4 %543 = OpVectorShuffle %542 %542 2 2 2 2 
                                       f32_4 %544 = OpFMul %541 %543 
                                       f32_4 %545 = OpLoad %78 
                                       f32_4 %546 = OpFAdd %544 %545 
                                                      OpStore %78 %546 
                              Uniform f32_4* %551 = OpAccessChain %25 %529 %26 
                                       f32_4 %552 = OpLoad %551 
                                       f32_4 %553 = OpLoad %9 
                                       f32_4 %554 = OpVectorShuffle %553 %553 3 3 3 3 
                                       f32_4 %555 = OpFMul %552 %554 
                                       f32_4 %556 = OpLoad %78 
                                       f32_4 %557 = OpFAdd %555 %556 
                               Output f32_4* %558 = OpAccessChain %550 %27 
                                                      OpStore %558 %557 
                                 Output f32* %560 = OpAccessChain %478 %419 
                                                      OpStore %560 %411 
                                 Output f32* %561 = OpAccessChain %550 %27 %346 
                                         f32 %562 = OpLoad %561 
                                         f32 %563 = OpFNegate %562 
                                 Output f32* %564 = OpAccessChain %550 %27 %346 
                                                      OpStore %564 %563 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 47
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %30 %35 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %9 RelaxedPrecision 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %13 RelaxedPrecision 
                                             OpDecorate %16 RelaxedPrecision 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %17 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %26 RelaxedPrecision 
                                             OpDecorate %27 RelaxedPrecision 
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %30 RelaxedPrecision 
                                             OpDecorate %30 Location 30 
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate %33 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %35 Location 35 
                                             OpDecorate %36 RelaxedPrecision 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %24 = OpTypeVector %6 4 
                      Private f32_3* %27 = OpVariable Private 
                                     %29 = OpTypePointer Input %24 
                        Input f32_4* %30 = OpVariable Input 
                                     %34 = OpTypePointer Output %24 
                       Output f32_4* %35 = OpVariable Output 
                                 f32 %41 = OpConstant 3.674022E-40 
                                     %42 = OpTypeInt 32 0 
                                 u32 %43 = OpConstant 3 
                                     %44 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
                                             OpStore %9 %26 
                               f32_3 %28 = OpLoad %9 
                               f32_4 %31 = OpLoad %30 
                               f32_3 %32 = OpVectorShuffle %31 %31 0 1 2 
                               f32_3 %33 = OpFMul %28 %32 
                                             OpStore %27 %33 
                               f32_3 %36 = OpLoad %27 
                               f32_3 %37 = OpLoad %27 
                               f32_3 %38 = OpFAdd %36 %37 
                               f32_4 %39 = OpLoad %35 
                               f32_4 %40 = OpVectorShuffle %39 %38 4 5 6 3 
                                             OpStore %35 %40 
                         Output f32* %45 = OpAccessChain %35 %43 
                                             OpStore %45 %41 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
mediump vec3 u_xlat16_5;
float u_xlat6;
vec3 u_xlat7;
bool u_xlatb7;
mediump vec3 u_xlat16_9;
float u_xlat10;
bool u_xlatb10;
bool u_xlatb12;
float u_xlat13;
float u_xlat18;
int u_xlati18;
bool u_xlatb18;
bool u_xlatb19;
float u_xlat20;
bool u_xlatb20;
mediump float u_xlat16_21;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightAtten[1].w<u_xlat18);
#else
    u_xlatb19 = unity_LightAtten[1].w<u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb2 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlatb19 = u_xlatb19 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat18 + 1.0;
    u_xlat18 = max(u_xlat18, 9.99999997e-07);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = float(1.0) / u_xlat2.x;
    u_xlat16_3.x = (u_xlatb19) ? 0.0 : u_xlat18;
    u_xlat18 = dot(u_xlat1.xyz, unity_SpotDirection[1].xyz);
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat16_9.x = u_xlat18 + (-unity_LightAtten[1].x);
    u_xlat16_9.x = u_xlat16_9.x * unity_LightAtten[1].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_9.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * 0.5;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat4.xyz;
    u_xlat2.y = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat4.xyz;
    u_xlat2.z = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat16_9.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
    u_xlat16_9.xyz = u_xlat16_9.xxx * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_9.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightAtten[0].w<u_xlat18);
#else
    u_xlatb19 = unity_LightAtten[0].w<u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb20 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb19 = u_xlatb19 && u_xlatb20;
    u_xlat20 = unity_LightAtten[0].z * u_xlat18 + 1.0;
    u_xlat18 = max(u_xlat18, 9.99999997e-07);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = float(1.0) / u_xlat20;
    u_xlat16_21 = (u_xlatb19) ? 0.0 : u_xlat18;
    u_xlat18 = dot(u_xlat1.xyz, unity_SpotDirection[0].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[0].xyz;
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat16_23 = u_xlat18 + (-unity_LightAtten[0].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[0].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz + glstate_lightmodel_ambient.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb18 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb18)) ? u_xlat16_5.xyz : glstate_lightmodel_ambient.xyz;
    u_xlati18 = u_xlatb18 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlati18 = (u_xlatb1) ? 2 : u_xlati18;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[2].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[2].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[2].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[2].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[2].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[2].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[2].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[3].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[3].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[3].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[3].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[3].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[3].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[3].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 3 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[4].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[4].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[4].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[4].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[4].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[4].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[4].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 4 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[5].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[5].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[5].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[5].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[5].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[5].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[5].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 5 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[6].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[6].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[6].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[6].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[6].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[6].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[6].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 6 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat13 = max(u_xlat7.x, 9.99999997e-07);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat13);
    u_xlat13 = dot(u_xlat0.xyz, unity_SpotDirection[7].xyz);
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[7].xyz;
    u_xlat0.x = max(u_xlat13, 0.0);
    u_xlat16_21 = u_xlat0.x + (-unity_LightAtten[7].x);
    u_xlat16_21 = u_xlat16_21 * unity_LightAtten[7].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21 = min(max(u_xlat16_21, 0.0), 1.0);
#else
    u_xlat16_21 = clamp(u_xlat16_21, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightAtten[7].w<u_xlat7.x);
#else
    u_xlatb0 = unity_LightAtten[7].w<u_xlat7.x;
#endif
    u_xlat6 = unity_LightAtten[7].z * u_xlat7.x + 1.0;
    u_xlat6 = float(1.0) / u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb12 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb12;
    u_xlat16_23 = (u_xlatb0) ? 0.0 : u_xlat6;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb0 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb1;
    vs_COLOR0.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = 1.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
mediump vec3 u_xlat16_5;
float u_xlat6;
vec3 u_xlat7;
bool u_xlatb7;
mediump vec3 u_xlat16_9;
float u_xlat10;
bool u_xlatb10;
bool u_xlatb12;
float u_xlat13;
float u_xlat18;
int u_xlati18;
bool u_xlatb18;
bool u_xlatb19;
float u_xlat20;
bool u_xlatb20;
mediump float u_xlat16_21;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightAtten[1].w<u_xlat18);
#else
    u_xlatb19 = unity_LightAtten[1].w<u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb2 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlatb19 = u_xlatb19 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat18 + 1.0;
    u_xlat18 = max(u_xlat18, 9.99999997e-07);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = float(1.0) / u_xlat2.x;
    u_xlat16_3.x = (u_xlatb19) ? 0.0 : u_xlat18;
    u_xlat18 = dot(u_xlat1.xyz, unity_SpotDirection[1].xyz);
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat16_9.x = u_xlat18 + (-unity_LightAtten[1].x);
    u_xlat16_9.x = u_xlat16_9.x * unity_LightAtten[1].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_9.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * 0.5;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat4.xyz;
    u_xlat2.y = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat4.xyz;
    u_xlat2.z = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat16_9.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
    u_xlat16_9.xyz = u_xlat16_9.xxx * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_9.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightAtten[0].w<u_xlat18);
#else
    u_xlatb19 = unity_LightAtten[0].w<u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb20 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb19 = u_xlatb19 && u_xlatb20;
    u_xlat20 = unity_LightAtten[0].z * u_xlat18 + 1.0;
    u_xlat18 = max(u_xlat18, 9.99999997e-07);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = float(1.0) / u_xlat20;
    u_xlat16_21 = (u_xlatb19) ? 0.0 : u_xlat18;
    u_xlat18 = dot(u_xlat1.xyz, unity_SpotDirection[0].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[0].xyz;
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat16_23 = u_xlat18 + (-unity_LightAtten[0].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[0].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz + glstate_lightmodel_ambient.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb18 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb18)) ? u_xlat16_5.xyz : glstate_lightmodel_ambient.xyz;
    u_xlati18 = u_xlatb18 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlati18 = (u_xlatb1) ? 2 : u_xlati18;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[2].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[2].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[2].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[2].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[2].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[2].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[2].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[3].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[3].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[3].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[3].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[3].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[3].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[3].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 3 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[4].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[4].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[4].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[4].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[4].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[4].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[4].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 4 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[5].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[5].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[5].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[5].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[5].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[5].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[5].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 5 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[6].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[6].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[6].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[6].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[6].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[6].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[6].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 6 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat13 = max(u_xlat7.x, 9.99999997e-07);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat13);
    u_xlat13 = dot(u_xlat0.xyz, unity_SpotDirection[7].xyz);
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[7].xyz;
    u_xlat0.x = max(u_xlat13, 0.0);
    u_xlat16_21 = u_xlat0.x + (-unity_LightAtten[7].x);
    u_xlat16_21 = u_xlat16_21 * unity_LightAtten[7].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21 = min(max(u_xlat16_21, 0.0), 1.0);
#else
    u_xlat16_21 = clamp(u_xlat16_21, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightAtten[7].w<u_xlat7.x);
#else
    u_xlatb0 = unity_LightAtten[7].w<u_xlat7.x;
#endif
    u_xlat6 = unity_LightAtten[7].z * u_xlat7.x + 1.0;
    u_xlat6 = float(1.0) / u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb12 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb12;
    u_xlat16_23 = (u_xlatb0) ? 0.0 : u_xlat6;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb0 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb1;
    vs_COLOR0.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = 1.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
mediump vec3 u_xlat16_5;
float u_xlat6;
vec3 u_xlat7;
bool u_xlatb7;
mediump vec3 u_xlat16_9;
float u_xlat10;
bool u_xlatb10;
bool u_xlatb12;
float u_xlat13;
float u_xlat18;
int u_xlati18;
bool u_xlatb18;
bool u_xlatb19;
float u_xlat20;
bool u_xlatb20;
mediump float u_xlat16_21;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightAtten[1].w<u_xlat18);
#else
    u_xlatb19 = unity_LightAtten[1].w<u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb2 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlatb19 = u_xlatb19 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat18 + 1.0;
    u_xlat18 = max(u_xlat18, 9.99999997e-07);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = float(1.0) / u_xlat2.x;
    u_xlat16_3.x = (u_xlatb19) ? 0.0 : u_xlat18;
    u_xlat18 = dot(u_xlat1.xyz, unity_SpotDirection[1].xyz);
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat16_9.x = u_xlat18 + (-unity_LightAtten[1].x);
    u_xlat16_9.x = u_xlat16_9.x * unity_LightAtten[1].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.x = min(max(u_xlat16_9.x, 0.0), 1.0);
#else
    u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_9.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * 0.5;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat4.xyz;
    u_xlat2.y = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat4.xyz;
    u_xlat2.z = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat16_9.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
    u_xlat16_9.xyz = u_xlat16_9.xxx * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_9.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_LightAtten[0].w<u_xlat18);
#else
    u_xlatb19 = unity_LightAtten[0].w<u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb20 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb20 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb19 = u_xlatb19 && u_xlatb20;
    u_xlat20 = unity_LightAtten[0].z * u_xlat18 + 1.0;
    u_xlat18 = max(u_xlat18, 9.99999997e-07);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    u_xlat18 = float(1.0) / u_xlat20;
    u_xlat16_21 = (u_xlatb19) ? 0.0 : u_xlat18;
    u_xlat18 = dot(u_xlat1.xyz, unity_SpotDirection[0].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[0].xyz;
    u_xlat18 = max(u_xlat18, 0.0);
    u_xlat16_23 = u_xlat18 + (-unity_LightAtten[0].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[0].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_5.xyz + glstate_lightmodel_ambient.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb18 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb18)) ? u_xlat16_5.xyz : glstate_lightmodel_ambient.xyz;
    u_xlati18 = u_xlatb18 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlati18 = (u_xlatb1) ? 2 : u_xlati18;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[2].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[2].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[2].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[2].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[2].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[2].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[2].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[3].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[3].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[3].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[3].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[3].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[3].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[3].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 3 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[4].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[4].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[4].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[4].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[4].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[4].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[4].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 4 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[5].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[5].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[5].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[5].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[5].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[5].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[5].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 5 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.xyz = (-u_xlat0.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat20 = dot(u_xlat7.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[6].w<u_xlat20);
#else
    u_xlatb4 = unity_LightAtten[6].w<u_xlat20;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb10 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb10;
    u_xlat10 = unity_LightAtten[6].z * u_xlat20 + 1.0;
    u_xlat20 = max(u_xlat20, 9.99999997e-07);
    u_xlat20 = inversesqrt(u_xlat20);
    u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat20);
    u_xlat20 = float(1.0) / u_xlat10;
    u_xlat16_21 = (u_xlatb4) ? 0.0 : u_xlat20;
    u_xlat20 = dot(u_xlat7.xyz, unity_SpotDirection[6].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * unity_LightColor[6].xyz;
    u_xlat7.x = max(u_xlat20, 0.0);
    u_xlat16_23 = u_xlat7.x + (-unity_LightAtten[6].x);
    u_xlat16_23 = u_xlat16_23 * unity_LightAtten[6].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_23 = min(max(u_xlat16_23, 0.0), 1.0);
#else
    u_xlat16_23 = clamp(u_xlat16_23, 0.0, 1.0);
#endif
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati18 = (u_xlatb1) ? 6 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlati18<unity_VertexLightParams.x);
#else
    u_xlatb7 = u_xlati18<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb7 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat7.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat13 = max(u_xlat7.x, 9.99999997e-07);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat13);
    u_xlat13 = dot(u_xlat0.xyz, unity_SpotDirection[7].xyz);
    u_xlat16_21 = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_21 = max(u_xlat16_21, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_21) * unity_LightColor[7].xyz;
    u_xlat0.x = max(u_xlat13, 0.0);
    u_xlat16_21 = u_xlat0.x + (-unity_LightAtten[7].x);
    u_xlat16_21 = u_xlat16_21 * unity_LightAtten[7].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_21 = min(max(u_xlat16_21, 0.0), 1.0);
#else
    u_xlat16_21 = clamp(u_xlat16_21, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightAtten[7].w<u_xlat7.x);
#else
    u_xlatb0 = unity_LightAtten[7].w<u_xlat7.x;
#endif
    u_xlat6 = unity_LightAtten[7].z * u_xlat7.x + 1.0;
    u_xlat6 = float(1.0) / u_xlat6;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb12 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb12;
    u_xlat16_23 = (u_xlatb0) ? 0.0 : u_xlat6;
    u_xlat16_21 = u_xlat16_21 * u_xlat16_23;
    u_xlat16_21 = u_xlat16_21 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb0 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb1;
    vs_COLOR0.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = 1.0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz + u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "SPOT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 601
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %307 %339 %510 %523 %524 %582 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpDecorate %21 ArrayStride 21 
                                                      OpMemberDecorate %24 0 RelaxedPrecision 
                                                      OpMemberDecorate %24 0 Offset 24 
                                                      OpMemberDecorate %24 1 Offset 24 
                                                      OpMemberDecorate %24 2 RelaxedPrecision 
                                                      OpMemberDecorate %24 2 Offset 24 
                                                      OpMemberDecorate %24 3 Offset 24 
                                                      OpMemberDecorate %24 4 Offset 24 
                                                      OpMemberDecorate %24 5 Offset 24 
                                                      OpMemberDecorate %24 6 RelaxedPrecision 
                                                      OpMemberDecorate %24 6 Offset 24 
                                                      OpMemberDecorate %24 7 Offset 24 
                                                      OpMemberDecorate %24 8 Offset 24 
                                                      OpMemberDecorate %24 9 Offset 24 
                                                      OpMemberDecorate %24 10 Offset 24 
                                                      OpMemberDecorate %24 11 Offset 24 
                                                      OpDecorate %24 Block 
                                                      OpDecorate %26 DescriptorSet 26 
                                                      OpDecorate %26 Binding 26 
                                                      OpDecorate %307 Location 307 
                                                      OpDecorate %339 Location 339 
                                                      OpDecorate %370 RelaxedPrecision 
                                                      OpDecorate %373 RelaxedPrecision 
                                                      OpDecorate %374 RelaxedPrecision 
                                                      OpDecorate %410 RelaxedPrecision 
                                                      OpDecorate %428 RelaxedPrecision 
                                                      OpDecorate %434 RelaxedPrecision 
                                                      OpDecorate %455 RelaxedPrecision 
                                                      OpDecorate %459 RelaxedPrecision 
                                                      OpDecorate %460 RelaxedPrecision 
                                                      OpDecorate %464 RelaxedPrecision 
                                                      OpDecorate %467 RelaxedPrecision 
                                                      OpDecorate %468 RelaxedPrecision 
                                                      OpDecorate %471 RelaxedPrecision 
                                                      OpDecorate %472 RelaxedPrecision 
                                                      OpDecorate %474 RelaxedPrecision 
                                                      OpDecorate %476 RelaxedPrecision 
                                                      OpDecorate %477 RelaxedPrecision 
                                                      OpDecorate %478 RelaxedPrecision 
                                                      OpDecorate %480 RelaxedPrecision 
                                                      OpDecorate %487 RelaxedPrecision 
                                                      OpDecorate %488 RelaxedPrecision 
                                                      OpDecorate %490 RelaxedPrecision 
                                                      OpDecorate %491 RelaxedPrecision 
                                                      OpDecorate %494 RelaxedPrecision 
                                                      OpDecorate %495 RelaxedPrecision 
                                                      OpDecorate %496 RelaxedPrecision 
                                                      OpDecorate %497 RelaxedPrecision 
                                                      OpDecorate %498 RelaxedPrecision 
                                                      OpDecorate %499 RelaxedPrecision 
                                                      OpDecorate %500 RelaxedPrecision 
                                                      OpDecorate %501 RelaxedPrecision 
                                                      OpDecorate %503 RelaxedPrecision 
                                                      OpDecorate %504 RelaxedPrecision 
                                                      OpDecorate %505 RelaxedPrecision 
                                                      OpDecorate %506 RelaxedPrecision 
                                                      OpDecorate %510 RelaxedPrecision 
                                                      OpDecorate %510 Location 510 
                                                      OpDecorate %511 RelaxedPrecision 
                                                      OpDecorate %514 RelaxedPrecision 
                                                      OpDecorate %515 RelaxedPrecision 
                                                      OpDecorate %516 RelaxedPrecision 
                                                      OpDecorate %517 RelaxedPrecision 
                                                      OpDecorate %518 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 523 
                                                      OpDecorate %524 Location 524 
                                                      OpMemberDecorate %580 0 BuiltIn 580 
                                                      OpMemberDecorate %580 1 BuiltIn 580 
                                                      OpMemberDecorate %580 2 BuiltIn 580 
                                                      OpDecorate %580 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 8 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                              %14 = OpTypeArray %7 %11 
                                              %15 = OpTypeArray %7 %11 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeArray %7 %16 
                                              %20 = OpTypeArray %7 %16 
                                              %21 = OpTypeArray %7 %16 
                                              %22 = OpTypeInt 32 1 
                                              %23 = OpTypeVector %22 4 
                                              %24 = OpTypeStruct %12 %13 %14 %15 %17 %18 %7 %19 %20 %21 %23 %7 
                                              %25 = OpTypePointer Uniform %24 
Uniform struct {f32_4[8]; f32_4[8]; f32_4[8]; f32_4[8]; f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; i32_4; f32_4;}* %26 = OpVariable Uniform 
                                          i32 %27 = OpConstant 4 
                                          i32 %28 = OpConstant 0 
                                              %29 = OpTypeVector %6 3 
                                              %30 = OpTypePointer Uniform %7 
                                          i32 %34 = OpConstant 7 
                                          i32 %35 = OpConstant 1 
                                          i32 %54 = OpConstant 2 
                                          i32 %67 = OpConstant 3 
                               Private f32_4* %80 = OpVariable Private 
                                             %126 = OpTypePointer Private %29 
                              Private f32_3* %127 = OpVariable Private 
                              Private f32_3* %162 = OpVariable Private 
                              Private f32_3* %197 = OpVariable Private 
                                         i32 %198 = OpConstant 5 
                                         i32 %202 = OpConstant 8 
                              Private f32_3* %234 = OpVariable Private 
                              Private f32_3* %269 = OpVariable Private 
                                             %306 = OpTypePointer Input %29 
                                Input f32_3* %307 = OpVariable Input 
                                Input f32_3* %339 = OpVariable Input 
                                         u32 %342 = OpConstant 0 
                                             %343 = OpTypePointer Private %6 
                                         u32 %348 = OpConstant 1 
                                         u32 %353 = OpConstant 2 
                                Private f32* %355 = OpVariable Private 
                              Private f32_3* %370 = OpVariable Private 
                                         i32 %371 = OpConstant 6 
                                             %375 = OpTypePointer Function %22 
                                         i32 %383 = OpConstant 10 
                                             %384 = OpTypePointer Uniform %22 
                                             %387 = OpTypeBool 
                                Private f32* %402 = OpVariable Private 
                                Private f32* %406 = OpVariable Private 
                                             %408 = OpTypePointer Uniform %6 
                                         f32 %413 = OpConstant 3.674022E-40 
                                             %417 = OpTypePointer Private %387 
                               Private bool* %418 = OpVariable Private 
                                         f32 %419 = OpConstant 3.674022E-40 
                                         u32 %421 = OpConstant 3 
                               Private bool* %425 = OpVariable Private 
                                Private f32* %434 = OpVariable Private 
                                         f32 %439 = OpConstant 3.674022E-40 
                              Private f32_3* %455 = OpVariable Private 
                                         f32 %479 = OpConstant 3.674022E-40 
                                       f32_3 %502 = OpConstantComposite %413 %413 %413 
                                             %509 = OpTypePointer Output %7 
                               Output f32_4* %510 = OpVariable Output 
                                             %521 = OpTypeVector %6 2 
                                             %522 = OpTypePointer Output %521 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_3* %524 = OpVariable Input 
                                         i32 %527 = OpConstant 11 
                                         i32 %561 = OpConstant 9 
                                             %579 = OpTypeArray %6 %348 
                                             %580 = OpTypeStruct %7 %6 %579 
                                             %581 = OpTypePointer Output %580 
        Output struct {f32_4; f32; f32[1];}* %582 = OpVariable Output 
                                             %591 = OpTypePointer Output %6 
                                             %598 = OpTypePointer Private %22 
                                Private i32* %599 = OpVariable Private 
                               Private bool* %600 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function i32* %376 = OpVariable Function 
                               Uniform f32_4* %31 = OpAccessChain %26 %27 %28 
                                        f32_4 %32 = OpLoad %31 
                                        f32_3 %33 = OpVectorShuffle %32 %32 1 1 1 
                               Uniform f32_4* %36 = OpAccessChain %26 %34 %35 
                                        f32_4 %37 = OpLoad %36 
                                        f32_3 %38 = OpVectorShuffle %37 %37 0 1 2 
                                        f32_3 %39 = OpFMul %33 %38 
                                        f32_4 %40 = OpLoad %9 
                                        f32_4 %41 = OpVectorShuffle %40 %39 4 5 6 3 
                                                      OpStore %9 %41 
                               Uniform f32_4* %42 = OpAccessChain %26 %34 %28 
                                        f32_4 %43 = OpLoad %42 
                                        f32_3 %44 = OpVectorShuffle %43 %43 0 1 2 
                               Uniform f32_4* %45 = OpAccessChain %26 %27 %28 
                                        f32_4 %46 = OpLoad %45 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 0 0 
                                        f32_3 %48 = OpFMul %44 %47 
                                        f32_4 %49 = OpLoad %9 
                                        f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
                                        f32_3 %51 = OpFAdd %48 %50 
                                        f32_4 %52 = OpLoad %9 
                                        f32_4 %53 = OpVectorShuffle %52 %51 4 5 6 3 
                                                      OpStore %9 %53 
                               Uniform f32_4* %55 = OpAccessChain %26 %34 %54 
                                        f32_4 %56 = OpLoad %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                               Uniform f32_4* %58 = OpAccessChain %26 %27 %28 
                                        f32_4 %59 = OpLoad %58 
                                        f32_3 %60 = OpVectorShuffle %59 %59 2 2 2 
                                        f32_3 %61 = OpFMul %57 %60 
                                        f32_4 %62 = OpLoad %9 
                                        f32_3 %63 = OpVectorShuffle %62 %62 0 1 2 
                                        f32_3 %64 = OpFAdd %61 %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpVectorShuffle %65 %64 4 5 6 3 
                                                      OpStore %9 %66 
                               Uniform f32_4* %68 = OpAccessChain %26 %34 %67 
                                        f32_4 %69 = OpLoad %68 
                                        f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                               Uniform f32_4* %71 = OpAccessChain %26 %27 %28 
                                        f32_4 %72 = OpLoad %71 
                                        f32_3 %73 = OpVectorShuffle %72 %72 3 3 3 
                                        f32_3 %74 = OpFMul %70 %73 
                                        f32_4 %75 = OpLoad %9 
                                        f32_3 %76 = OpVectorShuffle %75 %75 0 1 2 
                                        f32_3 %77 = OpFAdd %74 %76 
                                        f32_4 %78 = OpLoad %9 
                                        f32_4 %79 = OpVectorShuffle %78 %77 4 5 6 3 
                                                      OpStore %9 %79 
                               Uniform f32_4* %81 = OpAccessChain %26 %27 %35 
                                        f32_4 %82 = OpLoad %81 
                                        f32_3 %83 = OpVectorShuffle %82 %82 1 1 1 
                               Uniform f32_4* %84 = OpAccessChain %26 %34 %35 
                                        f32_4 %85 = OpLoad %84 
                                        f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                        f32_3 %87 = OpFMul %83 %86 
                                        f32_4 %88 = OpLoad %80 
                                        f32_4 %89 = OpVectorShuffle %88 %87 4 5 6 3 
                                                      OpStore %80 %89 
                               Uniform f32_4* %90 = OpAccessChain %26 %34 %28 
                                        f32_4 %91 = OpLoad %90 
                                        f32_3 %92 = OpVectorShuffle %91 %91 0 1 2 
                               Uniform f32_4* %93 = OpAccessChain %26 %27 %35 
                                        f32_4 %94 = OpLoad %93 
                                        f32_3 %95 = OpVectorShuffle %94 %94 0 0 0 
                                        f32_3 %96 = OpFMul %92 %95 
                                        f32_4 %97 = OpLoad %80 
                                        f32_3 %98 = OpVectorShuffle %97 %97 0 1 2 
                                        f32_3 %99 = OpFAdd %96 %98 
                                       f32_4 %100 = OpLoad %80 
                                       f32_4 %101 = OpVectorShuffle %100 %99 4 5 6 3 
                                                      OpStore %80 %101 
                              Uniform f32_4* %102 = OpAccessChain %26 %34 %54 
                                       f32_4 %103 = OpLoad %102 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                              Uniform f32_4* %105 = OpAccessChain %26 %27 %35 
                                       f32_4 %106 = OpLoad %105 
                                       f32_3 %107 = OpVectorShuffle %106 %106 2 2 2 
                                       f32_3 %108 = OpFMul %104 %107 
                                       f32_4 %109 = OpLoad %80 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                                       f32_3 %111 = OpFAdd %108 %110 
                                       f32_4 %112 = OpLoad %80 
                                       f32_4 %113 = OpVectorShuffle %112 %111 4 5 6 3 
                                                      OpStore %80 %113 
                              Uniform f32_4* %114 = OpAccessChain %26 %34 %67 
                                       f32_4 %115 = OpLoad %114 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                              Uniform f32_4* %117 = OpAccessChain %26 %27 %35 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 3 3 3 
                                       f32_3 %120 = OpFMul %116 %119 
                                       f32_4 %121 = OpLoad %80 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                       f32_3 %123 = OpFAdd %120 %122 
                                       f32_4 %124 = OpLoad %80 
                                       f32_4 %125 = OpVectorShuffle %124 %123 4 5 6 3 
                                                      OpStore %80 %125 
                              Uniform f32_4* %128 = OpAccessChain %26 %27 %54 
                                       f32_4 %129 = OpLoad %128 
                                       f32_3 %130 = OpVectorShuffle %129 %129 1 1 1 
                              Uniform f32_4* %131 = OpAccessChain %26 %34 %35 
                                       f32_4 %132 = OpLoad %131 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                       f32_3 %134 = OpFMul %130 %133 
                                                      OpStore %127 %134 
                              Uniform f32_4* %135 = OpAccessChain %26 %34 %28 
                                       f32_4 %136 = OpLoad %135 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                              Uniform f32_4* %138 = OpAccessChain %26 %27 %54 
                                       f32_4 %139 = OpLoad %138 
                                       f32_3 %140 = OpVectorShuffle %139 %139 0 0 0 
                                       f32_3 %141 = OpFMul %137 %140 
                                       f32_3 %142 = OpLoad %127 
                                       f32_3 %143 = OpFAdd %141 %142 
                                                      OpStore %127 %143 
                              Uniform f32_4* %144 = OpAccessChain %26 %34 %54 
                                       f32_4 %145 = OpLoad %144 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                              Uniform f32_4* %147 = OpAccessChain %26 %27 %54 
                                       f32_4 %148 = OpLoad %147 
                                       f32_3 %149 = OpVectorShuffle %148 %148 2 2 2 
                                       f32_3 %150 = OpFMul %146 %149 
                                       f32_3 %151 = OpLoad %127 
                                       f32_3 %152 = OpFAdd %150 %151 
                                                      OpStore %127 %152 
                              Uniform f32_4* %153 = OpAccessChain %26 %34 %67 
                                       f32_4 %154 = OpLoad %153 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                              Uniform f32_4* %156 = OpAccessChain %26 %27 %54 
                                       f32_4 %157 = OpLoad %156 
                                       f32_3 %158 = OpVectorShuffle %157 %157 3 3 3 
                                       f32_3 %159 = OpFMul %155 %158 
                                       f32_3 %160 = OpLoad %127 
                                       f32_3 %161 = OpFAdd %159 %160 
                                                      OpStore %127 %161 
                              Uniform f32_4* %163 = OpAccessChain %26 %27 %67 
                                       f32_4 %164 = OpLoad %163 
                                       f32_3 %165 = OpVectorShuffle %164 %164 1 1 1 
                              Uniform f32_4* %166 = OpAccessChain %26 %34 %35 
                                       f32_4 %167 = OpLoad %166 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_3 %169 = OpFMul %165 %168 
                                                      OpStore %162 %169 
                              Uniform f32_4* %170 = OpAccessChain %26 %34 %28 
                                       f32_4 %171 = OpLoad %170 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                              Uniform f32_4* %173 = OpAccessChain %26 %27 %67 
                                       f32_4 %174 = OpLoad %173 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 0 0 
                                       f32_3 %176 = OpFMul %172 %175 
                                       f32_3 %177 = OpLoad %162 
                                       f32_3 %178 = OpFAdd %176 %177 
                                                      OpStore %162 %178 
                              Uniform f32_4* %179 = OpAccessChain %26 %34 %54 
                                       f32_4 %180 = OpLoad %179 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                              Uniform f32_4* %182 = OpAccessChain %26 %27 %67 
                                       f32_4 %183 = OpLoad %182 
                                       f32_3 %184 = OpVectorShuffle %183 %183 2 2 2 
                                       f32_3 %185 = OpFMul %181 %184 
                                       f32_3 %186 = OpLoad %162 
                                       f32_3 %187 = OpFAdd %185 %186 
                                                      OpStore %162 %187 
                              Uniform f32_4* %188 = OpAccessChain %26 %34 %67 
                                       f32_4 %189 = OpLoad %188 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                              Uniform f32_4* %191 = OpAccessChain %26 %27 %67 
                                       f32_4 %192 = OpLoad %191 
                                       f32_3 %193 = OpVectorShuffle %192 %192 3 3 3 
                                       f32_3 %194 = OpFMul %190 %193 
                                       f32_3 %195 = OpLoad %162 
                                       f32_3 %196 = OpFAdd %194 %195 
                                                      OpStore %162 %196 
                              Uniform f32_4* %199 = OpAccessChain %26 %198 %35 
                                       f32_4 %200 = OpLoad %199 
                                       f32_3 %201 = OpVectorShuffle %200 %200 0 1 2 
                              Uniform f32_4* %203 = OpAccessChain %26 %202 %28 
                                       f32_4 %204 = OpLoad %203 
                                       f32_3 %205 = OpVectorShuffle %204 %204 1 1 1 
                                       f32_3 %206 = OpFMul %201 %205 
                                                      OpStore %197 %206 
                              Uniform f32_4* %207 = OpAccessChain %26 %198 %28 
                                       f32_4 %208 = OpLoad %207 
                                       f32_3 %209 = OpVectorShuffle %208 %208 0 1 2 
                              Uniform f32_4* %210 = OpAccessChain %26 %202 %28 
                                       f32_4 %211 = OpLoad %210 
                                       f32_3 %212 = OpVectorShuffle %211 %211 0 0 0 
                                       f32_3 %213 = OpFMul %209 %212 
                                       f32_3 %214 = OpLoad %197 
                                       f32_3 %215 = OpFAdd %213 %214 
                                                      OpStore %197 %215 
                              Uniform f32_4* %216 = OpAccessChain %26 %198 %54 
                                       f32_4 %217 = OpLoad %216 
                                       f32_3 %218 = OpVectorShuffle %217 %217 0 1 2 
                              Uniform f32_4* %219 = OpAccessChain %26 %202 %28 
                                       f32_4 %220 = OpLoad %219 
                                       f32_3 %221 = OpVectorShuffle %220 %220 2 2 2 
                                       f32_3 %222 = OpFMul %218 %221 
                                       f32_3 %223 = OpLoad %197 
                                       f32_3 %224 = OpFAdd %222 %223 
                                                      OpStore %197 %224 
                              Uniform f32_4* %225 = OpAccessChain %26 %198 %67 
                                       f32_4 %226 = OpLoad %225 
                                       f32_3 %227 = OpVectorShuffle %226 %226 0 1 2 
                              Uniform f32_4* %228 = OpAccessChain %26 %202 %28 
                                       f32_4 %229 = OpLoad %228 
                                       f32_3 %230 = OpVectorShuffle %229 %229 3 3 3 
                                       f32_3 %231 = OpFMul %227 %230 
                                       f32_3 %232 = OpLoad %197 
                                       f32_3 %233 = OpFAdd %231 %232 
                                                      OpStore %197 %233 
                              Uniform f32_4* %235 = OpAccessChain %26 %198 %35 
                                       f32_4 %236 = OpLoad %235 
                                       f32_3 %237 = OpVectorShuffle %236 %236 0 1 2 
                              Uniform f32_4* %238 = OpAccessChain %26 %202 %35 
                                       f32_4 %239 = OpLoad %238 
                                       f32_3 %240 = OpVectorShuffle %239 %239 1 1 1 
                                       f32_3 %241 = OpFMul %237 %240 
                                                      OpStore %234 %241 
                              Uniform f32_4* %242 = OpAccessChain %26 %198 %28 
                                       f32_4 %243 = OpLoad %242 
                                       f32_3 %244 = OpVectorShuffle %243 %243 0 1 2 
                              Uniform f32_4* %245 = OpAccessChain %26 %202 %35 
                                       f32_4 %246 = OpLoad %245 
                                       f32_3 %247 = OpVectorShuffle %246 %246 0 0 0 
                                       f32_3 %248 = OpFMul %244 %247 
                                       f32_3 %249 = OpLoad %234 
                                       f32_3 %250 = OpFAdd %248 %249 
                                                      OpStore %234 %250 
                              Uniform f32_4* %251 = OpAccessChain %26 %198 %54 
                                       f32_4 %252 = OpLoad %251 
                                       f32_3 %253 = OpVectorShuffle %252 %252 0 1 2 
                              Uniform f32_4* %254 = OpAccessChain %26 %202 %35 
                                       f32_4 %255 = OpLoad %254 
                                       f32_3 %256 = OpVectorShuffle %255 %255 2 2 2 
                                       f32_3 %257 = OpFMul %253 %256 
                                       f32_3 %258 = OpLoad %234 
                                       f32_3 %259 = OpFAdd %257 %258 
                                                      OpStore %234 %259 
                              Uniform f32_4* %260 = OpAccessChain %26 %198 %67 
                                       f32_4 %261 = OpLoad %260 
                                       f32_3 %262 = OpVectorShuffle %261 %261 0 1 2 
                              Uniform f32_4* %263 = OpAccessChain %26 %202 %35 
                                       f32_4 %264 = OpLoad %263 
                                       f32_3 %265 = OpVectorShuffle %264 %264 3 3 3 
                                       f32_3 %266 = OpFMul %262 %265 
                                       f32_3 %267 = OpLoad %234 
                                       f32_3 %268 = OpFAdd %266 %267 
                                                      OpStore %234 %268 
                              Uniform f32_4* %270 = OpAccessChain %26 %198 %35 
                                       f32_4 %271 = OpLoad %270 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 1 2 
                              Uniform f32_4* %273 = OpAccessChain %26 %202 %54 
                                       f32_4 %274 = OpLoad %273 
                                       f32_3 %275 = OpVectorShuffle %274 %274 1 1 1 
                                       f32_3 %276 = OpFMul %272 %275 
                                                      OpStore %269 %276 
                              Uniform f32_4* %277 = OpAccessChain %26 %198 %28 
                                       f32_4 %278 = OpLoad %277 
                                       f32_3 %279 = OpVectorShuffle %278 %278 0 1 2 
                              Uniform f32_4* %280 = OpAccessChain %26 %202 %54 
                                       f32_4 %281 = OpLoad %280 
                                       f32_3 %282 = OpVectorShuffle %281 %281 0 0 0 
                                       f32_3 %283 = OpFMul %279 %282 
                                       f32_3 %284 = OpLoad %269 
                                       f32_3 %285 = OpFAdd %283 %284 
                                                      OpStore %269 %285 
                              Uniform f32_4* %286 = OpAccessChain %26 %198 %54 
                                       f32_4 %287 = OpLoad %286 
                                       f32_3 %288 = OpVectorShuffle %287 %287 0 1 2 
                              Uniform f32_4* %289 = OpAccessChain %26 %202 %54 
                                       f32_4 %290 = OpLoad %289 
                                       f32_3 %291 = OpVectorShuffle %290 %290 2 2 2 
                                       f32_3 %292 = OpFMul %288 %291 
                                       f32_3 %293 = OpLoad %269 
                                       f32_3 %294 = OpFAdd %292 %293 
                                                      OpStore %269 %294 
                              Uniform f32_4* %295 = OpAccessChain %26 %198 %67 
                                       f32_4 %296 = OpLoad %295 
                                       f32_3 %297 = OpVectorShuffle %296 %296 0 1 2 
                              Uniform f32_4* %298 = OpAccessChain %26 %202 %54 
                                       f32_4 %299 = OpLoad %298 
                                       f32_3 %300 = OpVectorShuffle %299 %299 3 3 3 
                                       f32_3 %301 = OpFMul %297 %300 
                                       f32_3 %302 = OpLoad %269 
                                       f32_3 %303 = OpFAdd %301 %302 
                                                      OpStore %269 %303 
                                       f32_4 %304 = OpLoad %80 
                                       f32_3 %305 = OpVectorShuffle %304 %304 0 1 2 
                                       f32_3 %308 = OpLoad %307 
                                       f32_3 %309 = OpVectorShuffle %308 %308 1 1 1 
                                       f32_3 %310 = OpFMul %305 %309 
                                       f32_4 %311 = OpLoad %80 
                                       f32_4 %312 = OpVectorShuffle %311 %310 4 5 6 3 
                                                      OpStore %80 %312 
                                       f32_4 %313 = OpLoad %9 
                                       f32_3 %314 = OpVectorShuffle %313 %313 0 1 2 
                                       f32_3 %315 = OpLoad %307 
                                       f32_3 %316 = OpVectorShuffle %315 %315 0 0 0 
                                       f32_3 %317 = OpFMul %314 %316 
                                       f32_4 %318 = OpLoad %80 
                                       f32_3 %319 = OpVectorShuffle %318 %318 0 1 2 
                                       f32_3 %320 = OpFAdd %317 %319 
                                       f32_4 %321 = OpLoad %9 
                                       f32_4 %322 = OpVectorShuffle %321 %320 4 5 6 3 
                                                      OpStore %9 %322 
                                       f32_3 %323 = OpLoad %127 
                                       f32_3 %324 = OpLoad %307 
                                       f32_3 %325 = OpVectorShuffle %324 %324 2 2 2 
                                       f32_3 %326 = OpFMul %323 %325 
                                       f32_4 %327 = OpLoad %9 
                                       f32_3 %328 = OpVectorShuffle %327 %327 0 1 2 
                                       f32_3 %329 = OpFAdd %326 %328 
                                       f32_4 %330 = OpLoad %9 
                                       f32_4 %331 = OpVectorShuffle %330 %329 4 5 6 3 
                                                      OpStore %9 %331 
                                       f32_3 %332 = OpLoad %162 
                                       f32_4 %333 = OpLoad %9 
                                       f32_3 %334 = OpVectorShuffle %333 %333 0 1 2 
                                       f32_3 %335 = OpFAdd %332 %334 
                                       f32_4 %336 = OpLoad %9 
                                       f32_4 %337 = OpVectorShuffle %336 %335 4 5 6 3 
                                                      OpStore %9 %337 
                                       f32_3 %338 = OpLoad %197 
                                       f32_3 %340 = OpLoad %339 
                                         f32 %341 = OpDot %338 %340 
                                Private f32* %344 = OpAccessChain %80 %342 
                                                      OpStore %344 %341 
                                       f32_3 %345 = OpLoad %234 
                                       f32_3 %346 = OpLoad %339 
                                         f32 %347 = OpDot %345 %346 
                                Private f32* %349 = OpAccessChain %80 %348 
                                                      OpStore %349 %347 
                                       f32_3 %350 = OpLoad %269 
                                       f32_3 %351 = OpLoad %339 
                                         f32 %352 = OpDot %350 %351 
                                Private f32* %354 = OpAccessChain %80 %353 
                                                      OpStore %354 %352 
                                       f32_4 %356 = OpLoad %80 
                                       f32_3 %357 = OpVectorShuffle %356 %356 0 1 2 
                                       f32_4 %358 = OpLoad %80 
                                       f32_3 %359 = OpVectorShuffle %358 %358 0 1 2 
                                         f32 %360 = OpDot %357 %359 
                                                      OpStore %355 %360 
                                         f32 %361 = OpLoad %355 
                                         f32 %362 = OpExtInst %1 32 %361 
                                                      OpStore %355 %362 
                                         f32 %363 = OpLoad %355 
                                       f32_3 %364 = OpCompositeConstruct %363 %363 %363 
                                       f32_4 %365 = OpLoad %80 
                                       f32_3 %366 = OpVectorShuffle %365 %365 0 1 2 
                                       f32_3 %367 = OpFMul %364 %366 
                                       f32_4 %368 = OpLoad %80 
                                       f32_4 %369 = OpVectorShuffle %368 %367 4 5 6 3 
                                                      OpStore %80 %369 
                              Uniform f32_4* %372 = OpAccessChain %26 %371 
                                       f32_4 %373 = OpLoad %372 
                                       f32_3 %374 = OpVectorShuffle %373 %373 0 1 2 
                                                      OpStore %370 %374 
                                                      OpStore %376 %28 
                                                      OpBranch %377 
                                             %377 = OpLabel 
                                                      OpLoopMerge %379 %380 None 
                                                      OpBranch %381 
                                             %381 = OpLabel 
                                         i32 %382 = OpLoad %376 
                                Uniform i32* %385 = OpAccessChain %26 %383 %342 
                                         i32 %386 = OpLoad %385 
                                        bool %388 = OpSLessThan %382 %386 
                                                      OpBranchConditional %388 %378 %379 
                                             %378 = OpLabel 
                                       f32_4 %389 = OpLoad %9 
                                       f32_3 %390 = OpVectorShuffle %389 %389 0 1 2 
                                       f32_3 %391 = OpFNegate %390 
                                         i32 %392 = OpLoad %376 
                              Uniform f32_4* %393 = OpAccessChain %26 %35 %392 
                                       f32_4 %394 = OpLoad %393 
                                       f32_3 %395 = OpVectorShuffle %394 %394 3 3 3 
                                       f32_3 %396 = OpFMul %391 %395 
                                         i32 %397 = OpLoad %376 
                              Uniform f32_4* %398 = OpAccessChain %26 %35 %397 
                                       f32_4 %399 = OpLoad %398 
                                       f32_3 %400 = OpVectorShuffle %399 %399 0 1 2 
                                       f32_3 %401 = OpFAdd %396 %400 
                                                      OpStore %127 %401 
                                       f32_3 %403 = OpLoad %127 
                                       f32_3 %404 = OpLoad %127 
                                         f32 %405 = OpDot %403 %404 
                                                      OpStore %402 %405 
                                         i32 %407 = OpLoad %376 
                                Uniform f32* %409 = OpAccessChain %26 %54 %407 %353 
                                         f32 %410 = OpLoad %409 
                                         f32 %411 = OpLoad %402 
                                         f32 %412 = OpFMul %410 %411 
                                         f32 %414 = OpFAdd %412 %413 
                                                      OpStore %406 %414 
                                         f32 %415 = OpLoad %406 
                                         f32 %416 = OpFDiv %413 %415 
                                                      OpStore %406 %416 
                                         i32 %420 = OpLoad %376 
                                Uniform f32* %422 = OpAccessChain %26 %35 %420 %421 
                                         f32 %423 = OpLoad %422 
                                        bool %424 = OpFOrdNotEqual %419 %423 
                                                      OpStore %418 %424 
                                         i32 %426 = OpLoad %376 
                                Uniform f32* %427 = OpAccessChain %26 %54 %426 %421 
                                         f32 %428 = OpLoad %427 
                                         f32 %429 = OpLoad %402 
                                        bool %430 = OpFOrdLessThan %428 %429 
                                                      OpStore %425 %430 
                                        bool %431 = OpLoad %425 
                                        bool %432 = OpLoad %418 
                                        bool %433 = OpLogicalAnd %431 %432 
                                                      OpStore %418 %433 
                                        bool %435 = OpLoad %418 
                                         f32 %436 = OpLoad %406 
                                         f32 %437 = OpSelect %435 %419 %436 
                                                      OpStore %434 %437 
                                         f32 %438 = OpLoad %402 
                                         f32 %440 = OpExtInst %1 40 %438 %439 
                                                      OpStore %402 %440 
                                         f32 %441 = OpLoad %402 
                                         f32 %442 = OpExtInst %1 32 %441 
                                                      OpStore %402 %442 
                                         f32 %443 = OpLoad %402 
                                       f32_3 %444 = OpCompositeConstruct %443 %443 %443 
                                       f32_3 %445 = OpLoad %127 
                                       f32_3 %446 = OpFMul %444 %445 
                                                      OpStore %127 %446 
                                       f32_3 %447 = OpLoad %127 
                                         i32 %448 = OpLoad %376 
                              Uniform f32_4* %449 = OpAccessChain %26 %67 %448 
                                       f32_4 %450 = OpLoad %449 
                                       f32_3 %451 = OpVectorShuffle %450 %450 0 1 2 
                                         f32 %452 = OpDot %447 %451 
                                                      OpStore %402 %452 
                                         f32 %453 = OpLoad %402 
                                         f32 %454 = OpExtInst %1 40 %453 %419 
                                                      OpStore %402 %454 
                                         f32 %456 = OpLoad %402 
                                         i32 %457 = OpLoad %376 
                                Uniform f32* %458 = OpAccessChain %26 %54 %457 %342 
                                         f32 %459 = OpLoad %458 
                                         f32 %460 = OpFNegate %459 
                                         f32 %461 = OpFAdd %456 %460 
                                Private f32* %462 = OpAccessChain %455 %342 
                                                      OpStore %462 %461 
                                Private f32* %463 = OpAccessChain %455 %342 
                                         f32 %464 = OpLoad %463 
                                         i32 %465 = OpLoad %376 
                                Uniform f32* %466 = OpAccessChain %26 %54 %465 %348 
                                         f32 %467 = OpLoad %466 
                                         f32 %468 = OpFMul %464 %467 
                                Private f32* %469 = OpAccessChain %455 %342 
                                                      OpStore %469 %468 
                                Private f32* %470 = OpAccessChain %455 %342 
                                         f32 %471 = OpLoad %470 
                                         f32 %472 = OpExtInst %1 43 %471 %419 %413 
                                Private f32* %473 = OpAccessChain %455 %342 
                                                      OpStore %473 %472 
                                         f32 %474 = OpLoad %434 
                                Private f32* %475 = OpAccessChain %455 %342 
                                         f32 %476 = OpLoad %475 
                                         f32 %477 = OpFMul %474 %476 
                                                      OpStore %434 %477 
                                         f32 %478 = OpLoad %434 
                                         f32 %480 = OpFMul %478 %479 
                                                      OpStore %434 %480 
                                       f32_4 %481 = OpLoad %80 
                                       f32_3 %482 = OpVectorShuffle %481 %481 0 1 2 
                                       f32_3 %483 = OpLoad %127 
                                         f32 %484 = OpDot %482 %483 
                                Private f32* %485 = OpAccessChain %455 %342 
                                                      OpStore %485 %484 
                                Private f32* %486 = OpAccessChain %455 %342 
                                         f32 %487 = OpLoad %486 
                                         f32 %488 = OpExtInst %1 40 %487 %419 
                                Private f32* %489 = OpAccessChain %455 %342 
                                                      OpStore %489 %488 
                                       f32_3 %490 = OpLoad %455 
                                       f32_3 %491 = OpVectorShuffle %490 %490 0 0 0 
                                         i32 %492 = OpLoad %376 
                              Uniform f32_4* %493 = OpAccessChain %26 %28 %492 
                                       f32_4 %494 = OpLoad %493 
                                       f32_3 %495 = OpVectorShuffle %494 %494 0 1 2 
                                       f32_3 %496 = OpFMul %491 %495 
                                                      OpStore %455 %496 
                                         f32 %497 = OpLoad %434 
                                       f32_3 %498 = OpCompositeConstruct %497 %497 %497 
                                       f32_3 %499 = OpLoad %455 
                                       f32_3 %500 = OpFMul %498 %499 
                                                      OpStore %455 %500 
                                       f32_3 %501 = OpLoad %455 
                                       f32_3 %503 = OpExtInst %1 37 %501 %502 
                                                      OpStore %455 %503 
                                       f32_3 %504 = OpLoad %370 
                                       f32_3 %505 = OpLoad %455 
                                       f32_3 %506 = OpFAdd %504 %505 
                                                      OpStore %370 %506 
                                                      OpBranch %380 
                                             %380 = OpLabel 
                                         i32 %507 = OpLoad %376 
                                         i32 %508 = OpIAdd %507 %35 
                                                      OpStore %376 %508 
                                                      OpBranch %377 
                                             %379 = OpLabel 
                                       f32_3 %511 = OpLoad %370 
                                       f32_4 %512 = OpLoad %510 
                                       f32_4 %513 = OpVectorShuffle %512 %511 4 5 6 3 
                                                      OpStore %510 %513 
                                       f32_4 %514 = OpLoad %510 
                                       f32_3 %515 = OpVectorShuffle %514 %514 0 1 2 
                                       f32_3 %516 = OpCompositeConstruct %419 %419 %419 
                                       f32_3 %517 = OpCompositeConstruct %413 %413 %413 
                                       f32_3 %518 = OpExtInst %1 43 %515 %516 %517 
                                       f32_4 %519 = OpLoad %510 
                                       f32_4 %520 = OpVectorShuffle %519 %518 4 5 6 3 
                                                      OpStore %510 %520 
                                       f32_3 %525 = OpLoad %524 
                                       f32_2 %526 = OpVectorShuffle %525 %525 0 1 
                              Uniform f32_4* %528 = OpAccessChain %26 %527 
                                       f32_4 %529 = OpLoad %528 
                                       f32_2 %530 = OpVectorShuffle %529 %529 0 1 
                                       f32_2 %531 = OpFMul %526 %530 
                              Uniform f32_4* %532 = OpAccessChain %26 %527 
                                       f32_4 %533 = OpLoad %532 
                                       f32_2 %534 = OpVectorShuffle %533 %533 2 3 
                                       f32_2 %535 = OpFAdd %531 %534 
                                                      OpStore vs_TEXCOORD0 %535 
                                       f32_3 %536 = OpLoad %307 
                                       f32_4 %537 = OpVectorShuffle %536 %536 1 1 1 1 
                              Uniform f32_4* %538 = OpAccessChain %26 %27 %35 
                                       f32_4 %539 = OpLoad %538 
                                       f32_4 %540 = OpFMul %537 %539 
                                                      OpStore %9 %540 
                              Uniform f32_4* %541 = OpAccessChain %26 %27 %28 
                                       f32_4 %542 = OpLoad %541 
                                       f32_3 %543 = OpLoad %307 
                                       f32_4 %544 = OpVectorShuffle %543 %543 0 0 0 0 
                                       f32_4 %545 = OpFMul %542 %544 
                                       f32_4 %546 = OpLoad %9 
                                       f32_4 %547 = OpFAdd %545 %546 
                                                      OpStore %9 %547 
                              Uniform f32_4* %548 = OpAccessChain %26 %27 %54 
                                       f32_4 %549 = OpLoad %548 
                                       f32_3 %550 = OpLoad %307 
                                       f32_4 %551 = OpVectorShuffle %550 %550 2 2 2 2 
                                       f32_4 %552 = OpFMul %549 %551 
                                       f32_4 %553 = OpLoad %9 
                                       f32_4 %554 = OpFAdd %552 %553 
                                                      OpStore %9 %554 
                                       f32_4 %555 = OpLoad %9 
                              Uniform f32_4* %556 = OpAccessChain %26 %27 %67 
                                       f32_4 %557 = OpLoad %556 
                                       f32_4 %558 = OpFAdd %555 %557 
                                                      OpStore %9 %558 
                                       f32_4 %559 = OpLoad %9 
                                       f32_4 %560 = OpVectorShuffle %559 %559 1 1 1 1 
                              Uniform f32_4* %562 = OpAccessChain %26 %561 %35 
                                       f32_4 %563 = OpLoad %562 
                                       f32_4 %564 = OpFMul %560 %563 
                                                      OpStore %80 %564 
                              Uniform f32_4* %565 = OpAccessChain %26 %561 %28 
                                       f32_4 %566 = OpLoad %565 
                                       f32_4 %567 = OpLoad %9 
                                       f32_4 %568 = OpVectorShuffle %567 %567 0 0 0 0 
                                       f32_4 %569 = OpFMul %566 %568 
                                       f32_4 %570 = OpLoad %80 
                                       f32_4 %571 = OpFAdd %569 %570 
                                                      OpStore %80 %571 
                              Uniform f32_4* %572 = OpAccessChain %26 %561 %54 
                                       f32_4 %573 = OpLoad %572 
                                       f32_4 %574 = OpLoad %9 
                                       f32_4 %575 = OpVectorShuffle %574 %574 2 2 2 2 
                                       f32_4 %576 = OpFMul %573 %575 
                                       f32_4 %577 = OpLoad %80 
                                       f32_4 %578 = OpFAdd %576 %577 
                                                      OpStore %80 %578 
                              Uniform f32_4* %583 = OpAccessChain %26 %561 %67 
                                       f32_4 %584 = OpLoad %583 
                                       f32_4 %585 = OpLoad %9 
                                       f32_4 %586 = OpVectorShuffle %585 %585 3 3 3 3 
                                       f32_4 %587 = OpFMul %584 %586 
                                       f32_4 %588 = OpLoad %80 
                                       f32_4 %589 = OpFAdd %587 %588 
                               Output f32_4* %590 = OpAccessChain %582 %28 
                                                      OpStore %590 %589 
                                 Output f32* %592 = OpAccessChain %510 %421 
                                                      OpStore %592 %413 
                                 Output f32* %593 = OpAccessChain %582 %28 %348 
                                         f32 %594 = OpLoad %593 
                                         f32 %595 = OpFNegate %594 
                                 Output f32* %596 = OpAccessChain %582 %28 %348 
                                                      OpStore %596 %595 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 47
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %30 %35 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %9 RelaxedPrecision 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %13 RelaxedPrecision 
                                             OpDecorate %16 RelaxedPrecision 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %17 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %26 RelaxedPrecision 
                                             OpDecorate %27 RelaxedPrecision 
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %30 RelaxedPrecision 
                                             OpDecorate %30 Location 30 
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate %33 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %35 Location 35 
                                             OpDecorate %36 RelaxedPrecision 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %24 = OpTypeVector %6 4 
                      Private f32_3* %27 = OpVariable Private 
                                     %29 = OpTypePointer Input %24 
                        Input f32_4* %30 = OpVariable Input 
                                     %34 = OpTypePointer Output %24 
                       Output f32_4* %35 = OpVariable Output 
                                 f32 %41 = OpConstant 3.674022E-40 
                                     %42 = OpTypeInt 32 0 
                                 u32 %43 = OpConstant 3 
                                     %44 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
                                             OpStore %9 %26 
                               f32_3 %28 = OpLoad %9 
                               f32_4 %31 = OpLoad %30 
                               f32_3 %32 = OpVectorShuffle %31 %31 0 1 2 
                               f32_3 %33 = OpFMul %28 %32 
                                             OpStore %27 %33 
                               f32_3 %36 = OpLoad %27 
                               f32_3 %37 = OpLoad %27 
                               f32_3 %38 = OpFAdd %36 %37 
                               f32_4 %39 = OpLoad %35 
                               f32_4 %40 = OpVectorShuffle %39 %38 4 5 6 3 
                                             OpStore %35 %40 
                         Output f32* %45 = OpAccessChain %35 %43 
                                             OpStore %45 %41 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "SPOT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 601
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %307 %339 %510 %523 %524 %582 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpDecorate %21 ArrayStride 21 
                                                      OpMemberDecorate %24 0 RelaxedPrecision 
                                                      OpMemberDecorate %24 0 Offset 24 
                                                      OpMemberDecorate %24 1 Offset 24 
                                                      OpMemberDecorate %24 2 RelaxedPrecision 
                                                      OpMemberDecorate %24 2 Offset 24 
                                                      OpMemberDecorate %24 3 Offset 24 
                                                      OpMemberDecorate %24 4 Offset 24 
                                                      OpMemberDecorate %24 5 Offset 24 
                                                      OpMemberDecorate %24 6 RelaxedPrecision 
                                                      OpMemberDecorate %24 6 Offset 24 
                                                      OpMemberDecorate %24 7 Offset 24 
                                                      OpMemberDecorate %24 8 Offset 24 
                                                      OpMemberDecorate %24 9 Offset 24 
                                                      OpMemberDecorate %24 10 Offset 24 
                                                      OpMemberDecorate %24 11 Offset 24 
                                                      OpDecorate %24 Block 
                                                      OpDecorate %26 DescriptorSet 26 
                                                      OpDecorate %26 Binding 26 
                                                      OpDecorate %307 Location 307 
                                                      OpDecorate %339 Location 339 
                                                      OpDecorate %370 RelaxedPrecision 
                                                      OpDecorate %373 RelaxedPrecision 
                                                      OpDecorate %374 RelaxedPrecision 
                                                      OpDecorate %410 RelaxedPrecision 
                                                      OpDecorate %428 RelaxedPrecision 
                                                      OpDecorate %434 RelaxedPrecision 
                                                      OpDecorate %455 RelaxedPrecision 
                                                      OpDecorate %459 RelaxedPrecision 
                                                      OpDecorate %460 RelaxedPrecision 
                                                      OpDecorate %464 RelaxedPrecision 
                                                      OpDecorate %467 RelaxedPrecision 
                                                      OpDecorate %468 RelaxedPrecision 
                                                      OpDecorate %471 RelaxedPrecision 
                                                      OpDecorate %472 RelaxedPrecision 
                                                      OpDecorate %474 RelaxedPrecision 
                                                      OpDecorate %476 RelaxedPrecision 
                                                      OpDecorate %477 RelaxedPrecision 
                                                      OpDecorate %478 RelaxedPrecision 
                                                      OpDecorate %480 RelaxedPrecision 
                                                      OpDecorate %487 RelaxedPrecision 
                                                      OpDecorate %488 RelaxedPrecision 
                                                      OpDecorate %490 RelaxedPrecision 
                                                      OpDecorate %491 RelaxedPrecision 
                                                      OpDecorate %494 RelaxedPrecision 
                                                      OpDecorate %495 RelaxedPrecision 
                                                      OpDecorate %496 RelaxedPrecision 
                                                      OpDecorate %497 RelaxedPrecision 
                                                      OpDecorate %498 RelaxedPrecision 
                                                      OpDecorate %499 RelaxedPrecision 
                                                      OpDecorate %500 RelaxedPrecision 
                                                      OpDecorate %501 RelaxedPrecision 
                                                      OpDecorate %503 RelaxedPrecision 
                                                      OpDecorate %504 RelaxedPrecision 
                                                      OpDecorate %505 RelaxedPrecision 
                                                      OpDecorate %506 RelaxedPrecision 
                                                      OpDecorate %510 RelaxedPrecision 
                                                      OpDecorate %510 Location 510 
                                                      OpDecorate %511 RelaxedPrecision 
                                                      OpDecorate %514 RelaxedPrecision 
                                                      OpDecorate %515 RelaxedPrecision 
                                                      OpDecorate %516 RelaxedPrecision 
                                                      OpDecorate %517 RelaxedPrecision 
                                                      OpDecorate %518 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 523 
                                                      OpDecorate %524 Location 524 
                                                      OpMemberDecorate %580 0 BuiltIn 580 
                                                      OpMemberDecorate %580 1 BuiltIn 580 
                                                      OpMemberDecorate %580 2 BuiltIn 580 
                                                      OpDecorate %580 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 8 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                              %14 = OpTypeArray %7 %11 
                                              %15 = OpTypeArray %7 %11 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeArray %7 %16 
                                              %20 = OpTypeArray %7 %16 
                                              %21 = OpTypeArray %7 %16 
                                              %22 = OpTypeInt 32 1 
                                              %23 = OpTypeVector %22 4 
                                              %24 = OpTypeStruct %12 %13 %14 %15 %17 %18 %7 %19 %20 %21 %23 %7 
                                              %25 = OpTypePointer Uniform %24 
Uniform struct {f32_4[8]; f32_4[8]; f32_4[8]; f32_4[8]; f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; i32_4; f32_4;}* %26 = OpVariable Uniform 
                                          i32 %27 = OpConstant 4 
                                          i32 %28 = OpConstant 0 
                                              %29 = OpTypeVector %6 3 
                                              %30 = OpTypePointer Uniform %7 
                                          i32 %34 = OpConstant 7 
                                          i32 %35 = OpConstant 1 
                                          i32 %54 = OpConstant 2 
                                          i32 %67 = OpConstant 3 
                               Private f32_4* %80 = OpVariable Private 
                                             %126 = OpTypePointer Private %29 
                              Private f32_3* %127 = OpVariable Private 
                              Private f32_3* %162 = OpVariable Private 
                              Private f32_3* %197 = OpVariable Private 
                                         i32 %198 = OpConstant 5 
                                         i32 %202 = OpConstant 8 
                              Private f32_3* %234 = OpVariable Private 
                              Private f32_3* %269 = OpVariable Private 
                                             %306 = OpTypePointer Input %29 
                                Input f32_3* %307 = OpVariable Input 
                                Input f32_3* %339 = OpVariable Input 
                                         u32 %342 = OpConstant 0 
                                             %343 = OpTypePointer Private %6 
                                         u32 %348 = OpConstant 1 
                                         u32 %353 = OpConstant 2 
                                Private f32* %355 = OpVariable Private 
                              Private f32_3* %370 = OpVariable Private 
                                         i32 %371 = OpConstant 6 
                                             %375 = OpTypePointer Function %22 
                                         i32 %383 = OpConstant 10 
                                             %384 = OpTypePointer Uniform %22 
                                             %387 = OpTypeBool 
                                Private f32* %402 = OpVariable Private 
                                Private f32* %406 = OpVariable Private 
                                             %408 = OpTypePointer Uniform %6 
                                         f32 %413 = OpConstant 3.674022E-40 
                                             %417 = OpTypePointer Private %387 
                               Private bool* %418 = OpVariable Private 
                                         f32 %419 = OpConstant 3.674022E-40 
                                         u32 %421 = OpConstant 3 
                               Private bool* %425 = OpVariable Private 
                                Private f32* %434 = OpVariable Private 
                                         f32 %439 = OpConstant 3.674022E-40 
                              Private f32_3* %455 = OpVariable Private 
                                         f32 %479 = OpConstant 3.674022E-40 
                                       f32_3 %502 = OpConstantComposite %413 %413 %413 
                                             %509 = OpTypePointer Output %7 
                               Output f32_4* %510 = OpVariable Output 
                                             %521 = OpTypeVector %6 2 
                                             %522 = OpTypePointer Output %521 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_3* %524 = OpVariable Input 
                                         i32 %527 = OpConstant 11 
                                         i32 %561 = OpConstant 9 
                                             %579 = OpTypeArray %6 %348 
                                             %580 = OpTypeStruct %7 %6 %579 
                                             %581 = OpTypePointer Output %580 
        Output struct {f32_4; f32; f32[1];}* %582 = OpVariable Output 
                                             %591 = OpTypePointer Output %6 
                                             %598 = OpTypePointer Private %22 
                                Private i32* %599 = OpVariable Private 
                               Private bool* %600 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function i32* %376 = OpVariable Function 
                               Uniform f32_4* %31 = OpAccessChain %26 %27 %28 
                                        f32_4 %32 = OpLoad %31 
                                        f32_3 %33 = OpVectorShuffle %32 %32 1 1 1 
                               Uniform f32_4* %36 = OpAccessChain %26 %34 %35 
                                        f32_4 %37 = OpLoad %36 
                                        f32_3 %38 = OpVectorShuffle %37 %37 0 1 2 
                                        f32_3 %39 = OpFMul %33 %38 
                                        f32_4 %40 = OpLoad %9 
                                        f32_4 %41 = OpVectorShuffle %40 %39 4 5 6 3 
                                                      OpStore %9 %41 
                               Uniform f32_4* %42 = OpAccessChain %26 %34 %28 
                                        f32_4 %43 = OpLoad %42 
                                        f32_3 %44 = OpVectorShuffle %43 %43 0 1 2 
                               Uniform f32_4* %45 = OpAccessChain %26 %27 %28 
                                        f32_4 %46 = OpLoad %45 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 0 0 
                                        f32_3 %48 = OpFMul %44 %47 
                                        f32_4 %49 = OpLoad %9 
                                        f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
                                        f32_3 %51 = OpFAdd %48 %50 
                                        f32_4 %52 = OpLoad %9 
                                        f32_4 %53 = OpVectorShuffle %52 %51 4 5 6 3 
                                                      OpStore %9 %53 
                               Uniform f32_4* %55 = OpAccessChain %26 %34 %54 
                                        f32_4 %56 = OpLoad %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                               Uniform f32_4* %58 = OpAccessChain %26 %27 %28 
                                        f32_4 %59 = OpLoad %58 
                                        f32_3 %60 = OpVectorShuffle %59 %59 2 2 2 
                                        f32_3 %61 = OpFMul %57 %60 
                                        f32_4 %62 = OpLoad %9 
                                        f32_3 %63 = OpVectorShuffle %62 %62 0 1 2 
                                        f32_3 %64 = OpFAdd %61 %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpVectorShuffle %65 %64 4 5 6 3 
                                                      OpStore %9 %66 
                               Uniform f32_4* %68 = OpAccessChain %26 %34 %67 
                                        f32_4 %69 = OpLoad %68 
                                        f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                               Uniform f32_4* %71 = OpAccessChain %26 %27 %28 
                                        f32_4 %72 = OpLoad %71 
                                        f32_3 %73 = OpVectorShuffle %72 %72 3 3 3 
                                        f32_3 %74 = OpFMul %70 %73 
                                        f32_4 %75 = OpLoad %9 
                                        f32_3 %76 = OpVectorShuffle %75 %75 0 1 2 
                                        f32_3 %77 = OpFAdd %74 %76 
                                        f32_4 %78 = OpLoad %9 
                                        f32_4 %79 = OpVectorShuffle %78 %77 4 5 6 3 
                                                      OpStore %9 %79 
                               Uniform f32_4* %81 = OpAccessChain %26 %27 %35 
                                        f32_4 %82 = OpLoad %81 
                                        f32_3 %83 = OpVectorShuffle %82 %82 1 1 1 
                               Uniform f32_4* %84 = OpAccessChain %26 %34 %35 
                                        f32_4 %85 = OpLoad %84 
                                        f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                        f32_3 %87 = OpFMul %83 %86 
                                        f32_4 %88 = OpLoad %80 
                                        f32_4 %89 = OpVectorShuffle %88 %87 4 5 6 3 
                                                      OpStore %80 %89 
                               Uniform f32_4* %90 = OpAccessChain %26 %34 %28 
                                        f32_4 %91 = OpLoad %90 
                                        f32_3 %92 = OpVectorShuffle %91 %91 0 1 2 
                               Uniform f32_4* %93 = OpAccessChain %26 %27 %35 
                                        f32_4 %94 = OpLoad %93 
                                        f32_3 %95 = OpVectorShuffle %94 %94 0 0 0 
                                        f32_3 %96 = OpFMul %92 %95 
                                        f32_4 %97 = OpLoad %80 
                                        f32_3 %98 = OpVectorShuffle %97 %97 0 1 2 
                                        f32_3 %99 = OpFAdd %96 %98 
                                       f32_4 %100 = OpLoad %80 
                                       f32_4 %101 = OpVectorShuffle %100 %99 4 5 6 3 
                                                      OpStore %80 %101 
                              Uniform f32_4* %102 = OpAccessChain %26 %34 %54 
                                       f32_4 %103 = OpLoad %102 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                              Uniform f32_4* %105 = OpAccessChain %26 %27 %35 
                                       f32_4 %106 = OpLoad %105 
                                       f32_3 %107 = OpVectorShuffle %106 %106 2 2 2 
                                       f32_3 %108 = OpFMul %104 %107 
                                       f32_4 %109 = OpLoad %80 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                                       f32_3 %111 = OpFAdd %108 %110 
                                       f32_4 %112 = OpLoad %80 
                                       f32_4 %113 = OpVectorShuffle %112 %111 4 5 6 3 
                                                      OpStore %80 %113 
                              Uniform f32_4* %114 = OpAccessChain %26 %34 %67 
                                       f32_4 %115 = OpLoad %114 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                              Uniform f32_4* %117 = OpAccessChain %26 %27 %35 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 3 3 3 
                                       f32_3 %120 = OpFMul %116 %119 
                                       f32_4 %121 = OpLoad %80 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                       f32_3 %123 = OpFAdd %120 %122 
                                       f32_4 %124 = OpLoad %80 
                                       f32_4 %125 = OpVectorShuffle %124 %123 4 5 6 3 
                                                      OpStore %80 %125 
                              Uniform f32_4* %128 = OpAccessChain %26 %27 %54 
                                       f32_4 %129 = OpLoad %128 
                                       f32_3 %130 = OpVectorShuffle %129 %129 1 1 1 
                              Uniform f32_4* %131 = OpAccessChain %26 %34 %35 
                                       f32_4 %132 = OpLoad %131 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                       f32_3 %134 = OpFMul %130 %133 
                                                      OpStore %127 %134 
                              Uniform f32_4* %135 = OpAccessChain %26 %34 %28 
                                       f32_4 %136 = OpLoad %135 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                              Uniform f32_4* %138 = OpAccessChain %26 %27 %54 
                                       f32_4 %139 = OpLoad %138 
                                       f32_3 %140 = OpVectorShuffle %139 %139 0 0 0 
                                       f32_3 %141 = OpFMul %137 %140 
                                       f32_3 %142 = OpLoad %127 
                                       f32_3 %143 = OpFAdd %141 %142 
                                                      OpStore %127 %143 
                              Uniform f32_4* %144 = OpAccessChain %26 %34 %54 
                                       f32_4 %145 = OpLoad %144 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                              Uniform f32_4* %147 = OpAccessChain %26 %27 %54 
                                       f32_4 %148 = OpLoad %147 
                                       f32_3 %149 = OpVectorShuffle %148 %148 2 2 2 
                                       f32_3 %150 = OpFMul %146 %149 
                                       f32_3 %151 = OpLoad %127 
                                       f32_3 %152 = OpFAdd %150 %151 
                                                      OpStore %127 %152 
                              Uniform f32_4* %153 = OpAccessChain %26 %34 %67 
                                       f32_4 %154 = OpLoad %153 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                              Uniform f32_4* %156 = OpAccessChain %26 %27 %54 
                                       f32_4 %157 = OpLoad %156 
                                       f32_3 %158 = OpVectorShuffle %157 %157 3 3 3 
                                       f32_3 %159 = OpFMul %155 %158 
                                       f32_3 %160 = OpLoad %127 
                                       f32_3 %161 = OpFAdd %159 %160 
                                                      OpStore %127 %161 
                              Uniform f32_4* %163 = OpAccessChain %26 %27 %67 
                                       f32_4 %164 = OpLoad %163 
                                       f32_3 %165 = OpVectorShuffle %164 %164 1 1 1 
                              Uniform f32_4* %166 = OpAccessChain %26 %34 %35 
                                       f32_4 %167 = OpLoad %166 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_3 %169 = OpFMul %165 %168 
                                                      OpStore %162 %169 
                              Uniform f32_4* %170 = OpAccessChain %26 %34 %28 
                                       f32_4 %171 = OpLoad %170 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                              Uniform f32_4* %173 = OpAccessChain %26 %27 %67 
                                       f32_4 %174 = OpLoad %173 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 0 0 
                                       f32_3 %176 = OpFMul %172 %175 
                                       f32_3 %177 = OpLoad %162 
                                       f32_3 %178 = OpFAdd %176 %177 
                                                      OpStore %162 %178 
                              Uniform f32_4* %179 = OpAccessChain %26 %34 %54 
                                       f32_4 %180 = OpLoad %179 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                              Uniform f32_4* %182 = OpAccessChain %26 %27 %67 
                                       f32_4 %183 = OpLoad %182 
                                       f32_3 %184 = OpVectorShuffle %183 %183 2 2 2 
                                       f32_3 %185 = OpFMul %181 %184 
                                       f32_3 %186 = OpLoad %162 
                                       f32_3 %187 = OpFAdd %185 %186 
                                                      OpStore %162 %187 
                              Uniform f32_4* %188 = OpAccessChain %26 %34 %67 
                                       f32_4 %189 = OpLoad %188 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                              Uniform f32_4* %191 = OpAccessChain %26 %27 %67 
                                       f32_4 %192 = OpLoad %191 
                                       f32_3 %193 = OpVectorShuffle %192 %192 3 3 3 
                                       f32_3 %194 = OpFMul %190 %193 
                                       f32_3 %195 = OpLoad %162 
                                       f32_3 %196 = OpFAdd %194 %195 
                                                      OpStore %162 %196 
                              Uniform f32_4* %199 = OpAccessChain %26 %198 %35 
                                       f32_4 %200 = OpLoad %199 
                                       f32_3 %201 = OpVectorShuffle %200 %200 0 1 2 
                              Uniform f32_4* %203 = OpAccessChain %26 %202 %28 
                                       f32_4 %204 = OpLoad %203 
                                       f32_3 %205 = OpVectorShuffle %204 %204 1 1 1 
                                       f32_3 %206 = OpFMul %201 %205 
                                                      OpStore %197 %206 
                              Uniform f32_4* %207 = OpAccessChain %26 %198 %28 
                                       f32_4 %208 = OpLoad %207 
                                       f32_3 %209 = OpVectorShuffle %208 %208 0 1 2 
                              Uniform f32_4* %210 = OpAccessChain %26 %202 %28 
                                       f32_4 %211 = OpLoad %210 
                                       f32_3 %212 = OpVectorShuffle %211 %211 0 0 0 
                                       f32_3 %213 = OpFMul %209 %212 
                                       f32_3 %214 = OpLoad %197 
                                       f32_3 %215 = OpFAdd %213 %214 
                                                      OpStore %197 %215 
                              Uniform f32_4* %216 = OpAccessChain %26 %198 %54 
                                       f32_4 %217 = OpLoad %216 
                                       f32_3 %218 = OpVectorShuffle %217 %217 0 1 2 
                              Uniform f32_4* %219 = OpAccessChain %26 %202 %28 
                                       f32_4 %220 = OpLoad %219 
                                       f32_3 %221 = OpVectorShuffle %220 %220 2 2 2 
                                       f32_3 %222 = OpFMul %218 %221 
                                       f32_3 %223 = OpLoad %197 
                                       f32_3 %224 = OpFAdd %222 %223 
                                                      OpStore %197 %224 
                              Uniform f32_4* %225 = OpAccessChain %26 %198 %67 
                                       f32_4 %226 = OpLoad %225 
                                       f32_3 %227 = OpVectorShuffle %226 %226 0 1 2 
                              Uniform f32_4* %228 = OpAccessChain %26 %202 %28 
                                       f32_4 %229 = OpLoad %228 
                                       f32_3 %230 = OpVectorShuffle %229 %229 3 3 3 
                                       f32_3 %231 = OpFMul %227 %230 
                                       f32_3 %232 = OpLoad %197 
                                       f32_3 %233 = OpFAdd %231 %232 
                                                      OpStore %197 %233 
                              Uniform f32_4* %235 = OpAccessChain %26 %198 %35 
                                       f32_4 %236 = OpLoad %235 
                                       f32_3 %237 = OpVectorShuffle %236 %236 0 1 2 
                              Uniform f32_4* %238 = OpAccessChain %26 %202 %35 
                                       f32_4 %239 = OpLoad %238 
                                       f32_3 %240 = OpVectorShuffle %239 %239 1 1 1 
                                       f32_3 %241 = OpFMul %237 %240 
                                                      OpStore %234 %241 
                              Uniform f32_4* %242 = OpAccessChain %26 %198 %28 
                                       f32_4 %243 = OpLoad %242 
                                       f32_3 %244 = OpVectorShuffle %243 %243 0 1 2 
                              Uniform f32_4* %245 = OpAccessChain %26 %202 %35 
                                       f32_4 %246 = OpLoad %245 
                                       f32_3 %247 = OpVectorShuffle %246 %246 0 0 0 
                                       f32_3 %248 = OpFMul %244 %247 
                                       f32_3 %249 = OpLoad %234 
                                       f32_3 %250 = OpFAdd %248 %249 
                                                      OpStore %234 %250 
                              Uniform f32_4* %251 = OpAccessChain %26 %198 %54 
                                       f32_4 %252 = OpLoad %251 
                                       f32_3 %253 = OpVectorShuffle %252 %252 0 1 2 
                              Uniform f32_4* %254 = OpAccessChain %26 %202 %35 
                                       f32_4 %255 = OpLoad %254 
                                       f32_3 %256 = OpVectorShuffle %255 %255 2 2 2 
                                       f32_3 %257 = OpFMul %253 %256 
                                       f32_3 %258 = OpLoad %234 
                                       f32_3 %259 = OpFAdd %257 %258 
                                                      OpStore %234 %259 
                              Uniform f32_4* %260 = OpAccessChain %26 %198 %67 
                                       f32_4 %261 = OpLoad %260 
                                       f32_3 %262 = OpVectorShuffle %261 %261 0 1 2 
                              Uniform f32_4* %263 = OpAccessChain %26 %202 %35 
                                       f32_4 %264 = OpLoad %263 
                                       f32_3 %265 = OpVectorShuffle %264 %264 3 3 3 
                                       f32_3 %266 = OpFMul %262 %265 
                                       f32_3 %267 = OpLoad %234 
                                       f32_3 %268 = OpFAdd %266 %267 
                                                      OpStore %234 %268 
                              Uniform f32_4* %270 = OpAccessChain %26 %198 %35 
                                       f32_4 %271 = OpLoad %270 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 1 2 
                              Uniform f32_4* %273 = OpAccessChain %26 %202 %54 
                                       f32_4 %274 = OpLoad %273 
                                       f32_3 %275 = OpVectorShuffle %274 %274 1 1 1 
                                       f32_3 %276 = OpFMul %272 %275 
                                                      OpStore %269 %276 
                              Uniform f32_4* %277 = OpAccessChain %26 %198 %28 
                                       f32_4 %278 = OpLoad %277 
                                       f32_3 %279 = OpVectorShuffle %278 %278 0 1 2 
                              Uniform f32_4* %280 = OpAccessChain %26 %202 %54 
                                       f32_4 %281 = OpLoad %280 
                                       f32_3 %282 = OpVectorShuffle %281 %281 0 0 0 
                                       f32_3 %283 = OpFMul %279 %282 
                                       f32_3 %284 = OpLoad %269 
                                       f32_3 %285 = OpFAdd %283 %284 
                                                      OpStore %269 %285 
                              Uniform f32_4* %286 = OpAccessChain %26 %198 %54 
                                       f32_4 %287 = OpLoad %286 
                                       f32_3 %288 = OpVectorShuffle %287 %287 0 1 2 
                              Uniform f32_4* %289 = OpAccessChain %26 %202 %54 
                                       f32_4 %290 = OpLoad %289 
                                       f32_3 %291 = OpVectorShuffle %290 %290 2 2 2 
                                       f32_3 %292 = OpFMul %288 %291 
                                       f32_3 %293 = OpLoad %269 
                                       f32_3 %294 = OpFAdd %292 %293 
                                                      OpStore %269 %294 
                              Uniform f32_4* %295 = OpAccessChain %26 %198 %67 
                                       f32_4 %296 = OpLoad %295 
                                       f32_3 %297 = OpVectorShuffle %296 %296 0 1 2 
                              Uniform f32_4* %298 = OpAccessChain %26 %202 %54 
                                       f32_4 %299 = OpLoad %298 
                                       f32_3 %300 = OpVectorShuffle %299 %299 3 3 3 
                                       f32_3 %301 = OpFMul %297 %300 
                                       f32_3 %302 = OpLoad %269 
                                       f32_3 %303 = OpFAdd %301 %302 
                                                      OpStore %269 %303 
                                       f32_4 %304 = OpLoad %80 
                                       f32_3 %305 = OpVectorShuffle %304 %304 0 1 2 
                                       f32_3 %308 = OpLoad %307 
                                       f32_3 %309 = OpVectorShuffle %308 %308 1 1 1 
                                       f32_3 %310 = OpFMul %305 %309 
                                       f32_4 %311 = OpLoad %80 
                                       f32_4 %312 = OpVectorShuffle %311 %310 4 5 6 3 
                                                      OpStore %80 %312 
                                       f32_4 %313 = OpLoad %9 
                                       f32_3 %314 = OpVectorShuffle %313 %313 0 1 2 
                                       f32_3 %315 = OpLoad %307 
                                       f32_3 %316 = OpVectorShuffle %315 %315 0 0 0 
                                       f32_3 %317 = OpFMul %314 %316 
                                       f32_4 %318 = OpLoad %80 
                                       f32_3 %319 = OpVectorShuffle %318 %318 0 1 2 
                                       f32_3 %320 = OpFAdd %317 %319 
                                       f32_4 %321 = OpLoad %9 
                                       f32_4 %322 = OpVectorShuffle %321 %320 4 5 6 3 
                                                      OpStore %9 %322 
                                       f32_3 %323 = OpLoad %127 
                                       f32_3 %324 = OpLoad %307 
                                       f32_3 %325 = OpVectorShuffle %324 %324 2 2 2 
                                       f32_3 %326 = OpFMul %323 %325 
                                       f32_4 %327 = OpLoad %9 
                                       f32_3 %328 = OpVectorShuffle %327 %327 0 1 2 
                                       f32_3 %329 = OpFAdd %326 %328 
                                       f32_4 %330 = OpLoad %9 
                                       f32_4 %331 = OpVectorShuffle %330 %329 4 5 6 3 
                                                      OpStore %9 %331 
                                       f32_3 %332 = OpLoad %162 
                                       f32_4 %333 = OpLoad %9 
                                       f32_3 %334 = OpVectorShuffle %333 %333 0 1 2 
                                       f32_3 %335 = OpFAdd %332 %334 
                                       f32_4 %336 = OpLoad %9 
                                       f32_4 %337 = OpVectorShuffle %336 %335 4 5 6 3 
                                                      OpStore %9 %337 
                                       f32_3 %338 = OpLoad %197 
                                       f32_3 %340 = OpLoad %339 
                                         f32 %341 = OpDot %338 %340 
                                Private f32* %344 = OpAccessChain %80 %342 
                                                      OpStore %344 %341 
                                       f32_3 %345 = OpLoad %234 
                                       f32_3 %346 = OpLoad %339 
                                         f32 %347 = OpDot %345 %346 
                                Private f32* %349 = OpAccessChain %80 %348 
                                                      OpStore %349 %347 
                                       f32_3 %350 = OpLoad %269 
                                       f32_3 %351 = OpLoad %339 
                                         f32 %352 = OpDot %350 %351 
                                Private f32* %354 = OpAccessChain %80 %353 
                                                      OpStore %354 %352 
                                       f32_4 %356 = OpLoad %80 
                                       f32_3 %357 = OpVectorShuffle %356 %356 0 1 2 
                                       f32_4 %358 = OpLoad %80 
                                       f32_3 %359 = OpVectorShuffle %358 %358 0 1 2 
                                         f32 %360 = OpDot %357 %359 
                                                      OpStore %355 %360 
                                         f32 %361 = OpLoad %355 
                                         f32 %362 = OpExtInst %1 32 %361 
                                                      OpStore %355 %362 
                                         f32 %363 = OpLoad %355 
                                       f32_3 %364 = OpCompositeConstruct %363 %363 %363 
                                       f32_4 %365 = OpLoad %80 
                                       f32_3 %366 = OpVectorShuffle %365 %365 0 1 2 
                                       f32_3 %367 = OpFMul %364 %366 
                                       f32_4 %368 = OpLoad %80 
                                       f32_4 %369 = OpVectorShuffle %368 %367 4 5 6 3 
                                                      OpStore %80 %369 
                              Uniform f32_4* %372 = OpAccessChain %26 %371 
                                       f32_4 %373 = OpLoad %372 
                                       f32_3 %374 = OpVectorShuffle %373 %373 0 1 2 
                                                      OpStore %370 %374 
                                                      OpStore %376 %28 
                                                      OpBranch %377 
                                             %377 = OpLabel 
                                                      OpLoopMerge %379 %380 None 
                                                      OpBranch %381 
                                             %381 = OpLabel 
                                         i32 %382 = OpLoad %376 
                                Uniform i32* %385 = OpAccessChain %26 %383 %342 
                                         i32 %386 = OpLoad %385 
                                        bool %388 = OpSLessThan %382 %386 
                                                      OpBranchConditional %388 %378 %379 
                                             %378 = OpLabel 
                                       f32_4 %389 = OpLoad %9 
                                       f32_3 %390 = OpVectorShuffle %389 %389 0 1 2 
                                       f32_3 %391 = OpFNegate %390 
                                         i32 %392 = OpLoad %376 
                              Uniform f32_4* %393 = OpAccessChain %26 %35 %392 
                                       f32_4 %394 = OpLoad %393 
                                       f32_3 %395 = OpVectorShuffle %394 %394 3 3 3 
                                       f32_3 %396 = OpFMul %391 %395 
                                         i32 %397 = OpLoad %376 
                              Uniform f32_4* %398 = OpAccessChain %26 %35 %397 
                                       f32_4 %399 = OpLoad %398 
                                       f32_3 %400 = OpVectorShuffle %399 %399 0 1 2 
                                       f32_3 %401 = OpFAdd %396 %400 
                                                      OpStore %127 %401 
                                       f32_3 %403 = OpLoad %127 
                                       f32_3 %404 = OpLoad %127 
                                         f32 %405 = OpDot %403 %404 
                                                      OpStore %402 %405 
                                         i32 %407 = OpLoad %376 
                                Uniform f32* %409 = OpAccessChain %26 %54 %407 %353 
                                         f32 %410 = OpLoad %409 
                                         f32 %411 = OpLoad %402 
                                         f32 %412 = OpFMul %410 %411 
                                         f32 %414 = OpFAdd %412 %413 
                                                      OpStore %406 %414 
                                         f32 %415 = OpLoad %406 
                                         f32 %416 = OpFDiv %413 %415 
                                                      OpStore %406 %416 
                                         i32 %420 = OpLoad %376 
                                Uniform f32* %422 = OpAccessChain %26 %35 %420 %421 
                                         f32 %423 = OpLoad %422 
                                        bool %424 = OpFOrdNotEqual %419 %423 
                                                      OpStore %418 %424 
                                         i32 %426 = OpLoad %376 
                                Uniform f32* %427 = OpAccessChain %26 %54 %426 %421 
                                         f32 %428 = OpLoad %427 
                                         f32 %429 = OpLoad %402 
                                        bool %430 = OpFOrdLessThan %428 %429 
                                                      OpStore %425 %430 
                                        bool %431 = OpLoad %425 
                                        bool %432 = OpLoad %418 
                                        bool %433 = OpLogicalAnd %431 %432 
                                                      OpStore %418 %433 
                                        bool %435 = OpLoad %418 
                                         f32 %436 = OpLoad %406 
                                         f32 %437 = OpSelect %435 %419 %436 
                                                      OpStore %434 %437 
                                         f32 %438 = OpLoad %402 
                                         f32 %440 = OpExtInst %1 40 %438 %439 
                                                      OpStore %402 %440 
                                         f32 %441 = OpLoad %402 
                                         f32 %442 = OpExtInst %1 32 %441 
                                                      OpStore %402 %442 
                                         f32 %443 = OpLoad %402 
                                       f32_3 %444 = OpCompositeConstruct %443 %443 %443 
                                       f32_3 %445 = OpLoad %127 
                                       f32_3 %446 = OpFMul %444 %445 
                                                      OpStore %127 %446 
                                       f32_3 %447 = OpLoad %127 
                                         i32 %448 = OpLoad %376 
                              Uniform f32_4* %449 = OpAccessChain %26 %67 %448 
                                       f32_4 %450 = OpLoad %449 
                                       f32_3 %451 = OpVectorShuffle %450 %450 0 1 2 
                                         f32 %452 = OpDot %447 %451 
                                                      OpStore %402 %452 
                                         f32 %453 = OpLoad %402 
                                         f32 %454 = OpExtInst %1 40 %453 %419 
                                                      OpStore %402 %454 
                                         f32 %456 = OpLoad %402 
                                         i32 %457 = OpLoad %376 
                                Uniform f32* %458 = OpAccessChain %26 %54 %457 %342 
                                         f32 %459 = OpLoad %458 
                                         f32 %460 = OpFNegate %459 
                                         f32 %461 = OpFAdd %456 %460 
                                Private f32* %462 = OpAccessChain %455 %342 
                                                      OpStore %462 %461 
                                Private f32* %463 = OpAccessChain %455 %342 
                                         f32 %464 = OpLoad %463 
                                         i32 %465 = OpLoad %376 
                                Uniform f32* %466 = OpAccessChain %26 %54 %465 %348 
                                         f32 %467 = OpLoad %466 
                                         f32 %468 = OpFMul %464 %467 
                                Private f32* %469 = OpAccessChain %455 %342 
                                                      OpStore %469 %468 
                                Private f32* %470 = OpAccessChain %455 %342 
                                         f32 %471 = OpLoad %470 
                                         f32 %472 = OpExtInst %1 43 %471 %419 %413 
                                Private f32* %473 = OpAccessChain %455 %342 
                                                      OpStore %473 %472 
                                         f32 %474 = OpLoad %434 
                                Private f32* %475 = OpAccessChain %455 %342 
                                         f32 %476 = OpLoad %475 
                                         f32 %477 = OpFMul %474 %476 
                                                      OpStore %434 %477 
                                         f32 %478 = OpLoad %434 
                                         f32 %480 = OpFMul %478 %479 
                                                      OpStore %434 %480 
                                       f32_4 %481 = OpLoad %80 
                                       f32_3 %482 = OpVectorShuffle %481 %481 0 1 2 
                                       f32_3 %483 = OpLoad %127 
                                         f32 %484 = OpDot %482 %483 
                                Private f32* %485 = OpAccessChain %455 %342 
                                                      OpStore %485 %484 
                                Private f32* %486 = OpAccessChain %455 %342 
                                         f32 %487 = OpLoad %486 
                                         f32 %488 = OpExtInst %1 40 %487 %419 
                                Private f32* %489 = OpAccessChain %455 %342 
                                                      OpStore %489 %488 
                                       f32_3 %490 = OpLoad %455 
                                       f32_3 %491 = OpVectorShuffle %490 %490 0 0 0 
                                         i32 %492 = OpLoad %376 
                              Uniform f32_4* %493 = OpAccessChain %26 %28 %492 
                                       f32_4 %494 = OpLoad %493 
                                       f32_3 %495 = OpVectorShuffle %494 %494 0 1 2 
                                       f32_3 %496 = OpFMul %491 %495 
                                                      OpStore %455 %496 
                                         f32 %497 = OpLoad %434 
                                       f32_3 %498 = OpCompositeConstruct %497 %497 %497 
                                       f32_3 %499 = OpLoad %455 
                                       f32_3 %500 = OpFMul %498 %499 
                                                      OpStore %455 %500 
                                       f32_3 %501 = OpLoad %455 
                                       f32_3 %503 = OpExtInst %1 37 %501 %502 
                                                      OpStore %455 %503 
                                       f32_3 %504 = OpLoad %370 
                                       f32_3 %505 = OpLoad %455 
                                       f32_3 %506 = OpFAdd %504 %505 
                                                      OpStore %370 %506 
                                                      OpBranch %380 
                                             %380 = OpLabel 
                                         i32 %507 = OpLoad %376 
                                         i32 %508 = OpIAdd %507 %35 
                                                      OpStore %376 %508 
                                                      OpBranch %377 
                                             %379 = OpLabel 
                                       f32_3 %511 = OpLoad %370 
                                       f32_4 %512 = OpLoad %510 
                                       f32_4 %513 = OpVectorShuffle %512 %511 4 5 6 3 
                                                      OpStore %510 %513 
                                       f32_4 %514 = OpLoad %510 
                                       f32_3 %515 = OpVectorShuffle %514 %514 0 1 2 
                                       f32_3 %516 = OpCompositeConstruct %419 %419 %419 
                                       f32_3 %517 = OpCompositeConstruct %413 %413 %413 
                                       f32_3 %518 = OpExtInst %1 43 %515 %516 %517 
                                       f32_4 %519 = OpLoad %510 
                                       f32_4 %520 = OpVectorShuffle %519 %518 4 5 6 3 
                                                      OpStore %510 %520 
                                       f32_3 %525 = OpLoad %524 
                                       f32_2 %526 = OpVectorShuffle %525 %525 0 1 
                              Uniform f32_4* %528 = OpAccessChain %26 %527 
                                       f32_4 %529 = OpLoad %528 
                                       f32_2 %530 = OpVectorShuffle %529 %529 0 1 
                                       f32_2 %531 = OpFMul %526 %530 
                              Uniform f32_4* %532 = OpAccessChain %26 %527 
                                       f32_4 %533 = OpLoad %532 
                                       f32_2 %534 = OpVectorShuffle %533 %533 2 3 
                                       f32_2 %535 = OpFAdd %531 %534 
                                                      OpStore vs_TEXCOORD0 %535 
                                       f32_3 %536 = OpLoad %307 
                                       f32_4 %537 = OpVectorShuffle %536 %536 1 1 1 1 
                              Uniform f32_4* %538 = OpAccessChain %26 %27 %35 
                                       f32_4 %539 = OpLoad %538 
                                       f32_4 %540 = OpFMul %537 %539 
                                                      OpStore %9 %540 
                              Uniform f32_4* %541 = OpAccessChain %26 %27 %28 
                                       f32_4 %542 = OpLoad %541 
                                       f32_3 %543 = OpLoad %307 
                                       f32_4 %544 = OpVectorShuffle %543 %543 0 0 0 0 
                                       f32_4 %545 = OpFMul %542 %544 
                                       f32_4 %546 = OpLoad %9 
                                       f32_4 %547 = OpFAdd %545 %546 
                                                      OpStore %9 %547 
                              Uniform f32_4* %548 = OpAccessChain %26 %27 %54 
                                       f32_4 %549 = OpLoad %548 
                                       f32_3 %550 = OpLoad %307 
                                       f32_4 %551 = OpVectorShuffle %550 %550 2 2 2 2 
                                       f32_4 %552 = OpFMul %549 %551 
                                       f32_4 %553 = OpLoad %9 
                                       f32_4 %554 = OpFAdd %552 %553 
                                                      OpStore %9 %554 
                                       f32_4 %555 = OpLoad %9 
                              Uniform f32_4* %556 = OpAccessChain %26 %27 %67 
                                       f32_4 %557 = OpLoad %556 
                                       f32_4 %558 = OpFAdd %555 %557 
                                                      OpStore %9 %558 
                                       f32_4 %559 = OpLoad %9 
                                       f32_4 %560 = OpVectorShuffle %559 %559 1 1 1 1 
                              Uniform f32_4* %562 = OpAccessChain %26 %561 %35 
                                       f32_4 %563 = OpLoad %562 
                                       f32_4 %564 = OpFMul %560 %563 
                                                      OpStore %80 %564 
                              Uniform f32_4* %565 = OpAccessChain %26 %561 %28 
                                       f32_4 %566 = OpLoad %565 
                                       f32_4 %567 = OpLoad %9 
                                       f32_4 %568 = OpVectorShuffle %567 %567 0 0 0 0 
                                       f32_4 %569 = OpFMul %566 %568 
                                       f32_4 %570 = OpLoad %80 
                                       f32_4 %571 = OpFAdd %569 %570 
                                                      OpStore %80 %571 
                              Uniform f32_4* %572 = OpAccessChain %26 %561 %54 
                                       f32_4 %573 = OpLoad %572 
                                       f32_4 %574 = OpLoad %9 
                                       f32_4 %575 = OpVectorShuffle %574 %574 2 2 2 2 
                                       f32_4 %576 = OpFMul %573 %575 
                                       f32_4 %577 = OpLoad %80 
                                       f32_4 %578 = OpFAdd %576 %577 
                                                      OpStore %80 %578 
                              Uniform f32_4* %583 = OpAccessChain %26 %561 %67 
                                       f32_4 %584 = OpLoad %583 
                                       f32_4 %585 = OpLoad %9 
                                       f32_4 %586 = OpVectorShuffle %585 %585 3 3 3 3 
                                       f32_4 %587 = OpFMul %584 %586 
                                       f32_4 %588 = OpLoad %80 
                                       f32_4 %589 = OpFAdd %587 %588 
                               Output f32_4* %590 = OpAccessChain %582 %28 
                                                      OpStore %590 %589 
                                 Output f32* %592 = OpAccessChain %510 %421 
                                                      OpStore %592 %413 
                                 Output f32* %593 = OpAccessChain %582 %28 %348 
                                         f32 %594 = OpLoad %593 
                                         f32 %595 = OpFNegate %594 
                                 Output f32* %596 = OpAccessChain %582 %28 %348 
                                                      OpStore %596 %595 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 47
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %30 %35 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %9 RelaxedPrecision 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %13 RelaxedPrecision 
                                             OpDecorate %16 RelaxedPrecision 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %17 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %26 RelaxedPrecision 
                                             OpDecorate %27 RelaxedPrecision 
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %30 RelaxedPrecision 
                                             OpDecorate %30 Location 30 
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate %33 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %35 Location 35 
                                             OpDecorate %36 RelaxedPrecision 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %24 = OpTypeVector %6 4 
                      Private f32_3* %27 = OpVariable Private 
                                     %29 = OpTypePointer Input %24 
                        Input f32_4* %30 = OpVariable Input 
                                     %34 = OpTypePointer Output %24 
                       Output f32_4* %35 = OpVariable Output 
                                 f32 %41 = OpConstant 3.674022E-40 
                                     %42 = OpTypeInt 32 0 
                                 u32 %43 = OpConstant 3 
                                     %44 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
                                             OpStore %9 %26 
                               f32_3 %28 = OpLoad %9 
                               f32_4 %31 = OpLoad %30 
                               f32_3 %32 = OpVectorShuffle %31 %31 0 1 2 
                               f32_3 %33 = OpFMul %28 %32 
                                             OpStore %27 %33 
                               f32_3 %36 = OpLoad %27 
                               f32_3 %37 = OpLoad %27 
                               f32_3 %38 = OpFAdd %36 %37 
                               f32_4 %39 = OpLoad %35 
                               f32_4 %40 = OpVectorShuffle %39 %38 4 5 6 3 
                                             OpStore %35 %40 
                         Output f32* %45 = OpAccessChain %35 %43 
                                             OpStore %45 %41 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "SPOT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 601
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %307 %339 %510 %523 %524 %582 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpDecorate %21 ArrayStride 21 
                                                      OpMemberDecorate %24 0 RelaxedPrecision 
                                                      OpMemberDecorate %24 0 Offset 24 
                                                      OpMemberDecorate %24 1 Offset 24 
                                                      OpMemberDecorate %24 2 RelaxedPrecision 
                                                      OpMemberDecorate %24 2 Offset 24 
                                                      OpMemberDecorate %24 3 Offset 24 
                                                      OpMemberDecorate %24 4 Offset 24 
                                                      OpMemberDecorate %24 5 Offset 24 
                                                      OpMemberDecorate %24 6 RelaxedPrecision 
                                                      OpMemberDecorate %24 6 Offset 24 
                                                      OpMemberDecorate %24 7 Offset 24 
                                                      OpMemberDecorate %24 8 Offset 24 
                                                      OpMemberDecorate %24 9 Offset 24 
                                                      OpMemberDecorate %24 10 Offset 24 
                                                      OpMemberDecorate %24 11 Offset 24 
                                                      OpDecorate %24 Block 
                                                      OpDecorate %26 DescriptorSet 26 
                                                      OpDecorate %26 Binding 26 
                                                      OpDecorate %307 Location 307 
                                                      OpDecorate %339 Location 339 
                                                      OpDecorate %370 RelaxedPrecision 
                                                      OpDecorate %373 RelaxedPrecision 
                                                      OpDecorate %374 RelaxedPrecision 
                                                      OpDecorate %410 RelaxedPrecision 
                                                      OpDecorate %428 RelaxedPrecision 
                                                      OpDecorate %434 RelaxedPrecision 
                                                      OpDecorate %455 RelaxedPrecision 
                                                      OpDecorate %459 RelaxedPrecision 
                                                      OpDecorate %460 RelaxedPrecision 
                                                      OpDecorate %464 RelaxedPrecision 
                                                      OpDecorate %467 RelaxedPrecision 
                                                      OpDecorate %468 RelaxedPrecision 
                                                      OpDecorate %471 RelaxedPrecision 
                                                      OpDecorate %472 RelaxedPrecision 
                                                      OpDecorate %474 RelaxedPrecision 
                                                      OpDecorate %476 RelaxedPrecision 
                                                      OpDecorate %477 RelaxedPrecision 
                                                      OpDecorate %478 RelaxedPrecision 
                                                      OpDecorate %480 RelaxedPrecision 
                                                      OpDecorate %487 RelaxedPrecision 
                                                      OpDecorate %488 RelaxedPrecision 
                                                      OpDecorate %490 RelaxedPrecision 
                                                      OpDecorate %491 RelaxedPrecision 
                                                      OpDecorate %494 RelaxedPrecision 
                                                      OpDecorate %495 RelaxedPrecision 
                                                      OpDecorate %496 RelaxedPrecision 
                                                      OpDecorate %497 RelaxedPrecision 
                                                      OpDecorate %498 RelaxedPrecision 
                                                      OpDecorate %499 RelaxedPrecision 
                                                      OpDecorate %500 RelaxedPrecision 
                                                      OpDecorate %501 RelaxedPrecision 
                                                      OpDecorate %503 RelaxedPrecision 
                                                      OpDecorate %504 RelaxedPrecision 
                                                      OpDecorate %505 RelaxedPrecision 
                                                      OpDecorate %506 RelaxedPrecision 
                                                      OpDecorate %510 RelaxedPrecision 
                                                      OpDecorate %510 Location 510 
                                                      OpDecorate %511 RelaxedPrecision 
                                                      OpDecorate %514 RelaxedPrecision 
                                                      OpDecorate %515 RelaxedPrecision 
                                                      OpDecorate %516 RelaxedPrecision 
                                                      OpDecorate %517 RelaxedPrecision 
                                                      OpDecorate %518 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 523 
                                                      OpDecorate %524 Location 524 
                                                      OpMemberDecorate %580 0 BuiltIn 580 
                                                      OpMemberDecorate %580 1 BuiltIn 580 
                                                      OpMemberDecorate %580 2 BuiltIn 580 
                                                      OpDecorate %580 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 8 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                              %14 = OpTypeArray %7 %11 
                                              %15 = OpTypeArray %7 %11 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeArray %7 %16 
                                              %20 = OpTypeArray %7 %16 
                                              %21 = OpTypeArray %7 %16 
                                              %22 = OpTypeInt 32 1 
                                              %23 = OpTypeVector %22 4 
                                              %24 = OpTypeStruct %12 %13 %14 %15 %17 %18 %7 %19 %20 %21 %23 %7 
                                              %25 = OpTypePointer Uniform %24 
Uniform struct {f32_4[8]; f32_4[8]; f32_4[8]; f32_4[8]; f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4[4]; f32_4[4]; i32_4; f32_4;}* %26 = OpVariable Uniform 
                                          i32 %27 = OpConstant 4 
                                          i32 %28 = OpConstant 0 
                                              %29 = OpTypeVector %6 3 
                                              %30 = OpTypePointer Uniform %7 
                                          i32 %34 = OpConstant 7 
                                          i32 %35 = OpConstant 1 
                                          i32 %54 = OpConstant 2 
                                          i32 %67 = OpConstant 3 
                               Private f32_4* %80 = OpVariable Private 
                                             %126 = OpTypePointer Private %29 
                              Private f32_3* %127 = OpVariable Private 
                              Private f32_3* %162 = OpVariable Private 
                              Private f32_3* %197 = OpVariable Private 
                                         i32 %198 = OpConstant 5 
                                         i32 %202 = OpConstant 8 
                              Private f32_3* %234 = OpVariable Private 
                              Private f32_3* %269 = OpVariable Private 
                                             %306 = OpTypePointer Input %29 
                                Input f32_3* %307 = OpVariable Input 
                                Input f32_3* %339 = OpVariable Input 
                                         u32 %342 = OpConstant 0 
                                             %343 = OpTypePointer Private %6 
                                         u32 %348 = OpConstant 1 
                                         u32 %353 = OpConstant 2 
                                Private f32* %355 = OpVariable Private 
                              Private f32_3* %370 = OpVariable Private 
                                         i32 %371 = OpConstant 6 
                                             %375 = OpTypePointer Function %22 
                                         i32 %383 = OpConstant 10 
                                             %384 = OpTypePointer Uniform %22 
                                             %387 = OpTypeBool 
                                Private f32* %402 = OpVariable Private 
                                Private f32* %406 = OpVariable Private 
                                             %408 = OpTypePointer Uniform %6 
                                         f32 %413 = OpConstant 3.674022E-40 
                                             %417 = OpTypePointer Private %387 
                               Private bool* %418 = OpVariable Private 
                                         f32 %419 = OpConstant 3.674022E-40 
                                         u32 %421 = OpConstant 3 
                               Private bool* %425 = OpVariable Private 
                                Private f32* %434 = OpVariable Private 
                                         f32 %439 = OpConstant 3.674022E-40 
                              Private f32_3* %455 = OpVariable Private 
                                         f32 %479 = OpConstant 3.674022E-40 
                                       f32_3 %502 = OpConstantComposite %413 %413 %413 
                                             %509 = OpTypePointer Output %7 
                               Output f32_4* %510 = OpVariable Output 
                                             %521 = OpTypeVector %6 2 
                                             %522 = OpTypePointer Output %521 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_3* %524 = OpVariable Input 
                                         i32 %527 = OpConstant 11 
                                         i32 %561 = OpConstant 9 
                                             %579 = OpTypeArray %6 %348 
                                             %580 = OpTypeStruct %7 %6 %579 
                                             %581 = OpTypePointer Output %580 
        Output struct {f32_4; f32; f32[1];}* %582 = OpVariable Output 
                                             %591 = OpTypePointer Output %6 
                                             %598 = OpTypePointer Private %22 
                                Private i32* %599 = OpVariable Private 
                               Private bool* %600 = OpVariable Private 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function i32* %376 = OpVariable Function 
                               Uniform f32_4* %31 = OpAccessChain %26 %27 %28 
                                        f32_4 %32 = OpLoad %31 
                                        f32_3 %33 = OpVectorShuffle %32 %32 1 1 1 
                               Uniform f32_4* %36 = OpAccessChain %26 %34 %35 
                                        f32_4 %37 = OpLoad %36 
                                        f32_3 %38 = OpVectorShuffle %37 %37 0 1 2 
                                        f32_3 %39 = OpFMul %33 %38 
                                        f32_4 %40 = OpLoad %9 
                                        f32_4 %41 = OpVectorShuffle %40 %39 4 5 6 3 
                                                      OpStore %9 %41 
                               Uniform f32_4* %42 = OpAccessChain %26 %34 %28 
                                        f32_4 %43 = OpLoad %42 
                                        f32_3 %44 = OpVectorShuffle %43 %43 0 1 2 
                               Uniform f32_4* %45 = OpAccessChain %26 %27 %28 
                                        f32_4 %46 = OpLoad %45 
                                        f32_3 %47 = OpVectorShuffle %46 %46 0 0 0 
                                        f32_3 %48 = OpFMul %44 %47 
                                        f32_4 %49 = OpLoad %9 
                                        f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
                                        f32_3 %51 = OpFAdd %48 %50 
                                        f32_4 %52 = OpLoad %9 
                                        f32_4 %53 = OpVectorShuffle %52 %51 4 5 6 3 
                                                      OpStore %9 %53 
                               Uniform f32_4* %55 = OpAccessChain %26 %34 %54 
                                        f32_4 %56 = OpLoad %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                               Uniform f32_4* %58 = OpAccessChain %26 %27 %28 
                                        f32_4 %59 = OpLoad %58 
                                        f32_3 %60 = OpVectorShuffle %59 %59 2 2 2 
                                        f32_3 %61 = OpFMul %57 %60 
                                        f32_4 %62 = OpLoad %9 
                                        f32_3 %63 = OpVectorShuffle %62 %62 0 1 2 
                                        f32_3 %64 = OpFAdd %61 %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpVectorShuffle %65 %64 4 5 6 3 
                                                      OpStore %9 %66 
                               Uniform f32_4* %68 = OpAccessChain %26 %34 %67 
                                        f32_4 %69 = OpLoad %68 
                                        f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                               Uniform f32_4* %71 = OpAccessChain %26 %27 %28 
                                        f32_4 %72 = OpLoad %71 
                                        f32_3 %73 = OpVectorShuffle %72 %72 3 3 3 
                                        f32_3 %74 = OpFMul %70 %73 
                                        f32_4 %75 = OpLoad %9 
                                        f32_3 %76 = OpVectorShuffle %75 %75 0 1 2 
                                        f32_3 %77 = OpFAdd %74 %76 
                                        f32_4 %78 = OpLoad %9 
                                        f32_4 %79 = OpVectorShuffle %78 %77 4 5 6 3 
                                                      OpStore %9 %79 
                               Uniform f32_4* %81 = OpAccessChain %26 %27 %35 
                                        f32_4 %82 = OpLoad %81 
                                        f32_3 %83 = OpVectorShuffle %82 %82 1 1 1 
                               Uniform f32_4* %84 = OpAccessChain %26 %34 %35 
                                        f32_4 %85 = OpLoad %84 
                                        f32_3 %86 = OpVectorShuffle %85 %85 0 1 2 
                                        f32_3 %87 = OpFMul %83 %86 
                                        f32_4 %88 = OpLoad %80 
                                        f32_4 %89 = OpVectorShuffle %88 %87 4 5 6 3 
                                                      OpStore %80 %89 
                               Uniform f32_4* %90 = OpAccessChain %26 %34 %28 
                                        f32_4 %91 = OpLoad %90 
                                        f32_3 %92 = OpVectorShuffle %91 %91 0 1 2 
                               Uniform f32_4* %93 = OpAccessChain %26 %27 %35 
                                        f32_4 %94 = OpLoad %93 
                                        f32_3 %95 = OpVectorShuffle %94 %94 0 0 0 
                                        f32_3 %96 = OpFMul %92 %95 
                                        f32_4 %97 = OpLoad %80 
                                        f32_3 %98 = OpVectorShuffle %97 %97 0 1 2 
                                        f32_3 %99 = OpFAdd %96 %98 
                                       f32_4 %100 = OpLoad %80 
                                       f32_4 %101 = OpVectorShuffle %100 %99 4 5 6 3 
                                                      OpStore %80 %101 
                              Uniform f32_4* %102 = OpAccessChain %26 %34 %54 
                                       f32_4 %103 = OpLoad %102 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                              Uniform f32_4* %105 = OpAccessChain %26 %27 %35 
                                       f32_4 %106 = OpLoad %105 
                                       f32_3 %107 = OpVectorShuffle %106 %106 2 2 2 
                                       f32_3 %108 = OpFMul %104 %107 
                                       f32_4 %109 = OpLoad %80 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                                       f32_3 %111 = OpFAdd %108 %110 
                                       f32_4 %112 = OpLoad %80 
                                       f32_4 %113 = OpVectorShuffle %112 %111 4 5 6 3 
                                                      OpStore %80 %113 
                              Uniform f32_4* %114 = OpAccessChain %26 %34 %67 
                                       f32_4 %115 = OpLoad %114 
                                       f32_3 %116 = OpVectorShuffle %115 %115 0 1 2 
                              Uniform f32_4* %117 = OpAccessChain %26 %27 %35 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 3 3 3 
                                       f32_3 %120 = OpFMul %116 %119 
                                       f32_4 %121 = OpLoad %80 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                       f32_3 %123 = OpFAdd %120 %122 
                                       f32_4 %124 = OpLoad %80 
                                       f32_4 %125 = OpVectorShuffle %124 %123 4 5 6 3 
                                                      OpStore %80 %125 
                              Uniform f32_4* %128 = OpAccessChain %26 %27 %54 
                                       f32_4 %129 = OpLoad %128 
                                       f32_3 %130 = OpVectorShuffle %129 %129 1 1 1 
                              Uniform f32_4* %131 = OpAccessChain %26 %34 %35 
                                       f32_4 %132 = OpLoad %131 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                       f32_3 %134 = OpFMul %130 %133 
                                                      OpStore %127 %134 
                              Uniform f32_4* %135 = OpAccessChain %26 %34 %28 
                                       f32_4 %136 = OpLoad %135 
                                       f32_3 %137 = OpVectorShuffle %136 %136 0 1 2 
                              Uniform f32_4* %138 = OpAccessChain %26 %27 %54 
                                       f32_4 %139 = OpLoad %138 
                                       f32_3 %140 = OpVectorShuffle %139 %139 0 0 0 
                                       f32_3 %141 = OpFMul %137 %140 
                                       f32_3 %142 = OpLoad %127 
                                       f32_3 %143 = OpFAdd %141 %142 
                                                      OpStore %127 %143 
                              Uniform f32_4* %144 = OpAccessChain %26 %34 %54 
                                       f32_4 %145 = OpLoad %144 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                              Uniform f32_4* %147 = OpAccessChain %26 %27 %54 
                                       f32_4 %148 = OpLoad %147 
                                       f32_3 %149 = OpVectorShuffle %148 %148 2 2 2 
                                       f32_3 %150 = OpFMul %146 %149 
                                       f32_3 %151 = OpLoad %127 
                                       f32_3 %152 = OpFAdd %150 %151 
                                                      OpStore %127 %152 
                              Uniform f32_4* %153 = OpAccessChain %26 %34 %67 
                                       f32_4 %154 = OpLoad %153 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 1 2 
                              Uniform f32_4* %156 = OpAccessChain %26 %27 %54 
                                       f32_4 %157 = OpLoad %156 
                                       f32_3 %158 = OpVectorShuffle %157 %157 3 3 3 
                                       f32_3 %159 = OpFMul %155 %158 
                                       f32_3 %160 = OpLoad %127 
                                       f32_3 %161 = OpFAdd %159 %160 
                                                      OpStore %127 %161 
                              Uniform f32_4* %163 = OpAccessChain %26 %27 %67 
                                       f32_4 %164 = OpLoad %163 
                                       f32_3 %165 = OpVectorShuffle %164 %164 1 1 1 
                              Uniform f32_4* %166 = OpAccessChain %26 %34 %35 
                                       f32_4 %167 = OpLoad %166 
                                       f32_3 %168 = OpVectorShuffle %167 %167 0 1 2 
                                       f32_3 %169 = OpFMul %165 %168 
                                                      OpStore %162 %169 
                              Uniform f32_4* %170 = OpAccessChain %26 %34 %28 
                                       f32_4 %171 = OpLoad %170 
                                       f32_3 %172 = OpVectorShuffle %171 %171 0 1 2 
                              Uniform f32_4* %173 = OpAccessChain %26 %27 %67 
                                       f32_4 %174 = OpLoad %173 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 0 0 
                                       f32_3 %176 = OpFMul %172 %175 
                                       f32_3 %177 = OpLoad %162 
                                       f32_3 %178 = OpFAdd %176 %177 
                                                      OpStore %162 %178 
                              Uniform f32_4* %179 = OpAccessChain %26 %34 %54 
                                       f32_4 %180 = OpLoad %179 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                              Uniform f32_4* %182 = OpAccessChain %26 %27 %67 
                                       f32_4 %183 = OpLoad %182 
                                       f32_3 %184 = OpVectorShuffle %183 %183 2 2 2 
                                       f32_3 %185 = OpFMul %181 %184 
                                       f32_3 %186 = OpLoad %162 
                                       f32_3 %187 = OpFAdd %185 %186 
                                                      OpStore %162 %187 
                              Uniform f32_4* %188 = OpAccessChain %26 %34 %67 
                                       f32_4 %189 = OpLoad %188 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                              Uniform f32_4* %191 = OpAccessChain %26 %27 %67 
                                       f32_4 %192 = OpLoad %191 
                                       f32_3 %193 = OpVectorShuffle %192 %192 3 3 3 
                                       f32_3 %194 = OpFMul %190 %193 
                                       f32_3 %195 = OpLoad %162 
                                       f32_3 %196 = OpFAdd %194 %195 
                                                      OpStore %162 %196 
                              Uniform f32_4* %199 = OpAccessChain %26 %198 %35 
                                       f32_4 %200 = OpLoad %199 
                                       f32_3 %201 = OpVectorShuffle %200 %200 0 1 2 
                              Uniform f32_4* %203 = OpAccessChain %26 %202 %28 
                                       f32_4 %204 = OpLoad %203 
                                       f32_3 %205 = OpVectorShuffle %204 %204 1 1 1 
                                       f32_3 %206 = OpFMul %201 %205 
                                                      OpStore %197 %206 
                              Uniform f32_4* %207 = OpAccessChain %26 %198 %28 
                                       f32_4 %208 = OpLoad %207 
                                       f32_3 %209 = OpVectorShuffle %208 %208 0 1 2 
                              Uniform f32_4* %210 = OpAccessChain %26 %202 %28 
                                       f32_4 %211 = OpLoad %210 
                                       f32_3 %212 = OpVectorShuffle %211 %211 0 0 0 
                                       f32_3 %213 = OpFMul %209 %212 
                                       f32_3 %214 = OpLoad %197 
                                       f32_3 %215 = OpFAdd %213 %214 
                                                      OpStore %197 %215 
                              Uniform f32_4* %216 = OpAccessChain %26 %198 %54 
                                       f32_4 %217 = OpLoad %216 
                                       f32_3 %218 = OpVectorShuffle %217 %217 0 1 2 
                              Uniform f32_4* %219 = OpAccessChain %26 %202 %28 
                                       f32_4 %220 = OpLoad %219 
                                       f32_3 %221 = OpVectorShuffle %220 %220 2 2 2 
                                       f32_3 %222 = OpFMul %218 %221 
                                       f32_3 %223 = OpLoad %197 
                                       f32_3 %224 = OpFAdd %222 %223 
                                                      OpStore %197 %224 
                              Uniform f32_4* %225 = OpAccessChain %26 %198 %67 
                                       f32_4 %226 = OpLoad %225 
                                       f32_3 %227 = OpVectorShuffle %226 %226 0 1 2 
                              Uniform f32_4* %228 = OpAccessChain %26 %202 %28 
                                       f32_4 %229 = OpLoad %228 
                                       f32_3 %230 = OpVectorShuffle %229 %229 3 3 3 
                                       f32_3 %231 = OpFMul %227 %230 
                                       f32_3 %232 = OpLoad %197 
                                       f32_3 %233 = OpFAdd %231 %232 
                                                      OpStore %197 %233 
                              Uniform f32_4* %235 = OpAccessChain %26 %198 %35 
                                       f32_4 %236 = OpLoad %235 
                                       f32_3 %237 = OpVectorShuffle %236 %236 0 1 2 
                              Uniform f32_4* %238 = OpAccessChain %26 %202 %35 
                                       f32_4 %239 = OpLoad %238 
                                       f32_3 %240 = OpVectorShuffle %239 %239 1 1 1 
                                       f32_3 %241 = OpFMul %237 %240 
                                                      OpStore %234 %241 
                              Uniform f32_4* %242 = OpAccessChain %26 %198 %28 
                                       f32_4 %243 = OpLoad %242 
                                       f32_3 %244 = OpVectorShuffle %243 %243 0 1 2 
                              Uniform f32_4* %245 = OpAccessChain %26 %202 %35 
                                       f32_4 %246 = OpLoad %245 
                                       f32_3 %247 = OpVectorShuffle %246 %246 0 0 0 
                                       f32_3 %248 = OpFMul %244 %247 
                                       f32_3 %249 = OpLoad %234 
                                       f32_3 %250 = OpFAdd %248 %249 
                                                      OpStore %234 %250 
                              Uniform f32_4* %251 = OpAccessChain %26 %198 %54 
                                       f32_4 %252 = OpLoad %251 
                                       f32_3 %253 = OpVectorShuffle %252 %252 0 1 2 
                              Uniform f32_4* %254 = OpAccessChain %26 %202 %35 
                                       f32_4 %255 = OpLoad %254 
                                       f32_3 %256 = OpVectorShuffle %255 %255 2 2 2 
                                       f32_3 %257 = OpFMul %253 %256 
                                       f32_3 %258 = OpLoad %234 
                                       f32_3 %259 = OpFAdd %257 %258 
                                                      OpStore %234 %259 
                              Uniform f32_4* %260 = OpAccessChain %26 %198 %67 
                                       f32_4 %261 = OpLoad %260 
                                       f32_3 %262 = OpVectorShuffle %261 %261 0 1 2 
                              Uniform f32_4* %263 = OpAccessChain %26 %202 %35 
                                       f32_4 %264 = OpLoad %263 
                                       f32_3 %265 = OpVectorShuffle %264 %264 3 3 3 
                                       f32_3 %266 = OpFMul %262 %265 
                                       f32_3 %267 = OpLoad %234 
                                       f32_3 %268 = OpFAdd %266 %267 
                                                      OpStore %234 %268 
                              Uniform f32_4* %270 = OpAccessChain %26 %198 %35 
                                       f32_4 %271 = OpLoad %270 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 1 2 
                              Uniform f32_4* %273 = OpAccessChain %26 %202 %54 
                                       f32_4 %274 = OpLoad %273 
                                       f32_3 %275 = OpVectorShuffle %274 %274 1 1 1 
                                       f32_3 %276 = OpFMul %272 %275 
                                                      OpStore %269 %276 
                              Uniform f32_4* %277 = OpAccessChain %26 %198 %28 
                                       f32_4 %278 = OpLoad %277 
                                       f32_3 %279 = OpVectorShuffle %278 %278 0 1 2 
                              Uniform f32_4* %280 = OpAccessChain %26 %202 %54 
                                       f32_4 %281 = OpLoad %280 
                                       f32_3 %282 = OpVectorShuffle %281 %281 0 0 0 
                                       f32_3 %283 = OpFMul %279 %282 
                                       f32_3 %284 = OpLoad %269 
                                       f32_3 %285 = OpFAdd %283 %284 
                                                      OpStore %269 %285 
                              Uniform f32_4* %286 = OpAccessChain %26 %198 %54 
                                       f32_4 %287 = OpLoad %286 
                                       f32_3 %288 = OpVectorShuffle %287 %287 0 1 2 
                              Uniform f32_4* %289 = OpAccessChain %26 %202 %54 
                                       f32_4 %290 = OpLoad %289 
                                       f32_3 %291 = OpVectorShuffle %290 %290 2 2 2 
                                       f32_3 %292 = OpFMul %288 %291 
                                       f32_3 %293 = OpLoad %269 
                                       f32_3 %294 = OpFAdd %292 %293 
                                                      OpStore %269 %294 
                              Uniform f32_4* %295 = OpAccessChain %26 %198 %67 
                                       f32_4 %296 = OpLoad %295 
                                       f32_3 %297 = OpVectorShuffle %296 %296 0 1 2 
                              Uniform f32_4* %298 = OpAccessChain %26 %202 %54 
                                       f32_4 %299 = OpLoad %298 
                                       f32_3 %300 = OpVectorShuffle %299 %299 3 3 3 
                                       f32_3 %301 = OpFMul %297 %300 
                                       f32_3 %302 = OpLoad %269 
                                       f32_3 %303 = OpFAdd %301 %302 
                                                      OpStore %269 %303 
                                       f32_4 %304 = OpLoad %80 
                                       f32_3 %305 = OpVectorShuffle %304 %304 0 1 2 
                                       f32_3 %308 = OpLoad %307 
                                       f32_3 %309 = OpVectorShuffle %308 %308 1 1 1 
                                       f32_3 %310 = OpFMul %305 %309 
                                       f32_4 %311 = OpLoad %80 
                                       f32_4 %312 = OpVectorShuffle %311 %310 4 5 6 3 
                                                      OpStore %80 %312 
                                       f32_4 %313 = OpLoad %9 
                                       f32_3 %314 = OpVectorShuffle %313 %313 0 1 2 
                                       f32_3 %315 = OpLoad %307 
                                       f32_3 %316 = OpVectorShuffle %315 %315 0 0 0 
                                       f32_3 %317 = OpFMul %314 %316 
                                       f32_4 %318 = OpLoad %80 
                                       f32_3 %319 = OpVectorShuffle %318 %318 0 1 2 
                                       f32_3 %320 = OpFAdd %317 %319 
                                       f32_4 %321 = OpLoad %9 
                                       f32_4 %322 = OpVectorShuffle %321 %320 4 5 6 3 
                                                      OpStore %9 %322 
                                       f32_3 %323 = OpLoad %127 
                                       f32_3 %324 = OpLoad %307 
                                       f32_3 %325 = OpVectorShuffle %324 %324 2 2 2 
                                       f32_3 %326 = OpFMul %323 %325 
                                       f32_4 %327 = OpLoad %9 
                                       f32_3 %328 = OpVectorShuffle %327 %327 0 1 2 
                                       f32_3 %329 = OpFAdd %326 %328 
                                       f32_4 %330 = OpLoad %9 
                                       f32_4 %331 = OpVectorShuffle %330 %329 4 5 6 3 
                                                      OpStore %9 %331 
                                       f32_3 %332 = OpLoad %162 
                                       f32_4 %333 = OpLoad %9 
                                       f32_3 %334 = OpVectorShuffle %333 %333 0 1 2 
                                       f32_3 %335 = OpFAdd %332 %334 
                                       f32_4 %336 = OpLoad %9 
                                       f32_4 %337 = OpVectorShuffle %336 %335 4 5 6 3 
                                                      OpStore %9 %337 
                                       f32_3 %338 = OpLoad %197 
                                       f32_3 %340 = OpLoad %339 
                                         f32 %341 = OpDot %338 %340 
                                Private f32* %344 = OpAccessChain %80 %342 
                                                      OpStore %344 %341 
                                       f32_3 %345 = OpLoad %234 
                                       f32_3 %346 = OpLoad %339 
                                         f32 %347 = OpDot %345 %346 
                                Private f32* %349 = OpAccessChain %80 %348 
                                                      OpStore %349 %347 
                                       f32_3 %350 = OpLoad %269 
                                       f32_3 %351 = OpLoad %339 
                                         f32 %352 = OpDot %350 %351 
                                Private f32* %354 = OpAccessChain %80 %353 
                                                      OpStore %354 %352 
                                       f32_4 %356 = OpLoad %80 
                                       f32_3 %357 = OpVectorShuffle %356 %356 0 1 2 
                                       f32_4 %358 = OpLoad %80 
                                       f32_3 %359 = OpVectorShuffle %358 %358 0 1 2 
                                         f32 %360 = OpDot %357 %359 
                                                      OpStore %355 %360 
                                         f32 %361 = OpLoad %355 
                                         f32 %362 = OpExtInst %1 32 %361 
                                                      OpStore %355 %362 
                                         f32 %363 = OpLoad %355 
                                       f32_3 %364 = OpCompositeConstruct %363 %363 %363 
                                       f32_4 %365 = OpLoad %80 
                                       f32_3 %366 = OpVectorShuffle %365 %365 0 1 2 
                                       f32_3 %367 = OpFMul %364 %366 
                                       f32_4 %368 = OpLoad %80 
                                       f32_4 %369 = OpVectorShuffle %368 %367 4 5 6 3 
                                                      OpStore %80 %369 
                              Uniform f32_4* %372 = OpAccessChain %26 %371 
                                       f32_4 %373 = OpLoad %372 
                                       f32_3 %374 = OpVectorShuffle %373 %373 0 1 2 
                                                      OpStore %370 %374 
                                                      OpStore %376 %28 
                                                      OpBranch %377 
                                             %377 = OpLabel 
                                                      OpLoopMerge %379 %380 None 
                                                      OpBranch %381 
                                             %381 = OpLabel 
                                         i32 %382 = OpLoad %376 
                                Uniform i32* %385 = OpAccessChain %26 %383 %342 
                                         i32 %386 = OpLoad %385 
                                        bool %388 = OpSLessThan %382 %386 
                                                      OpBranchConditional %388 %378 %379 
                                             %378 = OpLabel 
                                       f32_4 %389 = OpLoad %9 
                                       f32_3 %390 = OpVectorShuffle %389 %389 0 1 2 
                                       f32_3 %391 = OpFNegate %390 
                                         i32 %392 = OpLoad %376 
                              Uniform f32_4* %393 = OpAccessChain %26 %35 %392 
                                       f32_4 %394 = OpLoad %393 
                                       f32_3 %395 = OpVectorShuffle %394 %394 3 3 3 
                                       f32_3 %396 = OpFMul %391 %395 
                                         i32 %397 = OpLoad %376 
                              Uniform f32_4* %398 = OpAccessChain %26 %35 %397 
                                       f32_4 %399 = OpLoad %398 
                                       f32_3 %400 = OpVectorShuffle %399 %399 0 1 2 
                                       f32_3 %401 = OpFAdd %396 %400 
                                                      OpStore %127 %401 
                                       f32_3 %403 = OpLoad %127 
                                       f32_3 %404 = OpLoad %127 
                                         f32 %405 = OpDot %403 %404 
                                                      OpStore %402 %405 
                                         i32 %407 = OpLoad %376 
                                Uniform f32* %409 = OpAccessChain %26 %54 %407 %353 
                                         f32 %410 = OpLoad %409 
                                         f32 %411 = OpLoad %402 
                                         f32 %412 = OpFMul %410 %411 
                                         f32 %414 = OpFAdd %412 %413 
                                                      OpStore %406 %414 
                                         f32 %415 = OpLoad %406 
                                         f32 %416 = OpFDiv %413 %415 
                                                      OpStore %406 %416 
                                         i32 %420 = OpLoad %376 
                                Uniform f32* %422 = OpAccessChain %26 %35 %420 %421 
                                         f32 %423 = OpLoad %422 
                                        bool %424 = OpFOrdNotEqual %419 %423 
                                                      OpStore %418 %424 
                                         i32 %426 = OpLoad %376 
                                Uniform f32* %427 = OpAccessChain %26 %54 %426 %421 
                                         f32 %428 = OpLoad %427 
                                         f32 %429 = OpLoad %402 
                                        bool %430 = OpFOrdLessThan %428 %429 
                                                      OpStore %425 %430 
                                        bool %431 = OpLoad %425 
                                        bool %432 = OpLoad %418 
                                        bool %433 = OpLogicalAnd %431 %432 
                                                      OpStore %418 %433 
                                        bool %435 = OpLoad %418 
                                         f32 %436 = OpLoad %406 
                                         f32 %437 = OpSelect %435 %419 %436 
                                                      OpStore %434 %437 
                                         f32 %438 = OpLoad %402 
                                         f32 %440 = OpExtInst %1 40 %438 %439 
                                                      OpStore %402 %440 
                                         f32 %441 = OpLoad %402 
                                         f32 %442 = OpExtInst %1 32 %441 
                                                      OpStore %402 %442 
                                         f32 %443 = OpLoad %402 
                                       f32_3 %444 = OpCompositeConstruct %443 %443 %443 
                                       f32_3 %445 = OpLoad %127 
                                       f32_3 %446 = OpFMul %444 %445 
                                                      OpStore %127 %446 
                                       f32_3 %447 = OpLoad %127 
                                         i32 %448 = OpLoad %376 
                              Uniform f32_4* %449 = OpAccessChain %26 %67 %448 
                                       f32_4 %450 = OpLoad %449 
                                       f32_3 %451 = OpVectorShuffle %450 %450 0 1 2 
                                         f32 %452 = OpDot %447 %451 
                                                      OpStore %402 %452 
                                         f32 %453 = OpLoad %402 
                                         f32 %454 = OpExtInst %1 40 %453 %419 
                                                      OpStore %402 %454 
                                         f32 %456 = OpLoad %402 
                                         i32 %457 = OpLoad %376 
                                Uniform f32* %458 = OpAccessChain %26 %54 %457 %342 
                                         f32 %459 = OpLoad %458 
                                         f32 %460 = OpFNegate %459 
                                         f32 %461 = OpFAdd %456 %460 
                                Private f32* %462 = OpAccessChain %455 %342 
                                                      OpStore %462 %461 
                                Private f32* %463 = OpAccessChain %455 %342 
                                         f32 %464 = OpLoad %463 
                                         i32 %465 = OpLoad %376 
                                Uniform f32* %466 = OpAccessChain %26 %54 %465 %348 
                                         f32 %467 = OpLoad %466 
                                         f32 %468 = OpFMul %464 %467 
                                Private f32* %469 = OpAccessChain %455 %342 
                                                      OpStore %469 %468 
                                Private f32* %470 = OpAccessChain %455 %342 
                                         f32 %471 = OpLoad %470 
                                         f32 %472 = OpExtInst %1 43 %471 %419 %413 
                                Private f32* %473 = OpAccessChain %455 %342 
                                                      OpStore %473 %472 
                                         f32 %474 = OpLoad %434 
                                Private f32* %475 = OpAccessChain %455 %342 
                                         f32 %476 = OpLoad %475 
                                         f32 %477 = OpFMul %474 %476 
                                                      OpStore %434 %477 
                                         f32 %478 = OpLoad %434 
                                         f32 %480 = OpFMul %478 %479 
                                                      OpStore %434 %480 
                                       f32_4 %481 = OpLoad %80 
                                       f32_3 %482 = OpVectorShuffle %481 %481 0 1 2 
                                       f32_3 %483 = OpLoad %127 
                                         f32 %484 = OpDot %482 %483 
                                Private f32* %485 = OpAccessChain %455 %342 
                                                      OpStore %485 %484 
                                Private f32* %486 = OpAccessChain %455 %342 
                                         f32 %487 = OpLoad %486 
                                         f32 %488 = OpExtInst %1 40 %487 %419 
                                Private f32* %489 = OpAccessChain %455 %342 
                                                      OpStore %489 %488 
                                       f32_3 %490 = OpLoad %455 
                                       f32_3 %491 = OpVectorShuffle %490 %490 0 0 0 
                                         i32 %492 = OpLoad %376 
                              Uniform f32_4* %493 = OpAccessChain %26 %28 %492 
                                       f32_4 %494 = OpLoad %493 
                                       f32_3 %495 = OpVectorShuffle %494 %494 0 1 2 
                                       f32_3 %496 = OpFMul %491 %495 
                                                      OpStore %455 %496 
                                         f32 %497 = OpLoad %434 
                                       f32_3 %498 = OpCompositeConstruct %497 %497 %497 
                                       f32_3 %499 = OpLoad %455 
                                       f32_3 %500 = OpFMul %498 %499 
                                                      OpStore %455 %500 
                                       f32_3 %501 = OpLoad %455 
                                       f32_3 %503 = OpExtInst %1 37 %501 %502 
                                                      OpStore %455 %503 
                                       f32_3 %504 = OpLoad %370 
                                       f32_3 %505 = OpLoad %455 
                                       f32_3 %506 = OpFAdd %504 %505 
                                                      OpStore %370 %506 
                                                      OpBranch %380 
                                             %380 = OpLabel 
                                         i32 %507 = OpLoad %376 
                                         i32 %508 = OpIAdd %507 %35 
                                                      OpStore %376 %508 
                                                      OpBranch %377 
                                             %379 = OpLabel 
                                       f32_3 %511 = OpLoad %370 
                                       f32_4 %512 = OpLoad %510 
                                       f32_4 %513 = OpVectorShuffle %512 %511 4 5 6 3 
                                                      OpStore %510 %513 
                                       f32_4 %514 = OpLoad %510 
                                       f32_3 %515 = OpVectorShuffle %514 %514 0 1 2 
                                       f32_3 %516 = OpCompositeConstruct %419 %419 %419 
                                       f32_3 %517 = OpCompositeConstruct %413 %413 %413 
                                       f32_3 %518 = OpExtInst %1 43 %515 %516 %517 
                                       f32_4 %519 = OpLoad %510 
                                       f32_4 %520 = OpVectorShuffle %519 %518 4 5 6 3 
                                                      OpStore %510 %520 
                                       f32_3 %525 = OpLoad %524 
                                       f32_2 %526 = OpVectorShuffle %525 %525 0 1 
                              Uniform f32_4* %528 = OpAccessChain %26 %527 
                                       f32_4 %529 = OpLoad %528 
                                       f32_2 %530 = OpVectorShuffle %529 %529 0 1 
                                       f32_2 %531 = OpFMul %526 %530 
                              Uniform f32_4* %532 = OpAccessChain %26 %527 
                                       f32_4 %533 = OpLoad %532 
                                       f32_2 %534 = OpVectorShuffle %533 %533 2 3 
                                       f32_2 %535 = OpFAdd %531 %534 
                                                      OpStore vs_TEXCOORD0 %535 
                                       f32_3 %536 = OpLoad %307 
                                       f32_4 %537 = OpVectorShuffle %536 %536 1 1 1 1 
                              Uniform f32_4* %538 = OpAccessChain %26 %27 %35 
                                       f32_4 %539 = OpLoad %538 
                                       f32_4 %540 = OpFMul %537 %539 
                                                      OpStore %9 %540 
                              Uniform f32_4* %541 = OpAccessChain %26 %27 %28 
                                       f32_4 %542 = OpLoad %541 
                                       f32_3 %543 = OpLoad %307 
                                       f32_4 %544 = OpVectorShuffle %543 %543 0 0 0 0 
                                       f32_4 %545 = OpFMul %542 %544 
                                       f32_4 %546 = OpLoad %9 
                                       f32_4 %547 = OpFAdd %545 %546 
                                                      OpStore %9 %547 
                              Uniform f32_4* %548 = OpAccessChain %26 %27 %54 
                                       f32_4 %549 = OpLoad %548 
                                       f32_3 %550 = OpLoad %307 
                                       f32_4 %551 = OpVectorShuffle %550 %550 2 2 2 2 
                                       f32_4 %552 = OpFMul %549 %551 
                                       f32_4 %553 = OpLoad %9 
                                       f32_4 %554 = OpFAdd %552 %553 
                                                      OpStore %9 %554 
                                       f32_4 %555 = OpLoad %9 
                              Uniform f32_4* %556 = OpAccessChain %26 %27 %67 
                                       f32_4 %557 = OpLoad %556 
                                       f32_4 %558 = OpFAdd %555 %557 
                                                      OpStore %9 %558 
                                       f32_4 %559 = OpLoad %9 
                                       f32_4 %560 = OpVectorShuffle %559 %559 1 1 1 1 
                              Uniform f32_4* %562 = OpAccessChain %26 %561 %35 
                                       f32_4 %563 = OpLoad %562 
                                       f32_4 %564 = OpFMul %560 %563 
                                                      OpStore %80 %564 
                              Uniform f32_4* %565 = OpAccessChain %26 %561 %28 
                                       f32_4 %566 = OpLoad %565 
                                       f32_4 %567 = OpLoad %9 
                                       f32_4 %568 = OpVectorShuffle %567 %567 0 0 0 0 
                                       f32_4 %569 = OpFMul %566 %568 
                                       f32_4 %570 = OpLoad %80 
                                       f32_4 %571 = OpFAdd %569 %570 
                                                      OpStore %80 %571 
                              Uniform f32_4* %572 = OpAccessChain %26 %561 %54 
                                       f32_4 %573 = OpLoad %572 
                                       f32_4 %574 = OpLoad %9 
                                       f32_4 %575 = OpVectorShuffle %574 %574 2 2 2 2 
                                       f32_4 %576 = OpFMul %573 %575 
                                       f32_4 %577 = OpLoad %80 
                                       f32_4 %578 = OpFAdd %576 %577 
                                                      OpStore %80 %578 
                              Uniform f32_4* %583 = OpAccessChain %26 %561 %67 
                                       f32_4 %584 = OpLoad %583 
                                       f32_4 %585 = OpLoad %9 
                                       f32_4 %586 = OpVectorShuffle %585 %585 3 3 3 3 
                                       f32_4 %587 = OpFMul %584 %586 
                                       f32_4 %588 = OpLoad %80 
                                       f32_4 %589 = OpFAdd %587 %588 
                               Output f32_4* %590 = OpAccessChain %582 %28 
                                                      OpStore %590 %589 
                                 Output f32* %592 = OpAccessChain %510 %421 
                                                      OpStore %592 %413 
                                 Output f32* %593 = OpAccessChain %582 %28 %348 
                                         f32 %594 = OpLoad %593 
                                         f32 %595 = OpFNegate %594 
                                 Output f32* %596 = OpAccessChain %582 %28 %348 
                                                      OpStore %596 %595 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 47
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %30 %35 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %9 RelaxedPrecision 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %13 RelaxedPrecision 
                                             OpDecorate %16 RelaxedPrecision 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %17 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %26 RelaxedPrecision 
                                             OpDecorate %27 RelaxedPrecision 
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %30 RelaxedPrecision 
                                             OpDecorate %30 Location 30 
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate %33 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %35 Location 35 
                                             OpDecorate %36 RelaxedPrecision 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %24 = OpTypeVector %6 4 
                      Private f32_3* %27 = OpVariable Private 
                                     %29 = OpTypePointer Input %24 
                        Input f32_4* %30 = OpVariable Input 
                                     %34 = OpTypePointer Output %24 
                       Output f32_4* %35 = OpVariable Output 
                                 f32 %41 = OpConstant 3.674022E-40 
                                     %42 = OpTypeInt 32 0 
                                 u32 %43 = OpConstant 3 
                                     %44 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
                                             OpStore %9 %26 
                               f32_3 %28 = OpLoad %9 
                               f32_4 %31 = OpLoad %30 
                               f32_3 %32 = OpVectorShuffle %31 %31 0 1 2 
                               f32_3 %33 = OpFMul %28 %32 
                                             OpStore %27 %33 
                               f32_3 %36 = OpLoad %27 
                               f32_3 %37 = OpLoad %27 
                               f32_3 %38 = OpFAdd %36 %37 
                               f32_4 %39 = OpLoad %35 
                               f32_4 %40 = OpVectorShuffle %39 %38 4 5 6 3 
                                             OpStore %35 %40 
                         Output f32* %45 = OpAccessChain %35 %43 
                                             OpStore %45 %41 
                                             OpReturn
                                             OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles3 hw_tier02 " {
""
}
SubProgram "vulkan hw_tier00 " {
""
}
SubProgram "vulkan hw_tier01 " {
""
}
SubProgram "vulkan hw_tier02 " {
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "POINT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT" }
""
}
SubProgram "vulkan hw_tier00 " {
Keywords { "POINT" }
""
}
SubProgram "vulkan hw_tier01 " {
Keywords { "POINT" }
""
}
SubProgram "vulkan hw_tier02 " {
Keywords { "POINT" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "SPOT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SPOT" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SPOT" }
""
}
SubProgram "vulkan hw_tier00 " {
Keywords { "SPOT" }
""
}
SubProgram "vulkan hw_tier01 " {
Keywords { "SPOT" }
""
}
SubProgram "vulkan hw_tier02 " {
Keywords { "SPOT" }
""
}
}
}
 Pass {
  LOD 80
  Tags { "LIGHTMODE" = "VertexLM" "RenderType" = "Opaque" }
  GpuProgramID 1307
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_TEXCOORD1;
in highp vec3 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 unity_Lightmap_HDR;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D unity_Lightmap;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(unity_Lightmap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * unity_Lightmap_HDR.xxx;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_TEXCOORD1;
in highp vec3 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 unity_Lightmap_HDR;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D unity_Lightmap;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(unity_Lightmap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * unity_Lightmap_HDR.xxx;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_LightmapST;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_TEXCOORD1;
in highp vec3 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 unity_Lightmap_HDR;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D unity_Lightmap;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.xyz = texture(unity_Lightmap, vs_TEXCOORD0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * unity_Lightmap_HDR.xxx;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 115
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %9 %12 %34 %35 %49 %99 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate vs_TEXCOORD0 Location 9 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpDecorate vs_TEXCOORD1 Location 34 
                                                      OpDecorate %35 Location 35 
                                                      OpDecorate %49 Location 49 
                                                      OpMemberDecorate %97 0 BuiltIn 97 
                                                      OpMemberDecorate %97 1 BuiltIn 97 
                                                      OpMemberDecorate %97 2 BuiltIn 97 
                                                      OpDecorate %97 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 2 
                                               %8 = OpTypePointer Output %7 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %15 = OpTypeVector %6 4 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %15 %17 
                                              %19 = OpTypeArray %15 %17 
                                              %20 = OpTypeStruct %18 %19 %15 %15 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4;}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 2 
                                              %25 = OpTypePointer Uniform %15 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                 Input f32_3* %35 = OpVariable Input 
                                          i32 %38 = OpConstant 3 
                                              %47 = OpTypePointer Private %15 
                               Private f32_4* %48 = OpVariable Private 
                                 Input f32_3* %49 = OpVariable Input 
                                          i32 %52 = OpConstant 0 
                                          i32 %53 = OpConstant 1 
                               Private f32_4* %75 = OpVariable Private 
                                          u32 %95 = OpConstant 1 
                                              %96 = OpTypeArray %6 %95 
                                              %97 = OpTypeStruct %15 %6 %96 
                                              %98 = OpTypePointer Output %97 
         Output struct {f32_4; f32; f32[1];}* %99 = OpVariable Output 
                                             %107 = OpTypePointer Output %15 
                                             %109 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_3 %13 = OpLoad %12 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                               Uniform f32_4* %26 = OpAccessChain %22 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_2 %28 = OpVectorShuffle %27 %27 0 1 
                                        f32_2 %29 = OpFMul %14 %28 
                               Uniform f32_4* %30 = OpAccessChain %22 %24 
                                        f32_4 %31 = OpLoad %30 
                                        f32_2 %32 = OpVectorShuffle %31 %31 2 3 
                                        f32_2 %33 = OpFAdd %29 %32 
                                                      OpStore vs_TEXCOORD0 %33 
                                        f32_3 %36 = OpLoad %35 
                                        f32_2 %37 = OpVectorShuffle %36 %36 0 1 
                               Uniform f32_4* %39 = OpAccessChain %22 %38 
                                        f32_4 %40 = OpLoad %39 
                                        f32_2 %41 = OpVectorShuffle %40 %40 0 1 
                                        f32_2 %42 = OpFMul %37 %41 
                               Uniform f32_4* %43 = OpAccessChain %22 %38 
                                        f32_4 %44 = OpLoad %43 
                                        f32_2 %45 = OpVectorShuffle %44 %44 2 3 
                                        f32_2 %46 = OpFAdd %42 %45 
                                                      OpStore vs_TEXCOORD1 %46 
                                        f32_3 %50 = OpLoad %49 
                                        f32_4 %51 = OpVectorShuffle %50 %50 1 1 1 1 
                               Uniform f32_4* %54 = OpAccessChain %22 %52 %53 
                                        f32_4 %55 = OpLoad %54 
                                        f32_4 %56 = OpFMul %51 %55 
                                                      OpStore %48 %56 
                               Uniform f32_4* %57 = OpAccessChain %22 %52 %52 
                                        f32_4 %58 = OpLoad %57 
                                        f32_3 %59 = OpLoad %49 
                                        f32_4 %60 = OpVectorShuffle %59 %59 0 0 0 0 
                                        f32_4 %61 = OpFMul %58 %60 
                                        f32_4 %62 = OpLoad %48 
                                        f32_4 %63 = OpFAdd %61 %62 
                                                      OpStore %48 %63 
                               Uniform f32_4* %64 = OpAccessChain %22 %52 %24 
                                        f32_4 %65 = OpLoad %64 
                                        f32_3 %66 = OpLoad %49 
                                        f32_4 %67 = OpVectorShuffle %66 %66 2 2 2 2 
                                        f32_4 %68 = OpFMul %65 %67 
                                        f32_4 %69 = OpLoad %48 
                                        f32_4 %70 = OpFAdd %68 %69 
                                                      OpStore %48 %70 
                                        f32_4 %71 = OpLoad %48 
                               Uniform f32_4* %72 = OpAccessChain %22 %52 %38 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpFAdd %71 %73 
                                                      OpStore %48 %74 
                                        f32_4 %76 = OpLoad %48 
                                        f32_4 %77 = OpVectorShuffle %76 %76 1 1 1 1 
                               Uniform f32_4* %78 = OpAccessChain %22 %53 %53 
                                        f32_4 %79 = OpLoad %78 
                                        f32_4 %80 = OpFMul %77 %79 
                                                      OpStore %75 %80 
                               Uniform f32_4* %81 = OpAccessChain %22 %53 %52 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpLoad %48 
                                        f32_4 %84 = OpVectorShuffle %83 %83 0 0 0 0 
                                        f32_4 %85 = OpFMul %82 %84 
                                        f32_4 %86 = OpLoad %75 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %75 %87 
                               Uniform f32_4* %88 = OpAccessChain %22 %53 %24 
                                        f32_4 %89 = OpLoad %88 
                                        f32_4 %90 = OpLoad %48 
                                        f32_4 %91 = OpVectorShuffle %90 %90 2 2 2 2 
                                        f32_4 %92 = OpFMul %89 %91 
                                        f32_4 %93 = OpLoad %75 
                                        f32_4 %94 = OpFAdd %92 %93 
                                                      OpStore %75 %94 
                              Uniform f32_4* %100 = OpAccessChain %22 %53 %38 
                                       f32_4 %101 = OpLoad %100 
                                       f32_4 %102 = OpLoad %48 
                                       f32_4 %103 = OpVectorShuffle %102 %102 3 3 3 3 
                                       f32_4 %104 = OpFMul %101 %103 
                                       f32_4 %105 = OpLoad %75 
                                       f32_4 %106 = OpFAdd %104 %105 
                               Output f32_4* %108 = OpAccessChain %99 %52 
                                                      OpStore %108 %106 
                                 Output f32* %110 = OpAccessChain %99 %52 %95 
                                         f32 %111 = OpLoad %110 
                                         f32 %112 = OpFNegate %111 
                                 Output f32* %113 = OpAccessChain %99 %52 %95 
                                                      OpStore %113 %112 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 62
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %45 %50 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %9 RelaxedPrecision 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %13 RelaxedPrecision 
                                             OpDecorate %16 RelaxedPrecision 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %17 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %26 RelaxedPrecision 
                                             OpDecorate %27 RelaxedPrecision 
                                             OpDecorate %28 RelaxedPrecision 
                                             OpMemberDecorate %29 0 RelaxedPrecision 
                                             OpMemberDecorate %29 0 Offset 29 
                                             OpDecorate %29 Block 
                                             OpDecorate %31 DescriptorSet 31 
                                             OpDecorate %31 Binding 31 
                                             OpDecorate %36 RelaxedPrecision 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpDecorate %39 RelaxedPrecision 
                                             OpDecorate %40 RelaxedPrecision 
                                             OpDecorate %40 DescriptorSet 40 
                                             OpDecorate %40 Binding 40 
                                             OpDecorate %41 RelaxedPrecision 
                                             OpDecorate %42 RelaxedPrecision 
                                             OpDecorate %42 DescriptorSet 42 
                                             OpDecorate %42 Binding 42 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD1 Location 45 
                                             OpDecorate %48 RelaxedPrecision 
                                             OpDecorate %50 RelaxedPrecision 
                                             OpDecorate %50 Location 50 
                                             OpDecorate %51 RelaxedPrecision 
                                             OpDecorate %52 RelaxedPrecision 
                                             OpDecorate %53 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %24 = OpTypeVector %6 4 
                      Private f32_3* %27 = OpVariable Private 
                                     %29 = OpTypeStruct %24 
                                     %30 = OpTypePointer Uniform %29 
            Uniform struct {f32_4;}* %31 = OpVariable Uniform 
                                     %32 = OpTypeInt 32 1 
                                 i32 %33 = OpConstant 0 
                                     %34 = OpTypePointer Uniform %24 
                      Private f32_3* %39 = OpVariable Private 
UniformConstant read_only Texture2D* %40 = OpVariable UniformConstant 
            UniformConstant sampler* %42 = OpVariable UniformConstant 
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                     %49 = OpTypePointer Output %24 
                       Output f32_4* %50 = OpVariable Output 
                                 f32 %56 = OpConstant 3.674022E-40 
                                     %57 = OpTypeInt 32 0 
                                 u32 %58 = OpConstant 3 
                                     %59 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
                                             OpStore %9 %26 
                               f32_3 %28 = OpLoad %9 
                      Uniform f32_4* %35 = OpAccessChain %31 %33 
                               f32_4 %36 = OpLoad %35 
                               f32_3 %37 = OpVectorShuffle %36 %36 0 0 0 
                               f32_3 %38 = OpFMul %28 %37 
                                             OpStore %27 %38 
                 read_only Texture2D %41 = OpLoad %40 
                             sampler %43 = OpLoad %42 
          read_only Texture2DSampled %44 = OpSampledImage %41 %43 
                               f32_2 %46 = OpLoad vs_TEXCOORD1 
                               f32_4 %47 = OpImageSampleImplicitLod %44 %46 
                               f32_3 %48 = OpVectorShuffle %47 %47 0 1 2 
                                             OpStore %39 %48 
                               f32_3 %51 = OpLoad %27 
                               f32_3 %52 = OpLoad %39 
                               f32_3 %53 = OpFMul %51 %52 
                               f32_4 %54 = OpLoad %50 
                               f32_4 %55 = OpVectorShuffle %54 %53 4 5 6 3 
                                             OpStore %50 %55 
                         Output f32* %60 = OpAccessChain %50 %58 
                                             OpStore %60 %56 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 115
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %9 %12 %34 %35 %49 %99 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate vs_TEXCOORD0 Location 9 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpDecorate vs_TEXCOORD1 Location 34 
                                                      OpDecorate %35 Location 35 
                                                      OpDecorate %49 Location 49 
                                                      OpMemberDecorate %97 0 BuiltIn 97 
                                                      OpMemberDecorate %97 1 BuiltIn 97 
                                                      OpMemberDecorate %97 2 BuiltIn 97 
                                                      OpDecorate %97 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 2 
                                               %8 = OpTypePointer Output %7 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %15 = OpTypeVector %6 4 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %15 %17 
                                              %19 = OpTypeArray %15 %17 
                                              %20 = OpTypeStruct %18 %19 %15 %15 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4;}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 2 
                                              %25 = OpTypePointer Uniform %15 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                 Input f32_3* %35 = OpVariable Input 
                                          i32 %38 = OpConstant 3 
                                              %47 = OpTypePointer Private %15 
                               Private f32_4* %48 = OpVariable Private 
                                 Input f32_3* %49 = OpVariable Input 
                                          i32 %52 = OpConstant 0 
                                          i32 %53 = OpConstant 1 
                               Private f32_4* %75 = OpVariable Private 
                                          u32 %95 = OpConstant 1 
                                              %96 = OpTypeArray %6 %95 
                                              %97 = OpTypeStruct %15 %6 %96 
                                              %98 = OpTypePointer Output %97 
         Output struct {f32_4; f32; f32[1];}* %99 = OpVariable Output 
                                             %107 = OpTypePointer Output %15 
                                             %109 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_3 %13 = OpLoad %12 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                               Uniform f32_4* %26 = OpAccessChain %22 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_2 %28 = OpVectorShuffle %27 %27 0 1 
                                        f32_2 %29 = OpFMul %14 %28 
                               Uniform f32_4* %30 = OpAccessChain %22 %24 
                                        f32_4 %31 = OpLoad %30 
                                        f32_2 %32 = OpVectorShuffle %31 %31 2 3 
                                        f32_2 %33 = OpFAdd %29 %32 
                                                      OpStore vs_TEXCOORD0 %33 
                                        f32_3 %36 = OpLoad %35 
                                        f32_2 %37 = OpVectorShuffle %36 %36 0 1 
                               Uniform f32_4* %39 = OpAccessChain %22 %38 
                                        f32_4 %40 = OpLoad %39 
                                        f32_2 %41 = OpVectorShuffle %40 %40 0 1 
                                        f32_2 %42 = OpFMul %37 %41 
                               Uniform f32_4* %43 = OpAccessChain %22 %38 
                                        f32_4 %44 = OpLoad %43 
                                        f32_2 %45 = OpVectorShuffle %44 %44 2 3 
                                        f32_2 %46 = OpFAdd %42 %45 
                                                      OpStore vs_TEXCOORD1 %46 
                                        f32_3 %50 = OpLoad %49 
                                        f32_4 %51 = OpVectorShuffle %50 %50 1 1 1 1 
                               Uniform f32_4* %54 = OpAccessChain %22 %52 %53 
                                        f32_4 %55 = OpLoad %54 
                                        f32_4 %56 = OpFMul %51 %55 
                                                      OpStore %48 %56 
                               Uniform f32_4* %57 = OpAccessChain %22 %52 %52 
                                        f32_4 %58 = OpLoad %57 
                                        f32_3 %59 = OpLoad %49 
                                        f32_4 %60 = OpVectorShuffle %59 %59 0 0 0 0 
                                        f32_4 %61 = OpFMul %58 %60 
                                        f32_4 %62 = OpLoad %48 
                                        f32_4 %63 = OpFAdd %61 %62 
                                                      OpStore %48 %63 
                               Uniform f32_4* %64 = OpAccessChain %22 %52 %24 
                                        f32_4 %65 = OpLoad %64 
                                        f32_3 %66 = OpLoad %49 
                                        f32_4 %67 = OpVectorShuffle %66 %66 2 2 2 2 
                                        f32_4 %68 = OpFMul %65 %67 
                                        f32_4 %69 = OpLoad %48 
                                        f32_4 %70 = OpFAdd %68 %69 
                                                      OpStore %48 %70 
                                        f32_4 %71 = OpLoad %48 
                               Uniform f32_4* %72 = OpAccessChain %22 %52 %38 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpFAdd %71 %73 
                                                      OpStore %48 %74 
                                        f32_4 %76 = OpLoad %48 
                                        f32_4 %77 = OpVectorShuffle %76 %76 1 1 1 1 
                               Uniform f32_4* %78 = OpAccessChain %22 %53 %53 
                                        f32_4 %79 = OpLoad %78 
                                        f32_4 %80 = OpFMul %77 %79 
                                                      OpStore %75 %80 
                               Uniform f32_4* %81 = OpAccessChain %22 %53 %52 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpLoad %48 
                                        f32_4 %84 = OpVectorShuffle %83 %83 0 0 0 0 
                                        f32_4 %85 = OpFMul %82 %84 
                                        f32_4 %86 = OpLoad %75 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %75 %87 
                               Uniform f32_4* %88 = OpAccessChain %22 %53 %24 
                                        f32_4 %89 = OpLoad %88 
                                        f32_4 %90 = OpLoad %48 
                                        f32_4 %91 = OpVectorShuffle %90 %90 2 2 2 2 
                                        f32_4 %92 = OpFMul %89 %91 
                                        f32_4 %93 = OpLoad %75 
                                        f32_4 %94 = OpFAdd %92 %93 
                                                      OpStore %75 %94 
                              Uniform f32_4* %100 = OpAccessChain %22 %53 %38 
                                       f32_4 %101 = OpLoad %100 
                                       f32_4 %102 = OpLoad %48 
                                       f32_4 %103 = OpVectorShuffle %102 %102 3 3 3 3 
                                       f32_4 %104 = OpFMul %101 %103 
                                       f32_4 %105 = OpLoad %75 
                                       f32_4 %106 = OpFAdd %104 %105 
                               Output f32_4* %108 = OpAccessChain %99 %52 
                                                      OpStore %108 %106 
                                 Output f32* %110 = OpAccessChain %99 %52 %95 
                                         f32 %111 = OpLoad %110 
                                         f32 %112 = OpFNegate %111 
                                 Output f32* %113 = OpAccessChain %99 %52 %95 
                                                      OpStore %113 %112 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 62
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %45 %50 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %9 RelaxedPrecision 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %13 RelaxedPrecision 
                                             OpDecorate %16 RelaxedPrecision 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %17 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %26 RelaxedPrecision 
                                             OpDecorate %27 RelaxedPrecision 
                                             OpDecorate %28 RelaxedPrecision 
                                             OpMemberDecorate %29 0 RelaxedPrecision 
                                             OpMemberDecorate %29 0 Offset 29 
                                             OpDecorate %29 Block 
                                             OpDecorate %31 DescriptorSet 31 
                                             OpDecorate %31 Binding 31 
                                             OpDecorate %36 RelaxedPrecision 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpDecorate %39 RelaxedPrecision 
                                             OpDecorate %40 RelaxedPrecision 
                                             OpDecorate %40 DescriptorSet 40 
                                             OpDecorate %40 Binding 40 
                                             OpDecorate %41 RelaxedPrecision 
                                             OpDecorate %42 RelaxedPrecision 
                                             OpDecorate %42 DescriptorSet 42 
                                             OpDecorate %42 Binding 42 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD1 Location 45 
                                             OpDecorate %48 RelaxedPrecision 
                                             OpDecorate %50 RelaxedPrecision 
                                             OpDecorate %50 Location 50 
                                             OpDecorate %51 RelaxedPrecision 
                                             OpDecorate %52 RelaxedPrecision 
                                             OpDecorate %53 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %24 = OpTypeVector %6 4 
                      Private f32_3* %27 = OpVariable Private 
                                     %29 = OpTypeStruct %24 
                                     %30 = OpTypePointer Uniform %29 
            Uniform struct {f32_4;}* %31 = OpVariable Uniform 
                                     %32 = OpTypeInt 32 1 
                                 i32 %33 = OpConstant 0 
                                     %34 = OpTypePointer Uniform %24 
                      Private f32_3* %39 = OpVariable Private 
UniformConstant read_only Texture2D* %40 = OpVariable UniformConstant 
            UniformConstant sampler* %42 = OpVariable UniformConstant 
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                     %49 = OpTypePointer Output %24 
                       Output f32_4* %50 = OpVariable Output 
                                 f32 %56 = OpConstant 3.674022E-40 
                                     %57 = OpTypeInt 32 0 
                                 u32 %58 = OpConstant 3 
                                     %59 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
                                             OpStore %9 %26 
                               f32_3 %28 = OpLoad %9 
                      Uniform f32_4* %35 = OpAccessChain %31 %33 
                               f32_4 %36 = OpLoad %35 
                               f32_3 %37 = OpVectorShuffle %36 %36 0 0 0 
                               f32_3 %38 = OpFMul %28 %37 
                                             OpStore %27 %38 
                 read_only Texture2D %41 = OpLoad %40 
                             sampler %43 = OpLoad %42 
          read_only Texture2DSampled %44 = OpSampledImage %41 %43 
                               f32_2 %46 = OpLoad vs_TEXCOORD1 
                               f32_4 %47 = OpImageSampleImplicitLod %44 %46 
                               f32_3 %48 = OpVectorShuffle %47 %47 0 1 2 
                                             OpStore %39 %48 
                               f32_3 %51 = OpLoad %27 
                               f32_3 %52 = OpLoad %39 
                               f32_3 %53 = OpFMul %51 %52 
                               f32_4 %54 = OpLoad %50 
                               f32_4 %55 = OpVectorShuffle %54 %53 4 5 6 3 
                                             OpStore %50 %55 
                         Output f32* %60 = OpAccessChain %50 %58 
                                             OpStore %60 %56 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 115
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %9 %12 %34 %35 %49 %99 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate vs_TEXCOORD0 Location 9 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpDecorate vs_TEXCOORD1 Location 34 
                                                      OpDecorate %35 Location 35 
                                                      OpDecorate %49 Location 49 
                                                      OpMemberDecorate %97 0 BuiltIn 97 
                                                      OpMemberDecorate %97 1 BuiltIn 97 
                                                      OpMemberDecorate %97 2 BuiltIn 97 
                                                      OpDecorate %97 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 2 
                                               %8 = OpTypePointer Output %7 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %15 = OpTypeVector %6 4 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %15 %17 
                                              %19 = OpTypeArray %15 %17 
                                              %20 = OpTypeStruct %18 %19 %15 %15 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4;}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 2 
                                              %25 = OpTypePointer Uniform %15 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                 Input f32_3* %35 = OpVariable Input 
                                          i32 %38 = OpConstant 3 
                                              %47 = OpTypePointer Private %15 
                               Private f32_4* %48 = OpVariable Private 
                                 Input f32_3* %49 = OpVariable Input 
                                          i32 %52 = OpConstant 0 
                                          i32 %53 = OpConstant 1 
                               Private f32_4* %75 = OpVariable Private 
                                          u32 %95 = OpConstant 1 
                                              %96 = OpTypeArray %6 %95 
                                              %97 = OpTypeStruct %15 %6 %96 
                                              %98 = OpTypePointer Output %97 
         Output struct {f32_4; f32; f32[1];}* %99 = OpVariable Output 
                                             %107 = OpTypePointer Output %15 
                                             %109 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_3 %13 = OpLoad %12 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                               Uniform f32_4* %26 = OpAccessChain %22 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_2 %28 = OpVectorShuffle %27 %27 0 1 
                                        f32_2 %29 = OpFMul %14 %28 
                               Uniform f32_4* %30 = OpAccessChain %22 %24 
                                        f32_4 %31 = OpLoad %30 
                                        f32_2 %32 = OpVectorShuffle %31 %31 2 3 
                                        f32_2 %33 = OpFAdd %29 %32 
                                                      OpStore vs_TEXCOORD0 %33 
                                        f32_3 %36 = OpLoad %35 
                                        f32_2 %37 = OpVectorShuffle %36 %36 0 1 
                               Uniform f32_4* %39 = OpAccessChain %22 %38 
                                        f32_4 %40 = OpLoad %39 
                                        f32_2 %41 = OpVectorShuffle %40 %40 0 1 
                                        f32_2 %42 = OpFMul %37 %41 
                               Uniform f32_4* %43 = OpAccessChain %22 %38 
                                        f32_4 %44 = OpLoad %43 
                                        f32_2 %45 = OpVectorShuffle %44 %44 2 3 
                                        f32_2 %46 = OpFAdd %42 %45 
                                                      OpStore vs_TEXCOORD1 %46 
                                        f32_3 %50 = OpLoad %49 
                                        f32_4 %51 = OpVectorShuffle %50 %50 1 1 1 1 
                               Uniform f32_4* %54 = OpAccessChain %22 %52 %53 
                                        f32_4 %55 = OpLoad %54 
                                        f32_4 %56 = OpFMul %51 %55 
                                                      OpStore %48 %56 
                               Uniform f32_4* %57 = OpAccessChain %22 %52 %52 
                                        f32_4 %58 = OpLoad %57 
                                        f32_3 %59 = OpLoad %49 
                                        f32_4 %60 = OpVectorShuffle %59 %59 0 0 0 0 
                                        f32_4 %61 = OpFMul %58 %60 
                                        f32_4 %62 = OpLoad %48 
                                        f32_4 %63 = OpFAdd %61 %62 
                                                      OpStore %48 %63 
                               Uniform f32_4* %64 = OpAccessChain %22 %52 %24 
                                        f32_4 %65 = OpLoad %64 
                                        f32_3 %66 = OpLoad %49 
                                        f32_4 %67 = OpVectorShuffle %66 %66 2 2 2 2 
                                        f32_4 %68 = OpFMul %65 %67 
                                        f32_4 %69 = OpLoad %48 
                                        f32_4 %70 = OpFAdd %68 %69 
                                                      OpStore %48 %70 
                                        f32_4 %71 = OpLoad %48 
                               Uniform f32_4* %72 = OpAccessChain %22 %52 %38 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpFAdd %71 %73 
                                                      OpStore %48 %74 
                                        f32_4 %76 = OpLoad %48 
                                        f32_4 %77 = OpVectorShuffle %76 %76 1 1 1 1 
                               Uniform f32_4* %78 = OpAccessChain %22 %53 %53 
                                        f32_4 %79 = OpLoad %78 
                                        f32_4 %80 = OpFMul %77 %79 
                                                      OpStore %75 %80 
                               Uniform f32_4* %81 = OpAccessChain %22 %53 %52 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpLoad %48 
                                        f32_4 %84 = OpVectorShuffle %83 %83 0 0 0 0 
                                        f32_4 %85 = OpFMul %82 %84 
                                        f32_4 %86 = OpLoad %75 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %75 %87 
                               Uniform f32_4* %88 = OpAccessChain %22 %53 %24 
                                        f32_4 %89 = OpLoad %88 
                                        f32_4 %90 = OpLoad %48 
                                        f32_4 %91 = OpVectorShuffle %90 %90 2 2 2 2 
                                        f32_4 %92 = OpFMul %89 %91 
                                        f32_4 %93 = OpLoad %75 
                                        f32_4 %94 = OpFAdd %92 %93 
                                                      OpStore %75 %94 
                              Uniform f32_4* %100 = OpAccessChain %22 %53 %38 
                                       f32_4 %101 = OpLoad %100 
                                       f32_4 %102 = OpLoad %48 
                                       f32_4 %103 = OpVectorShuffle %102 %102 3 3 3 3 
                                       f32_4 %104 = OpFMul %101 %103 
                                       f32_4 %105 = OpLoad %75 
                                       f32_4 %106 = OpFAdd %104 %105 
                               Output f32_4* %108 = OpAccessChain %99 %52 
                                                      OpStore %108 %106 
                                 Output f32* %110 = OpAccessChain %99 %52 %95 
                                         f32 %111 = OpLoad %110 
                                         f32 %112 = OpFNegate %111 
                                 Output f32* %113 = OpAccessChain %99 %52 %95 
                                                      OpStore %113 %112 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 62
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %45 %50 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %9 RelaxedPrecision 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %13 RelaxedPrecision 
                                             OpDecorate %16 RelaxedPrecision 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %17 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %26 RelaxedPrecision 
                                             OpDecorate %27 RelaxedPrecision 
                                             OpDecorate %28 RelaxedPrecision 
                                             OpMemberDecorate %29 0 RelaxedPrecision 
                                             OpMemberDecorate %29 0 Offset 29 
                                             OpDecorate %29 Block 
                                             OpDecorate %31 DescriptorSet 31 
                                             OpDecorate %31 Binding 31 
                                             OpDecorate %36 RelaxedPrecision 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpDecorate %39 RelaxedPrecision 
                                             OpDecorate %40 RelaxedPrecision 
                                             OpDecorate %40 DescriptorSet 40 
                                             OpDecorate %40 Binding 40 
                                             OpDecorate %41 RelaxedPrecision 
                                             OpDecorate %42 RelaxedPrecision 
                                             OpDecorate %42 DescriptorSet 42 
                                             OpDecorate %42 Binding 42 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD1 Location 45 
                                             OpDecorate %48 RelaxedPrecision 
                                             OpDecorate %50 RelaxedPrecision 
                                             OpDecorate %50 Location 50 
                                             OpDecorate %51 RelaxedPrecision 
                                             OpDecorate %52 RelaxedPrecision 
                                             OpDecorate %53 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 3 
                                      %8 = OpTypePointer Private %7 
                       Private f32_3* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %24 = OpTypeVector %6 4 
                      Private f32_3* %27 = OpVariable Private 
                                     %29 = OpTypeStruct %24 
                                     %30 = OpTypePointer Uniform %29 
            Uniform struct {f32_4;}* %31 = OpVariable Uniform 
                                     %32 = OpTypeInt 32 1 
                                 i32 %33 = OpConstant 0 
                                     %34 = OpTypePointer Uniform %24 
                      Private f32_3* %39 = OpVariable Private 
UniformConstant read_only Texture2D* %40 = OpVariable UniformConstant 
            UniformConstant sampler* %42 = OpVariable UniformConstant 
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                     %49 = OpTypePointer Output %24 
                       Output f32_4* %50 = OpVariable Output 
                                 f32 %56 = OpConstant 3.674022E-40 
                                     %57 = OpTypeInt 32 0 
                                 u32 %58 = OpConstant 3 
                                     %59 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
                                             OpStore %9 %26 
                               f32_3 %28 = OpLoad %9 
                      Uniform f32_4* %35 = OpAccessChain %31 %33 
                               f32_4 %36 = OpLoad %35 
                               f32_3 %37 = OpVectorShuffle %36 %36 0 0 0 
                               f32_3 %38 = OpFMul %28 %37 
                                             OpStore %27 %38 
                 read_only Texture2D %41 = OpLoad %40 
                             sampler %43 = OpLoad %42 
          read_only Texture2DSampled %44 = OpSampledImage %41 %43 
                               f32_2 %46 = OpLoad vs_TEXCOORD1 
                               f32_4 %47 = OpImageSampleImplicitLod %44 %46 
                               f32_3 %48 = OpVectorShuffle %47 %47 0 1 2 
                                             OpStore %39 %48 
                               f32_3 %51 = OpLoad %27 
                               f32_3 %52 = OpLoad %39 
                               f32_3 %53 = OpFMul %51 %52 
                               f32_4 %54 = OpLoad %50 
                               f32_4 %55 = OpVectorShuffle %54 %53 4 5 6 3 
                                             OpStore %50 %55 
                         Output f32* %60 = OpAccessChain %50 %58 
                                             OpStore %60 %56 
                                             OpReturn
                                             OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles3 hw_tier02 " {
""
}
SubProgram "vulkan hw_tier00 " {
""
}
SubProgram "vulkan hw_tier01 " {
""
}
SubProgram "vulkan hw_tier02 " {
""
}
}
}
 Pass {
  Name "ShadowCaster"
  LOD 80
  Tags { "LIGHTMODE" = "SHADOWCASTER" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
  Cull Off
  GpuProgramID 77718
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out highp vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out highp vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SHADOWS_DEPTH" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat6;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = unity_LightShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = max((-u_xlat0.w), u_xlat6);
    gl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat0.x + u_xlat6;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out highp vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "SHADOWS_DEPTH" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 254
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %12 %66 %227 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %66 Location 66 
                                                      OpMemberDecorate %225 0 BuiltIn 225 
                                                      OpMemberDecorate %225 1 BuiltIn 225 
                                                      OpMemberDecorate %225 2 BuiltIn 225 
                                                      OpDecorate %225 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %7 %7 %16 %17 %18 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4];}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 3 
                                          i32 %24 = OpConstant 0 
                                              %25 = OpTypePointer Uniform %7 
                                          u32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Private %6 
                                          i32 %34 = OpConstant 1 
                                          u32 %39 = OpConstant 1 
                                          i32 %42 = OpConstant 2 
                                          u32 %47 = OpConstant 2 
                                 Private f32* %49 = OpVariable Private 
                               Private f32_4* %64 = OpVariable Private 
                                              %65 = OpTypePointer Input %7 
                                 Input f32_4* %66 = OpVariable Input 
                               Private f32_4* %93 = OpVariable Private 
                                         f32 %130 = OpConstant 3.674022E-40 
                                             %135 = OpTypePointer Uniform %6 
                                             %150 = OpTypeBool 
                                             %151 = OpTypePointer Private %150 
                               Private bool* %152 = OpVariable Private 
                                         f32 %155 = OpConstant 3.674022E-40 
                                             %158 = OpTypePointer Function %10 
                                         i32 %172 = OpConstant 4 
                                         u32 %199 = OpConstant 3 
                                         f32 %210 = OpConstant 3.674022E-40 
                                Private f32* %213 = OpVariable Private 
                                             %224 = OpTypeArray %6 %39 
                                             %225 = OpTypeStruct %7 %6 %224 
                                             %226 = OpTypePointer Output %225 
        Output struct {f32_4; f32; f32[1];}* %227 = OpVariable Output 
                                             %230 = OpTypePointer Output %7 
                                             %247 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %159 = OpVariable Function 
                                        f32_3 %13 = OpLoad %12 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_3 %28 = OpVectorShuffle %27 %27 0 1 2 
                                          f32 %29 = OpDot %13 %28 
                                 Private f32* %32 = OpAccessChain %9 %30 
                                                      OpStore %32 %29 
                                        f32_3 %33 = OpLoad %12 
                               Uniform f32_4* %35 = OpAccessChain %21 %23 %34 
                                        f32_4 %36 = OpLoad %35 
                                        f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
                                          f32 %38 = OpDot %33 %37 
                                 Private f32* %40 = OpAccessChain %9 %39 
                                                      OpStore %40 %38 
                                        f32_3 %41 = OpLoad %12 
                               Uniform f32_4* %43 = OpAccessChain %21 %23 %42 
                                        f32_4 %44 = OpLoad %43 
                                        f32_3 %45 = OpVectorShuffle %44 %44 0 1 2 
                                          f32 %46 = OpDot %41 %45 
                                 Private f32* %48 = OpAccessChain %9 %47 
                                                      OpStore %48 %46 
                                        f32_4 %50 = OpLoad %9 
                                        f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                        f32_4 %52 = OpLoad %9 
                                        f32_3 %53 = OpVectorShuffle %52 %52 0 1 2 
                                          f32 %54 = OpDot %51 %53 
                                                      OpStore %49 %54 
                                          f32 %55 = OpLoad %49 
                                          f32 %56 = OpExtInst %1 32 %55 
                                                      OpStore %49 %56 
                                          f32 %57 = OpLoad %49 
                                        f32_3 %58 = OpCompositeConstruct %57 %57 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFMul %58 %60 
                                        f32_4 %62 = OpLoad %9 
                                        f32_4 %63 = OpVectorShuffle %62 %61 4 5 6 3 
                                                      OpStore %9 %63 
                                        f32_4 %67 = OpLoad %66 
                                        f32_4 %68 = OpVectorShuffle %67 %67 1 1 1 1 
                               Uniform f32_4* %69 = OpAccessChain %21 %42 %34 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpFMul %68 %70 
                                                      OpStore %64 %71 
                               Uniform f32_4* %72 = OpAccessChain %21 %42 %24 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %66 
                                        f32_4 %75 = OpVectorShuffle %74 %74 0 0 0 0 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %64 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %64 %78 
                               Uniform f32_4* %79 = OpAccessChain %21 %42 %42 
                                        f32_4 %80 = OpLoad %79 
                                        f32_4 %81 = OpLoad %66 
                                        f32_4 %82 = OpVectorShuffle %81 %81 2 2 2 2 
                                        f32_4 %83 = OpFMul %80 %82 
                                        f32_4 %84 = OpLoad %64 
                                        f32_4 %85 = OpFAdd %83 %84 
                                                      OpStore %64 %85 
                               Uniform f32_4* %86 = OpAccessChain %21 %42 %23 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %66 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %64 
                                        f32_4 %92 = OpFAdd %90 %91 
                                                      OpStore %64 %92 
                                        f32_4 %94 = OpLoad %64 
                                        f32_3 %95 = OpVectorShuffle %94 %94 0 1 2 
                                        f32_3 %96 = OpFNegate %95 
                               Uniform f32_4* %97 = OpAccessChain %21 %24 
                                        f32_4 %98 = OpLoad %97 
                                        f32_3 %99 = OpVectorShuffle %98 %98 3 3 3 
                                       f32_3 %100 = OpFMul %96 %99 
                              Uniform f32_4* %101 = OpAccessChain %21 %24 
                                       f32_4 %102 = OpLoad %101 
                                       f32_3 %103 = OpVectorShuffle %102 %102 0 1 2 
                                       f32_3 %104 = OpFAdd %100 %103 
                                       f32_4 %105 = OpLoad %93 
                                       f32_4 %106 = OpVectorShuffle %105 %104 4 5 6 3 
                                                      OpStore %93 %106 
                                       f32_4 %107 = OpLoad %93 
                                       f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                       f32_4 %109 = OpLoad %93 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                                         f32 %111 = OpDot %108 %110 
                                                      OpStore %49 %111 
                                         f32 %112 = OpLoad %49 
                                         f32 %113 = OpExtInst %1 32 %112 
                                                      OpStore %49 %113 
                                         f32 %114 = OpLoad %49 
                                       f32_3 %115 = OpCompositeConstruct %114 %114 %114 
                                       f32_4 %116 = OpLoad %93 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_3 %118 = OpFMul %115 %117 
                                       f32_4 %119 = OpLoad %93 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 6 3 
                                                      OpStore %93 %120 
                                       f32_4 %121 = OpLoad %9 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                       f32_4 %123 = OpLoad %93 
                                       f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                         f32 %125 = OpDot %122 %124 
                                                      OpStore %49 %125 
                                         f32 %126 = OpLoad %49 
                                         f32 %127 = OpFNegate %126 
                                         f32 %128 = OpLoad %49 
                                         f32 %129 = OpFMul %127 %128 
                                         f32 %131 = OpFAdd %129 %130 
                                                      OpStore %49 %131 
                                         f32 %132 = OpLoad %49 
                                         f32 %133 = OpExtInst %1 31 %132 
                                                      OpStore %49 %133 
                                         f32 %134 = OpLoad %49 
                                Uniform f32* %136 = OpAccessChain %21 %34 %47 
                                         f32 %137 = OpLoad %136 
                                         f32 %138 = OpFMul %134 %137 
                                                      OpStore %49 %138 
                                       f32_4 %139 = OpLoad %9 
                                       f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
                                       f32_3 %141 = OpFNegate %140 
                                         f32 %142 = OpLoad %49 
                                       f32_3 %143 = OpCompositeConstruct %142 %142 %142 
                                       f32_3 %144 = OpFMul %141 %143 
                                       f32_4 %145 = OpLoad %64 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                       f32_3 %147 = OpFAdd %144 %146 
                                       f32_4 %148 = OpLoad %9 
                                       f32_4 %149 = OpVectorShuffle %148 %147 4 5 6 3 
                                                      OpStore %9 %149 
                                Uniform f32* %153 = OpAccessChain %21 %34 %47 
                                         f32 %154 = OpLoad %153 
                                        bool %156 = OpFOrdNotEqual %154 %155 
                                                      OpStore %152 %156 
                                        bool %157 = OpLoad %152 
                                                      OpSelectionMerge %161 None 
                                                      OpBranchConditional %157 %160 %164 
                                             %160 = OpLabel 
                                       f32_4 %162 = OpLoad %9 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 1 2 
                                                      OpStore %159 %163 
                                                      OpBranch %161 
                                             %164 = OpLabel 
                                       f32_4 %165 = OpLoad %64 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                                      OpStore %159 %166 
                                                      OpBranch %161 
                                             %161 = OpLabel 
                                       f32_3 %167 = OpLoad %159 
                                       f32_4 %168 = OpLoad %9 
                                       f32_4 %169 = OpVectorShuffle %168 %167 4 5 6 3 
                                                      OpStore %9 %169 
                                       f32_4 %170 = OpLoad %9 
                                       f32_4 %171 = OpVectorShuffle %170 %170 1 1 1 1 
                              Uniform f32_4* %173 = OpAccessChain %21 %172 %34 
                                       f32_4 %174 = OpLoad %173 
                                       f32_4 %175 = OpFMul %171 %174 
                                                      OpStore %93 %175 
                              Uniform f32_4* %176 = OpAccessChain %21 %172 %24 
                                       f32_4 %177 = OpLoad %176 
                                       f32_4 %178 = OpLoad %9 
                                       f32_4 %179 = OpVectorShuffle %178 %178 0 0 0 0 
                                       f32_4 %180 = OpFMul %177 %179 
                                       f32_4 %181 = OpLoad %93 
                                       f32_4 %182 = OpFAdd %180 %181 
                                                      OpStore %93 %182 
                              Uniform f32_4* %183 = OpAccessChain %21 %172 %42 
                                       f32_4 %184 = OpLoad %183 
                                       f32_4 %185 = OpLoad %9 
                                       f32_4 %186 = OpVectorShuffle %185 %185 2 2 2 2 
                                       f32_4 %187 = OpFMul %184 %186 
                                       f32_4 %188 = OpLoad %93 
                                       f32_4 %189 = OpFAdd %187 %188 
                                                      OpStore %9 %189 
                              Uniform f32_4* %190 = OpAccessChain %21 %172 %23 
                                       f32_4 %191 = OpLoad %190 
                                       f32_4 %192 = OpLoad %64 
                                       f32_4 %193 = OpVectorShuffle %192 %192 3 3 3 3 
                                       f32_4 %194 = OpFMul %191 %193 
                                       f32_4 %195 = OpLoad %9 
                                       f32_4 %196 = OpFAdd %194 %195 
                                                      OpStore %9 %196 
                                Uniform f32* %197 = OpAccessChain %21 %34 %30 
                                         f32 %198 = OpLoad %197 
                                Private f32* %200 = OpAccessChain %9 %199 
                                         f32 %201 = OpLoad %200 
                                         f32 %202 = OpFDiv %198 %201 
                                Private f32* %203 = OpAccessChain %64 %30 
                                                      OpStore %203 %202 
                                Private f32* %204 = OpAccessChain %64 %30 
                                         f32 %205 = OpLoad %204 
                                         f32 %206 = OpExtInst %1 37 %205 %155 
                                Private f32* %207 = OpAccessChain %64 %30 
                                                      OpStore %207 %206 
                                Private f32* %208 = OpAccessChain %64 %30 
                                         f32 %209 = OpLoad %208 
                                         f32 %211 = OpExtInst %1 40 %209 %210 
                                Private f32* %212 = OpAccessChain %64 %30 
                                                      OpStore %212 %211 
                                Private f32* %214 = OpAccessChain %9 %47 
                                         f32 %215 = OpLoad %214 
                                Private f32* %216 = OpAccessChain %64 %30 
                                         f32 %217 = OpLoad %216 
                                         f32 %218 = OpFAdd %215 %217 
                                                      OpStore %213 %218 
                                Private f32* %219 = OpAccessChain %9 %199 
                                         f32 %220 = OpLoad %219 
                                         f32 %221 = OpLoad %213 
                                         f32 %222 = OpExtInst %1 37 %220 %221 
                                Private f32* %223 = OpAccessChain %64 %30 
                                                      OpStore %223 %222 
                                       f32_4 %228 = OpLoad %9 
                                       f32_3 %229 = OpVectorShuffle %228 %228 0 1 3 
                               Output f32_4* %231 = OpAccessChain %227 %24 
                                       f32_4 %232 = OpLoad %231 
                                       f32_4 %233 = OpVectorShuffle %232 %229 4 5 2 6 
                                                      OpStore %231 %233 
                                         f32 %234 = OpLoad %213 
                                         f32 %235 = OpFNegate %234 
                                Private f32* %236 = OpAccessChain %64 %30 
                                         f32 %237 = OpLoad %236 
                                         f32 %238 = OpFAdd %235 %237 
                                Private f32* %239 = OpAccessChain %9 %30 
                                                      OpStore %239 %238 
                                Uniform f32* %240 = OpAccessChain %21 %34 %39 
                                         f32 %241 = OpLoad %240 
                                Private f32* %242 = OpAccessChain %9 %30 
                                         f32 %243 = OpLoad %242 
                                         f32 %244 = OpFMul %241 %243 
                                         f32 %245 = OpLoad %213 
                                         f32 %246 = OpFAdd %244 %245 
                                 Output f32* %248 = OpAccessChain %227 %24 %47 
                                                      OpStore %248 %246 
                                 Output f32* %249 = OpAccessChain %227 %24 %39 
                                         f32 %250 = OpLoad %249 
                                         f32 %251 = OpFNegate %250 
                                 Output f32* %252 = OpAccessChain %227 %24 %39 
                                                      OpStore %252 %251 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 13
; Schema: 0
                     OpCapability Shader 
              %1 = OpExtInstImport "GLSL.std.450" 
                     OpMemoryModel Logical GLSL450 
                     OpEntryPoint Fragment %4 "main" %9 
                     OpExecutionMode %4 OriginUpperLeft 
                     OpDecorate %9 Location 9 
              %2 = OpTypeVoid 
              %3 = OpTypeFunction %2 
              %6 = OpTypeFloat 32 
              %7 = OpTypeVector %6 4 
              %8 = OpTypePointer Output %7 
Output f32_4* %9 = OpVariable Output 
         f32 %10 = OpConstant 3.674022E-40 
       f32_4 %11 = OpConstantComposite %10 %10 %10 %10 
         void %4 = OpFunction None %3 
              %5 = OpLabel 
                     OpStore %9 %11 
                     OpReturn
                     OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "SHADOWS_DEPTH" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 254
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %12 %66 %227 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %66 Location 66 
                                                      OpMemberDecorate %225 0 BuiltIn 225 
                                                      OpMemberDecorate %225 1 BuiltIn 225 
                                                      OpMemberDecorate %225 2 BuiltIn 225 
                                                      OpDecorate %225 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %7 %7 %16 %17 %18 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4];}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 3 
                                          i32 %24 = OpConstant 0 
                                              %25 = OpTypePointer Uniform %7 
                                          u32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Private %6 
                                          i32 %34 = OpConstant 1 
                                          u32 %39 = OpConstant 1 
                                          i32 %42 = OpConstant 2 
                                          u32 %47 = OpConstant 2 
                                 Private f32* %49 = OpVariable Private 
                               Private f32_4* %64 = OpVariable Private 
                                              %65 = OpTypePointer Input %7 
                                 Input f32_4* %66 = OpVariable Input 
                               Private f32_4* %93 = OpVariable Private 
                                         f32 %130 = OpConstant 3.674022E-40 
                                             %135 = OpTypePointer Uniform %6 
                                             %150 = OpTypeBool 
                                             %151 = OpTypePointer Private %150 
                               Private bool* %152 = OpVariable Private 
                                         f32 %155 = OpConstant 3.674022E-40 
                                             %158 = OpTypePointer Function %10 
                                         i32 %172 = OpConstant 4 
                                         u32 %199 = OpConstant 3 
                                         f32 %210 = OpConstant 3.674022E-40 
                                Private f32* %213 = OpVariable Private 
                                             %224 = OpTypeArray %6 %39 
                                             %225 = OpTypeStruct %7 %6 %224 
                                             %226 = OpTypePointer Output %225 
        Output struct {f32_4; f32; f32[1];}* %227 = OpVariable Output 
                                             %230 = OpTypePointer Output %7 
                                             %247 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %159 = OpVariable Function 
                                        f32_3 %13 = OpLoad %12 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_3 %28 = OpVectorShuffle %27 %27 0 1 2 
                                          f32 %29 = OpDot %13 %28 
                                 Private f32* %32 = OpAccessChain %9 %30 
                                                      OpStore %32 %29 
                                        f32_3 %33 = OpLoad %12 
                               Uniform f32_4* %35 = OpAccessChain %21 %23 %34 
                                        f32_4 %36 = OpLoad %35 
                                        f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
                                          f32 %38 = OpDot %33 %37 
                                 Private f32* %40 = OpAccessChain %9 %39 
                                                      OpStore %40 %38 
                                        f32_3 %41 = OpLoad %12 
                               Uniform f32_4* %43 = OpAccessChain %21 %23 %42 
                                        f32_4 %44 = OpLoad %43 
                                        f32_3 %45 = OpVectorShuffle %44 %44 0 1 2 
                                          f32 %46 = OpDot %41 %45 
                                 Private f32* %48 = OpAccessChain %9 %47 
                                                      OpStore %48 %46 
                                        f32_4 %50 = OpLoad %9 
                                        f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                        f32_4 %52 = OpLoad %9 
                                        f32_3 %53 = OpVectorShuffle %52 %52 0 1 2 
                                          f32 %54 = OpDot %51 %53 
                                                      OpStore %49 %54 
                                          f32 %55 = OpLoad %49 
                                          f32 %56 = OpExtInst %1 32 %55 
                                                      OpStore %49 %56 
                                          f32 %57 = OpLoad %49 
                                        f32_3 %58 = OpCompositeConstruct %57 %57 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFMul %58 %60 
                                        f32_4 %62 = OpLoad %9 
                                        f32_4 %63 = OpVectorShuffle %62 %61 4 5 6 3 
                                                      OpStore %9 %63 
                                        f32_4 %67 = OpLoad %66 
                                        f32_4 %68 = OpVectorShuffle %67 %67 1 1 1 1 
                               Uniform f32_4* %69 = OpAccessChain %21 %42 %34 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpFMul %68 %70 
                                                      OpStore %64 %71 
                               Uniform f32_4* %72 = OpAccessChain %21 %42 %24 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %66 
                                        f32_4 %75 = OpVectorShuffle %74 %74 0 0 0 0 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %64 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %64 %78 
                               Uniform f32_4* %79 = OpAccessChain %21 %42 %42 
                                        f32_4 %80 = OpLoad %79 
                                        f32_4 %81 = OpLoad %66 
                                        f32_4 %82 = OpVectorShuffle %81 %81 2 2 2 2 
                                        f32_4 %83 = OpFMul %80 %82 
                                        f32_4 %84 = OpLoad %64 
                                        f32_4 %85 = OpFAdd %83 %84 
                                                      OpStore %64 %85 
                               Uniform f32_4* %86 = OpAccessChain %21 %42 %23 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %66 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %64 
                                        f32_4 %92 = OpFAdd %90 %91 
                                                      OpStore %64 %92 
                                        f32_4 %94 = OpLoad %64 
                                        f32_3 %95 = OpVectorShuffle %94 %94 0 1 2 
                                        f32_3 %96 = OpFNegate %95 
                               Uniform f32_4* %97 = OpAccessChain %21 %24 
                                        f32_4 %98 = OpLoad %97 
                                        f32_3 %99 = OpVectorShuffle %98 %98 3 3 3 
                                       f32_3 %100 = OpFMul %96 %99 
                              Uniform f32_4* %101 = OpAccessChain %21 %24 
                                       f32_4 %102 = OpLoad %101 
                                       f32_3 %103 = OpVectorShuffle %102 %102 0 1 2 
                                       f32_3 %104 = OpFAdd %100 %103 
                                       f32_4 %105 = OpLoad %93 
                                       f32_4 %106 = OpVectorShuffle %105 %104 4 5 6 3 
                                                      OpStore %93 %106 
                                       f32_4 %107 = OpLoad %93 
                                       f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                       f32_4 %109 = OpLoad %93 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                                         f32 %111 = OpDot %108 %110 
                                                      OpStore %49 %111 
                                         f32 %112 = OpLoad %49 
                                         f32 %113 = OpExtInst %1 32 %112 
                                                      OpStore %49 %113 
                                         f32 %114 = OpLoad %49 
                                       f32_3 %115 = OpCompositeConstruct %114 %114 %114 
                                       f32_4 %116 = OpLoad %93 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_3 %118 = OpFMul %115 %117 
                                       f32_4 %119 = OpLoad %93 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 6 3 
                                                      OpStore %93 %120 
                                       f32_4 %121 = OpLoad %9 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                       f32_4 %123 = OpLoad %93 
                                       f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                         f32 %125 = OpDot %122 %124 
                                                      OpStore %49 %125 
                                         f32 %126 = OpLoad %49 
                                         f32 %127 = OpFNegate %126 
                                         f32 %128 = OpLoad %49 
                                         f32 %129 = OpFMul %127 %128 
                                         f32 %131 = OpFAdd %129 %130 
                                                      OpStore %49 %131 
                                         f32 %132 = OpLoad %49 
                                         f32 %133 = OpExtInst %1 31 %132 
                                                      OpStore %49 %133 
                                         f32 %134 = OpLoad %49 
                                Uniform f32* %136 = OpAccessChain %21 %34 %47 
                                         f32 %137 = OpLoad %136 
                                         f32 %138 = OpFMul %134 %137 
                                                      OpStore %49 %138 
                                       f32_4 %139 = OpLoad %9 
                                       f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
                                       f32_3 %141 = OpFNegate %140 
                                         f32 %142 = OpLoad %49 
                                       f32_3 %143 = OpCompositeConstruct %142 %142 %142 
                                       f32_3 %144 = OpFMul %141 %143 
                                       f32_4 %145 = OpLoad %64 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                       f32_3 %147 = OpFAdd %144 %146 
                                       f32_4 %148 = OpLoad %9 
                                       f32_4 %149 = OpVectorShuffle %148 %147 4 5 6 3 
                                                      OpStore %9 %149 
                                Uniform f32* %153 = OpAccessChain %21 %34 %47 
                                         f32 %154 = OpLoad %153 
                                        bool %156 = OpFOrdNotEqual %154 %155 
                                                      OpStore %152 %156 
                                        bool %157 = OpLoad %152 
                                                      OpSelectionMerge %161 None 
                                                      OpBranchConditional %157 %160 %164 
                                             %160 = OpLabel 
                                       f32_4 %162 = OpLoad %9 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 1 2 
                                                      OpStore %159 %163 
                                                      OpBranch %161 
                                             %164 = OpLabel 
                                       f32_4 %165 = OpLoad %64 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                                      OpStore %159 %166 
                                                      OpBranch %161 
                                             %161 = OpLabel 
                                       f32_3 %167 = OpLoad %159 
                                       f32_4 %168 = OpLoad %9 
                                       f32_4 %169 = OpVectorShuffle %168 %167 4 5 6 3 
                                                      OpStore %9 %169 
                                       f32_4 %170 = OpLoad %9 
                                       f32_4 %171 = OpVectorShuffle %170 %170 1 1 1 1 
                              Uniform f32_4* %173 = OpAccessChain %21 %172 %34 
                                       f32_4 %174 = OpLoad %173 
                                       f32_4 %175 = OpFMul %171 %174 
                                                      OpStore %93 %175 
                              Uniform f32_4* %176 = OpAccessChain %21 %172 %24 
                                       f32_4 %177 = OpLoad %176 
                                       f32_4 %178 = OpLoad %9 
                                       f32_4 %179 = OpVectorShuffle %178 %178 0 0 0 0 
                                       f32_4 %180 = OpFMul %177 %179 
                                       f32_4 %181 = OpLoad %93 
                                       f32_4 %182 = OpFAdd %180 %181 
                                                      OpStore %93 %182 
                              Uniform f32_4* %183 = OpAccessChain %21 %172 %42 
                                       f32_4 %184 = OpLoad %183 
                                       f32_4 %185 = OpLoad %9 
                                       f32_4 %186 = OpVectorShuffle %185 %185 2 2 2 2 
                                       f32_4 %187 = OpFMul %184 %186 
                                       f32_4 %188 = OpLoad %93 
                                       f32_4 %189 = OpFAdd %187 %188 
                                                      OpStore %9 %189 
                              Uniform f32_4* %190 = OpAccessChain %21 %172 %23 
                                       f32_4 %191 = OpLoad %190 
                                       f32_4 %192 = OpLoad %64 
                                       f32_4 %193 = OpVectorShuffle %192 %192 3 3 3 3 
                                       f32_4 %194 = OpFMul %191 %193 
                                       f32_4 %195 = OpLoad %9 
                                       f32_4 %196 = OpFAdd %194 %195 
                                                      OpStore %9 %196 
                                Uniform f32* %197 = OpAccessChain %21 %34 %30 
                                         f32 %198 = OpLoad %197 
                                Private f32* %200 = OpAccessChain %9 %199 
                                         f32 %201 = OpLoad %200 
                                         f32 %202 = OpFDiv %198 %201 
                                Private f32* %203 = OpAccessChain %64 %30 
                                                      OpStore %203 %202 
                                Private f32* %204 = OpAccessChain %64 %30 
                                         f32 %205 = OpLoad %204 
                                         f32 %206 = OpExtInst %1 37 %205 %155 
                                Private f32* %207 = OpAccessChain %64 %30 
                                                      OpStore %207 %206 
                                Private f32* %208 = OpAccessChain %64 %30 
                                         f32 %209 = OpLoad %208 
                                         f32 %211 = OpExtInst %1 40 %209 %210 
                                Private f32* %212 = OpAccessChain %64 %30 
                                                      OpStore %212 %211 
                                Private f32* %214 = OpAccessChain %9 %47 
                                         f32 %215 = OpLoad %214 
                                Private f32* %216 = OpAccessChain %64 %30 
                                         f32 %217 = OpLoad %216 
                                         f32 %218 = OpFAdd %215 %217 
                                                      OpStore %213 %218 
                                Private f32* %219 = OpAccessChain %9 %199 
                                         f32 %220 = OpLoad %219 
                                         f32 %221 = OpLoad %213 
                                         f32 %222 = OpExtInst %1 37 %220 %221 
                                Private f32* %223 = OpAccessChain %64 %30 
                                                      OpStore %223 %222 
                                       f32_4 %228 = OpLoad %9 
                                       f32_3 %229 = OpVectorShuffle %228 %228 0 1 3 
                               Output f32_4* %231 = OpAccessChain %227 %24 
                                       f32_4 %232 = OpLoad %231 
                                       f32_4 %233 = OpVectorShuffle %232 %229 4 5 2 6 
                                                      OpStore %231 %233 
                                         f32 %234 = OpLoad %213 
                                         f32 %235 = OpFNegate %234 
                                Private f32* %236 = OpAccessChain %64 %30 
                                         f32 %237 = OpLoad %236 
                                         f32 %238 = OpFAdd %235 %237 
                                Private f32* %239 = OpAccessChain %9 %30 
                                                      OpStore %239 %238 
                                Uniform f32* %240 = OpAccessChain %21 %34 %39 
                                         f32 %241 = OpLoad %240 
                                Private f32* %242 = OpAccessChain %9 %30 
                                         f32 %243 = OpLoad %242 
                                         f32 %244 = OpFMul %241 %243 
                                         f32 %245 = OpLoad %213 
                                         f32 %246 = OpFAdd %244 %245 
                                 Output f32* %248 = OpAccessChain %227 %24 %47 
                                                      OpStore %248 %246 
                                 Output f32* %249 = OpAccessChain %227 %24 %39 
                                         f32 %250 = OpLoad %249 
                                         f32 %251 = OpFNegate %250 
                                 Output f32* %252 = OpAccessChain %227 %24 %39 
                                                      OpStore %252 %251 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 13
; Schema: 0
                     OpCapability Shader 
              %1 = OpExtInstImport "GLSL.std.450" 
                     OpMemoryModel Logical GLSL450 
                     OpEntryPoint Fragment %4 "main" %9 
                     OpExecutionMode %4 OriginUpperLeft 
                     OpDecorate %9 Location 9 
              %2 = OpTypeVoid 
              %3 = OpTypeFunction %2 
              %6 = OpTypeFloat 32 
              %7 = OpTypeVector %6 4 
              %8 = OpTypePointer Output %7 
Output f32_4* %9 = OpVariable Output 
         f32 %10 = OpConstant 3.674022E-40 
       f32_4 %11 = OpConstantComposite %10 %10 %10 %10 
         void %4 = OpFunction None %3 
              %5 = OpLabel 
                     OpStore %9 %11 
                     OpReturn
                     OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "SHADOWS_DEPTH" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 254
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %12 %66 %227 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %66 Location 66 
                                                      OpMemberDecorate %225 0 BuiltIn 225 
                                                      OpMemberDecorate %225 1 BuiltIn 225 
                                                      OpMemberDecorate %225 2 BuiltIn 225 
                                                      OpDecorate %225 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %7 %7 %16 %17 %18 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4];}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 3 
                                          i32 %24 = OpConstant 0 
                                              %25 = OpTypePointer Uniform %7 
                                          u32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Private %6 
                                          i32 %34 = OpConstant 1 
                                          u32 %39 = OpConstant 1 
                                          i32 %42 = OpConstant 2 
                                          u32 %47 = OpConstant 2 
                                 Private f32* %49 = OpVariable Private 
                               Private f32_4* %64 = OpVariable Private 
                                              %65 = OpTypePointer Input %7 
                                 Input f32_4* %66 = OpVariable Input 
                               Private f32_4* %93 = OpVariable Private 
                                         f32 %130 = OpConstant 3.674022E-40 
                                             %135 = OpTypePointer Uniform %6 
                                             %150 = OpTypeBool 
                                             %151 = OpTypePointer Private %150 
                               Private bool* %152 = OpVariable Private 
                                         f32 %155 = OpConstant 3.674022E-40 
                                             %158 = OpTypePointer Function %10 
                                         i32 %172 = OpConstant 4 
                                         u32 %199 = OpConstant 3 
                                         f32 %210 = OpConstant 3.674022E-40 
                                Private f32* %213 = OpVariable Private 
                                             %224 = OpTypeArray %6 %39 
                                             %225 = OpTypeStruct %7 %6 %224 
                                             %226 = OpTypePointer Output %225 
        Output struct {f32_4; f32; f32[1];}* %227 = OpVariable Output 
                                             %230 = OpTypePointer Output %7 
                                             %247 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %159 = OpVariable Function 
                                        f32_3 %13 = OpLoad %12 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_3 %28 = OpVectorShuffle %27 %27 0 1 2 
                                          f32 %29 = OpDot %13 %28 
                                 Private f32* %32 = OpAccessChain %9 %30 
                                                      OpStore %32 %29 
                                        f32_3 %33 = OpLoad %12 
                               Uniform f32_4* %35 = OpAccessChain %21 %23 %34 
                                        f32_4 %36 = OpLoad %35 
                                        f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
                                          f32 %38 = OpDot %33 %37 
                                 Private f32* %40 = OpAccessChain %9 %39 
                                                      OpStore %40 %38 
                                        f32_3 %41 = OpLoad %12 
                               Uniform f32_4* %43 = OpAccessChain %21 %23 %42 
                                        f32_4 %44 = OpLoad %43 
                                        f32_3 %45 = OpVectorShuffle %44 %44 0 1 2 
                                          f32 %46 = OpDot %41 %45 
                                 Private f32* %48 = OpAccessChain %9 %47 
                                                      OpStore %48 %46 
                                        f32_4 %50 = OpLoad %9 
                                        f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                        f32_4 %52 = OpLoad %9 
                                        f32_3 %53 = OpVectorShuffle %52 %52 0 1 2 
                                          f32 %54 = OpDot %51 %53 
                                                      OpStore %49 %54 
                                          f32 %55 = OpLoad %49 
                                          f32 %56 = OpExtInst %1 32 %55 
                                                      OpStore %49 %56 
                                          f32 %57 = OpLoad %49 
                                        f32_3 %58 = OpCompositeConstruct %57 %57 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFMul %58 %60 
                                        f32_4 %62 = OpLoad %9 
                                        f32_4 %63 = OpVectorShuffle %62 %61 4 5 6 3 
                                                      OpStore %9 %63 
                                        f32_4 %67 = OpLoad %66 
                                        f32_4 %68 = OpVectorShuffle %67 %67 1 1 1 1 
                               Uniform f32_4* %69 = OpAccessChain %21 %42 %34 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpFMul %68 %70 
                                                      OpStore %64 %71 
                               Uniform f32_4* %72 = OpAccessChain %21 %42 %24 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %66 
                                        f32_4 %75 = OpVectorShuffle %74 %74 0 0 0 0 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %64 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %64 %78 
                               Uniform f32_4* %79 = OpAccessChain %21 %42 %42 
                                        f32_4 %80 = OpLoad %79 
                                        f32_4 %81 = OpLoad %66 
                                        f32_4 %82 = OpVectorShuffle %81 %81 2 2 2 2 
                                        f32_4 %83 = OpFMul %80 %82 
                                        f32_4 %84 = OpLoad %64 
                                        f32_4 %85 = OpFAdd %83 %84 
                                                      OpStore %64 %85 
                               Uniform f32_4* %86 = OpAccessChain %21 %42 %23 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %66 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %64 
                                        f32_4 %92 = OpFAdd %90 %91 
                                                      OpStore %64 %92 
                                        f32_4 %94 = OpLoad %64 
                                        f32_3 %95 = OpVectorShuffle %94 %94 0 1 2 
                                        f32_3 %96 = OpFNegate %95 
                               Uniform f32_4* %97 = OpAccessChain %21 %24 
                                        f32_4 %98 = OpLoad %97 
                                        f32_3 %99 = OpVectorShuffle %98 %98 3 3 3 
                                       f32_3 %100 = OpFMul %96 %99 
                              Uniform f32_4* %101 = OpAccessChain %21 %24 
                                       f32_4 %102 = OpLoad %101 
                                       f32_3 %103 = OpVectorShuffle %102 %102 0 1 2 
                                       f32_3 %104 = OpFAdd %100 %103 
                                       f32_4 %105 = OpLoad %93 
                                       f32_4 %106 = OpVectorShuffle %105 %104 4 5 6 3 
                                                      OpStore %93 %106 
                                       f32_4 %107 = OpLoad %93 
                                       f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                       f32_4 %109 = OpLoad %93 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                                         f32 %111 = OpDot %108 %110 
                                                      OpStore %49 %111 
                                         f32 %112 = OpLoad %49 
                                         f32 %113 = OpExtInst %1 32 %112 
                                                      OpStore %49 %113 
                                         f32 %114 = OpLoad %49 
                                       f32_3 %115 = OpCompositeConstruct %114 %114 %114 
                                       f32_4 %116 = OpLoad %93 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_3 %118 = OpFMul %115 %117 
                                       f32_4 %119 = OpLoad %93 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 6 3 
                                                      OpStore %93 %120 
                                       f32_4 %121 = OpLoad %9 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                       f32_4 %123 = OpLoad %93 
                                       f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                         f32 %125 = OpDot %122 %124 
                                                      OpStore %49 %125 
                                         f32 %126 = OpLoad %49 
                                         f32 %127 = OpFNegate %126 
                                         f32 %128 = OpLoad %49 
                                         f32 %129 = OpFMul %127 %128 
                                         f32 %131 = OpFAdd %129 %130 
                                                      OpStore %49 %131 
                                         f32 %132 = OpLoad %49 
                                         f32 %133 = OpExtInst %1 31 %132 
                                                      OpStore %49 %133 
                                         f32 %134 = OpLoad %49 
                                Uniform f32* %136 = OpAccessChain %21 %34 %47 
                                         f32 %137 = OpLoad %136 
                                         f32 %138 = OpFMul %134 %137 
                                                      OpStore %49 %138 
                                       f32_4 %139 = OpLoad %9 
                                       f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
                                       f32_3 %141 = OpFNegate %140 
                                         f32 %142 = OpLoad %49 
                                       f32_3 %143 = OpCompositeConstruct %142 %142 %142 
                                       f32_3 %144 = OpFMul %141 %143 
                                       f32_4 %145 = OpLoad %64 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                       f32_3 %147 = OpFAdd %144 %146 
                                       f32_4 %148 = OpLoad %9 
                                       f32_4 %149 = OpVectorShuffle %148 %147 4 5 6 3 
                                                      OpStore %9 %149 
                                Uniform f32* %153 = OpAccessChain %21 %34 %47 
                                         f32 %154 = OpLoad %153 
                                        bool %156 = OpFOrdNotEqual %154 %155 
                                                      OpStore %152 %156 
                                        bool %157 = OpLoad %152 
                                                      OpSelectionMerge %161 None 
                                                      OpBranchConditional %157 %160 %164 
                                             %160 = OpLabel 
                                       f32_4 %162 = OpLoad %9 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 1 2 
                                                      OpStore %159 %163 
                                                      OpBranch %161 
                                             %164 = OpLabel 
                                       f32_4 %165 = OpLoad %64 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                                      OpStore %159 %166 
                                                      OpBranch %161 
                                             %161 = OpLabel 
                                       f32_3 %167 = OpLoad %159 
                                       f32_4 %168 = OpLoad %9 
                                       f32_4 %169 = OpVectorShuffle %168 %167 4 5 6 3 
                                                      OpStore %9 %169 
                                       f32_4 %170 = OpLoad %9 
                                       f32_4 %171 = OpVectorShuffle %170 %170 1 1 1 1 
                              Uniform f32_4* %173 = OpAccessChain %21 %172 %34 
                                       f32_4 %174 = OpLoad %173 
                                       f32_4 %175 = OpFMul %171 %174 
                                                      OpStore %93 %175 
                              Uniform f32_4* %176 = OpAccessChain %21 %172 %24 
                                       f32_4 %177 = OpLoad %176 
                                       f32_4 %178 = OpLoad %9 
                                       f32_4 %179 = OpVectorShuffle %178 %178 0 0 0 0 
                                       f32_4 %180 = OpFMul %177 %179 
                                       f32_4 %181 = OpLoad %93 
                                       f32_4 %182 = OpFAdd %180 %181 
                                                      OpStore %93 %182 
                              Uniform f32_4* %183 = OpAccessChain %21 %172 %42 
                                       f32_4 %184 = OpLoad %183 
                                       f32_4 %185 = OpLoad %9 
                                       f32_4 %186 = OpVectorShuffle %185 %185 2 2 2 2 
                                       f32_4 %187 = OpFMul %184 %186 
                                       f32_4 %188 = OpLoad %93 
                                       f32_4 %189 = OpFAdd %187 %188 
                                                      OpStore %9 %189 
                              Uniform f32_4* %190 = OpAccessChain %21 %172 %23 
                                       f32_4 %191 = OpLoad %190 
                                       f32_4 %192 = OpLoad %64 
                                       f32_4 %193 = OpVectorShuffle %192 %192 3 3 3 3 
                                       f32_4 %194 = OpFMul %191 %193 
                                       f32_4 %195 = OpLoad %9 
                                       f32_4 %196 = OpFAdd %194 %195 
                                                      OpStore %9 %196 
                                Uniform f32* %197 = OpAccessChain %21 %34 %30 
                                         f32 %198 = OpLoad %197 
                                Private f32* %200 = OpAccessChain %9 %199 
                                         f32 %201 = OpLoad %200 
                                         f32 %202 = OpFDiv %198 %201 
                                Private f32* %203 = OpAccessChain %64 %30 
                                                      OpStore %203 %202 
                                Private f32* %204 = OpAccessChain %64 %30 
                                         f32 %205 = OpLoad %204 
                                         f32 %206 = OpExtInst %1 37 %205 %155 
                                Private f32* %207 = OpAccessChain %64 %30 
                                                      OpStore %207 %206 
                                Private f32* %208 = OpAccessChain %64 %30 
                                         f32 %209 = OpLoad %208 
                                         f32 %211 = OpExtInst %1 40 %209 %210 
                                Private f32* %212 = OpAccessChain %64 %30 
                                                      OpStore %212 %211 
                                Private f32* %214 = OpAccessChain %9 %47 
                                         f32 %215 = OpLoad %214 
                                Private f32* %216 = OpAccessChain %64 %30 
                                         f32 %217 = OpLoad %216 
                                         f32 %218 = OpFAdd %215 %217 
                                                      OpStore %213 %218 
                                Private f32* %219 = OpAccessChain %9 %199 
                                         f32 %220 = OpLoad %219 
                                         f32 %221 = OpLoad %213 
                                         f32 %222 = OpExtInst %1 37 %220 %221 
                                Private f32* %223 = OpAccessChain %64 %30 
                                                      OpStore %223 %222 
                                       f32_4 %228 = OpLoad %9 
                                       f32_3 %229 = OpVectorShuffle %228 %228 0 1 3 
                               Output f32_4* %231 = OpAccessChain %227 %24 
                                       f32_4 %232 = OpLoad %231 
                                       f32_4 %233 = OpVectorShuffle %232 %229 4 5 2 6 
                                                      OpStore %231 %233 
                                         f32 %234 = OpLoad %213 
                                         f32 %235 = OpFNegate %234 
                                Private f32* %236 = OpAccessChain %64 %30 
                                         f32 %237 = OpLoad %236 
                                         f32 %238 = OpFAdd %235 %237 
                                Private f32* %239 = OpAccessChain %9 %30 
                                                      OpStore %239 %238 
                                Uniform f32* %240 = OpAccessChain %21 %34 %39 
                                         f32 %241 = OpLoad %240 
                                Private f32* %242 = OpAccessChain %9 %30 
                                         f32 %243 = OpLoad %242 
                                         f32 %244 = OpFMul %241 %243 
                                         f32 %245 = OpLoad %213 
                                         f32 %246 = OpFAdd %244 %245 
                                 Output f32* %248 = OpAccessChain %227 %24 %47 
                                                      OpStore %248 %246 
                                 Output f32* %249 = OpAccessChain %227 %24 %39 
                                         f32 %250 = OpLoad %249 
                                         f32 %251 = OpFNegate %250 
                                 Output f32* %252 = OpAccessChain %227 %24 %39 
                                                      OpStore %252 %251 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 13
; Schema: 0
                     OpCapability Shader 
              %1 = OpExtInstImport "GLSL.std.450" 
                     OpMemoryModel Logical GLSL450 
                     OpEntryPoint Fragment %4 "main" %9 
                     OpExecutionMode %4 OriginUpperLeft 
                     OpDecorate %9 Location 9 
              %2 = OpTypeVoid 
              %3 = OpTypeFunction %2 
              %6 = OpTypeFloat 32 
              %7 = OpTypeVector %6 4 
              %8 = OpTypePointer Output %7 
Output f32_4* %9 = OpVariable Output 
         f32 %10 = OpConstant 3.674022E-40 
       f32_4 %11 = OpConstantComposite %10 %10 %10 %10 
         void %4 = OpFunction None %3 
              %5 = OpLabel 
                     OpStore %9 %11 
                     OpReturn
                     OpFunctionEnd
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out highp vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out highp vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SHADOWS_CUBE" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_LightShadowBias;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat9;
bool u_xlatb9;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat2.xyz = (-u_xlat1.xyz) * _WorldSpaceLightPos0.www + _WorldSpaceLightPos0.xyz;
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat2.xyz = vec3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = (-u_xlat9) * u_xlat9 + 1.0;
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * unity_LightShadowBias.z;
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(u_xlat9) + u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightShadowBias.z!=0.0);
#else
    u_xlatb9 = unity_LightShadowBias.z!=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    u_xlat1.x = max((-u_xlat0.w), u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    gl_Position.z = unity_LightShadowBias.y * u_xlat1.x + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out highp vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "SHADOWS_CUBE" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 236
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %12 %66 %214 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %66 Location 66 
                                                      OpMemberDecorate %212 0 BuiltIn 212 
                                                      OpMemberDecorate %212 1 BuiltIn 212 
                                                      OpMemberDecorate %212 2 BuiltIn 212 
                                                      OpDecorate %212 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %7 %7 %16 %17 %18 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4];}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 3 
                                          i32 %24 = OpConstant 0 
                                              %25 = OpTypePointer Uniform %7 
                                          u32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Private %6 
                                          i32 %34 = OpConstant 1 
                                          u32 %39 = OpConstant 1 
                                          i32 %42 = OpConstant 2 
                                          u32 %47 = OpConstant 2 
                                 Private f32* %49 = OpVariable Private 
                               Private f32_4* %64 = OpVariable Private 
                                              %65 = OpTypePointer Input %7 
                                 Input f32_4* %66 = OpVariable Input 
                               Private f32_4* %93 = OpVariable Private 
                                         f32 %130 = OpConstant 3.674022E-40 
                                             %135 = OpTypePointer Uniform %6 
                                             %150 = OpTypeBool 
                                             %151 = OpTypePointer Private %150 
                               Private bool* %152 = OpVariable Private 
                                         f32 %155 = OpConstant 3.674022E-40 
                                             %158 = OpTypePointer Function %10 
                                         i32 %172 = OpConstant 4 
                                         u32 %197 = OpConstant 3 
                                             %211 = OpTypeArray %6 %39 
                                             %212 = OpTypeStruct %7 %6 %211 
                                             %213 = OpTypePointer Output %212 
        Output struct {f32_4; f32; f32[1];}* %214 = OpVariable Output 
                                             %223 = OpTypePointer Output %6 
                                             %227 = OpTypePointer Output %7 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %159 = OpVariable Function 
                                        f32_3 %13 = OpLoad %12 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_3 %28 = OpVectorShuffle %27 %27 0 1 2 
                                          f32 %29 = OpDot %13 %28 
                                 Private f32* %32 = OpAccessChain %9 %30 
                                                      OpStore %32 %29 
                                        f32_3 %33 = OpLoad %12 
                               Uniform f32_4* %35 = OpAccessChain %21 %23 %34 
                                        f32_4 %36 = OpLoad %35 
                                        f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
                                          f32 %38 = OpDot %33 %37 
                                 Private f32* %40 = OpAccessChain %9 %39 
                                                      OpStore %40 %38 
                                        f32_3 %41 = OpLoad %12 
                               Uniform f32_4* %43 = OpAccessChain %21 %23 %42 
                                        f32_4 %44 = OpLoad %43 
                                        f32_3 %45 = OpVectorShuffle %44 %44 0 1 2 
                                          f32 %46 = OpDot %41 %45 
                                 Private f32* %48 = OpAccessChain %9 %47 
                                                      OpStore %48 %46 
                                        f32_4 %50 = OpLoad %9 
                                        f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                        f32_4 %52 = OpLoad %9 
                                        f32_3 %53 = OpVectorShuffle %52 %52 0 1 2 
                                          f32 %54 = OpDot %51 %53 
                                                      OpStore %49 %54 
                                          f32 %55 = OpLoad %49 
                                          f32 %56 = OpExtInst %1 32 %55 
                                                      OpStore %49 %56 
                                          f32 %57 = OpLoad %49 
                                        f32_3 %58 = OpCompositeConstruct %57 %57 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFMul %58 %60 
                                        f32_4 %62 = OpLoad %9 
                                        f32_4 %63 = OpVectorShuffle %62 %61 4 5 6 3 
                                                      OpStore %9 %63 
                                        f32_4 %67 = OpLoad %66 
                                        f32_4 %68 = OpVectorShuffle %67 %67 1 1 1 1 
                               Uniform f32_4* %69 = OpAccessChain %21 %42 %34 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpFMul %68 %70 
                                                      OpStore %64 %71 
                               Uniform f32_4* %72 = OpAccessChain %21 %42 %24 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %66 
                                        f32_4 %75 = OpVectorShuffle %74 %74 0 0 0 0 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %64 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %64 %78 
                               Uniform f32_4* %79 = OpAccessChain %21 %42 %42 
                                        f32_4 %80 = OpLoad %79 
                                        f32_4 %81 = OpLoad %66 
                                        f32_4 %82 = OpVectorShuffle %81 %81 2 2 2 2 
                                        f32_4 %83 = OpFMul %80 %82 
                                        f32_4 %84 = OpLoad %64 
                                        f32_4 %85 = OpFAdd %83 %84 
                                                      OpStore %64 %85 
                               Uniform f32_4* %86 = OpAccessChain %21 %42 %23 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %66 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %64 
                                        f32_4 %92 = OpFAdd %90 %91 
                                                      OpStore %64 %92 
                                        f32_4 %94 = OpLoad %64 
                                        f32_3 %95 = OpVectorShuffle %94 %94 0 1 2 
                                        f32_3 %96 = OpFNegate %95 
                               Uniform f32_4* %97 = OpAccessChain %21 %24 
                                        f32_4 %98 = OpLoad %97 
                                        f32_3 %99 = OpVectorShuffle %98 %98 3 3 3 
                                       f32_3 %100 = OpFMul %96 %99 
                              Uniform f32_4* %101 = OpAccessChain %21 %24 
                                       f32_4 %102 = OpLoad %101 
                                       f32_3 %103 = OpVectorShuffle %102 %102 0 1 2 
                                       f32_3 %104 = OpFAdd %100 %103 
                                       f32_4 %105 = OpLoad %93 
                                       f32_4 %106 = OpVectorShuffle %105 %104 4 5 6 3 
                                                      OpStore %93 %106 
                                       f32_4 %107 = OpLoad %93 
                                       f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                       f32_4 %109 = OpLoad %93 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                                         f32 %111 = OpDot %108 %110 
                                                      OpStore %49 %111 
                                         f32 %112 = OpLoad %49 
                                         f32 %113 = OpExtInst %1 32 %112 
                                                      OpStore %49 %113 
                                         f32 %114 = OpLoad %49 
                                       f32_3 %115 = OpCompositeConstruct %114 %114 %114 
                                       f32_4 %116 = OpLoad %93 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_3 %118 = OpFMul %115 %117 
                                       f32_4 %119 = OpLoad %93 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 6 3 
                                                      OpStore %93 %120 
                                       f32_4 %121 = OpLoad %9 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                       f32_4 %123 = OpLoad %93 
                                       f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                         f32 %125 = OpDot %122 %124 
                                                      OpStore %49 %125 
                                         f32 %126 = OpLoad %49 
                                         f32 %127 = OpFNegate %126 
                                         f32 %128 = OpLoad %49 
                                         f32 %129 = OpFMul %127 %128 
                                         f32 %131 = OpFAdd %129 %130 
                                                      OpStore %49 %131 
                                         f32 %132 = OpLoad %49 
                                         f32 %133 = OpExtInst %1 31 %132 
                                                      OpStore %49 %133 
                                         f32 %134 = OpLoad %49 
                                Uniform f32* %136 = OpAccessChain %21 %34 %47 
                                         f32 %137 = OpLoad %136 
                                         f32 %138 = OpFMul %134 %137 
                                                      OpStore %49 %138 
                                       f32_4 %139 = OpLoad %9 
                                       f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
                                       f32_3 %141 = OpFNegate %140 
                                         f32 %142 = OpLoad %49 
                                       f32_3 %143 = OpCompositeConstruct %142 %142 %142 
                                       f32_3 %144 = OpFMul %141 %143 
                                       f32_4 %145 = OpLoad %64 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                       f32_3 %147 = OpFAdd %144 %146 
                                       f32_4 %148 = OpLoad %9 
                                       f32_4 %149 = OpVectorShuffle %148 %147 4 5 6 3 
                                                      OpStore %9 %149 
                                Uniform f32* %153 = OpAccessChain %21 %34 %47 
                                         f32 %154 = OpLoad %153 
                                        bool %156 = OpFOrdNotEqual %154 %155 
                                                      OpStore %152 %156 
                                        bool %157 = OpLoad %152 
                                                      OpSelectionMerge %161 None 
                                                      OpBranchConditional %157 %160 %164 
                                             %160 = OpLabel 
                                       f32_4 %162 = OpLoad %9 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 1 2 
                                                      OpStore %159 %163 
                                                      OpBranch %161 
                                             %164 = OpLabel 
                                       f32_4 %165 = OpLoad %64 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                                      OpStore %159 %166 
                                                      OpBranch %161 
                                             %161 = OpLabel 
                                       f32_3 %167 = OpLoad %159 
                                       f32_4 %168 = OpLoad %9 
                                       f32_4 %169 = OpVectorShuffle %168 %167 4 5 6 3 
                                                      OpStore %9 %169 
                                       f32_4 %170 = OpLoad %9 
                                       f32_4 %171 = OpVectorShuffle %170 %170 1 1 1 1 
                              Uniform f32_4* %173 = OpAccessChain %21 %172 %34 
                                       f32_4 %174 = OpLoad %173 
                                       f32_4 %175 = OpFMul %171 %174 
                                                      OpStore %93 %175 
                              Uniform f32_4* %176 = OpAccessChain %21 %172 %24 
                                       f32_4 %177 = OpLoad %176 
                                       f32_4 %178 = OpLoad %9 
                                       f32_4 %179 = OpVectorShuffle %178 %178 0 0 0 0 
                                       f32_4 %180 = OpFMul %177 %179 
                                       f32_4 %181 = OpLoad %93 
                                       f32_4 %182 = OpFAdd %180 %181 
                                                      OpStore %93 %182 
                              Uniform f32_4* %183 = OpAccessChain %21 %172 %42 
                                       f32_4 %184 = OpLoad %183 
                                       f32_4 %185 = OpLoad %9 
                                       f32_4 %186 = OpVectorShuffle %185 %185 2 2 2 2 
                                       f32_4 %187 = OpFMul %184 %186 
                                       f32_4 %188 = OpLoad %93 
                                       f32_4 %189 = OpFAdd %187 %188 
                                                      OpStore %9 %189 
                              Uniform f32_4* %190 = OpAccessChain %21 %172 %23 
                                       f32_4 %191 = OpLoad %190 
                                       f32_4 %192 = OpLoad %64 
                                       f32_4 %193 = OpVectorShuffle %192 %192 3 3 3 3 
                                       f32_4 %194 = OpFMul %191 %193 
                                       f32_4 %195 = OpLoad %9 
                                       f32_4 %196 = OpFAdd %194 %195 
                                                      OpStore %9 %196 
                                Private f32* %198 = OpAccessChain %9 %197 
                                         f32 %199 = OpLoad %198 
                                Private f32* %200 = OpAccessChain %9 %47 
                                         f32 %201 = OpLoad %200 
                                         f32 %202 = OpExtInst %1 37 %199 %201 
                                Private f32* %203 = OpAccessChain %64 %30 
                                                      OpStore %203 %202 
                                Private f32* %204 = OpAccessChain %9 %47 
                                         f32 %205 = OpLoad %204 
                                         f32 %206 = OpFNegate %205 
                                Private f32* %207 = OpAccessChain %64 %30 
                                         f32 %208 = OpLoad %207 
                                         f32 %209 = OpFAdd %206 %208 
                                Private f32* %210 = OpAccessChain %64 %30 
                                                      OpStore %210 %209 
                                Uniform f32* %215 = OpAccessChain %21 %34 %39 
                                         f32 %216 = OpLoad %215 
                                Private f32* %217 = OpAccessChain %64 %30 
                                         f32 %218 = OpLoad %217 
                                         f32 %219 = OpFMul %216 %218 
                                Private f32* %220 = OpAccessChain %9 %47 
                                         f32 %221 = OpLoad %220 
                                         f32 %222 = OpFAdd %219 %221 
                                 Output f32* %224 = OpAccessChain %214 %24 %47 
                                                      OpStore %224 %222 
                                       f32_4 %225 = OpLoad %9 
                                       f32_3 %226 = OpVectorShuffle %225 %225 0 1 3 
                               Output f32_4* %228 = OpAccessChain %214 %24 
                                       f32_4 %229 = OpLoad %228 
                                       f32_4 %230 = OpVectorShuffle %229 %226 4 5 2 6 
                                                      OpStore %228 %230 
                                 Output f32* %231 = OpAccessChain %214 %24 %39 
                                         f32 %232 = OpLoad %231 
                                         f32 %233 = OpFNegate %232 
                                 Output f32* %234 = OpAccessChain %214 %24 %39 
                                                      OpStore %234 %233 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 13
; Schema: 0
                     OpCapability Shader 
              %1 = OpExtInstImport "GLSL.std.450" 
                     OpMemoryModel Logical GLSL450 
                     OpEntryPoint Fragment %4 "main" %9 
                     OpExecutionMode %4 OriginUpperLeft 
                     OpDecorate %9 Location 9 
              %2 = OpTypeVoid 
              %3 = OpTypeFunction %2 
              %6 = OpTypeFloat 32 
              %7 = OpTypeVector %6 4 
              %8 = OpTypePointer Output %7 
Output f32_4* %9 = OpVariable Output 
         f32 %10 = OpConstant 3.674022E-40 
       f32_4 %11 = OpConstantComposite %10 %10 %10 %10 
         void %4 = OpFunction None %3 
              %5 = OpLabel 
                     OpStore %9 %11 
                     OpReturn
                     OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "SHADOWS_CUBE" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 236
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %12 %66 %214 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %66 Location 66 
                                                      OpMemberDecorate %212 0 BuiltIn 212 
                                                      OpMemberDecorate %212 1 BuiltIn 212 
                                                      OpMemberDecorate %212 2 BuiltIn 212 
                                                      OpDecorate %212 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %7 %7 %16 %17 %18 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4];}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 3 
                                          i32 %24 = OpConstant 0 
                                              %25 = OpTypePointer Uniform %7 
                                          u32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Private %6 
                                          i32 %34 = OpConstant 1 
                                          u32 %39 = OpConstant 1 
                                          i32 %42 = OpConstant 2 
                                          u32 %47 = OpConstant 2 
                                 Private f32* %49 = OpVariable Private 
                               Private f32_4* %64 = OpVariable Private 
                                              %65 = OpTypePointer Input %7 
                                 Input f32_4* %66 = OpVariable Input 
                               Private f32_4* %93 = OpVariable Private 
                                         f32 %130 = OpConstant 3.674022E-40 
                                             %135 = OpTypePointer Uniform %6 
                                             %150 = OpTypeBool 
                                             %151 = OpTypePointer Private %150 
                               Private bool* %152 = OpVariable Private 
                                         f32 %155 = OpConstant 3.674022E-40 
                                             %158 = OpTypePointer Function %10 
                                         i32 %172 = OpConstant 4 
                                         u32 %197 = OpConstant 3 
                                             %211 = OpTypeArray %6 %39 
                                             %212 = OpTypeStruct %7 %6 %211 
                                             %213 = OpTypePointer Output %212 
        Output struct {f32_4; f32; f32[1];}* %214 = OpVariable Output 
                                             %223 = OpTypePointer Output %6 
                                             %227 = OpTypePointer Output %7 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %159 = OpVariable Function 
                                        f32_3 %13 = OpLoad %12 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_3 %28 = OpVectorShuffle %27 %27 0 1 2 
                                          f32 %29 = OpDot %13 %28 
                                 Private f32* %32 = OpAccessChain %9 %30 
                                                      OpStore %32 %29 
                                        f32_3 %33 = OpLoad %12 
                               Uniform f32_4* %35 = OpAccessChain %21 %23 %34 
                                        f32_4 %36 = OpLoad %35 
                                        f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
                                          f32 %38 = OpDot %33 %37 
                                 Private f32* %40 = OpAccessChain %9 %39 
                                                      OpStore %40 %38 
                                        f32_3 %41 = OpLoad %12 
                               Uniform f32_4* %43 = OpAccessChain %21 %23 %42 
                                        f32_4 %44 = OpLoad %43 
                                        f32_3 %45 = OpVectorShuffle %44 %44 0 1 2 
                                          f32 %46 = OpDot %41 %45 
                                 Private f32* %48 = OpAccessChain %9 %47 
                                                      OpStore %48 %46 
                                        f32_4 %50 = OpLoad %9 
                                        f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                        f32_4 %52 = OpLoad %9 
                                        f32_3 %53 = OpVectorShuffle %52 %52 0 1 2 
                                          f32 %54 = OpDot %51 %53 
                                                      OpStore %49 %54 
                                          f32 %55 = OpLoad %49 
                                          f32 %56 = OpExtInst %1 32 %55 
                                                      OpStore %49 %56 
                                          f32 %57 = OpLoad %49 
                                        f32_3 %58 = OpCompositeConstruct %57 %57 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFMul %58 %60 
                                        f32_4 %62 = OpLoad %9 
                                        f32_4 %63 = OpVectorShuffle %62 %61 4 5 6 3 
                                                      OpStore %9 %63 
                                        f32_4 %67 = OpLoad %66 
                                        f32_4 %68 = OpVectorShuffle %67 %67 1 1 1 1 
                               Uniform f32_4* %69 = OpAccessChain %21 %42 %34 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpFMul %68 %70 
                                                      OpStore %64 %71 
                               Uniform f32_4* %72 = OpAccessChain %21 %42 %24 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %66 
                                        f32_4 %75 = OpVectorShuffle %74 %74 0 0 0 0 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %64 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %64 %78 
                               Uniform f32_4* %79 = OpAccessChain %21 %42 %42 
                                        f32_4 %80 = OpLoad %79 
                                        f32_4 %81 = OpLoad %66 
                                        f32_4 %82 = OpVectorShuffle %81 %81 2 2 2 2 
                                        f32_4 %83 = OpFMul %80 %82 
                                        f32_4 %84 = OpLoad %64 
                                        f32_4 %85 = OpFAdd %83 %84 
                                                      OpStore %64 %85 
                               Uniform f32_4* %86 = OpAccessChain %21 %42 %23 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %66 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %64 
                                        f32_4 %92 = OpFAdd %90 %91 
                                                      OpStore %64 %92 
                                        f32_4 %94 = OpLoad %64 
                                        f32_3 %95 = OpVectorShuffle %94 %94 0 1 2 
                                        f32_3 %96 = OpFNegate %95 
                               Uniform f32_4* %97 = OpAccessChain %21 %24 
                                        f32_4 %98 = OpLoad %97 
                                        f32_3 %99 = OpVectorShuffle %98 %98 3 3 3 
                                       f32_3 %100 = OpFMul %96 %99 
                              Uniform f32_4* %101 = OpAccessChain %21 %24 
                                       f32_4 %102 = OpLoad %101 
                                       f32_3 %103 = OpVectorShuffle %102 %102 0 1 2 
                                       f32_3 %104 = OpFAdd %100 %103 
                                       f32_4 %105 = OpLoad %93 
                                       f32_4 %106 = OpVectorShuffle %105 %104 4 5 6 3 
                                                      OpStore %93 %106 
                                       f32_4 %107 = OpLoad %93 
                                       f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                       f32_4 %109 = OpLoad %93 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                                         f32 %111 = OpDot %108 %110 
                                                      OpStore %49 %111 
                                         f32 %112 = OpLoad %49 
                                         f32 %113 = OpExtInst %1 32 %112 
                                                      OpStore %49 %113 
                                         f32 %114 = OpLoad %49 
                                       f32_3 %115 = OpCompositeConstruct %114 %114 %114 
                                       f32_4 %116 = OpLoad %93 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_3 %118 = OpFMul %115 %117 
                                       f32_4 %119 = OpLoad %93 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 6 3 
                                                      OpStore %93 %120 
                                       f32_4 %121 = OpLoad %9 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                       f32_4 %123 = OpLoad %93 
                                       f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                         f32 %125 = OpDot %122 %124 
                                                      OpStore %49 %125 
                                         f32 %126 = OpLoad %49 
                                         f32 %127 = OpFNegate %126 
                                         f32 %128 = OpLoad %49 
                                         f32 %129 = OpFMul %127 %128 
                                         f32 %131 = OpFAdd %129 %130 
                                                      OpStore %49 %131 
                                         f32 %132 = OpLoad %49 
                                         f32 %133 = OpExtInst %1 31 %132 
                                                      OpStore %49 %133 
                                         f32 %134 = OpLoad %49 
                                Uniform f32* %136 = OpAccessChain %21 %34 %47 
                                         f32 %137 = OpLoad %136 
                                         f32 %138 = OpFMul %134 %137 
                                                      OpStore %49 %138 
                                       f32_4 %139 = OpLoad %9 
                                       f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
                                       f32_3 %141 = OpFNegate %140 
                                         f32 %142 = OpLoad %49 
                                       f32_3 %143 = OpCompositeConstruct %142 %142 %142 
                                       f32_3 %144 = OpFMul %141 %143 
                                       f32_4 %145 = OpLoad %64 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                       f32_3 %147 = OpFAdd %144 %146 
                                       f32_4 %148 = OpLoad %9 
                                       f32_4 %149 = OpVectorShuffle %148 %147 4 5 6 3 
                                                      OpStore %9 %149 
                                Uniform f32* %153 = OpAccessChain %21 %34 %47 
                                         f32 %154 = OpLoad %153 
                                        bool %156 = OpFOrdNotEqual %154 %155 
                                                      OpStore %152 %156 
                                        bool %157 = OpLoad %152 
                                                      OpSelectionMerge %161 None 
                                                      OpBranchConditional %157 %160 %164 
                                             %160 = OpLabel 
                                       f32_4 %162 = OpLoad %9 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 1 2 
                                                      OpStore %159 %163 
                                                      OpBranch %161 
                                             %164 = OpLabel 
                                       f32_4 %165 = OpLoad %64 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                                      OpStore %159 %166 
                                                      OpBranch %161 
                                             %161 = OpLabel 
                                       f32_3 %167 = OpLoad %159 
                                       f32_4 %168 = OpLoad %9 
                                       f32_4 %169 = OpVectorShuffle %168 %167 4 5 6 3 
                                                      OpStore %9 %169 
                                       f32_4 %170 = OpLoad %9 
                                       f32_4 %171 = OpVectorShuffle %170 %170 1 1 1 1 
                              Uniform f32_4* %173 = OpAccessChain %21 %172 %34 
                                       f32_4 %174 = OpLoad %173 
                                       f32_4 %175 = OpFMul %171 %174 
                                                      OpStore %93 %175 
                              Uniform f32_4* %176 = OpAccessChain %21 %172 %24 
                                       f32_4 %177 = OpLoad %176 
                                       f32_4 %178 = OpLoad %9 
                                       f32_4 %179 = OpVectorShuffle %178 %178 0 0 0 0 
                                       f32_4 %180 = OpFMul %177 %179 
                                       f32_4 %181 = OpLoad %93 
                                       f32_4 %182 = OpFAdd %180 %181 
                                                      OpStore %93 %182 
                              Uniform f32_4* %183 = OpAccessChain %21 %172 %42 
                                       f32_4 %184 = OpLoad %183 
                                       f32_4 %185 = OpLoad %9 
                                       f32_4 %186 = OpVectorShuffle %185 %185 2 2 2 2 
                                       f32_4 %187 = OpFMul %184 %186 
                                       f32_4 %188 = OpLoad %93 
                                       f32_4 %189 = OpFAdd %187 %188 
                                                      OpStore %9 %189 
                              Uniform f32_4* %190 = OpAccessChain %21 %172 %23 
                                       f32_4 %191 = OpLoad %190 
                                       f32_4 %192 = OpLoad %64 
                                       f32_4 %193 = OpVectorShuffle %192 %192 3 3 3 3 
                                       f32_4 %194 = OpFMul %191 %193 
                                       f32_4 %195 = OpLoad %9 
                                       f32_4 %196 = OpFAdd %194 %195 
                                                      OpStore %9 %196 
                                Private f32* %198 = OpAccessChain %9 %197 
                                         f32 %199 = OpLoad %198 
                                Private f32* %200 = OpAccessChain %9 %47 
                                         f32 %201 = OpLoad %200 
                                         f32 %202 = OpExtInst %1 37 %199 %201 
                                Private f32* %203 = OpAccessChain %64 %30 
                                                      OpStore %203 %202 
                                Private f32* %204 = OpAccessChain %9 %47 
                                         f32 %205 = OpLoad %204 
                                         f32 %206 = OpFNegate %205 
                                Private f32* %207 = OpAccessChain %64 %30 
                                         f32 %208 = OpLoad %207 
                                         f32 %209 = OpFAdd %206 %208 
                                Private f32* %210 = OpAccessChain %64 %30 
                                                      OpStore %210 %209 
                                Uniform f32* %215 = OpAccessChain %21 %34 %39 
                                         f32 %216 = OpLoad %215 
                                Private f32* %217 = OpAccessChain %64 %30 
                                         f32 %218 = OpLoad %217 
                                         f32 %219 = OpFMul %216 %218 
                                Private f32* %220 = OpAccessChain %9 %47 
                                         f32 %221 = OpLoad %220 
                                         f32 %222 = OpFAdd %219 %221 
                                 Output f32* %224 = OpAccessChain %214 %24 %47 
                                                      OpStore %224 %222 
                                       f32_4 %225 = OpLoad %9 
                                       f32_3 %226 = OpVectorShuffle %225 %225 0 1 3 
                               Output f32_4* %228 = OpAccessChain %214 %24 
                                       f32_4 %229 = OpLoad %228 
                                       f32_4 %230 = OpVectorShuffle %229 %226 4 5 2 6 
                                                      OpStore %228 %230 
                                 Output f32* %231 = OpAccessChain %214 %24 %39 
                                         f32 %232 = OpLoad %231 
                                         f32 %233 = OpFNegate %232 
                                 Output f32* %234 = OpAccessChain %214 %24 %39 
                                                      OpStore %234 %233 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 13
; Schema: 0
                     OpCapability Shader 
              %1 = OpExtInstImport "GLSL.std.450" 
                     OpMemoryModel Logical GLSL450 
                     OpEntryPoint Fragment %4 "main" %9 
                     OpExecutionMode %4 OriginUpperLeft 
                     OpDecorate %9 Location 9 
              %2 = OpTypeVoid 
              %3 = OpTypeFunction %2 
              %6 = OpTypeFloat 32 
              %7 = OpTypeVector %6 4 
              %8 = OpTypePointer Output %7 
Output f32_4* %9 = OpVariable Output 
         f32 %10 = OpConstant 3.674022E-40 
       f32_4 %11 = OpConstantComposite %10 %10 %10 %10 
         void %4 = OpFunction None %3 
              %5 = OpLabel 
                     OpStore %9 %11 
                     OpReturn
                     OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "SHADOWS_CUBE" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 236
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %12 %66 %214 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %66 Location 66 
                                                      OpMemberDecorate %212 0 BuiltIn 212 
                                                      OpMemberDecorate %212 1 BuiltIn 212 
                                                      OpMemberDecorate %212 2 BuiltIn 212 
                                                      OpDecorate %212 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeStruct %7 %7 %16 %17 %18 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4];}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 3 
                                          i32 %24 = OpConstant 0 
                                              %25 = OpTypePointer Uniform %7 
                                          u32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Private %6 
                                          i32 %34 = OpConstant 1 
                                          u32 %39 = OpConstant 1 
                                          i32 %42 = OpConstant 2 
                                          u32 %47 = OpConstant 2 
                                 Private f32* %49 = OpVariable Private 
                               Private f32_4* %64 = OpVariable Private 
                                              %65 = OpTypePointer Input %7 
                                 Input f32_4* %66 = OpVariable Input 
                               Private f32_4* %93 = OpVariable Private 
                                         f32 %130 = OpConstant 3.674022E-40 
                                             %135 = OpTypePointer Uniform %6 
                                             %150 = OpTypeBool 
                                             %151 = OpTypePointer Private %150 
                               Private bool* %152 = OpVariable Private 
                                         f32 %155 = OpConstant 3.674022E-40 
                                             %158 = OpTypePointer Function %10 
                                         i32 %172 = OpConstant 4 
                                         u32 %197 = OpConstant 3 
                                             %211 = OpTypeArray %6 %39 
                                             %212 = OpTypeStruct %7 %6 %211 
                                             %213 = OpTypePointer Output %212 
        Output struct {f32_4; f32; f32[1];}* %214 = OpVariable Output 
                                             %223 = OpTypePointer Output %6 
                                             %227 = OpTypePointer Output %7 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_3* %159 = OpVariable Function 
                                        f32_3 %13 = OpLoad %12 
                               Uniform f32_4* %26 = OpAccessChain %21 %23 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_3 %28 = OpVectorShuffle %27 %27 0 1 2 
                                          f32 %29 = OpDot %13 %28 
                                 Private f32* %32 = OpAccessChain %9 %30 
                                                      OpStore %32 %29 
                                        f32_3 %33 = OpLoad %12 
                               Uniform f32_4* %35 = OpAccessChain %21 %23 %34 
                                        f32_4 %36 = OpLoad %35 
                                        f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
                                          f32 %38 = OpDot %33 %37 
                                 Private f32* %40 = OpAccessChain %9 %39 
                                                      OpStore %40 %38 
                                        f32_3 %41 = OpLoad %12 
                               Uniform f32_4* %43 = OpAccessChain %21 %23 %42 
                                        f32_4 %44 = OpLoad %43 
                                        f32_3 %45 = OpVectorShuffle %44 %44 0 1 2 
                                          f32 %46 = OpDot %41 %45 
                                 Private f32* %48 = OpAccessChain %9 %47 
                                                      OpStore %48 %46 
                                        f32_4 %50 = OpLoad %9 
                                        f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                        f32_4 %52 = OpLoad %9 
                                        f32_3 %53 = OpVectorShuffle %52 %52 0 1 2 
                                          f32 %54 = OpDot %51 %53 
                                                      OpStore %49 %54 
                                          f32 %55 = OpLoad %49 
                                          f32 %56 = OpExtInst %1 32 %55 
                                                      OpStore %49 %56 
                                          f32 %57 = OpLoad %49 
                                        f32_3 %58 = OpCompositeConstruct %57 %57 %57 
                                        f32_4 %59 = OpLoad %9 
                                        f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                        f32_3 %61 = OpFMul %58 %60 
                                        f32_4 %62 = OpLoad %9 
                                        f32_4 %63 = OpVectorShuffle %62 %61 4 5 6 3 
                                                      OpStore %9 %63 
                                        f32_4 %67 = OpLoad %66 
                                        f32_4 %68 = OpVectorShuffle %67 %67 1 1 1 1 
                               Uniform f32_4* %69 = OpAccessChain %21 %42 %34 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpFMul %68 %70 
                                                      OpStore %64 %71 
                               Uniform f32_4* %72 = OpAccessChain %21 %42 %24 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %66 
                                        f32_4 %75 = OpVectorShuffle %74 %74 0 0 0 0 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %64 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %64 %78 
                               Uniform f32_4* %79 = OpAccessChain %21 %42 %42 
                                        f32_4 %80 = OpLoad %79 
                                        f32_4 %81 = OpLoad %66 
                                        f32_4 %82 = OpVectorShuffle %81 %81 2 2 2 2 
                                        f32_4 %83 = OpFMul %80 %82 
                                        f32_4 %84 = OpLoad %64 
                                        f32_4 %85 = OpFAdd %83 %84 
                                                      OpStore %64 %85 
                               Uniform f32_4* %86 = OpAccessChain %21 %42 %23 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpLoad %66 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %64 
                                        f32_4 %92 = OpFAdd %90 %91 
                                                      OpStore %64 %92 
                                        f32_4 %94 = OpLoad %64 
                                        f32_3 %95 = OpVectorShuffle %94 %94 0 1 2 
                                        f32_3 %96 = OpFNegate %95 
                               Uniform f32_4* %97 = OpAccessChain %21 %24 
                                        f32_4 %98 = OpLoad %97 
                                        f32_3 %99 = OpVectorShuffle %98 %98 3 3 3 
                                       f32_3 %100 = OpFMul %96 %99 
                              Uniform f32_4* %101 = OpAccessChain %21 %24 
                                       f32_4 %102 = OpLoad %101 
                                       f32_3 %103 = OpVectorShuffle %102 %102 0 1 2 
                                       f32_3 %104 = OpFAdd %100 %103 
                                       f32_4 %105 = OpLoad %93 
                                       f32_4 %106 = OpVectorShuffle %105 %104 4 5 6 3 
                                                      OpStore %93 %106 
                                       f32_4 %107 = OpLoad %93 
                                       f32_3 %108 = OpVectorShuffle %107 %107 0 1 2 
                                       f32_4 %109 = OpLoad %93 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 1 2 
                                         f32 %111 = OpDot %108 %110 
                                                      OpStore %49 %111 
                                         f32 %112 = OpLoad %49 
                                         f32 %113 = OpExtInst %1 32 %112 
                                                      OpStore %49 %113 
                                         f32 %114 = OpLoad %49 
                                       f32_3 %115 = OpCompositeConstruct %114 %114 %114 
                                       f32_4 %116 = OpLoad %93 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_3 %118 = OpFMul %115 %117 
                                       f32_4 %119 = OpLoad %93 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 6 3 
                                                      OpStore %93 %120 
                                       f32_4 %121 = OpLoad %9 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                       f32_4 %123 = OpLoad %93 
                                       f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                         f32 %125 = OpDot %122 %124 
                                                      OpStore %49 %125 
                                         f32 %126 = OpLoad %49 
                                         f32 %127 = OpFNegate %126 
                                         f32 %128 = OpLoad %49 
                                         f32 %129 = OpFMul %127 %128 
                                         f32 %131 = OpFAdd %129 %130 
                                                      OpStore %49 %131 
                                         f32 %132 = OpLoad %49 
                                         f32 %133 = OpExtInst %1 31 %132 
                                                      OpStore %49 %133 
                                         f32 %134 = OpLoad %49 
                                Uniform f32* %136 = OpAccessChain %21 %34 %47 
                                         f32 %137 = OpLoad %136 
                                         f32 %138 = OpFMul %134 %137 
                                                      OpStore %49 %138 
                                       f32_4 %139 = OpLoad %9 
                                       f32_3 %140 = OpVectorShuffle %139 %139 0 1 2 
                                       f32_3 %141 = OpFNegate %140 
                                         f32 %142 = OpLoad %49 
                                       f32_3 %143 = OpCompositeConstruct %142 %142 %142 
                                       f32_3 %144 = OpFMul %141 %143 
                                       f32_4 %145 = OpLoad %64 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                       f32_3 %147 = OpFAdd %144 %146 
                                       f32_4 %148 = OpLoad %9 
                                       f32_4 %149 = OpVectorShuffle %148 %147 4 5 6 3 
                                                      OpStore %9 %149 
                                Uniform f32* %153 = OpAccessChain %21 %34 %47 
                                         f32 %154 = OpLoad %153 
                                        bool %156 = OpFOrdNotEqual %154 %155 
                                                      OpStore %152 %156 
                                        bool %157 = OpLoad %152 
                                                      OpSelectionMerge %161 None 
                                                      OpBranchConditional %157 %160 %164 
                                             %160 = OpLabel 
                                       f32_4 %162 = OpLoad %9 
                                       f32_3 %163 = OpVectorShuffle %162 %162 0 1 2 
                                                      OpStore %159 %163 
                                                      OpBranch %161 
                                             %164 = OpLabel 
                                       f32_4 %165 = OpLoad %64 
                                       f32_3 %166 = OpVectorShuffle %165 %165 0 1 2 
                                                      OpStore %159 %166 
                                                      OpBranch %161 
                                             %161 = OpLabel 
                                       f32_3 %167 = OpLoad %159 
                                       f32_4 %168 = OpLoad %9 
                                       f32_4 %169 = OpVectorShuffle %168 %167 4 5 6 3 
                                                      OpStore %9 %169 
                                       f32_4 %170 = OpLoad %9 
                                       f32_4 %171 = OpVectorShuffle %170 %170 1 1 1 1 
                              Uniform f32_4* %173 = OpAccessChain %21 %172 %34 
                                       f32_4 %174 = OpLoad %173 
                                       f32_4 %175 = OpFMul %171 %174 
                                                      OpStore %93 %175 
                              Uniform f32_4* %176 = OpAccessChain %21 %172 %24 
                                       f32_4 %177 = OpLoad %176 
                                       f32_4 %178 = OpLoad %9 
                                       f32_4 %179 = OpVectorShuffle %178 %178 0 0 0 0 
                                       f32_4 %180 = OpFMul %177 %179 
                                       f32_4 %181 = OpLoad %93 
                                       f32_4 %182 = OpFAdd %180 %181 
                                                      OpStore %93 %182 
                              Uniform f32_4* %183 = OpAccessChain %21 %172 %42 
                                       f32_4 %184 = OpLoad %183 
                                       f32_4 %185 = OpLoad %9 
                                       f32_4 %186 = OpVectorShuffle %185 %185 2 2 2 2 
                                       f32_4 %187 = OpFMul %184 %186 
                                       f32_4 %188 = OpLoad %93 
                                       f32_4 %189 = OpFAdd %187 %188 
                                                      OpStore %9 %189 
                              Uniform f32_4* %190 = OpAccessChain %21 %172 %23 
                                       f32_4 %191 = OpLoad %190 
                                       f32_4 %192 = OpLoad %64 
                                       f32_4 %193 = OpVectorShuffle %192 %192 3 3 3 3 
                                       f32_4 %194 = OpFMul %191 %193 
                                       f32_4 %195 = OpLoad %9 
                                       f32_4 %196 = OpFAdd %194 %195 
                                                      OpStore %9 %196 
                                Private f32* %198 = OpAccessChain %9 %197 
                                         f32 %199 = OpLoad %198 
                                Private f32* %200 = OpAccessChain %9 %47 
                                         f32 %201 = OpLoad %200 
                                         f32 %202 = OpExtInst %1 37 %199 %201 
                                Private f32* %203 = OpAccessChain %64 %30 
                                                      OpStore %203 %202 
                                Private f32* %204 = OpAccessChain %9 %47 
                                         f32 %205 = OpLoad %204 
                                         f32 %206 = OpFNegate %205 
                                Private f32* %207 = OpAccessChain %64 %30 
                                         f32 %208 = OpLoad %207 
                                         f32 %209 = OpFAdd %206 %208 
                                Private f32* %210 = OpAccessChain %64 %30 
                                                      OpStore %210 %209 
                                Uniform f32* %215 = OpAccessChain %21 %34 %39 
                                         f32 %216 = OpLoad %215 
                                Private f32* %217 = OpAccessChain %64 %30 
                                         f32 %218 = OpLoad %217 
                                         f32 %219 = OpFMul %216 %218 
                                Private f32* %220 = OpAccessChain %9 %47 
                                         f32 %221 = OpLoad %220 
                                         f32 %222 = OpFAdd %219 %221 
                                 Output f32* %224 = OpAccessChain %214 %24 %47 
                                                      OpStore %224 %222 
                                       f32_4 %225 = OpLoad %9 
                                       f32_3 %226 = OpVectorShuffle %225 %225 0 1 3 
                               Output f32_4* %228 = OpAccessChain %214 %24 
                                       f32_4 %229 = OpLoad %228 
                                       f32_4 %230 = OpVectorShuffle %229 %226 4 5 2 6 
                                                      OpStore %228 %230 
                                 Output f32* %231 = OpAccessChain %214 %24 %39 
                                         f32 %232 = OpLoad %231 
                                         f32 %233 = OpFNegate %232 
                                 Output f32* %234 = OpAccessChain %214 %24 %39 
                                                      OpStore %234 %233 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 13
; Schema: 0
                     OpCapability Shader 
              %1 = OpExtInstImport "GLSL.std.450" 
                     OpMemoryModel Logical GLSL450 
                     OpEntryPoint Fragment %4 "main" %9 
                     OpExecutionMode %4 OriginUpperLeft 
                     OpDecorate %9 Location 9 
              %2 = OpTypeVoid 
              %3 = OpTypeFunction %2 
              %6 = OpTypeFloat 32 
              %7 = OpTypeVector %6 4 
              %8 = OpTypePointer Output %7 
Output f32_4* %9 = OpVariable Output 
         f32 %10 = OpConstant 3.674022E-40 
       f32_4 %11 = OpConstantComposite %10 %10 %10 %10 
         void %4 = OpFunction None %3 
              %5 = OpLabel 
                     OpStore %9 %11 
                     OpReturn
                     OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "vulkan hw_tier00 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "vulkan hw_tier01 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "vulkan hw_tier02 " {
Keywords { "SHADOWS_DEPTH" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "vulkan hw_tier00 " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "vulkan hw_tier01 " {
Keywords { "SHADOWS_CUBE" }
""
}
SubProgram "vulkan hw_tier02 " {
Keywords { "SHADOWS_CUBE" }
""
}
}
}
}
}