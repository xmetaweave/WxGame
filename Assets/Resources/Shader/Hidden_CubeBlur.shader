//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/CubeBlur" {
Properties {
_MainTex ("Main", Cube) = "" { }
_Texel ("Texel", Float) = 0.0078125
_Level ("Level", Float) = 0
_Scale ("Scale", Float) = 1
}
SubShader {
 LOD 200
 Tags { "RenderType" = "Opaque" }
 Pass {
  LOD 200
  Tags { "RenderType" = "Opaque" }
  ZTest Always
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 34126
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
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out mediump vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
vec3 ImmCB_0_0_0[4];
uniform 	mediump float _Level;
uniform 	mediump float _Texel;
uniform 	mediump float _Scale;
UNITY_LOCATION(0) uniform mediump samplerCube _MainTex;
in mediump vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
int u_xlati0;
bvec3 u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
int u_xlati7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_11;
bool u_xlatb11;
mediump vec3 u_xlat16_18;
bool u_xlatb18;
int u_xlati22;
mediump float u_xlat16_33;
int u_xlati33;
bool u_xlatb33;
mediump float u_xlat16_34;
mediump float u_xlat16_35;
mediump float u_xlat16_36;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
	ImmCB_0_0_0[0] = vec3(1.0, 0.0, 0.0);
	ImmCB_0_0_0[1] = vec3(0.0, 1.0, 0.0);
	ImmCB_0_0_0[2] = vec3(0.0, 0.0, 1.0);
	ImmCB_0_0_0[3] = vec3(0.0, 0.0, 0.0);
    u_xlatb0.xyz = equal(abs(vs_TEXCOORD0.xyzx), vec4(1.0, 1.0, 1.0, 0.0)).xyz;
    u_xlat16_1.x = (u_xlatb0.x) ? vs_TEXCOORD0.x : float(0.0);
    u_xlat16_1.y = (u_xlatb0.y) ? vs_TEXCOORD0.y : float(0.0);
    u_xlat16_1.z = (u_xlatb0.z) ? vs_TEXCOORD0.z : float(0.0);
    u_xlat16_2.xyz = u_xlat16_1.zxy * vec3(vec3(_Texel, _Texel, _Texel));
    u_xlat16_3.xyz = -abs(u_xlat16_1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD0.xyz;
    u_xlat16_34 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_34 = u_xlat16_34 + 1.0;
    u_xlat16_34 = sqrt(u_xlat16_34);
    u_xlat16_34 = float(1.0) / u_xlat16_34;
    u_xlat16_35 = u_xlat16_34 * u_xlat16_34;
    u_xlat16_3.x = u_xlat16_34 * u_xlat16_35;
    u_xlat16_3.yz = u_xlat16_3.xx * vec2(vec2(_Scale, _Scale));
    u_xlat16_4.x = _Scale;
    u_xlat16_4.y = float(3.0);
    u_xlat16_4.z = float(5.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_4.x = float(0.0);
    u_xlat16_4.y = float(0.0);
    u_xlat16_4.z = float(0.0);
    u_xlat16_34 = 0.0;
    for(int u_xlati_loop_1 = 2 ; u_xlati_loop_1>=0 ; u_xlati_loop_1 = u_xlati_loop_1 + int(0xFFFFFFFFu))
    {
        u_xlat16_35 = float(u_xlati_loop_1);
        u_xlat16_11 = u_xlat16_35 + 0.5;
        u_xlat16_35 = dot(u_xlat16_3.xyz, ImmCB_0_0_0[u_xlati_loop_1].xyz);
        u_xlat16_5.xyz = u_xlat16_4.xyz;
        u_xlat16_36 = u_xlat16_34;
        for(int u_xlati_loop_2 = 0 ; u_xlati_loop_2<2 ; u_xlati_loop_2++)
        {
            u_xlati33 = int(u_xlati_loop_2 << 1);
            u_xlati33 = u_xlati33 + int(0xFFFFFFFFu);
            u_xlat16_37 = float(u_xlati33);
            u_xlat16_33 = u_xlat16_11 * u_xlat16_37;
            u_xlat16_6.xyz = u_xlat16_5.xyz;
            u_xlat16_37 = u_xlat16_36;
            for(int u_xlati_loop_3 = 2 ; u_xlati_loop_3>=0 ; u_xlati_loop_3 = u_xlati_loop_3 + int(0xFFFFFFFFu))
            {
                u_xlat16_38 = float(u_xlati_loop_3);
                u_xlat16_18.x = u_xlat16_38 + 0.5;
                u_xlat16_8.xyz = (-u_xlat16_18.xxx) * u_xlat16_2.xyz + vs_TEXCOORD0.xyz;
                u_xlat16_8.xyz = vec3(u_xlat16_33) * u_xlat16_2.zxy + u_xlat16_8.xyz;
                u_xlat16_9.xyz = max(u_xlat16_8.xyz, vec3(-1.0, -1.0, -1.0));
                u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
                u_xlat16_8.xyz = u_xlat16_8.xyz + (-u_xlat16_9.xyz);
                u_xlat16_38 = max(abs(u_xlat16_8.y), abs(u_xlat16_8.x));
                u_xlat16_38 = max(abs(u_xlat16_8.z), u_xlat16_38);
                u_xlat16_8.xyz = (-vec3(u_xlat16_38)) * u_xlat16_1.xyz + u_xlat16_9.xyz;
                u_xlat16_10.xyz = textureLod(_MainTex, u_xlat16_8.xyz, _Level).xyz;
                u_xlat16_8.xyz = u_xlat16_18.xxx * u_xlat16_2.xyz + vs_TEXCOORD0.xyz;
                u_xlat16_8.xyz = vec3(u_xlat16_33) * u_xlat16_2.zxy + u_xlat16_8.xyz;
                u_xlat16_9.xyz = max(u_xlat16_8.xyz, vec3(-1.0, -1.0, -1.0));
                u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
                u_xlat16_8.xyz = u_xlat16_8.xyz + (-u_xlat16_9.xyz);
                u_xlat16_38 = max(abs(u_xlat16_8.y), abs(u_xlat16_8.x));
                u_xlat16_38 = max(abs(u_xlat16_8.z), u_xlat16_38);
                u_xlat16_8.xyz = (-vec3(u_xlat16_38)) * u_xlat16_1.xyz + u_xlat16_9.xyz;
                u_xlat16_18.xyz = textureLod(_MainTex, u_xlat16_8.xyz, _Level).xyz;
                u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_10.xyz;
                u_xlat16_38 = dot(u_xlat16_3.xyz, ImmCB_0_0_0[u_xlati_loop_3].xyz);
                u_xlat16_38 = u_xlat16_35 * u_xlat16_38;
                u_xlat16_6.xyz = u_xlat16_18.xyz * vec3(u_xlat16_38) + u_xlat16_6.xyz;
                u_xlat16_37 = u_xlat16_38 * 2.0 + u_xlat16_37;
            }
            u_xlat16_5.xyz = u_xlat16_6.xyz;
            u_xlat16_36 = u_xlat16_37;
        }
        u_xlat16_4.xyz = u_xlat16_5.xyz;
        u_xlat16_34 = u_xlat16_36;
    }
    SV_Target0.xyz = u_xlat16_4.xyz / vec3(u_xlat16_34);
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
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out mediump vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
vec3 ImmCB_0_0_0[4];
uniform 	mediump float _Level;
uniform 	mediump float _Texel;
uniform 	mediump float _Scale;
UNITY_LOCATION(0) uniform mediump samplerCube _MainTex;
in mediump vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
int u_xlati0;
bvec3 u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
int u_xlati7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_11;
bool u_xlatb11;
mediump vec3 u_xlat16_18;
bool u_xlatb18;
int u_xlati22;
mediump float u_xlat16_33;
int u_xlati33;
bool u_xlatb33;
mediump float u_xlat16_34;
mediump float u_xlat16_35;
mediump float u_xlat16_36;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
	ImmCB_0_0_0[0] = vec3(1.0, 0.0, 0.0);
	ImmCB_0_0_0[1] = vec3(0.0, 1.0, 0.0);
	ImmCB_0_0_0[2] = vec3(0.0, 0.0, 1.0);
	ImmCB_0_0_0[3] = vec3(0.0, 0.0, 0.0);
    u_xlatb0.xyz = equal(abs(vs_TEXCOORD0.xyzx), vec4(1.0, 1.0, 1.0, 0.0)).xyz;
    u_xlat16_1.x = (u_xlatb0.x) ? vs_TEXCOORD0.x : float(0.0);
    u_xlat16_1.y = (u_xlatb0.y) ? vs_TEXCOORD0.y : float(0.0);
    u_xlat16_1.z = (u_xlatb0.z) ? vs_TEXCOORD0.z : float(0.0);
    u_xlat16_2.xyz = u_xlat16_1.zxy * vec3(vec3(_Texel, _Texel, _Texel));
    u_xlat16_3.xyz = -abs(u_xlat16_1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD0.xyz;
    u_xlat16_34 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_34 = u_xlat16_34 + 1.0;
    u_xlat16_34 = sqrt(u_xlat16_34);
    u_xlat16_34 = float(1.0) / u_xlat16_34;
    u_xlat16_35 = u_xlat16_34 * u_xlat16_34;
    u_xlat16_3.x = u_xlat16_34 * u_xlat16_35;
    u_xlat16_3.yz = u_xlat16_3.xx * vec2(vec2(_Scale, _Scale));
    u_xlat16_4.x = _Scale;
    u_xlat16_4.y = float(3.0);
    u_xlat16_4.z = float(5.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_4.x = float(0.0);
    u_xlat16_4.y = float(0.0);
    u_xlat16_4.z = float(0.0);
    u_xlat16_34 = 0.0;
    for(int u_xlati_loop_1 = 2 ; u_xlati_loop_1>=0 ; u_xlati_loop_1 = u_xlati_loop_1 + int(0xFFFFFFFFu))
    {
        u_xlat16_35 = float(u_xlati_loop_1);
        u_xlat16_11 = u_xlat16_35 + 0.5;
        u_xlat16_35 = dot(u_xlat16_3.xyz, ImmCB_0_0_0[u_xlati_loop_1].xyz);
        u_xlat16_5.xyz = u_xlat16_4.xyz;
        u_xlat16_36 = u_xlat16_34;
        for(int u_xlati_loop_2 = 0 ; u_xlati_loop_2<2 ; u_xlati_loop_2++)
        {
            u_xlati33 = int(u_xlati_loop_2 << 1);
            u_xlati33 = u_xlati33 + int(0xFFFFFFFFu);
            u_xlat16_37 = float(u_xlati33);
            u_xlat16_33 = u_xlat16_11 * u_xlat16_37;
            u_xlat16_6.xyz = u_xlat16_5.xyz;
            u_xlat16_37 = u_xlat16_36;
            for(int u_xlati_loop_3 = 2 ; u_xlati_loop_3>=0 ; u_xlati_loop_3 = u_xlati_loop_3 + int(0xFFFFFFFFu))
            {
                u_xlat16_38 = float(u_xlati_loop_3);
                u_xlat16_18.x = u_xlat16_38 + 0.5;
                u_xlat16_8.xyz = (-u_xlat16_18.xxx) * u_xlat16_2.xyz + vs_TEXCOORD0.xyz;
                u_xlat16_8.xyz = vec3(u_xlat16_33) * u_xlat16_2.zxy + u_xlat16_8.xyz;
                u_xlat16_9.xyz = max(u_xlat16_8.xyz, vec3(-1.0, -1.0, -1.0));
                u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
                u_xlat16_8.xyz = u_xlat16_8.xyz + (-u_xlat16_9.xyz);
                u_xlat16_38 = max(abs(u_xlat16_8.y), abs(u_xlat16_8.x));
                u_xlat16_38 = max(abs(u_xlat16_8.z), u_xlat16_38);
                u_xlat16_8.xyz = (-vec3(u_xlat16_38)) * u_xlat16_1.xyz + u_xlat16_9.xyz;
                u_xlat16_10.xyz = textureLod(_MainTex, u_xlat16_8.xyz, _Level).xyz;
                u_xlat16_8.xyz = u_xlat16_18.xxx * u_xlat16_2.xyz + vs_TEXCOORD0.xyz;
                u_xlat16_8.xyz = vec3(u_xlat16_33) * u_xlat16_2.zxy + u_xlat16_8.xyz;
                u_xlat16_9.xyz = max(u_xlat16_8.xyz, vec3(-1.0, -1.0, -1.0));
                u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
                u_xlat16_8.xyz = u_xlat16_8.xyz + (-u_xlat16_9.xyz);
                u_xlat16_38 = max(abs(u_xlat16_8.y), abs(u_xlat16_8.x));
                u_xlat16_38 = max(abs(u_xlat16_8.z), u_xlat16_38);
                u_xlat16_8.xyz = (-vec3(u_xlat16_38)) * u_xlat16_1.xyz + u_xlat16_9.xyz;
                u_xlat16_18.xyz = textureLod(_MainTex, u_xlat16_8.xyz, _Level).xyz;
                u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_10.xyz;
                u_xlat16_38 = dot(u_xlat16_3.xyz, ImmCB_0_0_0[u_xlati_loop_3].xyz);
                u_xlat16_38 = u_xlat16_35 * u_xlat16_38;
                u_xlat16_6.xyz = u_xlat16_18.xyz * vec3(u_xlat16_38) + u_xlat16_6.xyz;
                u_xlat16_37 = u_xlat16_38 * 2.0 + u_xlat16_37;
            }
            u_xlat16_5.xyz = u_xlat16_6.xyz;
            u_xlat16_36 = u_xlat16_37;
        }
        u_xlat16_4.xyz = u_xlat16_5.xyz;
        u_xlat16_34 = u_xlat16_36;
    }
    SV_Target0.xyz = u_xlat16_4.xyz / vec3(u_xlat16_34);
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
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out mediump vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
vec3 ImmCB_0_0_0[4];
uniform 	mediump float _Level;
uniform 	mediump float _Texel;
uniform 	mediump float _Scale;
UNITY_LOCATION(0) uniform mediump samplerCube _MainTex;
in mediump vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
int u_xlati0;
bvec3 u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
int u_xlati7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump float u_xlat16_11;
bool u_xlatb11;
mediump vec3 u_xlat16_18;
bool u_xlatb18;
int u_xlati22;
mediump float u_xlat16_33;
int u_xlati33;
bool u_xlatb33;
mediump float u_xlat16_34;
mediump float u_xlat16_35;
mediump float u_xlat16_36;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
void main()
{
	ImmCB_0_0_0[0] = vec3(1.0, 0.0, 0.0);
	ImmCB_0_0_0[1] = vec3(0.0, 1.0, 0.0);
	ImmCB_0_0_0[2] = vec3(0.0, 0.0, 1.0);
	ImmCB_0_0_0[3] = vec3(0.0, 0.0, 0.0);
    u_xlatb0.xyz = equal(abs(vs_TEXCOORD0.xyzx), vec4(1.0, 1.0, 1.0, 0.0)).xyz;
    u_xlat16_1.x = (u_xlatb0.x) ? vs_TEXCOORD0.x : float(0.0);
    u_xlat16_1.y = (u_xlatb0.y) ? vs_TEXCOORD0.y : float(0.0);
    u_xlat16_1.z = (u_xlatb0.z) ? vs_TEXCOORD0.z : float(0.0);
    u_xlat16_2.xyz = u_xlat16_1.zxy * vec3(vec3(_Texel, _Texel, _Texel));
    u_xlat16_3.xyz = -abs(u_xlat16_1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_TEXCOORD0.xyz;
    u_xlat16_34 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_34 = u_xlat16_34 + 1.0;
    u_xlat16_34 = sqrt(u_xlat16_34);
    u_xlat16_34 = float(1.0) / u_xlat16_34;
    u_xlat16_35 = u_xlat16_34 * u_xlat16_34;
    u_xlat16_3.x = u_xlat16_34 * u_xlat16_35;
    u_xlat16_3.yz = u_xlat16_3.xx * vec2(vec2(_Scale, _Scale));
    u_xlat16_4.x = _Scale;
    u_xlat16_4.y = float(3.0);
    u_xlat16_4.z = float(5.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(1.44269502, 1.44269502, 1.44269502);
    u_xlat16_3.xyz = exp2(u_xlat16_3.xyz);
    u_xlat16_4.x = float(0.0);
    u_xlat16_4.y = float(0.0);
    u_xlat16_4.z = float(0.0);
    u_xlat16_34 = 0.0;
    for(int u_xlati_loop_1 = 2 ; u_xlati_loop_1>=0 ; u_xlati_loop_1 = u_xlati_loop_1 + int(0xFFFFFFFFu))
    {
        u_xlat16_35 = float(u_xlati_loop_1);
        u_xlat16_11 = u_xlat16_35 + 0.5;
        u_xlat16_35 = dot(u_xlat16_3.xyz, ImmCB_0_0_0[u_xlati_loop_1].xyz);
        u_xlat16_5.xyz = u_xlat16_4.xyz;
        u_xlat16_36 = u_xlat16_34;
        for(int u_xlati_loop_2 = 0 ; u_xlati_loop_2<2 ; u_xlati_loop_2++)
        {
            u_xlati33 = int(u_xlati_loop_2 << 1);
            u_xlati33 = u_xlati33 + int(0xFFFFFFFFu);
            u_xlat16_37 = float(u_xlati33);
            u_xlat16_33 = u_xlat16_11 * u_xlat16_37;
            u_xlat16_6.xyz = u_xlat16_5.xyz;
            u_xlat16_37 = u_xlat16_36;
            for(int u_xlati_loop_3 = 2 ; u_xlati_loop_3>=0 ; u_xlati_loop_3 = u_xlati_loop_3 + int(0xFFFFFFFFu))
            {
                u_xlat16_38 = float(u_xlati_loop_3);
                u_xlat16_18.x = u_xlat16_38 + 0.5;
                u_xlat16_8.xyz = (-u_xlat16_18.xxx) * u_xlat16_2.xyz + vs_TEXCOORD0.xyz;
                u_xlat16_8.xyz = vec3(u_xlat16_33) * u_xlat16_2.zxy + u_xlat16_8.xyz;
                u_xlat16_9.xyz = max(u_xlat16_8.xyz, vec3(-1.0, -1.0, -1.0));
                u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
                u_xlat16_8.xyz = u_xlat16_8.xyz + (-u_xlat16_9.xyz);
                u_xlat16_38 = max(abs(u_xlat16_8.y), abs(u_xlat16_8.x));
                u_xlat16_38 = max(abs(u_xlat16_8.z), u_xlat16_38);
                u_xlat16_8.xyz = (-vec3(u_xlat16_38)) * u_xlat16_1.xyz + u_xlat16_9.xyz;
                u_xlat16_10.xyz = textureLod(_MainTex, u_xlat16_8.xyz, _Level).xyz;
                u_xlat16_8.xyz = u_xlat16_18.xxx * u_xlat16_2.xyz + vs_TEXCOORD0.xyz;
                u_xlat16_8.xyz = vec3(u_xlat16_33) * u_xlat16_2.zxy + u_xlat16_8.xyz;
                u_xlat16_9.xyz = max(u_xlat16_8.xyz, vec3(-1.0, -1.0, -1.0));
                u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
                u_xlat16_8.xyz = u_xlat16_8.xyz + (-u_xlat16_9.xyz);
                u_xlat16_38 = max(abs(u_xlat16_8.y), abs(u_xlat16_8.x));
                u_xlat16_38 = max(abs(u_xlat16_8.z), u_xlat16_38);
                u_xlat16_8.xyz = (-vec3(u_xlat16_38)) * u_xlat16_1.xyz + u_xlat16_9.xyz;
                u_xlat16_18.xyz = textureLod(_MainTex, u_xlat16_8.xyz, _Level).xyz;
                u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_10.xyz;
                u_xlat16_38 = dot(u_xlat16_3.xyz, ImmCB_0_0_0[u_xlati_loop_3].xyz);
                u_xlat16_38 = u_xlat16_35 * u_xlat16_38;
                u_xlat16_6.xyz = u_xlat16_18.xyz * vec3(u_xlat16_38) + u_xlat16_6.xyz;
                u_xlat16_37 = u_xlat16_38 * 2.0 + u_xlat16_37;
            }
            u_xlat16_5.xyz = u_xlat16_6.xyz;
            u_xlat16_36 = u_xlat16_37;
        }
        u_xlat16_4.xyz = u_xlat16_5.xyz;
        u_xlat16_34 = u_xlat16_36;
    }
    SV_Target0.xyz = u_xlat16_4.xyz / vec3(u_xlat16_34);
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
; Bound: 92
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %79 %83 %84 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %77 0 BuiltIn 77 
                                              OpMemberDecorate %77 1 BuiltIn 77 
                                              OpMemberDecorate %77 2 BuiltIn 77 
                                              OpDecorate %77 Block 
                                              OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD0 Location 83 
                                              OpDecorate %84 Location 84 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypePointer Input %7 
                         Input f32_4* %11 = OpVariable Input 
                                      %14 = OpTypeInt 32 0 
                                  u32 %15 = OpConstant 4 
                                      %16 = OpTypeArray %7 %15 
                                      %17 = OpTypeArray %7 %15 
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %75 = OpConstant 1 
                                      %76 = OpTypeArray %6 %75 
                                      %77 = OpTypeStruct %7 %6 %76 
                                      %78 = OpTypePointer Output %77 
 Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
                                      %81 = OpTypePointer Output %7 
               Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                         Input f32_4* %84 = OpVariable Input 
                                      %86 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %43 = OpLoad %9 
                       Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                f32_4 %46 = OpLoad %45 
                                f32_4 %47 = OpFAdd %43 %46 
                                              OpStore %9 %47 
                                f32_4 %49 = OpLoad %9 
                                f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFMul %50 %52 
                                              OpStore %48 %53 
                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %48 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %48 %60 
                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                f32_4 %62 = OpLoad %61 
                                f32_4 %63 = OpLoad %9 
                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                f32_4 %65 = OpFMul %62 %64 
                                f32_4 %66 = OpLoad %48 
                                f32_4 %67 = OpFAdd %65 %66 
                                              OpStore %48 %67 
                       Uniform f32_4* %68 = OpAccessChain %20 %23 %44 
                                f32_4 %69 = OpLoad %68 
                                f32_4 %70 = OpLoad %9 
                                f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                f32_4 %72 = OpFMul %69 %71 
                                f32_4 %73 = OpLoad %48 
                                f32_4 %74 = OpFAdd %72 %73 
                                              OpStore %9 %74 
                                f32_4 %80 = OpLoad %9 
                        Output f32_4* %82 = OpAccessChain %79 %22 
                                              OpStore %82 %80 
                                f32_4 %85 = OpLoad %84 
                                              OpStore vs_TEXCOORD0 %85 
                          Output f32* %87 = OpAccessChain %79 %22 %75 
                                  f32 %88 = OpLoad %87 
                                  f32 %89 = OpFNegate %88 
                          Output f32* %90 = OpAccessChain %79 %22 %75 
                                              OpStore %90 %89 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 397
; Schema: 0
                                                OpCapability Shader 
                                         %1 = OpExtInstImport "GLSL.std.450" 
                                                OpMemoryModel Logical GLSL450 
                                                OpEntryPoint Fragment %4 "main" %13 %380 
                                                OpExecutionMode %4 OriginUpperLeft 
                                                OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                                OpDecorate vs_TEXCOORD0 Location 13 
                                                OpDecorate %14 RelaxedPrecision 
                                                OpDecorate %15 RelaxedPrecision 
                                                OpDecorate %16 RelaxedPrecision 
                                                OpDecorate %21 RelaxedPrecision 
                                                OpDecorate %25 RelaxedPrecision 
                                                OpDecorate %37 RelaxedPrecision 
                                                OpDecorate %39 RelaxedPrecision 
                                                OpDecorate %49 RelaxedPrecision 
                                                OpDecorate %51 RelaxedPrecision 
                                                OpDecorate %60 RelaxedPrecision 
                                                OpDecorate %62 RelaxedPrecision 
                                                OpDecorate %64 RelaxedPrecision 
                                                OpDecorate %65 RelaxedPrecision 
                                                OpDecorate %66 RelaxedPrecision 
                                                OpMemberDecorate %67 0 RelaxedPrecision 
                                                OpMemberDecorate %67 0 Offset 67 
                                                OpMemberDecorate %67 1 RelaxedPrecision 
                                                OpMemberDecorate %67 1 Offset 67 
                                                OpMemberDecorate %67 2 RelaxedPrecision 
                                                OpMemberDecorate %67 2 Offset 67 
                                                OpDecorate %67 Block 
                                                OpDecorate %69 DescriptorSet 69 
                                                OpDecorate %69 Binding 69 
                                                OpDecorate %74 RelaxedPrecision 
                                                OpDecorate %76 RelaxedPrecision 
                                                OpDecorate %78 RelaxedPrecision 
                                                OpDecorate %79 RelaxedPrecision 
                                                OpDecorate %80 RelaxedPrecision 
                                                OpDecorate %81 RelaxedPrecision 
                                                OpDecorate %82 RelaxedPrecision 
                                                OpDecorate %83 RelaxedPrecision 
                                                OpDecorate %84 RelaxedPrecision 
                                                OpDecorate %85 RelaxedPrecision 
                                                OpDecorate %86 RelaxedPrecision 
                                                OpDecorate %87 RelaxedPrecision 
                                                OpDecorate %88 RelaxedPrecision 
                                                OpDecorate %90 RelaxedPrecision 
                                                OpDecorate %91 RelaxedPrecision 
                                                OpDecorate %92 RelaxedPrecision 
                                                OpDecorate %93 RelaxedPrecision 
                                                OpDecorate %94 RelaxedPrecision 
                                                OpDecorate %95 RelaxedPrecision 
                                                OpDecorate %96 RelaxedPrecision 
                                                OpDecorate %97 RelaxedPrecision 
                                                OpDecorate %98 RelaxedPrecision 
                                                OpDecorate %99 RelaxedPrecision 
                                                OpDecorate %100 RelaxedPrecision 
                                                OpDecorate %101 RelaxedPrecision 
                                                OpDecorate %102 RelaxedPrecision 
                                                OpDecorate %103 RelaxedPrecision 
                                                OpDecorate %104 RelaxedPrecision 
                                                OpDecorate %105 RelaxedPrecision 
                                                OpDecorate %106 RelaxedPrecision 
                                                OpDecorate %107 RelaxedPrecision 
                                                OpDecorate %108 RelaxedPrecision 
                                                OpDecorate %109 RelaxedPrecision 
                                                OpDecorate %110 RelaxedPrecision 
                                                OpDecorate %111 RelaxedPrecision 
                                                OpDecorate %114 RelaxedPrecision 
                                                OpDecorate %115 RelaxedPrecision 
                                                OpDecorate %118 RelaxedPrecision 
                                                OpDecorate %120 RelaxedPrecision 
                                                OpDecorate %121 RelaxedPrecision 
                                                OpDecorate %122 RelaxedPrecision 
                                                OpDecorate %123 RelaxedPrecision 
                                                OpDecorate %124 RelaxedPrecision 
                                                OpDecorate %125 RelaxedPrecision 
                                                OpDecorate %128 RelaxedPrecision 
                                                OpDecorate %130 RelaxedPrecision 
                                                OpDecorate %136 RelaxedPrecision 
                                                OpDecorate %137 RelaxedPrecision 
                                                OpDecorate %138 RelaxedPrecision 
                                                OpDecorate %139 RelaxedPrecision 
                                                OpDecorate %140 RelaxedPrecision 
                                                OpDecorate %141 RelaxedPrecision 
                                                OpDecorate %142 RelaxedPrecision 
                                                OpDecorate %143 RelaxedPrecision 
                                                OpDecorate %146 RelaxedPrecision 
                                                OpDecorate %147 RelaxedPrecision 
                                                OpDecorate %148 RelaxedPrecision 
                                                OpDecorate %163 RelaxedPrecision 
                                                OpDecorate %164 RelaxedPrecision 
                                                OpDecorate %165 RelaxedPrecision 
                                                OpDecorate %167 RelaxedPrecision 
                                                OpDecorate %168 RelaxedPrecision 
                                                OpDecorate %188 RelaxedPrecision 
                                                OpDecorate %189 RelaxedPrecision 
                                                OpDecorate %190 RelaxedPrecision 
                                                OpDecorate %191 RelaxedPrecision 
                                                OpDecorate %207 RelaxedPrecision 
                                                OpDecorate %209 RelaxedPrecision 
                                                OpDecorate %210 RelaxedPrecision 
                                                OpDecorate %211 RelaxedPrecision 
                                                OpDecorate %212 RelaxedPrecision 
                                                OpDecorate %213 RelaxedPrecision 
                                                OpDecorate %214 RelaxedPrecision 
                                                OpDecorate %215 RelaxedPrecision 
                                                OpDecorate %216 RelaxedPrecision 
                                                OpDecorate %225 RelaxedPrecision 
                                                OpDecorate %227 RelaxedPrecision 
                                                OpDecorate %228 RelaxedPrecision 
                                                OpDecorate %229 RelaxedPrecision 
                                                OpDecorate %230 RelaxedPrecision 
                                                OpDecorate %232 RelaxedPrecision 
                                                OpDecorate %233 RelaxedPrecision 
                                                OpDecorate %234 RelaxedPrecision 
                                                OpDecorate %235 RelaxedPrecision 
                                                OpDecorate %236 RelaxedPrecision 
                                                OpDecorate %237 RelaxedPrecision 
                                                OpDecorate %238 RelaxedPrecision 
                                                OpDecorate %239 RelaxedPrecision 
                                                OpDecorate %240 RelaxedPrecision 
                                                OpDecorate %241 RelaxedPrecision 
                                                OpDecorate %242 RelaxedPrecision 
                                                OpDecorate %243 RelaxedPrecision 
                                                OpDecorate %244 RelaxedPrecision 
                                                OpDecorate %245 RelaxedPrecision 
                                                OpDecorate %246 RelaxedPrecision 
                                                OpDecorate %247 RelaxedPrecision 
                                                OpDecorate %248 RelaxedPrecision 
                                                OpDecorate %249 RelaxedPrecision 
                                                OpDecorate %252 RelaxedPrecision 
                                                OpDecorate %253 RelaxedPrecision 
                                                OpDecorate %254 RelaxedPrecision 
                                                OpDecorate %255 RelaxedPrecision 
                                                OpDecorate %256 RelaxedPrecision 
                                                OpDecorate %257 RelaxedPrecision 
                                                OpDecorate %258 RelaxedPrecision 
                                                OpDecorate %260 RelaxedPrecision 
                                                OpDecorate %261 RelaxedPrecision 
                                                OpDecorate %263 RelaxedPrecision 
                                                OpDecorate %264 RelaxedPrecision 
                                                OpDecorate %265 RelaxedPrecision 
                                                OpDecorate %267 RelaxedPrecision 
                                                OpDecorate %268 RelaxedPrecision 
                                                OpDecorate %269 RelaxedPrecision 
                                                OpDecorate %270 RelaxedPrecision 
                                                OpDecorate %271 RelaxedPrecision 
                                                OpDecorate %272 RelaxedPrecision 
                                                OpDecorate %273 RelaxedPrecision 
                                                OpDecorate %274 RelaxedPrecision 
                                                OpDecorate %275 RelaxedPrecision 
                                                OpDecorate %276 RelaxedPrecision 
                                                OpDecorate %277 RelaxedPrecision 
                                                OpDecorate %278 RelaxedPrecision 
                                                OpDecorate %281 RelaxedPrecision 
                                                OpDecorate %281 DescriptorSet 281 
                                                OpDecorate %281 Binding 281 
                                                OpDecorate %282 RelaxedPrecision 
                                                OpDecorate %285 RelaxedPrecision 
                                                OpDecorate %285 DescriptorSet 285 
                                                OpDecorate %285 Binding 285 
                                                OpDecorate %286 RelaxedPrecision 
                                                OpDecorate %289 RelaxedPrecision 
                                                OpDecorate %291 RelaxedPrecision 
                                                OpDecorate %292 RelaxedPrecision 
                                                OpDecorate %293 RelaxedPrecision 
                                                OpDecorate %294 RelaxedPrecision 
                                                OpDecorate %295 RelaxedPrecision 
                                                OpDecorate %296 RelaxedPrecision 
                                                OpDecorate %297 RelaxedPrecision 
                                                OpDecorate %298 RelaxedPrecision 
                                                OpDecorate %299 RelaxedPrecision 
                                                OpDecorate %300 RelaxedPrecision 
                                                OpDecorate %301 RelaxedPrecision 
                                                OpDecorate %302 RelaxedPrecision 
                                                OpDecorate %303 RelaxedPrecision 
                                                OpDecorate %304 RelaxedPrecision 
                                                OpDecorate %305 RelaxedPrecision 
                                                OpDecorate %306 RelaxedPrecision 
                                                OpDecorate %307 RelaxedPrecision 
                                                OpDecorate %308 RelaxedPrecision 
                                                OpDecorate %309 RelaxedPrecision 
                                                OpDecorate %310 RelaxedPrecision 
                                                OpDecorate %311 RelaxedPrecision 
                                                OpDecorate %312 RelaxedPrecision 
                                                OpDecorate %313 RelaxedPrecision 
                                                OpDecorate %314 RelaxedPrecision 
                                                OpDecorate %315 RelaxedPrecision 
                                                OpDecorate %317 RelaxedPrecision 
                                                OpDecorate %318 RelaxedPrecision 
                                                OpDecorate %320 RelaxedPrecision 
                                                OpDecorate %321 RelaxedPrecision 
                                                OpDecorate %322 RelaxedPrecision 
                                                OpDecorate %324 RelaxedPrecision 
                                                OpDecorate %325 RelaxedPrecision 
                                                OpDecorate %326 RelaxedPrecision 
                                                OpDecorate %327 RelaxedPrecision 
                                                OpDecorate %328 RelaxedPrecision 
                                                OpDecorate %329 RelaxedPrecision 
                                                OpDecorate %330 RelaxedPrecision 
                                                OpDecorate %331 RelaxedPrecision 
                                                OpDecorate %332 RelaxedPrecision 
                                                OpDecorate %333 RelaxedPrecision 
                                                OpDecorate %334 RelaxedPrecision 
                                                OpDecorate %335 RelaxedPrecision 
                                                OpDecorate %336 RelaxedPrecision 
                                                OpDecorate %337 RelaxedPrecision 
                                                OpDecorate %339 RelaxedPrecision 
                                                OpDecorate %341 RelaxedPrecision 
                                                OpDecorate %342 RelaxedPrecision 
                                                OpDecorate %343 RelaxedPrecision 
                                                OpDecorate %344 RelaxedPrecision 
                                                OpDecorate %345 RelaxedPrecision 
                                                OpDecorate %346 RelaxedPrecision 
                                                OpDecorate %347 RelaxedPrecision 
                                                OpDecorate %355 RelaxedPrecision 
                                                OpDecorate %356 RelaxedPrecision 
                                                OpDecorate %357 RelaxedPrecision 
                                                OpDecorate %358 RelaxedPrecision 
                                                OpDecorate %359 RelaxedPrecision 
                                                OpDecorate %360 RelaxedPrecision 
                                                OpDecorate %361 RelaxedPrecision 
                                                OpDecorate %362 RelaxedPrecision 
                                                OpDecorate %363 RelaxedPrecision 
                                                OpDecorate %364 RelaxedPrecision 
                                                OpDecorate %366 RelaxedPrecision 
                                                OpDecorate %367 RelaxedPrecision 
                                                OpDecorate %368 RelaxedPrecision 
                                                OpDecorate %371 RelaxedPrecision 
                                                OpDecorate %372 RelaxedPrecision 
                                                OpDecorate %375 RelaxedPrecision 
                                                OpDecorate %376 RelaxedPrecision 
                                                OpDecorate %380 RelaxedPrecision 
                                                OpDecorate %380 Location 380 
                                                OpDecorate %381 RelaxedPrecision 
                                                OpDecorate %382 RelaxedPrecision 
                                                OpDecorate %383 RelaxedPrecision 
                                                OpDecorate %384 RelaxedPrecision 
                                         %2 = OpTypeVoid 
                                         %3 = OpTypeFunction %2 
                                         %6 = OpTypeBool 
                                         %7 = OpTypeVector %6 3 
                                         %8 = OpTypePointer Private %7 
                         Private bool_3* %9 = OpVariable Private 
                                        %10 = OpTypeFloat 32 
                                        %11 = OpTypeVector %10 4 
                                        %12 = OpTypePointer Input %11 
                  Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                    f32 %17 = OpConstant 3.674022E-40 
                                    f32 %18 = OpConstant 3.674022E-40 
                                  f32_4 %19 = OpConstantComposite %17 %17 %17 %18 
                                        %20 = OpTypeVector %6 4 
                                        %23 = OpTypeVector %10 3 
                                        %24 = OpTypePointer Private %23 
                         Private f32_3* %25 = OpVariable Private 
                                        %26 = OpTypeInt 32 0 
                                    u32 %27 = OpConstant 0 
                                        %28 = OpTypePointer Private %6 
                                        %31 = OpTypePointer Function %10 
                                        %35 = OpTypePointer Input %10 
                                        %40 = OpTypePointer Private %10 
                                    u32 %42 = OpConstant 1 
                                    u32 %53 = OpConstant 2 
                         Private f32_3* %64 = OpVariable Private 
                                        %67 = OpTypeStruct %10 %10 %10 
                                        %68 = OpTypePointer Uniform %67 
       Uniform struct {f32; f32; f32;}* %69 = OpVariable Uniform 
                                        %70 = OpTypeInt 32 1 
                                    i32 %71 = OpConstant 1 
                                        %72 = OpTypePointer Uniform %10 
                         Private f32_3* %85 = OpVariable Private 
                                  f32_3 %89 = OpConstantComposite %17 %17 %17 
                           Private f32* %95 = OpVariable Private 
                          Private f32* %105 = OpVariable Private 
                                       %113 = OpTypeVector %10 2 
                                   i32 %116 = OpConstant 2 
                        Private f32_3* %128 = OpVariable Private 
                                   f32 %132 = OpConstant 3.674022E-40 
                                   f32 %134 = OpConstant 3.674022E-40 
                                   f32 %144 = OpConstant 3.674022E-40 
                                 f32_3 %145 = OpConstantComposite %144 %144 %144 
                                       %152 = OpTypePointer Function %70 
                                   i32 %160 = OpConstant 0 
                          Private f32* %164 = OpVariable Private 
                                   f32 %166 = OpConstant 3.674022E-40 
                                       %169 = OpTypeVector %26 4 
                                   u32 %170 = OpConstant 4 
                                       %171 = OpTypeArray %169 %170 
                                   u32 %172 = OpConstant 1065353216 
                                 u32_4 %173 = OpConstantComposite %172 %27 %27 %27 
                                 u32_4 %174 = OpConstantComposite %27 %172 %27 %27 
                                 u32_4 %175 = OpConstantComposite %27 %27 %172 %27 
                                 u32_4 %176 = OpConstantComposite %27 %27 %27 %172 
                              u32_4[4] %177 = OpConstantComposite %173 %174 %175 %176 
                                       %179 = OpTypeVector %26 3 
                                       %180 = OpTypePointer Function %171 
                                       %182 = OpTypePointer Function %169 
                        Private f32_3* %188 = OpVariable Private 
                          Private f32* %190 = OpVariable Private 
                                       %200 = OpTypePointer Private %70 
                          Private i32* %201 = OpVariable Private 
                                   i32 %205 = OpConstant -1 
                          Private f32* %207 = OpVariable Private 
                          Private f32* %210 = OpVariable Private 
                        Private f32_3* %214 = OpVariable Private 
                          Private f32* %225 = OpVariable Private 
                        Private f32_3* %228 = OpVariable Private 
                        Private f32_3* %232 = OpVariable Private 
                        Private f32_3* %248 = OpVariable Private 
                                   f32 %250 = OpConstant 3.674022E-40 
                                 f32_3 %251 = OpConstantComposite %250 %250 %250 
                        Private f32_3* %278 = OpVariable Private 
                                       %279 = OpTypeImage %10 Cube 0 0 0 1 Unknown 
                                       %280 = OpTypePointer UniformConstant %279 
UniformConstant read_only TextureCube* %281 = OpVariable UniformConstant 
                                       %283 = OpTypeSampler 
                                       %284 = OpTypePointer UniformConstant %283 
              UniformConstant sampler* %285 = OpVariable UniformConstant 
                                       %287 = OpTypeSampledImage %279 
                        Private f32_3* %335 = OpVariable Private 
                                   f32 %365 = OpConstant 3.674022E-40 
                                       %379 = OpTypePointer Output %11 
                         Output f32_4* %380 = OpVariable Output 
                                   u32 %387 = OpConstant 3 
                                       %388 = OpTypePointer Output %10 
                          Private i32* %391 = OpVariable Private 
                          Private i32* %392 = OpVariable Private 
                         Private bool* %393 = OpVariable Private 
                         Private bool* %394 = OpVariable Private 
                          Private i32* %395 = OpVariable Private 
                         Private bool* %396 = OpVariable Private 
                                    void %4 = OpFunction None %3 
                                         %5 = OpLabel 
                          Function f32* %32 = OpVariable Function 
                          Function f32* %45 = OpVariable Function 
                          Function f32* %56 = OpVariable Function 
                         Function i32* %153 = OpVariable Function 
                    Function u32_4[4]* %181 = OpVariable Function 
                         Function i32* %192 = OpVariable Function 
                         Function i32* %217 = OpVariable Function 
                    Function u32_4[4]* %349 = OpVariable Function 
                                  f32_4 %14 = OpLoad vs_TEXCOORD0 
                                  f32_4 %15 = OpVectorShuffle %14 %14 0 1 2 0 
                                  f32_4 %16 = OpExtInst %1 4 %15 
                                 bool_4 %21 = OpFOrdEqual %16 %19 
                                 bool_3 %22 = OpVectorShuffle %21 %21 0 1 2 
                                                OpStore %9 %22 
                          Private bool* %29 = OpAccessChain %9 %27 
                                   bool %30 = OpLoad %29 
                                                OpSelectionMerge %34 None 
                                                OpBranchConditional %30 %33 %38 
                                        %33 = OpLabel 
                             Input f32* %36 = OpAccessChain vs_TEXCOORD0 %27 
                                    f32 %37 = OpLoad %36 
                                                OpStore %32 %37 
                                                OpBranch %34 
                                        %38 = OpLabel 
                                                OpStore %32 %18 
                                                OpBranch %34 
                                        %34 = OpLabel 
                                    f32 %39 = OpLoad %32 
                           Private f32* %41 = OpAccessChain %25 %27 
                                                OpStore %41 %39 
                          Private bool* %43 = OpAccessChain %9 %42 
                                   bool %44 = OpLoad %43 
                                                OpSelectionMerge %47 None 
                                                OpBranchConditional %44 %46 %50 
                                        %46 = OpLabel 
                             Input f32* %48 = OpAccessChain vs_TEXCOORD0 %42 
                                    f32 %49 = OpLoad %48 
                                                OpStore %45 %49 
                                                OpBranch %47 
                                        %50 = OpLabel 
                                                OpStore %45 %18 
                                                OpBranch %47 
                                        %47 = OpLabel 
                                    f32 %51 = OpLoad %45 
                           Private f32* %52 = OpAccessChain %25 %42 
                                                OpStore %52 %51 
                          Private bool* %54 = OpAccessChain %9 %53 
                                   bool %55 = OpLoad %54 
                                                OpSelectionMerge %58 None 
                                                OpBranchConditional %55 %57 %61 
                                        %57 = OpLabel 
                             Input f32* %59 = OpAccessChain vs_TEXCOORD0 %53 
                                    f32 %60 = OpLoad %59 
                                                OpStore %56 %60 
                                                OpBranch %58 
                                        %61 = OpLabel 
                                                OpStore %56 %18 
                                                OpBranch %58 
                                        %58 = OpLabel 
                                    f32 %62 = OpLoad %56 
                           Private f32* %63 = OpAccessChain %25 %53 
                                                OpStore %63 %62 
                                  f32_3 %65 = OpLoad %25 
                                  f32_3 %66 = OpVectorShuffle %65 %65 2 0 1 
                           Uniform f32* %73 = OpAccessChain %69 %71 
                                    f32 %74 = OpLoad %73 
                           Uniform f32* %75 = OpAccessChain %69 %71 
                                    f32 %76 = OpLoad %75 
                           Uniform f32* %77 = OpAccessChain %69 %71 
                                    f32 %78 = OpLoad %77 
                                  f32_3 %79 = OpCompositeConstruct %74 %76 %78 
                                    f32 %80 = OpCompositeExtract %79 0 
                                    f32 %81 = OpCompositeExtract %79 1 
                                    f32 %82 = OpCompositeExtract %79 2 
                                  f32_3 %83 = OpCompositeConstruct %80 %81 %82 
                                  f32_3 %84 = OpFMul %66 %83 
                                                OpStore %64 %84 
                                  f32_3 %86 = OpLoad %25 
                                  f32_3 %87 = OpExtInst %1 4 %86 
                                  f32_3 %88 = OpFNegate %87 
                                  f32_3 %90 = OpFAdd %88 %89 
                                                OpStore %85 %90 
                                  f32_3 %91 = OpLoad %85 
                                  f32_4 %92 = OpLoad vs_TEXCOORD0 
                                  f32_3 %93 = OpVectorShuffle %92 %92 0 1 2 
                                  f32_3 %94 = OpFMul %91 %93 
                                                OpStore %85 %94 
                                  f32_3 %96 = OpLoad %85 
                                  f32_3 %97 = OpLoad %85 
                                    f32 %98 = OpDot %96 %97 
                                                OpStore %95 %98 
                                    f32 %99 = OpLoad %95 
                                   f32 %100 = OpFAdd %99 %17 
                                                OpStore %95 %100 
                                   f32 %101 = OpLoad %95 
                                   f32 %102 = OpExtInst %1 31 %101 
                                                OpStore %95 %102 
                                   f32 %103 = OpLoad %95 
                                   f32 %104 = OpFDiv %17 %103 
                                                OpStore %95 %104 
                                   f32 %106 = OpLoad %95 
                                   f32 %107 = OpLoad %95 
                                   f32 %108 = OpFMul %106 %107 
                                                OpStore %105 %108 
                                   f32 %109 = OpLoad %95 
                                   f32 %110 = OpLoad %105 
                                   f32 %111 = OpFMul %109 %110 
                          Private f32* %112 = OpAccessChain %85 %27 
                                                OpStore %112 %111 
                                 f32_3 %114 = OpLoad %85 
                                 f32_2 %115 = OpVectorShuffle %114 %114 0 0 
                          Uniform f32* %117 = OpAccessChain %69 %116 
                                   f32 %118 = OpLoad %117 
                          Uniform f32* %119 = OpAccessChain %69 %116 
                                   f32 %120 = OpLoad %119 
                                 f32_2 %121 = OpCompositeConstruct %118 %120 
                                   f32 %122 = OpCompositeExtract %121 0 
                                   f32 %123 = OpCompositeExtract %121 1 
                                 f32_2 %124 = OpCompositeConstruct %122 %123 
                                 f32_2 %125 = OpFMul %115 %124 
                                 f32_3 %126 = OpLoad %85 
                                 f32_3 %127 = OpVectorShuffle %126 %125 0 3 4 
                                                OpStore %85 %127 
                          Uniform f32* %129 = OpAccessChain %69 %116 
                                   f32 %130 = OpLoad %129 
                          Private f32* %131 = OpAccessChain %128 %27 
                                                OpStore %131 %130 
                          Private f32* %133 = OpAccessChain %128 %42 
                                                OpStore %133 %132 
                          Private f32* %135 = OpAccessChain %128 %53 
                                                OpStore %135 %134 
                                 f32_3 %136 = OpLoad %85 
                                 f32_3 %137 = OpLoad %128 
                                 f32_3 %138 = OpFMul %136 %137 
                                                OpStore %85 %138 
                                 f32_3 %139 = OpLoad %85 
                                 f32_3 %140 = OpLoad %85 
                                 f32_3 %141 = OpFNegate %140 
                                 f32_3 %142 = OpFMul %139 %141 
                                                OpStore %85 %142 
                                 f32_3 %143 = OpLoad %85 
                                 f32_3 %146 = OpFMul %143 %145 
                                                OpStore %85 %146 
                                 f32_3 %147 = OpLoad %85 
                                 f32_3 %148 = OpExtInst %1 29 %147 
                                                OpStore %85 %148 
                          Private f32* %149 = OpAccessChain %128 %27 
                                                OpStore %149 %18 
                          Private f32* %150 = OpAccessChain %128 %42 
                                                OpStore %150 %18 
                          Private f32* %151 = OpAccessChain %128 %53 
                                                OpStore %151 %18 
                                                OpStore %95 %18 
                                                OpStore %153 %116 
                                                OpBranch %154 
                                       %154 = OpLabel 
                                                OpLoopMerge %156 %157 None 
                                                OpBranch %158 
                                       %158 = OpLabel 
                                   i32 %159 = OpLoad %153 
                                  bool %161 = OpSGreaterThanEqual %159 %160 
                                                OpBranchConditional %161 %155 %156 
                                       %155 = OpLabel 
                                   i32 %162 = OpLoad %153 
                                   f32 %163 = OpConvertSToF %162 
                                                OpStore %105 %163 
                                   f32 %165 = OpLoad %105 
                                   f32 %167 = OpFAdd %165 %166 
                                                OpStore %164 %167 
                                 f32_3 %168 = OpLoad %85 
                                   i32 %178 = OpLoad %153 
                                                OpStore %181 %177 
                       Function u32_4* %183 = OpAccessChain %181 %178 
                                 u32_4 %184 = OpLoad %183 
                                 u32_3 %185 = OpVectorShuffle %184 %184 0 1 2 
                                 f32_3 %186 = OpBitcast %185 
                                   f32 %187 = OpDot %168 %186 
                                                OpStore %105 %187 
                                 f32_3 %189 = OpLoad %128 
                                                OpStore %188 %189 
                                   f32 %191 = OpLoad %95 
                                                OpStore %190 %191 
                                                OpStore %192 %160 
                                                OpBranch %193 
                                       %193 = OpLabel 
                                                OpLoopMerge %195 %196 None 
                                                OpBranch %197 
                                       %197 = OpLabel 
                                   i32 %198 = OpLoad %192 
                                  bool %199 = OpSLessThan %198 %116 
                                                OpBranchConditional %199 %194 %195 
                                       %194 = OpLabel 
                                   i32 %202 = OpLoad %192 
                                   i32 %203 = OpShiftLeftLogical %202 %71 
                                                OpStore %201 %203 
                                   i32 %204 = OpLoad %201 
                                   i32 %206 = OpIAdd %204 %205 
                                                OpStore %201 %206 
                                   i32 %208 = OpLoad %201 
                                   f32 %209 = OpConvertSToF %208 
                                                OpStore %207 %209 
                                   f32 %211 = OpLoad %164 
                                   f32 %212 = OpLoad %207 
                                   f32 %213 = OpFMul %211 %212 
                                                OpStore %210 %213 
                                 f32_3 %215 = OpLoad %188 
                                                OpStore %214 %215 
                                   f32 %216 = OpLoad %190 
                                                OpStore %207 %216 
                                                OpStore %217 %116 
                                                OpBranch %218 
                                       %218 = OpLabel 
                                                OpLoopMerge %220 %221 None 
                                                OpBranch %222 
                                       %222 = OpLabel 
                                   i32 %223 = OpLoad %217 
                                  bool %224 = OpSGreaterThanEqual %223 %160 
                                                OpBranchConditional %224 %219 %220 
                                       %219 = OpLabel 
                                   i32 %226 = OpLoad %217 
                                   f32 %227 = OpConvertSToF %226 
                                                OpStore %225 %227 
                                   f32 %229 = OpLoad %225 
                                   f32 %230 = OpFAdd %229 %166 
                          Private f32* %231 = OpAccessChain %228 %27 
                                                OpStore %231 %230 
                                 f32_3 %233 = OpLoad %228 
                                 f32_3 %234 = OpVectorShuffle %233 %233 0 0 0 
                                 f32_3 %235 = OpFNegate %234 
                                 f32_3 %236 = OpLoad %64 
                                 f32_3 %237 = OpFMul %235 %236 
                                 f32_4 %238 = OpLoad vs_TEXCOORD0 
                                 f32_3 %239 = OpVectorShuffle %238 %238 0 1 2 
                                 f32_3 %240 = OpFAdd %237 %239 
                                                OpStore %232 %240 
                                   f32 %241 = OpLoad %210 
                                 f32_3 %242 = OpCompositeConstruct %241 %241 %241 
                                 f32_3 %243 = OpLoad %64 
                                 f32_3 %244 = OpVectorShuffle %243 %243 2 0 1 
                                 f32_3 %245 = OpFMul %242 %244 
                                 f32_3 %246 = OpLoad %232 
                                 f32_3 %247 = OpFAdd %245 %246 
                                                OpStore %232 %247 
                                 f32_3 %249 = OpLoad %232 
                                 f32_3 %252 = OpExtInst %1 40 %249 %251 
                                                OpStore %248 %252 
                                 f32_3 %253 = OpLoad %248 
                                 f32_3 %254 = OpExtInst %1 37 %253 %89 
                                                OpStore %248 %254 
                                 f32_3 %255 = OpLoad %232 
                                 f32_3 %256 = OpLoad %248 
                                 f32_3 %257 = OpFNegate %256 
                                 f32_3 %258 = OpFAdd %255 %257 
                                                OpStore %232 %258 
                          Private f32* %259 = OpAccessChain %232 %42 
                                   f32 %260 = OpLoad %259 
                                   f32 %261 = OpExtInst %1 4 %260 
                          Private f32* %262 = OpAccessChain %232 %27 
                                   f32 %263 = OpLoad %262 
                                   f32 %264 = OpExtInst %1 4 %263 
                                   f32 %265 = OpExtInst %1 40 %261 %264 
                                                OpStore %225 %265 
                          Private f32* %266 = OpAccessChain %232 %53 
                                   f32 %267 = OpLoad %266 
                                   f32 %268 = OpExtInst %1 4 %267 
                                   f32 %269 = OpLoad %225 
                                   f32 %270 = OpExtInst %1 40 %268 %269 
                                                OpStore %225 %270 
                                   f32 %271 = OpLoad %225 
                                 f32_3 %272 = OpCompositeConstruct %271 %271 %271 
                                 f32_3 %273 = OpFNegate %272 
                                 f32_3 %274 = OpLoad %25 
                                 f32_3 %275 = OpFMul %273 %274 
                                 f32_3 %276 = OpLoad %248 
                                 f32_3 %277 = OpFAdd %275 %276 
                                                OpStore %232 %277 
                 read_only TextureCube %282 = OpLoad %281 
                               sampler %286 = OpLoad %285 
          read_only TextureCubeSampled %288 = OpSampledImage %282 %286 
                                 f32_3 %289 = OpLoad %232 
                          Uniform f32* %290 = OpAccessChain %69 %160 
                                   f32 %291 = OpLoad %290 
                                 f32_4 %292 = OpImageSampleExplicitLod %288 %289 Lod %11 
                                 f32_3 %293 = OpVectorShuffle %292 %292 0 1 2 
                                                OpStore %278 %293 
                                 f32_3 %294 = OpLoad %228 
                                 f32_3 %295 = OpVectorShuffle %294 %294 0 0 0 
                                 f32_3 %296 = OpLoad %64 
                                 f32_3 %297 = OpFMul %295 %296 
                                 f32_4 %298 = OpLoad vs_TEXCOORD0 
                                 f32_3 %299 = OpVectorShuffle %298 %298 0 1 2 
                                 f32_3 %300 = OpFAdd %297 %299 
                                                OpStore %232 %300 
                                   f32 %301 = OpLoad %210 
                                 f32_3 %302 = OpCompositeConstruct %301 %301 %301 
                                 f32_3 %303 = OpLoad %64 
                                 f32_3 %304 = OpVectorShuffle %303 %303 2 0 1 
                                 f32_3 %305 = OpFMul %302 %304 
                                 f32_3 %306 = OpLoad %232 
                                 f32_3 %307 = OpFAdd %305 %306 
                                                OpStore %232 %307 
                                 f32_3 %308 = OpLoad %232 
                                 f32_3 %309 = OpExtInst %1 40 %308 %251 
                                                OpStore %248 %309 
                                 f32_3 %310 = OpLoad %248 
                                 f32_3 %311 = OpExtInst %1 37 %310 %89 
                                                OpStore %248 %311 
                                 f32_3 %312 = OpLoad %232 
                                 f32_3 %313 = OpLoad %248 
                                 f32_3 %314 = OpFNegate %313 
                                 f32_3 %315 = OpFAdd %312 %314 
                                                OpStore %232 %315 
                          Private f32* %316 = OpAccessChain %232 %42 
                                   f32 %317 = OpLoad %316 
                                   f32 %318 = OpExtInst %1 4 %317 
                          Private f32* %319 = OpAccessChain %232 %27 
                                   f32 %320 = OpLoad %319 
                                   f32 %321 = OpExtInst %1 4 %320 
                                   f32 %322 = OpExtInst %1 40 %318 %321 
                                                OpStore %225 %322 
                          Private f32* %323 = OpAccessChain %232 %53 
                                   f32 %324 = OpLoad %323 
                                   f32 %325 = OpExtInst %1 4 %324 
                                   f32 %326 = OpLoad %225 
                                   f32 %327 = OpExtInst %1 40 %325 %326 
                                                OpStore %225 %327 
                                   f32 %328 = OpLoad %225 
                                 f32_3 %329 = OpCompositeConstruct %328 %328 %328 
                                 f32_3 %330 = OpFNegate %329 
                                 f32_3 %331 = OpLoad %25 
                                 f32_3 %332 = OpFMul %330 %331 
                                 f32_3 %333 = OpLoad %248 
                                 f32_3 %334 = OpFAdd %332 %333 
                                                OpStore %232 %334 
                 read_only TextureCube %336 = OpLoad %281 
                               sampler %337 = OpLoad %285 
          read_only TextureCubeSampled %338 = OpSampledImage %336 %337 
                                 f32_3 %339 = OpLoad %232 
                          Uniform f32* %340 = OpAccessChain %69 %160 
                                   f32 %341 = OpLoad %340 
                                 f32_4 %342 = OpImageSampleExplicitLod %338 %339 Lod %11 
                                 f32_3 %343 = OpVectorShuffle %342 %342 0 1 2 
                                                OpStore %335 %343 
                                 f32_3 %344 = OpLoad %335 
                                 f32_3 %345 = OpLoad %278 
                                 f32_3 %346 = OpFAdd %344 %345 
                                                OpStore %228 %346 
                                 f32_3 %347 = OpLoad %85 
                                   i32 %348 = OpLoad %217 
                                                OpStore %349 %177 
                       Function u32_4* %350 = OpAccessChain %349 %348 
                                 u32_4 %351 = OpLoad %350 
                                 u32_3 %352 = OpVectorShuffle %351 %351 0 1 2 
                                 f32_3 %353 = OpBitcast %352 
                                   f32 %354 = OpDot %347 %353 
                                                OpStore %225 %354 
                                   f32 %355 = OpLoad %105 
                                   f32 %356 = OpLoad %225 
                                   f32 %357 = OpFMul %355 %356 
                                                OpStore %225 %357 
                                 f32_3 %358 = OpLoad %228 
                                   f32 %359 = OpLoad %225 
                                 f32_3 %360 = OpCompositeConstruct %359 %359 %359 
                                 f32_3 %361 = OpFMul %358 %360 
                                 f32_3 %362 = OpLoad %214 
                                 f32_3 %363 = OpFAdd %361 %362 
                                                OpStore %214 %363 
                                   f32 %364 = OpLoad %225 
                                   f32 %366 = OpFMul %364 %365 
                                   f32 %367 = OpLoad %207 
                                   f32 %368 = OpFAdd %366 %367 
                                                OpStore %207 %368 
                                                OpBranch %221 
                                       %221 = OpLabel 
                                   i32 %369 = OpLoad %217 
                                   i32 %370 = OpIAdd %369 %205 
                                                OpStore %217 %370 
                                                OpBranch %218 
                                       %220 = OpLabel 
                                 f32_3 %371 = OpLoad %214 
                                                OpStore %188 %371 
                                   f32 %372 = OpLoad %207 
                                                OpStore %190 %372 
                                                OpBranch %196 
                                       %196 = OpLabel 
                                   i32 %373 = OpLoad %192 
                                   i32 %374 = OpIAdd %373 %71 
                                                OpStore %192 %374 
                                                OpBranch %193 
                                       %195 = OpLabel 
                                 f32_3 %375 = OpLoad %188 
                                                OpStore %128 %375 
                                   f32 %376 = OpLoad %190 
                                                OpStore %95 %376 
                                                OpBranch %157 
                                       %157 = OpLabel 
                                   i32 %377 = OpLoad %153 
                                   i32 %378 = OpIAdd %377 %205 
                                                OpStore %153 %378 
                                                OpBranch %154 
                                       %156 = OpLabel 
                                 f32_3 %381 = OpLoad %128 
                                   f32 %382 = OpLoad %95 
                                 f32_3 %383 = OpCompositeConstruct %382 %382 %382 
                                 f32_3 %384 = OpFDiv %381 %383 
                                 f32_4 %385 = OpLoad %380 
                                 f32_4 %386 = OpVectorShuffle %385 %384 4 5 6 3 
                                                OpStore %380 %386 
                           Output f32* %389 = OpAccessChain %380 %387 
                                                OpStore %389 %17 
                                                OpReturn
                                                OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 92
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %79 %83 %84 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %77 0 BuiltIn 77 
                                              OpMemberDecorate %77 1 BuiltIn 77 
                                              OpMemberDecorate %77 2 BuiltIn 77 
                                              OpDecorate %77 Block 
                                              OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD0 Location 83 
                                              OpDecorate %84 Location 84 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypePointer Input %7 
                         Input f32_4* %11 = OpVariable Input 
                                      %14 = OpTypeInt 32 0 
                                  u32 %15 = OpConstant 4 
                                      %16 = OpTypeArray %7 %15 
                                      %17 = OpTypeArray %7 %15 
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %75 = OpConstant 1 
                                      %76 = OpTypeArray %6 %75 
                                      %77 = OpTypeStruct %7 %6 %76 
                                      %78 = OpTypePointer Output %77 
 Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
                                      %81 = OpTypePointer Output %7 
               Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                         Input f32_4* %84 = OpVariable Input 
                                      %86 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %43 = OpLoad %9 
                       Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                f32_4 %46 = OpLoad %45 
                                f32_4 %47 = OpFAdd %43 %46 
                                              OpStore %9 %47 
                                f32_4 %49 = OpLoad %9 
                                f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFMul %50 %52 
                                              OpStore %48 %53 
                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %48 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %48 %60 
                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                f32_4 %62 = OpLoad %61 
                                f32_4 %63 = OpLoad %9 
                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                f32_4 %65 = OpFMul %62 %64 
                                f32_4 %66 = OpLoad %48 
                                f32_4 %67 = OpFAdd %65 %66 
                                              OpStore %48 %67 
                       Uniform f32_4* %68 = OpAccessChain %20 %23 %44 
                                f32_4 %69 = OpLoad %68 
                                f32_4 %70 = OpLoad %9 
                                f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                f32_4 %72 = OpFMul %69 %71 
                                f32_4 %73 = OpLoad %48 
                                f32_4 %74 = OpFAdd %72 %73 
                                              OpStore %9 %74 
                                f32_4 %80 = OpLoad %9 
                        Output f32_4* %82 = OpAccessChain %79 %22 
                                              OpStore %82 %80 
                                f32_4 %85 = OpLoad %84 
                                              OpStore vs_TEXCOORD0 %85 
                          Output f32* %87 = OpAccessChain %79 %22 %75 
                                  f32 %88 = OpLoad %87 
                                  f32 %89 = OpFNegate %88 
                          Output f32* %90 = OpAccessChain %79 %22 %75 
                                              OpStore %90 %89 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 397
; Schema: 0
                                                OpCapability Shader 
                                         %1 = OpExtInstImport "GLSL.std.450" 
                                                OpMemoryModel Logical GLSL450 
                                                OpEntryPoint Fragment %4 "main" %13 %380 
                                                OpExecutionMode %4 OriginUpperLeft 
                                                OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                                OpDecorate vs_TEXCOORD0 Location 13 
                                                OpDecorate %14 RelaxedPrecision 
                                                OpDecorate %15 RelaxedPrecision 
                                                OpDecorate %16 RelaxedPrecision 
                                                OpDecorate %21 RelaxedPrecision 
                                                OpDecorate %25 RelaxedPrecision 
                                                OpDecorate %37 RelaxedPrecision 
                                                OpDecorate %39 RelaxedPrecision 
                                                OpDecorate %49 RelaxedPrecision 
                                                OpDecorate %51 RelaxedPrecision 
                                                OpDecorate %60 RelaxedPrecision 
                                                OpDecorate %62 RelaxedPrecision 
                                                OpDecorate %64 RelaxedPrecision 
                                                OpDecorate %65 RelaxedPrecision 
                                                OpDecorate %66 RelaxedPrecision 
                                                OpMemberDecorate %67 0 RelaxedPrecision 
                                                OpMemberDecorate %67 0 Offset 67 
                                                OpMemberDecorate %67 1 RelaxedPrecision 
                                                OpMemberDecorate %67 1 Offset 67 
                                                OpMemberDecorate %67 2 RelaxedPrecision 
                                                OpMemberDecorate %67 2 Offset 67 
                                                OpDecorate %67 Block 
                                                OpDecorate %69 DescriptorSet 69 
                                                OpDecorate %69 Binding 69 
                                                OpDecorate %74 RelaxedPrecision 
                                                OpDecorate %76 RelaxedPrecision 
                                                OpDecorate %78 RelaxedPrecision 
                                                OpDecorate %79 RelaxedPrecision 
                                                OpDecorate %80 RelaxedPrecision 
                                                OpDecorate %81 RelaxedPrecision 
                                                OpDecorate %82 RelaxedPrecision 
                                                OpDecorate %83 RelaxedPrecision 
                                                OpDecorate %84 RelaxedPrecision 
                                                OpDecorate %85 RelaxedPrecision 
                                                OpDecorate %86 RelaxedPrecision 
                                                OpDecorate %87 RelaxedPrecision 
                                                OpDecorate %88 RelaxedPrecision 
                                                OpDecorate %90 RelaxedPrecision 
                                                OpDecorate %91 RelaxedPrecision 
                                                OpDecorate %92 RelaxedPrecision 
                                                OpDecorate %93 RelaxedPrecision 
                                                OpDecorate %94 RelaxedPrecision 
                                                OpDecorate %95 RelaxedPrecision 
                                                OpDecorate %96 RelaxedPrecision 
                                                OpDecorate %97 RelaxedPrecision 
                                                OpDecorate %98 RelaxedPrecision 
                                                OpDecorate %99 RelaxedPrecision 
                                                OpDecorate %100 RelaxedPrecision 
                                                OpDecorate %101 RelaxedPrecision 
                                                OpDecorate %102 RelaxedPrecision 
                                                OpDecorate %103 RelaxedPrecision 
                                                OpDecorate %104 RelaxedPrecision 
                                                OpDecorate %105 RelaxedPrecision 
                                                OpDecorate %106 RelaxedPrecision 
                                                OpDecorate %107 RelaxedPrecision 
                                                OpDecorate %108 RelaxedPrecision 
                                                OpDecorate %109 RelaxedPrecision 
                                                OpDecorate %110 RelaxedPrecision 
                                                OpDecorate %111 RelaxedPrecision 
                                                OpDecorate %114 RelaxedPrecision 
                                                OpDecorate %115 RelaxedPrecision 
                                                OpDecorate %118 RelaxedPrecision 
                                                OpDecorate %120 RelaxedPrecision 
                                                OpDecorate %121 RelaxedPrecision 
                                                OpDecorate %122 RelaxedPrecision 
                                                OpDecorate %123 RelaxedPrecision 
                                                OpDecorate %124 RelaxedPrecision 
                                                OpDecorate %125 RelaxedPrecision 
                                                OpDecorate %128 RelaxedPrecision 
                                                OpDecorate %130 RelaxedPrecision 
                                                OpDecorate %136 RelaxedPrecision 
                                                OpDecorate %137 RelaxedPrecision 
                                                OpDecorate %138 RelaxedPrecision 
                                                OpDecorate %139 RelaxedPrecision 
                                                OpDecorate %140 RelaxedPrecision 
                                                OpDecorate %141 RelaxedPrecision 
                                                OpDecorate %142 RelaxedPrecision 
                                                OpDecorate %143 RelaxedPrecision 
                                                OpDecorate %146 RelaxedPrecision 
                                                OpDecorate %147 RelaxedPrecision 
                                                OpDecorate %148 RelaxedPrecision 
                                                OpDecorate %163 RelaxedPrecision 
                                                OpDecorate %164 RelaxedPrecision 
                                                OpDecorate %165 RelaxedPrecision 
                                                OpDecorate %167 RelaxedPrecision 
                                                OpDecorate %168 RelaxedPrecision 
                                                OpDecorate %188 RelaxedPrecision 
                                                OpDecorate %189 RelaxedPrecision 
                                                OpDecorate %190 RelaxedPrecision 
                                                OpDecorate %191 RelaxedPrecision 
                                                OpDecorate %207 RelaxedPrecision 
                                                OpDecorate %209 RelaxedPrecision 
                                                OpDecorate %210 RelaxedPrecision 
                                                OpDecorate %211 RelaxedPrecision 
                                                OpDecorate %212 RelaxedPrecision 
                                                OpDecorate %213 RelaxedPrecision 
                                                OpDecorate %214 RelaxedPrecision 
                                                OpDecorate %215 RelaxedPrecision 
                                                OpDecorate %216 RelaxedPrecision 
                                                OpDecorate %225 RelaxedPrecision 
                                                OpDecorate %227 RelaxedPrecision 
                                                OpDecorate %228 RelaxedPrecision 
                                                OpDecorate %229 RelaxedPrecision 
                                                OpDecorate %230 RelaxedPrecision 
                                                OpDecorate %232 RelaxedPrecision 
                                                OpDecorate %233 RelaxedPrecision 
                                                OpDecorate %234 RelaxedPrecision 
                                                OpDecorate %235 RelaxedPrecision 
                                                OpDecorate %236 RelaxedPrecision 
                                                OpDecorate %237 RelaxedPrecision 
                                                OpDecorate %238 RelaxedPrecision 
                                                OpDecorate %239 RelaxedPrecision 
                                                OpDecorate %240 RelaxedPrecision 
                                                OpDecorate %241 RelaxedPrecision 
                                                OpDecorate %242 RelaxedPrecision 
                                                OpDecorate %243 RelaxedPrecision 
                                                OpDecorate %244 RelaxedPrecision 
                                                OpDecorate %245 RelaxedPrecision 
                                                OpDecorate %246 RelaxedPrecision 
                                                OpDecorate %247 RelaxedPrecision 
                                                OpDecorate %248 RelaxedPrecision 
                                                OpDecorate %249 RelaxedPrecision 
                                                OpDecorate %252 RelaxedPrecision 
                                                OpDecorate %253 RelaxedPrecision 
                                                OpDecorate %254 RelaxedPrecision 
                                                OpDecorate %255 RelaxedPrecision 
                                                OpDecorate %256 RelaxedPrecision 
                                                OpDecorate %257 RelaxedPrecision 
                                                OpDecorate %258 RelaxedPrecision 
                                                OpDecorate %260 RelaxedPrecision 
                                                OpDecorate %261 RelaxedPrecision 
                                                OpDecorate %263 RelaxedPrecision 
                                                OpDecorate %264 RelaxedPrecision 
                                                OpDecorate %265 RelaxedPrecision 
                                                OpDecorate %267 RelaxedPrecision 
                                                OpDecorate %268 RelaxedPrecision 
                                                OpDecorate %269 RelaxedPrecision 
                                                OpDecorate %270 RelaxedPrecision 
                                                OpDecorate %271 RelaxedPrecision 
                                                OpDecorate %272 RelaxedPrecision 
                                                OpDecorate %273 RelaxedPrecision 
                                                OpDecorate %274 RelaxedPrecision 
                                                OpDecorate %275 RelaxedPrecision 
                                                OpDecorate %276 RelaxedPrecision 
                                                OpDecorate %277 RelaxedPrecision 
                                                OpDecorate %278 RelaxedPrecision 
                                                OpDecorate %281 RelaxedPrecision 
                                                OpDecorate %281 DescriptorSet 281 
                                                OpDecorate %281 Binding 281 
                                                OpDecorate %282 RelaxedPrecision 
                                                OpDecorate %285 RelaxedPrecision 
                                                OpDecorate %285 DescriptorSet 285 
                                                OpDecorate %285 Binding 285 
                                                OpDecorate %286 RelaxedPrecision 
                                                OpDecorate %289 RelaxedPrecision 
                                                OpDecorate %291 RelaxedPrecision 
                                                OpDecorate %292 RelaxedPrecision 
                                                OpDecorate %293 RelaxedPrecision 
                                                OpDecorate %294 RelaxedPrecision 
                                                OpDecorate %295 RelaxedPrecision 
                                                OpDecorate %296 RelaxedPrecision 
                                                OpDecorate %297 RelaxedPrecision 
                                                OpDecorate %298 RelaxedPrecision 
                                                OpDecorate %299 RelaxedPrecision 
                                                OpDecorate %300 RelaxedPrecision 
                                                OpDecorate %301 RelaxedPrecision 
                                                OpDecorate %302 RelaxedPrecision 
                                                OpDecorate %303 RelaxedPrecision 
                                                OpDecorate %304 RelaxedPrecision 
                                                OpDecorate %305 RelaxedPrecision 
                                                OpDecorate %306 RelaxedPrecision 
                                                OpDecorate %307 RelaxedPrecision 
                                                OpDecorate %308 RelaxedPrecision 
                                                OpDecorate %309 RelaxedPrecision 
                                                OpDecorate %310 RelaxedPrecision 
                                                OpDecorate %311 RelaxedPrecision 
                                                OpDecorate %312 RelaxedPrecision 
                                                OpDecorate %313 RelaxedPrecision 
                                                OpDecorate %314 RelaxedPrecision 
                                                OpDecorate %315 RelaxedPrecision 
                                                OpDecorate %317 RelaxedPrecision 
                                                OpDecorate %318 RelaxedPrecision 
                                                OpDecorate %320 RelaxedPrecision 
                                                OpDecorate %321 RelaxedPrecision 
                                                OpDecorate %322 RelaxedPrecision 
                                                OpDecorate %324 RelaxedPrecision 
                                                OpDecorate %325 RelaxedPrecision 
                                                OpDecorate %326 RelaxedPrecision 
                                                OpDecorate %327 RelaxedPrecision 
                                                OpDecorate %328 RelaxedPrecision 
                                                OpDecorate %329 RelaxedPrecision 
                                                OpDecorate %330 RelaxedPrecision 
                                                OpDecorate %331 RelaxedPrecision 
                                                OpDecorate %332 RelaxedPrecision 
                                                OpDecorate %333 RelaxedPrecision 
                                                OpDecorate %334 RelaxedPrecision 
                                                OpDecorate %335 RelaxedPrecision 
                                                OpDecorate %336 RelaxedPrecision 
                                                OpDecorate %337 RelaxedPrecision 
                                                OpDecorate %339 RelaxedPrecision 
                                                OpDecorate %341 RelaxedPrecision 
                                                OpDecorate %342 RelaxedPrecision 
                                                OpDecorate %343 RelaxedPrecision 
                                                OpDecorate %344 RelaxedPrecision 
                                                OpDecorate %345 RelaxedPrecision 
                                                OpDecorate %346 RelaxedPrecision 
                                                OpDecorate %347 RelaxedPrecision 
                                                OpDecorate %355 RelaxedPrecision 
                                                OpDecorate %356 RelaxedPrecision 
                                                OpDecorate %357 RelaxedPrecision 
                                                OpDecorate %358 RelaxedPrecision 
                                                OpDecorate %359 RelaxedPrecision 
                                                OpDecorate %360 RelaxedPrecision 
                                                OpDecorate %361 RelaxedPrecision 
                                                OpDecorate %362 RelaxedPrecision 
                                                OpDecorate %363 RelaxedPrecision 
                                                OpDecorate %364 RelaxedPrecision 
                                                OpDecorate %366 RelaxedPrecision 
                                                OpDecorate %367 RelaxedPrecision 
                                                OpDecorate %368 RelaxedPrecision 
                                                OpDecorate %371 RelaxedPrecision 
                                                OpDecorate %372 RelaxedPrecision 
                                                OpDecorate %375 RelaxedPrecision 
                                                OpDecorate %376 RelaxedPrecision 
                                                OpDecorate %380 RelaxedPrecision 
                                                OpDecorate %380 Location 380 
                                                OpDecorate %381 RelaxedPrecision 
                                                OpDecorate %382 RelaxedPrecision 
                                                OpDecorate %383 RelaxedPrecision 
                                                OpDecorate %384 RelaxedPrecision 
                                         %2 = OpTypeVoid 
                                         %3 = OpTypeFunction %2 
                                         %6 = OpTypeBool 
                                         %7 = OpTypeVector %6 3 
                                         %8 = OpTypePointer Private %7 
                         Private bool_3* %9 = OpVariable Private 
                                        %10 = OpTypeFloat 32 
                                        %11 = OpTypeVector %10 4 
                                        %12 = OpTypePointer Input %11 
                  Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                    f32 %17 = OpConstant 3.674022E-40 
                                    f32 %18 = OpConstant 3.674022E-40 
                                  f32_4 %19 = OpConstantComposite %17 %17 %17 %18 
                                        %20 = OpTypeVector %6 4 
                                        %23 = OpTypeVector %10 3 
                                        %24 = OpTypePointer Private %23 
                         Private f32_3* %25 = OpVariable Private 
                                        %26 = OpTypeInt 32 0 
                                    u32 %27 = OpConstant 0 
                                        %28 = OpTypePointer Private %6 
                                        %31 = OpTypePointer Function %10 
                                        %35 = OpTypePointer Input %10 
                                        %40 = OpTypePointer Private %10 
                                    u32 %42 = OpConstant 1 
                                    u32 %53 = OpConstant 2 
                         Private f32_3* %64 = OpVariable Private 
                                        %67 = OpTypeStruct %10 %10 %10 
                                        %68 = OpTypePointer Uniform %67 
       Uniform struct {f32; f32; f32;}* %69 = OpVariable Uniform 
                                        %70 = OpTypeInt 32 1 
                                    i32 %71 = OpConstant 1 
                                        %72 = OpTypePointer Uniform %10 
                         Private f32_3* %85 = OpVariable Private 
                                  f32_3 %89 = OpConstantComposite %17 %17 %17 
                           Private f32* %95 = OpVariable Private 
                          Private f32* %105 = OpVariable Private 
                                       %113 = OpTypeVector %10 2 
                                   i32 %116 = OpConstant 2 
                        Private f32_3* %128 = OpVariable Private 
                                   f32 %132 = OpConstant 3.674022E-40 
                                   f32 %134 = OpConstant 3.674022E-40 
                                   f32 %144 = OpConstant 3.674022E-40 
                                 f32_3 %145 = OpConstantComposite %144 %144 %144 
                                       %152 = OpTypePointer Function %70 
                                   i32 %160 = OpConstant 0 
                          Private f32* %164 = OpVariable Private 
                                   f32 %166 = OpConstant 3.674022E-40 
                                       %169 = OpTypeVector %26 4 
                                   u32 %170 = OpConstant 4 
                                       %171 = OpTypeArray %169 %170 
                                   u32 %172 = OpConstant 1065353216 
                                 u32_4 %173 = OpConstantComposite %172 %27 %27 %27 
                                 u32_4 %174 = OpConstantComposite %27 %172 %27 %27 
                                 u32_4 %175 = OpConstantComposite %27 %27 %172 %27 
                                 u32_4 %176 = OpConstantComposite %27 %27 %27 %172 
                              u32_4[4] %177 = OpConstantComposite %173 %174 %175 %176 
                                       %179 = OpTypeVector %26 3 
                                       %180 = OpTypePointer Function %171 
                                       %182 = OpTypePointer Function %169 
                        Private f32_3* %188 = OpVariable Private 
                          Private f32* %190 = OpVariable Private 
                                       %200 = OpTypePointer Private %70 
                          Private i32* %201 = OpVariable Private 
                                   i32 %205 = OpConstant -1 
                          Private f32* %207 = OpVariable Private 
                          Private f32* %210 = OpVariable Private 
                        Private f32_3* %214 = OpVariable Private 
                          Private f32* %225 = OpVariable Private 
                        Private f32_3* %228 = OpVariable Private 
                        Private f32_3* %232 = OpVariable Private 
                        Private f32_3* %248 = OpVariable Private 
                                   f32 %250 = OpConstant 3.674022E-40 
                                 f32_3 %251 = OpConstantComposite %250 %250 %250 
                        Private f32_3* %278 = OpVariable Private 
                                       %279 = OpTypeImage %10 Cube 0 0 0 1 Unknown 
                                       %280 = OpTypePointer UniformConstant %279 
UniformConstant read_only TextureCube* %281 = OpVariable UniformConstant 
                                       %283 = OpTypeSampler 
                                       %284 = OpTypePointer UniformConstant %283 
              UniformConstant sampler* %285 = OpVariable UniformConstant 
                                       %287 = OpTypeSampledImage %279 
                        Private f32_3* %335 = OpVariable Private 
                                   f32 %365 = OpConstant 3.674022E-40 
                                       %379 = OpTypePointer Output %11 
                         Output f32_4* %380 = OpVariable Output 
                                   u32 %387 = OpConstant 3 
                                       %388 = OpTypePointer Output %10 
                          Private i32* %391 = OpVariable Private 
                          Private i32* %392 = OpVariable Private 
                         Private bool* %393 = OpVariable Private 
                         Private bool* %394 = OpVariable Private 
                          Private i32* %395 = OpVariable Private 
                         Private bool* %396 = OpVariable Private 
                                    void %4 = OpFunction None %3 
                                         %5 = OpLabel 
                          Function f32* %32 = OpVariable Function 
                          Function f32* %45 = OpVariable Function 
                          Function f32* %56 = OpVariable Function 
                         Function i32* %153 = OpVariable Function 
                    Function u32_4[4]* %181 = OpVariable Function 
                         Function i32* %192 = OpVariable Function 
                         Function i32* %217 = OpVariable Function 
                    Function u32_4[4]* %349 = OpVariable Function 
                                  f32_4 %14 = OpLoad vs_TEXCOORD0 
                                  f32_4 %15 = OpVectorShuffle %14 %14 0 1 2 0 
                                  f32_4 %16 = OpExtInst %1 4 %15 
                                 bool_4 %21 = OpFOrdEqual %16 %19 
                                 bool_3 %22 = OpVectorShuffle %21 %21 0 1 2 
                                                OpStore %9 %22 
                          Private bool* %29 = OpAccessChain %9 %27 
                                   bool %30 = OpLoad %29 
                                                OpSelectionMerge %34 None 
                                                OpBranchConditional %30 %33 %38 
                                        %33 = OpLabel 
                             Input f32* %36 = OpAccessChain vs_TEXCOORD0 %27 
                                    f32 %37 = OpLoad %36 
                                                OpStore %32 %37 
                                                OpBranch %34 
                                        %38 = OpLabel 
                                                OpStore %32 %18 
                                                OpBranch %34 
                                        %34 = OpLabel 
                                    f32 %39 = OpLoad %32 
                           Private f32* %41 = OpAccessChain %25 %27 
                                                OpStore %41 %39 
                          Private bool* %43 = OpAccessChain %9 %42 
                                   bool %44 = OpLoad %43 
                                                OpSelectionMerge %47 None 
                                                OpBranchConditional %44 %46 %50 
                                        %46 = OpLabel 
                             Input f32* %48 = OpAccessChain vs_TEXCOORD0 %42 
                                    f32 %49 = OpLoad %48 
                                                OpStore %45 %49 
                                                OpBranch %47 
                                        %50 = OpLabel 
                                                OpStore %45 %18 
                                                OpBranch %47 
                                        %47 = OpLabel 
                                    f32 %51 = OpLoad %45 
                           Private f32* %52 = OpAccessChain %25 %42 
                                                OpStore %52 %51 
                          Private bool* %54 = OpAccessChain %9 %53 
                                   bool %55 = OpLoad %54 
                                                OpSelectionMerge %58 None 
                                                OpBranchConditional %55 %57 %61 
                                        %57 = OpLabel 
                             Input f32* %59 = OpAccessChain vs_TEXCOORD0 %53 
                                    f32 %60 = OpLoad %59 
                                                OpStore %56 %60 
                                                OpBranch %58 
                                        %61 = OpLabel 
                                                OpStore %56 %18 
                                                OpBranch %58 
                                        %58 = OpLabel 
                                    f32 %62 = OpLoad %56 
                           Private f32* %63 = OpAccessChain %25 %53 
                                                OpStore %63 %62 
                                  f32_3 %65 = OpLoad %25 
                                  f32_3 %66 = OpVectorShuffle %65 %65 2 0 1 
                           Uniform f32* %73 = OpAccessChain %69 %71 
                                    f32 %74 = OpLoad %73 
                           Uniform f32* %75 = OpAccessChain %69 %71 
                                    f32 %76 = OpLoad %75 
                           Uniform f32* %77 = OpAccessChain %69 %71 
                                    f32 %78 = OpLoad %77 
                                  f32_3 %79 = OpCompositeConstruct %74 %76 %78 
                                    f32 %80 = OpCompositeExtract %79 0 
                                    f32 %81 = OpCompositeExtract %79 1 
                                    f32 %82 = OpCompositeExtract %79 2 
                                  f32_3 %83 = OpCompositeConstruct %80 %81 %82 
                                  f32_3 %84 = OpFMul %66 %83 
                                                OpStore %64 %84 
                                  f32_3 %86 = OpLoad %25 
                                  f32_3 %87 = OpExtInst %1 4 %86 
                                  f32_3 %88 = OpFNegate %87 
                                  f32_3 %90 = OpFAdd %88 %89 
                                                OpStore %85 %90 
                                  f32_3 %91 = OpLoad %85 
                                  f32_4 %92 = OpLoad vs_TEXCOORD0 
                                  f32_3 %93 = OpVectorShuffle %92 %92 0 1 2 
                                  f32_3 %94 = OpFMul %91 %93 
                                                OpStore %85 %94 
                                  f32_3 %96 = OpLoad %85 
                                  f32_3 %97 = OpLoad %85 
                                    f32 %98 = OpDot %96 %97 
                                                OpStore %95 %98 
                                    f32 %99 = OpLoad %95 
                                   f32 %100 = OpFAdd %99 %17 
                                                OpStore %95 %100 
                                   f32 %101 = OpLoad %95 
                                   f32 %102 = OpExtInst %1 31 %101 
                                                OpStore %95 %102 
                                   f32 %103 = OpLoad %95 
                                   f32 %104 = OpFDiv %17 %103 
                                                OpStore %95 %104 
                                   f32 %106 = OpLoad %95 
                                   f32 %107 = OpLoad %95 
                                   f32 %108 = OpFMul %106 %107 
                                                OpStore %105 %108 
                                   f32 %109 = OpLoad %95 
                                   f32 %110 = OpLoad %105 
                                   f32 %111 = OpFMul %109 %110 
                          Private f32* %112 = OpAccessChain %85 %27 
                                                OpStore %112 %111 
                                 f32_3 %114 = OpLoad %85 
                                 f32_2 %115 = OpVectorShuffle %114 %114 0 0 
                          Uniform f32* %117 = OpAccessChain %69 %116 
                                   f32 %118 = OpLoad %117 
                          Uniform f32* %119 = OpAccessChain %69 %116 
                                   f32 %120 = OpLoad %119 
                                 f32_2 %121 = OpCompositeConstruct %118 %120 
                                   f32 %122 = OpCompositeExtract %121 0 
                                   f32 %123 = OpCompositeExtract %121 1 
                                 f32_2 %124 = OpCompositeConstruct %122 %123 
                                 f32_2 %125 = OpFMul %115 %124 
                                 f32_3 %126 = OpLoad %85 
                                 f32_3 %127 = OpVectorShuffle %126 %125 0 3 4 
                                                OpStore %85 %127 
                          Uniform f32* %129 = OpAccessChain %69 %116 
                                   f32 %130 = OpLoad %129 
                          Private f32* %131 = OpAccessChain %128 %27 
                                                OpStore %131 %130 
                          Private f32* %133 = OpAccessChain %128 %42 
                                                OpStore %133 %132 
                          Private f32* %135 = OpAccessChain %128 %53 
                                                OpStore %135 %134 
                                 f32_3 %136 = OpLoad %85 
                                 f32_3 %137 = OpLoad %128 
                                 f32_3 %138 = OpFMul %136 %137 
                                                OpStore %85 %138 
                                 f32_3 %139 = OpLoad %85 
                                 f32_3 %140 = OpLoad %85 
                                 f32_3 %141 = OpFNegate %140 
                                 f32_3 %142 = OpFMul %139 %141 
                                                OpStore %85 %142 
                                 f32_3 %143 = OpLoad %85 
                                 f32_3 %146 = OpFMul %143 %145 
                                                OpStore %85 %146 
                                 f32_3 %147 = OpLoad %85 
                                 f32_3 %148 = OpExtInst %1 29 %147 
                                                OpStore %85 %148 
                          Private f32* %149 = OpAccessChain %128 %27 
                                                OpStore %149 %18 
                          Private f32* %150 = OpAccessChain %128 %42 
                                                OpStore %150 %18 
                          Private f32* %151 = OpAccessChain %128 %53 
                                                OpStore %151 %18 
                                                OpStore %95 %18 
                                                OpStore %153 %116 
                                                OpBranch %154 
                                       %154 = OpLabel 
                                                OpLoopMerge %156 %157 None 
                                                OpBranch %158 
                                       %158 = OpLabel 
                                   i32 %159 = OpLoad %153 
                                  bool %161 = OpSGreaterThanEqual %159 %160 
                                                OpBranchConditional %161 %155 %156 
                                       %155 = OpLabel 
                                   i32 %162 = OpLoad %153 
                                   f32 %163 = OpConvertSToF %162 
                                                OpStore %105 %163 
                                   f32 %165 = OpLoad %105 
                                   f32 %167 = OpFAdd %165 %166 
                                                OpStore %164 %167 
                                 f32_3 %168 = OpLoad %85 
                                   i32 %178 = OpLoad %153 
                                                OpStore %181 %177 
                       Function u32_4* %183 = OpAccessChain %181 %178 
                                 u32_4 %184 = OpLoad %183 
                                 u32_3 %185 = OpVectorShuffle %184 %184 0 1 2 
                                 f32_3 %186 = OpBitcast %185 
                                   f32 %187 = OpDot %168 %186 
                                                OpStore %105 %187 
                                 f32_3 %189 = OpLoad %128 
                                                OpStore %188 %189 
                                   f32 %191 = OpLoad %95 
                                                OpStore %190 %191 
                                                OpStore %192 %160 
                                                OpBranch %193 
                                       %193 = OpLabel 
                                                OpLoopMerge %195 %196 None 
                                                OpBranch %197 
                                       %197 = OpLabel 
                                   i32 %198 = OpLoad %192 
                                  bool %199 = OpSLessThan %198 %116 
                                                OpBranchConditional %199 %194 %195 
                                       %194 = OpLabel 
                                   i32 %202 = OpLoad %192 
                                   i32 %203 = OpShiftLeftLogical %202 %71 
                                                OpStore %201 %203 
                                   i32 %204 = OpLoad %201 
                                   i32 %206 = OpIAdd %204 %205 
                                                OpStore %201 %206 
                                   i32 %208 = OpLoad %201 
                                   f32 %209 = OpConvertSToF %208 
                                                OpStore %207 %209 
                                   f32 %211 = OpLoad %164 
                                   f32 %212 = OpLoad %207 
                                   f32 %213 = OpFMul %211 %212 
                                                OpStore %210 %213 
                                 f32_3 %215 = OpLoad %188 
                                                OpStore %214 %215 
                                   f32 %216 = OpLoad %190 
                                                OpStore %207 %216 
                                                OpStore %217 %116 
                                                OpBranch %218 
                                       %218 = OpLabel 
                                                OpLoopMerge %220 %221 None 
                                                OpBranch %222 
                                       %222 = OpLabel 
                                   i32 %223 = OpLoad %217 
                                  bool %224 = OpSGreaterThanEqual %223 %160 
                                                OpBranchConditional %224 %219 %220 
                                       %219 = OpLabel 
                                   i32 %226 = OpLoad %217 
                                   f32 %227 = OpConvertSToF %226 
                                                OpStore %225 %227 
                                   f32 %229 = OpLoad %225 
                                   f32 %230 = OpFAdd %229 %166 
                          Private f32* %231 = OpAccessChain %228 %27 
                                                OpStore %231 %230 
                                 f32_3 %233 = OpLoad %228 
                                 f32_3 %234 = OpVectorShuffle %233 %233 0 0 0 
                                 f32_3 %235 = OpFNegate %234 
                                 f32_3 %236 = OpLoad %64 
                                 f32_3 %237 = OpFMul %235 %236 
                                 f32_4 %238 = OpLoad vs_TEXCOORD0 
                                 f32_3 %239 = OpVectorShuffle %238 %238 0 1 2 
                                 f32_3 %240 = OpFAdd %237 %239 
                                                OpStore %232 %240 
                                   f32 %241 = OpLoad %210 
                                 f32_3 %242 = OpCompositeConstruct %241 %241 %241 
                                 f32_3 %243 = OpLoad %64 
                                 f32_3 %244 = OpVectorShuffle %243 %243 2 0 1 
                                 f32_3 %245 = OpFMul %242 %244 
                                 f32_3 %246 = OpLoad %232 
                                 f32_3 %247 = OpFAdd %245 %246 
                                                OpStore %232 %247 
                                 f32_3 %249 = OpLoad %232 
                                 f32_3 %252 = OpExtInst %1 40 %249 %251 
                                                OpStore %248 %252 
                                 f32_3 %253 = OpLoad %248 
                                 f32_3 %254 = OpExtInst %1 37 %253 %89 
                                                OpStore %248 %254 
                                 f32_3 %255 = OpLoad %232 
                                 f32_3 %256 = OpLoad %248 
                                 f32_3 %257 = OpFNegate %256 
                                 f32_3 %258 = OpFAdd %255 %257 
                                                OpStore %232 %258 
                          Private f32* %259 = OpAccessChain %232 %42 
                                   f32 %260 = OpLoad %259 
                                   f32 %261 = OpExtInst %1 4 %260 
                          Private f32* %262 = OpAccessChain %232 %27 
                                   f32 %263 = OpLoad %262 
                                   f32 %264 = OpExtInst %1 4 %263 
                                   f32 %265 = OpExtInst %1 40 %261 %264 
                                                OpStore %225 %265 
                          Private f32* %266 = OpAccessChain %232 %53 
                                   f32 %267 = OpLoad %266 
                                   f32 %268 = OpExtInst %1 4 %267 
                                   f32 %269 = OpLoad %225 
                                   f32 %270 = OpExtInst %1 40 %268 %269 
                                                OpStore %225 %270 
                                   f32 %271 = OpLoad %225 
                                 f32_3 %272 = OpCompositeConstruct %271 %271 %271 
                                 f32_3 %273 = OpFNegate %272 
                                 f32_3 %274 = OpLoad %25 
                                 f32_3 %275 = OpFMul %273 %274 
                                 f32_3 %276 = OpLoad %248 
                                 f32_3 %277 = OpFAdd %275 %276 
                                                OpStore %232 %277 
                 read_only TextureCube %282 = OpLoad %281 
                               sampler %286 = OpLoad %285 
          read_only TextureCubeSampled %288 = OpSampledImage %282 %286 
                                 f32_3 %289 = OpLoad %232 
                          Uniform f32* %290 = OpAccessChain %69 %160 
                                   f32 %291 = OpLoad %290 
                                 f32_4 %292 = OpImageSampleExplicitLod %288 %289 Lod %11 
                                 f32_3 %293 = OpVectorShuffle %292 %292 0 1 2 
                                                OpStore %278 %293 
                                 f32_3 %294 = OpLoad %228 
                                 f32_3 %295 = OpVectorShuffle %294 %294 0 0 0 
                                 f32_3 %296 = OpLoad %64 
                                 f32_3 %297 = OpFMul %295 %296 
                                 f32_4 %298 = OpLoad vs_TEXCOORD0 
                                 f32_3 %299 = OpVectorShuffle %298 %298 0 1 2 
                                 f32_3 %300 = OpFAdd %297 %299 
                                                OpStore %232 %300 
                                   f32 %301 = OpLoad %210 
                                 f32_3 %302 = OpCompositeConstruct %301 %301 %301 
                                 f32_3 %303 = OpLoad %64 
                                 f32_3 %304 = OpVectorShuffle %303 %303 2 0 1 
                                 f32_3 %305 = OpFMul %302 %304 
                                 f32_3 %306 = OpLoad %232 
                                 f32_3 %307 = OpFAdd %305 %306 
                                                OpStore %232 %307 
                                 f32_3 %308 = OpLoad %232 
                                 f32_3 %309 = OpExtInst %1 40 %308 %251 
                                                OpStore %248 %309 
                                 f32_3 %310 = OpLoad %248 
                                 f32_3 %311 = OpExtInst %1 37 %310 %89 
                                                OpStore %248 %311 
                                 f32_3 %312 = OpLoad %232 
                                 f32_3 %313 = OpLoad %248 
                                 f32_3 %314 = OpFNegate %313 
                                 f32_3 %315 = OpFAdd %312 %314 
                                                OpStore %232 %315 
                          Private f32* %316 = OpAccessChain %232 %42 
                                   f32 %317 = OpLoad %316 
                                   f32 %318 = OpExtInst %1 4 %317 
                          Private f32* %319 = OpAccessChain %232 %27 
                                   f32 %320 = OpLoad %319 
                                   f32 %321 = OpExtInst %1 4 %320 
                                   f32 %322 = OpExtInst %1 40 %318 %321 
                                                OpStore %225 %322 
                          Private f32* %323 = OpAccessChain %232 %53 
                                   f32 %324 = OpLoad %323 
                                   f32 %325 = OpExtInst %1 4 %324 
                                   f32 %326 = OpLoad %225 
                                   f32 %327 = OpExtInst %1 40 %325 %326 
                                                OpStore %225 %327 
                                   f32 %328 = OpLoad %225 
                                 f32_3 %329 = OpCompositeConstruct %328 %328 %328 
                                 f32_3 %330 = OpFNegate %329 
                                 f32_3 %331 = OpLoad %25 
                                 f32_3 %332 = OpFMul %330 %331 
                                 f32_3 %333 = OpLoad %248 
                                 f32_3 %334 = OpFAdd %332 %333 
                                                OpStore %232 %334 
                 read_only TextureCube %336 = OpLoad %281 
                               sampler %337 = OpLoad %285 
          read_only TextureCubeSampled %338 = OpSampledImage %336 %337 
                                 f32_3 %339 = OpLoad %232 
                          Uniform f32* %340 = OpAccessChain %69 %160 
                                   f32 %341 = OpLoad %340 
                                 f32_4 %342 = OpImageSampleExplicitLod %338 %339 Lod %11 
                                 f32_3 %343 = OpVectorShuffle %342 %342 0 1 2 
                                                OpStore %335 %343 
                                 f32_3 %344 = OpLoad %335 
                                 f32_3 %345 = OpLoad %278 
                                 f32_3 %346 = OpFAdd %344 %345 
                                                OpStore %228 %346 
                                 f32_3 %347 = OpLoad %85 
                                   i32 %348 = OpLoad %217 
                                                OpStore %349 %177 
                       Function u32_4* %350 = OpAccessChain %349 %348 
                                 u32_4 %351 = OpLoad %350 
                                 u32_3 %352 = OpVectorShuffle %351 %351 0 1 2 
                                 f32_3 %353 = OpBitcast %352 
                                   f32 %354 = OpDot %347 %353 
                                                OpStore %225 %354 
                                   f32 %355 = OpLoad %105 
                                   f32 %356 = OpLoad %225 
                                   f32 %357 = OpFMul %355 %356 
                                                OpStore %225 %357 
                                 f32_3 %358 = OpLoad %228 
                                   f32 %359 = OpLoad %225 
                                 f32_3 %360 = OpCompositeConstruct %359 %359 %359 
                                 f32_3 %361 = OpFMul %358 %360 
                                 f32_3 %362 = OpLoad %214 
                                 f32_3 %363 = OpFAdd %361 %362 
                                                OpStore %214 %363 
                                   f32 %364 = OpLoad %225 
                                   f32 %366 = OpFMul %364 %365 
                                   f32 %367 = OpLoad %207 
                                   f32 %368 = OpFAdd %366 %367 
                                                OpStore %207 %368 
                                                OpBranch %221 
                                       %221 = OpLabel 
                                   i32 %369 = OpLoad %217 
                                   i32 %370 = OpIAdd %369 %205 
                                                OpStore %217 %370 
                                                OpBranch %218 
                                       %220 = OpLabel 
                                 f32_3 %371 = OpLoad %214 
                                                OpStore %188 %371 
                                   f32 %372 = OpLoad %207 
                                                OpStore %190 %372 
                                                OpBranch %196 
                                       %196 = OpLabel 
                                   i32 %373 = OpLoad %192 
                                   i32 %374 = OpIAdd %373 %71 
                                                OpStore %192 %374 
                                                OpBranch %193 
                                       %195 = OpLabel 
                                 f32_3 %375 = OpLoad %188 
                                                OpStore %128 %375 
                                   f32 %376 = OpLoad %190 
                                                OpStore %95 %376 
                                                OpBranch %157 
                                       %157 = OpLabel 
                                   i32 %377 = OpLoad %153 
                                   i32 %378 = OpIAdd %377 %205 
                                                OpStore %153 %378 
                                                OpBranch %154 
                                       %156 = OpLabel 
                                 f32_3 %381 = OpLoad %128 
                                   f32 %382 = OpLoad %95 
                                 f32_3 %383 = OpCompositeConstruct %382 %382 %382 
                                 f32_3 %384 = OpFDiv %381 %383 
                                 f32_4 %385 = OpLoad %380 
                                 f32_4 %386 = OpVectorShuffle %385 %384 4 5 6 3 
                                                OpStore %380 %386 
                           Output f32* %389 = OpAccessChain %380 %387 
                                                OpStore %389 %17 
                                                OpReturn
                                                OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 92
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %79 %83 %84 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %77 0 BuiltIn 77 
                                              OpMemberDecorate %77 1 BuiltIn 77 
                                              OpMemberDecorate %77 2 BuiltIn 77 
                                              OpDecorate %77 Block 
                                              OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD0 Location 83 
                                              OpDecorate %84 Location 84 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypePointer Input %7 
                         Input f32_4* %11 = OpVariable Input 
                                      %14 = OpTypeInt 32 0 
                                  u32 %15 = OpConstant 4 
                                      %16 = OpTypeArray %7 %15 
                                      %17 = OpTypeArray %7 %15 
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %75 = OpConstant 1 
                                      %76 = OpTypeArray %6 %75 
                                      %77 = OpTypeStruct %7 %6 %76 
                                      %78 = OpTypePointer Output %77 
 Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
                                      %81 = OpTypePointer Output %7 
               Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                         Input f32_4* %84 = OpVariable Input 
                                      %86 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %43 = OpLoad %9 
                       Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                f32_4 %46 = OpLoad %45 
                                f32_4 %47 = OpFAdd %43 %46 
                                              OpStore %9 %47 
                                f32_4 %49 = OpLoad %9 
                                f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFMul %50 %52 
                                              OpStore %48 %53 
                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %48 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %48 %60 
                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                f32_4 %62 = OpLoad %61 
                                f32_4 %63 = OpLoad %9 
                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                f32_4 %65 = OpFMul %62 %64 
                                f32_4 %66 = OpLoad %48 
                                f32_4 %67 = OpFAdd %65 %66 
                                              OpStore %48 %67 
                       Uniform f32_4* %68 = OpAccessChain %20 %23 %44 
                                f32_4 %69 = OpLoad %68 
                                f32_4 %70 = OpLoad %9 
                                f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                f32_4 %72 = OpFMul %69 %71 
                                f32_4 %73 = OpLoad %48 
                                f32_4 %74 = OpFAdd %72 %73 
                                              OpStore %9 %74 
                                f32_4 %80 = OpLoad %9 
                        Output f32_4* %82 = OpAccessChain %79 %22 
                                              OpStore %82 %80 
                                f32_4 %85 = OpLoad %84 
                                              OpStore vs_TEXCOORD0 %85 
                          Output f32* %87 = OpAccessChain %79 %22 %75 
                                  f32 %88 = OpLoad %87 
                                  f32 %89 = OpFNegate %88 
                          Output f32* %90 = OpAccessChain %79 %22 %75 
                                              OpStore %90 %89 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 397
; Schema: 0
                                                OpCapability Shader 
                                         %1 = OpExtInstImport "GLSL.std.450" 
                                                OpMemoryModel Logical GLSL450 
                                                OpEntryPoint Fragment %4 "main" %13 %380 
                                                OpExecutionMode %4 OriginUpperLeft 
                                                OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                                OpDecorate vs_TEXCOORD0 Location 13 
                                                OpDecorate %14 RelaxedPrecision 
                                                OpDecorate %15 RelaxedPrecision 
                                                OpDecorate %16 RelaxedPrecision 
                                                OpDecorate %21 RelaxedPrecision 
                                                OpDecorate %25 RelaxedPrecision 
                                                OpDecorate %37 RelaxedPrecision 
                                                OpDecorate %39 RelaxedPrecision 
                                                OpDecorate %49 RelaxedPrecision 
                                                OpDecorate %51 RelaxedPrecision 
                                                OpDecorate %60 RelaxedPrecision 
                                                OpDecorate %62 RelaxedPrecision 
                                                OpDecorate %64 RelaxedPrecision 
                                                OpDecorate %65 RelaxedPrecision 
                                                OpDecorate %66 RelaxedPrecision 
                                                OpMemberDecorate %67 0 RelaxedPrecision 
                                                OpMemberDecorate %67 0 Offset 67 
                                                OpMemberDecorate %67 1 RelaxedPrecision 
                                                OpMemberDecorate %67 1 Offset 67 
                                                OpMemberDecorate %67 2 RelaxedPrecision 
                                                OpMemberDecorate %67 2 Offset 67 
                                                OpDecorate %67 Block 
                                                OpDecorate %69 DescriptorSet 69 
                                                OpDecorate %69 Binding 69 
                                                OpDecorate %74 RelaxedPrecision 
                                                OpDecorate %76 RelaxedPrecision 
                                                OpDecorate %78 RelaxedPrecision 
                                                OpDecorate %79 RelaxedPrecision 
                                                OpDecorate %80 RelaxedPrecision 
                                                OpDecorate %81 RelaxedPrecision 
                                                OpDecorate %82 RelaxedPrecision 
                                                OpDecorate %83 RelaxedPrecision 
                                                OpDecorate %84 RelaxedPrecision 
                                                OpDecorate %85 RelaxedPrecision 
                                                OpDecorate %86 RelaxedPrecision 
                                                OpDecorate %87 RelaxedPrecision 
                                                OpDecorate %88 RelaxedPrecision 
                                                OpDecorate %90 RelaxedPrecision 
                                                OpDecorate %91 RelaxedPrecision 
                                                OpDecorate %92 RelaxedPrecision 
                                                OpDecorate %93 RelaxedPrecision 
                                                OpDecorate %94 RelaxedPrecision 
                                                OpDecorate %95 RelaxedPrecision 
                                                OpDecorate %96 RelaxedPrecision 
                                                OpDecorate %97 RelaxedPrecision 
                                                OpDecorate %98 RelaxedPrecision 
                                                OpDecorate %99 RelaxedPrecision 
                                                OpDecorate %100 RelaxedPrecision 
                                                OpDecorate %101 RelaxedPrecision 
                                                OpDecorate %102 RelaxedPrecision 
                                                OpDecorate %103 RelaxedPrecision 
                                                OpDecorate %104 RelaxedPrecision 
                                                OpDecorate %105 RelaxedPrecision 
                                                OpDecorate %106 RelaxedPrecision 
                                                OpDecorate %107 RelaxedPrecision 
                                                OpDecorate %108 RelaxedPrecision 
                                                OpDecorate %109 RelaxedPrecision 
                                                OpDecorate %110 RelaxedPrecision 
                                                OpDecorate %111 RelaxedPrecision 
                                                OpDecorate %114 RelaxedPrecision 
                                                OpDecorate %115 RelaxedPrecision 
                                                OpDecorate %118 RelaxedPrecision 
                                                OpDecorate %120 RelaxedPrecision 
                                                OpDecorate %121 RelaxedPrecision 
                                                OpDecorate %122 RelaxedPrecision 
                                                OpDecorate %123 RelaxedPrecision 
                                                OpDecorate %124 RelaxedPrecision 
                                                OpDecorate %125 RelaxedPrecision 
                                                OpDecorate %128 RelaxedPrecision 
                                                OpDecorate %130 RelaxedPrecision 
                                                OpDecorate %136 RelaxedPrecision 
                                                OpDecorate %137 RelaxedPrecision 
                                                OpDecorate %138 RelaxedPrecision 
                                                OpDecorate %139 RelaxedPrecision 
                                                OpDecorate %140 RelaxedPrecision 
                                                OpDecorate %141 RelaxedPrecision 
                                                OpDecorate %142 RelaxedPrecision 
                                                OpDecorate %143 RelaxedPrecision 
                                                OpDecorate %146 RelaxedPrecision 
                                                OpDecorate %147 RelaxedPrecision 
                                                OpDecorate %148 RelaxedPrecision 
                                                OpDecorate %163 RelaxedPrecision 
                                                OpDecorate %164 RelaxedPrecision 
                                                OpDecorate %165 RelaxedPrecision 
                                                OpDecorate %167 RelaxedPrecision 
                                                OpDecorate %168 RelaxedPrecision 
                                                OpDecorate %188 RelaxedPrecision 
                                                OpDecorate %189 RelaxedPrecision 
                                                OpDecorate %190 RelaxedPrecision 
                                                OpDecorate %191 RelaxedPrecision 
                                                OpDecorate %207 RelaxedPrecision 
                                                OpDecorate %209 RelaxedPrecision 
                                                OpDecorate %210 RelaxedPrecision 
                                                OpDecorate %211 RelaxedPrecision 
                                                OpDecorate %212 RelaxedPrecision 
                                                OpDecorate %213 RelaxedPrecision 
                                                OpDecorate %214 RelaxedPrecision 
                                                OpDecorate %215 RelaxedPrecision 
                                                OpDecorate %216 RelaxedPrecision 
                                                OpDecorate %225 RelaxedPrecision 
                                                OpDecorate %227 RelaxedPrecision 
                                                OpDecorate %228 RelaxedPrecision 
                                                OpDecorate %229 RelaxedPrecision 
                                                OpDecorate %230 RelaxedPrecision 
                                                OpDecorate %232 RelaxedPrecision 
                                                OpDecorate %233 RelaxedPrecision 
                                                OpDecorate %234 RelaxedPrecision 
                                                OpDecorate %235 RelaxedPrecision 
                                                OpDecorate %236 RelaxedPrecision 
                                                OpDecorate %237 RelaxedPrecision 
                                                OpDecorate %238 RelaxedPrecision 
                                                OpDecorate %239 RelaxedPrecision 
                                                OpDecorate %240 RelaxedPrecision 
                                                OpDecorate %241 RelaxedPrecision 
                                                OpDecorate %242 RelaxedPrecision 
                                                OpDecorate %243 RelaxedPrecision 
                                                OpDecorate %244 RelaxedPrecision 
                                                OpDecorate %245 RelaxedPrecision 
                                                OpDecorate %246 RelaxedPrecision 
                                                OpDecorate %247 RelaxedPrecision 
                                                OpDecorate %248 RelaxedPrecision 
                                                OpDecorate %249 RelaxedPrecision 
                                                OpDecorate %252 RelaxedPrecision 
                                                OpDecorate %253 RelaxedPrecision 
                                                OpDecorate %254 RelaxedPrecision 
                                                OpDecorate %255 RelaxedPrecision 
                                                OpDecorate %256 RelaxedPrecision 
                                                OpDecorate %257 RelaxedPrecision 
                                                OpDecorate %258 RelaxedPrecision 
                                                OpDecorate %260 RelaxedPrecision 
                                                OpDecorate %261 RelaxedPrecision 
                                                OpDecorate %263 RelaxedPrecision 
                                                OpDecorate %264 RelaxedPrecision 
                                                OpDecorate %265 RelaxedPrecision 
                                                OpDecorate %267 RelaxedPrecision 
                                                OpDecorate %268 RelaxedPrecision 
                                                OpDecorate %269 RelaxedPrecision 
                                                OpDecorate %270 RelaxedPrecision 
                                                OpDecorate %271 RelaxedPrecision 
                                                OpDecorate %272 RelaxedPrecision 
                                                OpDecorate %273 RelaxedPrecision 
                                                OpDecorate %274 RelaxedPrecision 
                                                OpDecorate %275 RelaxedPrecision 
                                                OpDecorate %276 RelaxedPrecision 
                                                OpDecorate %277 RelaxedPrecision 
                                                OpDecorate %278 RelaxedPrecision 
                                                OpDecorate %281 RelaxedPrecision 
                                                OpDecorate %281 DescriptorSet 281 
                                                OpDecorate %281 Binding 281 
                                                OpDecorate %282 RelaxedPrecision 
                                                OpDecorate %285 RelaxedPrecision 
                                                OpDecorate %285 DescriptorSet 285 
                                                OpDecorate %285 Binding 285 
                                                OpDecorate %286 RelaxedPrecision 
                                                OpDecorate %289 RelaxedPrecision 
                                                OpDecorate %291 RelaxedPrecision 
                                                OpDecorate %292 RelaxedPrecision 
                                                OpDecorate %293 RelaxedPrecision 
                                                OpDecorate %294 RelaxedPrecision 
                                                OpDecorate %295 RelaxedPrecision 
                                                OpDecorate %296 RelaxedPrecision 
                                                OpDecorate %297 RelaxedPrecision 
                                                OpDecorate %298 RelaxedPrecision 
                                                OpDecorate %299 RelaxedPrecision 
                                                OpDecorate %300 RelaxedPrecision 
                                                OpDecorate %301 RelaxedPrecision 
                                                OpDecorate %302 RelaxedPrecision 
                                                OpDecorate %303 RelaxedPrecision 
                                                OpDecorate %304 RelaxedPrecision 
                                                OpDecorate %305 RelaxedPrecision 
                                                OpDecorate %306 RelaxedPrecision 
                                                OpDecorate %307 RelaxedPrecision 
                                                OpDecorate %308 RelaxedPrecision 
                                                OpDecorate %309 RelaxedPrecision 
                                                OpDecorate %310 RelaxedPrecision 
                                                OpDecorate %311 RelaxedPrecision 
                                                OpDecorate %312 RelaxedPrecision 
                                                OpDecorate %313 RelaxedPrecision 
                                                OpDecorate %314 RelaxedPrecision 
                                                OpDecorate %315 RelaxedPrecision 
                                                OpDecorate %317 RelaxedPrecision 
                                                OpDecorate %318 RelaxedPrecision 
                                                OpDecorate %320 RelaxedPrecision 
                                                OpDecorate %321 RelaxedPrecision 
                                                OpDecorate %322 RelaxedPrecision 
                                                OpDecorate %324 RelaxedPrecision 
                                                OpDecorate %325 RelaxedPrecision 
                                                OpDecorate %326 RelaxedPrecision 
                                                OpDecorate %327 RelaxedPrecision 
                                                OpDecorate %328 RelaxedPrecision 
                                                OpDecorate %329 RelaxedPrecision 
                                                OpDecorate %330 RelaxedPrecision 
                                                OpDecorate %331 RelaxedPrecision 
                                                OpDecorate %332 RelaxedPrecision 
                                                OpDecorate %333 RelaxedPrecision 
                                                OpDecorate %334 RelaxedPrecision 
                                                OpDecorate %335 RelaxedPrecision 
                                                OpDecorate %336 RelaxedPrecision 
                                                OpDecorate %337 RelaxedPrecision 
                                                OpDecorate %339 RelaxedPrecision 
                                                OpDecorate %341 RelaxedPrecision 
                                                OpDecorate %342 RelaxedPrecision 
                                                OpDecorate %343 RelaxedPrecision 
                                                OpDecorate %344 RelaxedPrecision 
                                                OpDecorate %345 RelaxedPrecision 
                                                OpDecorate %346 RelaxedPrecision 
                                                OpDecorate %347 RelaxedPrecision 
                                                OpDecorate %355 RelaxedPrecision 
                                                OpDecorate %356 RelaxedPrecision 
                                                OpDecorate %357 RelaxedPrecision 
                                                OpDecorate %358 RelaxedPrecision 
                                                OpDecorate %359 RelaxedPrecision 
                                                OpDecorate %360 RelaxedPrecision 
                                                OpDecorate %361 RelaxedPrecision 
                                                OpDecorate %362 RelaxedPrecision 
                                                OpDecorate %363 RelaxedPrecision 
                                                OpDecorate %364 RelaxedPrecision 
                                                OpDecorate %366 RelaxedPrecision 
                                                OpDecorate %367 RelaxedPrecision 
                                                OpDecorate %368 RelaxedPrecision 
                                                OpDecorate %371 RelaxedPrecision 
                                                OpDecorate %372 RelaxedPrecision 
                                                OpDecorate %375 RelaxedPrecision 
                                                OpDecorate %376 RelaxedPrecision 
                                                OpDecorate %380 RelaxedPrecision 
                                                OpDecorate %380 Location 380 
                                                OpDecorate %381 RelaxedPrecision 
                                                OpDecorate %382 RelaxedPrecision 
                                                OpDecorate %383 RelaxedPrecision 
                                                OpDecorate %384 RelaxedPrecision 
                                         %2 = OpTypeVoid 
                                         %3 = OpTypeFunction %2 
                                         %6 = OpTypeBool 
                                         %7 = OpTypeVector %6 3 
                                         %8 = OpTypePointer Private %7 
                         Private bool_3* %9 = OpVariable Private 
                                        %10 = OpTypeFloat 32 
                                        %11 = OpTypeVector %10 4 
                                        %12 = OpTypePointer Input %11 
                  Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                    f32 %17 = OpConstant 3.674022E-40 
                                    f32 %18 = OpConstant 3.674022E-40 
                                  f32_4 %19 = OpConstantComposite %17 %17 %17 %18 
                                        %20 = OpTypeVector %6 4 
                                        %23 = OpTypeVector %10 3 
                                        %24 = OpTypePointer Private %23 
                         Private f32_3* %25 = OpVariable Private 
                                        %26 = OpTypeInt 32 0 
                                    u32 %27 = OpConstant 0 
                                        %28 = OpTypePointer Private %6 
                                        %31 = OpTypePointer Function %10 
                                        %35 = OpTypePointer Input %10 
                                        %40 = OpTypePointer Private %10 
                                    u32 %42 = OpConstant 1 
                                    u32 %53 = OpConstant 2 
                         Private f32_3* %64 = OpVariable Private 
                                        %67 = OpTypeStruct %10 %10 %10 
                                        %68 = OpTypePointer Uniform %67 
       Uniform struct {f32; f32; f32;}* %69 = OpVariable Uniform 
                                        %70 = OpTypeInt 32 1 
                                    i32 %71 = OpConstant 1 
                                        %72 = OpTypePointer Uniform %10 
                         Private f32_3* %85 = OpVariable Private 
                                  f32_3 %89 = OpConstantComposite %17 %17 %17 
                           Private f32* %95 = OpVariable Private 
                          Private f32* %105 = OpVariable Private 
                                       %113 = OpTypeVector %10 2 
                                   i32 %116 = OpConstant 2 
                        Private f32_3* %128 = OpVariable Private 
                                   f32 %132 = OpConstant 3.674022E-40 
                                   f32 %134 = OpConstant 3.674022E-40 
                                   f32 %144 = OpConstant 3.674022E-40 
                                 f32_3 %145 = OpConstantComposite %144 %144 %144 
                                       %152 = OpTypePointer Function %70 
                                   i32 %160 = OpConstant 0 
                          Private f32* %164 = OpVariable Private 
                                   f32 %166 = OpConstant 3.674022E-40 
                                       %169 = OpTypeVector %26 4 
                                   u32 %170 = OpConstant 4 
                                       %171 = OpTypeArray %169 %170 
                                   u32 %172 = OpConstant 1065353216 
                                 u32_4 %173 = OpConstantComposite %172 %27 %27 %27 
                                 u32_4 %174 = OpConstantComposite %27 %172 %27 %27 
                                 u32_4 %175 = OpConstantComposite %27 %27 %172 %27 
                                 u32_4 %176 = OpConstantComposite %27 %27 %27 %172 
                              u32_4[4] %177 = OpConstantComposite %173 %174 %175 %176 
                                       %179 = OpTypeVector %26 3 
                                       %180 = OpTypePointer Function %171 
                                       %182 = OpTypePointer Function %169 
                        Private f32_3* %188 = OpVariable Private 
                          Private f32* %190 = OpVariable Private 
                                       %200 = OpTypePointer Private %70 
                          Private i32* %201 = OpVariable Private 
                                   i32 %205 = OpConstant -1 
                          Private f32* %207 = OpVariable Private 
                          Private f32* %210 = OpVariable Private 
                        Private f32_3* %214 = OpVariable Private 
                          Private f32* %225 = OpVariable Private 
                        Private f32_3* %228 = OpVariable Private 
                        Private f32_3* %232 = OpVariable Private 
                        Private f32_3* %248 = OpVariable Private 
                                   f32 %250 = OpConstant 3.674022E-40 
                                 f32_3 %251 = OpConstantComposite %250 %250 %250 
                        Private f32_3* %278 = OpVariable Private 
                                       %279 = OpTypeImage %10 Cube 0 0 0 1 Unknown 
                                       %280 = OpTypePointer UniformConstant %279 
UniformConstant read_only TextureCube* %281 = OpVariable UniformConstant 
                                       %283 = OpTypeSampler 
                                       %284 = OpTypePointer UniformConstant %283 
              UniformConstant sampler* %285 = OpVariable UniformConstant 
                                       %287 = OpTypeSampledImage %279 
                        Private f32_3* %335 = OpVariable Private 
                                   f32 %365 = OpConstant 3.674022E-40 
                                       %379 = OpTypePointer Output %11 
                         Output f32_4* %380 = OpVariable Output 
                                   u32 %387 = OpConstant 3 
                                       %388 = OpTypePointer Output %10 
                          Private i32* %391 = OpVariable Private 
                          Private i32* %392 = OpVariable Private 
                         Private bool* %393 = OpVariable Private 
                         Private bool* %394 = OpVariable Private 
                          Private i32* %395 = OpVariable Private 
                         Private bool* %396 = OpVariable Private 
                                    void %4 = OpFunction None %3 
                                         %5 = OpLabel 
                          Function f32* %32 = OpVariable Function 
                          Function f32* %45 = OpVariable Function 
                          Function f32* %56 = OpVariable Function 
                         Function i32* %153 = OpVariable Function 
                    Function u32_4[4]* %181 = OpVariable Function 
                         Function i32* %192 = OpVariable Function 
                         Function i32* %217 = OpVariable Function 
                    Function u32_4[4]* %349 = OpVariable Function 
                                  f32_4 %14 = OpLoad vs_TEXCOORD0 
                                  f32_4 %15 = OpVectorShuffle %14 %14 0 1 2 0 
                                  f32_4 %16 = OpExtInst %1 4 %15 
                                 bool_4 %21 = OpFOrdEqual %16 %19 
                                 bool_3 %22 = OpVectorShuffle %21 %21 0 1 2 
                                                OpStore %9 %22 
                          Private bool* %29 = OpAccessChain %9 %27 
                                   bool %30 = OpLoad %29 
                                                OpSelectionMerge %34 None 
                                                OpBranchConditional %30 %33 %38 
                                        %33 = OpLabel 
                             Input f32* %36 = OpAccessChain vs_TEXCOORD0 %27 
                                    f32 %37 = OpLoad %36 
                                                OpStore %32 %37 
                                                OpBranch %34 
                                        %38 = OpLabel 
                                                OpStore %32 %18 
                                                OpBranch %34 
                                        %34 = OpLabel 
                                    f32 %39 = OpLoad %32 
                           Private f32* %41 = OpAccessChain %25 %27 
                                                OpStore %41 %39 
                          Private bool* %43 = OpAccessChain %9 %42 
                                   bool %44 = OpLoad %43 
                                                OpSelectionMerge %47 None 
                                                OpBranchConditional %44 %46 %50 
                                        %46 = OpLabel 
                             Input f32* %48 = OpAccessChain vs_TEXCOORD0 %42 
                                    f32 %49 = OpLoad %48 
                                                OpStore %45 %49 
                                                OpBranch %47 
                                        %50 = OpLabel 
                                                OpStore %45 %18 
                                                OpBranch %47 
                                        %47 = OpLabel 
                                    f32 %51 = OpLoad %45 
                           Private f32* %52 = OpAccessChain %25 %42 
                                                OpStore %52 %51 
                          Private bool* %54 = OpAccessChain %9 %53 
                                   bool %55 = OpLoad %54 
                                                OpSelectionMerge %58 None 
                                                OpBranchConditional %55 %57 %61 
                                        %57 = OpLabel 
                             Input f32* %59 = OpAccessChain vs_TEXCOORD0 %53 
                                    f32 %60 = OpLoad %59 
                                                OpStore %56 %60 
                                                OpBranch %58 
                                        %61 = OpLabel 
                                                OpStore %56 %18 
                                                OpBranch %58 
                                        %58 = OpLabel 
                                    f32 %62 = OpLoad %56 
                           Private f32* %63 = OpAccessChain %25 %53 
                                                OpStore %63 %62 
                                  f32_3 %65 = OpLoad %25 
                                  f32_3 %66 = OpVectorShuffle %65 %65 2 0 1 
                           Uniform f32* %73 = OpAccessChain %69 %71 
                                    f32 %74 = OpLoad %73 
                           Uniform f32* %75 = OpAccessChain %69 %71 
                                    f32 %76 = OpLoad %75 
                           Uniform f32* %77 = OpAccessChain %69 %71 
                                    f32 %78 = OpLoad %77 
                                  f32_3 %79 = OpCompositeConstruct %74 %76 %78 
                                    f32 %80 = OpCompositeExtract %79 0 
                                    f32 %81 = OpCompositeExtract %79 1 
                                    f32 %82 = OpCompositeExtract %79 2 
                                  f32_3 %83 = OpCompositeConstruct %80 %81 %82 
                                  f32_3 %84 = OpFMul %66 %83 
                                                OpStore %64 %84 
                                  f32_3 %86 = OpLoad %25 
                                  f32_3 %87 = OpExtInst %1 4 %86 
                                  f32_3 %88 = OpFNegate %87 
                                  f32_3 %90 = OpFAdd %88 %89 
                                                OpStore %85 %90 
                                  f32_3 %91 = OpLoad %85 
                                  f32_4 %92 = OpLoad vs_TEXCOORD0 
                                  f32_3 %93 = OpVectorShuffle %92 %92 0 1 2 
                                  f32_3 %94 = OpFMul %91 %93 
                                                OpStore %85 %94 
                                  f32_3 %96 = OpLoad %85 
                                  f32_3 %97 = OpLoad %85 
                                    f32 %98 = OpDot %96 %97 
                                                OpStore %95 %98 
                                    f32 %99 = OpLoad %95 
                                   f32 %100 = OpFAdd %99 %17 
                                                OpStore %95 %100 
                                   f32 %101 = OpLoad %95 
                                   f32 %102 = OpExtInst %1 31 %101 
                                                OpStore %95 %102 
                                   f32 %103 = OpLoad %95 
                                   f32 %104 = OpFDiv %17 %103 
                                                OpStore %95 %104 
                                   f32 %106 = OpLoad %95 
                                   f32 %107 = OpLoad %95 
                                   f32 %108 = OpFMul %106 %107 
                                                OpStore %105 %108 
                                   f32 %109 = OpLoad %95 
                                   f32 %110 = OpLoad %105 
                                   f32 %111 = OpFMul %109 %110 
                          Private f32* %112 = OpAccessChain %85 %27 
                                                OpStore %112 %111 
                                 f32_3 %114 = OpLoad %85 
                                 f32_2 %115 = OpVectorShuffle %114 %114 0 0 
                          Uniform f32* %117 = OpAccessChain %69 %116 
                                   f32 %118 = OpLoad %117 
                          Uniform f32* %119 = OpAccessChain %69 %116 
                                   f32 %120 = OpLoad %119 
                                 f32_2 %121 = OpCompositeConstruct %118 %120 
                                   f32 %122 = OpCompositeExtract %121 0 
                                   f32 %123 = OpCompositeExtract %121 1 
                                 f32_2 %124 = OpCompositeConstruct %122 %123 
                                 f32_2 %125 = OpFMul %115 %124 
                                 f32_3 %126 = OpLoad %85 
                                 f32_3 %127 = OpVectorShuffle %126 %125 0 3 4 
                                                OpStore %85 %127 
                          Uniform f32* %129 = OpAccessChain %69 %116 
                                   f32 %130 = OpLoad %129 
                          Private f32* %131 = OpAccessChain %128 %27 
                                                OpStore %131 %130 
                          Private f32* %133 = OpAccessChain %128 %42 
                                                OpStore %133 %132 
                          Private f32* %135 = OpAccessChain %128 %53 
                                                OpStore %135 %134 
                                 f32_3 %136 = OpLoad %85 
                                 f32_3 %137 = OpLoad %128 
                                 f32_3 %138 = OpFMul %136 %137 
                                                OpStore %85 %138 
                                 f32_3 %139 = OpLoad %85 
                                 f32_3 %140 = OpLoad %85 
                                 f32_3 %141 = OpFNegate %140 
                                 f32_3 %142 = OpFMul %139 %141 
                                                OpStore %85 %142 
                                 f32_3 %143 = OpLoad %85 
                                 f32_3 %146 = OpFMul %143 %145 
                                                OpStore %85 %146 
                                 f32_3 %147 = OpLoad %85 
                                 f32_3 %148 = OpExtInst %1 29 %147 
                                                OpStore %85 %148 
                          Private f32* %149 = OpAccessChain %128 %27 
                                                OpStore %149 %18 
                          Private f32* %150 = OpAccessChain %128 %42 
                                                OpStore %150 %18 
                          Private f32* %151 = OpAccessChain %128 %53 
                                                OpStore %151 %18 
                                                OpStore %95 %18 
                                                OpStore %153 %116 
                                                OpBranch %154 
                                       %154 = OpLabel 
                                                OpLoopMerge %156 %157 None 
                                                OpBranch %158 
                                       %158 = OpLabel 
                                   i32 %159 = OpLoad %153 
                                  bool %161 = OpSGreaterThanEqual %159 %160 
                                                OpBranchConditional %161 %155 %156 
                                       %155 = OpLabel 
                                   i32 %162 = OpLoad %153 
                                   f32 %163 = OpConvertSToF %162 
                                                OpStore %105 %163 
                                   f32 %165 = OpLoad %105 
                                   f32 %167 = OpFAdd %165 %166 
                                                OpStore %164 %167 
                                 f32_3 %168 = OpLoad %85 
                                   i32 %178 = OpLoad %153 
                                                OpStore %181 %177 
                       Function u32_4* %183 = OpAccessChain %181 %178 
                                 u32_4 %184 = OpLoad %183 
                                 u32_3 %185 = OpVectorShuffle %184 %184 0 1 2 
                                 f32_3 %186 = OpBitcast %185 
                                   f32 %187 = OpDot %168 %186 
                                                OpStore %105 %187 
                                 f32_3 %189 = OpLoad %128 
                                                OpStore %188 %189 
                                   f32 %191 = OpLoad %95 
                                                OpStore %190 %191 
                                                OpStore %192 %160 
                                                OpBranch %193 
                                       %193 = OpLabel 
                                                OpLoopMerge %195 %196 None 
                                                OpBranch %197 
                                       %197 = OpLabel 
                                   i32 %198 = OpLoad %192 
                                  bool %199 = OpSLessThan %198 %116 
                                                OpBranchConditional %199 %194 %195 
                                       %194 = OpLabel 
                                   i32 %202 = OpLoad %192 
                                   i32 %203 = OpShiftLeftLogical %202 %71 
                                                OpStore %201 %203 
                                   i32 %204 = OpLoad %201 
                                   i32 %206 = OpIAdd %204 %205 
                                                OpStore %201 %206 
                                   i32 %208 = OpLoad %201 
                                   f32 %209 = OpConvertSToF %208 
                                                OpStore %207 %209 
                                   f32 %211 = OpLoad %164 
                                   f32 %212 = OpLoad %207 
                                   f32 %213 = OpFMul %211 %212 
                                                OpStore %210 %213 
                                 f32_3 %215 = OpLoad %188 
                                                OpStore %214 %215 
                                   f32 %216 = OpLoad %190 
                                                OpStore %207 %216 
                                                OpStore %217 %116 
                                                OpBranch %218 
                                       %218 = OpLabel 
                                                OpLoopMerge %220 %221 None 
                                                OpBranch %222 
                                       %222 = OpLabel 
                                   i32 %223 = OpLoad %217 
                                  bool %224 = OpSGreaterThanEqual %223 %160 
                                                OpBranchConditional %224 %219 %220 
                                       %219 = OpLabel 
                                   i32 %226 = OpLoad %217 
                                   f32 %227 = OpConvertSToF %226 
                                                OpStore %225 %227 
                                   f32 %229 = OpLoad %225 
                                   f32 %230 = OpFAdd %229 %166 
                          Private f32* %231 = OpAccessChain %228 %27 
                                                OpStore %231 %230 
                                 f32_3 %233 = OpLoad %228 
                                 f32_3 %234 = OpVectorShuffle %233 %233 0 0 0 
                                 f32_3 %235 = OpFNegate %234 
                                 f32_3 %236 = OpLoad %64 
                                 f32_3 %237 = OpFMul %235 %236 
                                 f32_4 %238 = OpLoad vs_TEXCOORD0 
                                 f32_3 %239 = OpVectorShuffle %238 %238 0 1 2 
                                 f32_3 %240 = OpFAdd %237 %239 
                                                OpStore %232 %240 
                                   f32 %241 = OpLoad %210 
                                 f32_3 %242 = OpCompositeConstruct %241 %241 %241 
                                 f32_3 %243 = OpLoad %64 
                                 f32_3 %244 = OpVectorShuffle %243 %243 2 0 1 
                                 f32_3 %245 = OpFMul %242 %244 
                                 f32_3 %246 = OpLoad %232 
                                 f32_3 %247 = OpFAdd %245 %246 
                                                OpStore %232 %247 
                                 f32_3 %249 = OpLoad %232 
                                 f32_3 %252 = OpExtInst %1 40 %249 %251 
                                                OpStore %248 %252 
                                 f32_3 %253 = OpLoad %248 
                                 f32_3 %254 = OpExtInst %1 37 %253 %89 
                                                OpStore %248 %254 
                                 f32_3 %255 = OpLoad %232 
                                 f32_3 %256 = OpLoad %248 
                                 f32_3 %257 = OpFNegate %256 
                                 f32_3 %258 = OpFAdd %255 %257 
                                                OpStore %232 %258 
                          Private f32* %259 = OpAccessChain %232 %42 
                                   f32 %260 = OpLoad %259 
                                   f32 %261 = OpExtInst %1 4 %260 
                          Private f32* %262 = OpAccessChain %232 %27 
                                   f32 %263 = OpLoad %262 
                                   f32 %264 = OpExtInst %1 4 %263 
                                   f32 %265 = OpExtInst %1 40 %261 %264 
                                                OpStore %225 %265 
                          Private f32* %266 = OpAccessChain %232 %53 
                                   f32 %267 = OpLoad %266 
                                   f32 %268 = OpExtInst %1 4 %267 
                                   f32 %269 = OpLoad %225 
                                   f32 %270 = OpExtInst %1 40 %268 %269 
                                                OpStore %225 %270 
                                   f32 %271 = OpLoad %225 
                                 f32_3 %272 = OpCompositeConstruct %271 %271 %271 
                                 f32_3 %273 = OpFNegate %272 
                                 f32_3 %274 = OpLoad %25 
                                 f32_3 %275 = OpFMul %273 %274 
                                 f32_3 %276 = OpLoad %248 
                                 f32_3 %277 = OpFAdd %275 %276 
                                                OpStore %232 %277 
                 read_only TextureCube %282 = OpLoad %281 
                               sampler %286 = OpLoad %285 
          read_only TextureCubeSampled %288 = OpSampledImage %282 %286 
                                 f32_3 %289 = OpLoad %232 
                          Uniform f32* %290 = OpAccessChain %69 %160 
                                   f32 %291 = OpLoad %290 
                                 f32_4 %292 = OpImageSampleExplicitLod %288 %289 Lod %11 
                                 f32_3 %293 = OpVectorShuffle %292 %292 0 1 2 
                                                OpStore %278 %293 
                                 f32_3 %294 = OpLoad %228 
                                 f32_3 %295 = OpVectorShuffle %294 %294 0 0 0 
                                 f32_3 %296 = OpLoad %64 
                                 f32_3 %297 = OpFMul %295 %296 
                                 f32_4 %298 = OpLoad vs_TEXCOORD0 
                                 f32_3 %299 = OpVectorShuffle %298 %298 0 1 2 
                                 f32_3 %300 = OpFAdd %297 %299 
                                                OpStore %232 %300 
                                   f32 %301 = OpLoad %210 
                                 f32_3 %302 = OpCompositeConstruct %301 %301 %301 
                                 f32_3 %303 = OpLoad %64 
                                 f32_3 %304 = OpVectorShuffle %303 %303 2 0 1 
                                 f32_3 %305 = OpFMul %302 %304 
                                 f32_3 %306 = OpLoad %232 
                                 f32_3 %307 = OpFAdd %305 %306 
                                                OpStore %232 %307 
                                 f32_3 %308 = OpLoad %232 
                                 f32_3 %309 = OpExtInst %1 40 %308 %251 
                                                OpStore %248 %309 
                                 f32_3 %310 = OpLoad %248 
                                 f32_3 %311 = OpExtInst %1 37 %310 %89 
                                                OpStore %248 %311 
                                 f32_3 %312 = OpLoad %232 
                                 f32_3 %313 = OpLoad %248 
                                 f32_3 %314 = OpFNegate %313 
                                 f32_3 %315 = OpFAdd %312 %314 
                                                OpStore %232 %315 
                          Private f32* %316 = OpAccessChain %232 %42 
                                   f32 %317 = OpLoad %316 
                                   f32 %318 = OpExtInst %1 4 %317 
                          Private f32* %319 = OpAccessChain %232 %27 
                                   f32 %320 = OpLoad %319 
                                   f32 %321 = OpExtInst %1 4 %320 
                                   f32 %322 = OpExtInst %1 40 %318 %321 
                                                OpStore %225 %322 
                          Private f32* %323 = OpAccessChain %232 %53 
                                   f32 %324 = OpLoad %323 
                                   f32 %325 = OpExtInst %1 4 %324 
                                   f32 %326 = OpLoad %225 
                                   f32 %327 = OpExtInst %1 40 %325 %326 
                                                OpStore %225 %327 
                                   f32 %328 = OpLoad %225 
                                 f32_3 %329 = OpCompositeConstruct %328 %328 %328 
                                 f32_3 %330 = OpFNegate %329 
                                 f32_3 %331 = OpLoad %25 
                                 f32_3 %332 = OpFMul %330 %331 
                                 f32_3 %333 = OpLoad %248 
                                 f32_3 %334 = OpFAdd %332 %333 
                                                OpStore %232 %334 
                 read_only TextureCube %336 = OpLoad %281 
                               sampler %337 = OpLoad %285 
          read_only TextureCubeSampled %338 = OpSampledImage %336 %337 
                                 f32_3 %339 = OpLoad %232 
                          Uniform f32* %340 = OpAccessChain %69 %160 
                                   f32 %341 = OpLoad %340 
                                 f32_4 %342 = OpImageSampleExplicitLod %338 %339 Lod %11 
                                 f32_3 %343 = OpVectorShuffle %342 %342 0 1 2 
                                                OpStore %335 %343 
                                 f32_3 %344 = OpLoad %335 
                                 f32_3 %345 = OpLoad %278 
                                 f32_3 %346 = OpFAdd %344 %345 
                                                OpStore %228 %346 
                                 f32_3 %347 = OpLoad %85 
                                   i32 %348 = OpLoad %217 
                                                OpStore %349 %177 
                       Function u32_4* %350 = OpAccessChain %349 %348 
                                 u32_4 %351 = OpLoad %350 
                                 u32_3 %352 = OpVectorShuffle %351 %351 0 1 2 
                                 f32_3 %353 = OpBitcast %352 
                                   f32 %354 = OpDot %347 %353 
                                                OpStore %225 %354 
                                   f32 %355 = OpLoad %105 
                                   f32 %356 = OpLoad %225 
                                   f32 %357 = OpFMul %355 %356 
                                                OpStore %225 %357 
                                 f32_3 %358 = OpLoad %228 
                                   f32 %359 = OpLoad %225 
                                 f32_3 %360 = OpCompositeConstruct %359 %359 %359 
                                 f32_3 %361 = OpFMul %358 %360 
                                 f32_3 %362 = OpLoad %214 
                                 f32_3 %363 = OpFAdd %361 %362 
                                                OpStore %214 %363 
                                   f32 %364 = OpLoad %225 
                                   f32 %366 = OpFMul %364 %365 
                                   f32 %367 = OpLoad %207 
                                   f32 %368 = OpFAdd %366 %367 
                                                OpStore %207 %368 
                                                OpBranch %221 
                                       %221 = OpLabel 
                                   i32 %369 = OpLoad %217 
                                   i32 %370 = OpIAdd %369 %205 
                                                OpStore %217 %370 
                                                OpBranch %218 
                                       %220 = OpLabel 
                                 f32_3 %371 = OpLoad %214 
                                                OpStore %188 %371 
                                   f32 %372 = OpLoad %207 
                                                OpStore %190 %372 
                                                OpBranch %196 
                                       %196 = OpLabel 
                                   i32 %373 = OpLoad %192 
                                   i32 %374 = OpIAdd %373 %71 
                                                OpStore %192 %374 
                                                OpBranch %193 
                                       %195 = OpLabel 
                                 f32_3 %375 = OpLoad %188 
                                                OpStore %128 %375 
                                   f32 %376 = OpLoad %190 
                                                OpStore %95 %376 
                                                OpBranch %157 
                                       %157 = OpLabel 
                                   i32 %377 = OpLoad %153 
                                   i32 %378 = OpIAdd %377 %205 
                                                OpStore %153 %378 
                                                OpBranch %154 
                                       %156 = OpLabel 
                                 f32_3 %381 = OpLoad %128 
                                   f32 %382 = OpLoad %95 
                                 f32_3 %383 = OpCompositeConstruct %382 %382 %382 
                                 f32_3 %384 = OpFDiv %381 %383 
                                 f32_4 %385 = OpLoad %380 
                                 f32_4 %386 = OpVectorShuffle %385 %384 4 5 6 3 
                                                OpStore %380 %386 
                           Output f32* %389 = OpAccessChain %380 %387 
                                                OpStore %389 %17 
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
}
SubShader {
 LOD 200
 Tags { "RenderType" = "Opaque" }
 Pass {
  LOD 200
  Tags { "RenderType" = "Opaque" }
  ZTest Always
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 80360
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
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out mediump vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	mediump float _Level;
UNITY_LOCATION(0) uniform mediump samplerCube _MainTex;
in mediump vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = textureLod(_MainTex, vs_TEXCOORD0.xyz, _Level);
    SV_Target0 = u_xlat16_0;
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
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out mediump vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	mediump float _Level;
UNITY_LOCATION(0) uniform mediump samplerCube _MainTex;
in mediump vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = textureLod(_MainTex, vs_TEXCOORD0.xyz, _Level);
    SV_Target0 = u_xlat16_0;
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
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out mediump vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0 = in_TEXCOORD0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	mediump float _Level;
UNITY_LOCATION(0) uniform mediump samplerCube _MainTex;
in mediump vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = textureLod(_MainTex, vs_TEXCOORD0.xyz, _Level);
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 92
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %79 %83 %84 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %77 0 BuiltIn 77 
                                              OpMemberDecorate %77 1 BuiltIn 77 
                                              OpMemberDecorate %77 2 BuiltIn 77 
                                              OpDecorate %77 Block 
                                              OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD0 Location 83 
                                              OpDecorate %84 Location 84 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypePointer Input %7 
                         Input f32_4* %11 = OpVariable Input 
                                      %14 = OpTypeInt 32 0 
                                  u32 %15 = OpConstant 4 
                                      %16 = OpTypeArray %7 %15 
                                      %17 = OpTypeArray %7 %15 
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %75 = OpConstant 1 
                                      %76 = OpTypeArray %6 %75 
                                      %77 = OpTypeStruct %7 %6 %76 
                                      %78 = OpTypePointer Output %77 
 Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
                                      %81 = OpTypePointer Output %7 
               Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                         Input f32_4* %84 = OpVariable Input 
                                      %86 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %43 = OpLoad %9 
                       Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                f32_4 %46 = OpLoad %45 
                                f32_4 %47 = OpFAdd %43 %46 
                                              OpStore %9 %47 
                                f32_4 %49 = OpLoad %9 
                                f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFMul %50 %52 
                                              OpStore %48 %53 
                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %48 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %48 %60 
                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                f32_4 %62 = OpLoad %61 
                                f32_4 %63 = OpLoad %9 
                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                f32_4 %65 = OpFMul %62 %64 
                                f32_4 %66 = OpLoad %48 
                                f32_4 %67 = OpFAdd %65 %66 
                                              OpStore %48 %67 
                       Uniform f32_4* %68 = OpAccessChain %20 %23 %44 
                                f32_4 %69 = OpLoad %68 
                                f32_4 %70 = OpLoad %9 
                                f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                f32_4 %72 = OpFMul %69 %71 
                                f32_4 %73 = OpLoad %48 
                                f32_4 %74 = OpFAdd %72 %73 
                                              OpStore %9 %74 
                                f32_4 %80 = OpLoad %9 
                        Output f32_4* %82 = OpAccessChain %79 %22 
                                              OpStore %82 %80 
                                f32_4 %85 = OpLoad %84 
                                              OpStore vs_TEXCOORD0 %85 
                          Output f32* %87 = OpAccessChain %79 %22 %75 
                                  f32 %88 = OpLoad %87 
                                  f32 %89 = OpFNegate %88 
                          Output f32* %90 = OpAccessChain %79 %22 %75 
                                              OpStore %90 %89 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 38
; Schema: 0
                                               OpCapability Shader 
                                        %1 = OpExtInstImport "GLSL.std.450" 
                                               OpMemoryModel Logical GLSL450 
                                               OpEntryPoint Fragment %4 "main" %21 %35 
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
                                               OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                               OpDecorate vs_TEXCOORD0 Location 21 
                                               OpDecorate %23 RelaxedPrecision 
                                               OpDecorate %24 RelaxedPrecision 
                                               OpMemberDecorate %25 0 RelaxedPrecision 
                                               OpMemberDecorate %25 0 Offset 25 
                                               OpDecorate %25 Block 
                                               OpDecorate %27 DescriptorSet 27 
                                               OpDecorate %27 Binding 27 
                                               OpDecorate %32 RelaxedPrecision 
                                               OpDecorate %33 RelaxedPrecision 
                                               OpDecorate %35 RelaxedPrecision 
                                               OpDecorate %35 Location 35 
                                               OpDecorate %36 RelaxedPrecision 
                                        %2 = OpTypeVoid 
                                        %3 = OpTypeFunction %2 
                                        %6 = OpTypeFloat 32 
                                        %7 = OpTypeVector %6 4 
                                        %8 = OpTypePointer Private %7 
                         Private f32_4* %9 = OpVariable Private 
                                       %10 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                       %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only TextureCube* %12 = OpVariable UniformConstant 
                                       %14 = OpTypeSampler 
                                       %15 = OpTypePointer UniformConstant %14 
              UniformConstant sampler* %16 = OpVariable UniformConstant 
                                       %18 = OpTypeSampledImage %10 
                                       %20 = OpTypePointer Input %7 
                 Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                       %22 = OpTypeVector %6 3 
                                       %25 = OpTypeStruct %6 
                                       %26 = OpTypePointer Uniform %25 
                Uniform struct {f32;}* %27 = OpVariable Uniform 
                                       %28 = OpTypeInt 32 1 
                                   i32 %29 = OpConstant 0 
                                       %30 = OpTypePointer Uniform %6 
                                       %34 = OpTypePointer Output %7 
                         Output f32_4* %35 = OpVariable Output 
                                   void %4 = OpFunction None %3 
                                        %5 = OpLabel 
                 read_only TextureCube %13 = OpLoad %12 
                               sampler %17 = OpLoad %16 
          read_only TextureCubeSampled %19 = OpSampledImage %13 %17 
                                 f32_4 %23 = OpLoad vs_TEXCOORD0 
                                 f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                          Uniform f32* %31 = OpAccessChain %27 %29 
                                   f32 %32 = OpLoad %31 
                                 f32_4 %33 = OpImageSampleExplicitLod %19 %24 Lod %7 
                                               OpStore %9 %33 
                                 f32_4 %36 = OpLoad %9 
                                               OpStore %35 %36 
                                               OpReturn
                                               OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 92
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %79 %83 %84 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %77 0 BuiltIn 77 
                                              OpMemberDecorate %77 1 BuiltIn 77 
                                              OpMemberDecorate %77 2 BuiltIn 77 
                                              OpDecorate %77 Block 
                                              OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD0 Location 83 
                                              OpDecorate %84 Location 84 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypePointer Input %7 
                         Input f32_4* %11 = OpVariable Input 
                                      %14 = OpTypeInt 32 0 
                                  u32 %15 = OpConstant 4 
                                      %16 = OpTypeArray %7 %15 
                                      %17 = OpTypeArray %7 %15 
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %75 = OpConstant 1 
                                      %76 = OpTypeArray %6 %75 
                                      %77 = OpTypeStruct %7 %6 %76 
                                      %78 = OpTypePointer Output %77 
 Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
                                      %81 = OpTypePointer Output %7 
               Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                         Input f32_4* %84 = OpVariable Input 
                                      %86 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %43 = OpLoad %9 
                       Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                f32_4 %46 = OpLoad %45 
                                f32_4 %47 = OpFAdd %43 %46 
                                              OpStore %9 %47 
                                f32_4 %49 = OpLoad %9 
                                f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFMul %50 %52 
                                              OpStore %48 %53 
                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %48 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %48 %60 
                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                f32_4 %62 = OpLoad %61 
                                f32_4 %63 = OpLoad %9 
                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                f32_4 %65 = OpFMul %62 %64 
                                f32_4 %66 = OpLoad %48 
                                f32_4 %67 = OpFAdd %65 %66 
                                              OpStore %48 %67 
                       Uniform f32_4* %68 = OpAccessChain %20 %23 %44 
                                f32_4 %69 = OpLoad %68 
                                f32_4 %70 = OpLoad %9 
                                f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                f32_4 %72 = OpFMul %69 %71 
                                f32_4 %73 = OpLoad %48 
                                f32_4 %74 = OpFAdd %72 %73 
                                              OpStore %9 %74 
                                f32_4 %80 = OpLoad %9 
                        Output f32_4* %82 = OpAccessChain %79 %22 
                                              OpStore %82 %80 
                                f32_4 %85 = OpLoad %84 
                                              OpStore vs_TEXCOORD0 %85 
                          Output f32* %87 = OpAccessChain %79 %22 %75 
                                  f32 %88 = OpLoad %87 
                                  f32 %89 = OpFNegate %88 
                          Output f32* %90 = OpAccessChain %79 %22 %75 
                                              OpStore %90 %89 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 38
; Schema: 0
                                               OpCapability Shader 
                                        %1 = OpExtInstImport "GLSL.std.450" 
                                               OpMemoryModel Logical GLSL450 
                                               OpEntryPoint Fragment %4 "main" %21 %35 
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
                                               OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                               OpDecorate vs_TEXCOORD0 Location 21 
                                               OpDecorate %23 RelaxedPrecision 
                                               OpDecorate %24 RelaxedPrecision 
                                               OpMemberDecorate %25 0 RelaxedPrecision 
                                               OpMemberDecorate %25 0 Offset 25 
                                               OpDecorate %25 Block 
                                               OpDecorate %27 DescriptorSet 27 
                                               OpDecorate %27 Binding 27 
                                               OpDecorate %32 RelaxedPrecision 
                                               OpDecorate %33 RelaxedPrecision 
                                               OpDecorate %35 RelaxedPrecision 
                                               OpDecorate %35 Location 35 
                                               OpDecorate %36 RelaxedPrecision 
                                        %2 = OpTypeVoid 
                                        %3 = OpTypeFunction %2 
                                        %6 = OpTypeFloat 32 
                                        %7 = OpTypeVector %6 4 
                                        %8 = OpTypePointer Private %7 
                         Private f32_4* %9 = OpVariable Private 
                                       %10 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                       %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only TextureCube* %12 = OpVariable UniformConstant 
                                       %14 = OpTypeSampler 
                                       %15 = OpTypePointer UniformConstant %14 
              UniformConstant sampler* %16 = OpVariable UniformConstant 
                                       %18 = OpTypeSampledImage %10 
                                       %20 = OpTypePointer Input %7 
                 Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                       %22 = OpTypeVector %6 3 
                                       %25 = OpTypeStruct %6 
                                       %26 = OpTypePointer Uniform %25 
                Uniform struct {f32;}* %27 = OpVariable Uniform 
                                       %28 = OpTypeInt 32 1 
                                   i32 %29 = OpConstant 0 
                                       %30 = OpTypePointer Uniform %6 
                                       %34 = OpTypePointer Output %7 
                         Output f32_4* %35 = OpVariable Output 
                                   void %4 = OpFunction None %3 
                                        %5 = OpLabel 
                 read_only TextureCube %13 = OpLoad %12 
                               sampler %17 = OpLoad %16 
          read_only TextureCubeSampled %19 = OpSampledImage %13 %17 
                                 f32_4 %23 = OpLoad vs_TEXCOORD0 
                                 f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                          Uniform f32* %31 = OpAccessChain %27 %29 
                                   f32 %32 = OpLoad %31 
                                 f32_4 %33 = OpImageSampleExplicitLod %19 %24 Lod %7 
                                               OpStore %9 %33 
                                 f32_4 %36 = OpLoad %9 
                                               OpStore %35 %36 
                                               OpReturn
                                               OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 92
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %79 %83 %84 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %77 0 BuiltIn 77 
                                              OpMemberDecorate %77 1 BuiltIn 77 
                                              OpMemberDecorate %77 2 BuiltIn 77 
                                              OpDecorate %77 Block 
                                              OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD0 Location 83 
                                              OpDecorate %84 Location 84 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypePointer Input %7 
                         Input f32_4* %11 = OpVariable Input 
                                      %14 = OpTypeInt 32 0 
                                  u32 %15 = OpConstant 4 
                                      %16 = OpTypeArray %7 %15 
                                      %17 = OpTypeArray %7 %15 
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %75 = OpConstant 1 
                                      %76 = OpTypeArray %6 %75 
                                      %77 = OpTypeStruct %7 %6 %76 
                                      %78 = OpTypePointer Output %77 
 Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
                                      %81 = OpTypePointer Output %7 
               Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                         Input f32_4* %84 = OpVariable Input 
                                      %86 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %43 = OpLoad %9 
                       Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                f32_4 %46 = OpLoad %45 
                                f32_4 %47 = OpFAdd %43 %46 
                                              OpStore %9 %47 
                                f32_4 %49 = OpLoad %9 
                                f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFMul %50 %52 
                                              OpStore %48 %53 
                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %48 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %48 %60 
                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                f32_4 %62 = OpLoad %61 
                                f32_4 %63 = OpLoad %9 
                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                f32_4 %65 = OpFMul %62 %64 
                                f32_4 %66 = OpLoad %48 
                                f32_4 %67 = OpFAdd %65 %66 
                                              OpStore %48 %67 
                       Uniform f32_4* %68 = OpAccessChain %20 %23 %44 
                                f32_4 %69 = OpLoad %68 
                                f32_4 %70 = OpLoad %9 
                                f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                f32_4 %72 = OpFMul %69 %71 
                                f32_4 %73 = OpLoad %48 
                                f32_4 %74 = OpFAdd %72 %73 
                                              OpStore %9 %74 
                                f32_4 %80 = OpLoad %9 
                        Output f32_4* %82 = OpAccessChain %79 %22 
                                              OpStore %82 %80 
                                f32_4 %85 = OpLoad %84 
                                              OpStore vs_TEXCOORD0 %85 
                          Output f32* %87 = OpAccessChain %79 %22 %75 
                                  f32 %88 = OpLoad %87 
                                  f32 %89 = OpFNegate %88 
                          Output f32* %90 = OpAccessChain %79 %22 %75 
                                              OpStore %90 %89 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 38
; Schema: 0
                                               OpCapability Shader 
                                        %1 = OpExtInstImport "GLSL.std.450" 
                                               OpMemoryModel Logical GLSL450 
                                               OpEntryPoint Fragment %4 "main" %21 %35 
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
                                               OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                               OpDecorate vs_TEXCOORD0 Location 21 
                                               OpDecorate %23 RelaxedPrecision 
                                               OpDecorate %24 RelaxedPrecision 
                                               OpMemberDecorate %25 0 RelaxedPrecision 
                                               OpMemberDecorate %25 0 Offset 25 
                                               OpDecorate %25 Block 
                                               OpDecorate %27 DescriptorSet 27 
                                               OpDecorate %27 Binding 27 
                                               OpDecorate %32 RelaxedPrecision 
                                               OpDecorate %33 RelaxedPrecision 
                                               OpDecorate %35 RelaxedPrecision 
                                               OpDecorate %35 Location 35 
                                               OpDecorate %36 RelaxedPrecision 
                                        %2 = OpTypeVoid 
                                        %3 = OpTypeFunction %2 
                                        %6 = OpTypeFloat 32 
                                        %7 = OpTypeVector %6 4 
                                        %8 = OpTypePointer Private %7 
                         Private f32_4* %9 = OpVariable Private 
                                       %10 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                       %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only TextureCube* %12 = OpVariable UniformConstant 
                                       %14 = OpTypeSampler 
                                       %15 = OpTypePointer UniformConstant %14 
              UniformConstant sampler* %16 = OpVariable UniformConstant 
                                       %18 = OpTypeSampledImage %10 
                                       %20 = OpTypePointer Input %7 
                 Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                       %22 = OpTypeVector %6 3 
                                       %25 = OpTypeStruct %6 
                                       %26 = OpTypePointer Uniform %25 
                Uniform struct {f32;}* %27 = OpVariable Uniform 
                                       %28 = OpTypeInt 32 1 
                                   i32 %29 = OpConstant 0 
                                       %30 = OpTypePointer Uniform %6 
                                       %34 = OpTypePointer Output %7 
                         Output f32_4* %35 = OpVariable Output 
                                   void %4 = OpFunction None %3 
                                        %5 = OpLabel 
                 read_only TextureCube %13 = OpLoad %12 
                               sampler %17 = OpLoad %16 
          read_only TextureCubeSampled %19 = OpSampledImage %13 %17 
                                 f32_4 %23 = OpLoad vs_TEXCOORD0 
                                 f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                          Uniform f32* %31 = OpAccessChain %27 %29 
                                   f32 %32 = OpLoad %31 
                                 f32_4 %33 = OpImageSampleExplicitLod %19 %24 Lod %7 
                                               OpStore %9 %33 
                                 f32_4 %36 = OpLoad %9 
                                               OpStore %35 %36 
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
}
}