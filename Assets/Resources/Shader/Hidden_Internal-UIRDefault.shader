//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-UIRDefault" {
Properties {
_MainTex ("Atlas", 2D) = "white" { }
_FontTex ("Font", 2D) = "black" { }
_CustomTex ("Custom", 2D) = "black" { }
_Color ("Tint", Color) = (1,1,1,1)
_StencilCompFront ("__scf", Float) = 3
_StencilPassFront ("__spf", Float) = 0
_StencilZFailFront ("__szf", Float) = 1
_StencilFailFront ("__sff", Float) = 0
_StencilCompBack ("__scb", Float) = 8
_StencilPassBack ("__spb", Float) = 0
_StencilZFailBack ("__szb", Float) = 2
_StencilFailBack ("__sfb", Float) = 0
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" "UIE_ComputeIsAvailable" = "1" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" "UIE_ComputeIsAvailable" = "1" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZTest GEqual
  ZWrite Off
  Cull Off
  Stencil {
   Ref 255
   CompFront Disabled
   PassFront Keep
   FailFront Keep
   ZFailFront Keep
   CompBack Disabled
   PassBack Keep
   FailBack Keep
   ZFailBack Keep
  }
  GpuProgramID 13759
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 310 es

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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _Color;
uniform 	vec4 _1PixelClipInvView;
 struct _TransformsBuffer_type {
	uint[16] value;
};

layout(std430, binding = 0) readonly buffer _TransformsBuffer {
	_TransformsBuffer_type _TransformsBuffer_buf[];
};
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_TEXCOORD1;
layout(location = 0) out mediump vec4 vs_COLOR0;
layout(location = 1) out highp vec4 vs_TEXCOORD0;
layout(location = 2) flat out mediump vec4 vs_TEXCOORD1;
layout(location = 3) flat out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
int u_xlati0;
uvec2 u_xlatu0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
ivec4 u_xlati2;
vec4 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
vec2 u_xlat8;
vec2 u_xlat9;
void main()
{
    u_xlatu0.xy = uvec2(in_TEXCOORD1.xy);
    u_xlat1 = vec4(uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.x].value[(0 >> 2) + 0]), uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.x].value[(0 >> 2) + 1]), uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.x].value[(0 >> 2) + 2]), uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.x].value[(0 >> 2) + 3]));
    u_xlat8.x = dot(u_xlat1.xy, in_TEXCOORD0.xy);
    u_xlat9.x = dot(u_xlat1, in_POSITION0);
    u_xlat2 = vec4(uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.x].value[(16 >> 2) + 0]), uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.x].value[(16 >> 2) + 1]), uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.x].value[(16 >> 2) + 2]), uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.x].value[(16 >> 2) + 3]));
    u_xlat8.y = dot(u_xlat2.xy, in_TEXCOORD0.xy);
    u_xlat9.y = dot(u_xlat2, in_POSITION0);
    u_xlat1.xy = u_xlat8.xy * _1PixelClipInvView.zw;
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat5 = max(u_xlat1.x, 1.0);
    u_xlat1.x = u_xlat1.x + 9.99999997e-07;
    u_xlat5 = roundEven(u_xlat5);
    u_xlat1.x = u_xlat5 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x + -1.0;
    u_xlat8.xy = u_xlat8.xy * u_xlat1.xx;
    u_xlati2 = ivec4(uvec4(equal(in_TEXCOORD1.zzzz, vec4(4.0, 3.0, 2.0, 1.0))) * 0xFFFFFFFFu);
    u_xlat8.xy = uintBitsToFloat(floatBitsToUint(u_xlat8.xy) & uvec2(u_xlati2.xx));
    u_xlat8.xy = u_xlat8.xy + u_xlat9.xy;
    u_xlat1 = u_xlat8.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat8.xxxx + u_xlat1;
    vs_TEXCOORD0.zw = u_xlat8.xy;
    u_xlat3 = vec4(uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.x].value[(32 >> 2) + 0]), uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.x].value[(32 >> 2) + 1]), uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.x].value[(32 >> 2) + 2]), uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.x].value[(32 >> 2) + 3]));
    u_xlat0 = vec4(uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.y].value[(48 >> 2) + 0]), uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.y].value[(48 >> 2) + 1]), uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.y].value[(48 >> 2) + 2]), uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.y].value[(48 >> 2) + 3]));
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.x = dot(u_xlat3, in_POSITION0);
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.xy = u_xlat0.xy + vec2(1.0, 1.0);
    u_xlat1.xy = u_xlat1.xy / _1PixelClipInvView.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.50999999, 0.50999999);
    u_xlat1.xy = trunc(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy * _1PixelClipInvView.xy + vec2(-1.0, -1.0);
    gl_Position.xy = (u_xlati2.w != 0) ? u_xlat1.xy : u_xlat0.xy;
    gl_Position.zw = u_xlat0.zw;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlatb0 = u_xlati2.y==0;
    u_xlati0 = u_xlatb0 ? u_xlati2.z : int(0);
    u_xlat1.xyz = uintBitsToFloat(uvec3(u_xlati2.wzy) & uvec3(1065353216u, 1065353216u, 1065353216u));
    u_xlat4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.xy = u_xlat4.xy * _MainTex_TexelSize.xy;
    vs_TEXCOORD0.xy = (int(u_xlati0) != 0) ? u_xlat2.xy : u_xlat4.xy;
    u_xlat0.x = u_xlat1.y + u_xlat1.x;
    u_xlat0.x = u_xlat1.z + u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat1.w = (-u_xlat0.x) + 1.0;
    vs_TEXCOORD1 = u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 310 es

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
uniform 	vec4 _PixelClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FontTex;
UNITY_LOCATION(2) uniform mediump sampler2D _CustomTex;
layout(location = 0) in mediump vec4 vs_COLOR0;
layout(location = 1) in highp vec4 vs_TEXCOORD0;
layout(location = 2) flat in mediump vec4 vs_TEXCOORD1;
layout(location = 3) flat in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec4 u_xlatb0;
mediump vec4 u_xlat16_1;
vec2 u_xlat4;
bvec2 u_xlatb4;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD0.zwzz, vs_TEXCOORD2.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(vs_TEXCOORD2.zzzw, vs_TEXCOORD0.zzzw).zw;
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlat0.xy = u_xlat0.zw + u_xlat0.xy;
    u_xlatb4.xy = greaterThanEqual(hlslcc_FragCoord.xyxy, _PixelClipRect.xyxy).xy;
    u_xlat4.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb4.xy));
    u_xlat0.xy = u_xlat4.xy + u_xlat0.xy;
    u_xlatb4.xy = greaterThanEqual(_PixelClipRect.zwzw, hlslcc_FragCoord.xyxy).xy;
    u_xlat4.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb4.xy));
    u_xlat0.xy = u_xlat4.xy + u_xlat0.xy;
    u_xlat0.z = 1.0;
    u_xlat0.x = dot(u_xlat0.xyz, vec3(1.0, 1.0, -7.94999981));
    u_xlatb0.x = u_xlat0.x<0.0;
    if(((int(u_xlatb0.x) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_0.x = texture(_FontTex, vs_TEXCOORD0.xy).w;
    u_xlat16_0.w = u_xlat16_0.x * vs_TEXCOORD1.x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat16_1 * vs_TEXCOORD1.yyyy + vs_TEXCOORD1.wwww;
    u_xlat16_0.xyz = vs_TEXCOORD1.xxx;
    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
    u_xlat16_1 = texture(_CustomTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_1 * vs_TEXCOORD1.zzzz + u_xlat16_0;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 310 es

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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _Color;
uniform 	vec4 _1PixelClipInvView;
 struct _TransformsBuffer_type {
	uint[16] value;
};

layout(std430, binding = 0) readonly buffer _TransformsBuffer {
	_TransformsBuffer_type _TransformsBuffer_buf[];
};
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_TEXCOORD1;
layout(location = 0) out mediump vec4 vs_COLOR0;
layout(location = 1) out highp vec4 vs_TEXCOORD0;
layout(location = 2) flat out mediump vec4 vs_TEXCOORD1;
layout(location = 3) flat out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
int u_xlati0;
uvec2 u_xlatu0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
ivec4 u_xlati2;
vec4 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
vec2 u_xlat8;
vec2 u_xlat9;
void main()
{
    u_xlatu0.xy = uvec2(in_TEXCOORD1.xy);
    u_xlat1 = vec4(uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.x].value[(0 >> 2) + 0]), uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.x].value[(0 >> 2) + 1]), uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.x].value[(0 >> 2) + 2]), uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.x].value[(0 >> 2) + 3]));
    u_xlat8.x = dot(u_xlat1.xy, in_TEXCOORD0.xy);
    u_xlat9.x = dot(u_xlat1, in_POSITION0);
    u_xlat2 = vec4(uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.x].value[(16 >> 2) + 0]), uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.x].value[(16 >> 2) + 1]), uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.x].value[(16 >> 2) + 2]), uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.x].value[(16 >> 2) + 3]));
    u_xlat8.y = dot(u_xlat2.xy, in_TEXCOORD0.xy);
    u_xlat9.y = dot(u_xlat2, in_POSITION0);
    u_xlat1.xy = u_xlat8.xy * _1PixelClipInvView.zw;
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat5 = max(u_xlat1.x, 1.0);
    u_xlat1.x = u_xlat1.x + 9.99999997e-07;
    u_xlat5 = roundEven(u_xlat5);
    u_xlat1.x = u_xlat5 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x + -1.0;
    u_xlat8.xy = u_xlat8.xy * u_xlat1.xx;
    u_xlati2 = ivec4(uvec4(equal(in_TEXCOORD1.zzzz, vec4(4.0, 3.0, 2.0, 1.0))) * 0xFFFFFFFFu);
    u_xlat8.xy = uintBitsToFloat(floatBitsToUint(u_xlat8.xy) & uvec2(u_xlati2.xx));
    u_xlat8.xy = u_xlat8.xy + u_xlat9.xy;
    u_xlat1 = u_xlat8.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat8.xxxx + u_xlat1;
    vs_TEXCOORD0.zw = u_xlat8.xy;
    u_xlat3 = vec4(uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.x].value[(32 >> 2) + 0]), uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.x].value[(32 >> 2) + 1]), uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.x].value[(32 >> 2) + 2]), uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.x].value[(32 >> 2) + 3]));
    u_xlat0 = vec4(uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.y].value[(48 >> 2) + 0]), uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.y].value[(48 >> 2) + 1]), uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.y].value[(48 >> 2) + 2]), uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.y].value[(48 >> 2) + 3]));
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.x = dot(u_xlat3, in_POSITION0);
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.xy = u_xlat0.xy + vec2(1.0, 1.0);
    u_xlat1.xy = u_xlat1.xy / _1PixelClipInvView.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.50999999, 0.50999999);
    u_xlat1.xy = trunc(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy * _1PixelClipInvView.xy + vec2(-1.0, -1.0);
    gl_Position.xy = (u_xlati2.w != 0) ? u_xlat1.xy : u_xlat0.xy;
    gl_Position.zw = u_xlat0.zw;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlatb0 = u_xlati2.y==0;
    u_xlati0 = u_xlatb0 ? u_xlati2.z : int(0);
    u_xlat1.xyz = uintBitsToFloat(uvec3(u_xlati2.wzy) & uvec3(1065353216u, 1065353216u, 1065353216u));
    u_xlat4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.xy = u_xlat4.xy * _MainTex_TexelSize.xy;
    vs_TEXCOORD0.xy = (int(u_xlati0) != 0) ? u_xlat2.xy : u_xlat4.xy;
    u_xlat0.x = u_xlat1.y + u_xlat1.x;
    u_xlat0.x = u_xlat1.z + u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat1.w = (-u_xlat0.x) + 1.0;
    vs_TEXCOORD1 = u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 310 es

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
uniform 	vec4 _PixelClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FontTex;
UNITY_LOCATION(2) uniform mediump sampler2D _CustomTex;
layout(location = 0) in mediump vec4 vs_COLOR0;
layout(location = 1) in highp vec4 vs_TEXCOORD0;
layout(location = 2) flat in mediump vec4 vs_TEXCOORD1;
layout(location = 3) flat in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec4 u_xlatb0;
mediump vec4 u_xlat16_1;
vec2 u_xlat4;
bvec2 u_xlatb4;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD0.zwzz, vs_TEXCOORD2.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(vs_TEXCOORD2.zzzw, vs_TEXCOORD0.zzzw).zw;
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlat0.xy = u_xlat0.zw + u_xlat0.xy;
    u_xlatb4.xy = greaterThanEqual(hlslcc_FragCoord.xyxy, _PixelClipRect.xyxy).xy;
    u_xlat4.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb4.xy));
    u_xlat0.xy = u_xlat4.xy + u_xlat0.xy;
    u_xlatb4.xy = greaterThanEqual(_PixelClipRect.zwzw, hlslcc_FragCoord.xyxy).xy;
    u_xlat4.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb4.xy));
    u_xlat0.xy = u_xlat4.xy + u_xlat0.xy;
    u_xlat0.z = 1.0;
    u_xlat0.x = dot(u_xlat0.xyz, vec3(1.0, 1.0, -7.94999981));
    u_xlatb0.x = u_xlat0.x<0.0;
    if(((int(u_xlatb0.x) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_0.x = texture(_FontTex, vs_TEXCOORD0.xy).w;
    u_xlat16_0.w = u_xlat16_0.x * vs_TEXCOORD1.x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat16_1 * vs_TEXCOORD1.yyyy + vs_TEXCOORD1.wwww;
    u_xlat16_0.xyz = vs_TEXCOORD1.xxx;
    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
    u_xlat16_1 = texture(_CustomTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_1 * vs_TEXCOORD1.zzzz + u_xlat16_0;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 310 es

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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _Color;
uniform 	vec4 _1PixelClipInvView;
 struct _TransformsBuffer_type {
	uint[16] value;
};

layout(std430, binding = 0) readonly buffer _TransformsBuffer {
	_TransformsBuffer_type _TransformsBuffer_buf[];
};
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_TEXCOORD1;
layout(location = 0) out mediump vec4 vs_COLOR0;
layout(location = 1) out highp vec4 vs_TEXCOORD0;
layout(location = 2) flat out mediump vec4 vs_TEXCOORD1;
layout(location = 3) flat out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
int u_xlati0;
uvec2 u_xlatu0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
ivec4 u_xlati2;
vec4 u_xlat3;
vec2 u_xlat4;
float u_xlat5;
vec2 u_xlat8;
vec2 u_xlat9;
void main()
{
    u_xlatu0.xy = uvec2(in_TEXCOORD1.xy);
    u_xlat1 = vec4(uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.x].value[(0 >> 2) + 0]), uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.x].value[(0 >> 2) + 1]), uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.x].value[(0 >> 2) + 2]), uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.x].value[(0 >> 2) + 3]));
    u_xlat8.x = dot(u_xlat1.xy, in_TEXCOORD0.xy);
    u_xlat9.x = dot(u_xlat1, in_POSITION0);
    u_xlat2 = vec4(uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.x].value[(16 >> 2) + 0]), uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.x].value[(16 >> 2) + 1]), uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.x].value[(16 >> 2) + 2]), uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.x].value[(16 >> 2) + 3]));
    u_xlat8.y = dot(u_xlat2.xy, in_TEXCOORD0.xy);
    u_xlat9.y = dot(u_xlat2, in_POSITION0);
    u_xlat1.xy = u_xlat8.xy * _1PixelClipInvView.zw;
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat5 = max(u_xlat1.x, 1.0);
    u_xlat1.x = u_xlat1.x + 9.99999997e-07;
    u_xlat5 = roundEven(u_xlat5);
    u_xlat1.x = u_xlat5 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x + -1.0;
    u_xlat8.xy = u_xlat8.xy * u_xlat1.xx;
    u_xlati2 = ivec4(uvec4(equal(in_TEXCOORD1.zzzz, vec4(4.0, 3.0, 2.0, 1.0))) * 0xFFFFFFFFu);
    u_xlat8.xy = uintBitsToFloat(floatBitsToUint(u_xlat8.xy) & uvec2(u_xlati2.xx));
    u_xlat8.xy = u_xlat8.xy + u_xlat9.xy;
    u_xlat1 = u_xlat8.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat8.xxxx + u_xlat1;
    vs_TEXCOORD0.zw = u_xlat8.xy;
    u_xlat3 = vec4(uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.x].value[(32 >> 2) + 0]), uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.x].value[(32 >> 2) + 1]), uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.x].value[(32 >> 2) + 2]), uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.x].value[(32 >> 2) + 3]));
    u_xlat0 = vec4(uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.y].value[(48 >> 2) + 0]), uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.y].value[(48 >> 2) + 1]), uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.y].value[(48 >> 2) + 2]), uintBitsToFloat(_TransformsBuffer_buf[u_xlatu0.y].value[(48 >> 2) + 3]));
    vs_TEXCOORD2 = u_xlat0;
    u_xlat0.x = dot(u_xlat3, in_POSITION0);
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.xy = u_xlat0.xy + vec2(1.0, 1.0);
    u_xlat1.xy = u_xlat1.xy / _1PixelClipInvView.xy;
    u_xlat1.xy = u_xlat1.xy + vec2(0.50999999, 0.50999999);
    u_xlat1.xy = trunc(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy * _1PixelClipInvView.xy + vec2(-1.0, -1.0);
    gl_Position.xy = (u_xlati2.w != 0) ? u_xlat1.xy : u_xlat0.xy;
    gl_Position.zw = u_xlat0.zw;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlatb0 = u_xlati2.y==0;
    u_xlati0 = u_xlatb0 ? u_xlati2.z : int(0);
    u_xlat1.xyz = uintBitsToFloat(uvec3(u_xlati2.wzy) & uvec3(1065353216u, 1065353216u, 1065353216u));
    u_xlat4.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.xy = u_xlat4.xy * _MainTex_TexelSize.xy;
    vs_TEXCOORD0.xy = (int(u_xlati0) != 0) ? u_xlat2.xy : u_xlat4.xy;
    u_xlat0.x = u_xlat1.y + u_xlat1.x;
    u_xlat0.x = u_xlat1.z + u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat1.w = (-u_xlat0.x) + 1.0;
    vs_TEXCOORD1 = u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 310 es

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
uniform 	vec4 _PixelClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FontTex;
UNITY_LOCATION(2) uniform mediump sampler2D _CustomTex;
layout(location = 0) in mediump vec4 vs_COLOR0;
layout(location = 1) in highp vec4 vs_TEXCOORD0;
layout(location = 2) flat in mediump vec4 vs_TEXCOORD1;
layout(location = 3) flat in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec4 u_xlatb0;
mediump vec4 u_xlat16_1;
vec2 u_xlat4;
bvec2 u_xlatb4;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD0.zwzz, vs_TEXCOORD2.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(vs_TEXCOORD2.zzzw, vs_TEXCOORD0.zzzw).zw;
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlat0.xy = u_xlat0.zw + u_xlat0.xy;
    u_xlatb4.xy = greaterThanEqual(hlslcc_FragCoord.xyxy, _PixelClipRect.xyxy).xy;
    u_xlat4.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb4.xy));
    u_xlat0.xy = u_xlat4.xy + u_xlat0.xy;
    u_xlatb4.xy = greaterThanEqual(_PixelClipRect.zwzw, hlslcc_FragCoord.xyxy).xy;
    u_xlat4.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb4.xy));
    u_xlat0.xy = u_xlat4.xy + u_xlat0.xy;
    u_xlat0.z = 1.0;
    u_xlat0.x = dot(u_xlat0.xyz, vec3(1.0, 1.0, -7.94999981));
    u_xlatb0.x = u_xlat0.x<0.0;
    if(((int(u_xlatb0.x) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_0.x = texture(_FontTex, vs_TEXCOORD0.xy).w;
    u_xlat16_0.w = u_xlat16_0.x * vs_TEXCOORD1.x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat16_1 * vs_TEXCOORD1.yyyy + vs_TEXCOORD1.wwww;
    u_xlat16_0.xyz = vs_TEXCOORD1.xxx;
    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
    u_xlat16_1 = texture(_CustomTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_1 * vs_TEXCOORD1.zzzz + u_xlat16_0;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 458
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %13 %62 %70 %204 %260 %342 %366 %371 %450 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate %13 Location 13 
                                                      OpDecorate %22 ArrayStride 22 
                                                      OpMemberDecorate %23 0 Offset 23 
                                                      OpDecorate %24 ArrayStride 24 
                                                      OpMemberDecorate %25 0 NonWritable 
                                                      OpMemberDecorate %25 0 Offset 25 
                                                      OpDecorate %25 BufferBlock 
                                                      OpDecorate %27 DescriptorSet 27 
                                                      OpDecorate %27 Binding 27 
                                                      OpDecorate %62 Location 62 
                                                      OpDecorate %70 Location 70 
                                                      OpDecorate %112 ArrayStride 112 
                                                      OpDecorate %113 ArrayStride 113 
                                                      OpMemberDecorate %114 0 Offset 114 
                                                      OpMemberDecorate %114 1 Offset 114 
                                                      OpMemberDecorate %114 2 Offset 114 
                                                      OpMemberDecorate %114 3 Offset 114 
                                                      OpMemberDecorate %114 4 RelaxedPrecision 
                                                      OpMemberDecorate %114 4 Offset 114 
                                                      OpMemberDecorate %114 5 Offset 114 
                                                      OpDecorate %114 Block 
                                                      OpDecorate %116 DescriptorSet 116 
                                                      OpDecorate %116 Binding 116 
                                                      OpDecorate vs_TEXCOORD0 Location 204 
                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 Flat 
                                                      OpDecorate vs_TEXCOORD2 Location 260 
                                                      OpMemberDecorate %340 0 BuiltIn 340 
                                                      OpMemberDecorate %340 1 BuiltIn 340 
                                                      OpMemberDecorate %340 2 BuiltIn 340 
                                                      OpDecorate %340 Block 
                                                      OpDecorate %366 Location 366 
                                                      OpDecorate %369 RelaxedPrecision 
                                                      OpDecorate %371 RelaxedPrecision 
                                                      OpDecorate %371 Location 371 
                                                      OpDecorate vs_TEXCOORD1 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Flat 
                                                      OpDecorate vs_TEXCOORD1 Location 450 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeInt 32 0 
                                               %7 = OpTypeVector %6 2 
                                               %8 = OpTypePointer Private %7 
                                Private u32_2* %9 = OpVariable Private 
                                              %10 = OpTypeFloat 32 
                                              %11 = OpTypeVector %10 3 
                                              %12 = OpTypePointer Input %11 
                                 Input f32_3* %13 = OpVariable Input 
                                              %14 = OpTypeVector %10 2 
                                              %18 = OpTypeVector %10 4 
                                              %19 = OpTypePointer Private %18 
                               Private f32_4* %20 = OpVariable Private 
                                          u32 %21 = OpConstant 16 
                                              %22 = OpTypeArray %6 %21 
                                              %23 = OpTypeStruct %22 
                                              %24 = OpTypeRuntimeArray %23 
                                              %25 = OpTypeStruct %24 
                                              %26 = OpTypePointer Uniform %25 
                          Uniform struct {;}* %27 = OpVariable Uniform 
                                              %28 = OpTypeInt 32 1 
                                          i32 %29 = OpConstant 0 
                                          u32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Private %6 
                                              %34 = OpTypePointer Uniform %6 
                                          i32 %40 = OpConstant 1 
                                          i32 %46 = OpConstant 2 
                                          i32 %52 = OpConstant 3 
                                              %57 = OpTypePointer Private %14 
                               Private f32_2* %58 = OpVariable Private 
                                              %61 = OpTypePointer Input %14 
                                 Input f32_2* %62 = OpVariable Input 
                                              %65 = OpTypePointer Private %10 
                               Private f32_2* %67 = OpVariable Private 
                                              %69 = OpTypePointer Input %18 
                                 Input f32_4* %70 = OpVariable Input 
                               Private f32_4* %74 = OpVariable Private 
                                          i32 %77 = OpConstant 4 
                                          i32 %83 = OpConstant 5 
                                          i32 %89 = OpConstant 6 
                                          i32 %95 = OpConstant 7 
                                         u32 %104 = OpConstant 1 
                                         u32 %111 = OpConstant 4 
                                             %112 = OpTypeArray %18 %111 
                                             %113 = OpTypeArray %18 %111 
                                             %114 = OpTypeStruct %112 %113 %18 %18 %18 %18 
                                             %115 = OpTypePointer Uniform %114 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32_4;}* %116 = OpVariable Uniform 
                                             %117 = OpTypePointer Uniform %18 
                                Private f32* %134 = OpVariable Private 
                                         f32 %137 = OpConstant 3.674022E-40 
                                         f32 %141 = OpConstant 3.674022E-40 
                                         f32 %153 = OpConstant 3.674022E-40 
                                             %160 = OpTypeVector %28 4 
                                             %161 = OpTypePointer Private %160 
                              Private i32_4* %162 = OpVariable Private 
                                         f32 %165 = OpConstant 3.674022E-40 
                                         f32 %166 = OpConstant 3.674022E-40 
                                         f32 %167 = OpConstant 3.674022E-40 
                                       f32_4 %168 = OpConstantComposite %165 %166 %167 %137 
                                             %169 = OpTypeBool 
                                             %170 = OpTypeVector %169 4 
                                             %172 = OpTypeVector %6 4 
                                       u32_4 %173 = OpConstantComposite %30 %30 %30 %30 
                                       u32_4 %174 = OpConstantComposite %104 %104 %104 %104 
                                         u32 %176 = OpConstant 4294967295 
                                             %182 = OpTypeVector %28 2 
                                             %203 = OpTypePointer Output %18 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                              Private f32_4* %208 = OpVariable Private 
                                         i32 %211 = OpConstant 8 
                                         i32 %217 = OpConstant 9 
                                         i32 %223 = OpConstant 10 
                                         i32 %229 = OpConstant 11 
                              Private f32_4* %234 = OpVariable Private 
                                         i32 %237 = OpConstant 12 
                                         i32 %243 = OpConstant 13 
                                         i32 %249 = OpConstant 14 
                                         i32 %255 = OpConstant 15 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                       f32_2 %305 = OpConstantComposite %137 %137 
                                         f32 %319 = OpConstant 3.674022E-40 
                                       f32_2 %320 = OpConstantComposite %319 %319 
                                       f32_2 %335 = OpConstantComposite %153 %153 
                                             %339 = OpTypeArray %10 %104 
                                             %340 = OpTypeStruct %18 %10 %339 
                                             %341 = OpTypePointer Output %340 
        Output struct {f32_4; f32; f32[1];}* %342 = OpVariable Output 
                                         u32 %343 = OpConstant 3 
                                             %344 = OpTypePointer Private %28 
                                             %348 = OpTypePointer Function %14 
                                Input f32_4* %366 = OpVariable Input 
                               Output f32_4* %371 = OpVariable Output 
                                             %373 = OpTypePointer Private %169 
                               Private bool* %374 = OpVariable Private 
                                Private i32* %378 = OpVariable Private 
                                             %380 = OpTypePointer Function %28 
                                         u32 %384 = OpConstant 2 
                                             %389 = OpTypeVector %28 3 
                                             %392 = OpTypeVector %6 3 
                                         u32 %394 = OpConstant 1065353216 
                                       u32_3 %395 = OpConstantComposite %394 %394 %394 
                              Private f32_2* %400 = OpVariable Private 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                             %452 = OpTypePointer Output %10 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_2* %349 = OpVariable Function 
                               Function i32* %381 = OpVariable Function 
                             Function f32_2* %419 = OpVariable Function 
                                        f32_3 %15 = OpLoad %13 
                                        f32_2 %16 = OpVectorShuffle %15 %15 0 1 
                                        u32_2 %17 = OpConvertFToU %16 
                                                      OpStore %9 %17 
                                 Private u32* %32 = OpAccessChain %9 %30 
                                          u32 %33 = OpLoad %32 
                                 Uniform u32* %35 = OpAccessChain %27 %29 %33 %29 %29 
                                          u32 %36 = OpLoad %35 
                                          f32 %37 = OpBitcast %36 
                                 Private u32* %38 = OpAccessChain %9 %30 
                                          u32 %39 = OpLoad %38 
                                 Uniform u32* %41 = OpAccessChain %27 %29 %39 %29 %40 
                                          u32 %42 = OpLoad %41 
                                          f32 %43 = OpBitcast %42 
                                 Private u32* %44 = OpAccessChain %9 %30 
                                          u32 %45 = OpLoad %44 
                                 Uniform u32* %47 = OpAccessChain %27 %29 %45 %29 %46 
                                          u32 %48 = OpLoad %47 
                                          f32 %49 = OpBitcast %48 
                                 Private u32* %50 = OpAccessChain %9 %30 
                                          u32 %51 = OpLoad %50 
                                 Uniform u32* %53 = OpAccessChain %27 %29 %51 %29 %52 
                                          u32 %54 = OpLoad %53 
                                          f32 %55 = OpBitcast %54 
                                        f32_4 %56 = OpCompositeConstruct %37 %43 %49 %55 
                                                      OpStore %20 %56 
                                        f32_4 %59 = OpLoad %20 
                                        f32_2 %60 = OpVectorShuffle %59 %59 0 1 
                                        f32_2 %63 = OpLoad %62 
                                          f32 %64 = OpDot %60 %63 
                                 Private f32* %66 = OpAccessChain %58 %30 
                                                      OpStore %66 %64 
                                        f32_4 %68 = OpLoad %20 
                                        f32_4 %71 = OpLoad %70 
                                          f32 %72 = OpDot %68 %71 
                                 Private f32* %73 = OpAccessChain %67 %30 
                                                      OpStore %73 %72 
                                 Private u32* %75 = OpAccessChain %9 %30 
                                          u32 %76 = OpLoad %75 
                                 Uniform u32* %78 = OpAccessChain %27 %29 %76 %29 %77 
                                          u32 %79 = OpLoad %78 
                                          f32 %80 = OpBitcast %79 
                                 Private u32* %81 = OpAccessChain %9 %30 
                                          u32 %82 = OpLoad %81 
                                 Uniform u32* %84 = OpAccessChain %27 %29 %82 %29 %83 
                                          u32 %85 = OpLoad %84 
                                          f32 %86 = OpBitcast %85 
                                 Private u32* %87 = OpAccessChain %9 %30 
                                          u32 %88 = OpLoad %87 
                                 Uniform u32* %90 = OpAccessChain %27 %29 %88 %29 %89 
                                          u32 %91 = OpLoad %90 
                                          f32 %92 = OpBitcast %91 
                                 Private u32* %93 = OpAccessChain %9 %30 
                                          u32 %94 = OpLoad %93 
                                 Uniform u32* %96 = OpAccessChain %27 %29 %94 %29 %95 
                                          u32 %97 = OpLoad %96 
                                          f32 %98 = OpBitcast %97 
                                        f32_4 %99 = OpCompositeConstruct %80 %86 %92 %98 
                                                      OpStore %74 %99 
                                       f32_4 %100 = OpLoad %74 
                                       f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                       f32_2 %102 = OpLoad %62 
                                         f32 %103 = OpDot %101 %102 
                                Private f32* %105 = OpAccessChain %58 %104 
                                                      OpStore %105 %103 
                                       f32_4 %106 = OpLoad %74 
                                       f32_4 %107 = OpLoad %70 
                                         f32 %108 = OpDot %106 %107 
                                Private f32* %109 = OpAccessChain %67 %104 
                                                      OpStore %109 %108 
                                       f32_2 %110 = OpLoad %58 
                              Uniform f32_4* %118 = OpAccessChain %116 %83 
                                       f32_4 %119 = OpLoad %118 
                                       f32_2 %120 = OpVectorShuffle %119 %119 2 3 
                                       f32_2 %121 = OpFMul %110 %120 
                                       f32_4 %122 = OpLoad %20 
                                       f32_4 %123 = OpVectorShuffle %122 %121 4 5 2 3 
                                                      OpStore %20 %123 
                                       f32_4 %124 = OpLoad %20 
                                       f32_2 %125 = OpVectorShuffle %124 %124 0 1 
                                       f32_4 %126 = OpLoad %20 
                                       f32_2 %127 = OpVectorShuffle %126 %126 0 1 
                                         f32 %128 = OpDot %125 %127 
                                Private f32* %129 = OpAccessChain %20 %30 
                                                      OpStore %129 %128 
                                Private f32* %130 = OpAccessChain %20 %30 
                                         f32 %131 = OpLoad %130 
                                         f32 %132 = OpExtInst %1 31 %131 
                                Private f32* %133 = OpAccessChain %20 %30 
                                                      OpStore %133 %132 
                                Private f32* %135 = OpAccessChain %20 %30 
                                         f32 %136 = OpLoad %135 
                                         f32 %138 = OpExtInst %1 40 %136 %137 
                                                      OpStore %134 %138 
                                Private f32* %139 = OpAccessChain %20 %30 
                                         f32 %140 = OpLoad %139 
                                         f32 %142 = OpFAdd %140 %141 
                                Private f32* %143 = OpAccessChain %20 %30 
                                                      OpStore %143 %142 
                                         f32 %144 = OpLoad %134 
                                         f32 %145 = OpExtInst %1 2 %144 
                                                      OpStore %134 %145 
                                         f32 %146 = OpLoad %134 
                                Private f32* %147 = OpAccessChain %20 %30 
                                         f32 %148 = OpLoad %147 
                                         f32 %149 = OpFDiv %146 %148 
                                Private f32* %150 = OpAccessChain %20 %30 
                                                      OpStore %150 %149 
                                Private f32* %151 = OpAccessChain %20 %30 
                                         f32 %152 = OpLoad %151 
                                         f32 %154 = OpFAdd %152 %153 
                                Private f32* %155 = OpAccessChain %20 %30 
                                                      OpStore %155 %154 
                                       f32_2 %156 = OpLoad %58 
                                       f32_4 %157 = OpLoad %20 
                                       f32_2 %158 = OpVectorShuffle %157 %157 0 0 
                                       f32_2 %159 = OpFMul %156 %158 
                                                      OpStore %58 %159 
                                       f32_3 %163 = OpLoad %13 
                                       f32_4 %164 = OpVectorShuffle %163 %163 2 2 2 2 
                                      bool_4 %171 = OpFOrdEqual %164 %168 
                                       u32_4 %175 = OpSelect %171 %174 %173 
                                       u32_4 %177 = OpCompositeConstruct %176 %176 %176 %176 
                                       u32_4 %178 = OpIMul %175 %177 
                                       i32_4 %179 = OpBitcast %178 
                                                      OpStore %162 %179 
                                       f32_2 %180 = OpLoad %58 
                                       u32_2 %181 = OpBitcast %180 
                                       i32_4 %183 = OpLoad %162 
                                       i32_2 %184 = OpVectorShuffle %183 %183 0 0 
                                       u32_2 %185 = OpBitcast %184 
                                       u32_2 %186 = OpBitwiseAnd %181 %185 
                                       f32_2 %187 = OpBitcast %186 
                                                      OpStore %58 %187 
                                       f32_2 %188 = OpLoad %58 
                                       f32_2 %189 = OpLoad %67 
                                       f32_2 %190 = OpFAdd %188 %189 
                                                      OpStore %58 %190 
                                       f32_2 %191 = OpLoad %58 
                                       f32_4 %192 = OpVectorShuffle %191 %191 1 1 1 1 
                              Uniform f32_4* %193 = OpAccessChain %116 %29 %40 
                                       f32_4 %194 = OpLoad %193 
                                       f32_4 %195 = OpFMul %192 %194 
                                                      OpStore %20 %195 
                              Uniform f32_4* %196 = OpAccessChain %116 %29 %29 
                                       f32_4 %197 = OpLoad %196 
                                       f32_2 %198 = OpLoad %58 
                                       f32_4 %199 = OpVectorShuffle %198 %198 0 0 0 0 
                                       f32_4 %200 = OpFMul %197 %199 
                                       f32_4 %201 = OpLoad %20 
                                       f32_4 %202 = OpFAdd %200 %201 
                                                      OpStore %20 %202 
                                       f32_2 %205 = OpLoad %58 
                                       f32_4 %206 = OpLoad vs_TEXCOORD0 
                                       f32_4 %207 = OpVectorShuffle %206 %205 0 1 4 5 
                                                      OpStore vs_TEXCOORD0 %207 
                                Private u32* %209 = OpAccessChain %9 %30 
                                         u32 %210 = OpLoad %209 
                                Uniform u32* %212 = OpAccessChain %27 %29 %210 %29 %211 
                                         u32 %213 = OpLoad %212 
                                         f32 %214 = OpBitcast %213 
                                Private u32* %215 = OpAccessChain %9 %30 
                                         u32 %216 = OpLoad %215 
                                Uniform u32* %218 = OpAccessChain %27 %29 %216 %29 %217 
                                         u32 %219 = OpLoad %218 
                                         f32 %220 = OpBitcast %219 
                                Private u32* %221 = OpAccessChain %9 %30 
                                         u32 %222 = OpLoad %221 
                                Uniform u32* %224 = OpAccessChain %27 %29 %222 %29 %223 
                                         u32 %225 = OpLoad %224 
                                         f32 %226 = OpBitcast %225 
                                Private u32* %227 = OpAccessChain %9 %30 
                                         u32 %228 = OpLoad %227 
                                Uniform u32* %230 = OpAccessChain %27 %29 %228 %29 %229 
                                         u32 %231 = OpLoad %230 
                                         f32 %232 = OpBitcast %231 
                                       f32_4 %233 = OpCompositeConstruct %214 %220 %226 %232 
                                                      OpStore %208 %233 
                                Private u32* %235 = OpAccessChain %9 %104 
                                         u32 %236 = OpLoad %235 
                                Uniform u32* %238 = OpAccessChain %27 %29 %236 %29 %237 
                                         u32 %239 = OpLoad %238 
                                         f32 %240 = OpBitcast %239 
                                Private u32* %241 = OpAccessChain %9 %104 
                                         u32 %242 = OpLoad %241 
                                Uniform u32* %244 = OpAccessChain %27 %29 %242 %29 %243 
                                         u32 %245 = OpLoad %244 
                                         f32 %246 = OpBitcast %245 
                                Private u32* %247 = OpAccessChain %9 %104 
                                         u32 %248 = OpLoad %247 
                                Uniform u32* %250 = OpAccessChain %27 %29 %248 %29 %249 
                                         u32 %251 = OpLoad %250 
                                         f32 %252 = OpBitcast %251 
                                Private u32* %253 = OpAccessChain %9 %104 
                                         u32 %254 = OpLoad %253 
                                Uniform u32* %256 = OpAccessChain %27 %29 %254 %29 %255 
                                         u32 %257 = OpLoad %256 
                                         f32 %258 = OpBitcast %257 
                                       f32_4 %259 = OpCompositeConstruct %240 %246 %252 %258 
                                                      OpStore %234 %259 
                                       f32_4 %261 = OpLoad %234 
                                                      OpStore vs_TEXCOORD2 %261 
                                       f32_4 %262 = OpLoad %208 
                                       f32_4 %263 = OpLoad %70 
                                         f32 %264 = OpDot %262 %263 
                                Private f32* %265 = OpAccessChain %234 %30 
                                                      OpStore %265 %264 
                              Uniform f32_4* %266 = OpAccessChain %116 %29 %46 
                                       f32_4 %267 = OpLoad %266 
                                       f32_4 %268 = OpLoad %234 
                                       f32_4 %269 = OpVectorShuffle %268 %268 0 0 0 0 
                                       f32_4 %270 = OpFMul %267 %269 
                                       f32_4 %271 = OpLoad %20 
                                       f32_4 %272 = OpFAdd %270 %271 
                                                      OpStore %234 %272 
                                       f32_4 %273 = OpLoad %234 
                              Uniform f32_4* %274 = OpAccessChain %116 %29 %52 
                                       f32_4 %275 = OpLoad %274 
                                       f32_4 %276 = OpFAdd %273 %275 
                                                      OpStore %234 %276 
                                       f32_4 %277 = OpLoad %234 
                                       f32_4 %278 = OpVectorShuffle %277 %277 1 1 1 1 
                              Uniform f32_4* %279 = OpAccessChain %116 %40 %40 
                                       f32_4 %280 = OpLoad %279 
                                       f32_4 %281 = OpFMul %278 %280 
                                                      OpStore %20 %281 
                              Uniform f32_4* %282 = OpAccessChain %116 %40 %29 
                                       f32_4 %283 = OpLoad %282 
                                       f32_4 %284 = OpLoad %234 
                                       f32_4 %285 = OpVectorShuffle %284 %284 0 0 0 0 
                                       f32_4 %286 = OpFMul %283 %285 
                                       f32_4 %287 = OpLoad %20 
                                       f32_4 %288 = OpFAdd %286 %287 
                                                      OpStore %20 %288 
                              Uniform f32_4* %289 = OpAccessChain %116 %40 %46 
                                       f32_4 %290 = OpLoad %289 
                                       f32_4 %291 = OpLoad %234 
                                       f32_4 %292 = OpVectorShuffle %291 %291 2 2 2 2 
                                       f32_4 %293 = OpFMul %290 %292 
                                       f32_4 %294 = OpLoad %20 
                                       f32_4 %295 = OpFAdd %293 %294 
                                                      OpStore %20 %295 
                              Uniform f32_4* %296 = OpAccessChain %116 %40 %52 
                                       f32_4 %297 = OpLoad %296 
                                       f32_4 %298 = OpLoad %234 
                                       f32_4 %299 = OpVectorShuffle %298 %298 3 3 3 3 
                                       f32_4 %300 = OpFMul %297 %299 
                                       f32_4 %301 = OpLoad %20 
                                       f32_4 %302 = OpFAdd %300 %301 
                                                      OpStore %234 %302 
                                       f32_4 %303 = OpLoad %234 
                                       f32_2 %304 = OpVectorShuffle %303 %303 0 1 
                                       f32_2 %306 = OpFAdd %304 %305 
                                       f32_4 %307 = OpLoad %20 
                                       f32_4 %308 = OpVectorShuffle %307 %306 4 5 2 3 
                                                      OpStore %20 %308 
                                       f32_4 %309 = OpLoad %20 
                                       f32_2 %310 = OpVectorShuffle %309 %309 0 1 
                              Uniform f32_4* %311 = OpAccessChain %116 %83 
                                       f32_4 %312 = OpLoad %311 
                                       f32_2 %313 = OpVectorShuffle %312 %312 0 1 
                                       f32_2 %314 = OpFDiv %310 %313 
                                       f32_4 %315 = OpLoad %20 
                                       f32_4 %316 = OpVectorShuffle %315 %314 4 5 2 3 
                                                      OpStore %20 %316 
                                       f32_4 %317 = OpLoad %20 
                                       f32_2 %318 = OpVectorShuffle %317 %317 0 1 
                                       f32_2 %321 = OpFAdd %318 %320 
                                       f32_4 %322 = OpLoad %20 
                                       f32_4 %323 = OpVectorShuffle %322 %321 4 5 2 3 
                                                      OpStore %20 %323 
                                       f32_4 %324 = OpLoad %20 
                                       f32_2 %325 = OpVectorShuffle %324 %324 0 1 
                                       f32_2 %326 = OpExtInst %1 3 %325 
                                       f32_4 %327 = OpLoad %20 
                                       f32_4 %328 = OpVectorShuffle %327 %326 4 5 2 3 
                                                      OpStore %20 %328 
                                       f32_4 %329 = OpLoad %20 
                                       f32_2 %330 = OpVectorShuffle %329 %329 0 1 
                              Uniform f32_4* %331 = OpAccessChain %116 %83 
                                       f32_4 %332 = OpLoad %331 
                                       f32_2 %333 = OpVectorShuffle %332 %332 0 1 
                                       f32_2 %334 = OpFMul %330 %333 
                                       f32_2 %336 = OpFAdd %334 %335 
                                       f32_4 %337 = OpLoad %20 
                                       f32_4 %338 = OpVectorShuffle %337 %336 4 5 2 3 
                                                      OpStore %20 %338 
                                Private i32* %345 = OpAccessChain %162 %343 
                                         i32 %346 = OpLoad %345 
                                        bool %347 = OpINotEqual %346 %29 
                                                      OpSelectionMerge %351 None 
                                                      OpBranchConditional %347 %350 %354 
                                             %350 = OpLabel 
                                       f32_4 %352 = OpLoad %20 
                                       f32_2 %353 = OpVectorShuffle %352 %352 0 1 
                                                      OpStore %349 %353 
                                                      OpBranch %351 
                                             %354 = OpLabel 
                                       f32_4 %355 = OpLoad %234 
                                       f32_2 %356 = OpVectorShuffle %355 %355 0 1 
                                                      OpStore %349 %356 
                                                      OpBranch %351 
                                             %351 = OpLabel 
                                       f32_2 %357 = OpLoad %349 
                               Output f32_4* %358 = OpAccessChain %342 %29 
                                       f32_4 %359 = OpLoad %358 
                                       f32_4 %360 = OpVectorShuffle %359 %357 4 5 2 3 
                                                      OpStore %358 %360 
                                       f32_4 %361 = OpLoad %234 
                                       f32_2 %362 = OpVectorShuffle %361 %361 2 3 
                               Output f32_4* %363 = OpAccessChain %342 %29 
                                       f32_4 %364 = OpLoad %363 
                                       f32_4 %365 = OpVectorShuffle %364 %362 0 1 4 5 
                                                      OpStore %363 %365 
                                       f32_4 %367 = OpLoad %366 
                              Uniform f32_4* %368 = OpAccessChain %116 %77 
                                       f32_4 %369 = OpLoad %368 
                                       f32_4 %370 = OpFMul %367 %369 
                                                      OpStore %234 %370 
                                       f32_4 %372 = OpLoad %234 
                                                      OpStore %371 %372 
                                Private i32* %375 = OpAccessChain %162 %104 
                                         i32 %376 = OpLoad %375 
                                        bool %377 = OpIEqual %376 %29 
                                                      OpStore %374 %377 
                                        bool %379 = OpLoad %374 
                                                      OpSelectionMerge %383 None 
                                                      OpBranchConditional %379 %382 %387 
                                             %382 = OpLabel 
                                Private i32* %385 = OpAccessChain %162 %384 
                                         i32 %386 = OpLoad %385 
                                                      OpStore %381 %386 
                                                      OpBranch %383 
                                             %387 = OpLabel 
                                                      OpStore %381 %29 
                                                      OpBranch %383 
                                             %383 = OpLabel 
                                         i32 %388 = OpLoad %381 
                                                      OpStore %378 %388 
                                       i32_4 %390 = OpLoad %162 
                                       i32_3 %391 = OpVectorShuffle %390 %390 3 2 1 
                                       u32_3 %393 = OpBitcast %391 
                                       u32_3 %396 = OpBitwiseAnd %393 %395 
                                       f32_3 %397 = OpBitcast %396 
                                       f32_4 %398 = OpLoad %20 
                                       f32_4 %399 = OpVectorShuffle %398 %397 4 5 6 3 
                                                      OpStore %20 %399 
                                       f32_2 %401 = OpLoad %62 
                              Uniform f32_4* %402 = OpAccessChain %116 %46 
                                       f32_4 %403 = OpLoad %402 
                                       f32_2 %404 = OpVectorShuffle %403 %403 0 1 
                                       f32_2 %405 = OpFMul %401 %404 
                              Uniform f32_4* %406 = OpAccessChain %116 %46 
                                       f32_4 %407 = OpLoad %406 
                                       f32_2 %408 = OpVectorShuffle %407 %407 2 3 
                                       f32_2 %409 = OpFAdd %405 %408 
                                                      OpStore %400 %409 
                                       f32_2 %410 = OpLoad %400 
                              Uniform f32_4* %411 = OpAccessChain %116 %52 
                                       f32_4 %412 = OpLoad %411 
                                       f32_2 %413 = OpVectorShuffle %412 %412 0 1 
                                       f32_2 %414 = OpFMul %410 %413 
                                       f32_4 %415 = OpLoad %74 
                                       f32_4 %416 = OpVectorShuffle %415 %414 4 5 2 3 
                                                      OpStore %74 %416 
                                         i32 %417 = OpLoad %378 
                                        bool %418 = OpINotEqual %417 %29 
                                                      OpSelectionMerge %421 None 
                                                      OpBranchConditional %418 %420 %424 
                                             %420 = OpLabel 
                                       f32_4 %422 = OpLoad %74 
                                       f32_2 %423 = OpVectorShuffle %422 %422 0 1 
                                                      OpStore %419 %423 
                                                      OpBranch %421 
                                             %424 = OpLabel 
                                       f32_2 %425 = OpLoad %400 
                                                      OpStore %419 %425 
                                                      OpBranch %421 
                                             %421 = OpLabel 
                                       f32_2 %426 = OpLoad %419 
                                       f32_4 %427 = OpLoad vs_TEXCOORD0 
                                       f32_4 %428 = OpVectorShuffle %427 %426 4 5 2 3 
                                                      OpStore vs_TEXCOORD0 %428 
                                Private f32* %429 = OpAccessChain %20 %104 
                                         f32 %430 = OpLoad %429 
                                Private f32* %431 = OpAccessChain %20 %30 
                                         f32 %432 = OpLoad %431 
                                         f32 %433 = OpFAdd %430 %432 
                                Private f32* %434 = OpAccessChain %234 %30 
                                                      OpStore %434 %433 
                                Private f32* %435 = OpAccessChain %20 %384 
                                         f32 %436 = OpLoad %435 
                                Private f32* %437 = OpAccessChain %234 %30 
                                         f32 %438 = OpLoad %437 
                                         f32 %439 = OpFAdd %436 %438 
                                Private f32* %440 = OpAccessChain %234 %30 
                                                      OpStore %440 %439 
                                Private f32* %441 = OpAccessChain %234 %30 
                                         f32 %442 = OpLoad %441 
                                         f32 %443 = OpExtInst %1 37 %442 %137 
                                Private f32* %444 = OpAccessChain %234 %30 
                                                      OpStore %444 %443 
                                Private f32* %445 = OpAccessChain %234 %30 
                                         f32 %446 = OpLoad %445 
                                         f32 %447 = OpFNegate %446 
                                         f32 %448 = OpFAdd %447 %137 
                                Private f32* %449 = OpAccessChain %20 %343 
                                                      OpStore %449 %448 
                                       f32_4 %451 = OpLoad %20 
                                                      OpStore vs_TEXCOORD1 %451 
                                 Output f32* %453 = OpAccessChain %342 %29 %104 
                                         f32 %454 = OpLoad %453 
                                         f32 %455 = OpFNegate %454 
                                 Output f32* %456 = OpAccessChain %342 %29 %104 
                                                      OpStore %456 %455 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 201
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %11 %30 %33 %151 %195 %197 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpDecorate %11 BuiltIn TessLevelOuter 
                                              OpDecorate vs_TEXCOORD0 Location 30 
                                              OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD2 Flat 
                                              OpDecorate vs_TEXCOORD2 Location 33 
                                              OpDecorate %34 RelaxedPrecision 
                                              OpDecorate %35 RelaxedPrecision 
                                              OpDecorate %41 RelaxedPrecision 
                                              OpDecorate %42 RelaxedPrecision 
                                              OpMemberDecorate %69 0 Offset 69 
                                              OpDecorate %69 Block 
                                              OpDecorate %71 DescriptorSet 71 
                                              OpDecorate %71 Binding 71 
                                              OpDecorate %134 RelaxedPrecision 
                                              OpDecorate %137 RelaxedPrecision 
                                              OpDecorate %137 DescriptorSet 137 
                                              OpDecorate %137 Binding 137 
                                              OpDecorate %138 RelaxedPrecision 
                                              OpDecorate %141 RelaxedPrecision 
                                              OpDecorate %141 DescriptorSet 141 
                                              OpDecorate %141 Binding 141 
                                              OpDecorate %142 RelaxedPrecision 
                                              OpDecorate %148 RelaxedPrecision 
                                              OpDecorate %149 RelaxedPrecision 
                                              OpDecorate %150 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD1 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD1 Flat 
                                              OpDecorate vs_TEXCOORD1 Location 151 
                                              OpDecorate %153 RelaxedPrecision 
                                              OpDecorate %154 RelaxedPrecision 
                                              OpDecorate %156 RelaxedPrecision 
                                              OpDecorate %157 RelaxedPrecision 
                                              OpDecorate %157 DescriptorSet 157 
                                              OpDecorate %157 Binding 157 
                                              OpDecorate %158 RelaxedPrecision 
                                              OpDecorate %159 RelaxedPrecision 
                                              OpDecorate %159 DescriptorSet 159 
                                              OpDecorate %159 Binding 159 
                                              OpDecorate %160 RelaxedPrecision 
                                              OpDecorate %165 RelaxedPrecision 
                                              OpDecorate %166 RelaxedPrecision 
                                              OpDecorate %167 RelaxedPrecision 
                                              OpDecorate %168 RelaxedPrecision 
                                              OpDecorate %169 RelaxedPrecision 
                                              OpDecorate %170 RelaxedPrecision 
                                              OpDecorate %171 RelaxedPrecision 
                                              OpDecorate %172 RelaxedPrecision 
                                              OpDecorate %173 RelaxedPrecision 
                                              OpDecorate %174 RelaxedPrecision 
                                              OpDecorate %177 RelaxedPrecision 
                                              OpDecorate %178 RelaxedPrecision 
                                              OpDecorate %179 RelaxedPrecision 
                                              OpDecorate %180 RelaxedPrecision 
                                              OpDecorate %180 DescriptorSet 180 
                                              OpDecorate %180 Binding 180 
                                              OpDecorate %181 RelaxedPrecision 
                                              OpDecorate %182 RelaxedPrecision 
                                              OpDecorate %182 DescriptorSet 182 
                                              OpDecorate %182 Binding 182 
                                              OpDecorate %183 RelaxedPrecision 
                                              OpDecorate %188 RelaxedPrecision 
                                              OpDecorate %189 RelaxedPrecision 
                                              OpDecorate %190 RelaxedPrecision 
                                              OpDecorate %191 RelaxedPrecision 
                                              OpDecorate %192 RelaxedPrecision 
                                              OpDecorate %193 RelaxedPrecision 
                                              OpDecorate %195 RelaxedPrecision 
                                              OpDecorate %195 Location 195 
                                              OpDecorate %196 RelaxedPrecision 
                                              OpDecorate %197 RelaxedPrecision 
                                              OpDecorate %197 Location 197 
                                              OpDecorate %198 RelaxedPrecision 
                                              OpDecorate %199 RelaxedPrecision 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Function %7 
                                      %10 = OpTypePointer Input %7 
                         Input f32_4* %11 = OpVariable Input 
                                      %12 = OpTypeVector %6 3 
                                  f32 %15 = OpConstant 3.674022E-40 
                                      %16 = OpTypeInt 32 0 
                                  u32 %17 = OpConstant 3 
                                      %18 = OpTypePointer Input %6 
                                      %26 = OpTypeBool 
                                      %27 = OpTypeVector %26 4 
                                      %28 = OpTypePointer Private %27 
                      Private bool_4* %29 = OpVariable Private 
                Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                      %37 = OpTypeVector %26 2 
                                      %49 = OpTypePointer Private %7 
                       Private f32_4* %50 = OpVariable Private 
                                  f32 %51 = OpConstant 3.674022E-40 
                                f32_4 %52 = OpConstantComposite %51 %51 %51 %51 
                                f32_4 %53 = OpConstantComposite %15 %15 %15 %15 
                                      %57 = OpTypeVector %6 2 
                                      %65 = OpTypePointer Private %37 
                      Private bool_2* %66 = OpVariable Private 
                                      %69 = OpTypeStruct %7 
                                      %70 = OpTypePointer Uniform %69 
             Uniform struct {f32_4;}* %71 = OpVariable Uniform 
                                      %72 = OpTypeInt 32 1 
                                  i32 %73 = OpConstant 0 
                                      %74 = OpTypePointer Uniform %7 
                                      %80 = OpTypePointer Private %57 
                       Private f32_2* %81 = OpVariable Private 
                                f32_2 %82 = OpConstantComposite %51 %51 
                                f32_2 %83 = OpConstantComposite %15 %15 
                                 u32 %109 = OpConstant 2 
                                     %110 = OpTypePointer Private %6 
                                 f32 %114 = OpConstant 3.674022E-40 
                               f32_3 %115 = OpConstantComposite %15 %15 %114 
                                 u32 %117 = OpConstant 0 
                                     %122 = OpTypePointer Private %26 
                                 i32 %126 = OpConstant 1 
                                 i32 %128 = OpConstant -1 
                        Private f32* %134 = OpVariable Private 
                                     %135 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %136 = OpTypePointer UniformConstant %135 
UniformConstant read_only Texture2D* %137 = OpVariable UniformConstant 
                                     %139 = OpTypeSampler 
                                     %140 = OpTypePointer UniformConstant %139 
            UniformConstant sampler* %141 = OpVariable UniformConstant 
                                     %143 = OpTypeSampledImage %135 
                      Private f32_4* %149 = OpVariable Private 
                Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                      Private f32_4* %156 = OpVariable Private 
UniformConstant read_only Texture2D* %157 = OpVariable UniformConstant 
            UniformConstant sampler* %159 = OpVariable UniformConstant 
                      Private f32_4* %165 = OpVariable Private 
UniformConstant read_only Texture2D* %180 = OpVariable UniformConstant 
            UniformConstant sampler* %182 = OpVariable UniformConstant 
                                     %194 = OpTypePointer Output %7 
                       Output f32_4* %195 = OpVariable Output 
                        Input f32_4* %197 = OpVariable Input 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                       Function f32_4* %9 = OpVariable Function 
                                f32_4 %13 = OpLoad %11 
                                f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                           Input f32* %19 = OpAccessChain %11 %17 
                                  f32 %20 = OpLoad %19 
                                  f32 %21 = OpFDiv %15 %20 
                                  f32 %22 = OpCompositeExtract %14 0 
                                  f32 %23 = OpCompositeExtract %14 1 
                                  f32 %24 = OpCompositeExtract %14 2 
                                f32_4 %25 = OpCompositeConstruct %22 %23 %24 %21 
                                              OpStore %9 %25 
                                f32_4 %31 = OpLoad vs_TEXCOORD0 
                                f32_4 %32 = OpVectorShuffle %31 %31 2 3 2 2 
                                f32_4 %34 = OpLoad vs_TEXCOORD2 
                                f32_4 %35 = OpVectorShuffle %34 %34 0 1 0 0 
                               bool_4 %36 = OpFOrdGreaterThanEqual %32 %35 
                               bool_2 %38 = OpVectorShuffle %36 %36 0 1 
                               bool_4 %39 = OpLoad %29 
                               bool_4 %40 = OpVectorShuffle %39 %38 4 5 2 3 
                                              OpStore %29 %40 
                                f32_4 %41 = OpLoad vs_TEXCOORD2 
                                f32_4 %42 = OpVectorShuffle %41 %41 2 2 2 3 
                                f32_4 %43 = OpLoad vs_TEXCOORD0 
                                f32_4 %44 = OpVectorShuffle %43 %43 2 2 2 3 
                               bool_4 %45 = OpFOrdGreaterThanEqual %42 %44 
                               bool_2 %46 = OpVectorShuffle %45 %45 2 3 
                               bool_4 %47 = OpLoad %29 
                               bool_4 %48 = OpVectorShuffle %47 %46 0 1 4 5 
                                              OpStore %29 %48 
                               bool_4 %54 = OpLoad %29 
                                f32_4 %55 = OpSelect %54 %53 %52 
                                f32_4 %56 = OpExtInst %1 46 %52 %53 %55 
                                              OpStore %50 %56 
                                f32_4 %58 = OpLoad %50 
                                f32_2 %59 = OpVectorShuffle %58 %58 2 3 
                                f32_4 %60 = OpLoad %50 
                                f32_2 %61 = OpVectorShuffle %60 %60 0 1 
                                f32_2 %62 = OpFAdd %59 %61 
                                f32_4 %63 = OpLoad %50 
                                f32_4 %64 = OpVectorShuffle %63 %62 4 5 2 3 
                                              OpStore %50 %64 
                                f32_4 %67 = OpLoad %9 
                                f32_4 %68 = OpVectorShuffle %67 %67 0 1 0 1 
                       Uniform f32_4* %75 = OpAccessChain %71 %73 
                                f32_4 %76 = OpLoad %75 
                                f32_4 %77 = OpVectorShuffle %76 %76 0 1 0 1 
                               bool_4 %78 = OpFOrdGreaterThanEqual %68 %77 
                               bool_2 %79 = OpVectorShuffle %78 %78 0 1 
                                              OpStore %66 %79 
                               bool_2 %84 = OpLoad %66 
                                f32_2 %85 = OpSelect %84 %83 %82 
                                f32_2 %86 = OpExtInst %1 46 %82 %83 %85 
                                              OpStore %81 %86 
                                f32_2 %87 = OpLoad %81 
                                f32_4 %88 = OpLoad %50 
                                f32_2 %89 = OpVectorShuffle %88 %88 0 1 
                                f32_2 %90 = OpFAdd %87 %89 
                                f32_4 %91 = OpLoad %50 
                                f32_4 %92 = OpVectorShuffle %91 %90 4 5 2 3 
                                              OpStore %50 %92 
                       Uniform f32_4* %93 = OpAccessChain %71 %73 
                                f32_4 %94 = OpLoad %93 
                                f32_4 %95 = OpVectorShuffle %94 %94 2 3 2 3 
                                f32_4 %96 = OpLoad %9 
                                f32_4 %97 = OpVectorShuffle %96 %96 0 1 0 1 
                               bool_4 %98 = OpFOrdGreaterThanEqual %95 %97 
                               bool_2 %99 = OpVectorShuffle %98 %98 0 1 
                                              OpStore %66 %99 
                              bool_2 %100 = OpLoad %66 
                               f32_2 %101 = OpSelect %100 %83 %82 
                               f32_2 %102 = OpExtInst %1 46 %82 %83 %101 
                                              OpStore %81 %102 
                               f32_2 %103 = OpLoad %81 
                               f32_4 %104 = OpLoad %50 
                               f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                               f32_2 %106 = OpFAdd %103 %105 
                               f32_4 %107 = OpLoad %50 
                               f32_4 %108 = OpVectorShuffle %107 %106 4 5 2 3 
                                              OpStore %50 %108 
                        Private f32* %111 = OpAccessChain %50 %109 
                                              OpStore %111 %15 
                               f32_4 %112 = OpLoad %50 
                               f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                                 f32 %116 = OpDot %113 %115 
                        Private f32* %118 = OpAccessChain %50 %117 
                                              OpStore %118 %116 
                        Private f32* %119 = OpAccessChain %50 %117 
                                 f32 %120 = OpLoad %119 
                                bool %121 = OpFOrdLessThan %120 %51 
                       Private bool* %123 = OpAccessChain %29 %117 
                                              OpStore %123 %121 
                       Private bool* %124 = OpAccessChain %29 %117 
                                bool %125 = OpLoad %124 
                                 i32 %127 = OpSelect %125 %126 %73 
                                 i32 %129 = OpIMul %127 %128 
                                bool %130 = OpINotEqual %129 %73 
                                              OpSelectionMerge %132 None 
                                              OpBranchConditional %130 %131 %132 
                                     %131 = OpLabel 
                                              OpKill
                                     %132 = OpLabel 
                 read_only Texture2D %138 = OpLoad %137 
                             sampler %142 = OpLoad %141 
          read_only Texture2DSampled %144 = OpSampledImage %138 %142 
                               f32_4 %145 = OpLoad vs_TEXCOORD0 
                               f32_2 %146 = OpVectorShuffle %145 %145 0 1 
                               f32_4 %147 = OpImageSampleImplicitLod %144 %146 
                                 f32 %148 = OpCompositeExtract %147 3 
                                              OpStore %134 %148 
                                 f32 %150 = OpLoad %134 
                          Input f32* %152 = OpAccessChain vs_TEXCOORD1 %117 
                                 f32 %153 = OpLoad %152 
                                 f32 %154 = OpFMul %150 %153 
                        Private f32* %155 = OpAccessChain %149 %17 
                                              OpStore %155 %154 
                 read_only Texture2D %158 = OpLoad %157 
                             sampler %160 = OpLoad %159 
          read_only Texture2DSampled %161 = OpSampledImage %158 %160 
                               f32_4 %162 = OpLoad vs_TEXCOORD0 
                               f32_2 %163 = OpVectorShuffle %162 %162 0 1 
                               f32_4 %164 = OpImageSampleImplicitLod %161 %163 
                                              OpStore %156 %164 
                               f32_4 %166 = OpLoad %156 
                               f32_4 %167 = OpLoad vs_TEXCOORD1 
                               f32_4 %168 = OpVectorShuffle %167 %167 1 1 1 1 
                               f32_4 %169 = OpFMul %166 %168 
                               f32_4 %170 = OpLoad vs_TEXCOORD1 
                               f32_4 %171 = OpVectorShuffle %170 %170 3 3 3 3 
                               f32_4 %172 = OpFAdd %169 %171 
                                              OpStore %165 %172 
                               f32_4 %173 = OpLoad vs_TEXCOORD1 
                               f32_3 %174 = OpVectorShuffle %173 %173 0 0 0 
                               f32_4 %175 = OpLoad %149 
                               f32_4 %176 = OpVectorShuffle %175 %174 4 5 6 3 
                                              OpStore %149 %176 
                               f32_4 %177 = OpLoad %149 
                               f32_4 %178 = OpLoad %165 
                               f32_4 %179 = OpFAdd %177 %178 
                                              OpStore %149 %179 
                 read_only Texture2D %181 = OpLoad %180 
                             sampler %183 = OpLoad %182 
          read_only Texture2DSampled %184 = OpSampledImage %181 %183 
                               f32_4 %185 = OpLoad vs_TEXCOORD0 
                               f32_2 %186 = OpVectorShuffle %185 %185 0 1 
                               f32_4 %187 = OpImageSampleImplicitLod %184 %186 
                                              OpStore %156 %187 
                               f32_4 %188 = OpLoad %156 
                               f32_4 %189 = OpLoad vs_TEXCOORD1 
                               f32_4 %190 = OpVectorShuffle %189 %189 2 2 2 2 
                               f32_4 %191 = OpFMul %188 %190 
                               f32_4 %192 = OpLoad %149 
                               f32_4 %193 = OpFAdd %191 %192 
                                              OpStore %149 %193 
                               f32_4 %196 = OpLoad %149 
                               f32_4 %198 = OpLoad %197 
                               f32_4 %199 = OpFMul %196 %198 
                                              OpStore %195 %199 
                                              OpReturn
                                              OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 458
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %13 %62 %70 %204 %260 %342 %366 %371 %450 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate %13 Location 13 
                                                      OpDecorate %22 ArrayStride 22 
                                                      OpMemberDecorate %23 0 Offset 23 
                                                      OpDecorate %24 ArrayStride 24 
                                                      OpMemberDecorate %25 0 NonWritable 
                                                      OpMemberDecorate %25 0 Offset 25 
                                                      OpDecorate %25 BufferBlock 
                                                      OpDecorate %27 DescriptorSet 27 
                                                      OpDecorate %27 Binding 27 
                                                      OpDecorate %62 Location 62 
                                                      OpDecorate %70 Location 70 
                                                      OpDecorate %112 ArrayStride 112 
                                                      OpDecorate %113 ArrayStride 113 
                                                      OpMemberDecorate %114 0 Offset 114 
                                                      OpMemberDecorate %114 1 Offset 114 
                                                      OpMemberDecorate %114 2 Offset 114 
                                                      OpMemberDecorate %114 3 Offset 114 
                                                      OpMemberDecorate %114 4 RelaxedPrecision 
                                                      OpMemberDecorate %114 4 Offset 114 
                                                      OpMemberDecorate %114 5 Offset 114 
                                                      OpDecorate %114 Block 
                                                      OpDecorate %116 DescriptorSet 116 
                                                      OpDecorate %116 Binding 116 
                                                      OpDecorate vs_TEXCOORD0 Location 204 
                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 Flat 
                                                      OpDecorate vs_TEXCOORD2 Location 260 
                                                      OpMemberDecorate %340 0 BuiltIn 340 
                                                      OpMemberDecorate %340 1 BuiltIn 340 
                                                      OpMemberDecorate %340 2 BuiltIn 340 
                                                      OpDecorate %340 Block 
                                                      OpDecorate %366 Location 366 
                                                      OpDecorate %369 RelaxedPrecision 
                                                      OpDecorate %371 RelaxedPrecision 
                                                      OpDecorate %371 Location 371 
                                                      OpDecorate vs_TEXCOORD1 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Flat 
                                                      OpDecorate vs_TEXCOORD1 Location 450 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeInt 32 0 
                                               %7 = OpTypeVector %6 2 
                                               %8 = OpTypePointer Private %7 
                                Private u32_2* %9 = OpVariable Private 
                                              %10 = OpTypeFloat 32 
                                              %11 = OpTypeVector %10 3 
                                              %12 = OpTypePointer Input %11 
                                 Input f32_3* %13 = OpVariable Input 
                                              %14 = OpTypeVector %10 2 
                                              %18 = OpTypeVector %10 4 
                                              %19 = OpTypePointer Private %18 
                               Private f32_4* %20 = OpVariable Private 
                                          u32 %21 = OpConstant 16 
                                              %22 = OpTypeArray %6 %21 
                                              %23 = OpTypeStruct %22 
                                              %24 = OpTypeRuntimeArray %23 
                                              %25 = OpTypeStruct %24 
                                              %26 = OpTypePointer Uniform %25 
                          Uniform struct {;}* %27 = OpVariable Uniform 
                                              %28 = OpTypeInt 32 1 
                                          i32 %29 = OpConstant 0 
                                          u32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Private %6 
                                              %34 = OpTypePointer Uniform %6 
                                          i32 %40 = OpConstant 1 
                                          i32 %46 = OpConstant 2 
                                          i32 %52 = OpConstant 3 
                                              %57 = OpTypePointer Private %14 
                               Private f32_2* %58 = OpVariable Private 
                                              %61 = OpTypePointer Input %14 
                                 Input f32_2* %62 = OpVariable Input 
                                              %65 = OpTypePointer Private %10 
                               Private f32_2* %67 = OpVariable Private 
                                              %69 = OpTypePointer Input %18 
                                 Input f32_4* %70 = OpVariable Input 
                               Private f32_4* %74 = OpVariable Private 
                                          i32 %77 = OpConstant 4 
                                          i32 %83 = OpConstant 5 
                                          i32 %89 = OpConstant 6 
                                          i32 %95 = OpConstant 7 
                                         u32 %104 = OpConstant 1 
                                         u32 %111 = OpConstant 4 
                                             %112 = OpTypeArray %18 %111 
                                             %113 = OpTypeArray %18 %111 
                                             %114 = OpTypeStruct %112 %113 %18 %18 %18 %18 
                                             %115 = OpTypePointer Uniform %114 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32_4;}* %116 = OpVariable Uniform 
                                             %117 = OpTypePointer Uniform %18 
                                Private f32* %134 = OpVariable Private 
                                         f32 %137 = OpConstant 3.674022E-40 
                                         f32 %141 = OpConstant 3.674022E-40 
                                         f32 %153 = OpConstant 3.674022E-40 
                                             %160 = OpTypeVector %28 4 
                                             %161 = OpTypePointer Private %160 
                              Private i32_4* %162 = OpVariable Private 
                                         f32 %165 = OpConstant 3.674022E-40 
                                         f32 %166 = OpConstant 3.674022E-40 
                                         f32 %167 = OpConstant 3.674022E-40 
                                       f32_4 %168 = OpConstantComposite %165 %166 %167 %137 
                                             %169 = OpTypeBool 
                                             %170 = OpTypeVector %169 4 
                                             %172 = OpTypeVector %6 4 
                                       u32_4 %173 = OpConstantComposite %30 %30 %30 %30 
                                       u32_4 %174 = OpConstantComposite %104 %104 %104 %104 
                                         u32 %176 = OpConstant 4294967295 
                                             %182 = OpTypeVector %28 2 
                                             %203 = OpTypePointer Output %18 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                              Private f32_4* %208 = OpVariable Private 
                                         i32 %211 = OpConstant 8 
                                         i32 %217 = OpConstant 9 
                                         i32 %223 = OpConstant 10 
                                         i32 %229 = OpConstant 11 
                              Private f32_4* %234 = OpVariable Private 
                                         i32 %237 = OpConstant 12 
                                         i32 %243 = OpConstant 13 
                                         i32 %249 = OpConstant 14 
                                         i32 %255 = OpConstant 15 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                       f32_2 %305 = OpConstantComposite %137 %137 
                                         f32 %319 = OpConstant 3.674022E-40 
                                       f32_2 %320 = OpConstantComposite %319 %319 
                                       f32_2 %335 = OpConstantComposite %153 %153 
                                             %339 = OpTypeArray %10 %104 
                                             %340 = OpTypeStruct %18 %10 %339 
                                             %341 = OpTypePointer Output %340 
        Output struct {f32_4; f32; f32[1];}* %342 = OpVariable Output 
                                         u32 %343 = OpConstant 3 
                                             %344 = OpTypePointer Private %28 
                                             %348 = OpTypePointer Function %14 
                                Input f32_4* %366 = OpVariable Input 
                               Output f32_4* %371 = OpVariable Output 
                                             %373 = OpTypePointer Private %169 
                               Private bool* %374 = OpVariable Private 
                                Private i32* %378 = OpVariable Private 
                                             %380 = OpTypePointer Function %28 
                                         u32 %384 = OpConstant 2 
                                             %389 = OpTypeVector %28 3 
                                             %392 = OpTypeVector %6 3 
                                         u32 %394 = OpConstant 1065353216 
                                       u32_3 %395 = OpConstantComposite %394 %394 %394 
                              Private f32_2* %400 = OpVariable Private 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                             %452 = OpTypePointer Output %10 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_2* %349 = OpVariable Function 
                               Function i32* %381 = OpVariable Function 
                             Function f32_2* %419 = OpVariable Function 
                                        f32_3 %15 = OpLoad %13 
                                        f32_2 %16 = OpVectorShuffle %15 %15 0 1 
                                        u32_2 %17 = OpConvertFToU %16 
                                                      OpStore %9 %17 
                                 Private u32* %32 = OpAccessChain %9 %30 
                                          u32 %33 = OpLoad %32 
                                 Uniform u32* %35 = OpAccessChain %27 %29 %33 %29 %29 
                                          u32 %36 = OpLoad %35 
                                          f32 %37 = OpBitcast %36 
                                 Private u32* %38 = OpAccessChain %9 %30 
                                          u32 %39 = OpLoad %38 
                                 Uniform u32* %41 = OpAccessChain %27 %29 %39 %29 %40 
                                          u32 %42 = OpLoad %41 
                                          f32 %43 = OpBitcast %42 
                                 Private u32* %44 = OpAccessChain %9 %30 
                                          u32 %45 = OpLoad %44 
                                 Uniform u32* %47 = OpAccessChain %27 %29 %45 %29 %46 
                                          u32 %48 = OpLoad %47 
                                          f32 %49 = OpBitcast %48 
                                 Private u32* %50 = OpAccessChain %9 %30 
                                          u32 %51 = OpLoad %50 
                                 Uniform u32* %53 = OpAccessChain %27 %29 %51 %29 %52 
                                          u32 %54 = OpLoad %53 
                                          f32 %55 = OpBitcast %54 
                                        f32_4 %56 = OpCompositeConstruct %37 %43 %49 %55 
                                                      OpStore %20 %56 
                                        f32_4 %59 = OpLoad %20 
                                        f32_2 %60 = OpVectorShuffle %59 %59 0 1 
                                        f32_2 %63 = OpLoad %62 
                                          f32 %64 = OpDot %60 %63 
                                 Private f32* %66 = OpAccessChain %58 %30 
                                                      OpStore %66 %64 
                                        f32_4 %68 = OpLoad %20 
                                        f32_4 %71 = OpLoad %70 
                                          f32 %72 = OpDot %68 %71 
                                 Private f32* %73 = OpAccessChain %67 %30 
                                                      OpStore %73 %72 
                                 Private u32* %75 = OpAccessChain %9 %30 
                                          u32 %76 = OpLoad %75 
                                 Uniform u32* %78 = OpAccessChain %27 %29 %76 %29 %77 
                                          u32 %79 = OpLoad %78 
                                          f32 %80 = OpBitcast %79 
                                 Private u32* %81 = OpAccessChain %9 %30 
                                          u32 %82 = OpLoad %81 
                                 Uniform u32* %84 = OpAccessChain %27 %29 %82 %29 %83 
                                          u32 %85 = OpLoad %84 
                                          f32 %86 = OpBitcast %85 
                                 Private u32* %87 = OpAccessChain %9 %30 
                                          u32 %88 = OpLoad %87 
                                 Uniform u32* %90 = OpAccessChain %27 %29 %88 %29 %89 
                                          u32 %91 = OpLoad %90 
                                          f32 %92 = OpBitcast %91 
                                 Private u32* %93 = OpAccessChain %9 %30 
                                          u32 %94 = OpLoad %93 
                                 Uniform u32* %96 = OpAccessChain %27 %29 %94 %29 %95 
                                          u32 %97 = OpLoad %96 
                                          f32 %98 = OpBitcast %97 
                                        f32_4 %99 = OpCompositeConstruct %80 %86 %92 %98 
                                                      OpStore %74 %99 
                                       f32_4 %100 = OpLoad %74 
                                       f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                       f32_2 %102 = OpLoad %62 
                                         f32 %103 = OpDot %101 %102 
                                Private f32* %105 = OpAccessChain %58 %104 
                                                      OpStore %105 %103 
                                       f32_4 %106 = OpLoad %74 
                                       f32_4 %107 = OpLoad %70 
                                         f32 %108 = OpDot %106 %107 
                                Private f32* %109 = OpAccessChain %67 %104 
                                                      OpStore %109 %108 
                                       f32_2 %110 = OpLoad %58 
                              Uniform f32_4* %118 = OpAccessChain %116 %83 
                                       f32_4 %119 = OpLoad %118 
                                       f32_2 %120 = OpVectorShuffle %119 %119 2 3 
                                       f32_2 %121 = OpFMul %110 %120 
                                       f32_4 %122 = OpLoad %20 
                                       f32_4 %123 = OpVectorShuffle %122 %121 4 5 2 3 
                                                      OpStore %20 %123 
                                       f32_4 %124 = OpLoad %20 
                                       f32_2 %125 = OpVectorShuffle %124 %124 0 1 
                                       f32_4 %126 = OpLoad %20 
                                       f32_2 %127 = OpVectorShuffle %126 %126 0 1 
                                         f32 %128 = OpDot %125 %127 
                                Private f32* %129 = OpAccessChain %20 %30 
                                                      OpStore %129 %128 
                                Private f32* %130 = OpAccessChain %20 %30 
                                         f32 %131 = OpLoad %130 
                                         f32 %132 = OpExtInst %1 31 %131 
                                Private f32* %133 = OpAccessChain %20 %30 
                                                      OpStore %133 %132 
                                Private f32* %135 = OpAccessChain %20 %30 
                                         f32 %136 = OpLoad %135 
                                         f32 %138 = OpExtInst %1 40 %136 %137 
                                                      OpStore %134 %138 
                                Private f32* %139 = OpAccessChain %20 %30 
                                         f32 %140 = OpLoad %139 
                                         f32 %142 = OpFAdd %140 %141 
                                Private f32* %143 = OpAccessChain %20 %30 
                                                      OpStore %143 %142 
                                         f32 %144 = OpLoad %134 
                                         f32 %145 = OpExtInst %1 2 %144 
                                                      OpStore %134 %145 
                                         f32 %146 = OpLoad %134 
                                Private f32* %147 = OpAccessChain %20 %30 
                                         f32 %148 = OpLoad %147 
                                         f32 %149 = OpFDiv %146 %148 
                                Private f32* %150 = OpAccessChain %20 %30 
                                                      OpStore %150 %149 
                                Private f32* %151 = OpAccessChain %20 %30 
                                         f32 %152 = OpLoad %151 
                                         f32 %154 = OpFAdd %152 %153 
                                Private f32* %155 = OpAccessChain %20 %30 
                                                      OpStore %155 %154 
                                       f32_2 %156 = OpLoad %58 
                                       f32_4 %157 = OpLoad %20 
                                       f32_2 %158 = OpVectorShuffle %157 %157 0 0 
                                       f32_2 %159 = OpFMul %156 %158 
                                                      OpStore %58 %159 
                                       f32_3 %163 = OpLoad %13 
                                       f32_4 %164 = OpVectorShuffle %163 %163 2 2 2 2 
                                      bool_4 %171 = OpFOrdEqual %164 %168 
                                       u32_4 %175 = OpSelect %171 %174 %173 
                                       u32_4 %177 = OpCompositeConstruct %176 %176 %176 %176 
                                       u32_4 %178 = OpIMul %175 %177 
                                       i32_4 %179 = OpBitcast %178 
                                                      OpStore %162 %179 
                                       f32_2 %180 = OpLoad %58 
                                       u32_2 %181 = OpBitcast %180 
                                       i32_4 %183 = OpLoad %162 
                                       i32_2 %184 = OpVectorShuffle %183 %183 0 0 
                                       u32_2 %185 = OpBitcast %184 
                                       u32_2 %186 = OpBitwiseAnd %181 %185 
                                       f32_2 %187 = OpBitcast %186 
                                                      OpStore %58 %187 
                                       f32_2 %188 = OpLoad %58 
                                       f32_2 %189 = OpLoad %67 
                                       f32_2 %190 = OpFAdd %188 %189 
                                                      OpStore %58 %190 
                                       f32_2 %191 = OpLoad %58 
                                       f32_4 %192 = OpVectorShuffle %191 %191 1 1 1 1 
                              Uniform f32_4* %193 = OpAccessChain %116 %29 %40 
                                       f32_4 %194 = OpLoad %193 
                                       f32_4 %195 = OpFMul %192 %194 
                                                      OpStore %20 %195 
                              Uniform f32_4* %196 = OpAccessChain %116 %29 %29 
                                       f32_4 %197 = OpLoad %196 
                                       f32_2 %198 = OpLoad %58 
                                       f32_4 %199 = OpVectorShuffle %198 %198 0 0 0 0 
                                       f32_4 %200 = OpFMul %197 %199 
                                       f32_4 %201 = OpLoad %20 
                                       f32_4 %202 = OpFAdd %200 %201 
                                                      OpStore %20 %202 
                                       f32_2 %205 = OpLoad %58 
                                       f32_4 %206 = OpLoad vs_TEXCOORD0 
                                       f32_4 %207 = OpVectorShuffle %206 %205 0 1 4 5 
                                                      OpStore vs_TEXCOORD0 %207 
                                Private u32* %209 = OpAccessChain %9 %30 
                                         u32 %210 = OpLoad %209 
                                Uniform u32* %212 = OpAccessChain %27 %29 %210 %29 %211 
                                         u32 %213 = OpLoad %212 
                                         f32 %214 = OpBitcast %213 
                                Private u32* %215 = OpAccessChain %9 %30 
                                         u32 %216 = OpLoad %215 
                                Uniform u32* %218 = OpAccessChain %27 %29 %216 %29 %217 
                                         u32 %219 = OpLoad %218 
                                         f32 %220 = OpBitcast %219 
                                Private u32* %221 = OpAccessChain %9 %30 
                                         u32 %222 = OpLoad %221 
                                Uniform u32* %224 = OpAccessChain %27 %29 %222 %29 %223 
                                         u32 %225 = OpLoad %224 
                                         f32 %226 = OpBitcast %225 
                                Private u32* %227 = OpAccessChain %9 %30 
                                         u32 %228 = OpLoad %227 
                                Uniform u32* %230 = OpAccessChain %27 %29 %228 %29 %229 
                                         u32 %231 = OpLoad %230 
                                         f32 %232 = OpBitcast %231 
                                       f32_4 %233 = OpCompositeConstruct %214 %220 %226 %232 
                                                      OpStore %208 %233 
                                Private u32* %235 = OpAccessChain %9 %104 
                                         u32 %236 = OpLoad %235 
                                Uniform u32* %238 = OpAccessChain %27 %29 %236 %29 %237 
                                         u32 %239 = OpLoad %238 
                                         f32 %240 = OpBitcast %239 
                                Private u32* %241 = OpAccessChain %9 %104 
                                         u32 %242 = OpLoad %241 
                                Uniform u32* %244 = OpAccessChain %27 %29 %242 %29 %243 
                                         u32 %245 = OpLoad %244 
                                         f32 %246 = OpBitcast %245 
                                Private u32* %247 = OpAccessChain %9 %104 
                                         u32 %248 = OpLoad %247 
                                Uniform u32* %250 = OpAccessChain %27 %29 %248 %29 %249 
                                         u32 %251 = OpLoad %250 
                                         f32 %252 = OpBitcast %251 
                                Private u32* %253 = OpAccessChain %9 %104 
                                         u32 %254 = OpLoad %253 
                                Uniform u32* %256 = OpAccessChain %27 %29 %254 %29 %255 
                                         u32 %257 = OpLoad %256 
                                         f32 %258 = OpBitcast %257 
                                       f32_4 %259 = OpCompositeConstruct %240 %246 %252 %258 
                                                      OpStore %234 %259 
                                       f32_4 %261 = OpLoad %234 
                                                      OpStore vs_TEXCOORD2 %261 
                                       f32_4 %262 = OpLoad %208 
                                       f32_4 %263 = OpLoad %70 
                                         f32 %264 = OpDot %262 %263 
                                Private f32* %265 = OpAccessChain %234 %30 
                                                      OpStore %265 %264 
                              Uniform f32_4* %266 = OpAccessChain %116 %29 %46 
                                       f32_4 %267 = OpLoad %266 
                                       f32_4 %268 = OpLoad %234 
                                       f32_4 %269 = OpVectorShuffle %268 %268 0 0 0 0 
                                       f32_4 %270 = OpFMul %267 %269 
                                       f32_4 %271 = OpLoad %20 
                                       f32_4 %272 = OpFAdd %270 %271 
                                                      OpStore %234 %272 
                                       f32_4 %273 = OpLoad %234 
                              Uniform f32_4* %274 = OpAccessChain %116 %29 %52 
                                       f32_4 %275 = OpLoad %274 
                                       f32_4 %276 = OpFAdd %273 %275 
                                                      OpStore %234 %276 
                                       f32_4 %277 = OpLoad %234 
                                       f32_4 %278 = OpVectorShuffle %277 %277 1 1 1 1 
                              Uniform f32_4* %279 = OpAccessChain %116 %40 %40 
                                       f32_4 %280 = OpLoad %279 
                                       f32_4 %281 = OpFMul %278 %280 
                                                      OpStore %20 %281 
                              Uniform f32_4* %282 = OpAccessChain %116 %40 %29 
                                       f32_4 %283 = OpLoad %282 
                                       f32_4 %284 = OpLoad %234 
                                       f32_4 %285 = OpVectorShuffle %284 %284 0 0 0 0 
                                       f32_4 %286 = OpFMul %283 %285 
                                       f32_4 %287 = OpLoad %20 
                                       f32_4 %288 = OpFAdd %286 %287 
                                                      OpStore %20 %288 
                              Uniform f32_4* %289 = OpAccessChain %116 %40 %46 
                                       f32_4 %290 = OpLoad %289 
                                       f32_4 %291 = OpLoad %234 
                                       f32_4 %292 = OpVectorShuffle %291 %291 2 2 2 2 
                                       f32_4 %293 = OpFMul %290 %292 
                                       f32_4 %294 = OpLoad %20 
                                       f32_4 %295 = OpFAdd %293 %294 
                                                      OpStore %20 %295 
                              Uniform f32_4* %296 = OpAccessChain %116 %40 %52 
                                       f32_4 %297 = OpLoad %296 
                                       f32_4 %298 = OpLoad %234 
                                       f32_4 %299 = OpVectorShuffle %298 %298 3 3 3 3 
                                       f32_4 %300 = OpFMul %297 %299 
                                       f32_4 %301 = OpLoad %20 
                                       f32_4 %302 = OpFAdd %300 %301 
                                                      OpStore %234 %302 
                                       f32_4 %303 = OpLoad %234 
                                       f32_2 %304 = OpVectorShuffle %303 %303 0 1 
                                       f32_2 %306 = OpFAdd %304 %305 
                                       f32_4 %307 = OpLoad %20 
                                       f32_4 %308 = OpVectorShuffle %307 %306 4 5 2 3 
                                                      OpStore %20 %308 
                                       f32_4 %309 = OpLoad %20 
                                       f32_2 %310 = OpVectorShuffle %309 %309 0 1 
                              Uniform f32_4* %311 = OpAccessChain %116 %83 
                                       f32_4 %312 = OpLoad %311 
                                       f32_2 %313 = OpVectorShuffle %312 %312 0 1 
                                       f32_2 %314 = OpFDiv %310 %313 
                                       f32_4 %315 = OpLoad %20 
                                       f32_4 %316 = OpVectorShuffle %315 %314 4 5 2 3 
                                                      OpStore %20 %316 
                                       f32_4 %317 = OpLoad %20 
                                       f32_2 %318 = OpVectorShuffle %317 %317 0 1 
                                       f32_2 %321 = OpFAdd %318 %320 
                                       f32_4 %322 = OpLoad %20 
                                       f32_4 %323 = OpVectorShuffle %322 %321 4 5 2 3 
                                                      OpStore %20 %323 
                                       f32_4 %324 = OpLoad %20 
                                       f32_2 %325 = OpVectorShuffle %324 %324 0 1 
                                       f32_2 %326 = OpExtInst %1 3 %325 
                                       f32_4 %327 = OpLoad %20 
                                       f32_4 %328 = OpVectorShuffle %327 %326 4 5 2 3 
                                                      OpStore %20 %328 
                                       f32_4 %329 = OpLoad %20 
                                       f32_2 %330 = OpVectorShuffle %329 %329 0 1 
                              Uniform f32_4* %331 = OpAccessChain %116 %83 
                                       f32_4 %332 = OpLoad %331 
                                       f32_2 %333 = OpVectorShuffle %332 %332 0 1 
                                       f32_2 %334 = OpFMul %330 %333 
                                       f32_2 %336 = OpFAdd %334 %335 
                                       f32_4 %337 = OpLoad %20 
                                       f32_4 %338 = OpVectorShuffle %337 %336 4 5 2 3 
                                                      OpStore %20 %338 
                                Private i32* %345 = OpAccessChain %162 %343 
                                         i32 %346 = OpLoad %345 
                                        bool %347 = OpINotEqual %346 %29 
                                                      OpSelectionMerge %351 None 
                                                      OpBranchConditional %347 %350 %354 
                                             %350 = OpLabel 
                                       f32_4 %352 = OpLoad %20 
                                       f32_2 %353 = OpVectorShuffle %352 %352 0 1 
                                                      OpStore %349 %353 
                                                      OpBranch %351 
                                             %354 = OpLabel 
                                       f32_4 %355 = OpLoad %234 
                                       f32_2 %356 = OpVectorShuffle %355 %355 0 1 
                                                      OpStore %349 %356 
                                                      OpBranch %351 
                                             %351 = OpLabel 
                                       f32_2 %357 = OpLoad %349 
                               Output f32_4* %358 = OpAccessChain %342 %29 
                                       f32_4 %359 = OpLoad %358 
                                       f32_4 %360 = OpVectorShuffle %359 %357 4 5 2 3 
                                                      OpStore %358 %360 
                                       f32_4 %361 = OpLoad %234 
                                       f32_2 %362 = OpVectorShuffle %361 %361 2 3 
                               Output f32_4* %363 = OpAccessChain %342 %29 
                                       f32_4 %364 = OpLoad %363 
                                       f32_4 %365 = OpVectorShuffle %364 %362 0 1 4 5 
                                                      OpStore %363 %365 
                                       f32_4 %367 = OpLoad %366 
                              Uniform f32_4* %368 = OpAccessChain %116 %77 
                                       f32_4 %369 = OpLoad %368 
                                       f32_4 %370 = OpFMul %367 %369 
                                                      OpStore %234 %370 
                                       f32_4 %372 = OpLoad %234 
                                                      OpStore %371 %372 
                                Private i32* %375 = OpAccessChain %162 %104 
                                         i32 %376 = OpLoad %375 
                                        bool %377 = OpIEqual %376 %29 
                                                      OpStore %374 %377 
                                        bool %379 = OpLoad %374 
                                                      OpSelectionMerge %383 None 
                                                      OpBranchConditional %379 %382 %387 
                                             %382 = OpLabel 
                                Private i32* %385 = OpAccessChain %162 %384 
                                         i32 %386 = OpLoad %385 
                                                      OpStore %381 %386 
                                                      OpBranch %383 
                                             %387 = OpLabel 
                                                      OpStore %381 %29 
                                                      OpBranch %383 
                                             %383 = OpLabel 
                                         i32 %388 = OpLoad %381 
                                                      OpStore %378 %388 
                                       i32_4 %390 = OpLoad %162 
                                       i32_3 %391 = OpVectorShuffle %390 %390 3 2 1 
                                       u32_3 %393 = OpBitcast %391 
                                       u32_3 %396 = OpBitwiseAnd %393 %395 
                                       f32_3 %397 = OpBitcast %396 
                                       f32_4 %398 = OpLoad %20 
                                       f32_4 %399 = OpVectorShuffle %398 %397 4 5 6 3 
                                                      OpStore %20 %399 
                                       f32_2 %401 = OpLoad %62 
                              Uniform f32_4* %402 = OpAccessChain %116 %46 
                                       f32_4 %403 = OpLoad %402 
                                       f32_2 %404 = OpVectorShuffle %403 %403 0 1 
                                       f32_2 %405 = OpFMul %401 %404 
                              Uniform f32_4* %406 = OpAccessChain %116 %46 
                                       f32_4 %407 = OpLoad %406 
                                       f32_2 %408 = OpVectorShuffle %407 %407 2 3 
                                       f32_2 %409 = OpFAdd %405 %408 
                                                      OpStore %400 %409 
                                       f32_2 %410 = OpLoad %400 
                              Uniform f32_4* %411 = OpAccessChain %116 %52 
                                       f32_4 %412 = OpLoad %411 
                                       f32_2 %413 = OpVectorShuffle %412 %412 0 1 
                                       f32_2 %414 = OpFMul %410 %413 
                                       f32_4 %415 = OpLoad %74 
                                       f32_4 %416 = OpVectorShuffle %415 %414 4 5 2 3 
                                                      OpStore %74 %416 
                                         i32 %417 = OpLoad %378 
                                        bool %418 = OpINotEqual %417 %29 
                                                      OpSelectionMerge %421 None 
                                                      OpBranchConditional %418 %420 %424 
                                             %420 = OpLabel 
                                       f32_4 %422 = OpLoad %74 
                                       f32_2 %423 = OpVectorShuffle %422 %422 0 1 
                                                      OpStore %419 %423 
                                                      OpBranch %421 
                                             %424 = OpLabel 
                                       f32_2 %425 = OpLoad %400 
                                                      OpStore %419 %425 
                                                      OpBranch %421 
                                             %421 = OpLabel 
                                       f32_2 %426 = OpLoad %419 
                                       f32_4 %427 = OpLoad vs_TEXCOORD0 
                                       f32_4 %428 = OpVectorShuffle %427 %426 4 5 2 3 
                                                      OpStore vs_TEXCOORD0 %428 
                                Private f32* %429 = OpAccessChain %20 %104 
                                         f32 %430 = OpLoad %429 
                                Private f32* %431 = OpAccessChain %20 %30 
                                         f32 %432 = OpLoad %431 
                                         f32 %433 = OpFAdd %430 %432 
                                Private f32* %434 = OpAccessChain %234 %30 
                                                      OpStore %434 %433 
                                Private f32* %435 = OpAccessChain %20 %384 
                                         f32 %436 = OpLoad %435 
                                Private f32* %437 = OpAccessChain %234 %30 
                                         f32 %438 = OpLoad %437 
                                         f32 %439 = OpFAdd %436 %438 
                                Private f32* %440 = OpAccessChain %234 %30 
                                                      OpStore %440 %439 
                                Private f32* %441 = OpAccessChain %234 %30 
                                         f32 %442 = OpLoad %441 
                                         f32 %443 = OpExtInst %1 37 %442 %137 
                                Private f32* %444 = OpAccessChain %234 %30 
                                                      OpStore %444 %443 
                                Private f32* %445 = OpAccessChain %234 %30 
                                         f32 %446 = OpLoad %445 
                                         f32 %447 = OpFNegate %446 
                                         f32 %448 = OpFAdd %447 %137 
                                Private f32* %449 = OpAccessChain %20 %343 
                                                      OpStore %449 %448 
                                       f32_4 %451 = OpLoad %20 
                                                      OpStore vs_TEXCOORD1 %451 
                                 Output f32* %453 = OpAccessChain %342 %29 %104 
                                         f32 %454 = OpLoad %453 
                                         f32 %455 = OpFNegate %454 
                                 Output f32* %456 = OpAccessChain %342 %29 %104 
                                                      OpStore %456 %455 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 201
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %11 %30 %33 %151 %195 %197 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpDecorate %11 BuiltIn TessLevelOuter 
                                              OpDecorate vs_TEXCOORD0 Location 30 
                                              OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD2 Flat 
                                              OpDecorate vs_TEXCOORD2 Location 33 
                                              OpDecorate %34 RelaxedPrecision 
                                              OpDecorate %35 RelaxedPrecision 
                                              OpDecorate %41 RelaxedPrecision 
                                              OpDecorate %42 RelaxedPrecision 
                                              OpMemberDecorate %69 0 Offset 69 
                                              OpDecorate %69 Block 
                                              OpDecorate %71 DescriptorSet 71 
                                              OpDecorate %71 Binding 71 
                                              OpDecorate %134 RelaxedPrecision 
                                              OpDecorate %137 RelaxedPrecision 
                                              OpDecorate %137 DescriptorSet 137 
                                              OpDecorate %137 Binding 137 
                                              OpDecorate %138 RelaxedPrecision 
                                              OpDecorate %141 RelaxedPrecision 
                                              OpDecorate %141 DescriptorSet 141 
                                              OpDecorate %141 Binding 141 
                                              OpDecorate %142 RelaxedPrecision 
                                              OpDecorate %148 RelaxedPrecision 
                                              OpDecorate %149 RelaxedPrecision 
                                              OpDecorate %150 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD1 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD1 Flat 
                                              OpDecorate vs_TEXCOORD1 Location 151 
                                              OpDecorate %153 RelaxedPrecision 
                                              OpDecorate %154 RelaxedPrecision 
                                              OpDecorate %156 RelaxedPrecision 
                                              OpDecorate %157 RelaxedPrecision 
                                              OpDecorate %157 DescriptorSet 157 
                                              OpDecorate %157 Binding 157 
                                              OpDecorate %158 RelaxedPrecision 
                                              OpDecorate %159 RelaxedPrecision 
                                              OpDecorate %159 DescriptorSet 159 
                                              OpDecorate %159 Binding 159 
                                              OpDecorate %160 RelaxedPrecision 
                                              OpDecorate %165 RelaxedPrecision 
                                              OpDecorate %166 RelaxedPrecision 
                                              OpDecorate %167 RelaxedPrecision 
                                              OpDecorate %168 RelaxedPrecision 
                                              OpDecorate %169 RelaxedPrecision 
                                              OpDecorate %170 RelaxedPrecision 
                                              OpDecorate %171 RelaxedPrecision 
                                              OpDecorate %172 RelaxedPrecision 
                                              OpDecorate %173 RelaxedPrecision 
                                              OpDecorate %174 RelaxedPrecision 
                                              OpDecorate %177 RelaxedPrecision 
                                              OpDecorate %178 RelaxedPrecision 
                                              OpDecorate %179 RelaxedPrecision 
                                              OpDecorate %180 RelaxedPrecision 
                                              OpDecorate %180 DescriptorSet 180 
                                              OpDecorate %180 Binding 180 
                                              OpDecorate %181 RelaxedPrecision 
                                              OpDecorate %182 RelaxedPrecision 
                                              OpDecorate %182 DescriptorSet 182 
                                              OpDecorate %182 Binding 182 
                                              OpDecorate %183 RelaxedPrecision 
                                              OpDecorate %188 RelaxedPrecision 
                                              OpDecorate %189 RelaxedPrecision 
                                              OpDecorate %190 RelaxedPrecision 
                                              OpDecorate %191 RelaxedPrecision 
                                              OpDecorate %192 RelaxedPrecision 
                                              OpDecorate %193 RelaxedPrecision 
                                              OpDecorate %195 RelaxedPrecision 
                                              OpDecorate %195 Location 195 
                                              OpDecorate %196 RelaxedPrecision 
                                              OpDecorate %197 RelaxedPrecision 
                                              OpDecorate %197 Location 197 
                                              OpDecorate %198 RelaxedPrecision 
                                              OpDecorate %199 RelaxedPrecision 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Function %7 
                                      %10 = OpTypePointer Input %7 
                         Input f32_4* %11 = OpVariable Input 
                                      %12 = OpTypeVector %6 3 
                                  f32 %15 = OpConstant 3.674022E-40 
                                      %16 = OpTypeInt 32 0 
                                  u32 %17 = OpConstant 3 
                                      %18 = OpTypePointer Input %6 
                                      %26 = OpTypeBool 
                                      %27 = OpTypeVector %26 4 
                                      %28 = OpTypePointer Private %27 
                      Private bool_4* %29 = OpVariable Private 
                Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                      %37 = OpTypeVector %26 2 
                                      %49 = OpTypePointer Private %7 
                       Private f32_4* %50 = OpVariable Private 
                                  f32 %51 = OpConstant 3.674022E-40 
                                f32_4 %52 = OpConstantComposite %51 %51 %51 %51 
                                f32_4 %53 = OpConstantComposite %15 %15 %15 %15 
                                      %57 = OpTypeVector %6 2 
                                      %65 = OpTypePointer Private %37 
                      Private bool_2* %66 = OpVariable Private 
                                      %69 = OpTypeStruct %7 
                                      %70 = OpTypePointer Uniform %69 
             Uniform struct {f32_4;}* %71 = OpVariable Uniform 
                                      %72 = OpTypeInt 32 1 
                                  i32 %73 = OpConstant 0 
                                      %74 = OpTypePointer Uniform %7 
                                      %80 = OpTypePointer Private %57 
                       Private f32_2* %81 = OpVariable Private 
                                f32_2 %82 = OpConstantComposite %51 %51 
                                f32_2 %83 = OpConstantComposite %15 %15 
                                 u32 %109 = OpConstant 2 
                                     %110 = OpTypePointer Private %6 
                                 f32 %114 = OpConstant 3.674022E-40 
                               f32_3 %115 = OpConstantComposite %15 %15 %114 
                                 u32 %117 = OpConstant 0 
                                     %122 = OpTypePointer Private %26 
                                 i32 %126 = OpConstant 1 
                                 i32 %128 = OpConstant -1 
                        Private f32* %134 = OpVariable Private 
                                     %135 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %136 = OpTypePointer UniformConstant %135 
UniformConstant read_only Texture2D* %137 = OpVariable UniformConstant 
                                     %139 = OpTypeSampler 
                                     %140 = OpTypePointer UniformConstant %139 
            UniformConstant sampler* %141 = OpVariable UniformConstant 
                                     %143 = OpTypeSampledImage %135 
                      Private f32_4* %149 = OpVariable Private 
                Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                      Private f32_4* %156 = OpVariable Private 
UniformConstant read_only Texture2D* %157 = OpVariable UniformConstant 
            UniformConstant sampler* %159 = OpVariable UniformConstant 
                      Private f32_4* %165 = OpVariable Private 
UniformConstant read_only Texture2D* %180 = OpVariable UniformConstant 
            UniformConstant sampler* %182 = OpVariable UniformConstant 
                                     %194 = OpTypePointer Output %7 
                       Output f32_4* %195 = OpVariable Output 
                        Input f32_4* %197 = OpVariable Input 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                       Function f32_4* %9 = OpVariable Function 
                                f32_4 %13 = OpLoad %11 
                                f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                           Input f32* %19 = OpAccessChain %11 %17 
                                  f32 %20 = OpLoad %19 
                                  f32 %21 = OpFDiv %15 %20 
                                  f32 %22 = OpCompositeExtract %14 0 
                                  f32 %23 = OpCompositeExtract %14 1 
                                  f32 %24 = OpCompositeExtract %14 2 
                                f32_4 %25 = OpCompositeConstruct %22 %23 %24 %21 
                                              OpStore %9 %25 
                                f32_4 %31 = OpLoad vs_TEXCOORD0 
                                f32_4 %32 = OpVectorShuffle %31 %31 2 3 2 2 
                                f32_4 %34 = OpLoad vs_TEXCOORD2 
                                f32_4 %35 = OpVectorShuffle %34 %34 0 1 0 0 
                               bool_4 %36 = OpFOrdGreaterThanEqual %32 %35 
                               bool_2 %38 = OpVectorShuffle %36 %36 0 1 
                               bool_4 %39 = OpLoad %29 
                               bool_4 %40 = OpVectorShuffle %39 %38 4 5 2 3 
                                              OpStore %29 %40 
                                f32_4 %41 = OpLoad vs_TEXCOORD2 
                                f32_4 %42 = OpVectorShuffle %41 %41 2 2 2 3 
                                f32_4 %43 = OpLoad vs_TEXCOORD0 
                                f32_4 %44 = OpVectorShuffle %43 %43 2 2 2 3 
                               bool_4 %45 = OpFOrdGreaterThanEqual %42 %44 
                               bool_2 %46 = OpVectorShuffle %45 %45 2 3 
                               bool_4 %47 = OpLoad %29 
                               bool_4 %48 = OpVectorShuffle %47 %46 0 1 4 5 
                                              OpStore %29 %48 
                               bool_4 %54 = OpLoad %29 
                                f32_4 %55 = OpSelect %54 %53 %52 
                                f32_4 %56 = OpExtInst %1 46 %52 %53 %55 
                                              OpStore %50 %56 
                                f32_4 %58 = OpLoad %50 
                                f32_2 %59 = OpVectorShuffle %58 %58 2 3 
                                f32_4 %60 = OpLoad %50 
                                f32_2 %61 = OpVectorShuffle %60 %60 0 1 
                                f32_2 %62 = OpFAdd %59 %61 
                                f32_4 %63 = OpLoad %50 
                                f32_4 %64 = OpVectorShuffle %63 %62 4 5 2 3 
                                              OpStore %50 %64 
                                f32_4 %67 = OpLoad %9 
                                f32_4 %68 = OpVectorShuffle %67 %67 0 1 0 1 
                       Uniform f32_4* %75 = OpAccessChain %71 %73 
                                f32_4 %76 = OpLoad %75 
                                f32_4 %77 = OpVectorShuffle %76 %76 0 1 0 1 
                               bool_4 %78 = OpFOrdGreaterThanEqual %68 %77 
                               bool_2 %79 = OpVectorShuffle %78 %78 0 1 
                                              OpStore %66 %79 
                               bool_2 %84 = OpLoad %66 
                                f32_2 %85 = OpSelect %84 %83 %82 
                                f32_2 %86 = OpExtInst %1 46 %82 %83 %85 
                                              OpStore %81 %86 
                                f32_2 %87 = OpLoad %81 
                                f32_4 %88 = OpLoad %50 
                                f32_2 %89 = OpVectorShuffle %88 %88 0 1 
                                f32_2 %90 = OpFAdd %87 %89 
                                f32_4 %91 = OpLoad %50 
                                f32_4 %92 = OpVectorShuffle %91 %90 4 5 2 3 
                                              OpStore %50 %92 
                       Uniform f32_4* %93 = OpAccessChain %71 %73 
                                f32_4 %94 = OpLoad %93 
                                f32_4 %95 = OpVectorShuffle %94 %94 2 3 2 3 
                                f32_4 %96 = OpLoad %9 
                                f32_4 %97 = OpVectorShuffle %96 %96 0 1 0 1 
                               bool_4 %98 = OpFOrdGreaterThanEqual %95 %97 
                               bool_2 %99 = OpVectorShuffle %98 %98 0 1 
                                              OpStore %66 %99 
                              bool_2 %100 = OpLoad %66 
                               f32_2 %101 = OpSelect %100 %83 %82 
                               f32_2 %102 = OpExtInst %1 46 %82 %83 %101 
                                              OpStore %81 %102 
                               f32_2 %103 = OpLoad %81 
                               f32_4 %104 = OpLoad %50 
                               f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                               f32_2 %106 = OpFAdd %103 %105 
                               f32_4 %107 = OpLoad %50 
                               f32_4 %108 = OpVectorShuffle %107 %106 4 5 2 3 
                                              OpStore %50 %108 
                        Private f32* %111 = OpAccessChain %50 %109 
                                              OpStore %111 %15 
                               f32_4 %112 = OpLoad %50 
                               f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                                 f32 %116 = OpDot %113 %115 
                        Private f32* %118 = OpAccessChain %50 %117 
                                              OpStore %118 %116 
                        Private f32* %119 = OpAccessChain %50 %117 
                                 f32 %120 = OpLoad %119 
                                bool %121 = OpFOrdLessThan %120 %51 
                       Private bool* %123 = OpAccessChain %29 %117 
                                              OpStore %123 %121 
                       Private bool* %124 = OpAccessChain %29 %117 
                                bool %125 = OpLoad %124 
                                 i32 %127 = OpSelect %125 %126 %73 
                                 i32 %129 = OpIMul %127 %128 
                                bool %130 = OpINotEqual %129 %73 
                                              OpSelectionMerge %132 None 
                                              OpBranchConditional %130 %131 %132 
                                     %131 = OpLabel 
                                              OpKill
                                     %132 = OpLabel 
                 read_only Texture2D %138 = OpLoad %137 
                             sampler %142 = OpLoad %141 
          read_only Texture2DSampled %144 = OpSampledImage %138 %142 
                               f32_4 %145 = OpLoad vs_TEXCOORD0 
                               f32_2 %146 = OpVectorShuffle %145 %145 0 1 
                               f32_4 %147 = OpImageSampleImplicitLod %144 %146 
                                 f32 %148 = OpCompositeExtract %147 3 
                                              OpStore %134 %148 
                                 f32 %150 = OpLoad %134 
                          Input f32* %152 = OpAccessChain vs_TEXCOORD1 %117 
                                 f32 %153 = OpLoad %152 
                                 f32 %154 = OpFMul %150 %153 
                        Private f32* %155 = OpAccessChain %149 %17 
                                              OpStore %155 %154 
                 read_only Texture2D %158 = OpLoad %157 
                             sampler %160 = OpLoad %159 
          read_only Texture2DSampled %161 = OpSampledImage %158 %160 
                               f32_4 %162 = OpLoad vs_TEXCOORD0 
                               f32_2 %163 = OpVectorShuffle %162 %162 0 1 
                               f32_4 %164 = OpImageSampleImplicitLod %161 %163 
                                              OpStore %156 %164 
                               f32_4 %166 = OpLoad %156 
                               f32_4 %167 = OpLoad vs_TEXCOORD1 
                               f32_4 %168 = OpVectorShuffle %167 %167 1 1 1 1 
                               f32_4 %169 = OpFMul %166 %168 
                               f32_4 %170 = OpLoad vs_TEXCOORD1 
                               f32_4 %171 = OpVectorShuffle %170 %170 3 3 3 3 
                               f32_4 %172 = OpFAdd %169 %171 
                                              OpStore %165 %172 
                               f32_4 %173 = OpLoad vs_TEXCOORD1 
                               f32_3 %174 = OpVectorShuffle %173 %173 0 0 0 
                               f32_4 %175 = OpLoad %149 
                               f32_4 %176 = OpVectorShuffle %175 %174 4 5 6 3 
                                              OpStore %149 %176 
                               f32_4 %177 = OpLoad %149 
                               f32_4 %178 = OpLoad %165 
                               f32_4 %179 = OpFAdd %177 %178 
                                              OpStore %149 %179 
                 read_only Texture2D %181 = OpLoad %180 
                             sampler %183 = OpLoad %182 
          read_only Texture2DSampled %184 = OpSampledImage %181 %183 
                               f32_4 %185 = OpLoad vs_TEXCOORD0 
                               f32_2 %186 = OpVectorShuffle %185 %185 0 1 
                               f32_4 %187 = OpImageSampleImplicitLod %184 %186 
                                              OpStore %156 %187 
                               f32_4 %188 = OpLoad %156 
                               f32_4 %189 = OpLoad vs_TEXCOORD1 
                               f32_4 %190 = OpVectorShuffle %189 %189 2 2 2 2 
                               f32_4 %191 = OpFMul %188 %190 
                               f32_4 %192 = OpLoad %149 
                               f32_4 %193 = OpFAdd %191 %192 
                                              OpStore %149 %193 
                               f32_4 %196 = OpLoad %149 
                               f32_4 %198 = OpLoad %197 
                               f32_4 %199 = OpFMul %196 %198 
                                              OpStore %195 %199 
                                              OpReturn
                                              OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 458
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %13 %62 %70 %204 %260 %342 %366 %371 %450 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate %13 Location 13 
                                                      OpDecorate %22 ArrayStride 22 
                                                      OpMemberDecorate %23 0 Offset 23 
                                                      OpDecorate %24 ArrayStride 24 
                                                      OpMemberDecorate %25 0 NonWritable 
                                                      OpMemberDecorate %25 0 Offset 25 
                                                      OpDecorate %25 BufferBlock 
                                                      OpDecorate %27 DescriptorSet 27 
                                                      OpDecorate %27 Binding 27 
                                                      OpDecorate %62 Location 62 
                                                      OpDecorate %70 Location 70 
                                                      OpDecorate %112 ArrayStride 112 
                                                      OpDecorate %113 ArrayStride 113 
                                                      OpMemberDecorate %114 0 Offset 114 
                                                      OpMemberDecorate %114 1 Offset 114 
                                                      OpMemberDecorate %114 2 Offset 114 
                                                      OpMemberDecorate %114 3 Offset 114 
                                                      OpMemberDecorate %114 4 RelaxedPrecision 
                                                      OpMemberDecorate %114 4 Offset 114 
                                                      OpMemberDecorate %114 5 Offset 114 
                                                      OpDecorate %114 Block 
                                                      OpDecorate %116 DescriptorSet 116 
                                                      OpDecorate %116 Binding 116 
                                                      OpDecorate vs_TEXCOORD0 Location 204 
                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 Flat 
                                                      OpDecorate vs_TEXCOORD2 Location 260 
                                                      OpMemberDecorate %340 0 BuiltIn 340 
                                                      OpMemberDecorate %340 1 BuiltIn 340 
                                                      OpMemberDecorate %340 2 BuiltIn 340 
                                                      OpDecorate %340 Block 
                                                      OpDecorate %366 Location 366 
                                                      OpDecorate %369 RelaxedPrecision 
                                                      OpDecorate %371 RelaxedPrecision 
                                                      OpDecorate %371 Location 371 
                                                      OpDecorate vs_TEXCOORD1 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Flat 
                                                      OpDecorate vs_TEXCOORD1 Location 450 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeInt 32 0 
                                               %7 = OpTypeVector %6 2 
                                               %8 = OpTypePointer Private %7 
                                Private u32_2* %9 = OpVariable Private 
                                              %10 = OpTypeFloat 32 
                                              %11 = OpTypeVector %10 3 
                                              %12 = OpTypePointer Input %11 
                                 Input f32_3* %13 = OpVariable Input 
                                              %14 = OpTypeVector %10 2 
                                              %18 = OpTypeVector %10 4 
                                              %19 = OpTypePointer Private %18 
                               Private f32_4* %20 = OpVariable Private 
                                          u32 %21 = OpConstant 16 
                                              %22 = OpTypeArray %6 %21 
                                              %23 = OpTypeStruct %22 
                                              %24 = OpTypeRuntimeArray %23 
                                              %25 = OpTypeStruct %24 
                                              %26 = OpTypePointer Uniform %25 
                          Uniform struct {;}* %27 = OpVariable Uniform 
                                              %28 = OpTypeInt 32 1 
                                          i32 %29 = OpConstant 0 
                                          u32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Private %6 
                                              %34 = OpTypePointer Uniform %6 
                                          i32 %40 = OpConstant 1 
                                          i32 %46 = OpConstant 2 
                                          i32 %52 = OpConstant 3 
                                              %57 = OpTypePointer Private %14 
                               Private f32_2* %58 = OpVariable Private 
                                              %61 = OpTypePointer Input %14 
                                 Input f32_2* %62 = OpVariable Input 
                                              %65 = OpTypePointer Private %10 
                               Private f32_2* %67 = OpVariable Private 
                                              %69 = OpTypePointer Input %18 
                                 Input f32_4* %70 = OpVariable Input 
                               Private f32_4* %74 = OpVariable Private 
                                          i32 %77 = OpConstant 4 
                                          i32 %83 = OpConstant 5 
                                          i32 %89 = OpConstant 6 
                                          i32 %95 = OpConstant 7 
                                         u32 %104 = OpConstant 1 
                                         u32 %111 = OpConstant 4 
                                             %112 = OpTypeArray %18 %111 
                                             %113 = OpTypeArray %18 %111 
                                             %114 = OpTypeStruct %112 %113 %18 %18 %18 %18 
                                             %115 = OpTypePointer Uniform %114 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32_4;}* %116 = OpVariable Uniform 
                                             %117 = OpTypePointer Uniform %18 
                                Private f32* %134 = OpVariable Private 
                                         f32 %137 = OpConstant 3.674022E-40 
                                         f32 %141 = OpConstant 3.674022E-40 
                                         f32 %153 = OpConstant 3.674022E-40 
                                             %160 = OpTypeVector %28 4 
                                             %161 = OpTypePointer Private %160 
                              Private i32_4* %162 = OpVariable Private 
                                         f32 %165 = OpConstant 3.674022E-40 
                                         f32 %166 = OpConstant 3.674022E-40 
                                         f32 %167 = OpConstant 3.674022E-40 
                                       f32_4 %168 = OpConstantComposite %165 %166 %167 %137 
                                             %169 = OpTypeBool 
                                             %170 = OpTypeVector %169 4 
                                             %172 = OpTypeVector %6 4 
                                       u32_4 %173 = OpConstantComposite %30 %30 %30 %30 
                                       u32_4 %174 = OpConstantComposite %104 %104 %104 %104 
                                         u32 %176 = OpConstant 4294967295 
                                             %182 = OpTypeVector %28 2 
                                             %203 = OpTypePointer Output %18 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                              Private f32_4* %208 = OpVariable Private 
                                         i32 %211 = OpConstant 8 
                                         i32 %217 = OpConstant 9 
                                         i32 %223 = OpConstant 10 
                                         i32 %229 = OpConstant 11 
                              Private f32_4* %234 = OpVariable Private 
                                         i32 %237 = OpConstant 12 
                                         i32 %243 = OpConstant 13 
                                         i32 %249 = OpConstant 14 
                                         i32 %255 = OpConstant 15 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                       f32_2 %305 = OpConstantComposite %137 %137 
                                         f32 %319 = OpConstant 3.674022E-40 
                                       f32_2 %320 = OpConstantComposite %319 %319 
                                       f32_2 %335 = OpConstantComposite %153 %153 
                                             %339 = OpTypeArray %10 %104 
                                             %340 = OpTypeStruct %18 %10 %339 
                                             %341 = OpTypePointer Output %340 
        Output struct {f32_4; f32; f32[1];}* %342 = OpVariable Output 
                                         u32 %343 = OpConstant 3 
                                             %344 = OpTypePointer Private %28 
                                             %348 = OpTypePointer Function %14 
                                Input f32_4* %366 = OpVariable Input 
                               Output f32_4* %371 = OpVariable Output 
                                             %373 = OpTypePointer Private %169 
                               Private bool* %374 = OpVariable Private 
                                Private i32* %378 = OpVariable Private 
                                             %380 = OpTypePointer Function %28 
                                         u32 %384 = OpConstant 2 
                                             %389 = OpTypeVector %28 3 
                                             %392 = OpTypeVector %6 3 
                                         u32 %394 = OpConstant 1065353216 
                                       u32_3 %395 = OpConstantComposite %394 %394 %394 
                              Private f32_2* %400 = OpVariable Private 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                             %452 = OpTypePointer Output %10 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_2* %349 = OpVariable Function 
                               Function i32* %381 = OpVariable Function 
                             Function f32_2* %419 = OpVariable Function 
                                        f32_3 %15 = OpLoad %13 
                                        f32_2 %16 = OpVectorShuffle %15 %15 0 1 
                                        u32_2 %17 = OpConvertFToU %16 
                                                      OpStore %9 %17 
                                 Private u32* %32 = OpAccessChain %9 %30 
                                          u32 %33 = OpLoad %32 
                                 Uniform u32* %35 = OpAccessChain %27 %29 %33 %29 %29 
                                          u32 %36 = OpLoad %35 
                                          f32 %37 = OpBitcast %36 
                                 Private u32* %38 = OpAccessChain %9 %30 
                                          u32 %39 = OpLoad %38 
                                 Uniform u32* %41 = OpAccessChain %27 %29 %39 %29 %40 
                                          u32 %42 = OpLoad %41 
                                          f32 %43 = OpBitcast %42 
                                 Private u32* %44 = OpAccessChain %9 %30 
                                          u32 %45 = OpLoad %44 
                                 Uniform u32* %47 = OpAccessChain %27 %29 %45 %29 %46 
                                          u32 %48 = OpLoad %47 
                                          f32 %49 = OpBitcast %48 
                                 Private u32* %50 = OpAccessChain %9 %30 
                                          u32 %51 = OpLoad %50 
                                 Uniform u32* %53 = OpAccessChain %27 %29 %51 %29 %52 
                                          u32 %54 = OpLoad %53 
                                          f32 %55 = OpBitcast %54 
                                        f32_4 %56 = OpCompositeConstruct %37 %43 %49 %55 
                                                      OpStore %20 %56 
                                        f32_4 %59 = OpLoad %20 
                                        f32_2 %60 = OpVectorShuffle %59 %59 0 1 
                                        f32_2 %63 = OpLoad %62 
                                          f32 %64 = OpDot %60 %63 
                                 Private f32* %66 = OpAccessChain %58 %30 
                                                      OpStore %66 %64 
                                        f32_4 %68 = OpLoad %20 
                                        f32_4 %71 = OpLoad %70 
                                          f32 %72 = OpDot %68 %71 
                                 Private f32* %73 = OpAccessChain %67 %30 
                                                      OpStore %73 %72 
                                 Private u32* %75 = OpAccessChain %9 %30 
                                          u32 %76 = OpLoad %75 
                                 Uniform u32* %78 = OpAccessChain %27 %29 %76 %29 %77 
                                          u32 %79 = OpLoad %78 
                                          f32 %80 = OpBitcast %79 
                                 Private u32* %81 = OpAccessChain %9 %30 
                                          u32 %82 = OpLoad %81 
                                 Uniform u32* %84 = OpAccessChain %27 %29 %82 %29 %83 
                                          u32 %85 = OpLoad %84 
                                          f32 %86 = OpBitcast %85 
                                 Private u32* %87 = OpAccessChain %9 %30 
                                          u32 %88 = OpLoad %87 
                                 Uniform u32* %90 = OpAccessChain %27 %29 %88 %29 %89 
                                          u32 %91 = OpLoad %90 
                                          f32 %92 = OpBitcast %91 
                                 Private u32* %93 = OpAccessChain %9 %30 
                                          u32 %94 = OpLoad %93 
                                 Uniform u32* %96 = OpAccessChain %27 %29 %94 %29 %95 
                                          u32 %97 = OpLoad %96 
                                          f32 %98 = OpBitcast %97 
                                        f32_4 %99 = OpCompositeConstruct %80 %86 %92 %98 
                                                      OpStore %74 %99 
                                       f32_4 %100 = OpLoad %74 
                                       f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                       f32_2 %102 = OpLoad %62 
                                         f32 %103 = OpDot %101 %102 
                                Private f32* %105 = OpAccessChain %58 %104 
                                                      OpStore %105 %103 
                                       f32_4 %106 = OpLoad %74 
                                       f32_4 %107 = OpLoad %70 
                                         f32 %108 = OpDot %106 %107 
                                Private f32* %109 = OpAccessChain %67 %104 
                                                      OpStore %109 %108 
                                       f32_2 %110 = OpLoad %58 
                              Uniform f32_4* %118 = OpAccessChain %116 %83 
                                       f32_4 %119 = OpLoad %118 
                                       f32_2 %120 = OpVectorShuffle %119 %119 2 3 
                                       f32_2 %121 = OpFMul %110 %120 
                                       f32_4 %122 = OpLoad %20 
                                       f32_4 %123 = OpVectorShuffle %122 %121 4 5 2 3 
                                                      OpStore %20 %123 
                                       f32_4 %124 = OpLoad %20 
                                       f32_2 %125 = OpVectorShuffle %124 %124 0 1 
                                       f32_4 %126 = OpLoad %20 
                                       f32_2 %127 = OpVectorShuffle %126 %126 0 1 
                                         f32 %128 = OpDot %125 %127 
                                Private f32* %129 = OpAccessChain %20 %30 
                                                      OpStore %129 %128 
                                Private f32* %130 = OpAccessChain %20 %30 
                                         f32 %131 = OpLoad %130 
                                         f32 %132 = OpExtInst %1 31 %131 
                                Private f32* %133 = OpAccessChain %20 %30 
                                                      OpStore %133 %132 
                                Private f32* %135 = OpAccessChain %20 %30 
                                         f32 %136 = OpLoad %135 
                                         f32 %138 = OpExtInst %1 40 %136 %137 
                                                      OpStore %134 %138 
                                Private f32* %139 = OpAccessChain %20 %30 
                                         f32 %140 = OpLoad %139 
                                         f32 %142 = OpFAdd %140 %141 
                                Private f32* %143 = OpAccessChain %20 %30 
                                                      OpStore %143 %142 
                                         f32 %144 = OpLoad %134 
                                         f32 %145 = OpExtInst %1 2 %144 
                                                      OpStore %134 %145 
                                         f32 %146 = OpLoad %134 
                                Private f32* %147 = OpAccessChain %20 %30 
                                         f32 %148 = OpLoad %147 
                                         f32 %149 = OpFDiv %146 %148 
                                Private f32* %150 = OpAccessChain %20 %30 
                                                      OpStore %150 %149 
                                Private f32* %151 = OpAccessChain %20 %30 
                                         f32 %152 = OpLoad %151 
                                         f32 %154 = OpFAdd %152 %153 
                                Private f32* %155 = OpAccessChain %20 %30 
                                                      OpStore %155 %154 
                                       f32_2 %156 = OpLoad %58 
                                       f32_4 %157 = OpLoad %20 
                                       f32_2 %158 = OpVectorShuffle %157 %157 0 0 
                                       f32_2 %159 = OpFMul %156 %158 
                                                      OpStore %58 %159 
                                       f32_3 %163 = OpLoad %13 
                                       f32_4 %164 = OpVectorShuffle %163 %163 2 2 2 2 
                                      bool_4 %171 = OpFOrdEqual %164 %168 
                                       u32_4 %175 = OpSelect %171 %174 %173 
                                       u32_4 %177 = OpCompositeConstruct %176 %176 %176 %176 
                                       u32_4 %178 = OpIMul %175 %177 
                                       i32_4 %179 = OpBitcast %178 
                                                      OpStore %162 %179 
                                       f32_2 %180 = OpLoad %58 
                                       u32_2 %181 = OpBitcast %180 
                                       i32_4 %183 = OpLoad %162 
                                       i32_2 %184 = OpVectorShuffle %183 %183 0 0 
                                       u32_2 %185 = OpBitcast %184 
                                       u32_2 %186 = OpBitwiseAnd %181 %185 
                                       f32_2 %187 = OpBitcast %186 
                                                      OpStore %58 %187 
                                       f32_2 %188 = OpLoad %58 
                                       f32_2 %189 = OpLoad %67 
                                       f32_2 %190 = OpFAdd %188 %189 
                                                      OpStore %58 %190 
                                       f32_2 %191 = OpLoad %58 
                                       f32_4 %192 = OpVectorShuffle %191 %191 1 1 1 1 
                              Uniform f32_4* %193 = OpAccessChain %116 %29 %40 
                                       f32_4 %194 = OpLoad %193 
                                       f32_4 %195 = OpFMul %192 %194 
                                                      OpStore %20 %195 
                              Uniform f32_4* %196 = OpAccessChain %116 %29 %29 
                                       f32_4 %197 = OpLoad %196 
                                       f32_2 %198 = OpLoad %58 
                                       f32_4 %199 = OpVectorShuffle %198 %198 0 0 0 0 
                                       f32_4 %200 = OpFMul %197 %199 
                                       f32_4 %201 = OpLoad %20 
                                       f32_4 %202 = OpFAdd %200 %201 
                                                      OpStore %20 %202 
                                       f32_2 %205 = OpLoad %58 
                                       f32_4 %206 = OpLoad vs_TEXCOORD0 
                                       f32_4 %207 = OpVectorShuffle %206 %205 0 1 4 5 
                                                      OpStore vs_TEXCOORD0 %207 
                                Private u32* %209 = OpAccessChain %9 %30 
                                         u32 %210 = OpLoad %209 
                                Uniform u32* %212 = OpAccessChain %27 %29 %210 %29 %211 
                                         u32 %213 = OpLoad %212 
                                         f32 %214 = OpBitcast %213 
                                Private u32* %215 = OpAccessChain %9 %30 
                                         u32 %216 = OpLoad %215 
                                Uniform u32* %218 = OpAccessChain %27 %29 %216 %29 %217 
                                         u32 %219 = OpLoad %218 
                                         f32 %220 = OpBitcast %219 
                                Private u32* %221 = OpAccessChain %9 %30 
                                         u32 %222 = OpLoad %221 
                                Uniform u32* %224 = OpAccessChain %27 %29 %222 %29 %223 
                                         u32 %225 = OpLoad %224 
                                         f32 %226 = OpBitcast %225 
                                Private u32* %227 = OpAccessChain %9 %30 
                                         u32 %228 = OpLoad %227 
                                Uniform u32* %230 = OpAccessChain %27 %29 %228 %29 %229 
                                         u32 %231 = OpLoad %230 
                                         f32 %232 = OpBitcast %231 
                                       f32_4 %233 = OpCompositeConstruct %214 %220 %226 %232 
                                                      OpStore %208 %233 
                                Private u32* %235 = OpAccessChain %9 %104 
                                         u32 %236 = OpLoad %235 
                                Uniform u32* %238 = OpAccessChain %27 %29 %236 %29 %237 
                                         u32 %239 = OpLoad %238 
                                         f32 %240 = OpBitcast %239 
                                Private u32* %241 = OpAccessChain %9 %104 
                                         u32 %242 = OpLoad %241 
                                Uniform u32* %244 = OpAccessChain %27 %29 %242 %29 %243 
                                         u32 %245 = OpLoad %244 
                                         f32 %246 = OpBitcast %245 
                                Private u32* %247 = OpAccessChain %9 %104 
                                         u32 %248 = OpLoad %247 
                                Uniform u32* %250 = OpAccessChain %27 %29 %248 %29 %249 
                                         u32 %251 = OpLoad %250 
                                         f32 %252 = OpBitcast %251 
                                Private u32* %253 = OpAccessChain %9 %104 
                                         u32 %254 = OpLoad %253 
                                Uniform u32* %256 = OpAccessChain %27 %29 %254 %29 %255 
                                         u32 %257 = OpLoad %256 
                                         f32 %258 = OpBitcast %257 
                                       f32_4 %259 = OpCompositeConstruct %240 %246 %252 %258 
                                                      OpStore %234 %259 
                                       f32_4 %261 = OpLoad %234 
                                                      OpStore vs_TEXCOORD2 %261 
                                       f32_4 %262 = OpLoad %208 
                                       f32_4 %263 = OpLoad %70 
                                         f32 %264 = OpDot %262 %263 
                                Private f32* %265 = OpAccessChain %234 %30 
                                                      OpStore %265 %264 
                              Uniform f32_4* %266 = OpAccessChain %116 %29 %46 
                                       f32_4 %267 = OpLoad %266 
                                       f32_4 %268 = OpLoad %234 
                                       f32_4 %269 = OpVectorShuffle %268 %268 0 0 0 0 
                                       f32_4 %270 = OpFMul %267 %269 
                                       f32_4 %271 = OpLoad %20 
                                       f32_4 %272 = OpFAdd %270 %271 
                                                      OpStore %234 %272 
                                       f32_4 %273 = OpLoad %234 
                              Uniform f32_4* %274 = OpAccessChain %116 %29 %52 
                                       f32_4 %275 = OpLoad %274 
                                       f32_4 %276 = OpFAdd %273 %275 
                                                      OpStore %234 %276 
                                       f32_4 %277 = OpLoad %234 
                                       f32_4 %278 = OpVectorShuffle %277 %277 1 1 1 1 
                              Uniform f32_4* %279 = OpAccessChain %116 %40 %40 
                                       f32_4 %280 = OpLoad %279 
                                       f32_4 %281 = OpFMul %278 %280 
                                                      OpStore %20 %281 
                              Uniform f32_4* %282 = OpAccessChain %116 %40 %29 
                                       f32_4 %283 = OpLoad %282 
                                       f32_4 %284 = OpLoad %234 
                                       f32_4 %285 = OpVectorShuffle %284 %284 0 0 0 0 
                                       f32_4 %286 = OpFMul %283 %285 
                                       f32_4 %287 = OpLoad %20 
                                       f32_4 %288 = OpFAdd %286 %287 
                                                      OpStore %20 %288 
                              Uniform f32_4* %289 = OpAccessChain %116 %40 %46 
                                       f32_4 %290 = OpLoad %289 
                                       f32_4 %291 = OpLoad %234 
                                       f32_4 %292 = OpVectorShuffle %291 %291 2 2 2 2 
                                       f32_4 %293 = OpFMul %290 %292 
                                       f32_4 %294 = OpLoad %20 
                                       f32_4 %295 = OpFAdd %293 %294 
                                                      OpStore %20 %295 
                              Uniform f32_4* %296 = OpAccessChain %116 %40 %52 
                                       f32_4 %297 = OpLoad %296 
                                       f32_4 %298 = OpLoad %234 
                                       f32_4 %299 = OpVectorShuffle %298 %298 3 3 3 3 
                                       f32_4 %300 = OpFMul %297 %299 
                                       f32_4 %301 = OpLoad %20 
                                       f32_4 %302 = OpFAdd %300 %301 
                                                      OpStore %234 %302 
                                       f32_4 %303 = OpLoad %234 
                                       f32_2 %304 = OpVectorShuffle %303 %303 0 1 
                                       f32_2 %306 = OpFAdd %304 %305 
                                       f32_4 %307 = OpLoad %20 
                                       f32_4 %308 = OpVectorShuffle %307 %306 4 5 2 3 
                                                      OpStore %20 %308 
                                       f32_4 %309 = OpLoad %20 
                                       f32_2 %310 = OpVectorShuffle %309 %309 0 1 
                              Uniform f32_4* %311 = OpAccessChain %116 %83 
                                       f32_4 %312 = OpLoad %311 
                                       f32_2 %313 = OpVectorShuffle %312 %312 0 1 
                                       f32_2 %314 = OpFDiv %310 %313 
                                       f32_4 %315 = OpLoad %20 
                                       f32_4 %316 = OpVectorShuffle %315 %314 4 5 2 3 
                                                      OpStore %20 %316 
                                       f32_4 %317 = OpLoad %20 
                                       f32_2 %318 = OpVectorShuffle %317 %317 0 1 
                                       f32_2 %321 = OpFAdd %318 %320 
                                       f32_4 %322 = OpLoad %20 
                                       f32_4 %323 = OpVectorShuffle %322 %321 4 5 2 3 
                                                      OpStore %20 %323 
                                       f32_4 %324 = OpLoad %20 
                                       f32_2 %325 = OpVectorShuffle %324 %324 0 1 
                                       f32_2 %326 = OpExtInst %1 3 %325 
                                       f32_4 %327 = OpLoad %20 
                                       f32_4 %328 = OpVectorShuffle %327 %326 4 5 2 3 
                                                      OpStore %20 %328 
                                       f32_4 %329 = OpLoad %20 
                                       f32_2 %330 = OpVectorShuffle %329 %329 0 1 
                              Uniform f32_4* %331 = OpAccessChain %116 %83 
                                       f32_4 %332 = OpLoad %331 
                                       f32_2 %333 = OpVectorShuffle %332 %332 0 1 
                                       f32_2 %334 = OpFMul %330 %333 
                                       f32_2 %336 = OpFAdd %334 %335 
                                       f32_4 %337 = OpLoad %20 
                                       f32_4 %338 = OpVectorShuffle %337 %336 4 5 2 3 
                                                      OpStore %20 %338 
                                Private i32* %345 = OpAccessChain %162 %343 
                                         i32 %346 = OpLoad %345 
                                        bool %347 = OpINotEqual %346 %29 
                                                      OpSelectionMerge %351 None 
                                                      OpBranchConditional %347 %350 %354 
                                             %350 = OpLabel 
                                       f32_4 %352 = OpLoad %20 
                                       f32_2 %353 = OpVectorShuffle %352 %352 0 1 
                                                      OpStore %349 %353 
                                                      OpBranch %351 
                                             %354 = OpLabel 
                                       f32_4 %355 = OpLoad %234 
                                       f32_2 %356 = OpVectorShuffle %355 %355 0 1 
                                                      OpStore %349 %356 
                                                      OpBranch %351 
                                             %351 = OpLabel 
                                       f32_2 %357 = OpLoad %349 
                               Output f32_4* %358 = OpAccessChain %342 %29 
                                       f32_4 %359 = OpLoad %358 
                                       f32_4 %360 = OpVectorShuffle %359 %357 4 5 2 3 
                                                      OpStore %358 %360 
                                       f32_4 %361 = OpLoad %234 
                                       f32_2 %362 = OpVectorShuffle %361 %361 2 3 
                               Output f32_4* %363 = OpAccessChain %342 %29 
                                       f32_4 %364 = OpLoad %363 
                                       f32_4 %365 = OpVectorShuffle %364 %362 0 1 4 5 
                                                      OpStore %363 %365 
                                       f32_4 %367 = OpLoad %366 
                              Uniform f32_4* %368 = OpAccessChain %116 %77 
                                       f32_4 %369 = OpLoad %368 
                                       f32_4 %370 = OpFMul %367 %369 
                                                      OpStore %234 %370 
                                       f32_4 %372 = OpLoad %234 
                                                      OpStore %371 %372 
                                Private i32* %375 = OpAccessChain %162 %104 
                                         i32 %376 = OpLoad %375 
                                        bool %377 = OpIEqual %376 %29 
                                                      OpStore %374 %377 
                                        bool %379 = OpLoad %374 
                                                      OpSelectionMerge %383 None 
                                                      OpBranchConditional %379 %382 %387 
                                             %382 = OpLabel 
                                Private i32* %385 = OpAccessChain %162 %384 
                                         i32 %386 = OpLoad %385 
                                                      OpStore %381 %386 
                                                      OpBranch %383 
                                             %387 = OpLabel 
                                                      OpStore %381 %29 
                                                      OpBranch %383 
                                             %383 = OpLabel 
                                         i32 %388 = OpLoad %381 
                                                      OpStore %378 %388 
                                       i32_4 %390 = OpLoad %162 
                                       i32_3 %391 = OpVectorShuffle %390 %390 3 2 1 
                                       u32_3 %393 = OpBitcast %391 
                                       u32_3 %396 = OpBitwiseAnd %393 %395 
                                       f32_3 %397 = OpBitcast %396 
                                       f32_4 %398 = OpLoad %20 
                                       f32_4 %399 = OpVectorShuffle %398 %397 4 5 6 3 
                                                      OpStore %20 %399 
                                       f32_2 %401 = OpLoad %62 
                              Uniform f32_4* %402 = OpAccessChain %116 %46 
                                       f32_4 %403 = OpLoad %402 
                                       f32_2 %404 = OpVectorShuffle %403 %403 0 1 
                                       f32_2 %405 = OpFMul %401 %404 
                              Uniform f32_4* %406 = OpAccessChain %116 %46 
                                       f32_4 %407 = OpLoad %406 
                                       f32_2 %408 = OpVectorShuffle %407 %407 2 3 
                                       f32_2 %409 = OpFAdd %405 %408 
                                                      OpStore %400 %409 
                                       f32_2 %410 = OpLoad %400 
                              Uniform f32_4* %411 = OpAccessChain %116 %52 
                                       f32_4 %412 = OpLoad %411 
                                       f32_2 %413 = OpVectorShuffle %412 %412 0 1 
                                       f32_2 %414 = OpFMul %410 %413 
                                       f32_4 %415 = OpLoad %74 
                                       f32_4 %416 = OpVectorShuffle %415 %414 4 5 2 3 
                                                      OpStore %74 %416 
                                         i32 %417 = OpLoad %378 
                                        bool %418 = OpINotEqual %417 %29 
                                                      OpSelectionMerge %421 None 
                                                      OpBranchConditional %418 %420 %424 
                                             %420 = OpLabel 
                                       f32_4 %422 = OpLoad %74 
                                       f32_2 %423 = OpVectorShuffle %422 %422 0 1 
                                                      OpStore %419 %423 
                                                      OpBranch %421 
                                             %424 = OpLabel 
                                       f32_2 %425 = OpLoad %400 
                                                      OpStore %419 %425 
                                                      OpBranch %421 
                                             %421 = OpLabel 
                                       f32_2 %426 = OpLoad %419 
                                       f32_4 %427 = OpLoad vs_TEXCOORD0 
                                       f32_4 %428 = OpVectorShuffle %427 %426 4 5 2 3 
                                                      OpStore vs_TEXCOORD0 %428 
                                Private f32* %429 = OpAccessChain %20 %104 
                                         f32 %430 = OpLoad %429 
                                Private f32* %431 = OpAccessChain %20 %30 
                                         f32 %432 = OpLoad %431 
                                         f32 %433 = OpFAdd %430 %432 
                                Private f32* %434 = OpAccessChain %234 %30 
                                                      OpStore %434 %433 
                                Private f32* %435 = OpAccessChain %20 %384 
                                         f32 %436 = OpLoad %435 
                                Private f32* %437 = OpAccessChain %234 %30 
                                         f32 %438 = OpLoad %437 
                                         f32 %439 = OpFAdd %436 %438 
                                Private f32* %440 = OpAccessChain %234 %30 
                                                      OpStore %440 %439 
                                Private f32* %441 = OpAccessChain %234 %30 
                                         f32 %442 = OpLoad %441 
                                         f32 %443 = OpExtInst %1 37 %442 %137 
                                Private f32* %444 = OpAccessChain %234 %30 
                                                      OpStore %444 %443 
                                Private f32* %445 = OpAccessChain %234 %30 
                                         f32 %446 = OpLoad %445 
                                         f32 %447 = OpFNegate %446 
                                         f32 %448 = OpFAdd %447 %137 
                                Private f32* %449 = OpAccessChain %20 %343 
                                                      OpStore %449 %448 
                                       f32_4 %451 = OpLoad %20 
                                                      OpStore vs_TEXCOORD1 %451 
                                 Output f32* %453 = OpAccessChain %342 %29 %104 
                                         f32 %454 = OpLoad %453 
                                         f32 %455 = OpFNegate %454 
                                 Output f32* %456 = OpAccessChain %342 %29 %104 
                                                      OpStore %456 %455 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 201
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %11 %30 %33 %151 %195 %197 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpDecorate %11 BuiltIn TessLevelOuter 
                                              OpDecorate vs_TEXCOORD0 Location 30 
                                              OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD2 Flat 
                                              OpDecorate vs_TEXCOORD2 Location 33 
                                              OpDecorate %34 RelaxedPrecision 
                                              OpDecorate %35 RelaxedPrecision 
                                              OpDecorate %41 RelaxedPrecision 
                                              OpDecorate %42 RelaxedPrecision 
                                              OpMemberDecorate %69 0 Offset 69 
                                              OpDecorate %69 Block 
                                              OpDecorate %71 DescriptorSet 71 
                                              OpDecorate %71 Binding 71 
                                              OpDecorate %134 RelaxedPrecision 
                                              OpDecorate %137 RelaxedPrecision 
                                              OpDecorate %137 DescriptorSet 137 
                                              OpDecorate %137 Binding 137 
                                              OpDecorate %138 RelaxedPrecision 
                                              OpDecorate %141 RelaxedPrecision 
                                              OpDecorate %141 DescriptorSet 141 
                                              OpDecorate %141 Binding 141 
                                              OpDecorate %142 RelaxedPrecision 
                                              OpDecorate %148 RelaxedPrecision 
                                              OpDecorate %149 RelaxedPrecision 
                                              OpDecorate %150 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD1 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD1 Flat 
                                              OpDecorate vs_TEXCOORD1 Location 151 
                                              OpDecorate %153 RelaxedPrecision 
                                              OpDecorate %154 RelaxedPrecision 
                                              OpDecorate %156 RelaxedPrecision 
                                              OpDecorate %157 RelaxedPrecision 
                                              OpDecorate %157 DescriptorSet 157 
                                              OpDecorate %157 Binding 157 
                                              OpDecorate %158 RelaxedPrecision 
                                              OpDecorate %159 RelaxedPrecision 
                                              OpDecorate %159 DescriptorSet 159 
                                              OpDecorate %159 Binding 159 
                                              OpDecorate %160 RelaxedPrecision 
                                              OpDecorate %165 RelaxedPrecision 
                                              OpDecorate %166 RelaxedPrecision 
                                              OpDecorate %167 RelaxedPrecision 
                                              OpDecorate %168 RelaxedPrecision 
                                              OpDecorate %169 RelaxedPrecision 
                                              OpDecorate %170 RelaxedPrecision 
                                              OpDecorate %171 RelaxedPrecision 
                                              OpDecorate %172 RelaxedPrecision 
                                              OpDecorate %173 RelaxedPrecision 
                                              OpDecorate %174 RelaxedPrecision 
                                              OpDecorate %177 RelaxedPrecision 
                                              OpDecorate %178 RelaxedPrecision 
                                              OpDecorate %179 RelaxedPrecision 
                                              OpDecorate %180 RelaxedPrecision 
                                              OpDecorate %180 DescriptorSet 180 
                                              OpDecorate %180 Binding 180 
                                              OpDecorate %181 RelaxedPrecision 
                                              OpDecorate %182 RelaxedPrecision 
                                              OpDecorate %182 DescriptorSet 182 
                                              OpDecorate %182 Binding 182 
                                              OpDecorate %183 RelaxedPrecision 
                                              OpDecorate %188 RelaxedPrecision 
                                              OpDecorate %189 RelaxedPrecision 
                                              OpDecorate %190 RelaxedPrecision 
                                              OpDecorate %191 RelaxedPrecision 
                                              OpDecorate %192 RelaxedPrecision 
                                              OpDecorate %193 RelaxedPrecision 
                                              OpDecorate %195 RelaxedPrecision 
                                              OpDecorate %195 Location 195 
                                              OpDecorate %196 RelaxedPrecision 
                                              OpDecorate %197 RelaxedPrecision 
                                              OpDecorate %197 Location 197 
                                              OpDecorate %198 RelaxedPrecision 
                                              OpDecorate %199 RelaxedPrecision 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Function %7 
                                      %10 = OpTypePointer Input %7 
                         Input f32_4* %11 = OpVariable Input 
                                      %12 = OpTypeVector %6 3 
                                  f32 %15 = OpConstant 3.674022E-40 
                                      %16 = OpTypeInt 32 0 
                                  u32 %17 = OpConstant 3 
                                      %18 = OpTypePointer Input %6 
                                      %26 = OpTypeBool 
                                      %27 = OpTypeVector %26 4 
                                      %28 = OpTypePointer Private %27 
                      Private bool_4* %29 = OpVariable Private 
                Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                      %37 = OpTypeVector %26 2 
                                      %49 = OpTypePointer Private %7 
                       Private f32_4* %50 = OpVariable Private 
                                  f32 %51 = OpConstant 3.674022E-40 
                                f32_4 %52 = OpConstantComposite %51 %51 %51 %51 
                                f32_4 %53 = OpConstantComposite %15 %15 %15 %15 
                                      %57 = OpTypeVector %6 2 
                                      %65 = OpTypePointer Private %37 
                      Private bool_2* %66 = OpVariable Private 
                                      %69 = OpTypeStruct %7 
                                      %70 = OpTypePointer Uniform %69 
             Uniform struct {f32_4;}* %71 = OpVariable Uniform 
                                      %72 = OpTypeInt 32 1 
                                  i32 %73 = OpConstant 0 
                                      %74 = OpTypePointer Uniform %7 
                                      %80 = OpTypePointer Private %57 
                       Private f32_2* %81 = OpVariable Private 
                                f32_2 %82 = OpConstantComposite %51 %51 
                                f32_2 %83 = OpConstantComposite %15 %15 
                                 u32 %109 = OpConstant 2 
                                     %110 = OpTypePointer Private %6 
                                 f32 %114 = OpConstant 3.674022E-40 
                               f32_3 %115 = OpConstantComposite %15 %15 %114 
                                 u32 %117 = OpConstant 0 
                                     %122 = OpTypePointer Private %26 
                                 i32 %126 = OpConstant 1 
                                 i32 %128 = OpConstant -1 
                        Private f32* %134 = OpVariable Private 
                                     %135 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %136 = OpTypePointer UniformConstant %135 
UniformConstant read_only Texture2D* %137 = OpVariable UniformConstant 
                                     %139 = OpTypeSampler 
                                     %140 = OpTypePointer UniformConstant %139 
            UniformConstant sampler* %141 = OpVariable UniformConstant 
                                     %143 = OpTypeSampledImage %135 
                      Private f32_4* %149 = OpVariable Private 
                Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                      Private f32_4* %156 = OpVariable Private 
UniformConstant read_only Texture2D* %157 = OpVariable UniformConstant 
            UniformConstant sampler* %159 = OpVariable UniformConstant 
                      Private f32_4* %165 = OpVariable Private 
UniformConstant read_only Texture2D* %180 = OpVariable UniformConstant 
            UniformConstant sampler* %182 = OpVariable UniformConstant 
                                     %194 = OpTypePointer Output %7 
                       Output f32_4* %195 = OpVariable Output 
                        Input f32_4* %197 = OpVariable Input 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                       Function f32_4* %9 = OpVariable Function 
                                f32_4 %13 = OpLoad %11 
                                f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                           Input f32* %19 = OpAccessChain %11 %17 
                                  f32 %20 = OpLoad %19 
                                  f32 %21 = OpFDiv %15 %20 
                                  f32 %22 = OpCompositeExtract %14 0 
                                  f32 %23 = OpCompositeExtract %14 1 
                                  f32 %24 = OpCompositeExtract %14 2 
                                f32_4 %25 = OpCompositeConstruct %22 %23 %24 %21 
                                              OpStore %9 %25 
                                f32_4 %31 = OpLoad vs_TEXCOORD0 
                                f32_4 %32 = OpVectorShuffle %31 %31 2 3 2 2 
                                f32_4 %34 = OpLoad vs_TEXCOORD2 
                                f32_4 %35 = OpVectorShuffle %34 %34 0 1 0 0 
                               bool_4 %36 = OpFOrdGreaterThanEqual %32 %35 
                               bool_2 %38 = OpVectorShuffle %36 %36 0 1 
                               bool_4 %39 = OpLoad %29 
                               bool_4 %40 = OpVectorShuffle %39 %38 4 5 2 3 
                                              OpStore %29 %40 
                                f32_4 %41 = OpLoad vs_TEXCOORD2 
                                f32_4 %42 = OpVectorShuffle %41 %41 2 2 2 3 
                                f32_4 %43 = OpLoad vs_TEXCOORD0 
                                f32_4 %44 = OpVectorShuffle %43 %43 2 2 2 3 
                               bool_4 %45 = OpFOrdGreaterThanEqual %42 %44 
                               bool_2 %46 = OpVectorShuffle %45 %45 2 3 
                               bool_4 %47 = OpLoad %29 
                               bool_4 %48 = OpVectorShuffle %47 %46 0 1 4 5 
                                              OpStore %29 %48 
                               bool_4 %54 = OpLoad %29 
                                f32_4 %55 = OpSelect %54 %53 %52 
                                f32_4 %56 = OpExtInst %1 46 %52 %53 %55 
                                              OpStore %50 %56 
                                f32_4 %58 = OpLoad %50 
                                f32_2 %59 = OpVectorShuffle %58 %58 2 3 
                                f32_4 %60 = OpLoad %50 
                                f32_2 %61 = OpVectorShuffle %60 %60 0 1 
                                f32_2 %62 = OpFAdd %59 %61 
                                f32_4 %63 = OpLoad %50 
                                f32_4 %64 = OpVectorShuffle %63 %62 4 5 2 3 
                                              OpStore %50 %64 
                                f32_4 %67 = OpLoad %9 
                                f32_4 %68 = OpVectorShuffle %67 %67 0 1 0 1 
                       Uniform f32_4* %75 = OpAccessChain %71 %73 
                                f32_4 %76 = OpLoad %75 
                                f32_4 %77 = OpVectorShuffle %76 %76 0 1 0 1 
                               bool_4 %78 = OpFOrdGreaterThanEqual %68 %77 
                               bool_2 %79 = OpVectorShuffle %78 %78 0 1 
                                              OpStore %66 %79 
                               bool_2 %84 = OpLoad %66 
                                f32_2 %85 = OpSelect %84 %83 %82 
                                f32_2 %86 = OpExtInst %1 46 %82 %83 %85 
                                              OpStore %81 %86 
                                f32_2 %87 = OpLoad %81 
                                f32_4 %88 = OpLoad %50 
                                f32_2 %89 = OpVectorShuffle %88 %88 0 1 
                                f32_2 %90 = OpFAdd %87 %89 
                                f32_4 %91 = OpLoad %50 
                                f32_4 %92 = OpVectorShuffle %91 %90 4 5 2 3 
                                              OpStore %50 %92 
                       Uniform f32_4* %93 = OpAccessChain %71 %73 
                                f32_4 %94 = OpLoad %93 
                                f32_4 %95 = OpVectorShuffle %94 %94 2 3 2 3 
                                f32_4 %96 = OpLoad %9 
                                f32_4 %97 = OpVectorShuffle %96 %96 0 1 0 1 
                               bool_4 %98 = OpFOrdGreaterThanEqual %95 %97 
                               bool_2 %99 = OpVectorShuffle %98 %98 0 1 
                                              OpStore %66 %99 
                              bool_2 %100 = OpLoad %66 
                               f32_2 %101 = OpSelect %100 %83 %82 
                               f32_2 %102 = OpExtInst %1 46 %82 %83 %101 
                                              OpStore %81 %102 
                               f32_2 %103 = OpLoad %81 
                               f32_4 %104 = OpLoad %50 
                               f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                               f32_2 %106 = OpFAdd %103 %105 
                               f32_4 %107 = OpLoad %50 
                               f32_4 %108 = OpVectorShuffle %107 %106 4 5 2 3 
                                              OpStore %50 %108 
                        Private f32* %111 = OpAccessChain %50 %109 
                                              OpStore %111 %15 
                               f32_4 %112 = OpLoad %50 
                               f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                                 f32 %116 = OpDot %113 %115 
                        Private f32* %118 = OpAccessChain %50 %117 
                                              OpStore %118 %116 
                        Private f32* %119 = OpAccessChain %50 %117 
                                 f32 %120 = OpLoad %119 
                                bool %121 = OpFOrdLessThan %120 %51 
                       Private bool* %123 = OpAccessChain %29 %117 
                                              OpStore %123 %121 
                       Private bool* %124 = OpAccessChain %29 %117 
                                bool %125 = OpLoad %124 
                                 i32 %127 = OpSelect %125 %126 %73 
                                 i32 %129 = OpIMul %127 %128 
                                bool %130 = OpINotEqual %129 %73 
                                              OpSelectionMerge %132 None 
                                              OpBranchConditional %130 %131 %132 
                                     %131 = OpLabel 
                                              OpKill
                                     %132 = OpLabel 
                 read_only Texture2D %138 = OpLoad %137 
                             sampler %142 = OpLoad %141 
          read_only Texture2DSampled %144 = OpSampledImage %138 %142 
                               f32_4 %145 = OpLoad vs_TEXCOORD0 
                               f32_2 %146 = OpVectorShuffle %145 %145 0 1 
                               f32_4 %147 = OpImageSampleImplicitLod %144 %146 
                                 f32 %148 = OpCompositeExtract %147 3 
                                              OpStore %134 %148 
                                 f32 %150 = OpLoad %134 
                          Input f32* %152 = OpAccessChain vs_TEXCOORD1 %117 
                                 f32 %153 = OpLoad %152 
                                 f32 %154 = OpFMul %150 %153 
                        Private f32* %155 = OpAccessChain %149 %17 
                                              OpStore %155 %154 
                 read_only Texture2D %158 = OpLoad %157 
                             sampler %160 = OpLoad %159 
          read_only Texture2DSampled %161 = OpSampledImage %158 %160 
                               f32_4 %162 = OpLoad vs_TEXCOORD0 
                               f32_2 %163 = OpVectorShuffle %162 %162 0 1 
                               f32_4 %164 = OpImageSampleImplicitLod %161 %163 
                                              OpStore %156 %164 
                               f32_4 %166 = OpLoad %156 
                               f32_4 %167 = OpLoad vs_TEXCOORD1 
                               f32_4 %168 = OpVectorShuffle %167 %167 1 1 1 1 
                               f32_4 %169 = OpFMul %166 %168 
                               f32_4 %170 = OpLoad vs_TEXCOORD1 
                               f32_4 %171 = OpVectorShuffle %170 %170 3 3 3 3 
                               f32_4 %172 = OpFAdd %169 %171 
                                              OpStore %165 %172 
                               f32_4 %173 = OpLoad vs_TEXCOORD1 
                               f32_3 %174 = OpVectorShuffle %173 %173 0 0 0 
                               f32_4 %175 = OpLoad %149 
                               f32_4 %176 = OpVectorShuffle %175 %174 4 5 6 3 
                                              OpStore %149 %176 
                               f32_4 %177 = OpLoad %149 
                               f32_4 %178 = OpLoad %165 
                               f32_4 %179 = OpFAdd %177 %178 
                                              OpStore %149 %179 
                 read_only Texture2D %181 = OpLoad %180 
                             sampler %183 = OpLoad %182 
          read_only Texture2DSampled %184 = OpSampledImage %181 %183 
                               f32_4 %185 = OpLoad vs_TEXCOORD0 
                               f32_2 %186 = OpVectorShuffle %185 %185 0 1 
                               f32_4 %187 = OpImageSampleImplicitLod %184 %186 
                                              OpStore %156 %187 
                               f32_4 %188 = OpLoad %156 
                               f32_4 %189 = OpLoad vs_TEXCOORD1 
                               f32_4 %190 = OpVectorShuffle %189 %189 2 2 2 2 
                               f32_4 %191 = OpFMul %188 %190 
                               f32_4 %192 = OpLoad %149 
                               f32_4 %193 = OpFAdd %191 %192 
                                              OpStore %149 %193 
                               f32_4 %196 = OpLoad %149 
                               f32_4 %198 = OpLoad %197 
                               f32_4 %199 = OpFMul %196 %198 
                                              OpStore %195 %199 
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
 Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZTest GEqual
  ZWrite Off
  Cull Off
  Stencil {
   Ref 255
   CompFront Disabled
   PassFront Keep
   FailFront Keep
   ZFailFront Keep
   CompBack Disabled
   PassBack Keep
   FailBack Keep
   ZFailBack Keep
  }
  GpuProgramID 70470
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _Color;
uniform 	vec4 _1PixelClipInvView;
uniform 	vec4 _Transforms[80];
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
flat out mediump vec4 vs_TEXCOORD1;
flat out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
int u_xlati0;
uvec4 u_xlatu0;
bool u_xlatb0;
vec4 u_xlat1;
ivec4 u_xlati1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec2 u_xlat5;
vec2 u_xlat6;
vec2 u_xlat13;
void main()
{
    u_xlat0.x = in_TEXCOORD1.x * 4.0;
    u_xlat0.yzw = in_TEXCOORD1.xxy * vec3(4.0, 4.0, 4.0) + vec3(1.0, 2.0, 3.0);
    u_xlatu0 = uvec4(u_xlat0);
    u_xlati1 = ivec4(uvec4(equal(in_TEXCOORD1.zzzz, vec4(4.0, 3.0, 2.0, 1.0))) * 0xFFFFFFFFu);
    u_xlat2.xyz = uintBitsToFloat(uvec3(uint(u_xlati1.w) & uint(1065353216u), uint(u_xlati1.z) & uint(1065353216u), uint(u_xlati1.y) & uint(1065353216u)));
    if(u_xlati1.x != 0) {
        u_xlat3.x = dot(_Transforms[int(u_xlatu0.x)].xy, in_TEXCOORD0.xy);
        u_xlat3.y = dot(_Transforms[int(u_xlatu0.y)].xy, in_TEXCOORD0.xy);
        u_xlat13.xy = u_xlat3.xy * _1PixelClipInvView.zw;
        u_xlat1.x = dot(u_xlat13.xy, u_xlat13.xy);
        u_xlat1.x = sqrt(u_xlat1.x);
        u_xlat13.x = max(u_xlat1.x, 1.0);
        u_xlat13.x = roundEven(u_xlat13.x);
        u_xlat1.x = u_xlat1.x + 9.99999997e-07;
        u_xlat1.x = u_xlat13.x / u_xlat1.x;
        u_xlat1.x = u_xlat1.x + -1.0;
        u_xlat3.xy = u_xlat3.xy * u_xlat1.xx;
    } else {
        u_xlat3.x = float(0.0);
        u_xlat3.y = float(0.0);
    }
    u_xlat13.x = dot(_Transforms[int(u_xlatu0.x)], in_POSITION0);
    u_xlat13.y = dot(_Transforms[int(u_xlatu0.y)], in_POSITION0);
    u_xlat0.x = dot(_Transforms[int(u_xlatu0.z)], in_POSITION0);
    u_xlat5.xy = u_xlat3.xy + u_xlat13.xy;
    u_xlat3 = u_xlat5.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat5.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = u_xlat3 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat4 = u_xlat3.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat3.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat3.zzzz + u_xlat4;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat3.wwww + u_xlat4;
    u_xlat4.xy = u_xlat3.xy + vec2(1.0, 1.0);
    u_xlat4.xy = u_xlat4.xy / _1PixelClipInvView.xy;
    u_xlat4.xy = u_xlat4.xy + vec2(0.50999999, 0.50999999);
    u_xlat4.xy = trunc(u_xlat4.xy);
    u_xlat4.xy = u_xlat4.xy * _1PixelClipInvView.xy + vec2(-1.0, -1.0);
    gl_Position.xy = (u_xlati1.w != 0) ? u_xlat4.xy : u_xlat3.xy;
    u_xlat1.xw = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlati1.y==0);
#else
    u_xlatb0 = u_xlati1.y==0;
#endif
    u_xlati0 = u_xlatb0 ? u_xlati1.z : int(0);
    u_xlat6.xy = u_xlat1.xw * _MainTex_TexelSize.xy;
    vs_TEXCOORD0.xy = (int(u_xlati0) != 0) ? u_xlat6.xy : u_xlat1.xw;
    u_xlat1 = in_COLOR0 * _Color;
    u_xlat0.x = u_xlat2.y + u_xlat2.x;
    u_xlat0.x = u_xlat2.z + u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat2.w = (-u_xlat0.x) + 1.0;
    gl_Position.zw = u_xlat3.zw;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.zw = u_xlat5.xy;
    vs_TEXCOORD1 = u_xlat2;
    vs_TEXCOORD2 = _Transforms[int(u_xlatu0.w)];
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
uniform 	vec4 _PixelClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FontTex;
UNITY_LOCATION(2) uniform mediump sampler2D _CustomTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
flat in mediump vec4 vs_TEXCOORD1;
flat in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec4 u_xlatb0;
mediump vec4 u_xlat16_1;
vec2 u_xlat4;
bvec2 u_xlatb4;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD0.zwzz, vs_TEXCOORD2.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(vs_TEXCOORD2.zzzw, vs_TEXCOORD0.zzzw).zw;
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlat0.xy = u_xlat0.zw + u_xlat0.xy;
    u_xlatb4.xy = greaterThanEqual(hlslcc_FragCoord.xyxy, _PixelClipRect.xyxy).xy;
    u_xlat4.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb4.xy));
    u_xlat0.xy = u_xlat4.xy + u_xlat0.xy;
    u_xlatb4.xy = greaterThanEqual(_PixelClipRect.zwzw, hlslcc_FragCoord.xyxy).xy;
    u_xlat4.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb4.xy));
    u_xlat0.xy = u_xlat4.xy + u_xlat0.xy;
    u_xlat0.z = 1.0;
    u_xlat0.x = dot(u_xlat0.xyz, vec3(1.0, 1.0, -7.94999981));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat0.x<0.0);
#else
    u_xlatb0.x = u_xlat0.x<0.0;
#endif
    if(((int(u_xlatb0.x) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_0.x = texture(_FontTex, vs_TEXCOORD0.xy).w;
    u_xlat16_0.w = u_xlat16_0.x * vs_TEXCOORD1.x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat16_1 * vs_TEXCOORD1.yyyy + vs_TEXCOORD1.wwww;
    u_xlat16_0.xyz = vs_TEXCOORD1.xxx;
    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
    u_xlat16_1 = texture(_CustomTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_1 * vs_TEXCOORD1.zzzz + u_xlat16_0;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _Color;
uniform 	vec4 _1PixelClipInvView;
uniform 	vec4 _Transforms[80];
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
flat out mediump vec4 vs_TEXCOORD1;
flat out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
int u_xlati0;
uvec4 u_xlatu0;
bool u_xlatb0;
vec4 u_xlat1;
ivec4 u_xlati1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec2 u_xlat5;
vec2 u_xlat6;
vec2 u_xlat13;
void main()
{
    u_xlat0.x = in_TEXCOORD1.x * 4.0;
    u_xlat0.yzw = in_TEXCOORD1.xxy * vec3(4.0, 4.0, 4.0) + vec3(1.0, 2.0, 3.0);
    u_xlatu0 = uvec4(u_xlat0);
    u_xlati1 = ivec4(uvec4(equal(in_TEXCOORD1.zzzz, vec4(4.0, 3.0, 2.0, 1.0))) * 0xFFFFFFFFu);
    u_xlat2.xyz = uintBitsToFloat(uvec3(uint(u_xlati1.w) & uint(1065353216u), uint(u_xlati1.z) & uint(1065353216u), uint(u_xlati1.y) & uint(1065353216u)));
    if(u_xlati1.x != 0) {
        u_xlat3.x = dot(_Transforms[int(u_xlatu0.x)].xy, in_TEXCOORD0.xy);
        u_xlat3.y = dot(_Transforms[int(u_xlatu0.y)].xy, in_TEXCOORD0.xy);
        u_xlat13.xy = u_xlat3.xy * _1PixelClipInvView.zw;
        u_xlat1.x = dot(u_xlat13.xy, u_xlat13.xy);
        u_xlat1.x = sqrt(u_xlat1.x);
        u_xlat13.x = max(u_xlat1.x, 1.0);
        u_xlat13.x = roundEven(u_xlat13.x);
        u_xlat1.x = u_xlat1.x + 9.99999997e-07;
        u_xlat1.x = u_xlat13.x / u_xlat1.x;
        u_xlat1.x = u_xlat1.x + -1.0;
        u_xlat3.xy = u_xlat3.xy * u_xlat1.xx;
    } else {
        u_xlat3.x = float(0.0);
        u_xlat3.y = float(0.0);
    }
    u_xlat13.x = dot(_Transforms[int(u_xlatu0.x)], in_POSITION0);
    u_xlat13.y = dot(_Transforms[int(u_xlatu0.y)], in_POSITION0);
    u_xlat0.x = dot(_Transforms[int(u_xlatu0.z)], in_POSITION0);
    u_xlat5.xy = u_xlat3.xy + u_xlat13.xy;
    u_xlat3 = u_xlat5.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat5.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = u_xlat3 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat4 = u_xlat3.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat3.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat3.zzzz + u_xlat4;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat3.wwww + u_xlat4;
    u_xlat4.xy = u_xlat3.xy + vec2(1.0, 1.0);
    u_xlat4.xy = u_xlat4.xy / _1PixelClipInvView.xy;
    u_xlat4.xy = u_xlat4.xy + vec2(0.50999999, 0.50999999);
    u_xlat4.xy = trunc(u_xlat4.xy);
    u_xlat4.xy = u_xlat4.xy * _1PixelClipInvView.xy + vec2(-1.0, -1.0);
    gl_Position.xy = (u_xlati1.w != 0) ? u_xlat4.xy : u_xlat3.xy;
    u_xlat1.xw = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlati1.y==0);
#else
    u_xlatb0 = u_xlati1.y==0;
#endif
    u_xlati0 = u_xlatb0 ? u_xlati1.z : int(0);
    u_xlat6.xy = u_xlat1.xw * _MainTex_TexelSize.xy;
    vs_TEXCOORD0.xy = (int(u_xlati0) != 0) ? u_xlat6.xy : u_xlat1.xw;
    u_xlat1 = in_COLOR0 * _Color;
    u_xlat0.x = u_xlat2.y + u_xlat2.x;
    u_xlat0.x = u_xlat2.z + u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat2.w = (-u_xlat0.x) + 1.0;
    gl_Position.zw = u_xlat3.zw;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.zw = u_xlat5.xy;
    vs_TEXCOORD1 = u_xlat2;
    vs_TEXCOORD2 = _Transforms[int(u_xlatu0.w)];
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
uniform 	vec4 _PixelClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FontTex;
UNITY_LOCATION(2) uniform mediump sampler2D _CustomTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
flat in mediump vec4 vs_TEXCOORD1;
flat in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec4 u_xlatb0;
mediump vec4 u_xlat16_1;
vec2 u_xlat4;
bvec2 u_xlatb4;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD0.zwzz, vs_TEXCOORD2.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(vs_TEXCOORD2.zzzw, vs_TEXCOORD0.zzzw).zw;
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlat0.xy = u_xlat0.zw + u_xlat0.xy;
    u_xlatb4.xy = greaterThanEqual(hlslcc_FragCoord.xyxy, _PixelClipRect.xyxy).xy;
    u_xlat4.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb4.xy));
    u_xlat0.xy = u_xlat4.xy + u_xlat0.xy;
    u_xlatb4.xy = greaterThanEqual(_PixelClipRect.zwzw, hlslcc_FragCoord.xyxy).xy;
    u_xlat4.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb4.xy));
    u_xlat0.xy = u_xlat4.xy + u_xlat0.xy;
    u_xlat0.z = 1.0;
    u_xlat0.x = dot(u_xlat0.xyz, vec3(1.0, 1.0, -7.94999981));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat0.x<0.0);
#else
    u_xlatb0.x = u_xlat0.x<0.0;
#endif
    if(((int(u_xlatb0.x) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_0.x = texture(_FontTex, vs_TEXCOORD0.xy).w;
    u_xlat16_0.w = u_xlat16_0.x * vs_TEXCOORD1.x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat16_1 * vs_TEXCOORD1.yyyy + vs_TEXCOORD1.wwww;
    u_xlat16_0.xyz = vs_TEXCOORD1.xxx;
    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
    u_xlat16_1 = texture(_CustomTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_1 * vs_TEXCOORD1.zzzz + u_xlat16_0;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _Color;
uniform 	vec4 _1PixelClipInvView;
uniform 	vec4 _Transforms[80];
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
flat out mediump vec4 vs_TEXCOORD1;
flat out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
int u_xlati0;
uvec4 u_xlatu0;
bool u_xlatb0;
vec4 u_xlat1;
ivec4 u_xlati1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec2 u_xlat5;
vec2 u_xlat6;
vec2 u_xlat13;
void main()
{
    u_xlat0.x = in_TEXCOORD1.x * 4.0;
    u_xlat0.yzw = in_TEXCOORD1.xxy * vec3(4.0, 4.0, 4.0) + vec3(1.0, 2.0, 3.0);
    u_xlatu0 = uvec4(u_xlat0);
    u_xlati1 = ivec4(uvec4(equal(in_TEXCOORD1.zzzz, vec4(4.0, 3.0, 2.0, 1.0))) * 0xFFFFFFFFu);
    u_xlat2.xyz = uintBitsToFloat(uvec3(uint(u_xlati1.w) & uint(1065353216u), uint(u_xlati1.z) & uint(1065353216u), uint(u_xlati1.y) & uint(1065353216u)));
    if(u_xlati1.x != 0) {
        u_xlat3.x = dot(_Transforms[int(u_xlatu0.x)].xy, in_TEXCOORD0.xy);
        u_xlat3.y = dot(_Transforms[int(u_xlatu0.y)].xy, in_TEXCOORD0.xy);
        u_xlat13.xy = u_xlat3.xy * _1PixelClipInvView.zw;
        u_xlat1.x = dot(u_xlat13.xy, u_xlat13.xy);
        u_xlat1.x = sqrt(u_xlat1.x);
        u_xlat13.x = max(u_xlat1.x, 1.0);
        u_xlat13.x = roundEven(u_xlat13.x);
        u_xlat1.x = u_xlat1.x + 9.99999997e-07;
        u_xlat1.x = u_xlat13.x / u_xlat1.x;
        u_xlat1.x = u_xlat1.x + -1.0;
        u_xlat3.xy = u_xlat3.xy * u_xlat1.xx;
    } else {
        u_xlat3.x = float(0.0);
        u_xlat3.y = float(0.0);
    }
    u_xlat13.x = dot(_Transforms[int(u_xlatu0.x)], in_POSITION0);
    u_xlat13.y = dot(_Transforms[int(u_xlatu0.y)], in_POSITION0);
    u_xlat0.x = dot(_Transforms[int(u_xlatu0.z)], in_POSITION0);
    u_xlat5.xy = u_xlat3.xy + u_xlat13.xy;
    u_xlat3 = u_xlat5.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat5.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = u_xlat3 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat4 = u_xlat3.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat3.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat3.zzzz + u_xlat4;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat3.wwww + u_xlat4;
    u_xlat4.xy = u_xlat3.xy + vec2(1.0, 1.0);
    u_xlat4.xy = u_xlat4.xy / _1PixelClipInvView.xy;
    u_xlat4.xy = u_xlat4.xy + vec2(0.50999999, 0.50999999);
    u_xlat4.xy = trunc(u_xlat4.xy);
    u_xlat4.xy = u_xlat4.xy * _1PixelClipInvView.xy + vec2(-1.0, -1.0);
    gl_Position.xy = (u_xlati1.w != 0) ? u_xlat4.xy : u_xlat3.xy;
    u_xlat1.xw = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlati1.y==0);
#else
    u_xlatb0 = u_xlati1.y==0;
#endif
    u_xlati0 = u_xlatb0 ? u_xlati1.z : int(0);
    u_xlat6.xy = u_xlat1.xw * _MainTex_TexelSize.xy;
    vs_TEXCOORD0.xy = (int(u_xlati0) != 0) ? u_xlat6.xy : u_xlat1.xw;
    u_xlat1 = in_COLOR0 * _Color;
    u_xlat0.x = u_xlat2.y + u_xlat2.x;
    u_xlat0.x = u_xlat2.z + u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat2.w = (-u_xlat0.x) + 1.0;
    gl_Position.zw = u_xlat3.zw;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.zw = u_xlat5.xy;
    vs_TEXCOORD1 = u_xlat2;
    vs_TEXCOORD2 = _Transforms[int(u_xlatu0.w)];
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
uniform 	vec4 _PixelClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FontTex;
UNITY_LOCATION(2) uniform mediump sampler2D _CustomTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
flat in mediump vec4 vs_TEXCOORD1;
flat in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec4 u_xlatb0;
mediump vec4 u_xlat16_1;
vec2 u_xlat4;
bvec2 u_xlatb4;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD0.zwzz, vs_TEXCOORD2.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(vs_TEXCOORD2.zzzw, vs_TEXCOORD0.zzzw).zw;
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlat0.xy = u_xlat0.zw + u_xlat0.xy;
    u_xlatb4.xy = greaterThanEqual(hlslcc_FragCoord.xyxy, _PixelClipRect.xyxy).xy;
    u_xlat4.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb4.xy));
    u_xlat0.xy = u_xlat4.xy + u_xlat0.xy;
    u_xlatb4.xy = greaterThanEqual(_PixelClipRect.zwzw, hlslcc_FragCoord.xyxy).xy;
    u_xlat4.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb4.xy));
    u_xlat0.xy = u_xlat4.xy + u_xlat0.xy;
    u_xlat0.z = 1.0;
    u_xlat0.x = dot(u_xlat0.xyz, vec3(1.0, 1.0, -7.94999981));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat0.x<0.0);
#else
    u_xlatb0.x = u_xlat0.x<0.0;
#endif
    if(((int(u_xlatb0.x) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_0.x = texture(_FontTex, vs_TEXCOORD0.xy).w;
    u_xlat16_0.w = u_xlat16_0.x * vs_TEXCOORD1.x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat16_1 * vs_TEXCOORD1.yyyy + vs_TEXCOORD1.wwww;
    u_xlat16_0.xyz = vs_TEXCOORD1.xxx;
    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
    u_xlat16_1 = texture(_CustomTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_1 * vs_TEXCOORD1.zzzz + u_xlat16_0;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 401
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %12 %95 %167 %285 %337 %350 %382 %387 %389 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %77 ArrayStride 77 
                                                      OpDecorate %78 ArrayStride 78 
                                                      OpDecorate %80 ArrayStride 80 
                                                      OpMemberDecorate %81 0 Offset 81 
                                                      OpMemberDecorate %81 1 Offset 81 
                                                      OpMemberDecorate %81 2 Offset 81 
                                                      OpMemberDecorate %81 3 Offset 81 
                                                      OpMemberDecorate %81 4 RelaxedPrecision 
                                                      OpMemberDecorate %81 4 Offset 81 
                                                      OpMemberDecorate %81 5 Offset 81 
                                                      OpMemberDecorate %81 6 Offset 81 
                                                      OpDecorate %81 Block 
                                                      OpDecorate %83 DescriptorSet 83 
                                                      OpDecorate %83 Binding 83 
                                                      OpDecorate %95 Location 95 
                                                      OpDecorate %167 Location 167 
                                                      OpMemberDecorate %283 0 BuiltIn 283 
                                                      OpMemberDecorate %283 1 BuiltIn 283 
                                                      OpMemberDecorate %283 2 BuiltIn 283 
                                                      OpDecorate %283 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 337 
                                                      OpDecorate %350 Location 350 
                                                      OpDecorate %354 RelaxedPrecision 
                                                      OpDecorate %382 RelaxedPrecision 
                                                      OpDecorate %382 Location 382 
                                                      OpDecorate vs_TEXCOORD1 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Flat 
                                                      OpDecorate vs_TEXCOORD1 Location 387 
                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 Flat 
                                                      OpDecorate vs_TEXCOORD2 Location 389 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %13 = OpTypeInt 32 0 
                                          u32 %14 = OpConstant 0 
                                              %15 = OpTypePointer Input %6 
                                          f32 %18 = OpConstant 3.674022E-40 
                                              %20 = OpTypePointer Private %6 
                                        f32_3 %24 = OpConstantComposite %18 %18 %18 
                                          f32 %26 = OpConstant 3.674022E-40 
                                          f32 %27 = OpConstant 3.674022E-40 
                                          f32 %28 = OpConstant 3.674022E-40 
                                        f32_3 %29 = OpConstantComposite %26 %27 %28 
                                              %33 = OpTypeVector %13 4 
                                              %34 = OpTypePointer Private %33 
                               Private u32_4* %35 = OpVariable Private 
                                              %38 = OpTypeInt 32 1 
                                              %39 = OpTypeVector %38 4 
                                              %40 = OpTypePointer Private %39 
                               Private i32_4* %41 = OpVariable Private 
                                        f32_4 %44 = OpConstantComposite %18 %28 %27 %26 
                                              %45 = OpTypeBool 
                                              %46 = OpTypeVector %45 4 
                                          u32 %48 = OpConstant 1 
                                        u32_4 %49 = OpConstantComposite %14 %14 %14 %14 
                                        u32_4 %50 = OpConstantComposite %48 %48 %48 %48 
                                          u32 %52 = OpConstant 4294967295 
                               Private f32_4* %56 = OpVariable Private 
                                              %57 = OpTypeVector %38 3 
                                              %60 = OpTypeVector %13 3 
                                          u32 %62 = OpConstant 1065353216 
                                        u32_3 %63 = OpConstantComposite %62 %62 %62 
                                              %68 = OpTypePointer Private %38 
                                          i32 %71 = OpConstant 0 
                               Private f32_4* %75 = OpVariable Private 
                                          u32 %76 = OpConstant 4 
                                              %77 = OpTypeArray %7 %76 
                                              %78 = OpTypeArray %7 %76 
                                          u32 %79 = OpConstant 80 
                                              %80 = OpTypeArray %7 %79 
                                              %81 = OpTypeStruct %77 %78 %7 %7 %7 %7 %80 
                                              %82 = OpTypePointer Uniform %81 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32_4; f32_4[80];}* %83 = OpVariable Uniform 
                                          i32 %84 = OpConstant 6 
                                              %85 = OpTypePointer Private %13 
                                              %89 = OpTypeVector %6 2 
                                              %90 = OpTypePointer Uniform %7 
                                              %94 = OpTypePointer Input %89 
                                 Input f32_2* %95 = OpVariable Input 
                                             %108 = OpTypePointer Private %89 
                              Private f32_2* %109 = OpVariable Private 
                                         i32 %112 = OpConstant 5 
                              Private f32_4* %117 = OpVariable Private 
                                         f32 %136 = OpConstant 3.674022E-40 
                                         f32 %147 = OpConstant 3.674022E-40 
                                         f32 %158 = OpConstant 3.674022E-40 
                                             %166 = OpTypePointer Input %7 
                                Input f32_4* %167 = OpVariable Input 
                                         u32 %179 = OpConstant 2 
                              Private f32_2* %188 = OpVariable Private 
                                         i32 %195 = OpConstant 1 
                                         i32 %206 = OpConstant 2 
                                         i32 %215 = OpConstant 3 
                              Private f32_4* %219 = OpVariable Private 
                                       f32_2 %248 = OpConstantComposite %26 %26 
                                         f32 %262 = OpConstant 3.674022E-40 
                                       f32_2 %263 = OpConstantComposite %262 %262 
                                       f32_2 %278 = OpConstantComposite %147 %147 
                                             %282 = OpTypeArray %6 %48 
                                             %283 = OpTypeStruct %7 %6 %282 
                                             %284 = OpTypePointer Output %283 
        Output struct {f32_4; f32; f32[1];}* %285 = OpVariable Output 
                                         u32 %286 = OpConstant 3 
                                             %290 = OpTypePointer Function %89 
                                             %300 = OpTypePointer Output %7 
                                             %315 = OpTypePointer Private %45 
                               Private bool* %316 = OpVariable Private 
                                Private i32* %320 = OpVariable Private 
                                             %322 = OpTypePointer Function %38 
                              Private f32_2* %330 = OpVariable Private 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_4* %350 = OpVariable Input 
                                         i32 %352 = OpConstant 4 
                               Output f32_4* %382 = OpVariable Output 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                             %395 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_2* %291 = OpVariable Function 
                               Function i32* %323 = OpVariable Function 
                             Function f32_2* %340 = OpVariable Function 
                                   Input f32* %16 = OpAccessChain %12 %14 
                                          f32 %17 = OpLoad %16 
                                          f32 %19 = OpFMul %17 %18 
                                 Private f32* %21 = OpAccessChain %9 %14 
                                                      OpStore %21 %19 
                                        f32_3 %22 = OpLoad %12 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 0 1 
                                        f32_3 %25 = OpFMul %23 %24 
                                        f32_3 %30 = OpFAdd %25 %29 
                                        f32_4 %31 = OpLoad %9 
                                        f32_4 %32 = OpVectorShuffle %31 %30 0 4 5 6 
                                                      OpStore %9 %32 
                                        f32_4 %36 = OpLoad %9 
                                        u32_4 %37 = OpConvertFToU %36 
                                                      OpStore %35 %37 
                                        f32_3 %42 = OpLoad %12 
                                        f32_4 %43 = OpVectorShuffle %42 %42 2 2 2 2 
                                       bool_4 %47 = OpFOrdEqual %43 %44 
                                        u32_4 %51 = OpSelect %47 %50 %49 
                                        u32_4 %53 = OpCompositeConstruct %52 %52 %52 %52 
                                        u32_4 %54 = OpIMul %51 %53 
                                        i32_4 %55 = OpBitcast %54 
                                                      OpStore %41 %55 
                                        i32_4 %58 = OpLoad %41 
                                        i32_3 %59 = OpVectorShuffle %58 %58 3 2 1 
                                        u32_3 %61 = OpBitcast %59 
                                        u32_3 %64 = OpBitwiseAnd %61 %63 
                                        f32_3 %65 = OpBitcast %64 
                                        f32_4 %66 = OpLoad %56 
                                        f32_4 %67 = OpVectorShuffle %66 %65 4 5 6 3 
                                                      OpStore %56 %67 
                                 Private i32* %69 = OpAccessChain %41 %14 
                                          i32 %70 = OpLoad %69 
                                         bool %72 = OpINotEqual %70 %71 
                                                      OpSelectionMerge %74 None 
                                                      OpBranchConditional %72 %73 %157 
                                              %73 = OpLabel 
                                 Private u32* %86 = OpAccessChain %35 %14 
                                          u32 %87 = OpLoad %86 
                                          i32 %88 = OpBitcast %87 
                               Uniform f32_4* %91 = OpAccessChain %83 %84 %88 
                                        f32_4 %92 = OpLoad %91 
                                        f32_2 %93 = OpVectorShuffle %92 %92 0 1 
                                        f32_2 %96 = OpLoad %95 
                                          f32 %97 = OpDot %93 %96 
                                 Private f32* %98 = OpAccessChain %75 %14 
                                                      OpStore %98 %97 
                                 Private u32* %99 = OpAccessChain %35 %48 
                                         u32 %100 = OpLoad %99 
                                         i32 %101 = OpBitcast %100 
                              Uniform f32_4* %102 = OpAccessChain %83 %84 %101 
                                       f32_4 %103 = OpLoad %102 
                                       f32_2 %104 = OpVectorShuffle %103 %103 0 1 
                                       f32_2 %105 = OpLoad %95 
                                         f32 %106 = OpDot %104 %105 
                                Private f32* %107 = OpAccessChain %75 %48 
                                                      OpStore %107 %106 
                                       f32_4 %110 = OpLoad %75 
                                       f32_2 %111 = OpVectorShuffle %110 %110 0 1 
                              Uniform f32_4* %113 = OpAccessChain %83 %112 
                                       f32_4 %114 = OpLoad %113 
                                       f32_2 %115 = OpVectorShuffle %114 %114 2 3 
                                       f32_2 %116 = OpFMul %111 %115 
                                                      OpStore %109 %116 
                                       f32_2 %118 = OpLoad %109 
                                       f32_2 %119 = OpLoad %109 
                                         f32 %120 = OpDot %118 %119 
                                Private f32* %121 = OpAccessChain %117 %14 
                                                      OpStore %121 %120 
                                Private f32* %122 = OpAccessChain %117 %14 
                                         f32 %123 = OpLoad %122 
                                         f32 %124 = OpExtInst %1 31 %123 
                                Private f32* %125 = OpAccessChain %117 %14 
                                                      OpStore %125 %124 
                                Private f32* %126 = OpAccessChain %117 %14 
                                         f32 %127 = OpLoad %126 
                                         f32 %128 = OpExtInst %1 40 %127 %26 
                                Private f32* %129 = OpAccessChain %109 %14 
                                                      OpStore %129 %128 
                                Private f32* %130 = OpAccessChain %109 %14 
                                         f32 %131 = OpLoad %130 
                                         f32 %132 = OpExtInst %1 2 %131 
                                Private f32* %133 = OpAccessChain %109 %14 
                                                      OpStore %133 %132 
                                Private f32* %134 = OpAccessChain %117 %14 
                                         f32 %135 = OpLoad %134 
                                         f32 %137 = OpFAdd %135 %136 
                                Private f32* %138 = OpAccessChain %117 %14 
                                                      OpStore %138 %137 
                                Private f32* %139 = OpAccessChain %109 %14 
                                         f32 %140 = OpLoad %139 
                                Private f32* %141 = OpAccessChain %117 %14 
                                         f32 %142 = OpLoad %141 
                                         f32 %143 = OpFDiv %140 %142 
                                Private f32* %144 = OpAccessChain %117 %14 
                                                      OpStore %144 %143 
                                Private f32* %145 = OpAccessChain %117 %14 
                                         f32 %146 = OpLoad %145 
                                         f32 %148 = OpFAdd %146 %147 
                                Private f32* %149 = OpAccessChain %117 %14 
                                                      OpStore %149 %148 
                                       f32_4 %150 = OpLoad %75 
                                       f32_2 %151 = OpVectorShuffle %150 %150 0 1 
                                       f32_4 %152 = OpLoad %117 
                                       f32_2 %153 = OpVectorShuffle %152 %152 0 0 
                                       f32_2 %154 = OpFMul %151 %153 
                                       f32_4 %155 = OpLoad %75 
                                       f32_4 %156 = OpVectorShuffle %155 %154 4 5 2 3 
                                                      OpStore %75 %156 
                                                      OpBranch %74 
                                             %157 = OpLabel 
                                Private f32* %159 = OpAccessChain %75 %14 
                                                      OpStore %159 %158 
                                Private f32* %160 = OpAccessChain %75 %48 
                                                      OpStore %160 %158 
                                                      OpBranch %74 
                                              %74 = OpLabel 
                                Private u32* %161 = OpAccessChain %35 %14 
                                         u32 %162 = OpLoad %161 
                                         i32 %163 = OpBitcast %162 
                              Uniform f32_4* %164 = OpAccessChain %83 %84 %163 
                                       f32_4 %165 = OpLoad %164 
                                       f32_4 %168 = OpLoad %167 
                                         f32 %169 = OpDot %165 %168 
                                Private f32* %170 = OpAccessChain %109 %14 
                                                      OpStore %170 %169 
                                Private u32* %171 = OpAccessChain %35 %48 
                                         u32 %172 = OpLoad %171 
                                         i32 %173 = OpBitcast %172 
                              Uniform f32_4* %174 = OpAccessChain %83 %84 %173 
                                       f32_4 %175 = OpLoad %174 
                                       f32_4 %176 = OpLoad %167 
                                         f32 %177 = OpDot %175 %176 
                                Private f32* %178 = OpAccessChain %109 %48 
                                                      OpStore %178 %177 
                                Private u32* %180 = OpAccessChain %35 %179 
                                         u32 %181 = OpLoad %180 
                                         i32 %182 = OpBitcast %181 
                              Uniform f32_4* %183 = OpAccessChain %83 %84 %182 
                                       f32_4 %184 = OpLoad %183 
                                       f32_4 %185 = OpLoad %167 
                                         f32 %186 = OpDot %184 %185 
                                Private f32* %187 = OpAccessChain %9 %14 
                                                      OpStore %187 %186 
                                       f32_4 %189 = OpLoad %75 
                                       f32_2 %190 = OpVectorShuffle %189 %189 0 1 
                                       f32_2 %191 = OpLoad %109 
                                       f32_2 %192 = OpFAdd %190 %191 
                                                      OpStore %188 %192 
                                       f32_2 %193 = OpLoad %188 
                                       f32_4 %194 = OpVectorShuffle %193 %193 1 1 1 1 
                              Uniform f32_4* %196 = OpAccessChain %83 %71 %195 
                                       f32_4 %197 = OpLoad %196 
                                       f32_4 %198 = OpFMul %194 %197 
                                                      OpStore %75 %198 
                              Uniform f32_4* %199 = OpAccessChain %83 %71 %71 
                                       f32_4 %200 = OpLoad %199 
                                       f32_2 %201 = OpLoad %188 
                                       f32_4 %202 = OpVectorShuffle %201 %201 0 0 0 0 
                                       f32_4 %203 = OpFMul %200 %202 
                                       f32_4 %204 = OpLoad %75 
                                       f32_4 %205 = OpFAdd %203 %204 
                                                      OpStore %75 %205 
                              Uniform f32_4* %207 = OpAccessChain %83 %71 %206 
                                       f32_4 %208 = OpLoad %207 
                                       f32_4 %209 = OpLoad %9 
                                       f32_4 %210 = OpVectorShuffle %209 %209 0 0 0 0 
                                       f32_4 %211 = OpFMul %208 %210 
                                       f32_4 %212 = OpLoad %75 
                                       f32_4 %213 = OpFAdd %211 %212 
                                                      OpStore %75 %213 
                                       f32_4 %214 = OpLoad %75 
                              Uniform f32_4* %216 = OpAccessChain %83 %71 %215 
                                       f32_4 %217 = OpLoad %216 
                                       f32_4 %218 = OpFAdd %214 %217 
                                                      OpStore %75 %218 
                                       f32_4 %220 = OpLoad %75 
                                       f32_4 %221 = OpVectorShuffle %220 %220 1 1 1 1 
                              Uniform f32_4* %222 = OpAccessChain %83 %195 %195 
                                       f32_4 %223 = OpLoad %222 
                                       f32_4 %224 = OpFMul %221 %223 
                                                      OpStore %219 %224 
                              Uniform f32_4* %225 = OpAccessChain %83 %195 %71 
                                       f32_4 %226 = OpLoad %225 
                                       f32_4 %227 = OpLoad %75 
                                       f32_4 %228 = OpVectorShuffle %227 %227 0 0 0 0 
                                       f32_4 %229 = OpFMul %226 %228 
                                       f32_4 %230 = OpLoad %219 
                                       f32_4 %231 = OpFAdd %229 %230 
                                                      OpStore %219 %231 
                              Uniform f32_4* %232 = OpAccessChain %83 %195 %206 
                                       f32_4 %233 = OpLoad %232 
                                       f32_4 %234 = OpLoad %75 
                                       f32_4 %235 = OpVectorShuffle %234 %234 2 2 2 2 
                                       f32_4 %236 = OpFMul %233 %235 
                                       f32_4 %237 = OpLoad %219 
                                       f32_4 %238 = OpFAdd %236 %237 
                                                      OpStore %219 %238 
                              Uniform f32_4* %239 = OpAccessChain %83 %195 %215 
                                       f32_4 %240 = OpLoad %239 
                                       f32_4 %241 = OpLoad %75 
                                       f32_4 %242 = OpVectorShuffle %241 %241 3 3 3 3 
                                       f32_4 %243 = OpFMul %240 %242 
                                       f32_4 %244 = OpLoad %219 
                                       f32_4 %245 = OpFAdd %243 %244 
                                                      OpStore %75 %245 
                                       f32_4 %246 = OpLoad %75 
                                       f32_2 %247 = OpVectorShuffle %246 %246 0 1 
                                       f32_2 %249 = OpFAdd %247 %248 
                                       f32_4 %250 = OpLoad %219 
                                       f32_4 %251 = OpVectorShuffle %250 %249 4 5 2 3 
                                                      OpStore %219 %251 
                                       f32_4 %252 = OpLoad %219 
                                       f32_2 %253 = OpVectorShuffle %252 %252 0 1 
                              Uniform f32_4* %254 = OpAccessChain %83 %112 
                                       f32_4 %255 = OpLoad %254 
                                       f32_2 %256 = OpVectorShuffle %255 %255 0 1 
                                       f32_2 %257 = OpFDiv %253 %256 
                                       f32_4 %258 = OpLoad %219 
                                       f32_4 %259 = OpVectorShuffle %258 %257 4 5 2 3 
                                                      OpStore %219 %259 
                                       f32_4 %260 = OpLoad %219 
                                       f32_2 %261 = OpVectorShuffle %260 %260 0 1 
                                       f32_2 %264 = OpFAdd %261 %263 
                                       f32_4 %265 = OpLoad %219 
                                       f32_4 %266 = OpVectorShuffle %265 %264 4 5 2 3 
                                                      OpStore %219 %266 
                                       f32_4 %267 = OpLoad %219 
                                       f32_2 %268 = OpVectorShuffle %267 %267 0 1 
                                       f32_2 %269 = OpExtInst %1 3 %268 
                                       f32_4 %270 = OpLoad %219 
                                       f32_4 %271 = OpVectorShuffle %270 %269 4 5 2 3 
                                                      OpStore %219 %271 
                                       f32_4 %272 = OpLoad %219 
                                       f32_2 %273 = OpVectorShuffle %272 %272 0 1 
                              Uniform f32_4* %274 = OpAccessChain %83 %112 
                                       f32_4 %275 = OpLoad %274 
                                       f32_2 %276 = OpVectorShuffle %275 %275 0 1 
                                       f32_2 %277 = OpFMul %273 %276 
                                       f32_2 %279 = OpFAdd %277 %278 
                                       f32_4 %280 = OpLoad %219 
                                       f32_4 %281 = OpVectorShuffle %280 %279 4 5 2 3 
                                                      OpStore %219 %281 
                                Private i32* %287 = OpAccessChain %41 %286 
                                         i32 %288 = OpLoad %287 
                                        bool %289 = OpINotEqual %288 %71 
                                                      OpSelectionMerge %293 None 
                                                      OpBranchConditional %289 %292 %296 
                                             %292 = OpLabel 
                                       f32_4 %294 = OpLoad %219 
                                       f32_2 %295 = OpVectorShuffle %294 %294 0 1 
                                                      OpStore %291 %295 
                                                      OpBranch %293 
                                             %296 = OpLabel 
                                       f32_4 %297 = OpLoad %75 
                                       f32_2 %298 = OpVectorShuffle %297 %297 0 1 
                                                      OpStore %291 %298 
                                                      OpBranch %293 
                                             %293 = OpLabel 
                                       f32_2 %299 = OpLoad %291 
                               Output f32_4* %301 = OpAccessChain %285 %71 
                                       f32_4 %302 = OpLoad %301 
                                       f32_4 %303 = OpVectorShuffle %302 %299 4 5 2 3 
                                                      OpStore %301 %303 
                                       f32_2 %304 = OpLoad %95 
                              Uniform f32_4* %305 = OpAccessChain %83 %206 
                                       f32_4 %306 = OpLoad %305 
                                       f32_2 %307 = OpVectorShuffle %306 %306 0 1 
                                       f32_2 %308 = OpFMul %304 %307 
                              Uniform f32_4* %309 = OpAccessChain %83 %206 
                                       f32_4 %310 = OpLoad %309 
                                       f32_2 %311 = OpVectorShuffle %310 %310 2 3 
                                       f32_2 %312 = OpFAdd %308 %311 
                                       f32_4 %313 = OpLoad %117 
                                       f32_4 %314 = OpVectorShuffle %313 %312 4 1 2 5 
                                                      OpStore %117 %314 
                                Private i32* %317 = OpAccessChain %41 %48 
                                         i32 %318 = OpLoad %317 
                                        bool %319 = OpIEqual %318 %71 
                                                      OpStore %316 %319 
                                        bool %321 = OpLoad %316 
                                                      OpSelectionMerge %325 None 
                                                      OpBranchConditional %321 %324 %328 
                                             %324 = OpLabel 
                                Private i32* %326 = OpAccessChain %41 %179 
                                         i32 %327 = OpLoad %326 
                                                      OpStore %323 %327 
                                                      OpBranch %325 
                                             %328 = OpLabel 
                                                      OpStore %323 %71 
                                                      OpBranch %325 
                                             %325 = OpLabel 
                                         i32 %329 = OpLoad %323 
                                                      OpStore %320 %329 
                                       f32_4 %331 = OpLoad %117 
                                       f32_2 %332 = OpVectorShuffle %331 %331 0 3 
                              Uniform f32_4* %333 = OpAccessChain %83 %215 
                                       f32_4 %334 = OpLoad %333 
                                       f32_2 %335 = OpVectorShuffle %334 %334 0 1 
                                       f32_2 %336 = OpFMul %332 %335 
                                                      OpStore %330 %336 
                                         i32 %338 = OpLoad %320 
                                        bool %339 = OpINotEqual %338 %71 
                                                      OpSelectionMerge %342 None 
                                                      OpBranchConditional %339 %341 %344 
                                             %341 = OpLabel 
                                       f32_2 %343 = OpLoad %330 
                                                      OpStore %340 %343 
                                                      OpBranch %342 
                                             %344 = OpLabel 
                                       f32_4 %345 = OpLoad %117 
                                       f32_2 %346 = OpVectorShuffle %345 %345 0 3 
                                                      OpStore %340 %346 
                                                      OpBranch %342 
                                             %342 = OpLabel 
                                       f32_2 %347 = OpLoad %340 
                                       f32_4 %348 = OpLoad vs_TEXCOORD0 
                                       f32_4 %349 = OpVectorShuffle %348 %347 4 5 2 3 
                                                      OpStore vs_TEXCOORD0 %349 
                                       f32_4 %351 = OpLoad %350 
                              Uniform f32_4* %353 = OpAccessChain %83 %352 
                                       f32_4 %354 = OpLoad %353 
                                       f32_4 %355 = OpFMul %351 %354 
                                                      OpStore %117 %355 
                                Private f32* %356 = OpAccessChain %56 %48 
                                         f32 %357 = OpLoad %356 
                                Private f32* %358 = OpAccessChain %56 %14 
                                         f32 %359 = OpLoad %358 
                                         f32 %360 = OpFAdd %357 %359 
                                Private f32* %361 = OpAccessChain %9 %14 
                                                      OpStore %361 %360 
                                Private f32* %362 = OpAccessChain %56 %179 
                                         f32 %363 = OpLoad %362 
                                Private f32* %364 = OpAccessChain %9 %14 
                                         f32 %365 = OpLoad %364 
                                         f32 %366 = OpFAdd %363 %365 
                                Private f32* %367 = OpAccessChain %9 %14 
                                                      OpStore %367 %366 
                                Private f32* %368 = OpAccessChain %9 %14 
                                         f32 %369 = OpLoad %368 
                                         f32 %370 = OpExtInst %1 37 %369 %26 
                                Private f32* %371 = OpAccessChain %9 %14 
                                                      OpStore %371 %370 
                                Private f32* %372 = OpAccessChain %9 %14 
                                         f32 %373 = OpLoad %372 
                                         f32 %374 = OpFNegate %373 
                                         f32 %375 = OpFAdd %374 %26 
                                Private f32* %376 = OpAccessChain %56 %286 
                                                      OpStore %376 %375 
                                       f32_4 %377 = OpLoad %75 
                                       f32_2 %378 = OpVectorShuffle %377 %377 2 3 
                               Output f32_4* %379 = OpAccessChain %285 %71 
                                       f32_4 %380 = OpLoad %379 
                                       f32_4 %381 = OpVectorShuffle %380 %378 0 1 4 5 
                                                      OpStore %379 %381 
                                       f32_4 %383 = OpLoad %117 
                                                      OpStore %382 %383 
                                       f32_2 %384 = OpLoad %188 
                                       f32_4 %385 = OpLoad vs_TEXCOORD0 
                                       f32_4 %386 = OpVectorShuffle %385 %384 0 1 4 5 
                                                      OpStore vs_TEXCOORD0 %386 
                                       f32_4 %388 = OpLoad %56 
                                                      OpStore vs_TEXCOORD1 %388 
                                Private u32* %390 = OpAccessChain %35 %286 
                                         u32 %391 = OpLoad %390 
                                         i32 %392 = OpBitcast %391 
                              Uniform f32_4* %393 = OpAccessChain %83 %84 %392 
                                       f32_4 %394 = OpLoad %393 
                                                      OpStore vs_TEXCOORD2 %394 
                                 Output f32* %396 = OpAccessChain %285 %71 %48 
                                         f32 %397 = OpLoad %396 
                                         f32 %398 = OpFNegate %397 
                                 Output f32* %399 = OpAccessChain %285 %71 %48 
                                                      OpStore %399 %398 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 201
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %11 %30 %33 %151 %195 %197 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpDecorate %11 BuiltIn TessLevelOuter 
                                              OpDecorate vs_TEXCOORD0 Location 30 
                                              OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD2 Flat 
                                              OpDecorate vs_TEXCOORD2 Location 33 
                                              OpDecorate %34 RelaxedPrecision 
                                              OpDecorate %35 RelaxedPrecision 
                                              OpDecorate %41 RelaxedPrecision 
                                              OpDecorate %42 RelaxedPrecision 
                                              OpMemberDecorate %69 0 Offset 69 
                                              OpDecorate %69 Block 
                                              OpDecorate %71 DescriptorSet 71 
                                              OpDecorate %71 Binding 71 
                                              OpDecorate %134 RelaxedPrecision 
                                              OpDecorate %137 RelaxedPrecision 
                                              OpDecorate %137 DescriptorSet 137 
                                              OpDecorate %137 Binding 137 
                                              OpDecorate %138 RelaxedPrecision 
                                              OpDecorate %141 RelaxedPrecision 
                                              OpDecorate %141 DescriptorSet 141 
                                              OpDecorate %141 Binding 141 
                                              OpDecorate %142 RelaxedPrecision 
                                              OpDecorate %148 RelaxedPrecision 
                                              OpDecorate %149 RelaxedPrecision 
                                              OpDecorate %150 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD1 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD1 Flat 
                                              OpDecorate vs_TEXCOORD1 Location 151 
                                              OpDecorate %153 RelaxedPrecision 
                                              OpDecorate %154 RelaxedPrecision 
                                              OpDecorate %156 RelaxedPrecision 
                                              OpDecorate %157 RelaxedPrecision 
                                              OpDecorate %157 DescriptorSet 157 
                                              OpDecorate %157 Binding 157 
                                              OpDecorate %158 RelaxedPrecision 
                                              OpDecorate %159 RelaxedPrecision 
                                              OpDecorate %159 DescriptorSet 159 
                                              OpDecorate %159 Binding 159 
                                              OpDecorate %160 RelaxedPrecision 
                                              OpDecorate %165 RelaxedPrecision 
                                              OpDecorate %166 RelaxedPrecision 
                                              OpDecorate %167 RelaxedPrecision 
                                              OpDecorate %168 RelaxedPrecision 
                                              OpDecorate %169 RelaxedPrecision 
                                              OpDecorate %170 RelaxedPrecision 
                                              OpDecorate %171 RelaxedPrecision 
                                              OpDecorate %172 RelaxedPrecision 
                                              OpDecorate %173 RelaxedPrecision 
                                              OpDecorate %174 RelaxedPrecision 
                                              OpDecorate %177 RelaxedPrecision 
                                              OpDecorate %178 RelaxedPrecision 
                                              OpDecorate %179 RelaxedPrecision 
                                              OpDecorate %180 RelaxedPrecision 
                                              OpDecorate %180 DescriptorSet 180 
                                              OpDecorate %180 Binding 180 
                                              OpDecorate %181 RelaxedPrecision 
                                              OpDecorate %182 RelaxedPrecision 
                                              OpDecorate %182 DescriptorSet 182 
                                              OpDecorate %182 Binding 182 
                                              OpDecorate %183 RelaxedPrecision 
                                              OpDecorate %188 RelaxedPrecision 
                                              OpDecorate %189 RelaxedPrecision 
                                              OpDecorate %190 RelaxedPrecision 
                                              OpDecorate %191 RelaxedPrecision 
                                              OpDecorate %192 RelaxedPrecision 
                                              OpDecorate %193 RelaxedPrecision 
                                              OpDecorate %195 RelaxedPrecision 
                                              OpDecorate %195 Location 195 
                                              OpDecorate %196 RelaxedPrecision 
                                              OpDecorate %197 RelaxedPrecision 
                                              OpDecorate %197 Location 197 
                                              OpDecorate %198 RelaxedPrecision 
                                              OpDecorate %199 RelaxedPrecision 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Function %7 
                                      %10 = OpTypePointer Input %7 
                         Input f32_4* %11 = OpVariable Input 
                                      %12 = OpTypeVector %6 3 
                                  f32 %15 = OpConstant 3.674022E-40 
                                      %16 = OpTypeInt 32 0 
                                  u32 %17 = OpConstant 3 
                                      %18 = OpTypePointer Input %6 
                                      %26 = OpTypeBool 
                                      %27 = OpTypeVector %26 4 
                                      %28 = OpTypePointer Private %27 
                      Private bool_4* %29 = OpVariable Private 
                Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                      %37 = OpTypeVector %26 2 
                                      %49 = OpTypePointer Private %7 
                       Private f32_4* %50 = OpVariable Private 
                                  f32 %51 = OpConstant 3.674022E-40 
                                f32_4 %52 = OpConstantComposite %51 %51 %51 %51 
                                f32_4 %53 = OpConstantComposite %15 %15 %15 %15 
                                      %57 = OpTypeVector %6 2 
                                      %65 = OpTypePointer Private %37 
                      Private bool_2* %66 = OpVariable Private 
                                      %69 = OpTypeStruct %7 
                                      %70 = OpTypePointer Uniform %69 
             Uniform struct {f32_4;}* %71 = OpVariable Uniform 
                                      %72 = OpTypeInt 32 1 
                                  i32 %73 = OpConstant 0 
                                      %74 = OpTypePointer Uniform %7 
                                      %80 = OpTypePointer Private %57 
                       Private f32_2* %81 = OpVariable Private 
                                f32_2 %82 = OpConstantComposite %51 %51 
                                f32_2 %83 = OpConstantComposite %15 %15 
                                 u32 %109 = OpConstant 2 
                                     %110 = OpTypePointer Private %6 
                                 f32 %114 = OpConstant 3.674022E-40 
                               f32_3 %115 = OpConstantComposite %15 %15 %114 
                                 u32 %117 = OpConstant 0 
                                     %122 = OpTypePointer Private %26 
                                 i32 %126 = OpConstant 1 
                                 i32 %128 = OpConstant -1 
                        Private f32* %134 = OpVariable Private 
                                     %135 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %136 = OpTypePointer UniformConstant %135 
UniformConstant read_only Texture2D* %137 = OpVariable UniformConstant 
                                     %139 = OpTypeSampler 
                                     %140 = OpTypePointer UniformConstant %139 
            UniformConstant sampler* %141 = OpVariable UniformConstant 
                                     %143 = OpTypeSampledImage %135 
                      Private f32_4* %149 = OpVariable Private 
                Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                      Private f32_4* %156 = OpVariable Private 
UniformConstant read_only Texture2D* %157 = OpVariable UniformConstant 
            UniformConstant sampler* %159 = OpVariable UniformConstant 
                      Private f32_4* %165 = OpVariable Private 
UniformConstant read_only Texture2D* %180 = OpVariable UniformConstant 
            UniformConstant sampler* %182 = OpVariable UniformConstant 
                                     %194 = OpTypePointer Output %7 
                       Output f32_4* %195 = OpVariable Output 
                        Input f32_4* %197 = OpVariable Input 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                       Function f32_4* %9 = OpVariable Function 
                                f32_4 %13 = OpLoad %11 
                                f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                           Input f32* %19 = OpAccessChain %11 %17 
                                  f32 %20 = OpLoad %19 
                                  f32 %21 = OpFDiv %15 %20 
                                  f32 %22 = OpCompositeExtract %14 0 
                                  f32 %23 = OpCompositeExtract %14 1 
                                  f32 %24 = OpCompositeExtract %14 2 
                                f32_4 %25 = OpCompositeConstruct %22 %23 %24 %21 
                                              OpStore %9 %25 
                                f32_4 %31 = OpLoad vs_TEXCOORD0 
                                f32_4 %32 = OpVectorShuffle %31 %31 2 3 2 2 
                                f32_4 %34 = OpLoad vs_TEXCOORD2 
                                f32_4 %35 = OpVectorShuffle %34 %34 0 1 0 0 
                               bool_4 %36 = OpFOrdGreaterThanEqual %32 %35 
                               bool_2 %38 = OpVectorShuffle %36 %36 0 1 
                               bool_4 %39 = OpLoad %29 
                               bool_4 %40 = OpVectorShuffle %39 %38 4 5 2 3 
                                              OpStore %29 %40 
                                f32_4 %41 = OpLoad vs_TEXCOORD2 
                                f32_4 %42 = OpVectorShuffle %41 %41 2 2 2 3 
                                f32_4 %43 = OpLoad vs_TEXCOORD0 
                                f32_4 %44 = OpVectorShuffle %43 %43 2 2 2 3 
                               bool_4 %45 = OpFOrdGreaterThanEqual %42 %44 
                               bool_2 %46 = OpVectorShuffle %45 %45 2 3 
                               bool_4 %47 = OpLoad %29 
                               bool_4 %48 = OpVectorShuffle %47 %46 0 1 4 5 
                                              OpStore %29 %48 
                               bool_4 %54 = OpLoad %29 
                                f32_4 %55 = OpSelect %54 %53 %52 
                                f32_4 %56 = OpExtInst %1 46 %52 %53 %55 
                                              OpStore %50 %56 
                                f32_4 %58 = OpLoad %50 
                                f32_2 %59 = OpVectorShuffle %58 %58 2 3 
                                f32_4 %60 = OpLoad %50 
                                f32_2 %61 = OpVectorShuffle %60 %60 0 1 
                                f32_2 %62 = OpFAdd %59 %61 
                                f32_4 %63 = OpLoad %50 
                                f32_4 %64 = OpVectorShuffle %63 %62 4 5 2 3 
                                              OpStore %50 %64 
                                f32_4 %67 = OpLoad %9 
                                f32_4 %68 = OpVectorShuffle %67 %67 0 1 0 1 
                       Uniform f32_4* %75 = OpAccessChain %71 %73 
                                f32_4 %76 = OpLoad %75 
                                f32_4 %77 = OpVectorShuffle %76 %76 0 1 0 1 
                               bool_4 %78 = OpFOrdGreaterThanEqual %68 %77 
                               bool_2 %79 = OpVectorShuffle %78 %78 0 1 
                                              OpStore %66 %79 
                               bool_2 %84 = OpLoad %66 
                                f32_2 %85 = OpSelect %84 %83 %82 
                                f32_2 %86 = OpExtInst %1 46 %82 %83 %85 
                                              OpStore %81 %86 
                                f32_2 %87 = OpLoad %81 
                                f32_4 %88 = OpLoad %50 
                                f32_2 %89 = OpVectorShuffle %88 %88 0 1 
                                f32_2 %90 = OpFAdd %87 %89 
                                f32_4 %91 = OpLoad %50 
                                f32_4 %92 = OpVectorShuffle %91 %90 4 5 2 3 
                                              OpStore %50 %92 
                       Uniform f32_4* %93 = OpAccessChain %71 %73 
                                f32_4 %94 = OpLoad %93 
                                f32_4 %95 = OpVectorShuffle %94 %94 2 3 2 3 
                                f32_4 %96 = OpLoad %9 
                                f32_4 %97 = OpVectorShuffle %96 %96 0 1 0 1 
                               bool_4 %98 = OpFOrdGreaterThanEqual %95 %97 
                               bool_2 %99 = OpVectorShuffle %98 %98 0 1 
                                              OpStore %66 %99 
                              bool_2 %100 = OpLoad %66 
                               f32_2 %101 = OpSelect %100 %83 %82 
                               f32_2 %102 = OpExtInst %1 46 %82 %83 %101 
                                              OpStore %81 %102 
                               f32_2 %103 = OpLoad %81 
                               f32_4 %104 = OpLoad %50 
                               f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                               f32_2 %106 = OpFAdd %103 %105 
                               f32_4 %107 = OpLoad %50 
                               f32_4 %108 = OpVectorShuffle %107 %106 4 5 2 3 
                                              OpStore %50 %108 
                        Private f32* %111 = OpAccessChain %50 %109 
                                              OpStore %111 %15 
                               f32_4 %112 = OpLoad %50 
                               f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                                 f32 %116 = OpDot %113 %115 
                        Private f32* %118 = OpAccessChain %50 %117 
                                              OpStore %118 %116 
                        Private f32* %119 = OpAccessChain %50 %117 
                                 f32 %120 = OpLoad %119 
                                bool %121 = OpFOrdLessThan %120 %51 
                       Private bool* %123 = OpAccessChain %29 %117 
                                              OpStore %123 %121 
                       Private bool* %124 = OpAccessChain %29 %117 
                                bool %125 = OpLoad %124 
                                 i32 %127 = OpSelect %125 %126 %73 
                                 i32 %129 = OpIMul %127 %128 
                                bool %130 = OpINotEqual %129 %73 
                                              OpSelectionMerge %132 None 
                                              OpBranchConditional %130 %131 %132 
                                     %131 = OpLabel 
                                              OpKill
                                     %132 = OpLabel 
                 read_only Texture2D %138 = OpLoad %137 
                             sampler %142 = OpLoad %141 
          read_only Texture2DSampled %144 = OpSampledImage %138 %142 
                               f32_4 %145 = OpLoad vs_TEXCOORD0 
                               f32_2 %146 = OpVectorShuffle %145 %145 0 1 
                               f32_4 %147 = OpImageSampleImplicitLod %144 %146 
                                 f32 %148 = OpCompositeExtract %147 3 
                                              OpStore %134 %148 
                                 f32 %150 = OpLoad %134 
                          Input f32* %152 = OpAccessChain vs_TEXCOORD1 %117 
                                 f32 %153 = OpLoad %152 
                                 f32 %154 = OpFMul %150 %153 
                        Private f32* %155 = OpAccessChain %149 %17 
                                              OpStore %155 %154 
                 read_only Texture2D %158 = OpLoad %157 
                             sampler %160 = OpLoad %159 
          read_only Texture2DSampled %161 = OpSampledImage %158 %160 
                               f32_4 %162 = OpLoad vs_TEXCOORD0 
                               f32_2 %163 = OpVectorShuffle %162 %162 0 1 
                               f32_4 %164 = OpImageSampleImplicitLod %161 %163 
                                              OpStore %156 %164 
                               f32_4 %166 = OpLoad %156 
                               f32_4 %167 = OpLoad vs_TEXCOORD1 
                               f32_4 %168 = OpVectorShuffle %167 %167 1 1 1 1 
                               f32_4 %169 = OpFMul %166 %168 
                               f32_4 %170 = OpLoad vs_TEXCOORD1 
                               f32_4 %171 = OpVectorShuffle %170 %170 3 3 3 3 
                               f32_4 %172 = OpFAdd %169 %171 
                                              OpStore %165 %172 
                               f32_4 %173 = OpLoad vs_TEXCOORD1 
                               f32_3 %174 = OpVectorShuffle %173 %173 0 0 0 
                               f32_4 %175 = OpLoad %149 
                               f32_4 %176 = OpVectorShuffle %175 %174 4 5 6 3 
                                              OpStore %149 %176 
                               f32_4 %177 = OpLoad %149 
                               f32_4 %178 = OpLoad %165 
                               f32_4 %179 = OpFAdd %177 %178 
                                              OpStore %149 %179 
                 read_only Texture2D %181 = OpLoad %180 
                             sampler %183 = OpLoad %182 
          read_only Texture2DSampled %184 = OpSampledImage %181 %183 
                               f32_4 %185 = OpLoad vs_TEXCOORD0 
                               f32_2 %186 = OpVectorShuffle %185 %185 0 1 
                               f32_4 %187 = OpImageSampleImplicitLod %184 %186 
                                              OpStore %156 %187 
                               f32_4 %188 = OpLoad %156 
                               f32_4 %189 = OpLoad vs_TEXCOORD1 
                               f32_4 %190 = OpVectorShuffle %189 %189 2 2 2 2 
                               f32_4 %191 = OpFMul %188 %190 
                               f32_4 %192 = OpLoad %149 
                               f32_4 %193 = OpFAdd %191 %192 
                                              OpStore %149 %193 
                               f32_4 %196 = OpLoad %149 
                               f32_4 %198 = OpLoad %197 
                               f32_4 %199 = OpFMul %196 %198 
                                              OpStore %195 %199 
                                              OpReturn
                                              OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 401
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %12 %95 %167 %285 %337 %350 %382 %387 %389 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %77 ArrayStride 77 
                                                      OpDecorate %78 ArrayStride 78 
                                                      OpDecorate %80 ArrayStride 80 
                                                      OpMemberDecorate %81 0 Offset 81 
                                                      OpMemberDecorate %81 1 Offset 81 
                                                      OpMemberDecorate %81 2 Offset 81 
                                                      OpMemberDecorate %81 3 Offset 81 
                                                      OpMemberDecorate %81 4 RelaxedPrecision 
                                                      OpMemberDecorate %81 4 Offset 81 
                                                      OpMemberDecorate %81 5 Offset 81 
                                                      OpMemberDecorate %81 6 Offset 81 
                                                      OpDecorate %81 Block 
                                                      OpDecorate %83 DescriptorSet 83 
                                                      OpDecorate %83 Binding 83 
                                                      OpDecorate %95 Location 95 
                                                      OpDecorate %167 Location 167 
                                                      OpMemberDecorate %283 0 BuiltIn 283 
                                                      OpMemberDecorate %283 1 BuiltIn 283 
                                                      OpMemberDecorate %283 2 BuiltIn 283 
                                                      OpDecorate %283 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 337 
                                                      OpDecorate %350 Location 350 
                                                      OpDecorate %354 RelaxedPrecision 
                                                      OpDecorate %382 RelaxedPrecision 
                                                      OpDecorate %382 Location 382 
                                                      OpDecorate vs_TEXCOORD1 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Flat 
                                                      OpDecorate vs_TEXCOORD1 Location 387 
                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 Flat 
                                                      OpDecorate vs_TEXCOORD2 Location 389 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %13 = OpTypeInt 32 0 
                                          u32 %14 = OpConstant 0 
                                              %15 = OpTypePointer Input %6 
                                          f32 %18 = OpConstant 3.674022E-40 
                                              %20 = OpTypePointer Private %6 
                                        f32_3 %24 = OpConstantComposite %18 %18 %18 
                                          f32 %26 = OpConstant 3.674022E-40 
                                          f32 %27 = OpConstant 3.674022E-40 
                                          f32 %28 = OpConstant 3.674022E-40 
                                        f32_3 %29 = OpConstantComposite %26 %27 %28 
                                              %33 = OpTypeVector %13 4 
                                              %34 = OpTypePointer Private %33 
                               Private u32_4* %35 = OpVariable Private 
                                              %38 = OpTypeInt 32 1 
                                              %39 = OpTypeVector %38 4 
                                              %40 = OpTypePointer Private %39 
                               Private i32_4* %41 = OpVariable Private 
                                        f32_4 %44 = OpConstantComposite %18 %28 %27 %26 
                                              %45 = OpTypeBool 
                                              %46 = OpTypeVector %45 4 
                                          u32 %48 = OpConstant 1 
                                        u32_4 %49 = OpConstantComposite %14 %14 %14 %14 
                                        u32_4 %50 = OpConstantComposite %48 %48 %48 %48 
                                          u32 %52 = OpConstant 4294967295 
                               Private f32_4* %56 = OpVariable Private 
                                              %57 = OpTypeVector %38 3 
                                              %60 = OpTypeVector %13 3 
                                          u32 %62 = OpConstant 1065353216 
                                        u32_3 %63 = OpConstantComposite %62 %62 %62 
                                              %68 = OpTypePointer Private %38 
                                          i32 %71 = OpConstant 0 
                               Private f32_4* %75 = OpVariable Private 
                                          u32 %76 = OpConstant 4 
                                              %77 = OpTypeArray %7 %76 
                                              %78 = OpTypeArray %7 %76 
                                          u32 %79 = OpConstant 80 
                                              %80 = OpTypeArray %7 %79 
                                              %81 = OpTypeStruct %77 %78 %7 %7 %7 %7 %80 
                                              %82 = OpTypePointer Uniform %81 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32_4; f32_4[80];}* %83 = OpVariable Uniform 
                                          i32 %84 = OpConstant 6 
                                              %85 = OpTypePointer Private %13 
                                              %89 = OpTypeVector %6 2 
                                              %90 = OpTypePointer Uniform %7 
                                              %94 = OpTypePointer Input %89 
                                 Input f32_2* %95 = OpVariable Input 
                                             %108 = OpTypePointer Private %89 
                              Private f32_2* %109 = OpVariable Private 
                                         i32 %112 = OpConstant 5 
                              Private f32_4* %117 = OpVariable Private 
                                         f32 %136 = OpConstant 3.674022E-40 
                                         f32 %147 = OpConstant 3.674022E-40 
                                         f32 %158 = OpConstant 3.674022E-40 
                                             %166 = OpTypePointer Input %7 
                                Input f32_4* %167 = OpVariable Input 
                                         u32 %179 = OpConstant 2 
                              Private f32_2* %188 = OpVariable Private 
                                         i32 %195 = OpConstant 1 
                                         i32 %206 = OpConstant 2 
                                         i32 %215 = OpConstant 3 
                              Private f32_4* %219 = OpVariable Private 
                                       f32_2 %248 = OpConstantComposite %26 %26 
                                         f32 %262 = OpConstant 3.674022E-40 
                                       f32_2 %263 = OpConstantComposite %262 %262 
                                       f32_2 %278 = OpConstantComposite %147 %147 
                                             %282 = OpTypeArray %6 %48 
                                             %283 = OpTypeStruct %7 %6 %282 
                                             %284 = OpTypePointer Output %283 
        Output struct {f32_4; f32; f32[1];}* %285 = OpVariable Output 
                                         u32 %286 = OpConstant 3 
                                             %290 = OpTypePointer Function %89 
                                             %300 = OpTypePointer Output %7 
                                             %315 = OpTypePointer Private %45 
                               Private bool* %316 = OpVariable Private 
                                Private i32* %320 = OpVariable Private 
                                             %322 = OpTypePointer Function %38 
                              Private f32_2* %330 = OpVariable Private 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_4* %350 = OpVariable Input 
                                         i32 %352 = OpConstant 4 
                               Output f32_4* %382 = OpVariable Output 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                             %395 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_2* %291 = OpVariable Function 
                               Function i32* %323 = OpVariable Function 
                             Function f32_2* %340 = OpVariable Function 
                                   Input f32* %16 = OpAccessChain %12 %14 
                                          f32 %17 = OpLoad %16 
                                          f32 %19 = OpFMul %17 %18 
                                 Private f32* %21 = OpAccessChain %9 %14 
                                                      OpStore %21 %19 
                                        f32_3 %22 = OpLoad %12 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 0 1 
                                        f32_3 %25 = OpFMul %23 %24 
                                        f32_3 %30 = OpFAdd %25 %29 
                                        f32_4 %31 = OpLoad %9 
                                        f32_4 %32 = OpVectorShuffle %31 %30 0 4 5 6 
                                                      OpStore %9 %32 
                                        f32_4 %36 = OpLoad %9 
                                        u32_4 %37 = OpConvertFToU %36 
                                                      OpStore %35 %37 
                                        f32_3 %42 = OpLoad %12 
                                        f32_4 %43 = OpVectorShuffle %42 %42 2 2 2 2 
                                       bool_4 %47 = OpFOrdEqual %43 %44 
                                        u32_4 %51 = OpSelect %47 %50 %49 
                                        u32_4 %53 = OpCompositeConstruct %52 %52 %52 %52 
                                        u32_4 %54 = OpIMul %51 %53 
                                        i32_4 %55 = OpBitcast %54 
                                                      OpStore %41 %55 
                                        i32_4 %58 = OpLoad %41 
                                        i32_3 %59 = OpVectorShuffle %58 %58 3 2 1 
                                        u32_3 %61 = OpBitcast %59 
                                        u32_3 %64 = OpBitwiseAnd %61 %63 
                                        f32_3 %65 = OpBitcast %64 
                                        f32_4 %66 = OpLoad %56 
                                        f32_4 %67 = OpVectorShuffle %66 %65 4 5 6 3 
                                                      OpStore %56 %67 
                                 Private i32* %69 = OpAccessChain %41 %14 
                                          i32 %70 = OpLoad %69 
                                         bool %72 = OpINotEqual %70 %71 
                                                      OpSelectionMerge %74 None 
                                                      OpBranchConditional %72 %73 %157 
                                              %73 = OpLabel 
                                 Private u32* %86 = OpAccessChain %35 %14 
                                          u32 %87 = OpLoad %86 
                                          i32 %88 = OpBitcast %87 
                               Uniform f32_4* %91 = OpAccessChain %83 %84 %88 
                                        f32_4 %92 = OpLoad %91 
                                        f32_2 %93 = OpVectorShuffle %92 %92 0 1 
                                        f32_2 %96 = OpLoad %95 
                                          f32 %97 = OpDot %93 %96 
                                 Private f32* %98 = OpAccessChain %75 %14 
                                                      OpStore %98 %97 
                                 Private u32* %99 = OpAccessChain %35 %48 
                                         u32 %100 = OpLoad %99 
                                         i32 %101 = OpBitcast %100 
                              Uniform f32_4* %102 = OpAccessChain %83 %84 %101 
                                       f32_4 %103 = OpLoad %102 
                                       f32_2 %104 = OpVectorShuffle %103 %103 0 1 
                                       f32_2 %105 = OpLoad %95 
                                         f32 %106 = OpDot %104 %105 
                                Private f32* %107 = OpAccessChain %75 %48 
                                                      OpStore %107 %106 
                                       f32_4 %110 = OpLoad %75 
                                       f32_2 %111 = OpVectorShuffle %110 %110 0 1 
                              Uniform f32_4* %113 = OpAccessChain %83 %112 
                                       f32_4 %114 = OpLoad %113 
                                       f32_2 %115 = OpVectorShuffle %114 %114 2 3 
                                       f32_2 %116 = OpFMul %111 %115 
                                                      OpStore %109 %116 
                                       f32_2 %118 = OpLoad %109 
                                       f32_2 %119 = OpLoad %109 
                                         f32 %120 = OpDot %118 %119 
                                Private f32* %121 = OpAccessChain %117 %14 
                                                      OpStore %121 %120 
                                Private f32* %122 = OpAccessChain %117 %14 
                                         f32 %123 = OpLoad %122 
                                         f32 %124 = OpExtInst %1 31 %123 
                                Private f32* %125 = OpAccessChain %117 %14 
                                                      OpStore %125 %124 
                                Private f32* %126 = OpAccessChain %117 %14 
                                         f32 %127 = OpLoad %126 
                                         f32 %128 = OpExtInst %1 40 %127 %26 
                                Private f32* %129 = OpAccessChain %109 %14 
                                                      OpStore %129 %128 
                                Private f32* %130 = OpAccessChain %109 %14 
                                         f32 %131 = OpLoad %130 
                                         f32 %132 = OpExtInst %1 2 %131 
                                Private f32* %133 = OpAccessChain %109 %14 
                                                      OpStore %133 %132 
                                Private f32* %134 = OpAccessChain %117 %14 
                                         f32 %135 = OpLoad %134 
                                         f32 %137 = OpFAdd %135 %136 
                                Private f32* %138 = OpAccessChain %117 %14 
                                                      OpStore %138 %137 
                                Private f32* %139 = OpAccessChain %109 %14 
                                         f32 %140 = OpLoad %139 
                                Private f32* %141 = OpAccessChain %117 %14 
                                         f32 %142 = OpLoad %141 
                                         f32 %143 = OpFDiv %140 %142 
                                Private f32* %144 = OpAccessChain %117 %14 
                                                      OpStore %144 %143 
                                Private f32* %145 = OpAccessChain %117 %14 
                                         f32 %146 = OpLoad %145 
                                         f32 %148 = OpFAdd %146 %147 
                                Private f32* %149 = OpAccessChain %117 %14 
                                                      OpStore %149 %148 
                                       f32_4 %150 = OpLoad %75 
                                       f32_2 %151 = OpVectorShuffle %150 %150 0 1 
                                       f32_4 %152 = OpLoad %117 
                                       f32_2 %153 = OpVectorShuffle %152 %152 0 0 
                                       f32_2 %154 = OpFMul %151 %153 
                                       f32_4 %155 = OpLoad %75 
                                       f32_4 %156 = OpVectorShuffle %155 %154 4 5 2 3 
                                                      OpStore %75 %156 
                                                      OpBranch %74 
                                             %157 = OpLabel 
                                Private f32* %159 = OpAccessChain %75 %14 
                                                      OpStore %159 %158 
                                Private f32* %160 = OpAccessChain %75 %48 
                                                      OpStore %160 %158 
                                                      OpBranch %74 
                                              %74 = OpLabel 
                                Private u32* %161 = OpAccessChain %35 %14 
                                         u32 %162 = OpLoad %161 
                                         i32 %163 = OpBitcast %162 
                              Uniform f32_4* %164 = OpAccessChain %83 %84 %163 
                                       f32_4 %165 = OpLoad %164 
                                       f32_4 %168 = OpLoad %167 
                                         f32 %169 = OpDot %165 %168 
                                Private f32* %170 = OpAccessChain %109 %14 
                                                      OpStore %170 %169 
                                Private u32* %171 = OpAccessChain %35 %48 
                                         u32 %172 = OpLoad %171 
                                         i32 %173 = OpBitcast %172 
                              Uniform f32_4* %174 = OpAccessChain %83 %84 %173 
                                       f32_4 %175 = OpLoad %174 
                                       f32_4 %176 = OpLoad %167 
                                         f32 %177 = OpDot %175 %176 
                                Private f32* %178 = OpAccessChain %109 %48 
                                                      OpStore %178 %177 
                                Private u32* %180 = OpAccessChain %35 %179 
                                         u32 %181 = OpLoad %180 
                                         i32 %182 = OpBitcast %181 
                              Uniform f32_4* %183 = OpAccessChain %83 %84 %182 
                                       f32_4 %184 = OpLoad %183 
                                       f32_4 %185 = OpLoad %167 
                                         f32 %186 = OpDot %184 %185 
                                Private f32* %187 = OpAccessChain %9 %14 
                                                      OpStore %187 %186 
                                       f32_4 %189 = OpLoad %75 
                                       f32_2 %190 = OpVectorShuffle %189 %189 0 1 
                                       f32_2 %191 = OpLoad %109 
                                       f32_2 %192 = OpFAdd %190 %191 
                                                      OpStore %188 %192 
                                       f32_2 %193 = OpLoad %188 
                                       f32_4 %194 = OpVectorShuffle %193 %193 1 1 1 1 
                              Uniform f32_4* %196 = OpAccessChain %83 %71 %195 
                                       f32_4 %197 = OpLoad %196 
                                       f32_4 %198 = OpFMul %194 %197 
                                                      OpStore %75 %198 
                              Uniform f32_4* %199 = OpAccessChain %83 %71 %71 
                                       f32_4 %200 = OpLoad %199 
                                       f32_2 %201 = OpLoad %188 
                                       f32_4 %202 = OpVectorShuffle %201 %201 0 0 0 0 
                                       f32_4 %203 = OpFMul %200 %202 
                                       f32_4 %204 = OpLoad %75 
                                       f32_4 %205 = OpFAdd %203 %204 
                                                      OpStore %75 %205 
                              Uniform f32_4* %207 = OpAccessChain %83 %71 %206 
                                       f32_4 %208 = OpLoad %207 
                                       f32_4 %209 = OpLoad %9 
                                       f32_4 %210 = OpVectorShuffle %209 %209 0 0 0 0 
                                       f32_4 %211 = OpFMul %208 %210 
                                       f32_4 %212 = OpLoad %75 
                                       f32_4 %213 = OpFAdd %211 %212 
                                                      OpStore %75 %213 
                                       f32_4 %214 = OpLoad %75 
                              Uniform f32_4* %216 = OpAccessChain %83 %71 %215 
                                       f32_4 %217 = OpLoad %216 
                                       f32_4 %218 = OpFAdd %214 %217 
                                                      OpStore %75 %218 
                                       f32_4 %220 = OpLoad %75 
                                       f32_4 %221 = OpVectorShuffle %220 %220 1 1 1 1 
                              Uniform f32_4* %222 = OpAccessChain %83 %195 %195 
                                       f32_4 %223 = OpLoad %222 
                                       f32_4 %224 = OpFMul %221 %223 
                                                      OpStore %219 %224 
                              Uniform f32_4* %225 = OpAccessChain %83 %195 %71 
                                       f32_4 %226 = OpLoad %225 
                                       f32_4 %227 = OpLoad %75 
                                       f32_4 %228 = OpVectorShuffle %227 %227 0 0 0 0 
                                       f32_4 %229 = OpFMul %226 %228 
                                       f32_4 %230 = OpLoad %219 
                                       f32_4 %231 = OpFAdd %229 %230 
                                                      OpStore %219 %231 
                              Uniform f32_4* %232 = OpAccessChain %83 %195 %206 
                                       f32_4 %233 = OpLoad %232 
                                       f32_4 %234 = OpLoad %75 
                                       f32_4 %235 = OpVectorShuffle %234 %234 2 2 2 2 
                                       f32_4 %236 = OpFMul %233 %235 
                                       f32_4 %237 = OpLoad %219 
                                       f32_4 %238 = OpFAdd %236 %237 
                                                      OpStore %219 %238 
                              Uniform f32_4* %239 = OpAccessChain %83 %195 %215 
                                       f32_4 %240 = OpLoad %239 
                                       f32_4 %241 = OpLoad %75 
                                       f32_4 %242 = OpVectorShuffle %241 %241 3 3 3 3 
                                       f32_4 %243 = OpFMul %240 %242 
                                       f32_4 %244 = OpLoad %219 
                                       f32_4 %245 = OpFAdd %243 %244 
                                                      OpStore %75 %245 
                                       f32_4 %246 = OpLoad %75 
                                       f32_2 %247 = OpVectorShuffle %246 %246 0 1 
                                       f32_2 %249 = OpFAdd %247 %248 
                                       f32_4 %250 = OpLoad %219 
                                       f32_4 %251 = OpVectorShuffle %250 %249 4 5 2 3 
                                                      OpStore %219 %251 
                                       f32_4 %252 = OpLoad %219 
                                       f32_2 %253 = OpVectorShuffle %252 %252 0 1 
                              Uniform f32_4* %254 = OpAccessChain %83 %112 
                                       f32_4 %255 = OpLoad %254 
                                       f32_2 %256 = OpVectorShuffle %255 %255 0 1 
                                       f32_2 %257 = OpFDiv %253 %256 
                                       f32_4 %258 = OpLoad %219 
                                       f32_4 %259 = OpVectorShuffle %258 %257 4 5 2 3 
                                                      OpStore %219 %259 
                                       f32_4 %260 = OpLoad %219 
                                       f32_2 %261 = OpVectorShuffle %260 %260 0 1 
                                       f32_2 %264 = OpFAdd %261 %263 
                                       f32_4 %265 = OpLoad %219 
                                       f32_4 %266 = OpVectorShuffle %265 %264 4 5 2 3 
                                                      OpStore %219 %266 
                                       f32_4 %267 = OpLoad %219 
                                       f32_2 %268 = OpVectorShuffle %267 %267 0 1 
                                       f32_2 %269 = OpExtInst %1 3 %268 
                                       f32_4 %270 = OpLoad %219 
                                       f32_4 %271 = OpVectorShuffle %270 %269 4 5 2 3 
                                                      OpStore %219 %271 
                                       f32_4 %272 = OpLoad %219 
                                       f32_2 %273 = OpVectorShuffle %272 %272 0 1 
                              Uniform f32_4* %274 = OpAccessChain %83 %112 
                                       f32_4 %275 = OpLoad %274 
                                       f32_2 %276 = OpVectorShuffle %275 %275 0 1 
                                       f32_2 %277 = OpFMul %273 %276 
                                       f32_2 %279 = OpFAdd %277 %278 
                                       f32_4 %280 = OpLoad %219 
                                       f32_4 %281 = OpVectorShuffle %280 %279 4 5 2 3 
                                                      OpStore %219 %281 
                                Private i32* %287 = OpAccessChain %41 %286 
                                         i32 %288 = OpLoad %287 
                                        bool %289 = OpINotEqual %288 %71 
                                                      OpSelectionMerge %293 None 
                                                      OpBranchConditional %289 %292 %296 
                                             %292 = OpLabel 
                                       f32_4 %294 = OpLoad %219 
                                       f32_2 %295 = OpVectorShuffle %294 %294 0 1 
                                                      OpStore %291 %295 
                                                      OpBranch %293 
                                             %296 = OpLabel 
                                       f32_4 %297 = OpLoad %75 
                                       f32_2 %298 = OpVectorShuffle %297 %297 0 1 
                                                      OpStore %291 %298 
                                                      OpBranch %293 
                                             %293 = OpLabel 
                                       f32_2 %299 = OpLoad %291 
                               Output f32_4* %301 = OpAccessChain %285 %71 
                                       f32_4 %302 = OpLoad %301 
                                       f32_4 %303 = OpVectorShuffle %302 %299 4 5 2 3 
                                                      OpStore %301 %303 
                                       f32_2 %304 = OpLoad %95 
                              Uniform f32_4* %305 = OpAccessChain %83 %206 
                                       f32_4 %306 = OpLoad %305 
                                       f32_2 %307 = OpVectorShuffle %306 %306 0 1 
                                       f32_2 %308 = OpFMul %304 %307 
                              Uniform f32_4* %309 = OpAccessChain %83 %206 
                                       f32_4 %310 = OpLoad %309 
                                       f32_2 %311 = OpVectorShuffle %310 %310 2 3 
                                       f32_2 %312 = OpFAdd %308 %311 
                                       f32_4 %313 = OpLoad %117 
                                       f32_4 %314 = OpVectorShuffle %313 %312 4 1 2 5 
                                                      OpStore %117 %314 
                                Private i32* %317 = OpAccessChain %41 %48 
                                         i32 %318 = OpLoad %317 
                                        bool %319 = OpIEqual %318 %71 
                                                      OpStore %316 %319 
                                        bool %321 = OpLoad %316 
                                                      OpSelectionMerge %325 None 
                                                      OpBranchConditional %321 %324 %328 
                                             %324 = OpLabel 
                                Private i32* %326 = OpAccessChain %41 %179 
                                         i32 %327 = OpLoad %326 
                                                      OpStore %323 %327 
                                                      OpBranch %325 
                                             %328 = OpLabel 
                                                      OpStore %323 %71 
                                                      OpBranch %325 
                                             %325 = OpLabel 
                                         i32 %329 = OpLoad %323 
                                                      OpStore %320 %329 
                                       f32_4 %331 = OpLoad %117 
                                       f32_2 %332 = OpVectorShuffle %331 %331 0 3 
                              Uniform f32_4* %333 = OpAccessChain %83 %215 
                                       f32_4 %334 = OpLoad %333 
                                       f32_2 %335 = OpVectorShuffle %334 %334 0 1 
                                       f32_2 %336 = OpFMul %332 %335 
                                                      OpStore %330 %336 
                                         i32 %338 = OpLoad %320 
                                        bool %339 = OpINotEqual %338 %71 
                                                      OpSelectionMerge %342 None 
                                                      OpBranchConditional %339 %341 %344 
                                             %341 = OpLabel 
                                       f32_2 %343 = OpLoad %330 
                                                      OpStore %340 %343 
                                                      OpBranch %342 
                                             %344 = OpLabel 
                                       f32_4 %345 = OpLoad %117 
                                       f32_2 %346 = OpVectorShuffle %345 %345 0 3 
                                                      OpStore %340 %346 
                                                      OpBranch %342 
                                             %342 = OpLabel 
                                       f32_2 %347 = OpLoad %340 
                                       f32_4 %348 = OpLoad vs_TEXCOORD0 
                                       f32_4 %349 = OpVectorShuffle %348 %347 4 5 2 3 
                                                      OpStore vs_TEXCOORD0 %349 
                                       f32_4 %351 = OpLoad %350 
                              Uniform f32_4* %353 = OpAccessChain %83 %352 
                                       f32_4 %354 = OpLoad %353 
                                       f32_4 %355 = OpFMul %351 %354 
                                                      OpStore %117 %355 
                                Private f32* %356 = OpAccessChain %56 %48 
                                         f32 %357 = OpLoad %356 
                                Private f32* %358 = OpAccessChain %56 %14 
                                         f32 %359 = OpLoad %358 
                                         f32 %360 = OpFAdd %357 %359 
                                Private f32* %361 = OpAccessChain %9 %14 
                                                      OpStore %361 %360 
                                Private f32* %362 = OpAccessChain %56 %179 
                                         f32 %363 = OpLoad %362 
                                Private f32* %364 = OpAccessChain %9 %14 
                                         f32 %365 = OpLoad %364 
                                         f32 %366 = OpFAdd %363 %365 
                                Private f32* %367 = OpAccessChain %9 %14 
                                                      OpStore %367 %366 
                                Private f32* %368 = OpAccessChain %9 %14 
                                         f32 %369 = OpLoad %368 
                                         f32 %370 = OpExtInst %1 37 %369 %26 
                                Private f32* %371 = OpAccessChain %9 %14 
                                                      OpStore %371 %370 
                                Private f32* %372 = OpAccessChain %9 %14 
                                         f32 %373 = OpLoad %372 
                                         f32 %374 = OpFNegate %373 
                                         f32 %375 = OpFAdd %374 %26 
                                Private f32* %376 = OpAccessChain %56 %286 
                                                      OpStore %376 %375 
                                       f32_4 %377 = OpLoad %75 
                                       f32_2 %378 = OpVectorShuffle %377 %377 2 3 
                               Output f32_4* %379 = OpAccessChain %285 %71 
                                       f32_4 %380 = OpLoad %379 
                                       f32_4 %381 = OpVectorShuffle %380 %378 0 1 4 5 
                                                      OpStore %379 %381 
                                       f32_4 %383 = OpLoad %117 
                                                      OpStore %382 %383 
                                       f32_2 %384 = OpLoad %188 
                                       f32_4 %385 = OpLoad vs_TEXCOORD0 
                                       f32_4 %386 = OpVectorShuffle %385 %384 0 1 4 5 
                                                      OpStore vs_TEXCOORD0 %386 
                                       f32_4 %388 = OpLoad %56 
                                                      OpStore vs_TEXCOORD1 %388 
                                Private u32* %390 = OpAccessChain %35 %286 
                                         u32 %391 = OpLoad %390 
                                         i32 %392 = OpBitcast %391 
                              Uniform f32_4* %393 = OpAccessChain %83 %84 %392 
                                       f32_4 %394 = OpLoad %393 
                                                      OpStore vs_TEXCOORD2 %394 
                                 Output f32* %396 = OpAccessChain %285 %71 %48 
                                         f32 %397 = OpLoad %396 
                                         f32 %398 = OpFNegate %397 
                                 Output f32* %399 = OpAccessChain %285 %71 %48 
                                                      OpStore %399 %398 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 201
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %11 %30 %33 %151 %195 %197 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpDecorate %11 BuiltIn TessLevelOuter 
                                              OpDecorate vs_TEXCOORD0 Location 30 
                                              OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD2 Flat 
                                              OpDecorate vs_TEXCOORD2 Location 33 
                                              OpDecorate %34 RelaxedPrecision 
                                              OpDecorate %35 RelaxedPrecision 
                                              OpDecorate %41 RelaxedPrecision 
                                              OpDecorate %42 RelaxedPrecision 
                                              OpMemberDecorate %69 0 Offset 69 
                                              OpDecorate %69 Block 
                                              OpDecorate %71 DescriptorSet 71 
                                              OpDecorate %71 Binding 71 
                                              OpDecorate %134 RelaxedPrecision 
                                              OpDecorate %137 RelaxedPrecision 
                                              OpDecorate %137 DescriptorSet 137 
                                              OpDecorate %137 Binding 137 
                                              OpDecorate %138 RelaxedPrecision 
                                              OpDecorate %141 RelaxedPrecision 
                                              OpDecorate %141 DescriptorSet 141 
                                              OpDecorate %141 Binding 141 
                                              OpDecorate %142 RelaxedPrecision 
                                              OpDecorate %148 RelaxedPrecision 
                                              OpDecorate %149 RelaxedPrecision 
                                              OpDecorate %150 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD1 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD1 Flat 
                                              OpDecorate vs_TEXCOORD1 Location 151 
                                              OpDecorate %153 RelaxedPrecision 
                                              OpDecorate %154 RelaxedPrecision 
                                              OpDecorate %156 RelaxedPrecision 
                                              OpDecorate %157 RelaxedPrecision 
                                              OpDecorate %157 DescriptorSet 157 
                                              OpDecorate %157 Binding 157 
                                              OpDecorate %158 RelaxedPrecision 
                                              OpDecorate %159 RelaxedPrecision 
                                              OpDecorate %159 DescriptorSet 159 
                                              OpDecorate %159 Binding 159 
                                              OpDecorate %160 RelaxedPrecision 
                                              OpDecorate %165 RelaxedPrecision 
                                              OpDecorate %166 RelaxedPrecision 
                                              OpDecorate %167 RelaxedPrecision 
                                              OpDecorate %168 RelaxedPrecision 
                                              OpDecorate %169 RelaxedPrecision 
                                              OpDecorate %170 RelaxedPrecision 
                                              OpDecorate %171 RelaxedPrecision 
                                              OpDecorate %172 RelaxedPrecision 
                                              OpDecorate %173 RelaxedPrecision 
                                              OpDecorate %174 RelaxedPrecision 
                                              OpDecorate %177 RelaxedPrecision 
                                              OpDecorate %178 RelaxedPrecision 
                                              OpDecorate %179 RelaxedPrecision 
                                              OpDecorate %180 RelaxedPrecision 
                                              OpDecorate %180 DescriptorSet 180 
                                              OpDecorate %180 Binding 180 
                                              OpDecorate %181 RelaxedPrecision 
                                              OpDecorate %182 RelaxedPrecision 
                                              OpDecorate %182 DescriptorSet 182 
                                              OpDecorate %182 Binding 182 
                                              OpDecorate %183 RelaxedPrecision 
                                              OpDecorate %188 RelaxedPrecision 
                                              OpDecorate %189 RelaxedPrecision 
                                              OpDecorate %190 RelaxedPrecision 
                                              OpDecorate %191 RelaxedPrecision 
                                              OpDecorate %192 RelaxedPrecision 
                                              OpDecorate %193 RelaxedPrecision 
                                              OpDecorate %195 RelaxedPrecision 
                                              OpDecorate %195 Location 195 
                                              OpDecorate %196 RelaxedPrecision 
                                              OpDecorate %197 RelaxedPrecision 
                                              OpDecorate %197 Location 197 
                                              OpDecorate %198 RelaxedPrecision 
                                              OpDecorate %199 RelaxedPrecision 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Function %7 
                                      %10 = OpTypePointer Input %7 
                         Input f32_4* %11 = OpVariable Input 
                                      %12 = OpTypeVector %6 3 
                                  f32 %15 = OpConstant 3.674022E-40 
                                      %16 = OpTypeInt 32 0 
                                  u32 %17 = OpConstant 3 
                                      %18 = OpTypePointer Input %6 
                                      %26 = OpTypeBool 
                                      %27 = OpTypeVector %26 4 
                                      %28 = OpTypePointer Private %27 
                      Private bool_4* %29 = OpVariable Private 
                Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                      %37 = OpTypeVector %26 2 
                                      %49 = OpTypePointer Private %7 
                       Private f32_4* %50 = OpVariable Private 
                                  f32 %51 = OpConstant 3.674022E-40 
                                f32_4 %52 = OpConstantComposite %51 %51 %51 %51 
                                f32_4 %53 = OpConstantComposite %15 %15 %15 %15 
                                      %57 = OpTypeVector %6 2 
                                      %65 = OpTypePointer Private %37 
                      Private bool_2* %66 = OpVariable Private 
                                      %69 = OpTypeStruct %7 
                                      %70 = OpTypePointer Uniform %69 
             Uniform struct {f32_4;}* %71 = OpVariable Uniform 
                                      %72 = OpTypeInt 32 1 
                                  i32 %73 = OpConstant 0 
                                      %74 = OpTypePointer Uniform %7 
                                      %80 = OpTypePointer Private %57 
                       Private f32_2* %81 = OpVariable Private 
                                f32_2 %82 = OpConstantComposite %51 %51 
                                f32_2 %83 = OpConstantComposite %15 %15 
                                 u32 %109 = OpConstant 2 
                                     %110 = OpTypePointer Private %6 
                                 f32 %114 = OpConstant 3.674022E-40 
                               f32_3 %115 = OpConstantComposite %15 %15 %114 
                                 u32 %117 = OpConstant 0 
                                     %122 = OpTypePointer Private %26 
                                 i32 %126 = OpConstant 1 
                                 i32 %128 = OpConstant -1 
                        Private f32* %134 = OpVariable Private 
                                     %135 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %136 = OpTypePointer UniformConstant %135 
UniformConstant read_only Texture2D* %137 = OpVariable UniformConstant 
                                     %139 = OpTypeSampler 
                                     %140 = OpTypePointer UniformConstant %139 
            UniformConstant sampler* %141 = OpVariable UniformConstant 
                                     %143 = OpTypeSampledImage %135 
                      Private f32_4* %149 = OpVariable Private 
                Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                      Private f32_4* %156 = OpVariable Private 
UniformConstant read_only Texture2D* %157 = OpVariable UniformConstant 
            UniformConstant sampler* %159 = OpVariable UniformConstant 
                      Private f32_4* %165 = OpVariable Private 
UniformConstant read_only Texture2D* %180 = OpVariable UniformConstant 
            UniformConstant sampler* %182 = OpVariable UniformConstant 
                                     %194 = OpTypePointer Output %7 
                       Output f32_4* %195 = OpVariable Output 
                        Input f32_4* %197 = OpVariable Input 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                       Function f32_4* %9 = OpVariable Function 
                                f32_4 %13 = OpLoad %11 
                                f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                           Input f32* %19 = OpAccessChain %11 %17 
                                  f32 %20 = OpLoad %19 
                                  f32 %21 = OpFDiv %15 %20 
                                  f32 %22 = OpCompositeExtract %14 0 
                                  f32 %23 = OpCompositeExtract %14 1 
                                  f32 %24 = OpCompositeExtract %14 2 
                                f32_4 %25 = OpCompositeConstruct %22 %23 %24 %21 
                                              OpStore %9 %25 
                                f32_4 %31 = OpLoad vs_TEXCOORD0 
                                f32_4 %32 = OpVectorShuffle %31 %31 2 3 2 2 
                                f32_4 %34 = OpLoad vs_TEXCOORD2 
                                f32_4 %35 = OpVectorShuffle %34 %34 0 1 0 0 
                               bool_4 %36 = OpFOrdGreaterThanEqual %32 %35 
                               bool_2 %38 = OpVectorShuffle %36 %36 0 1 
                               bool_4 %39 = OpLoad %29 
                               bool_4 %40 = OpVectorShuffle %39 %38 4 5 2 3 
                                              OpStore %29 %40 
                                f32_4 %41 = OpLoad vs_TEXCOORD2 
                                f32_4 %42 = OpVectorShuffle %41 %41 2 2 2 3 
                                f32_4 %43 = OpLoad vs_TEXCOORD0 
                                f32_4 %44 = OpVectorShuffle %43 %43 2 2 2 3 
                               bool_4 %45 = OpFOrdGreaterThanEqual %42 %44 
                               bool_2 %46 = OpVectorShuffle %45 %45 2 3 
                               bool_4 %47 = OpLoad %29 
                               bool_4 %48 = OpVectorShuffle %47 %46 0 1 4 5 
                                              OpStore %29 %48 
                               bool_4 %54 = OpLoad %29 
                                f32_4 %55 = OpSelect %54 %53 %52 
                                f32_4 %56 = OpExtInst %1 46 %52 %53 %55 
                                              OpStore %50 %56 
                                f32_4 %58 = OpLoad %50 
                                f32_2 %59 = OpVectorShuffle %58 %58 2 3 
                                f32_4 %60 = OpLoad %50 
                                f32_2 %61 = OpVectorShuffle %60 %60 0 1 
                                f32_2 %62 = OpFAdd %59 %61 
                                f32_4 %63 = OpLoad %50 
                                f32_4 %64 = OpVectorShuffle %63 %62 4 5 2 3 
                                              OpStore %50 %64 
                                f32_4 %67 = OpLoad %9 
                                f32_4 %68 = OpVectorShuffle %67 %67 0 1 0 1 
                       Uniform f32_4* %75 = OpAccessChain %71 %73 
                                f32_4 %76 = OpLoad %75 
                                f32_4 %77 = OpVectorShuffle %76 %76 0 1 0 1 
                               bool_4 %78 = OpFOrdGreaterThanEqual %68 %77 
                               bool_2 %79 = OpVectorShuffle %78 %78 0 1 
                                              OpStore %66 %79 
                               bool_2 %84 = OpLoad %66 
                                f32_2 %85 = OpSelect %84 %83 %82 
                                f32_2 %86 = OpExtInst %1 46 %82 %83 %85 
                                              OpStore %81 %86 
                                f32_2 %87 = OpLoad %81 
                                f32_4 %88 = OpLoad %50 
                                f32_2 %89 = OpVectorShuffle %88 %88 0 1 
                                f32_2 %90 = OpFAdd %87 %89 
                                f32_4 %91 = OpLoad %50 
                                f32_4 %92 = OpVectorShuffle %91 %90 4 5 2 3 
                                              OpStore %50 %92 
                       Uniform f32_4* %93 = OpAccessChain %71 %73 
                                f32_4 %94 = OpLoad %93 
                                f32_4 %95 = OpVectorShuffle %94 %94 2 3 2 3 
                                f32_4 %96 = OpLoad %9 
                                f32_4 %97 = OpVectorShuffle %96 %96 0 1 0 1 
                               bool_4 %98 = OpFOrdGreaterThanEqual %95 %97 
                               bool_2 %99 = OpVectorShuffle %98 %98 0 1 
                                              OpStore %66 %99 
                              bool_2 %100 = OpLoad %66 
                               f32_2 %101 = OpSelect %100 %83 %82 
                               f32_2 %102 = OpExtInst %1 46 %82 %83 %101 
                                              OpStore %81 %102 
                               f32_2 %103 = OpLoad %81 
                               f32_4 %104 = OpLoad %50 
                               f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                               f32_2 %106 = OpFAdd %103 %105 
                               f32_4 %107 = OpLoad %50 
                               f32_4 %108 = OpVectorShuffle %107 %106 4 5 2 3 
                                              OpStore %50 %108 
                        Private f32* %111 = OpAccessChain %50 %109 
                                              OpStore %111 %15 
                               f32_4 %112 = OpLoad %50 
                               f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                                 f32 %116 = OpDot %113 %115 
                        Private f32* %118 = OpAccessChain %50 %117 
                                              OpStore %118 %116 
                        Private f32* %119 = OpAccessChain %50 %117 
                                 f32 %120 = OpLoad %119 
                                bool %121 = OpFOrdLessThan %120 %51 
                       Private bool* %123 = OpAccessChain %29 %117 
                                              OpStore %123 %121 
                       Private bool* %124 = OpAccessChain %29 %117 
                                bool %125 = OpLoad %124 
                                 i32 %127 = OpSelect %125 %126 %73 
                                 i32 %129 = OpIMul %127 %128 
                                bool %130 = OpINotEqual %129 %73 
                                              OpSelectionMerge %132 None 
                                              OpBranchConditional %130 %131 %132 
                                     %131 = OpLabel 
                                              OpKill
                                     %132 = OpLabel 
                 read_only Texture2D %138 = OpLoad %137 
                             sampler %142 = OpLoad %141 
          read_only Texture2DSampled %144 = OpSampledImage %138 %142 
                               f32_4 %145 = OpLoad vs_TEXCOORD0 
                               f32_2 %146 = OpVectorShuffle %145 %145 0 1 
                               f32_4 %147 = OpImageSampleImplicitLod %144 %146 
                                 f32 %148 = OpCompositeExtract %147 3 
                                              OpStore %134 %148 
                                 f32 %150 = OpLoad %134 
                          Input f32* %152 = OpAccessChain vs_TEXCOORD1 %117 
                                 f32 %153 = OpLoad %152 
                                 f32 %154 = OpFMul %150 %153 
                        Private f32* %155 = OpAccessChain %149 %17 
                                              OpStore %155 %154 
                 read_only Texture2D %158 = OpLoad %157 
                             sampler %160 = OpLoad %159 
          read_only Texture2DSampled %161 = OpSampledImage %158 %160 
                               f32_4 %162 = OpLoad vs_TEXCOORD0 
                               f32_2 %163 = OpVectorShuffle %162 %162 0 1 
                               f32_4 %164 = OpImageSampleImplicitLod %161 %163 
                                              OpStore %156 %164 
                               f32_4 %166 = OpLoad %156 
                               f32_4 %167 = OpLoad vs_TEXCOORD1 
                               f32_4 %168 = OpVectorShuffle %167 %167 1 1 1 1 
                               f32_4 %169 = OpFMul %166 %168 
                               f32_4 %170 = OpLoad vs_TEXCOORD1 
                               f32_4 %171 = OpVectorShuffle %170 %170 3 3 3 3 
                               f32_4 %172 = OpFAdd %169 %171 
                                              OpStore %165 %172 
                               f32_4 %173 = OpLoad vs_TEXCOORD1 
                               f32_3 %174 = OpVectorShuffle %173 %173 0 0 0 
                               f32_4 %175 = OpLoad %149 
                               f32_4 %176 = OpVectorShuffle %175 %174 4 5 6 3 
                                              OpStore %149 %176 
                               f32_4 %177 = OpLoad %149 
                               f32_4 %178 = OpLoad %165 
                               f32_4 %179 = OpFAdd %177 %178 
                                              OpStore %149 %179 
                 read_only Texture2D %181 = OpLoad %180 
                             sampler %183 = OpLoad %182 
          read_only Texture2DSampled %184 = OpSampledImage %181 %183 
                               f32_4 %185 = OpLoad vs_TEXCOORD0 
                               f32_2 %186 = OpVectorShuffle %185 %185 0 1 
                               f32_4 %187 = OpImageSampleImplicitLod %184 %186 
                                              OpStore %156 %187 
                               f32_4 %188 = OpLoad %156 
                               f32_4 %189 = OpLoad vs_TEXCOORD1 
                               f32_4 %190 = OpVectorShuffle %189 %189 2 2 2 2 
                               f32_4 %191 = OpFMul %188 %190 
                               f32_4 %192 = OpLoad %149 
                               f32_4 %193 = OpFAdd %191 %192 
                                              OpStore %149 %193 
                               f32_4 %196 = OpLoad %149 
                               f32_4 %198 = OpLoad %197 
                               f32_4 %199 = OpFMul %196 %198 
                                              OpStore %195 %199 
                                              OpReturn
                                              OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 401
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %12 %95 %167 %285 %337 %350 %382 %387 %389 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %77 ArrayStride 77 
                                                      OpDecorate %78 ArrayStride 78 
                                                      OpDecorate %80 ArrayStride 80 
                                                      OpMemberDecorate %81 0 Offset 81 
                                                      OpMemberDecorate %81 1 Offset 81 
                                                      OpMemberDecorate %81 2 Offset 81 
                                                      OpMemberDecorate %81 3 Offset 81 
                                                      OpMemberDecorate %81 4 RelaxedPrecision 
                                                      OpMemberDecorate %81 4 Offset 81 
                                                      OpMemberDecorate %81 5 Offset 81 
                                                      OpMemberDecorate %81 6 Offset 81 
                                                      OpDecorate %81 Block 
                                                      OpDecorate %83 DescriptorSet 83 
                                                      OpDecorate %83 Binding 83 
                                                      OpDecorate %95 Location 95 
                                                      OpDecorate %167 Location 167 
                                                      OpMemberDecorate %283 0 BuiltIn 283 
                                                      OpMemberDecorate %283 1 BuiltIn 283 
                                                      OpMemberDecorate %283 2 BuiltIn 283 
                                                      OpDecorate %283 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 337 
                                                      OpDecorate %350 Location 350 
                                                      OpDecorate %354 RelaxedPrecision 
                                                      OpDecorate %382 RelaxedPrecision 
                                                      OpDecorate %382 Location 382 
                                                      OpDecorate vs_TEXCOORD1 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Flat 
                                                      OpDecorate vs_TEXCOORD1 Location 387 
                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 Flat 
                                                      OpDecorate vs_TEXCOORD2 Location 389 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %13 = OpTypeInt 32 0 
                                          u32 %14 = OpConstant 0 
                                              %15 = OpTypePointer Input %6 
                                          f32 %18 = OpConstant 3.674022E-40 
                                              %20 = OpTypePointer Private %6 
                                        f32_3 %24 = OpConstantComposite %18 %18 %18 
                                          f32 %26 = OpConstant 3.674022E-40 
                                          f32 %27 = OpConstant 3.674022E-40 
                                          f32 %28 = OpConstant 3.674022E-40 
                                        f32_3 %29 = OpConstantComposite %26 %27 %28 
                                              %33 = OpTypeVector %13 4 
                                              %34 = OpTypePointer Private %33 
                               Private u32_4* %35 = OpVariable Private 
                                              %38 = OpTypeInt 32 1 
                                              %39 = OpTypeVector %38 4 
                                              %40 = OpTypePointer Private %39 
                               Private i32_4* %41 = OpVariable Private 
                                        f32_4 %44 = OpConstantComposite %18 %28 %27 %26 
                                              %45 = OpTypeBool 
                                              %46 = OpTypeVector %45 4 
                                          u32 %48 = OpConstant 1 
                                        u32_4 %49 = OpConstantComposite %14 %14 %14 %14 
                                        u32_4 %50 = OpConstantComposite %48 %48 %48 %48 
                                          u32 %52 = OpConstant 4294967295 
                               Private f32_4* %56 = OpVariable Private 
                                              %57 = OpTypeVector %38 3 
                                              %60 = OpTypeVector %13 3 
                                          u32 %62 = OpConstant 1065353216 
                                        u32_3 %63 = OpConstantComposite %62 %62 %62 
                                              %68 = OpTypePointer Private %38 
                                          i32 %71 = OpConstant 0 
                               Private f32_4* %75 = OpVariable Private 
                                          u32 %76 = OpConstant 4 
                                              %77 = OpTypeArray %7 %76 
                                              %78 = OpTypeArray %7 %76 
                                          u32 %79 = OpConstant 80 
                                              %80 = OpTypeArray %7 %79 
                                              %81 = OpTypeStruct %77 %78 %7 %7 %7 %7 %80 
                                              %82 = OpTypePointer Uniform %81 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32_4; f32_4[80];}* %83 = OpVariable Uniform 
                                          i32 %84 = OpConstant 6 
                                              %85 = OpTypePointer Private %13 
                                              %89 = OpTypeVector %6 2 
                                              %90 = OpTypePointer Uniform %7 
                                              %94 = OpTypePointer Input %89 
                                 Input f32_2* %95 = OpVariable Input 
                                             %108 = OpTypePointer Private %89 
                              Private f32_2* %109 = OpVariable Private 
                                         i32 %112 = OpConstant 5 
                              Private f32_4* %117 = OpVariable Private 
                                         f32 %136 = OpConstant 3.674022E-40 
                                         f32 %147 = OpConstant 3.674022E-40 
                                         f32 %158 = OpConstant 3.674022E-40 
                                             %166 = OpTypePointer Input %7 
                                Input f32_4* %167 = OpVariable Input 
                                         u32 %179 = OpConstant 2 
                              Private f32_2* %188 = OpVariable Private 
                                         i32 %195 = OpConstant 1 
                                         i32 %206 = OpConstant 2 
                                         i32 %215 = OpConstant 3 
                              Private f32_4* %219 = OpVariable Private 
                                       f32_2 %248 = OpConstantComposite %26 %26 
                                         f32 %262 = OpConstant 3.674022E-40 
                                       f32_2 %263 = OpConstantComposite %262 %262 
                                       f32_2 %278 = OpConstantComposite %147 %147 
                                             %282 = OpTypeArray %6 %48 
                                             %283 = OpTypeStruct %7 %6 %282 
                                             %284 = OpTypePointer Output %283 
        Output struct {f32_4; f32; f32[1];}* %285 = OpVariable Output 
                                         u32 %286 = OpConstant 3 
                                             %290 = OpTypePointer Function %89 
                                             %300 = OpTypePointer Output %7 
                                             %315 = OpTypePointer Private %45 
                               Private bool* %316 = OpVariable Private 
                                Private i32* %320 = OpVariable Private 
                                             %322 = OpTypePointer Function %38 
                              Private f32_2* %330 = OpVariable Private 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_4* %350 = OpVariable Input 
                                         i32 %352 = OpConstant 4 
                               Output f32_4* %382 = OpVariable Output 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                             %395 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_2* %291 = OpVariable Function 
                               Function i32* %323 = OpVariable Function 
                             Function f32_2* %340 = OpVariable Function 
                                   Input f32* %16 = OpAccessChain %12 %14 
                                          f32 %17 = OpLoad %16 
                                          f32 %19 = OpFMul %17 %18 
                                 Private f32* %21 = OpAccessChain %9 %14 
                                                      OpStore %21 %19 
                                        f32_3 %22 = OpLoad %12 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 0 1 
                                        f32_3 %25 = OpFMul %23 %24 
                                        f32_3 %30 = OpFAdd %25 %29 
                                        f32_4 %31 = OpLoad %9 
                                        f32_4 %32 = OpVectorShuffle %31 %30 0 4 5 6 
                                                      OpStore %9 %32 
                                        f32_4 %36 = OpLoad %9 
                                        u32_4 %37 = OpConvertFToU %36 
                                                      OpStore %35 %37 
                                        f32_3 %42 = OpLoad %12 
                                        f32_4 %43 = OpVectorShuffle %42 %42 2 2 2 2 
                                       bool_4 %47 = OpFOrdEqual %43 %44 
                                        u32_4 %51 = OpSelect %47 %50 %49 
                                        u32_4 %53 = OpCompositeConstruct %52 %52 %52 %52 
                                        u32_4 %54 = OpIMul %51 %53 
                                        i32_4 %55 = OpBitcast %54 
                                                      OpStore %41 %55 
                                        i32_4 %58 = OpLoad %41 
                                        i32_3 %59 = OpVectorShuffle %58 %58 3 2 1 
                                        u32_3 %61 = OpBitcast %59 
                                        u32_3 %64 = OpBitwiseAnd %61 %63 
                                        f32_3 %65 = OpBitcast %64 
                                        f32_4 %66 = OpLoad %56 
                                        f32_4 %67 = OpVectorShuffle %66 %65 4 5 6 3 
                                                      OpStore %56 %67 
                                 Private i32* %69 = OpAccessChain %41 %14 
                                          i32 %70 = OpLoad %69 
                                         bool %72 = OpINotEqual %70 %71 
                                                      OpSelectionMerge %74 None 
                                                      OpBranchConditional %72 %73 %157 
                                              %73 = OpLabel 
                                 Private u32* %86 = OpAccessChain %35 %14 
                                          u32 %87 = OpLoad %86 
                                          i32 %88 = OpBitcast %87 
                               Uniform f32_4* %91 = OpAccessChain %83 %84 %88 
                                        f32_4 %92 = OpLoad %91 
                                        f32_2 %93 = OpVectorShuffle %92 %92 0 1 
                                        f32_2 %96 = OpLoad %95 
                                          f32 %97 = OpDot %93 %96 
                                 Private f32* %98 = OpAccessChain %75 %14 
                                                      OpStore %98 %97 
                                 Private u32* %99 = OpAccessChain %35 %48 
                                         u32 %100 = OpLoad %99 
                                         i32 %101 = OpBitcast %100 
                              Uniform f32_4* %102 = OpAccessChain %83 %84 %101 
                                       f32_4 %103 = OpLoad %102 
                                       f32_2 %104 = OpVectorShuffle %103 %103 0 1 
                                       f32_2 %105 = OpLoad %95 
                                         f32 %106 = OpDot %104 %105 
                                Private f32* %107 = OpAccessChain %75 %48 
                                                      OpStore %107 %106 
                                       f32_4 %110 = OpLoad %75 
                                       f32_2 %111 = OpVectorShuffle %110 %110 0 1 
                              Uniform f32_4* %113 = OpAccessChain %83 %112 
                                       f32_4 %114 = OpLoad %113 
                                       f32_2 %115 = OpVectorShuffle %114 %114 2 3 
                                       f32_2 %116 = OpFMul %111 %115 
                                                      OpStore %109 %116 
                                       f32_2 %118 = OpLoad %109 
                                       f32_2 %119 = OpLoad %109 
                                         f32 %120 = OpDot %118 %119 
                                Private f32* %121 = OpAccessChain %117 %14 
                                                      OpStore %121 %120 
                                Private f32* %122 = OpAccessChain %117 %14 
                                         f32 %123 = OpLoad %122 
                                         f32 %124 = OpExtInst %1 31 %123 
                                Private f32* %125 = OpAccessChain %117 %14 
                                                      OpStore %125 %124 
                                Private f32* %126 = OpAccessChain %117 %14 
                                         f32 %127 = OpLoad %126 
                                         f32 %128 = OpExtInst %1 40 %127 %26 
                                Private f32* %129 = OpAccessChain %109 %14 
                                                      OpStore %129 %128 
                                Private f32* %130 = OpAccessChain %109 %14 
                                         f32 %131 = OpLoad %130 
                                         f32 %132 = OpExtInst %1 2 %131 
                                Private f32* %133 = OpAccessChain %109 %14 
                                                      OpStore %133 %132 
                                Private f32* %134 = OpAccessChain %117 %14 
                                         f32 %135 = OpLoad %134 
                                         f32 %137 = OpFAdd %135 %136 
                                Private f32* %138 = OpAccessChain %117 %14 
                                                      OpStore %138 %137 
                                Private f32* %139 = OpAccessChain %109 %14 
                                         f32 %140 = OpLoad %139 
                                Private f32* %141 = OpAccessChain %117 %14 
                                         f32 %142 = OpLoad %141 
                                         f32 %143 = OpFDiv %140 %142 
                                Private f32* %144 = OpAccessChain %117 %14 
                                                      OpStore %144 %143 
                                Private f32* %145 = OpAccessChain %117 %14 
                                         f32 %146 = OpLoad %145 
                                         f32 %148 = OpFAdd %146 %147 
                                Private f32* %149 = OpAccessChain %117 %14 
                                                      OpStore %149 %148 
                                       f32_4 %150 = OpLoad %75 
                                       f32_2 %151 = OpVectorShuffle %150 %150 0 1 
                                       f32_4 %152 = OpLoad %117 
                                       f32_2 %153 = OpVectorShuffle %152 %152 0 0 
                                       f32_2 %154 = OpFMul %151 %153 
                                       f32_4 %155 = OpLoad %75 
                                       f32_4 %156 = OpVectorShuffle %155 %154 4 5 2 3 
                                                      OpStore %75 %156 
                                                      OpBranch %74 
                                             %157 = OpLabel 
                                Private f32* %159 = OpAccessChain %75 %14 
                                                      OpStore %159 %158 
                                Private f32* %160 = OpAccessChain %75 %48 
                                                      OpStore %160 %158 
                                                      OpBranch %74 
                                              %74 = OpLabel 
                                Private u32* %161 = OpAccessChain %35 %14 
                                         u32 %162 = OpLoad %161 
                                         i32 %163 = OpBitcast %162 
                              Uniform f32_4* %164 = OpAccessChain %83 %84 %163 
                                       f32_4 %165 = OpLoad %164 
                                       f32_4 %168 = OpLoad %167 
                                         f32 %169 = OpDot %165 %168 
                                Private f32* %170 = OpAccessChain %109 %14 
                                                      OpStore %170 %169 
                                Private u32* %171 = OpAccessChain %35 %48 
                                         u32 %172 = OpLoad %171 
                                         i32 %173 = OpBitcast %172 
                              Uniform f32_4* %174 = OpAccessChain %83 %84 %173 
                                       f32_4 %175 = OpLoad %174 
                                       f32_4 %176 = OpLoad %167 
                                         f32 %177 = OpDot %175 %176 
                                Private f32* %178 = OpAccessChain %109 %48 
                                                      OpStore %178 %177 
                                Private u32* %180 = OpAccessChain %35 %179 
                                         u32 %181 = OpLoad %180 
                                         i32 %182 = OpBitcast %181 
                              Uniform f32_4* %183 = OpAccessChain %83 %84 %182 
                                       f32_4 %184 = OpLoad %183 
                                       f32_4 %185 = OpLoad %167 
                                         f32 %186 = OpDot %184 %185 
                                Private f32* %187 = OpAccessChain %9 %14 
                                                      OpStore %187 %186 
                                       f32_4 %189 = OpLoad %75 
                                       f32_2 %190 = OpVectorShuffle %189 %189 0 1 
                                       f32_2 %191 = OpLoad %109 
                                       f32_2 %192 = OpFAdd %190 %191 
                                                      OpStore %188 %192 
                                       f32_2 %193 = OpLoad %188 
                                       f32_4 %194 = OpVectorShuffle %193 %193 1 1 1 1 
                              Uniform f32_4* %196 = OpAccessChain %83 %71 %195 
                                       f32_4 %197 = OpLoad %196 
                                       f32_4 %198 = OpFMul %194 %197 
                                                      OpStore %75 %198 
                              Uniform f32_4* %199 = OpAccessChain %83 %71 %71 
                                       f32_4 %200 = OpLoad %199 
                                       f32_2 %201 = OpLoad %188 
                                       f32_4 %202 = OpVectorShuffle %201 %201 0 0 0 0 
                                       f32_4 %203 = OpFMul %200 %202 
                                       f32_4 %204 = OpLoad %75 
                                       f32_4 %205 = OpFAdd %203 %204 
                                                      OpStore %75 %205 
                              Uniform f32_4* %207 = OpAccessChain %83 %71 %206 
                                       f32_4 %208 = OpLoad %207 
                                       f32_4 %209 = OpLoad %9 
                                       f32_4 %210 = OpVectorShuffle %209 %209 0 0 0 0 
                                       f32_4 %211 = OpFMul %208 %210 
                                       f32_4 %212 = OpLoad %75 
                                       f32_4 %213 = OpFAdd %211 %212 
                                                      OpStore %75 %213 
                                       f32_4 %214 = OpLoad %75 
                              Uniform f32_4* %216 = OpAccessChain %83 %71 %215 
                                       f32_4 %217 = OpLoad %216 
                                       f32_4 %218 = OpFAdd %214 %217 
                                                      OpStore %75 %218 
                                       f32_4 %220 = OpLoad %75 
                                       f32_4 %221 = OpVectorShuffle %220 %220 1 1 1 1 
                              Uniform f32_4* %222 = OpAccessChain %83 %195 %195 
                                       f32_4 %223 = OpLoad %222 
                                       f32_4 %224 = OpFMul %221 %223 
                                                      OpStore %219 %224 
                              Uniform f32_4* %225 = OpAccessChain %83 %195 %71 
                                       f32_4 %226 = OpLoad %225 
                                       f32_4 %227 = OpLoad %75 
                                       f32_4 %228 = OpVectorShuffle %227 %227 0 0 0 0 
                                       f32_4 %229 = OpFMul %226 %228 
                                       f32_4 %230 = OpLoad %219 
                                       f32_4 %231 = OpFAdd %229 %230 
                                                      OpStore %219 %231 
                              Uniform f32_4* %232 = OpAccessChain %83 %195 %206 
                                       f32_4 %233 = OpLoad %232 
                                       f32_4 %234 = OpLoad %75 
                                       f32_4 %235 = OpVectorShuffle %234 %234 2 2 2 2 
                                       f32_4 %236 = OpFMul %233 %235 
                                       f32_4 %237 = OpLoad %219 
                                       f32_4 %238 = OpFAdd %236 %237 
                                                      OpStore %219 %238 
                              Uniform f32_4* %239 = OpAccessChain %83 %195 %215 
                                       f32_4 %240 = OpLoad %239 
                                       f32_4 %241 = OpLoad %75 
                                       f32_4 %242 = OpVectorShuffle %241 %241 3 3 3 3 
                                       f32_4 %243 = OpFMul %240 %242 
                                       f32_4 %244 = OpLoad %219 
                                       f32_4 %245 = OpFAdd %243 %244 
                                                      OpStore %75 %245 
                                       f32_4 %246 = OpLoad %75 
                                       f32_2 %247 = OpVectorShuffle %246 %246 0 1 
                                       f32_2 %249 = OpFAdd %247 %248 
                                       f32_4 %250 = OpLoad %219 
                                       f32_4 %251 = OpVectorShuffle %250 %249 4 5 2 3 
                                                      OpStore %219 %251 
                                       f32_4 %252 = OpLoad %219 
                                       f32_2 %253 = OpVectorShuffle %252 %252 0 1 
                              Uniform f32_4* %254 = OpAccessChain %83 %112 
                                       f32_4 %255 = OpLoad %254 
                                       f32_2 %256 = OpVectorShuffle %255 %255 0 1 
                                       f32_2 %257 = OpFDiv %253 %256 
                                       f32_4 %258 = OpLoad %219 
                                       f32_4 %259 = OpVectorShuffle %258 %257 4 5 2 3 
                                                      OpStore %219 %259 
                                       f32_4 %260 = OpLoad %219 
                                       f32_2 %261 = OpVectorShuffle %260 %260 0 1 
                                       f32_2 %264 = OpFAdd %261 %263 
                                       f32_4 %265 = OpLoad %219 
                                       f32_4 %266 = OpVectorShuffle %265 %264 4 5 2 3 
                                                      OpStore %219 %266 
                                       f32_4 %267 = OpLoad %219 
                                       f32_2 %268 = OpVectorShuffle %267 %267 0 1 
                                       f32_2 %269 = OpExtInst %1 3 %268 
                                       f32_4 %270 = OpLoad %219 
                                       f32_4 %271 = OpVectorShuffle %270 %269 4 5 2 3 
                                                      OpStore %219 %271 
                                       f32_4 %272 = OpLoad %219 
                                       f32_2 %273 = OpVectorShuffle %272 %272 0 1 
                              Uniform f32_4* %274 = OpAccessChain %83 %112 
                                       f32_4 %275 = OpLoad %274 
                                       f32_2 %276 = OpVectorShuffle %275 %275 0 1 
                                       f32_2 %277 = OpFMul %273 %276 
                                       f32_2 %279 = OpFAdd %277 %278 
                                       f32_4 %280 = OpLoad %219 
                                       f32_4 %281 = OpVectorShuffle %280 %279 4 5 2 3 
                                                      OpStore %219 %281 
                                Private i32* %287 = OpAccessChain %41 %286 
                                         i32 %288 = OpLoad %287 
                                        bool %289 = OpINotEqual %288 %71 
                                                      OpSelectionMerge %293 None 
                                                      OpBranchConditional %289 %292 %296 
                                             %292 = OpLabel 
                                       f32_4 %294 = OpLoad %219 
                                       f32_2 %295 = OpVectorShuffle %294 %294 0 1 
                                                      OpStore %291 %295 
                                                      OpBranch %293 
                                             %296 = OpLabel 
                                       f32_4 %297 = OpLoad %75 
                                       f32_2 %298 = OpVectorShuffle %297 %297 0 1 
                                                      OpStore %291 %298 
                                                      OpBranch %293 
                                             %293 = OpLabel 
                                       f32_2 %299 = OpLoad %291 
                               Output f32_4* %301 = OpAccessChain %285 %71 
                                       f32_4 %302 = OpLoad %301 
                                       f32_4 %303 = OpVectorShuffle %302 %299 4 5 2 3 
                                                      OpStore %301 %303 
                                       f32_2 %304 = OpLoad %95 
                              Uniform f32_4* %305 = OpAccessChain %83 %206 
                                       f32_4 %306 = OpLoad %305 
                                       f32_2 %307 = OpVectorShuffle %306 %306 0 1 
                                       f32_2 %308 = OpFMul %304 %307 
                              Uniform f32_4* %309 = OpAccessChain %83 %206 
                                       f32_4 %310 = OpLoad %309 
                                       f32_2 %311 = OpVectorShuffle %310 %310 2 3 
                                       f32_2 %312 = OpFAdd %308 %311 
                                       f32_4 %313 = OpLoad %117 
                                       f32_4 %314 = OpVectorShuffle %313 %312 4 1 2 5 
                                                      OpStore %117 %314 
                                Private i32* %317 = OpAccessChain %41 %48 
                                         i32 %318 = OpLoad %317 
                                        bool %319 = OpIEqual %318 %71 
                                                      OpStore %316 %319 
                                        bool %321 = OpLoad %316 
                                                      OpSelectionMerge %325 None 
                                                      OpBranchConditional %321 %324 %328 
                                             %324 = OpLabel 
                                Private i32* %326 = OpAccessChain %41 %179 
                                         i32 %327 = OpLoad %326 
                                                      OpStore %323 %327 
                                                      OpBranch %325 
                                             %328 = OpLabel 
                                                      OpStore %323 %71 
                                                      OpBranch %325 
                                             %325 = OpLabel 
                                         i32 %329 = OpLoad %323 
                                                      OpStore %320 %329 
                                       f32_4 %331 = OpLoad %117 
                                       f32_2 %332 = OpVectorShuffle %331 %331 0 3 
                              Uniform f32_4* %333 = OpAccessChain %83 %215 
                                       f32_4 %334 = OpLoad %333 
                                       f32_2 %335 = OpVectorShuffle %334 %334 0 1 
                                       f32_2 %336 = OpFMul %332 %335 
                                                      OpStore %330 %336 
                                         i32 %338 = OpLoad %320 
                                        bool %339 = OpINotEqual %338 %71 
                                                      OpSelectionMerge %342 None 
                                                      OpBranchConditional %339 %341 %344 
                                             %341 = OpLabel 
                                       f32_2 %343 = OpLoad %330 
                                                      OpStore %340 %343 
                                                      OpBranch %342 
                                             %344 = OpLabel 
                                       f32_4 %345 = OpLoad %117 
                                       f32_2 %346 = OpVectorShuffle %345 %345 0 3 
                                                      OpStore %340 %346 
                                                      OpBranch %342 
                                             %342 = OpLabel 
                                       f32_2 %347 = OpLoad %340 
                                       f32_4 %348 = OpLoad vs_TEXCOORD0 
                                       f32_4 %349 = OpVectorShuffle %348 %347 4 5 2 3 
                                                      OpStore vs_TEXCOORD0 %349 
                                       f32_4 %351 = OpLoad %350 
                              Uniform f32_4* %353 = OpAccessChain %83 %352 
                                       f32_4 %354 = OpLoad %353 
                                       f32_4 %355 = OpFMul %351 %354 
                                                      OpStore %117 %355 
                                Private f32* %356 = OpAccessChain %56 %48 
                                         f32 %357 = OpLoad %356 
                                Private f32* %358 = OpAccessChain %56 %14 
                                         f32 %359 = OpLoad %358 
                                         f32 %360 = OpFAdd %357 %359 
                                Private f32* %361 = OpAccessChain %9 %14 
                                                      OpStore %361 %360 
                                Private f32* %362 = OpAccessChain %56 %179 
                                         f32 %363 = OpLoad %362 
                                Private f32* %364 = OpAccessChain %9 %14 
                                         f32 %365 = OpLoad %364 
                                         f32 %366 = OpFAdd %363 %365 
                                Private f32* %367 = OpAccessChain %9 %14 
                                                      OpStore %367 %366 
                                Private f32* %368 = OpAccessChain %9 %14 
                                         f32 %369 = OpLoad %368 
                                         f32 %370 = OpExtInst %1 37 %369 %26 
                                Private f32* %371 = OpAccessChain %9 %14 
                                                      OpStore %371 %370 
                                Private f32* %372 = OpAccessChain %9 %14 
                                         f32 %373 = OpLoad %372 
                                         f32 %374 = OpFNegate %373 
                                         f32 %375 = OpFAdd %374 %26 
                                Private f32* %376 = OpAccessChain %56 %286 
                                                      OpStore %376 %375 
                                       f32_4 %377 = OpLoad %75 
                                       f32_2 %378 = OpVectorShuffle %377 %377 2 3 
                               Output f32_4* %379 = OpAccessChain %285 %71 
                                       f32_4 %380 = OpLoad %379 
                                       f32_4 %381 = OpVectorShuffle %380 %378 0 1 4 5 
                                                      OpStore %379 %381 
                                       f32_4 %383 = OpLoad %117 
                                                      OpStore %382 %383 
                                       f32_2 %384 = OpLoad %188 
                                       f32_4 %385 = OpLoad vs_TEXCOORD0 
                                       f32_4 %386 = OpVectorShuffle %385 %384 0 1 4 5 
                                                      OpStore vs_TEXCOORD0 %386 
                                       f32_4 %388 = OpLoad %56 
                                                      OpStore vs_TEXCOORD1 %388 
                                Private u32* %390 = OpAccessChain %35 %286 
                                         u32 %391 = OpLoad %390 
                                         i32 %392 = OpBitcast %391 
                              Uniform f32_4* %393 = OpAccessChain %83 %84 %392 
                                       f32_4 %394 = OpLoad %393 
                                                      OpStore vs_TEXCOORD2 %394 
                                 Output f32* %396 = OpAccessChain %285 %71 %48 
                                         f32 %397 = OpLoad %396 
                                         f32 %398 = OpFNegate %397 
                                 Output f32* %399 = OpAccessChain %285 %71 %48 
                                                      OpStore %399 %398 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 201
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %11 %30 %33 %151 %195 %197 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpDecorate %11 BuiltIn TessLevelOuter 
                                              OpDecorate vs_TEXCOORD0 Location 30 
                                              OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD2 Flat 
                                              OpDecorate vs_TEXCOORD2 Location 33 
                                              OpDecorate %34 RelaxedPrecision 
                                              OpDecorate %35 RelaxedPrecision 
                                              OpDecorate %41 RelaxedPrecision 
                                              OpDecorate %42 RelaxedPrecision 
                                              OpMemberDecorate %69 0 Offset 69 
                                              OpDecorate %69 Block 
                                              OpDecorate %71 DescriptorSet 71 
                                              OpDecorate %71 Binding 71 
                                              OpDecorate %134 RelaxedPrecision 
                                              OpDecorate %137 RelaxedPrecision 
                                              OpDecorate %137 DescriptorSet 137 
                                              OpDecorate %137 Binding 137 
                                              OpDecorate %138 RelaxedPrecision 
                                              OpDecorate %141 RelaxedPrecision 
                                              OpDecorate %141 DescriptorSet 141 
                                              OpDecorate %141 Binding 141 
                                              OpDecorate %142 RelaxedPrecision 
                                              OpDecorate %148 RelaxedPrecision 
                                              OpDecorate %149 RelaxedPrecision 
                                              OpDecorate %150 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD1 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD1 Flat 
                                              OpDecorate vs_TEXCOORD1 Location 151 
                                              OpDecorate %153 RelaxedPrecision 
                                              OpDecorate %154 RelaxedPrecision 
                                              OpDecorate %156 RelaxedPrecision 
                                              OpDecorate %157 RelaxedPrecision 
                                              OpDecorate %157 DescriptorSet 157 
                                              OpDecorate %157 Binding 157 
                                              OpDecorate %158 RelaxedPrecision 
                                              OpDecorate %159 RelaxedPrecision 
                                              OpDecorate %159 DescriptorSet 159 
                                              OpDecorate %159 Binding 159 
                                              OpDecorate %160 RelaxedPrecision 
                                              OpDecorate %165 RelaxedPrecision 
                                              OpDecorate %166 RelaxedPrecision 
                                              OpDecorate %167 RelaxedPrecision 
                                              OpDecorate %168 RelaxedPrecision 
                                              OpDecorate %169 RelaxedPrecision 
                                              OpDecorate %170 RelaxedPrecision 
                                              OpDecorate %171 RelaxedPrecision 
                                              OpDecorate %172 RelaxedPrecision 
                                              OpDecorate %173 RelaxedPrecision 
                                              OpDecorate %174 RelaxedPrecision 
                                              OpDecorate %177 RelaxedPrecision 
                                              OpDecorate %178 RelaxedPrecision 
                                              OpDecorate %179 RelaxedPrecision 
                                              OpDecorate %180 RelaxedPrecision 
                                              OpDecorate %180 DescriptorSet 180 
                                              OpDecorate %180 Binding 180 
                                              OpDecorate %181 RelaxedPrecision 
                                              OpDecorate %182 RelaxedPrecision 
                                              OpDecorate %182 DescriptorSet 182 
                                              OpDecorate %182 Binding 182 
                                              OpDecorate %183 RelaxedPrecision 
                                              OpDecorate %188 RelaxedPrecision 
                                              OpDecorate %189 RelaxedPrecision 
                                              OpDecorate %190 RelaxedPrecision 
                                              OpDecorate %191 RelaxedPrecision 
                                              OpDecorate %192 RelaxedPrecision 
                                              OpDecorate %193 RelaxedPrecision 
                                              OpDecorate %195 RelaxedPrecision 
                                              OpDecorate %195 Location 195 
                                              OpDecorate %196 RelaxedPrecision 
                                              OpDecorate %197 RelaxedPrecision 
                                              OpDecorate %197 Location 197 
                                              OpDecorate %198 RelaxedPrecision 
                                              OpDecorate %199 RelaxedPrecision 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Function %7 
                                      %10 = OpTypePointer Input %7 
                         Input f32_4* %11 = OpVariable Input 
                                      %12 = OpTypeVector %6 3 
                                  f32 %15 = OpConstant 3.674022E-40 
                                      %16 = OpTypeInt 32 0 
                                  u32 %17 = OpConstant 3 
                                      %18 = OpTypePointer Input %6 
                                      %26 = OpTypeBool 
                                      %27 = OpTypeVector %26 4 
                                      %28 = OpTypePointer Private %27 
                      Private bool_4* %29 = OpVariable Private 
                Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                      %37 = OpTypeVector %26 2 
                                      %49 = OpTypePointer Private %7 
                       Private f32_4* %50 = OpVariable Private 
                                  f32 %51 = OpConstant 3.674022E-40 
                                f32_4 %52 = OpConstantComposite %51 %51 %51 %51 
                                f32_4 %53 = OpConstantComposite %15 %15 %15 %15 
                                      %57 = OpTypeVector %6 2 
                                      %65 = OpTypePointer Private %37 
                      Private bool_2* %66 = OpVariable Private 
                                      %69 = OpTypeStruct %7 
                                      %70 = OpTypePointer Uniform %69 
             Uniform struct {f32_4;}* %71 = OpVariable Uniform 
                                      %72 = OpTypeInt 32 1 
                                  i32 %73 = OpConstant 0 
                                      %74 = OpTypePointer Uniform %7 
                                      %80 = OpTypePointer Private %57 
                       Private f32_2* %81 = OpVariable Private 
                                f32_2 %82 = OpConstantComposite %51 %51 
                                f32_2 %83 = OpConstantComposite %15 %15 
                                 u32 %109 = OpConstant 2 
                                     %110 = OpTypePointer Private %6 
                                 f32 %114 = OpConstant 3.674022E-40 
                               f32_3 %115 = OpConstantComposite %15 %15 %114 
                                 u32 %117 = OpConstant 0 
                                     %122 = OpTypePointer Private %26 
                                 i32 %126 = OpConstant 1 
                                 i32 %128 = OpConstant -1 
                        Private f32* %134 = OpVariable Private 
                                     %135 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %136 = OpTypePointer UniformConstant %135 
UniformConstant read_only Texture2D* %137 = OpVariable UniformConstant 
                                     %139 = OpTypeSampler 
                                     %140 = OpTypePointer UniformConstant %139 
            UniformConstant sampler* %141 = OpVariable UniformConstant 
                                     %143 = OpTypeSampledImage %135 
                      Private f32_4* %149 = OpVariable Private 
                Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                      Private f32_4* %156 = OpVariable Private 
UniformConstant read_only Texture2D* %157 = OpVariable UniformConstant 
            UniformConstant sampler* %159 = OpVariable UniformConstant 
                      Private f32_4* %165 = OpVariable Private 
UniformConstant read_only Texture2D* %180 = OpVariable UniformConstant 
            UniformConstant sampler* %182 = OpVariable UniformConstant 
                                     %194 = OpTypePointer Output %7 
                       Output f32_4* %195 = OpVariable Output 
                        Input f32_4* %197 = OpVariable Input 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                       Function f32_4* %9 = OpVariable Function 
                                f32_4 %13 = OpLoad %11 
                                f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                           Input f32* %19 = OpAccessChain %11 %17 
                                  f32 %20 = OpLoad %19 
                                  f32 %21 = OpFDiv %15 %20 
                                  f32 %22 = OpCompositeExtract %14 0 
                                  f32 %23 = OpCompositeExtract %14 1 
                                  f32 %24 = OpCompositeExtract %14 2 
                                f32_4 %25 = OpCompositeConstruct %22 %23 %24 %21 
                                              OpStore %9 %25 
                                f32_4 %31 = OpLoad vs_TEXCOORD0 
                                f32_4 %32 = OpVectorShuffle %31 %31 2 3 2 2 
                                f32_4 %34 = OpLoad vs_TEXCOORD2 
                                f32_4 %35 = OpVectorShuffle %34 %34 0 1 0 0 
                               bool_4 %36 = OpFOrdGreaterThanEqual %32 %35 
                               bool_2 %38 = OpVectorShuffle %36 %36 0 1 
                               bool_4 %39 = OpLoad %29 
                               bool_4 %40 = OpVectorShuffle %39 %38 4 5 2 3 
                                              OpStore %29 %40 
                                f32_4 %41 = OpLoad vs_TEXCOORD2 
                                f32_4 %42 = OpVectorShuffle %41 %41 2 2 2 3 
                                f32_4 %43 = OpLoad vs_TEXCOORD0 
                                f32_4 %44 = OpVectorShuffle %43 %43 2 2 2 3 
                               bool_4 %45 = OpFOrdGreaterThanEqual %42 %44 
                               bool_2 %46 = OpVectorShuffle %45 %45 2 3 
                               bool_4 %47 = OpLoad %29 
                               bool_4 %48 = OpVectorShuffle %47 %46 0 1 4 5 
                                              OpStore %29 %48 
                               bool_4 %54 = OpLoad %29 
                                f32_4 %55 = OpSelect %54 %53 %52 
                                f32_4 %56 = OpExtInst %1 46 %52 %53 %55 
                                              OpStore %50 %56 
                                f32_4 %58 = OpLoad %50 
                                f32_2 %59 = OpVectorShuffle %58 %58 2 3 
                                f32_4 %60 = OpLoad %50 
                                f32_2 %61 = OpVectorShuffle %60 %60 0 1 
                                f32_2 %62 = OpFAdd %59 %61 
                                f32_4 %63 = OpLoad %50 
                                f32_4 %64 = OpVectorShuffle %63 %62 4 5 2 3 
                                              OpStore %50 %64 
                                f32_4 %67 = OpLoad %9 
                                f32_4 %68 = OpVectorShuffle %67 %67 0 1 0 1 
                       Uniform f32_4* %75 = OpAccessChain %71 %73 
                                f32_4 %76 = OpLoad %75 
                                f32_4 %77 = OpVectorShuffle %76 %76 0 1 0 1 
                               bool_4 %78 = OpFOrdGreaterThanEqual %68 %77 
                               bool_2 %79 = OpVectorShuffle %78 %78 0 1 
                                              OpStore %66 %79 
                               bool_2 %84 = OpLoad %66 
                                f32_2 %85 = OpSelect %84 %83 %82 
                                f32_2 %86 = OpExtInst %1 46 %82 %83 %85 
                                              OpStore %81 %86 
                                f32_2 %87 = OpLoad %81 
                                f32_4 %88 = OpLoad %50 
                                f32_2 %89 = OpVectorShuffle %88 %88 0 1 
                                f32_2 %90 = OpFAdd %87 %89 
                                f32_4 %91 = OpLoad %50 
                                f32_4 %92 = OpVectorShuffle %91 %90 4 5 2 3 
                                              OpStore %50 %92 
                       Uniform f32_4* %93 = OpAccessChain %71 %73 
                                f32_4 %94 = OpLoad %93 
                                f32_4 %95 = OpVectorShuffle %94 %94 2 3 2 3 
                                f32_4 %96 = OpLoad %9 
                                f32_4 %97 = OpVectorShuffle %96 %96 0 1 0 1 
                               bool_4 %98 = OpFOrdGreaterThanEqual %95 %97 
                               bool_2 %99 = OpVectorShuffle %98 %98 0 1 
                                              OpStore %66 %99 
                              bool_2 %100 = OpLoad %66 
                               f32_2 %101 = OpSelect %100 %83 %82 
                               f32_2 %102 = OpExtInst %1 46 %82 %83 %101 
                                              OpStore %81 %102 
                               f32_2 %103 = OpLoad %81 
                               f32_4 %104 = OpLoad %50 
                               f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                               f32_2 %106 = OpFAdd %103 %105 
                               f32_4 %107 = OpLoad %50 
                               f32_4 %108 = OpVectorShuffle %107 %106 4 5 2 3 
                                              OpStore %50 %108 
                        Private f32* %111 = OpAccessChain %50 %109 
                                              OpStore %111 %15 
                               f32_4 %112 = OpLoad %50 
                               f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                                 f32 %116 = OpDot %113 %115 
                        Private f32* %118 = OpAccessChain %50 %117 
                                              OpStore %118 %116 
                        Private f32* %119 = OpAccessChain %50 %117 
                                 f32 %120 = OpLoad %119 
                                bool %121 = OpFOrdLessThan %120 %51 
                       Private bool* %123 = OpAccessChain %29 %117 
                                              OpStore %123 %121 
                       Private bool* %124 = OpAccessChain %29 %117 
                                bool %125 = OpLoad %124 
                                 i32 %127 = OpSelect %125 %126 %73 
                                 i32 %129 = OpIMul %127 %128 
                                bool %130 = OpINotEqual %129 %73 
                                              OpSelectionMerge %132 None 
                                              OpBranchConditional %130 %131 %132 
                                     %131 = OpLabel 
                                              OpKill
                                     %132 = OpLabel 
                 read_only Texture2D %138 = OpLoad %137 
                             sampler %142 = OpLoad %141 
          read_only Texture2DSampled %144 = OpSampledImage %138 %142 
                               f32_4 %145 = OpLoad vs_TEXCOORD0 
                               f32_2 %146 = OpVectorShuffle %145 %145 0 1 
                               f32_4 %147 = OpImageSampleImplicitLod %144 %146 
                                 f32 %148 = OpCompositeExtract %147 3 
                                              OpStore %134 %148 
                                 f32 %150 = OpLoad %134 
                          Input f32* %152 = OpAccessChain vs_TEXCOORD1 %117 
                                 f32 %153 = OpLoad %152 
                                 f32 %154 = OpFMul %150 %153 
                        Private f32* %155 = OpAccessChain %149 %17 
                                              OpStore %155 %154 
                 read_only Texture2D %158 = OpLoad %157 
                             sampler %160 = OpLoad %159 
          read_only Texture2DSampled %161 = OpSampledImage %158 %160 
                               f32_4 %162 = OpLoad vs_TEXCOORD0 
                               f32_2 %163 = OpVectorShuffle %162 %162 0 1 
                               f32_4 %164 = OpImageSampleImplicitLod %161 %163 
                                              OpStore %156 %164 
                               f32_4 %166 = OpLoad %156 
                               f32_4 %167 = OpLoad vs_TEXCOORD1 
                               f32_4 %168 = OpVectorShuffle %167 %167 1 1 1 1 
                               f32_4 %169 = OpFMul %166 %168 
                               f32_4 %170 = OpLoad vs_TEXCOORD1 
                               f32_4 %171 = OpVectorShuffle %170 %170 3 3 3 3 
                               f32_4 %172 = OpFAdd %169 %171 
                                              OpStore %165 %172 
                               f32_4 %173 = OpLoad vs_TEXCOORD1 
                               f32_3 %174 = OpVectorShuffle %173 %173 0 0 0 
                               f32_4 %175 = OpLoad %149 
                               f32_4 %176 = OpVectorShuffle %175 %174 4 5 6 3 
                                              OpStore %149 %176 
                               f32_4 %177 = OpLoad %149 
                               f32_4 %178 = OpLoad %165 
                               f32_4 %179 = OpFAdd %177 %178 
                                              OpStore %149 %179 
                 read_only Texture2D %181 = OpLoad %180 
                             sampler %183 = OpLoad %182 
          read_only Texture2DSampled %184 = OpSampledImage %181 %183 
                               f32_4 %185 = OpLoad vs_TEXCOORD0 
                               f32_2 %186 = OpVectorShuffle %185 %185 0 1 
                               f32_4 %187 = OpImageSampleImplicitLod %184 %186 
                                              OpStore %156 %187 
                               f32_4 %188 = OpLoad %156 
                               f32_4 %189 = OpLoad vs_TEXCOORD1 
                               f32_4 %190 = OpVectorShuffle %189 %189 2 2 2 2 
                               f32_4 %191 = OpFMul %188 %190 
                               f32_4 %192 = OpLoad %149 
                               f32_4 %193 = OpFAdd %191 %192 
                                              OpStore %149 %193 
                               f32_4 %196 = OpLoad %149 
                               f32_4 %198 = OpLoad %197 
                               f32_4 %199 = OpFMul %196 %198 
                                              OpStore %195 %199 
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
 Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZTest GEqual
  ZWrite Off
  Cull Off
  Stencil {
   Ref 255
   CompFront Disabled
   PassFront Keep
   FailFront Keep
   ZFailFront Keep
   CompBack Disabled
   PassBack Keep
   FailBack Keep
   ZFailBack Keep
  }
  GpuProgramID 195550
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _Color;
uniform 	vec4 _1PixelClipInvView;
uniform 	vec4 _Transforms[80];
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
flat out mediump vec4 vs_TEXCOORD1;
flat out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
int u_xlati0;
uvec4 u_xlatu0;
bool u_xlatb0;
vec4 u_xlat1;
ivec4 u_xlati1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec2 u_xlat5;
vec2 u_xlat6;
vec2 u_xlat13;
void main()
{
    u_xlat0.x = in_TEXCOORD1.x * 4.0;
    u_xlat0.yzw = in_TEXCOORD1.xxy * vec3(4.0, 4.0, 4.0) + vec3(1.0, 2.0, 3.0);
    u_xlatu0 = uvec4(u_xlat0);
    u_xlati1 = ivec4(uvec4(equal(in_TEXCOORD1.zzzz, vec4(4.0, 3.0, 2.0, 1.0))) * 0xFFFFFFFFu);
    u_xlat2.xyz = uintBitsToFloat(uvec3(uint(u_xlati1.w) & uint(1065353216u), uint(u_xlati1.z) & uint(1065353216u), uint(u_xlati1.y) & uint(1065353216u)));
    if(u_xlati1.x != 0) {
        u_xlat3.x = dot(_Transforms[int(u_xlatu0.x)].xy, in_TEXCOORD0.xy);
        u_xlat3.y = dot(_Transforms[int(u_xlatu0.y)].xy, in_TEXCOORD0.xy);
        u_xlat13.xy = u_xlat3.xy * _1PixelClipInvView.zw;
        u_xlat1.x = dot(u_xlat13.xy, u_xlat13.xy);
        u_xlat1.x = sqrt(u_xlat1.x);
        u_xlat13.x = max(u_xlat1.x, 1.0);
        u_xlat13.x = roundEven(u_xlat13.x);
        u_xlat1.x = u_xlat1.x + 9.99999997e-07;
        u_xlat1.x = u_xlat13.x / u_xlat1.x;
        u_xlat1.x = u_xlat1.x + -1.0;
        u_xlat3.xy = u_xlat3.xy * u_xlat1.xx;
    } else {
        u_xlat3.x = float(0.0);
        u_xlat3.y = float(0.0);
    }
    u_xlat13.x = dot(_Transforms[int(u_xlatu0.x)], in_POSITION0);
    u_xlat13.y = dot(_Transforms[int(u_xlatu0.y)], in_POSITION0);
    u_xlat0.x = dot(_Transforms[int(u_xlatu0.z)], in_POSITION0);
    u_xlat5.xy = u_xlat3.xy + u_xlat13.xy;
    u_xlat3 = u_xlat5.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat5.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = u_xlat3 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat4 = u_xlat3.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat3.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat3.zzzz + u_xlat4;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat3.wwww + u_xlat4;
    u_xlat4.xy = u_xlat3.xy + vec2(1.0, 1.0);
    u_xlat4.xy = u_xlat4.xy / _1PixelClipInvView.xy;
    u_xlat4.xy = u_xlat4.xy + vec2(0.50999999, 0.50999999);
    u_xlat4.xy = trunc(u_xlat4.xy);
    u_xlat4.xy = u_xlat4.xy * _1PixelClipInvView.xy + vec2(-1.0, -1.0);
    gl_Position.xy = (u_xlati1.w != 0) ? u_xlat4.xy : u_xlat3.xy;
    u_xlat1.xw = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlati1.y==0);
#else
    u_xlatb0 = u_xlati1.y==0;
#endif
    u_xlati0 = u_xlatb0 ? u_xlati1.z : int(0);
    u_xlat6.xy = u_xlat1.xw * _MainTex_TexelSize.xy;
    vs_TEXCOORD0.xy = (int(u_xlati0) != 0) ? u_xlat6.xy : u_xlat1.xw;
    u_xlat1 = in_COLOR0 * _Color;
    u_xlat0.x = u_xlat2.y + u_xlat2.x;
    u_xlat0.x = u_xlat2.z + u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat2.w = (-u_xlat0.x) + 1.0;
    gl_Position.zw = u_xlat3.zw;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.zw = u_xlat5.xy;
    vs_TEXCOORD1 = u_xlat2;
    vs_TEXCOORD2 = _Transforms[int(u_xlatu0.w)];
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
uniform 	vec4 _PixelClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FontTex;
UNITY_LOCATION(2) uniform mediump sampler2D _CustomTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
flat in mediump vec4 vs_TEXCOORD1;
flat in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec4 u_xlatb0;
mediump vec4 u_xlat16_1;
vec2 u_xlat4;
bvec2 u_xlatb4;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD0.zwzz, vs_TEXCOORD2.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(vs_TEXCOORD2.zzzw, vs_TEXCOORD0.zzzw).zw;
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlat0.xy = u_xlat0.zw + u_xlat0.xy;
    u_xlatb4.xy = greaterThanEqual(hlslcc_FragCoord.xyxy, _PixelClipRect.xyxy).xy;
    u_xlat4.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb4.xy));
    u_xlat0.xy = u_xlat4.xy + u_xlat0.xy;
    u_xlatb4.xy = greaterThanEqual(_PixelClipRect.zwzw, hlslcc_FragCoord.xyxy).xy;
    u_xlat4.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb4.xy));
    u_xlat0.xy = u_xlat4.xy + u_xlat0.xy;
    u_xlat0.z = 1.0;
    u_xlat0.x = dot(u_xlat0.xyz, vec3(1.0, 1.0, -7.94999981));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat0.x<0.0);
#else
    u_xlatb0.x = u_xlat0.x<0.0;
#endif
    if(((int(u_xlatb0.x) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_0.x = texture(_FontTex, vs_TEXCOORD0.xy).w;
    u_xlat16_0.w = u_xlat16_0.x * vs_TEXCOORD1.x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat16_1 * vs_TEXCOORD1.yyyy + vs_TEXCOORD1.wwww;
    u_xlat16_0.xyz = vs_TEXCOORD1.xxx;
    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
    u_xlat16_1 = texture(_CustomTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_1 * vs_TEXCOORD1.zzzz + u_xlat16_0;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _Color;
uniform 	vec4 _1PixelClipInvView;
uniform 	vec4 _Transforms[80];
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
flat out mediump vec4 vs_TEXCOORD1;
flat out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
int u_xlati0;
uvec4 u_xlatu0;
bool u_xlatb0;
vec4 u_xlat1;
ivec4 u_xlati1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec2 u_xlat5;
vec2 u_xlat6;
vec2 u_xlat13;
void main()
{
    u_xlat0.x = in_TEXCOORD1.x * 4.0;
    u_xlat0.yzw = in_TEXCOORD1.xxy * vec3(4.0, 4.0, 4.0) + vec3(1.0, 2.0, 3.0);
    u_xlatu0 = uvec4(u_xlat0);
    u_xlati1 = ivec4(uvec4(equal(in_TEXCOORD1.zzzz, vec4(4.0, 3.0, 2.0, 1.0))) * 0xFFFFFFFFu);
    u_xlat2.xyz = uintBitsToFloat(uvec3(uint(u_xlati1.w) & uint(1065353216u), uint(u_xlati1.z) & uint(1065353216u), uint(u_xlati1.y) & uint(1065353216u)));
    if(u_xlati1.x != 0) {
        u_xlat3.x = dot(_Transforms[int(u_xlatu0.x)].xy, in_TEXCOORD0.xy);
        u_xlat3.y = dot(_Transforms[int(u_xlatu0.y)].xy, in_TEXCOORD0.xy);
        u_xlat13.xy = u_xlat3.xy * _1PixelClipInvView.zw;
        u_xlat1.x = dot(u_xlat13.xy, u_xlat13.xy);
        u_xlat1.x = sqrt(u_xlat1.x);
        u_xlat13.x = max(u_xlat1.x, 1.0);
        u_xlat13.x = roundEven(u_xlat13.x);
        u_xlat1.x = u_xlat1.x + 9.99999997e-07;
        u_xlat1.x = u_xlat13.x / u_xlat1.x;
        u_xlat1.x = u_xlat1.x + -1.0;
        u_xlat3.xy = u_xlat3.xy * u_xlat1.xx;
    } else {
        u_xlat3.x = float(0.0);
        u_xlat3.y = float(0.0);
    }
    u_xlat13.x = dot(_Transforms[int(u_xlatu0.x)], in_POSITION0);
    u_xlat13.y = dot(_Transforms[int(u_xlatu0.y)], in_POSITION0);
    u_xlat0.x = dot(_Transforms[int(u_xlatu0.z)], in_POSITION0);
    u_xlat5.xy = u_xlat3.xy + u_xlat13.xy;
    u_xlat3 = u_xlat5.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat5.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = u_xlat3 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat4 = u_xlat3.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat3.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat3.zzzz + u_xlat4;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat3.wwww + u_xlat4;
    u_xlat4.xy = u_xlat3.xy + vec2(1.0, 1.0);
    u_xlat4.xy = u_xlat4.xy / _1PixelClipInvView.xy;
    u_xlat4.xy = u_xlat4.xy + vec2(0.50999999, 0.50999999);
    u_xlat4.xy = trunc(u_xlat4.xy);
    u_xlat4.xy = u_xlat4.xy * _1PixelClipInvView.xy + vec2(-1.0, -1.0);
    gl_Position.xy = (u_xlati1.w != 0) ? u_xlat4.xy : u_xlat3.xy;
    u_xlat1.xw = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlati1.y==0);
#else
    u_xlatb0 = u_xlati1.y==0;
#endif
    u_xlati0 = u_xlatb0 ? u_xlati1.z : int(0);
    u_xlat6.xy = u_xlat1.xw * _MainTex_TexelSize.xy;
    vs_TEXCOORD0.xy = (int(u_xlati0) != 0) ? u_xlat6.xy : u_xlat1.xw;
    u_xlat1 = in_COLOR0 * _Color;
    u_xlat0.x = u_xlat2.y + u_xlat2.x;
    u_xlat0.x = u_xlat2.z + u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat2.w = (-u_xlat0.x) + 1.0;
    gl_Position.zw = u_xlat3.zw;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.zw = u_xlat5.xy;
    vs_TEXCOORD1 = u_xlat2;
    vs_TEXCOORD2 = _Transforms[int(u_xlatu0.w)];
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
uniform 	vec4 _PixelClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FontTex;
UNITY_LOCATION(2) uniform mediump sampler2D _CustomTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
flat in mediump vec4 vs_TEXCOORD1;
flat in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec4 u_xlatb0;
mediump vec4 u_xlat16_1;
vec2 u_xlat4;
bvec2 u_xlatb4;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD0.zwzz, vs_TEXCOORD2.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(vs_TEXCOORD2.zzzw, vs_TEXCOORD0.zzzw).zw;
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlat0.xy = u_xlat0.zw + u_xlat0.xy;
    u_xlatb4.xy = greaterThanEqual(hlslcc_FragCoord.xyxy, _PixelClipRect.xyxy).xy;
    u_xlat4.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb4.xy));
    u_xlat0.xy = u_xlat4.xy + u_xlat0.xy;
    u_xlatb4.xy = greaterThanEqual(_PixelClipRect.zwzw, hlslcc_FragCoord.xyxy).xy;
    u_xlat4.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb4.xy));
    u_xlat0.xy = u_xlat4.xy + u_xlat0.xy;
    u_xlat0.z = 1.0;
    u_xlat0.x = dot(u_xlat0.xyz, vec3(1.0, 1.0, -7.94999981));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat0.x<0.0);
#else
    u_xlatb0.x = u_xlat0.x<0.0;
#endif
    if(((int(u_xlatb0.x) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_0.x = texture(_FontTex, vs_TEXCOORD0.xy).w;
    u_xlat16_0.w = u_xlat16_0.x * vs_TEXCOORD1.x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat16_1 * vs_TEXCOORD1.yyyy + vs_TEXCOORD1.wwww;
    u_xlat16_0.xyz = vs_TEXCOORD1.xxx;
    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
    u_xlat16_1 = texture(_CustomTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_1 * vs_TEXCOORD1.zzzz + u_xlat16_0;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 _MainTex_TexelSize;
uniform 	mediump vec4 _Color;
uniform 	vec4 _1PixelClipInvView;
uniform 	vec4 _Transforms[80];
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_TEXCOORD1;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
flat out mediump vec4 vs_TEXCOORD1;
flat out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
int u_xlati0;
uvec4 u_xlatu0;
bool u_xlatb0;
vec4 u_xlat1;
ivec4 u_xlati1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec2 u_xlat5;
vec2 u_xlat6;
vec2 u_xlat13;
void main()
{
    u_xlat0.x = in_TEXCOORD1.x * 4.0;
    u_xlat0.yzw = in_TEXCOORD1.xxy * vec3(4.0, 4.0, 4.0) + vec3(1.0, 2.0, 3.0);
    u_xlatu0 = uvec4(u_xlat0);
    u_xlati1 = ivec4(uvec4(equal(in_TEXCOORD1.zzzz, vec4(4.0, 3.0, 2.0, 1.0))) * 0xFFFFFFFFu);
    u_xlat2.xyz = uintBitsToFloat(uvec3(uint(u_xlati1.w) & uint(1065353216u), uint(u_xlati1.z) & uint(1065353216u), uint(u_xlati1.y) & uint(1065353216u)));
    if(u_xlati1.x != 0) {
        u_xlat3.x = dot(_Transforms[int(u_xlatu0.x)].xy, in_TEXCOORD0.xy);
        u_xlat3.y = dot(_Transforms[int(u_xlatu0.y)].xy, in_TEXCOORD0.xy);
        u_xlat13.xy = u_xlat3.xy * _1PixelClipInvView.zw;
        u_xlat1.x = dot(u_xlat13.xy, u_xlat13.xy);
        u_xlat1.x = sqrt(u_xlat1.x);
        u_xlat13.x = max(u_xlat1.x, 1.0);
        u_xlat13.x = roundEven(u_xlat13.x);
        u_xlat1.x = u_xlat1.x + 9.99999997e-07;
        u_xlat1.x = u_xlat13.x / u_xlat1.x;
        u_xlat1.x = u_xlat1.x + -1.0;
        u_xlat3.xy = u_xlat3.xy * u_xlat1.xx;
    } else {
        u_xlat3.x = float(0.0);
        u_xlat3.y = float(0.0);
    }
    u_xlat13.x = dot(_Transforms[int(u_xlatu0.x)], in_POSITION0);
    u_xlat13.y = dot(_Transforms[int(u_xlatu0.y)], in_POSITION0);
    u_xlat0.x = dot(_Transforms[int(u_xlatu0.z)], in_POSITION0);
    u_xlat5.xy = u_xlat3.xy + u_xlat13.xy;
    u_xlat3 = u_xlat5.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat5.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.xxxx + u_xlat3;
    u_xlat3 = u_xlat3 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat4 = u_xlat3.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat3.xxxx + u_xlat4;
    u_xlat4 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat3.zzzz + u_xlat4;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat3.wwww + u_xlat4;
    u_xlat4.xy = u_xlat3.xy + vec2(1.0, 1.0);
    u_xlat4.xy = u_xlat4.xy / _1PixelClipInvView.xy;
    u_xlat4.xy = u_xlat4.xy + vec2(0.50999999, 0.50999999);
    u_xlat4.xy = trunc(u_xlat4.xy);
    u_xlat4.xy = u_xlat4.xy * _1PixelClipInvView.xy + vec2(-1.0, -1.0);
    gl_Position.xy = (u_xlati1.w != 0) ? u_xlat4.xy : u_xlat3.xy;
    u_xlat1.xw = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlati1.y==0);
#else
    u_xlatb0 = u_xlati1.y==0;
#endif
    u_xlati0 = u_xlatb0 ? u_xlati1.z : int(0);
    u_xlat6.xy = u_xlat1.xw * _MainTex_TexelSize.xy;
    vs_TEXCOORD0.xy = (int(u_xlati0) != 0) ? u_xlat6.xy : u_xlat1.xw;
    u_xlat1 = in_COLOR0 * _Color;
    u_xlat0.x = u_xlat2.y + u_xlat2.x;
    u_xlat0.x = u_xlat2.z + u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 1.0);
    u_xlat2.w = (-u_xlat0.x) + 1.0;
    gl_Position.zw = u_xlat3.zw;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.zw = u_xlat5.xy;
    vs_TEXCOORD1 = u_xlat2;
    vs_TEXCOORD2 = _Transforms[int(u_xlatu0.w)];
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
uniform 	vec4 _PixelClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FontTex;
UNITY_LOCATION(2) uniform mediump sampler2D _CustomTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
flat in mediump vec4 vs_TEXCOORD1;
flat in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bvec4 u_xlatb0;
mediump vec4 u_xlat16_1;
vec2 u_xlat4;
bvec2 u_xlatb4;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD0.zwzz, vs_TEXCOORD2.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(vs_TEXCOORD2.zzzw, vs_TEXCOORD0.zzzw).zw;
    u_xlat0 = mix(vec4(0.0, 0.0, 0.0, 0.0), vec4(1.0, 1.0, 1.0, 1.0), vec4(u_xlatb0));
    u_xlat0.xy = u_xlat0.zw + u_xlat0.xy;
    u_xlatb4.xy = greaterThanEqual(hlslcc_FragCoord.xyxy, _PixelClipRect.xyxy).xy;
    u_xlat4.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb4.xy));
    u_xlat0.xy = u_xlat4.xy + u_xlat0.xy;
    u_xlatb4.xy = greaterThanEqual(_PixelClipRect.zwzw, hlslcc_FragCoord.xyxy).xy;
    u_xlat4.xy = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb4.xy));
    u_xlat0.xy = u_xlat4.xy + u_xlat0.xy;
    u_xlat0.z = 1.0;
    u_xlat0.x = dot(u_xlat0.xyz, vec3(1.0, 1.0, -7.94999981));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat0.x<0.0);
#else
    u_xlatb0.x = u_xlat0.x<0.0;
#endif
    if(((int(u_xlatb0.x) * int(0xffffffffu)))!=0){discard;}
    u_xlat16_0.x = texture(_FontTex, vs_TEXCOORD0.xy).w;
    u_xlat16_0.w = u_xlat16_0.x * vs_TEXCOORD1.x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1 = u_xlat16_1 * vs_TEXCOORD1.yyyy + vs_TEXCOORD1.wwww;
    u_xlat16_0.xyz = vs_TEXCOORD1.xxx;
    u_xlat16_0 = u_xlat16_0 + u_xlat16_1;
    u_xlat16_1 = texture(_CustomTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_1 * vs_TEXCOORD1.zzzz + u_xlat16_0;
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 401
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %12 %95 %167 %285 %337 %350 %382 %387 %389 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %77 ArrayStride 77 
                                                      OpDecorate %78 ArrayStride 78 
                                                      OpDecorate %80 ArrayStride 80 
                                                      OpMemberDecorate %81 0 Offset 81 
                                                      OpMemberDecorate %81 1 Offset 81 
                                                      OpMemberDecorate %81 2 Offset 81 
                                                      OpMemberDecorate %81 3 Offset 81 
                                                      OpMemberDecorate %81 4 RelaxedPrecision 
                                                      OpMemberDecorate %81 4 Offset 81 
                                                      OpMemberDecorate %81 5 Offset 81 
                                                      OpMemberDecorate %81 6 Offset 81 
                                                      OpDecorate %81 Block 
                                                      OpDecorate %83 DescriptorSet 83 
                                                      OpDecorate %83 Binding 83 
                                                      OpDecorate %95 Location 95 
                                                      OpDecorate %167 Location 167 
                                                      OpMemberDecorate %283 0 BuiltIn 283 
                                                      OpMemberDecorate %283 1 BuiltIn 283 
                                                      OpMemberDecorate %283 2 BuiltIn 283 
                                                      OpDecorate %283 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 337 
                                                      OpDecorate %350 Location 350 
                                                      OpDecorate %354 RelaxedPrecision 
                                                      OpDecorate %382 RelaxedPrecision 
                                                      OpDecorate %382 Location 382 
                                                      OpDecorate vs_TEXCOORD1 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Flat 
                                                      OpDecorate vs_TEXCOORD1 Location 387 
                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 Flat 
                                                      OpDecorate vs_TEXCOORD2 Location 389 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %13 = OpTypeInt 32 0 
                                          u32 %14 = OpConstant 0 
                                              %15 = OpTypePointer Input %6 
                                          f32 %18 = OpConstant 3.674022E-40 
                                              %20 = OpTypePointer Private %6 
                                        f32_3 %24 = OpConstantComposite %18 %18 %18 
                                          f32 %26 = OpConstant 3.674022E-40 
                                          f32 %27 = OpConstant 3.674022E-40 
                                          f32 %28 = OpConstant 3.674022E-40 
                                        f32_3 %29 = OpConstantComposite %26 %27 %28 
                                              %33 = OpTypeVector %13 4 
                                              %34 = OpTypePointer Private %33 
                               Private u32_4* %35 = OpVariable Private 
                                              %38 = OpTypeInt 32 1 
                                              %39 = OpTypeVector %38 4 
                                              %40 = OpTypePointer Private %39 
                               Private i32_4* %41 = OpVariable Private 
                                        f32_4 %44 = OpConstantComposite %18 %28 %27 %26 
                                              %45 = OpTypeBool 
                                              %46 = OpTypeVector %45 4 
                                          u32 %48 = OpConstant 1 
                                        u32_4 %49 = OpConstantComposite %14 %14 %14 %14 
                                        u32_4 %50 = OpConstantComposite %48 %48 %48 %48 
                                          u32 %52 = OpConstant 4294967295 
                               Private f32_4* %56 = OpVariable Private 
                                              %57 = OpTypeVector %38 3 
                                              %60 = OpTypeVector %13 3 
                                          u32 %62 = OpConstant 1065353216 
                                        u32_3 %63 = OpConstantComposite %62 %62 %62 
                                              %68 = OpTypePointer Private %38 
                                          i32 %71 = OpConstant 0 
                               Private f32_4* %75 = OpVariable Private 
                                          u32 %76 = OpConstant 4 
                                              %77 = OpTypeArray %7 %76 
                                              %78 = OpTypeArray %7 %76 
                                          u32 %79 = OpConstant 80 
                                              %80 = OpTypeArray %7 %79 
                                              %81 = OpTypeStruct %77 %78 %7 %7 %7 %7 %80 
                                              %82 = OpTypePointer Uniform %81 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32_4; f32_4[80];}* %83 = OpVariable Uniform 
                                          i32 %84 = OpConstant 6 
                                              %85 = OpTypePointer Private %13 
                                              %89 = OpTypeVector %6 2 
                                              %90 = OpTypePointer Uniform %7 
                                              %94 = OpTypePointer Input %89 
                                 Input f32_2* %95 = OpVariable Input 
                                             %108 = OpTypePointer Private %89 
                              Private f32_2* %109 = OpVariable Private 
                                         i32 %112 = OpConstant 5 
                              Private f32_4* %117 = OpVariable Private 
                                         f32 %136 = OpConstant 3.674022E-40 
                                         f32 %147 = OpConstant 3.674022E-40 
                                         f32 %158 = OpConstant 3.674022E-40 
                                             %166 = OpTypePointer Input %7 
                                Input f32_4* %167 = OpVariable Input 
                                         u32 %179 = OpConstant 2 
                              Private f32_2* %188 = OpVariable Private 
                                         i32 %195 = OpConstant 1 
                                         i32 %206 = OpConstant 2 
                                         i32 %215 = OpConstant 3 
                              Private f32_4* %219 = OpVariable Private 
                                       f32_2 %248 = OpConstantComposite %26 %26 
                                         f32 %262 = OpConstant 3.674022E-40 
                                       f32_2 %263 = OpConstantComposite %262 %262 
                                       f32_2 %278 = OpConstantComposite %147 %147 
                                             %282 = OpTypeArray %6 %48 
                                             %283 = OpTypeStruct %7 %6 %282 
                                             %284 = OpTypePointer Output %283 
        Output struct {f32_4; f32; f32[1];}* %285 = OpVariable Output 
                                         u32 %286 = OpConstant 3 
                                             %290 = OpTypePointer Function %89 
                                             %300 = OpTypePointer Output %7 
                                             %315 = OpTypePointer Private %45 
                               Private bool* %316 = OpVariable Private 
                                Private i32* %320 = OpVariable Private 
                                             %322 = OpTypePointer Function %38 
                              Private f32_2* %330 = OpVariable Private 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_4* %350 = OpVariable Input 
                                         i32 %352 = OpConstant 4 
                               Output f32_4* %382 = OpVariable Output 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                             %395 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_2* %291 = OpVariable Function 
                               Function i32* %323 = OpVariable Function 
                             Function f32_2* %340 = OpVariable Function 
                                   Input f32* %16 = OpAccessChain %12 %14 
                                          f32 %17 = OpLoad %16 
                                          f32 %19 = OpFMul %17 %18 
                                 Private f32* %21 = OpAccessChain %9 %14 
                                                      OpStore %21 %19 
                                        f32_3 %22 = OpLoad %12 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 0 1 
                                        f32_3 %25 = OpFMul %23 %24 
                                        f32_3 %30 = OpFAdd %25 %29 
                                        f32_4 %31 = OpLoad %9 
                                        f32_4 %32 = OpVectorShuffle %31 %30 0 4 5 6 
                                                      OpStore %9 %32 
                                        f32_4 %36 = OpLoad %9 
                                        u32_4 %37 = OpConvertFToU %36 
                                                      OpStore %35 %37 
                                        f32_3 %42 = OpLoad %12 
                                        f32_4 %43 = OpVectorShuffle %42 %42 2 2 2 2 
                                       bool_4 %47 = OpFOrdEqual %43 %44 
                                        u32_4 %51 = OpSelect %47 %50 %49 
                                        u32_4 %53 = OpCompositeConstruct %52 %52 %52 %52 
                                        u32_4 %54 = OpIMul %51 %53 
                                        i32_4 %55 = OpBitcast %54 
                                                      OpStore %41 %55 
                                        i32_4 %58 = OpLoad %41 
                                        i32_3 %59 = OpVectorShuffle %58 %58 3 2 1 
                                        u32_3 %61 = OpBitcast %59 
                                        u32_3 %64 = OpBitwiseAnd %61 %63 
                                        f32_3 %65 = OpBitcast %64 
                                        f32_4 %66 = OpLoad %56 
                                        f32_4 %67 = OpVectorShuffle %66 %65 4 5 6 3 
                                                      OpStore %56 %67 
                                 Private i32* %69 = OpAccessChain %41 %14 
                                          i32 %70 = OpLoad %69 
                                         bool %72 = OpINotEqual %70 %71 
                                                      OpSelectionMerge %74 None 
                                                      OpBranchConditional %72 %73 %157 
                                              %73 = OpLabel 
                                 Private u32* %86 = OpAccessChain %35 %14 
                                          u32 %87 = OpLoad %86 
                                          i32 %88 = OpBitcast %87 
                               Uniform f32_4* %91 = OpAccessChain %83 %84 %88 
                                        f32_4 %92 = OpLoad %91 
                                        f32_2 %93 = OpVectorShuffle %92 %92 0 1 
                                        f32_2 %96 = OpLoad %95 
                                          f32 %97 = OpDot %93 %96 
                                 Private f32* %98 = OpAccessChain %75 %14 
                                                      OpStore %98 %97 
                                 Private u32* %99 = OpAccessChain %35 %48 
                                         u32 %100 = OpLoad %99 
                                         i32 %101 = OpBitcast %100 
                              Uniform f32_4* %102 = OpAccessChain %83 %84 %101 
                                       f32_4 %103 = OpLoad %102 
                                       f32_2 %104 = OpVectorShuffle %103 %103 0 1 
                                       f32_2 %105 = OpLoad %95 
                                         f32 %106 = OpDot %104 %105 
                                Private f32* %107 = OpAccessChain %75 %48 
                                                      OpStore %107 %106 
                                       f32_4 %110 = OpLoad %75 
                                       f32_2 %111 = OpVectorShuffle %110 %110 0 1 
                              Uniform f32_4* %113 = OpAccessChain %83 %112 
                                       f32_4 %114 = OpLoad %113 
                                       f32_2 %115 = OpVectorShuffle %114 %114 2 3 
                                       f32_2 %116 = OpFMul %111 %115 
                                                      OpStore %109 %116 
                                       f32_2 %118 = OpLoad %109 
                                       f32_2 %119 = OpLoad %109 
                                         f32 %120 = OpDot %118 %119 
                                Private f32* %121 = OpAccessChain %117 %14 
                                                      OpStore %121 %120 
                                Private f32* %122 = OpAccessChain %117 %14 
                                         f32 %123 = OpLoad %122 
                                         f32 %124 = OpExtInst %1 31 %123 
                                Private f32* %125 = OpAccessChain %117 %14 
                                                      OpStore %125 %124 
                                Private f32* %126 = OpAccessChain %117 %14 
                                         f32 %127 = OpLoad %126 
                                         f32 %128 = OpExtInst %1 40 %127 %26 
                                Private f32* %129 = OpAccessChain %109 %14 
                                                      OpStore %129 %128 
                                Private f32* %130 = OpAccessChain %109 %14 
                                         f32 %131 = OpLoad %130 
                                         f32 %132 = OpExtInst %1 2 %131 
                                Private f32* %133 = OpAccessChain %109 %14 
                                                      OpStore %133 %132 
                                Private f32* %134 = OpAccessChain %117 %14 
                                         f32 %135 = OpLoad %134 
                                         f32 %137 = OpFAdd %135 %136 
                                Private f32* %138 = OpAccessChain %117 %14 
                                                      OpStore %138 %137 
                                Private f32* %139 = OpAccessChain %109 %14 
                                         f32 %140 = OpLoad %139 
                                Private f32* %141 = OpAccessChain %117 %14 
                                         f32 %142 = OpLoad %141 
                                         f32 %143 = OpFDiv %140 %142 
                                Private f32* %144 = OpAccessChain %117 %14 
                                                      OpStore %144 %143 
                                Private f32* %145 = OpAccessChain %117 %14 
                                         f32 %146 = OpLoad %145 
                                         f32 %148 = OpFAdd %146 %147 
                                Private f32* %149 = OpAccessChain %117 %14 
                                                      OpStore %149 %148 
                                       f32_4 %150 = OpLoad %75 
                                       f32_2 %151 = OpVectorShuffle %150 %150 0 1 
                                       f32_4 %152 = OpLoad %117 
                                       f32_2 %153 = OpVectorShuffle %152 %152 0 0 
                                       f32_2 %154 = OpFMul %151 %153 
                                       f32_4 %155 = OpLoad %75 
                                       f32_4 %156 = OpVectorShuffle %155 %154 4 5 2 3 
                                                      OpStore %75 %156 
                                                      OpBranch %74 
                                             %157 = OpLabel 
                                Private f32* %159 = OpAccessChain %75 %14 
                                                      OpStore %159 %158 
                                Private f32* %160 = OpAccessChain %75 %48 
                                                      OpStore %160 %158 
                                                      OpBranch %74 
                                              %74 = OpLabel 
                                Private u32* %161 = OpAccessChain %35 %14 
                                         u32 %162 = OpLoad %161 
                                         i32 %163 = OpBitcast %162 
                              Uniform f32_4* %164 = OpAccessChain %83 %84 %163 
                                       f32_4 %165 = OpLoad %164 
                                       f32_4 %168 = OpLoad %167 
                                         f32 %169 = OpDot %165 %168 
                                Private f32* %170 = OpAccessChain %109 %14 
                                                      OpStore %170 %169 
                                Private u32* %171 = OpAccessChain %35 %48 
                                         u32 %172 = OpLoad %171 
                                         i32 %173 = OpBitcast %172 
                              Uniform f32_4* %174 = OpAccessChain %83 %84 %173 
                                       f32_4 %175 = OpLoad %174 
                                       f32_4 %176 = OpLoad %167 
                                         f32 %177 = OpDot %175 %176 
                                Private f32* %178 = OpAccessChain %109 %48 
                                                      OpStore %178 %177 
                                Private u32* %180 = OpAccessChain %35 %179 
                                         u32 %181 = OpLoad %180 
                                         i32 %182 = OpBitcast %181 
                              Uniform f32_4* %183 = OpAccessChain %83 %84 %182 
                                       f32_4 %184 = OpLoad %183 
                                       f32_4 %185 = OpLoad %167 
                                         f32 %186 = OpDot %184 %185 
                                Private f32* %187 = OpAccessChain %9 %14 
                                                      OpStore %187 %186 
                                       f32_4 %189 = OpLoad %75 
                                       f32_2 %190 = OpVectorShuffle %189 %189 0 1 
                                       f32_2 %191 = OpLoad %109 
                                       f32_2 %192 = OpFAdd %190 %191 
                                                      OpStore %188 %192 
                                       f32_2 %193 = OpLoad %188 
                                       f32_4 %194 = OpVectorShuffle %193 %193 1 1 1 1 
                              Uniform f32_4* %196 = OpAccessChain %83 %71 %195 
                                       f32_4 %197 = OpLoad %196 
                                       f32_4 %198 = OpFMul %194 %197 
                                                      OpStore %75 %198 
                              Uniform f32_4* %199 = OpAccessChain %83 %71 %71 
                                       f32_4 %200 = OpLoad %199 
                                       f32_2 %201 = OpLoad %188 
                                       f32_4 %202 = OpVectorShuffle %201 %201 0 0 0 0 
                                       f32_4 %203 = OpFMul %200 %202 
                                       f32_4 %204 = OpLoad %75 
                                       f32_4 %205 = OpFAdd %203 %204 
                                                      OpStore %75 %205 
                              Uniform f32_4* %207 = OpAccessChain %83 %71 %206 
                                       f32_4 %208 = OpLoad %207 
                                       f32_4 %209 = OpLoad %9 
                                       f32_4 %210 = OpVectorShuffle %209 %209 0 0 0 0 
                                       f32_4 %211 = OpFMul %208 %210 
                                       f32_4 %212 = OpLoad %75 
                                       f32_4 %213 = OpFAdd %211 %212 
                                                      OpStore %75 %213 
                                       f32_4 %214 = OpLoad %75 
                              Uniform f32_4* %216 = OpAccessChain %83 %71 %215 
                                       f32_4 %217 = OpLoad %216 
                                       f32_4 %218 = OpFAdd %214 %217 
                                                      OpStore %75 %218 
                                       f32_4 %220 = OpLoad %75 
                                       f32_4 %221 = OpVectorShuffle %220 %220 1 1 1 1 
                              Uniform f32_4* %222 = OpAccessChain %83 %195 %195 
                                       f32_4 %223 = OpLoad %222 
                                       f32_4 %224 = OpFMul %221 %223 
                                                      OpStore %219 %224 
                              Uniform f32_4* %225 = OpAccessChain %83 %195 %71 
                                       f32_4 %226 = OpLoad %225 
                                       f32_4 %227 = OpLoad %75 
                                       f32_4 %228 = OpVectorShuffle %227 %227 0 0 0 0 
                                       f32_4 %229 = OpFMul %226 %228 
                                       f32_4 %230 = OpLoad %219 
                                       f32_4 %231 = OpFAdd %229 %230 
                                                      OpStore %219 %231 
                              Uniform f32_4* %232 = OpAccessChain %83 %195 %206 
                                       f32_4 %233 = OpLoad %232 
                                       f32_4 %234 = OpLoad %75 
                                       f32_4 %235 = OpVectorShuffle %234 %234 2 2 2 2 
                                       f32_4 %236 = OpFMul %233 %235 
                                       f32_4 %237 = OpLoad %219 
                                       f32_4 %238 = OpFAdd %236 %237 
                                                      OpStore %219 %238 
                              Uniform f32_4* %239 = OpAccessChain %83 %195 %215 
                                       f32_4 %240 = OpLoad %239 
                                       f32_4 %241 = OpLoad %75 
                                       f32_4 %242 = OpVectorShuffle %241 %241 3 3 3 3 
                                       f32_4 %243 = OpFMul %240 %242 
                                       f32_4 %244 = OpLoad %219 
                                       f32_4 %245 = OpFAdd %243 %244 
                                                      OpStore %75 %245 
                                       f32_4 %246 = OpLoad %75 
                                       f32_2 %247 = OpVectorShuffle %246 %246 0 1 
                                       f32_2 %249 = OpFAdd %247 %248 
                                       f32_4 %250 = OpLoad %219 
                                       f32_4 %251 = OpVectorShuffle %250 %249 4 5 2 3 
                                                      OpStore %219 %251 
                                       f32_4 %252 = OpLoad %219 
                                       f32_2 %253 = OpVectorShuffle %252 %252 0 1 
                              Uniform f32_4* %254 = OpAccessChain %83 %112 
                                       f32_4 %255 = OpLoad %254 
                                       f32_2 %256 = OpVectorShuffle %255 %255 0 1 
                                       f32_2 %257 = OpFDiv %253 %256 
                                       f32_4 %258 = OpLoad %219 
                                       f32_4 %259 = OpVectorShuffle %258 %257 4 5 2 3 
                                                      OpStore %219 %259 
                                       f32_4 %260 = OpLoad %219 
                                       f32_2 %261 = OpVectorShuffle %260 %260 0 1 
                                       f32_2 %264 = OpFAdd %261 %263 
                                       f32_4 %265 = OpLoad %219 
                                       f32_4 %266 = OpVectorShuffle %265 %264 4 5 2 3 
                                                      OpStore %219 %266 
                                       f32_4 %267 = OpLoad %219 
                                       f32_2 %268 = OpVectorShuffle %267 %267 0 1 
                                       f32_2 %269 = OpExtInst %1 3 %268 
                                       f32_4 %270 = OpLoad %219 
                                       f32_4 %271 = OpVectorShuffle %270 %269 4 5 2 3 
                                                      OpStore %219 %271 
                                       f32_4 %272 = OpLoad %219 
                                       f32_2 %273 = OpVectorShuffle %272 %272 0 1 
                              Uniform f32_4* %274 = OpAccessChain %83 %112 
                                       f32_4 %275 = OpLoad %274 
                                       f32_2 %276 = OpVectorShuffle %275 %275 0 1 
                                       f32_2 %277 = OpFMul %273 %276 
                                       f32_2 %279 = OpFAdd %277 %278 
                                       f32_4 %280 = OpLoad %219 
                                       f32_4 %281 = OpVectorShuffle %280 %279 4 5 2 3 
                                                      OpStore %219 %281 
                                Private i32* %287 = OpAccessChain %41 %286 
                                         i32 %288 = OpLoad %287 
                                        bool %289 = OpINotEqual %288 %71 
                                                      OpSelectionMerge %293 None 
                                                      OpBranchConditional %289 %292 %296 
                                             %292 = OpLabel 
                                       f32_4 %294 = OpLoad %219 
                                       f32_2 %295 = OpVectorShuffle %294 %294 0 1 
                                                      OpStore %291 %295 
                                                      OpBranch %293 
                                             %296 = OpLabel 
                                       f32_4 %297 = OpLoad %75 
                                       f32_2 %298 = OpVectorShuffle %297 %297 0 1 
                                                      OpStore %291 %298 
                                                      OpBranch %293 
                                             %293 = OpLabel 
                                       f32_2 %299 = OpLoad %291 
                               Output f32_4* %301 = OpAccessChain %285 %71 
                                       f32_4 %302 = OpLoad %301 
                                       f32_4 %303 = OpVectorShuffle %302 %299 4 5 2 3 
                                                      OpStore %301 %303 
                                       f32_2 %304 = OpLoad %95 
                              Uniform f32_4* %305 = OpAccessChain %83 %206 
                                       f32_4 %306 = OpLoad %305 
                                       f32_2 %307 = OpVectorShuffle %306 %306 0 1 
                                       f32_2 %308 = OpFMul %304 %307 
                              Uniform f32_4* %309 = OpAccessChain %83 %206 
                                       f32_4 %310 = OpLoad %309 
                                       f32_2 %311 = OpVectorShuffle %310 %310 2 3 
                                       f32_2 %312 = OpFAdd %308 %311 
                                       f32_4 %313 = OpLoad %117 
                                       f32_4 %314 = OpVectorShuffle %313 %312 4 1 2 5 
                                                      OpStore %117 %314 
                                Private i32* %317 = OpAccessChain %41 %48 
                                         i32 %318 = OpLoad %317 
                                        bool %319 = OpIEqual %318 %71 
                                                      OpStore %316 %319 
                                        bool %321 = OpLoad %316 
                                                      OpSelectionMerge %325 None 
                                                      OpBranchConditional %321 %324 %328 
                                             %324 = OpLabel 
                                Private i32* %326 = OpAccessChain %41 %179 
                                         i32 %327 = OpLoad %326 
                                                      OpStore %323 %327 
                                                      OpBranch %325 
                                             %328 = OpLabel 
                                                      OpStore %323 %71 
                                                      OpBranch %325 
                                             %325 = OpLabel 
                                         i32 %329 = OpLoad %323 
                                                      OpStore %320 %329 
                                       f32_4 %331 = OpLoad %117 
                                       f32_2 %332 = OpVectorShuffle %331 %331 0 3 
                              Uniform f32_4* %333 = OpAccessChain %83 %215 
                                       f32_4 %334 = OpLoad %333 
                                       f32_2 %335 = OpVectorShuffle %334 %334 0 1 
                                       f32_2 %336 = OpFMul %332 %335 
                                                      OpStore %330 %336 
                                         i32 %338 = OpLoad %320 
                                        bool %339 = OpINotEqual %338 %71 
                                                      OpSelectionMerge %342 None 
                                                      OpBranchConditional %339 %341 %344 
                                             %341 = OpLabel 
                                       f32_2 %343 = OpLoad %330 
                                                      OpStore %340 %343 
                                                      OpBranch %342 
                                             %344 = OpLabel 
                                       f32_4 %345 = OpLoad %117 
                                       f32_2 %346 = OpVectorShuffle %345 %345 0 3 
                                                      OpStore %340 %346 
                                                      OpBranch %342 
                                             %342 = OpLabel 
                                       f32_2 %347 = OpLoad %340 
                                       f32_4 %348 = OpLoad vs_TEXCOORD0 
                                       f32_4 %349 = OpVectorShuffle %348 %347 4 5 2 3 
                                                      OpStore vs_TEXCOORD0 %349 
                                       f32_4 %351 = OpLoad %350 
                              Uniform f32_4* %353 = OpAccessChain %83 %352 
                                       f32_4 %354 = OpLoad %353 
                                       f32_4 %355 = OpFMul %351 %354 
                                                      OpStore %117 %355 
                                Private f32* %356 = OpAccessChain %56 %48 
                                         f32 %357 = OpLoad %356 
                                Private f32* %358 = OpAccessChain %56 %14 
                                         f32 %359 = OpLoad %358 
                                         f32 %360 = OpFAdd %357 %359 
                                Private f32* %361 = OpAccessChain %9 %14 
                                                      OpStore %361 %360 
                                Private f32* %362 = OpAccessChain %56 %179 
                                         f32 %363 = OpLoad %362 
                                Private f32* %364 = OpAccessChain %9 %14 
                                         f32 %365 = OpLoad %364 
                                         f32 %366 = OpFAdd %363 %365 
                                Private f32* %367 = OpAccessChain %9 %14 
                                                      OpStore %367 %366 
                                Private f32* %368 = OpAccessChain %9 %14 
                                         f32 %369 = OpLoad %368 
                                         f32 %370 = OpExtInst %1 37 %369 %26 
                                Private f32* %371 = OpAccessChain %9 %14 
                                                      OpStore %371 %370 
                                Private f32* %372 = OpAccessChain %9 %14 
                                         f32 %373 = OpLoad %372 
                                         f32 %374 = OpFNegate %373 
                                         f32 %375 = OpFAdd %374 %26 
                                Private f32* %376 = OpAccessChain %56 %286 
                                                      OpStore %376 %375 
                                       f32_4 %377 = OpLoad %75 
                                       f32_2 %378 = OpVectorShuffle %377 %377 2 3 
                               Output f32_4* %379 = OpAccessChain %285 %71 
                                       f32_4 %380 = OpLoad %379 
                                       f32_4 %381 = OpVectorShuffle %380 %378 0 1 4 5 
                                                      OpStore %379 %381 
                                       f32_4 %383 = OpLoad %117 
                                                      OpStore %382 %383 
                                       f32_2 %384 = OpLoad %188 
                                       f32_4 %385 = OpLoad vs_TEXCOORD0 
                                       f32_4 %386 = OpVectorShuffle %385 %384 0 1 4 5 
                                                      OpStore vs_TEXCOORD0 %386 
                                       f32_4 %388 = OpLoad %56 
                                                      OpStore vs_TEXCOORD1 %388 
                                Private u32* %390 = OpAccessChain %35 %286 
                                         u32 %391 = OpLoad %390 
                                         i32 %392 = OpBitcast %391 
                              Uniform f32_4* %393 = OpAccessChain %83 %84 %392 
                                       f32_4 %394 = OpLoad %393 
                                                      OpStore vs_TEXCOORD2 %394 
                                 Output f32* %396 = OpAccessChain %285 %71 %48 
                                         f32 %397 = OpLoad %396 
                                         f32 %398 = OpFNegate %397 
                                 Output f32* %399 = OpAccessChain %285 %71 %48 
                                                      OpStore %399 %398 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 201
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %11 %30 %33 %151 %195 %197 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpDecorate %11 BuiltIn TessLevelOuter 
                                              OpDecorate vs_TEXCOORD0 Location 30 
                                              OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD2 Flat 
                                              OpDecorate vs_TEXCOORD2 Location 33 
                                              OpDecorate %34 RelaxedPrecision 
                                              OpDecorate %35 RelaxedPrecision 
                                              OpDecorate %41 RelaxedPrecision 
                                              OpDecorate %42 RelaxedPrecision 
                                              OpMemberDecorate %69 0 Offset 69 
                                              OpDecorate %69 Block 
                                              OpDecorate %71 DescriptorSet 71 
                                              OpDecorate %71 Binding 71 
                                              OpDecorate %134 RelaxedPrecision 
                                              OpDecorate %137 RelaxedPrecision 
                                              OpDecorate %137 DescriptorSet 137 
                                              OpDecorate %137 Binding 137 
                                              OpDecorate %138 RelaxedPrecision 
                                              OpDecorate %141 RelaxedPrecision 
                                              OpDecorate %141 DescriptorSet 141 
                                              OpDecorate %141 Binding 141 
                                              OpDecorate %142 RelaxedPrecision 
                                              OpDecorate %148 RelaxedPrecision 
                                              OpDecorate %149 RelaxedPrecision 
                                              OpDecorate %150 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD1 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD1 Flat 
                                              OpDecorate vs_TEXCOORD1 Location 151 
                                              OpDecorate %153 RelaxedPrecision 
                                              OpDecorate %154 RelaxedPrecision 
                                              OpDecorate %156 RelaxedPrecision 
                                              OpDecorate %157 RelaxedPrecision 
                                              OpDecorate %157 DescriptorSet 157 
                                              OpDecorate %157 Binding 157 
                                              OpDecorate %158 RelaxedPrecision 
                                              OpDecorate %159 RelaxedPrecision 
                                              OpDecorate %159 DescriptorSet 159 
                                              OpDecorate %159 Binding 159 
                                              OpDecorate %160 RelaxedPrecision 
                                              OpDecorate %165 RelaxedPrecision 
                                              OpDecorate %166 RelaxedPrecision 
                                              OpDecorate %167 RelaxedPrecision 
                                              OpDecorate %168 RelaxedPrecision 
                                              OpDecorate %169 RelaxedPrecision 
                                              OpDecorate %170 RelaxedPrecision 
                                              OpDecorate %171 RelaxedPrecision 
                                              OpDecorate %172 RelaxedPrecision 
                                              OpDecorate %173 RelaxedPrecision 
                                              OpDecorate %174 RelaxedPrecision 
                                              OpDecorate %177 RelaxedPrecision 
                                              OpDecorate %178 RelaxedPrecision 
                                              OpDecorate %179 RelaxedPrecision 
                                              OpDecorate %180 RelaxedPrecision 
                                              OpDecorate %180 DescriptorSet 180 
                                              OpDecorate %180 Binding 180 
                                              OpDecorate %181 RelaxedPrecision 
                                              OpDecorate %182 RelaxedPrecision 
                                              OpDecorate %182 DescriptorSet 182 
                                              OpDecorate %182 Binding 182 
                                              OpDecorate %183 RelaxedPrecision 
                                              OpDecorate %188 RelaxedPrecision 
                                              OpDecorate %189 RelaxedPrecision 
                                              OpDecorate %190 RelaxedPrecision 
                                              OpDecorate %191 RelaxedPrecision 
                                              OpDecorate %192 RelaxedPrecision 
                                              OpDecorate %193 RelaxedPrecision 
                                              OpDecorate %195 RelaxedPrecision 
                                              OpDecorate %195 Location 195 
                                              OpDecorate %196 RelaxedPrecision 
                                              OpDecorate %197 RelaxedPrecision 
                                              OpDecorate %197 Location 197 
                                              OpDecorate %198 RelaxedPrecision 
                                              OpDecorate %199 RelaxedPrecision 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Function %7 
                                      %10 = OpTypePointer Input %7 
                         Input f32_4* %11 = OpVariable Input 
                                      %12 = OpTypeVector %6 3 
                                  f32 %15 = OpConstant 3.674022E-40 
                                      %16 = OpTypeInt 32 0 
                                  u32 %17 = OpConstant 3 
                                      %18 = OpTypePointer Input %6 
                                      %26 = OpTypeBool 
                                      %27 = OpTypeVector %26 4 
                                      %28 = OpTypePointer Private %27 
                      Private bool_4* %29 = OpVariable Private 
                Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                      %37 = OpTypeVector %26 2 
                                      %49 = OpTypePointer Private %7 
                       Private f32_4* %50 = OpVariable Private 
                                  f32 %51 = OpConstant 3.674022E-40 
                                f32_4 %52 = OpConstantComposite %51 %51 %51 %51 
                                f32_4 %53 = OpConstantComposite %15 %15 %15 %15 
                                      %57 = OpTypeVector %6 2 
                                      %65 = OpTypePointer Private %37 
                      Private bool_2* %66 = OpVariable Private 
                                      %69 = OpTypeStruct %7 
                                      %70 = OpTypePointer Uniform %69 
             Uniform struct {f32_4;}* %71 = OpVariable Uniform 
                                      %72 = OpTypeInt 32 1 
                                  i32 %73 = OpConstant 0 
                                      %74 = OpTypePointer Uniform %7 
                                      %80 = OpTypePointer Private %57 
                       Private f32_2* %81 = OpVariable Private 
                                f32_2 %82 = OpConstantComposite %51 %51 
                                f32_2 %83 = OpConstantComposite %15 %15 
                                 u32 %109 = OpConstant 2 
                                     %110 = OpTypePointer Private %6 
                                 f32 %114 = OpConstant 3.674022E-40 
                               f32_3 %115 = OpConstantComposite %15 %15 %114 
                                 u32 %117 = OpConstant 0 
                                     %122 = OpTypePointer Private %26 
                                 i32 %126 = OpConstant 1 
                                 i32 %128 = OpConstant -1 
                        Private f32* %134 = OpVariable Private 
                                     %135 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %136 = OpTypePointer UniformConstant %135 
UniformConstant read_only Texture2D* %137 = OpVariable UniformConstant 
                                     %139 = OpTypeSampler 
                                     %140 = OpTypePointer UniformConstant %139 
            UniformConstant sampler* %141 = OpVariable UniformConstant 
                                     %143 = OpTypeSampledImage %135 
                      Private f32_4* %149 = OpVariable Private 
                Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                      Private f32_4* %156 = OpVariable Private 
UniformConstant read_only Texture2D* %157 = OpVariable UniformConstant 
            UniformConstant sampler* %159 = OpVariable UniformConstant 
                      Private f32_4* %165 = OpVariable Private 
UniformConstant read_only Texture2D* %180 = OpVariable UniformConstant 
            UniformConstant sampler* %182 = OpVariable UniformConstant 
                                     %194 = OpTypePointer Output %7 
                       Output f32_4* %195 = OpVariable Output 
                        Input f32_4* %197 = OpVariable Input 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                       Function f32_4* %9 = OpVariable Function 
                                f32_4 %13 = OpLoad %11 
                                f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                           Input f32* %19 = OpAccessChain %11 %17 
                                  f32 %20 = OpLoad %19 
                                  f32 %21 = OpFDiv %15 %20 
                                  f32 %22 = OpCompositeExtract %14 0 
                                  f32 %23 = OpCompositeExtract %14 1 
                                  f32 %24 = OpCompositeExtract %14 2 
                                f32_4 %25 = OpCompositeConstruct %22 %23 %24 %21 
                                              OpStore %9 %25 
                                f32_4 %31 = OpLoad vs_TEXCOORD0 
                                f32_4 %32 = OpVectorShuffle %31 %31 2 3 2 2 
                                f32_4 %34 = OpLoad vs_TEXCOORD2 
                                f32_4 %35 = OpVectorShuffle %34 %34 0 1 0 0 
                               bool_4 %36 = OpFOrdGreaterThanEqual %32 %35 
                               bool_2 %38 = OpVectorShuffle %36 %36 0 1 
                               bool_4 %39 = OpLoad %29 
                               bool_4 %40 = OpVectorShuffle %39 %38 4 5 2 3 
                                              OpStore %29 %40 
                                f32_4 %41 = OpLoad vs_TEXCOORD2 
                                f32_4 %42 = OpVectorShuffle %41 %41 2 2 2 3 
                                f32_4 %43 = OpLoad vs_TEXCOORD0 
                                f32_4 %44 = OpVectorShuffle %43 %43 2 2 2 3 
                               bool_4 %45 = OpFOrdGreaterThanEqual %42 %44 
                               bool_2 %46 = OpVectorShuffle %45 %45 2 3 
                               bool_4 %47 = OpLoad %29 
                               bool_4 %48 = OpVectorShuffle %47 %46 0 1 4 5 
                                              OpStore %29 %48 
                               bool_4 %54 = OpLoad %29 
                                f32_4 %55 = OpSelect %54 %53 %52 
                                f32_4 %56 = OpExtInst %1 46 %52 %53 %55 
                                              OpStore %50 %56 
                                f32_4 %58 = OpLoad %50 
                                f32_2 %59 = OpVectorShuffle %58 %58 2 3 
                                f32_4 %60 = OpLoad %50 
                                f32_2 %61 = OpVectorShuffle %60 %60 0 1 
                                f32_2 %62 = OpFAdd %59 %61 
                                f32_4 %63 = OpLoad %50 
                                f32_4 %64 = OpVectorShuffle %63 %62 4 5 2 3 
                                              OpStore %50 %64 
                                f32_4 %67 = OpLoad %9 
                                f32_4 %68 = OpVectorShuffle %67 %67 0 1 0 1 
                       Uniform f32_4* %75 = OpAccessChain %71 %73 
                                f32_4 %76 = OpLoad %75 
                                f32_4 %77 = OpVectorShuffle %76 %76 0 1 0 1 
                               bool_4 %78 = OpFOrdGreaterThanEqual %68 %77 
                               bool_2 %79 = OpVectorShuffle %78 %78 0 1 
                                              OpStore %66 %79 
                               bool_2 %84 = OpLoad %66 
                                f32_2 %85 = OpSelect %84 %83 %82 
                                f32_2 %86 = OpExtInst %1 46 %82 %83 %85 
                                              OpStore %81 %86 
                                f32_2 %87 = OpLoad %81 
                                f32_4 %88 = OpLoad %50 
                                f32_2 %89 = OpVectorShuffle %88 %88 0 1 
                                f32_2 %90 = OpFAdd %87 %89 
                                f32_4 %91 = OpLoad %50 
                                f32_4 %92 = OpVectorShuffle %91 %90 4 5 2 3 
                                              OpStore %50 %92 
                       Uniform f32_4* %93 = OpAccessChain %71 %73 
                                f32_4 %94 = OpLoad %93 
                                f32_4 %95 = OpVectorShuffle %94 %94 2 3 2 3 
                                f32_4 %96 = OpLoad %9 
                                f32_4 %97 = OpVectorShuffle %96 %96 0 1 0 1 
                               bool_4 %98 = OpFOrdGreaterThanEqual %95 %97 
                               bool_2 %99 = OpVectorShuffle %98 %98 0 1 
                                              OpStore %66 %99 
                              bool_2 %100 = OpLoad %66 
                               f32_2 %101 = OpSelect %100 %83 %82 
                               f32_2 %102 = OpExtInst %1 46 %82 %83 %101 
                                              OpStore %81 %102 
                               f32_2 %103 = OpLoad %81 
                               f32_4 %104 = OpLoad %50 
                               f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                               f32_2 %106 = OpFAdd %103 %105 
                               f32_4 %107 = OpLoad %50 
                               f32_4 %108 = OpVectorShuffle %107 %106 4 5 2 3 
                                              OpStore %50 %108 
                        Private f32* %111 = OpAccessChain %50 %109 
                                              OpStore %111 %15 
                               f32_4 %112 = OpLoad %50 
                               f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                                 f32 %116 = OpDot %113 %115 
                        Private f32* %118 = OpAccessChain %50 %117 
                                              OpStore %118 %116 
                        Private f32* %119 = OpAccessChain %50 %117 
                                 f32 %120 = OpLoad %119 
                                bool %121 = OpFOrdLessThan %120 %51 
                       Private bool* %123 = OpAccessChain %29 %117 
                                              OpStore %123 %121 
                       Private bool* %124 = OpAccessChain %29 %117 
                                bool %125 = OpLoad %124 
                                 i32 %127 = OpSelect %125 %126 %73 
                                 i32 %129 = OpIMul %127 %128 
                                bool %130 = OpINotEqual %129 %73 
                                              OpSelectionMerge %132 None 
                                              OpBranchConditional %130 %131 %132 
                                     %131 = OpLabel 
                                              OpKill
                                     %132 = OpLabel 
                 read_only Texture2D %138 = OpLoad %137 
                             sampler %142 = OpLoad %141 
          read_only Texture2DSampled %144 = OpSampledImage %138 %142 
                               f32_4 %145 = OpLoad vs_TEXCOORD0 
                               f32_2 %146 = OpVectorShuffle %145 %145 0 1 
                               f32_4 %147 = OpImageSampleImplicitLod %144 %146 
                                 f32 %148 = OpCompositeExtract %147 3 
                                              OpStore %134 %148 
                                 f32 %150 = OpLoad %134 
                          Input f32* %152 = OpAccessChain vs_TEXCOORD1 %117 
                                 f32 %153 = OpLoad %152 
                                 f32 %154 = OpFMul %150 %153 
                        Private f32* %155 = OpAccessChain %149 %17 
                                              OpStore %155 %154 
                 read_only Texture2D %158 = OpLoad %157 
                             sampler %160 = OpLoad %159 
          read_only Texture2DSampled %161 = OpSampledImage %158 %160 
                               f32_4 %162 = OpLoad vs_TEXCOORD0 
                               f32_2 %163 = OpVectorShuffle %162 %162 0 1 
                               f32_4 %164 = OpImageSampleImplicitLod %161 %163 
                                              OpStore %156 %164 
                               f32_4 %166 = OpLoad %156 
                               f32_4 %167 = OpLoad vs_TEXCOORD1 
                               f32_4 %168 = OpVectorShuffle %167 %167 1 1 1 1 
                               f32_4 %169 = OpFMul %166 %168 
                               f32_4 %170 = OpLoad vs_TEXCOORD1 
                               f32_4 %171 = OpVectorShuffle %170 %170 3 3 3 3 
                               f32_4 %172 = OpFAdd %169 %171 
                                              OpStore %165 %172 
                               f32_4 %173 = OpLoad vs_TEXCOORD1 
                               f32_3 %174 = OpVectorShuffle %173 %173 0 0 0 
                               f32_4 %175 = OpLoad %149 
                               f32_4 %176 = OpVectorShuffle %175 %174 4 5 6 3 
                                              OpStore %149 %176 
                               f32_4 %177 = OpLoad %149 
                               f32_4 %178 = OpLoad %165 
                               f32_4 %179 = OpFAdd %177 %178 
                                              OpStore %149 %179 
                 read_only Texture2D %181 = OpLoad %180 
                             sampler %183 = OpLoad %182 
          read_only Texture2DSampled %184 = OpSampledImage %181 %183 
                               f32_4 %185 = OpLoad vs_TEXCOORD0 
                               f32_2 %186 = OpVectorShuffle %185 %185 0 1 
                               f32_4 %187 = OpImageSampleImplicitLod %184 %186 
                                              OpStore %156 %187 
                               f32_4 %188 = OpLoad %156 
                               f32_4 %189 = OpLoad vs_TEXCOORD1 
                               f32_4 %190 = OpVectorShuffle %189 %189 2 2 2 2 
                               f32_4 %191 = OpFMul %188 %190 
                               f32_4 %192 = OpLoad %149 
                               f32_4 %193 = OpFAdd %191 %192 
                                              OpStore %149 %193 
                               f32_4 %196 = OpLoad %149 
                               f32_4 %198 = OpLoad %197 
                               f32_4 %199 = OpFMul %196 %198 
                                              OpStore %195 %199 
                                              OpReturn
                                              OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 401
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %12 %95 %167 %285 %337 %350 %382 %387 %389 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %77 ArrayStride 77 
                                                      OpDecorate %78 ArrayStride 78 
                                                      OpDecorate %80 ArrayStride 80 
                                                      OpMemberDecorate %81 0 Offset 81 
                                                      OpMemberDecorate %81 1 Offset 81 
                                                      OpMemberDecorate %81 2 Offset 81 
                                                      OpMemberDecorate %81 3 Offset 81 
                                                      OpMemberDecorate %81 4 RelaxedPrecision 
                                                      OpMemberDecorate %81 4 Offset 81 
                                                      OpMemberDecorate %81 5 Offset 81 
                                                      OpMemberDecorate %81 6 Offset 81 
                                                      OpDecorate %81 Block 
                                                      OpDecorate %83 DescriptorSet 83 
                                                      OpDecorate %83 Binding 83 
                                                      OpDecorate %95 Location 95 
                                                      OpDecorate %167 Location 167 
                                                      OpMemberDecorate %283 0 BuiltIn 283 
                                                      OpMemberDecorate %283 1 BuiltIn 283 
                                                      OpMemberDecorate %283 2 BuiltIn 283 
                                                      OpDecorate %283 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 337 
                                                      OpDecorate %350 Location 350 
                                                      OpDecorate %354 RelaxedPrecision 
                                                      OpDecorate %382 RelaxedPrecision 
                                                      OpDecorate %382 Location 382 
                                                      OpDecorate vs_TEXCOORD1 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Flat 
                                                      OpDecorate vs_TEXCOORD1 Location 387 
                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 Flat 
                                                      OpDecorate vs_TEXCOORD2 Location 389 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %13 = OpTypeInt 32 0 
                                          u32 %14 = OpConstant 0 
                                              %15 = OpTypePointer Input %6 
                                          f32 %18 = OpConstant 3.674022E-40 
                                              %20 = OpTypePointer Private %6 
                                        f32_3 %24 = OpConstantComposite %18 %18 %18 
                                          f32 %26 = OpConstant 3.674022E-40 
                                          f32 %27 = OpConstant 3.674022E-40 
                                          f32 %28 = OpConstant 3.674022E-40 
                                        f32_3 %29 = OpConstantComposite %26 %27 %28 
                                              %33 = OpTypeVector %13 4 
                                              %34 = OpTypePointer Private %33 
                               Private u32_4* %35 = OpVariable Private 
                                              %38 = OpTypeInt 32 1 
                                              %39 = OpTypeVector %38 4 
                                              %40 = OpTypePointer Private %39 
                               Private i32_4* %41 = OpVariable Private 
                                        f32_4 %44 = OpConstantComposite %18 %28 %27 %26 
                                              %45 = OpTypeBool 
                                              %46 = OpTypeVector %45 4 
                                          u32 %48 = OpConstant 1 
                                        u32_4 %49 = OpConstantComposite %14 %14 %14 %14 
                                        u32_4 %50 = OpConstantComposite %48 %48 %48 %48 
                                          u32 %52 = OpConstant 4294967295 
                               Private f32_4* %56 = OpVariable Private 
                                              %57 = OpTypeVector %38 3 
                                              %60 = OpTypeVector %13 3 
                                          u32 %62 = OpConstant 1065353216 
                                        u32_3 %63 = OpConstantComposite %62 %62 %62 
                                              %68 = OpTypePointer Private %38 
                                          i32 %71 = OpConstant 0 
                               Private f32_4* %75 = OpVariable Private 
                                          u32 %76 = OpConstant 4 
                                              %77 = OpTypeArray %7 %76 
                                              %78 = OpTypeArray %7 %76 
                                          u32 %79 = OpConstant 80 
                                              %80 = OpTypeArray %7 %79 
                                              %81 = OpTypeStruct %77 %78 %7 %7 %7 %7 %80 
                                              %82 = OpTypePointer Uniform %81 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32_4; f32_4[80];}* %83 = OpVariable Uniform 
                                          i32 %84 = OpConstant 6 
                                              %85 = OpTypePointer Private %13 
                                              %89 = OpTypeVector %6 2 
                                              %90 = OpTypePointer Uniform %7 
                                              %94 = OpTypePointer Input %89 
                                 Input f32_2* %95 = OpVariable Input 
                                             %108 = OpTypePointer Private %89 
                              Private f32_2* %109 = OpVariable Private 
                                         i32 %112 = OpConstant 5 
                              Private f32_4* %117 = OpVariable Private 
                                         f32 %136 = OpConstant 3.674022E-40 
                                         f32 %147 = OpConstant 3.674022E-40 
                                         f32 %158 = OpConstant 3.674022E-40 
                                             %166 = OpTypePointer Input %7 
                                Input f32_4* %167 = OpVariable Input 
                                         u32 %179 = OpConstant 2 
                              Private f32_2* %188 = OpVariable Private 
                                         i32 %195 = OpConstant 1 
                                         i32 %206 = OpConstant 2 
                                         i32 %215 = OpConstant 3 
                              Private f32_4* %219 = OpVariable Private 
                                       f32_2 %248 = OpConstantComposite %26 %26 
                                         f32 %262 = OpConstant 3.674022E-40 
                                       f32_2 %263 = OpConstantComposite %262 %262 
                                       f32_2 %278 = OpConstantComposite %147 %147 
                                             %282 = OpTypeArray %6 %48 
                                             %283 = OpTypeStruct %7 %6 %282 
                                             %284 = OpTypePointer Output %283 
        Output struct {f32_4; f32; f32[1];}* %285 = OpVariable Output 
                                         u32 %286 = OpConstant 3 
                                             %290 = OpTypePointer Function %89 
                                             %300 = OpTypePointer Output %7 
                                             %315 = OpTypePointer Private %45 
                               Private bool* %316 = OpVariable Private 
                                Private i32* %320 = OpVariable Private 
                                             %322 = OpTypePointer Function %38 
                              Private f32_2* %330 = OpVariable Private 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_4* %350 = OpVariable Input 
                                         i32 %352 = OpConstant 4 
                               Output f32_4* %382 = OpVariable Output 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                             %395 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_2* %291 = OpVariable Function 
                               Function i32* %323 = OpVariable Function 
                             Function f32_2* %340 = OpVariable Function 
                                   Input f32* %16 = OpAccessChain %12 %14 
                                          f32 %17 = OpLoad %16 
                                          f32 %19 = OpFMul %17 %18 
                                 Private f32* %21 = OpAccessChain %9 %14 
                                                      OpStore %21 %19 
                                        f32_3 %22 = OpLoad %12 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 0 1 
                                        f32_3 %25 = OpFMul %23 %24 
                                        f32_3 %30 = OpFAdd %25 %29 
                                        f32_4 %31 = OpLoad %9 
                                        f32_4 %32 = OpVectorShuffle %31 %30 0 4 5 6 
                                                      OpStore %9 %32 
                                        f32_4 %36 = OpLoad %9 
                                        u32_4 %37 = OpConvertFToU %36 
                                                      OpStore %35 %37 
                                        f32_3 %42 = OpLoad %12 
                                        f32_4 %43 = OpVectorShuffle %42 %42 2 2 2 2 
                                       bool_4 %47 = OpFOrdEqual %43 %44 
                                        u32_4 %51 = OpSelect %47 %50 %49 
                                        u32_4 %53 = OpCompositeConstruct %52 %52 %52 %52 
                                        u32_4 %54 = OpIMul %51 %53 
                                        i32_4 %55 = OpBitcast %54 
                                                      OpStore %41 %55 
                                        i32_4 %58 = OpLoad %41 
                                        i32_3 %59 = OpVectorShuffle %58 %58 3 2 1 
                                        u32_3 %61 = OpBitcast %59 
                                        u32_3 %64 = OpBitwiseAnd %61 %63 
                                        f32_3 %65 = OpBitcast %64 
                                        f32_4 %66 = OpLoad %56 
                                        f32_4 %67 = OpVectorShuffle %66 %65 4 5 6 3 
                                                      OpStore %56 %67 
                                 Private i32* %69 = OpAccessChain %41 %14 
                                          i32 %70 = OpLoad %69 
                                         bool %72 = OpINotEqual %70 %71 
                                                      OpSelectionMerge %74 None 
                                                      OpBranchConditional %72 %73 %157 
                                              %73 = OpLabel 
                                 Private u32* %86 = OpAccessChain %35 %14 
                                          u32 %87 = OpLoad %86 
                                          i32 %88 = OpBitcast %87 
                               Uniform f32_4* %91 = OpAccessChain %83 %84 %88 
                                        f32_4 %92 = OpLoad %91 
                                        f32_2 %93 = OpVectorShuffle %92 %92 0 1 
                                        f32_2 %96 = OpLoad %95 
                                          f32 %97 = OpDot %93 %96 
                                 Private f32* %98 = OpAccessChain %75 %14 
                                                      OpStore %98 %97 
                                 Private u32* %99 = OpAccessChain %35 %48 
                                         u32 %100 = OpLoad %99 
                                         i32 %101 = OpBitcast %100 
                              Uniform f32_4* %102 = OpAccessChain %83 %84 %101 
                                       f32_4 %103 = OpLoad %102 
                                       f32_2 %104 = OpVectorShuffle %103 %103 0 1 
                                       f32_2 %105 = OpLoad %95 
                                         f32 %106 = OpDot %104 %105 
                                Private f32* %107 = OpAccessChain %75 %48 
                                                      OpStore %107 %106 
                                       f32_4 %110 = OpLoad %75 
                                       f32_2 %111 = OpVectorShuffle %110 %110 0 1 
                              Uniform f32_4* %113 = OpAccessChain %83 %112 
                                       f32_4 %114 = OpLoad %113 
                                       f32_2 %115 = OpVectorShuffle %114 %114 2 3 
                                       f32_2 %116 = OpFMul %111 %115 
                                                      OpStore %109 %116 
                                       f32_2 %118 = OpLoad %109 
                                       f32_2 %119 = OpLoad %109 
                                         f32 %120 = OpDot %118 %119 
                                Private f32* %121 = OpAccessChain %117 %14 
                                                      OpStore %121 %120 
                                Private f32* %122 = OpAccessChain %117 %14 
                                         f32 %123 = OpLoad %122 
                                         f32 %124 = OpExtInst %1 31 %123 
                                Private f32* %125 = OpAccessChain %117 %14 
                                                      OpStore %125 %124 
                                Private f32* %126 = OpAccessChain %117 %14 
                                         f32 %127 = OpLoad %126 
                                         f32 %128 = OpExtInst %1 40 %127 %26 
                                Private f32* %129 = OpAccessChain %109 %14 
                                                      OpStore %129 %128 
                                Private f32* %130 = OpAccessChain %109 %14 
                                         f32 %131 = OpLoad %130 
                                         f32 %132 = OpExtInst %1 2 %131 
                                Private f32* %133 = OpAccessChain %109 %14 
                                                      OpStore %133 %132 
                                Private f32* %134 = OpAccessChain %117 %14 
                                         f32 %135 = OpLoad %134 
                                         f32 %137 = OpFAdd %135 %136 
                                Private f32* %138 = OpAccessChain %117 %14 
                                                      OpStore %138 %137 
                                Private f32* %139 = OpAccessChain %109 %14 
                                         f32 %140 = OpLoad %139 
                                Private f32* %141 = OpAccessChain %117 %14 
                                         f32 %142 = OpLoad %141 
                                         f32 %143 = OpFDiv %140 %142 
                                Private f32* %144 = OpAccessChain %117 %14 
                                                      OpStore %144 %143 
                                Private f32* %145 = OpAccessChain %117 %14 
                                         f32 %146 = OpLoad %145 
                                         f32 %148 = OpFAdd %146 %147 
                                Private f32* %149 = OpAccessChain %117 %14 
                                                      OpStore %149 %148 
                                       f32_4 %150 = OpLoad %75 
                                       f32_2 %151 = OpVectorShuffle %150 %150 0 1 
                                       f32_4 %152 = OpLoad %117 
                                       f32_2 %153 = OpVectorShuffle %152 %152 0 0 
                                       f32_2 %154 = OpFMul %151 %153 
                                       f32_4 %155 = OpLoad %75 
                                       f32_4 %156 = OpVectorShuffle %155 %154 4 5 2 3 
                                                      OpStore %75 %156 
                                                      OpBranch %74 
                                             %157 = OpLabel 
                                Private f32* %159 = OpAccessChain %75 %14 
                                                      OpStore %159 %158 
                                Private f32* %160 = OpAccessChain %75 %48 
                                                      OpStore %160 %158 
                                                      OpBranch %74 
                                              %74 = OpLabel 
                                Private u32* %161 = OpAccessChain %35 %14 
                                         u32 %162 = OpLoad %161 
                                         i32 %163 = OpBitcast %162 
                              Uniform f32_4* %164 = OpAccessChain %83 %84 %163 
                                       f32_4 %165 = OpLoad %164 
                                       f32_4 %168 = OpLoad %167 
                                         f32 %169 = OpDot %165 %168 
                                Private f32* %170 = OpAccessChain %109 %14 
                                                      OpStore %170 %169 
                                Private u32* %171 = OpAccessChain %35 %48 
                                         u32 %172 = OpLoad %171 
                                         i32 %173 = OpBitcast %172 
                              Uniform f32_4* %174 = OpAccessChain %83 %84 %173 
                                       f32_4 %175 = OpLoad %174 
                                       f32_4 %176 = OpLoad %167 
                                         f32 %177 = OpDot %175 %176 
                                Private f32* %178 = OpAccessChain %109 %48 
                                                      OpStore %178 %177 
                                Private u32* %180 = OpAccessChain %35 %179 
                                         u32 %181 = OpLoad %180 
                                         i32 %182 = OpBitcast %181 
                              Uniform f32_4* %183 = OpAccessChain %83 %84 %182 
                                       f32_4 %184 = OpLoad %183 
                                       f32_4 %185 = OpLoad %167 
                                         f32 %186 = OpDot %184 %185 
                                Private f32* %187 = OpAccessChain %9 %14 
                                                      OpStore %187 %186 
                                       f32_4 %189 = OpLoad %75 
                                       f32_2 %190 = OpVectorShuffle %189 %189 0 1 
                                       f32_2 %191 = OpLoad %109 
                                       f32_2 %192 = OpFAdd %190 %191 
                                                      OpStore %188 %192 
                                       f32_2 %193 = OpLoad %188 
                                       f32_4 %194 = OpVectorShuffle %193 %193 1 1 1 1 
                              Uniform f32_4* %196 = OpAccessChain %83 %71 %195 
                                       f32_4 %197 = OpLoad %196 
                                       f32_4 %198 = OpFMul %194 %197 
                                                      OpStore %75 %198 
                              Uniform f32_4* %199 = OpAccessChain %83 %71 %71 
                                       f32_4 %200 = OpLoad %199 
                                       f32_2 %201 = OpLoad %188 
                                       f32_4 %202 = OpVectorShuffle %201 %201 0 0 0 0 
                                       f32_4 %203 = OpFMul %200 %202 
                                       f32_4 %204 = OpLoad %75 
                                       f32_4 %205 = OpFAdd %203 %204 
                                                      OpStore %75 %205 
                              Uniform f32_4* %207 = OpAccessChain %83 %71 %206 
                                       f32_4 %208 = OpLoad %207 
                                       f32_4 %209 = OpLoad %9 
                                       f32_4 %210 = OpVectorShuffle %209 %209 0 0 0 0 
                                       f32_4 %211 = OpFMul %208 %210 
                                       f32_4 %212 = OpLoad %75 
                                       f32_4 %213 = OpFAdd %211 %212 
                                                      OpStore %75 %213 
                                       f32_4 %214 = OpLoad %75 
                              Uniform f32_4* %216 = OpAccessChain %83 %71 %215 
                                       f32_4 %217 = OpLoad %216 
                                       f32_4 %218 = OpFAdd %214 %217 
                                                      OpStore %75 %218 
                                       f32_4 %220 = OpLoad %75 
                                       f32_4 %221 = OpVectorShuffle %220 %220 1 1 1 1 
                              Uniform f32_4* %222 = OpAccessChain %83 %195 %195 
                                       f32_4 %223 = OpLoad %222 
                                       f32_4 %224 = OpFMul %221 %223 
                                                      OpStore %219 %224 
                              Uniform f32_4* %225 = OpAccessChain %83 %195 %71 
                                       f32_4 %226 = OpLoad %225 
                                       f32_4 %227 = OpLoad %75 
                                       f32_4 %228 = OpVectorShuffle %227 %227 0 0 0 0 
                                       f32_4 %229 = OpFMul %226 %228 
                                       f32_4 %230 = OpLoad %219 
                                       f32_4 %231 = OpFAdd %229 %230 
                                                      OpStore %219 %231 
                              Uniform f32_4* %232 = OpAccessChain %83 %195 %206 
                                       f32_4 %233 = OpLoad %232 
                                       f32_4 %234 = OpLoad %75 
                                       f32_4 %235 = OpVectorShuffle %234 %234 2 2 2 2 
                                       f32_4 %236 = OpFMul %233 %235 
                                       f32_4 %237 = OpLoad %219 
                                       f32_4 %238 = OpFAdd %236 %237 
                                                      OpStore %219 %238 
                              Uniform f32_4* %239 = OpAccessChain %83 %195 %215 
                                       f32_4 %240 = OpLoad %239 
                                       f32_4 %241 = OpLoad %75 
                                       f32_4 %242 = OpVectorShuffle %241 %241 3 3 3 3 
                                       f32_4 %243 = OpFMul %240 %242 
                                       f32_4 %244 = OpLoad %219 
                                       f32_4 %245 = OpFAdd %243 %244 
                                                      OpStore %75 %245 
                                       f32_4 %246 = OpLoad %75 
                                       f32_2 %247 = OpVectorShuffle %246 %246 0 1 
                                       f32_2 %249 = OpFAdd %247 %248 
                                       f32_4 %250 = OpLoad %219 
                                       f32_4 %251 = OpVectorShuffle %250 %249 4 5 2 3 
                                                      OpStore %219 %251 
                                       f32_4 %252 = OpLoad %219 
                                       f32_2 %253 = OpVectorShuffle %252 %252 0 1 
                              Uniform f32_4* %254 = OpAccessChain %83 %112 
                                       f32_4 %255 = OpLoad %254 
                                       f32_2 %256 = OpVectorShuffle %255 %255 0 1 
                                       f32_2 %257 = OpFDiv %253 %256 
                                       f32_4 %258 = OpLoad %219 
                                       f32_4 %259 = OpVectorShuffle %258 %257 4 5 2 3 
                                                      OpStore %219 %259 
                                       f32_4 %260 = OpLoad %219 
                                       f32_2 %261 = OpVectorShuffle %260 %260 0 1 
                                       f32_2 %264 = OpFAdd %261 %263 
                                       f32_4 %265 = OpLoad %219 
                                       f32_4 %266 = OpVectorShuffle %265 %264 4 5 2 3 
                                                      OpStore %219 %266 
                                       f32_4 %267 = OpLoad %219 
                                       f32_2 %268 = OpVectorShuffle %267 %267 0 1 
                                       f32_2 %269 = OpExtInst %1 3 %268 
                                       f32_4 %270 = OpLoad %219 
                                       f32_4 %271 = OpVectorShuffle %270 %269 4 5 2 3 
                                                      OpStore %219 %271 
                                       f32_4 %272 = OpLoad %219 
                                       f32_2 %273 = OpVectorShuffle %272 %272 0 1 
                              Uniform f32_4* %274 = OpAccessChain %83 %112 
                                       f32_4 %275 = OpLoad %274 
                                       f32_2 %276 = OpVectorShuffle %275 %275 0 1 
                                       f32_2 %277 = OpFMul %273 %276 
                                       f32_2 %279 = OpFAdd %277 %278 
                                       f32_4 %280 = OpLoad %219 
                                       f32_4 %281 = OpVectorShuffle %280 %279 4 5 2 3 
                                                      OpStore %219 %281 
                                Private i32* %287 = OpAccessChain %41 %286 
                                         i32 %288 = OpLoad %287 
                                        bool %289 = OpINotEqual %288 %71 
                                                      OpSelectionMerge %293 None 
                                                      OpBranchConditional %289 %292 %296 
                                             %292 = OpLabel 
                                       f32_4 %294 = OpLoad %219 
                                       f32_2 %295 = OpVectorShuffle %294 %294 0 1 
                                                      OpStore %291 %295 
                                                      OpBranch %293 
                                             %296 = OpLabel 
                                       f32_4 %297 = OpLoad %75 
                                       f32_2 %298 = OpVectorShuffle %297 %297 0 1 
                                                      OpStore %291 %298 
                                                      OpBranch %293 
                                             %293 = OpLabel 
                                       f32_2 %299 = OpLoad %291 
                               Output f32_4* %301 = OpAccessChain %285 %71 
                                       f32_4 %302 = OpLoad %301 
                                       f32_4 %303 = OpVectorShuffle %302 %299 4 5 2 3 
                                                      OpStore %301 %303 
                                       f32_2 %304 = OpLoad %95 
                              Uniform f32_4* %305 = OpAccessChain %83 %206 
                                       f32_4 %306 = OpLoad %305 
                                       f32_2 %307 = OpVectorShuffle %306 %306 0 1 
                                       f32_2 %308 = OpFMul %304 %307 
                              Uniform f32_4* %309 = OpAccessChain %83 %206 
                                       f32_4 %310 = OpLoad %309 
                                       f32_2 %311 = OpVectorShuffle %310 %310 2 3 
                                       f32_2 %312 = OpFAdd %308 %311 
                                       f32_4 %313 = OpLoad %117 
                                       f32_4 %314 = OpVectorShuffle %313 %312 4 1 2 5 
                                                      OpStore %117 %314 
                                Private i32* %317 = OpAccessChain %41 %48 
                                         i32 %318 = OpLoad %317 
                                        bool %319 = OpIEqual %318 %71 
                                                      OpStore %316 %319 
                                        bool %321 = OpLoad %316 
                                                      OpSelectionMerge %325 None 
                                                      OpBranchConditional %321 %324 %328 
                                             %324 = OpLabel 
                                Private i32* %326 = OpAccessChain %41 %179 
                                         i32 %327 = OpLoad %326 
                                                      OpStore %323 %327 
                                                      OpBranch %325 
                                             %328 = OpLabel 
                                                      OpStore %323 %71 
                                                      OpBranch %325 
                                             %325 = OpLabel 
                                         i32 %329 = OpLoad %323 
                                                      OpStore %320 %329 
                                       f32_4 %331 = OpLoad %117 
                                       f32_2 %332 = OpVectorShuffle %331 %331 0 3 
                              Uniform f32_4* %333 = OpAccessChain %83 %215 
                                       f32_4 %334 = OpLoad %333 
                                       f32_2 %335 = OpVectorShuffle %334 %334 0 1 
                                       f32_2 %336 = OpFMul %332 %335 
                                                      OpStore %330 %336 
                                         i32 %338 = OpLoad %320 
                                        bool %339 = OpINotEqual %338 %71 
                                                      OpSelectionMerge %342 None 
                                                      OpBranchConditional %339 %341 %344 
                                             %341 = OpLabel 
                                       f32_2 %343 = OpLoad %330 
                                                      OpStore %340 %343 
                                                      OpBranch %342 
                                             %344 = OpLabel 
                                       f32_4 %345 = OpLoad %117 
                                       f32_2 %346 = OpVectorShuffle %345 %345 0 3 
                                                      OpStore %340 %346 
                                                      OpBranch %342 
                                             %342 = OpLabel 
                                       f32_2 %347 = OpLoad %340 
                                       f32_4 %348 = OpLoad vs_TEXCOORD0 
                                       f32_4 %349 = OpVectorShuffle %348 %347 4 5 2 3 
                                                      OpStore vs_TEXCOORD0 %349 
                                       f32_4 %351 = OpLoad %350 
                              Uniform f32_4* %353 = OpAccessChain %83 %352 
                                       f32_4 %354 = OpLoad %353 
                                       f32_4 %355 = OpFMul %351 %354 
                                                      OpStore %117 %355 
                                Private f32* %356 = OpAccessChain %56 %48 
                                         f32 %357 = OpLoad %356 
                                Private f32* %358 = OpAccessChain %56 %14 
                                         f32 %359 = OpLoad %358 
                                         f32 %360 = OpFAdd %357 %359 
                                Private f32* %361 = OpAccessChain %9 %14 
                                                      OpStore %361 %360 
                                Private f32* %362 = OpAccessChain %56 %179 
                                         f32 %363 = OpLoad %362 
                                Private f32* %364 = OpAccessChain %9 %14 
                                         f32 %365 = OpLoad %364 
                                         f32 %366 = OpFAdd %363 %365 
                                Private f32* %367 = OpAccessChain %9 %14 
                                                      OpStore %367 %366 
                                Private f32* %368 = OpAccessChain %9 %14 
                                         f32 %369 = OpLoad %368 
                                         f32 %370 = OpExtInst %1 37 %369 %26 
                                Private f32* %371 = OpAccessChain %9 %14 
                                                      OpStore %371 %370 
                                Private f32* %372 = OpAccessChain %9 %14 
                                         f32 %373 = OpLoad %372 
                                         f32 %374 = OpFNegate %373 
                                         f32 %375 = OpFAdd %374 %26 
                                Private f32* %376 = OpAccessChain %56 %286 
                                                      OpStore %376 %375 
                                       f32_4 %377 = OpLoad %75 
                                       f32_2 %378 = OpVectorShuffle %377 %377 2 3 
                               Output f32_4* %379 = OpAccessChain %285 %71 
                                       f32_4 %380 = OpLoad %379 
                                       f32_4 %381 = OpVectorShuffle %380 %378 0 1 4 5 
                                                      OpStore %379 %381 
                                       f32_4 %383 = OpLoad %117 
                                                      OpStore %382 %383 
                                       f32_2 %384 = OpLoad %188 
                                       f32_4 %385 = OpLoad vs_TEXCOORD0 
                                       f32_4 %386 = OpVectorShuffle %385 %384 0 1 4 5 
                                                      OpStore vs_TEXCOORD0 %386 
                                       f32_4 %388 = OpLoad %56 
                                                      OpStore vs_TEXCOORD1 %388 
                                Private u32* %390 = OpAccessChain %35 %286 
                                         u32 %391 = OpLoad %390 
                                         i32 %392 = OpBitcast %391 
                              Uniform f32_4* %393 = OpAccessChain %83 %84 %392 
                                       f32_4 %394 = OpLoad %393 
                                                      OpStore vs_TEXCOORD2 %394 
                                 Output f32* %396 = OpAccessChain %285 %71 %48 
                                         f32 %397 = OpLoad %396 
                                         f32 %398 = OpFNegate %397 
                                 Output f32* %399 = OpAccessChain %285 %71 %48 
                                                      OpStore %399 %398 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 201
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %11 %30 %33 %151 %195 %197 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpDecorate %11 BuiltIn TessLevelOuter 
                                              OpDecorate vs_TEXCOORD0 Location 30 
                                              OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD2 Flat 
                                              OpDecorate vs_TEXCOORD2 Location 33 
                                              OpDecorate %34 RelaxedPrecision 
                                              OpDecorate %35 RelaxedPrecision 
                                              OpDecorate %41 RelaxedPrecision 
                                              OpDecorate %42 RelaxedPrecision 
                                              OpMemberDecorate %69 0 Offset 69 
                                              OpDecorate %69 Block 
                                              OpDecorate %71 DescriptorSet 71 
                                              OpDecorate %71 Binding 71 
                                              OpDecorate %134 RelaxedPrecision 
                                              OpDecorate %137 RelaxedPrecision 
                                              OpDecorate %137 DescriptorSet 137 
                                              OpDecorate %137 Binding 137 
                                              OpDecorate %138 RelaxedPrecision 
                                              OpDecorate %141 RelaxedPrecision 
                                              OpDecorate %141 DescriptorSet 141 
                                              OpDecorate %141 Binding 141 
                                              OpDecorate %142 RelaxedPrecision 
                                              OpDecorate %148 RelaxedPrecision 
                                              OpDecorate %149 RelaxedPrecision 
                                              OpDecorate %150 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD1 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD1 Flat 
                                              OpDecorate vs_TEXCOORD1 Location 151 
                                              OpDecorate %153 RelaxedPrecision 
                                              OpDecorate %154 RelaxedPrecision 
                                              OpDecorate %156 RelaxedPrecision 
                                              OpDecorate %157 RelaxedPrecision 
                                              OpDecorate %157 DescriptorSet 157 
                                              OpDecorate %157 Binding 157 
                                              OpDecorate %158 RelaxedPrecision 
                                              OpDecorate %159 RelaxedPrecision 
                                              OpDecorate %159 DescriptorSet 159 
                                              OpDecorate %159 Binding 159 
                                              OpDecorate %160 RelaxedPrecision 
                                              OpDecorate %165 RelaxedPrecision 
                                              OpDecorate %166 RelaxedPrecision 
                                              OpDecorate %167 RelaxedPrecision 
                                              OpDecorate %168 RelaxedPrecision 
                                              OpDecorate %169 RelaxedPrecision 
                                              OpDecorate %170 RelaxedPrecision 
                                              OpDecorate %171 RelaxedPrecision 
                                              OpDecorate %172 RelaxedPrecision 
                                              OpDecorate %173 RelaxedPrecision 
                                              OpDecorate %174 RelaxedPrecision 
                                              OpDecorate %177 RelaxedPrecision 
                                              OpDecorate %178 RelaxedPrecision 
                                              OpDecorate %179 RelaxedPrecision 
                                              OpDecorate %180 RelaxedPrecision 
                                              OpDecorate %180 DescriptorSet 180 
                                              OpDecorate %180 Binding 180 
                                              OpDecorate %181 RelaxedPrecision 
                                              OpDecorate %182 RelaxedPrecision 
                                              OpDecorate %182 DescriptorSet 182 
                                              OpDecorate %182 Binding 182 
                                              OpDecorate %183 RelaxedPrecision 
                                              OpDecorate %188 RelaxedPrecision 
                                              OpDecorate %189 RelaxedPrecision 
                                              OpDecorate %190 RelaxedPrecision 
                                              OpDecorate %191 RelaxedPrecision 
                                              OpDecorate %192 RelaxedPrecision 
                                              OpDecorate %193 RelaxedPrecision 
                                              OpDecorate %195 RelaxedPrecision 
                                              OpDecorate %195 Location 195 
                                              OpDecorate %196 RelaxedPrecision 
                                              OpDecorate %197 RelaxedPrecision 
                                              OpDecorate %197 Location 197 
                                              OpDecorate %198 RelaxedPrecision 
                                              OpDecorate %199 RelaxedPrecision 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Function %7 
                                      %10 = OpTypePointer Input %7 
                         Input f32_4* %11 = OpVariable Input 
                                      %12 = OpTypeVector %6 3 
                                  f32 %15 = OpConstant 3.674022E-40 
                                      %16 = OpTypeInt 32 0 
                                  u32 %17 = OpConstant 3 
                                      %18 = OpTypePointer Input %6 
                                      %26 = OpTypeBool 
                                      %27 = OpTypeVector %26 4 
                                      %28 = OpTypePointer Private %27 
                      Private bool_4* %29 = OpVariable Private 
                Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                      %37 = OpTypeVector %26 2 
                                      %49 = OpTypePointer Private %7 
                       Private f32_4* %50 = OpVariable Private 
                                  f32 %51 = OpConstant 3.674022E-40 
                                f32_4 %52 = OpConstantComposite %51 %51 %51 %51 
                                f32_4 %53 = OpConstantComposite %15 %15 %15 %15 
                                      %57 = OpTypeVector %6 2 
                                      %65 = OpTypePointer Private %37 
                      Private bool_2* %66 = OpVariable Private 
                                      %69 = OpTypeStruct %7 
                                      %70 = OpTypePointer Uniform %69 
             Uniform struct {f32_4;}* %71 = OpVariable Uniform 
                                      %72 = OpTypeInt 32 1 
                                  i32 %73 = OpConstant 0 
                                      %74 = OpTypePointer Uniform %7 
                                      %80 = OpTypePointer Private %57 
                       Private f32_2* %81 = OpVariable Private 
                                f32_2 %82 = OpConstantComposite %51 %51 
                                f32_2 %83 = OpConstantComposite %15 %15 
                                 u32 %109 = OpConstant 2 
                                     %110 = OpTypePointer Private %6 
                                 f32 %114 = OpConstant 3.674022E-40 
                               f32_3 %115 = OpConstantComposite %15 %15 %114 
                                 u32 %117 = OpConstant 0 
                                     %122 = OpTypePointer Private %26 
                                 i32 %126 = OpConstant 1 
                                 i32 %128 = OpConstant -1 
                        Private f32* %134 = OpVariable Private 
                                     %135 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %136 = OpTypePointer UniformConstant %135 
UniformConstant read_only Texture2D* %137 = OpVariable UniformConstant 
                                     %139 = OpTypeSampler 
                                     %140 = OpTypePointer UniformConstant %139 
            UniformConstant sampler* %141 = OpVariable UniformConstant 
                                     %143 = OpTypeSampledImage %135 
                      Private f32_4* %149 = OpVariable Private 
                Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                      Private f32_4* %156 = OpVariable Private 
UniformConstant read_only Texture2D* %157 = OpVariable UniformConstant 
            UniformConstant sampler* %159 = OpVariable UniformConstant 
                      Private f32_4* %165 = OpVariable Private 
UniformConstant read_only Texture2D* %180 = OpVariable UniformConstant 
            UniformConstant sampler* %182 = OpVariable UniformConstant 
                                     %194 = OpTypePointer Output %7 
                       Output f32_4* %195 = OpVariable Output 
                        Input f32_4* %197 = OpVariable Input 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                       Function f32_4* %9 = OpVariable Function 
                                f32_4 %13 = OpLoad %11 
                                f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                           Input f32* %19 = OpAccessChain %11 %17 
                                  f32 %20 = OpLoad %19 
                                  f32 %21 = OpFDiv %15 %20 
                                  f32 %22 = OpCompositeExtract %14 0 
                                  f32 %23 = OpCompositeExtract %14 1 
                                  f32 %24 = OpCompositeExtract %14 2 
                                f32_4 %25 = OpCompositeConstruct %22 %23 %24 %21 
                                              OpStore %9 %25 
                                f32_4 %31 = OpLoad vs_TEXCOORD0 
                                f32_4 %32 = OpVectorShuffle %31 %31 2 3 2 2 
                                f32_4 %34 = OpLoad vs_TEXCOORD2 
                                f32_4 %35 = OpVectorShuffle %34 %34 0 1 0 0 
                               bool_4 %36 = OpFOrdGreaterThanEqual %32 %35 
                               bool_2 %38 = OpVectorShuffle %36 %36 0 1 
                               bool_4 %39 = OpLoad %29 
                               bool_4 %40 = OpVectorShuffle %39 %38 4 5 2 3 
                                              OpStore %29 %40 
                                f32_4 %41 = OpLoad vs_TEXCOORD2 
                                f32_4 %42 = OpVectorShuffle %41 %41 2 2 2 3 
                                f32_4 %43 = OpLoad vs_TEXCOORD0 
                                f32_4 %44 = OpVectorShuffle %43 %43 2 2 2 3 
                               bool_4 %45 = OpFOrdGreaterThanEqual %42 %44 
                               bool_2 %46 = OpVectorShuffle %45 %45 2 3 
                               bool_4 %47 = OpLoad %29 
                               bool_4 %48 = OpVectorShuffle %47 %46 0 1 4 5 
                                              OpStore %29 %48 
                               bool_4 %54 = OpLoad %29 
                                f32_4 %55 = OpSelect %54 %53 %52 
                                f32_4 %56 = OpExtInst %1 46 %52 %53 %55 
                                              OpStore %50 %56 
                                f32_4 %58 = OpLoad %50 
                                f32_2 %59 = OpVectorShuffle %58 %58 2 3 
                                f32_4 %60 = OpLoad %50 
                                f32_2 %61 = OpVectorShuffle %60 %60 0 1 
                                f32_2 %62 = OpFAdd %59 %61 
                                f32_4 %63 = OpLoad %50 
                                f32_4 %64 = OpVectorShuffle %63 %62 4 5 2 3 
                                              OpStore %50 %64 
                                f32_4 %67 = OpLoad %9 
                                f32_4 %68 = OpVectorShuffle %67 %67 0 1 0 1 
                       Uniform f32_4* %75 = OpAccessChain %71 %73 
                                f32_4 %76 = OpLoad %75 
                                f32_4 %77 = OpVectorShuffle %76 %76 0 1 0 1 
                               bool_4 %78 = OpFOrdGreaterThanEqual %68 %77 
                               bool_2 %79 = OpVectorShuffle %78 %78 0 1 
                                              OpStore %66 %79 
                               bool_2 %84 = OpLoad %66 
                                f32_2 %85 = OpSelect %84 %83 %82 
                                f32_2 %86 = OpExtInst %1 46 %82 %83 %85 
                                              OpStore %81 %86 
                                f32_2 %87 = OpLoad %81 
                                f32_4 %88 = OpLoad %50 
                                f32_2 %89 = OpVectorShuffle %88 %88 0 1 
                                f32_2 %90 = OpFAdd %87 %89 
                                f32_4 %91 = OpLoad %50 
                                f32_4 %92 = OpVectorShuffle %91 %90 4 5 2 3 
                                              OpStore %50 %92 
                       Uniform f32_4* %93 = OpAccessChain %71 %73 
                                f32_4 %94 = OpLoad %93 
                                f32_4 %95 = OpVectorShuffle %94 %94 2 3 2 3 
                                f32_4 %96 = OpLoad %9 
                                f32_4 %97 = OpVectorShuffle %96 %96 0 1 0 1 
                               bool_4 %98 = OpFOrdGreaterThanEqual %95 %97 
                               bool_2 %99 = OpVectorShuffle %98 %98 0 1 
                                              OpStore %66 %99 
                              bool_2 %100 = OpLoad %66 
                               f32_2 %101 = OpSelect %100 %83 %82 
                               f32_2 %102 = OpExtInst %1 46 %82 %83 %101 
                                              OpStore %81 %102 
                               f32_2 %103 = OpLoad %81 
                               f32_4 %104 = OpLoad %50 
                               f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                               f32_2 %106 = OpFAdd %103 %105 
                               f32_4 %107 = OpLoad %50 
                               f32_4 %108 = OpVectorShuffle %107 %106 4 5 2 3 
                                              OpStore %50 %108 
                        Private f32* %111 = OpAccessChain %50 %109 
                                              OpStore %111 %15 
                               f32_4 %112 = OpLoad %50 
                               f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                                 f32 %116 = OpDot %113 %115 
                        Private f32* %118 = OpAccessChain %50 %117 
                                              OpStore %118 %116 
                        Private f32* %119 = OpAccessChain %50 %117 
                                 f32 %120 = OpLoad %119 
                                bool %121 = OpFOrdLessThan %120 %51 
                       Private bool* %123 = OpAccessChain %29 %117 
                                              OpStore %123 %121 
                       Private bool* %124 = OpAccessChain %29 %117 
                                bool %125 = OpLoad %124 
                                 i32 %127 = OpSelect %125 %126 %73 
                                 i32 %129 = OpIMul %127 %128 
                                bool %130 = OpINotEqual %129 %73 
                                              OpSelectionMerge %132 None 
                                              OpBranchConditional %130 %131 %132 
                                     %131 = OpLabel 
                                              OpKill
                                     %132 = OpLabel 
                 read_only Texture2D %138 = OpLoad %137 
                             sampler %142 = OpLoad %141 
          read_only Texture2DSampled %144 = OpSampledImage %138 %142 
                               f32_4 %145 = OpLoad vs_TEXCOORD0 
                               f32_2 %146 = OpVectorShuffle %145 %145 0 1 
                               f32_4 %147 = OpImageSampleImplicitLod %144 %146 
                                 f32 %148 = OpCompositeExtract %147 3 
                                              OpStore %134 %148 
                                 f32 %150 = OpLoad %134 
                          Input f32* %152 = OpAccessChain vs_TEXCOORD1 %117 
                                 f32 %153 = OpLoad %152 
                                 f32 %154 = OpFMul %150 %153 
                        Private f32* %155 = OpAccessChain %149 %17 
                                              OpStore %155 %154 
                 read_only Texture2D %158 = OpLoad %157 
                             sampler %160 = OpLoad %159 
          read_only Texture2DSampled %161 = OpSampledImage %158 %160 
                               f32_4 %162 = OpLoad vs_TEXCOORD0 
                               f32_2 %163 = OpVectorShuffle %162 %162 0 1 
                               f32_4 %164 = OpImageSampleImplicitLod %161 %163 
                                              OpStore %156 %164 
                               f32_4 %166 = OpLoad %156 
                               f32_4 %167 = OpLoad vs_TEXCOORD1 
                               f32_4 %168 = OpVectorShuffle %167 %167 1 1 1 1 
                               f32_4 %169 = OpFMul %166 %168 
                               f32_4 %170 = OpLoad vs_TEXCOORD1 
                               f32_4 %171 = OpVectorShuffle %170 %170 3 3 3 3 
                               f32_4 %172 = OpFAdd %169 %171 
                                              OpStore %165 %172 
                               f32_4 %173 = OpLoad vs_TEXCOORD1 
                               f32_3 %174 = OpVectorShuffle %173 %173 0 0 0 
                               f32_4 %175 = OpLoad %149 
                               f32_4 %176 = OpVectorShuffle %175 %174 4 5 6 3 
                                              OpStore %149 %176 
                               f32_4 %177 = OpLoad %149 
                               f32_4 %178 = OpLoad %165 
                               f32_4 %179 = OpFAdd %177 %178 
                                              OpStore %149 %179 
                 read_only Texture2D %181 = OpLoad %180 
                             sampler %183 = OpLoad %182 
          read_only Texture2DSampled %184 = OpSampledImage %181 %183 
                               f32_4 %185 = OpLoad vs_TEXCOORD0 
                               f32_2 %186 = OpVectorShuffle %185 %185 0 1 
                               f32_4 %187 = OpImageSampleImplicitLod %184 %186 
                                              OpStore %156 %187 
                               f32_4 %188 = OpLoad %156 
                               f32_4 %189 = OpLoad vs_TEXCOORD1 
                               f32_4 %190 = OpVectorShuffle %189 %189 2 2 2 2 
                               f32_4 %191 = OpFMul %188 %190 
                               f32_4 %192 = OpLoad %149 
                               f32_4 %193 = OpFAdd %191 %192 
                                              OpStore %149 %193 
                               f32_4 %196 = OpLoad %149 
                               f32_4 %198 = OpLoad %197 
                               f32_4 %199 = OpFMul %196 %198 
                                              OpStore %195 %199 
                                              OpReturn
                                              OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 401
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %12 %95 %167 %285 %337 %350 %382 %387 %389 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %12 Location 12 
                                                      OpDecorate %77 ArrayStride 77 
                                                      OpDecorate %78 ArrayStride 78 
                                                      OpDecorate %80 ArrayStride 80 
                                                      OpMemberDecorate %81 0 Offset 81 
                                                      OpMemberDecorate %81 1 Offset 81 
                                                      OpMemberDecorate %81 2 Offset 81 
                                                      OpMemberDecorate %81 3 Offset 81 
                                                      OpMemberDecorate %81 4 RelaxedPrecision 
                                                      OpMemberDecorate %81 4 Offset 81 
                                                      OpMemberDecorate %81 5 Offset 81 
                                                      OpMemberDecorate %81 6 Offset 81 
                                                      OpDecorate %81 Block 
                                                      OpDecorate %83 DescriptorSet 83 
                                                      OpDecorate %83 Binding 83 
                                                      OpDecorate %95 Location 95 
                                                      OpDecorate %167 Location 167 
                                                      OpMemberDecorate %283 0 BuiltIn 283 
                                                      OpMemberDecorate %283 1 BuiltIn 283 
                                                      OpMemberDecorate %283 2 BuiltIn 283 
                                                      OpDecorate %283 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 337 
                                                      OpDecorate %350 Location 350 
                                                      OpDecorate %354 RelaxedPrecision 
                                                      OpDecorate %382 RelaxedPrecision 
                                                      OpDecorate %382 Location 382 
                                                      OpDecorate vs_TEXCOORD1 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Flat 
                                                      OpDecorate vs_TEXCOORD1 Location 387 
                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 Flat 
                                                      OpDecorate vs_TEXCOORD2 Location 389 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypePointer Input %10 
                                 Input f32_3* %12 = OpVariable Input 
                                              %13 = OpTypeInt 32 0 
                                          u32 %14 = OpConstant 0 
                                              %15 = OpTypePointer Input %6 
                                          f32 %18 = OpConstant 3.674022E-40 
                                              %20 = OpTypePointer Private %6 
                                        f32_3 %24 = OpConstantComposite %18 %18 %18 
                                          f32 %26 = OpConstant 3.674022E-40 
                                          f32 %27 = OpConstant 3.674022E-40 
                                          f32 %28 = OpConstant 3.674022E-40 
                                        f32_3 %29 = OpConstantComposite %26 %27 %28 
                                              %33 = OpTypeVector %13 4 
                                              %34 = OpTypePointer Private %33 
                               Private u32_4* %35 = OpVariable Private 
                                              %38 = OpTypeInt 32 1 
                                              %39 = OpTypeVector %38 4 
                                              %40 = OpTypePointer Private %39 
                               Private i32_4* %41 = OpVariable Private 
                                        f32_4 %44 = OpConstantComposite %18 %28 %27 %26 
                                              %45 = OpTypeBool 
                                              %46 = OpTypeVector %45 4 
                                          u32 %48 = OpConstant 1 
                                        u32_4 %49 = OpConstantComposite %14 %14 %14 %14 
                                        u32_4 %50 = OpConstantComposite %48 %48 %48 %48 
                                          u32 %52 = OpConstant 4294967295 
                               Private f32_4* %56 = OpVariable Private 
                                              %57 = OpTypeVector %38 3 
                                              %60 = OpTypeVector %13 3 
                                          u32 %62 = OpConstant 1065353216 
                                        u32_3 %63 = OpConstantComposite %62 %62 %62 
                                              %68 = OpTypePointer Private %38 
                                          i32 %71 = OpConstant 0 
                               Private f32_4* %75 = OpVariable Private 
                                          u32 %76 = OpConstant 4 
                                              %77 = OpTypeArray %7 %76 
                                              %78 = OpTypeArray %7 %76 
                                          u32 %79 = OpConstant 80 
                                              %80 = OpTypeArray %7 %79 
                                              %81 = OpTypeStruct %77 %78 %7 %7 %7 %7 %80 
                                              %82 = OpTypePointer Uniform %81 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32_4; f32_4[80];}* %83 = OpVariable Uniform 
                                          i32 %84 = OpConstant 6 
                                              %85 = OpTypePointer Private %13 
                                              %89 = OpTypeVector %6 2 
                                              %90 = OpTypePointer Uniform %7 
                                              %94 = OpTypePointer Input %89 
                                 Input f32_2* %95 = OpVariable Input 
                                             %108 = OpTypePointer Private %89 
                              Private f32_2* %109 = OpVariable Private 
                                         i32 %112 = OpConstant 5 
                              Private f32_4* %117 = OpVariable Private 
                                         f32 %136 = OpConstant 3.674022E-40 
                                         f32 %147 = OpConstant 3.674022E-40 
                                         f32 %158 = OpConstant 3.674022E-40 
                                             %166 = OpTypePointer Input %7 
                                Input f32_4* %167 = OpVariable Input 
                                         u32 %179 = OpConstant 2 
                              Private f32_2* %188 = OpVariable Private 
                                         i32 %195 = OpConstant 1 
                                         i32 %206 = OpConstant 2 
                                         i32 %215 = OpConstant 3 
                              Private f32_4* %219 = OpVariable Private 
                                       f32_2 %248 = OpConstantComposite %26 %26 
                                         f32 %262 = OpConstant 3.674022E-40 
                                       f32_2 %263 = OpConstantComposite %262 %262 
                                       f32_2 %278 = OpConstantComposite %147 %147 
                                             %282 = OpTypeArray %6 %48 
                                             %283 = OpTypeStruct %7 %6 %282 
                                             %284 = OpTypePointer Output %283 
        Output struct {f32_4; f32; f32[1];}* %285 = OpVariable Output 
                                         u32 %286 = OpConstant 3 
                                             %290 = OpTypePointer Function %89 
                                             %300 = OpTypePointer Output %7 
                                             %315 = OpTypePointer Private %45 
                               Private bool* %316 = OpVariable Private 
                                Private i32* %320 = OpVariable Private 
                                             %322 = OpTypePointer Function %38 
                              Private f32_2* %330 = OpVariable Private 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_4* %350 = OpVariable Input 
                                         i32 %352 = OpConstant 4 
                               Output f32_4* %382 = OpVariable Output 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                             %395 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_2* %291 = OpVariable Function 
                               Function i32* %323 = OpVariable Function 
                             Function f32_2* %340 = OpVariable Function 
                                   Input f32* %16 = OpAccessChain %12 %14 
                                          f32 %17 = OpLoad %16 
                                          f32 %19 = OpFMul %17 %18 
                                 Private f32* %21 = OpAccessChain %9 %14 
                                                      OpStore %21 %19 
                                        f32_3 %22 = OpLoad %12 
                                        f32_3 %23 = OpVectorShuffle %22 %22 0 0 1 
                                        f32_3 %25 = OpFMul %23 %24 
                                        f32_3 %30 = OpFAdd %25 %29 
                                        f32_4 %31 = OpLoad %9 
                                        f32_4 %32 = OpVectorShuffle %31 %30 0 4 5 6 
                                                      OpStore %9 %32 
                                        f32_4 %36 = OpLoad %9 
                                        u32_4 %37 = OpConvertFToU %36 
                                                      OpStore %35 %37 
                                        f32_3 %42 = OpLoad %12 
                                        f32_4 %43 = OpVectorShuffle %42 %42 2 2 2 2 
                                       bool_4 %47 = OpFOrdEqual %43 %44 
                                        u32_4 %51 = OpSelect %47 %50 %49 
                                        u32_4 %53 = OpCompositeConstruct %52 %52 %52 %52 
                                        u32_4 %54 = OpIMul %51 %53 
                                        i32_4 %55 = OpBitcast %54 
                                                      OpStore %41 %55 
                                        i32_4 %58 = OpLoad %41 
                                        i32_3 %59 = OpVectorShuffle %58 %58 3 2 1 
                                        u32_3 %61 = OpBitcast %59 
                                        u32_3 %64 = OpBitwiseAnd %61 %63 
                                        f32_3 %65 = OpBitcast %64 
                                        f32_4 %66 = OpLoad %56 
                                        f32_4 %67 = OpVectorShuffle %66 %65 4 5 6 3 
                                                      OpStore %56 %67 
                                 Private i32* %69 = OpAccessChain %41 %14 
                                          i32 %70 = OpLoad %69 
                                         bool %72 = OpINotEqual %70 %71 
                                                      OpSelectionMerge %74 None 
                                                      OpBranchConditional %72 %73 %157 
                                              %73 = OpLabel 
                                 Private u32* %86 = OpAccessChain %35 %14 
                                          u32 %87 = OpLoad %86 
                                          i32 %88 = OpBitcast %87 
                               Uniform f32_4* %91 = OpAccessChain %83 %84 %88 
                                        f32_4 %92 = OpLoad %91 
                                        f32_2 %93 = OpVectorShuffle %92 %92 0 1 
                                        f32_2 %96 = OpLoad %95 
                                          f32 %97 = OpDot %93 %96 
                                 Private f32* %98 = OpAccessChain %75 %14 
                                                      OpStore %98 %97 
                                 Private u32* %99 = OpAccessChain %35 %48 
                                         u32 %100 = OpLoad %99 
                                         i32 %101 = OpBitcast %100 
                              Uniform f32_4* %102 = OpAccessChain %83 %84 %101 
                                       f32_4 %103 = OpLoad %102 
                                       f32_2 %104 = OpVectorShuffle %103 %103 0 1 
                                       f32_2 %105 = OpLoad %95 
                                         f32 %106 = OpDot %104 %105 
                                Private f32* %107 = OpAccessChain %75 %48 
                                                      OpStore %107 %106 
                                       f32_4 %110 = OpLoad %75 
                                       f32_2 %111 = OpVectorShuffle %110 %110 0 1 
                              Uniform f32_4* %113 = OpAccessChain %83 %112 
                                       f32_4 %114 = OpLoad %113 
                                       f32_2 %115 = OpVectorShuffle %114 %114 2 3 
                                       f32_2 %116 = OpFMul %111 %115 
                                                      OpStore %109 %116 
                                       f32_2 %118 = OpLoad %109 
                                       f32_2 %119 = OpLoad %109 
                                         f32 %120 = OpDot %118 %119 
                                Private f32* %121 = OpAccessChain %117 %14 
                                                      OpStore %121 %120 
                                Private f32* %122 = OpAccessChain %117 %14 
                                         f32 %123 = OpLoad %122 
                                         f32 %124 = OpExtInst %1 31 %123 
                                Private f32* %125 = OpAccessChain %117 %14 
                                                      OpStore %125 %124 
                                Private f32* %126 = OpAccessChain %117 %14 
                                         f32 %127 = OpLoad %126 
                                         f32 %128 = OpExtInst %1 40 %127 %26 
                                Private f32* %129 = OpAccessChain %109 %14 
                                                      OpStore %129 %128 
                                Private f32* %130 = OpAccessChain %109 %14 
                                         f32 %131 = OpLoad %130 
                                         f32 %132 = OpExtInst %1 2 %131 
                                Private f32* %133 = OpAccessChain %109 %14 
                                                      OpStore %133 %132 
                                Private f32* %134 = OpAccessChain %117 %14 
                                         f32 %135 = OpLoad %134 
                                         f32 %137 = OpFAdd %135 %136 
                                Private f32* %138 = OpAccessChain %117 %14 
                                                      OpStore %138 %137 
                                Private f32* %139 = OpAccessChain %109 %14 
                                         f32 %140 = OpLoad %139 
                                Private f32* %141 = OpAccessChain %117 %14 
                                         f32 %142 = OpLoad %141 
                                         f32 %143 = OpFDiv %140 %142 
                                Private f32* %144 = OpAccessChain %117 %14 
                                                      OpStore %144 %143 
                                Private f32* %145 = OpAccessChain %117 %14 
                                         f32 %146 = OpLoad %145 
                                         f32 %148 = OpFAdd %146 %147 
                                Private f32* %149 = OpAccessChain %117 %14 
                                                      OpStore %149 %148 
                                       f32_4 %150 = OpLoad %75 
                                       f32_2 %151 = OpVectorShuffle %150 %150 0 1 
                                       f32_4 %152 = OpLoad %117 
                                       f32_2 %153 = OpVectorShuffle %152 %152 0 0 
                                       f32_2 %154 = OpFMul %151 %153 
                                       f32_4 %155 = OpLoad %75 
                                       f32_4 %156 = OpVectorShuffle %155 %154 4 5 2 3 
                                                      OpStore %75 %156 
                                                      OpBranch %74 
                                             %157 = OpLabel 
                                Private f32* %159 = OpAccessChain %75 %14 
                                                      OpStore %159 %158 
                                Private f32* %160 = OpAccessChain %75 %48 
                                                      OpStore %160 %158 
                                                      OpBranch %74 
                                              %74 = OpLabel 
                                Private u32* %161 = OpAccessChain %35 %14 
                                         u32 %162 = OpLoad %161 
                                         i32 %163 = OpBitcast %162 
                              Uniform f32_4* %164 = OpAccessChain %83 %84 %163 
                                       f32_4 %165 = OpLoad %164 
                                       f32_4 %168 = OpLoad %167 
                                         f32 %169 = OpDot %165 %168 
                                Private f32* %170 = OpAccessChain %109 %14 
                                                      OpStore %170 %169 
                                Private u32* %171 = OpAccessChain %35 %48 
                                         u32 %172 = OpLoad %171 
                                         i32 %173 = OpBitcast %172 
                              Uniform f32_4* %174 = OpAccessChain %83 %84 %173 
                                       f32_4 %175 = OpLoad %174 
                                       f32_4 %176 = OpLoad %167 
                                         f32 %177 = OpDot %175 %176 
                                Private f32* %178 = OpAccessChain %109 %48 
                                                      OpStore %178 %177 
                                Private u32* %180 = OpAccessChain %35 %179 
                                         u32 %181 = OpLoad %180 
                                         i32 %182 = OpBitcast %181 
                              Uniform f32_4* %183 = OpAccessChain %83 %84 %182 
                                       f32_4 %184 = OpLoad %183 
                                       f32_4 %185 = OpLoad %167 
                                         f32 %186 = OpDot %184 %185 
                                Private f32* %187 = OpAccessChain %9 %14 
                                                      OpStore %187 %186 
                                       f32_4 %189 = OpLoad %75 
                                       f32_2 %190 = OpVectorShuffle %189 %189 0 1 
                                       f32_2 %191 = OpLoad %109 
                                       f32_2 %192 = OpFAdd %190 %191 
                                                      OpStore %188 %192 
                                       f32_2 %193 = OpLoad %188 
                                       f32_4 %194 = OpVectorShuffle %193 %193 1 1 1 1 
                              Uniform f32_4* %196 = OpAccessChain %83 %71 %195 
                                       f32_4 %197 = OpLoad %196 
                                       f32_4 %198 = OpFMul %194 %197 
                                                      OpStore %75 %198 
                              Uniform f32_4* %199 = OpAccessChain %83 %71 %71 
                                       f32_4 %200 = OpLoad %199 
                                       f32_2 %201 = OpLoad %188 
                                       f32_4 %202 = OpVectorShuffle %201 %201 0 0 0 0 
                                       f32_4 %203 = OpFMul %200 %202 
                                       f32_4 %204 = OpLoad %75 
                                       f32_4 %205 = OpFAdd %203 %204 
                                                      OpStore %75 %205 
                              Uniform f32_4* %207 = OpAccessChain %83 %71 %206 
                                       f32_4 %208 = OpLoad %207 
                                       f32_4 %209 = OpLoad %9 
                                       f32_4 %210 = OpVectorShuffle %209 %209 0 0 0 0 
                                       f32_4 %211 = OpFMul %208 %210 
                                       f32_4 %212 = OpLoad %75 
                                       f32_4 %213 = OpFAdd %211 %212 
                                                      OpStore %75 %213 
                                       f32_4 %214 = OpLoad %75 
                              Uniform f32_4* %216 = OpAccessChain %83 %71 %215 
                                       f32_4 %217 = OpLoad %216 
                                       f32_4 %218 = OpFAdd %214 %217 
                                                      OpStore %75 %218 
                                       f32_4 %220 = OpLoad %75 
                                       f32_4 %221 = OpVectorShuffle %220 %220 1 1 1 1 
                              Uniform f32_4* %222 = OpAccessChain %83 %195 %195 
                                       f32_4 %223 = OpLoad %222 
                                       f32_4 %224 = OpFMul %221 %223 
                                                      OpStore %219 %224 
                              Uniform f32_4* %225 = OpAccessChain %83 %195 %71 
                                       f32_4 %226 = OpLoad %225 
                                       f32_4 %227 = OpLoad %75 
                                       f32_4 %228 = OpVectorShuffle %227 %227 0 0 0 0 
                                       f32_4 %229 = OpFMul %226 %228 
                                       f32_4 %230 = OpLoad %219 
                                       f32_4 %231 = OpFAdd %229 %230 
                                                      OpStore %219 %231 
                              Uniform f32_4* %232 = OpAccessChain %83 %195 %206 
                                       f32_4 %233 = OpLoad %232 
                                       f32_4 %234 = OpLoad %75 
                                       f32_4 %235 = OpVectorShuffle %234 %234 2 2 2 2 
                                       f32_4 %236 = OpFMul %233 %235 
                                       f32_4 %237 = OpLoad %219 
                                       f32_4 %238 = OpFAdd %236 %237 
                                                      OpStore %219 %238 
                              Uniform f32_4* %239 = OpAccessChain %83 %195 %215 
                                       f32_4 %240 = OpLoad %239 
                                       f32_4 %241 = OpLoad %75 
                                       f32_4 %242 = OpVectorShuffle %241 %241 3 3 3 3 
                                       f32_4 %243 = OpFMul %240 %242 
                                       f32_4 %244 = OpLoad %219 
                                       f32_4 %245 = OpFAdd %243 %244 
                                                      OpStore %75 %245 
                                       f32_4 %246 = OpLoad %75 
                                       f32_2 %247 = OpVectorShuffle %246 %246 0 1 
                                       f32_2 %249 = OpFAdd %247 %248 
                                       f32_4 %250 = OpLoad %219 
                                       f32_4 %251 = OpVectorShuffle %250 %249 4 5 2 3 
                                                      OpStore %219 %251 
                                       f32_4 %252 = OpLoad %219 
                                       f32_2 %253 = OpVectorShuffle %252 %252 0 1 
                              Uniform f32_4* %254 = OpAccessChain %83 %112 
                                       f32_4 %255 = OpLoad %254 
                                       f32_2 %256 = OpVectorShuffle %255 %255 0 1 
                                       f32_2 %257 = OpFDiv %253 %256 
                                       f32_4 %258 = OpLoad %219 
                                       f32_4 %259 = OpVectorShuffle %258 %257 4 5 2 3 
                                                      OpStore %219 %259 
                                       f32_4 %260 = OpLoad %219 
                                       f32_2 %261 = OpVectorShuffle %260 %260 0 1 
                                       f32_2 %264 = OpFAdd %261 %263 
                                       f32_4 %265 = OpLoad %219 
                                       f32_4 %266 = OpVectorShuffle %265 %264 4 5 2 3 
                                                      OpStore %219 %266 
                                       f32_4 %267 = OpLoad %219 
                                       f32_2 %268 = OpVectorShuffle %267 %267 0 1 
                                       f32_2 %269 = OpExtInst %1 3 %268 
                                       f32_4 %270 = OpLoad %219 
                                       f32_4 %271 = OpVectorShuffle %270 %269 4 5 2 3 
                                                      OpStore %219 %271 
                                       f32_4 %272 = OpLoad %219 
                                       f32_2 %273 = OpVectorShuffle %272 %272 0 1 
                              Uniform f32_4* %274 = OpAccessChain %83 %112 
                                       f32_4 %275 = OpLoad %274 
                                       f32_2 %276 = OpVectorShuffle %275 %275 0 1 
                                       f32_2 %277 = OpFMul %273 %276 
                                       f32_2 %279 = OpFAdd %277 %278 
                                       f32_4 %280 = OpLoad %219 
                                       f32_4 %281 = OpVectorShuffle %280 %279 4 5 2 3 
                                                      OpStore %219 %281 
                                Private i32* %287 = OpAccessChain %41 %286 
                                         i32 %288 = OpLoad %287 
                                        bool %289 = OpINotEqual %288 %71 
                                                      OpSelectionMerge %293 None 
                                                      OpBranchConditional %289 %292 %296 
                                             %292 = OpLabel 
                                       f32_4 %294 = OpLoad %219 
                                       f32_2 %295 = OpVectorShuffle %294 %294 0 1 
                                                      OpStore %291 %295 
                                                      OpBranch %293 
                                             %296 = OpLabel 
                                       f32_4 %297 = OpLoad %75 
                                       f32_2 %298 = OpVectorShuffle %297 %297 0 1 
                                                      OpStore %291 %298 
                                                      OpBranch %293 
                                             %293 = OpLabel 
                                       f32_2 %299 = OpLoad %291 
                               Output f32_4* %301 = OpAccessChain %285 %71 
                                       f32_4 %302 = OpLoad %301 
                                       f32_4 %303 = OpVectorShuffle %302 %299 4 5 2 3 
                                                      OpStore %301 %303 
                                       f32_2 %304 = OpLoad %95 
                              Uniform f32_4* %305 = OpAccessChain %83 %206 
                                       f32_4 %306 = OpLoad %305 
                                       f32_2 %307 = OpVectorShuffle %306 %306 0 1 
                                       f32_2 %308 = OpFMul %304 %307 
                              Uniform f32_4* %309 = OpAccessChain %83 %206 
                                       f32_4 %310 = OpLoad %309 
                                       f32_2 %311 = OpVectorShuffle %310 %310 2 3 
                                       f32_2 %312 = OpFAdd %308 %311 
                                       f32_4 %313 = OpLoad %117 
                                       f32_4 %314 = OpVectorShuffle %313 %312 4 1 2 5 
                                                      OpStore %117 %314 
                                Private i32* %317 = OpAccessChain %41 %48 
                                         i32 %318 = OpLoad %317 
                                        bool %319 = OpIEqual %318 %71 
                                                      OpStore %316 %319 
                                        bool %321 = OpLoad %316 
                                                      OpSelectionMerge %325 None 
                                                      OpBranchConditional %321 %324 %328 
                                             %324 = OpLabel 
                                Private i32* %326 = OpAccessChain %41 %179 
                                         i32 %327 = OpLoad %326 
                                                      OpStore %323 %327 
                                                      OpBranch %325 
                                             %328 = OpLabel 
                                                      OpStore %323 %71 
                                                      OpBranch %325 
                                             %325 = OpLabel 
                                         i32 %329 = OpLoad %323 
                                                      OpStore %320 %329 
                                       f32_4 %331 = OpLoad %117 
                                       f32_2 %332 = OpVectorShuffle %331 %331 0 3 
                              Uniform f32_4* %333 = OpAccessChain %83 %215 
                                       f32_4 %334 = OpLoad %333 
                                       f32_2 %335 = OpVectorShuffle %334 %334 0 1 
                                       f32_2 %336 = OpFMul %332 %335 
                                                      OpStore %330 %336 
                                         i32 %338 = OpLoad %320 
                                        bool %339 = OpINotEqual %338 %71 
                                                      OpSelectionMerge %342 None 
                                                      OpBranchConditional %339 %341 %344 
                                             %341 = OpLabel 
                                       f32_2 %343 = OpLoad %330 
                                                      OpStore %340 %343 
                                                      OpBranch %342 
                                             %344 = OpLabel 
                                       f32_4 %345 = OpLoad %117 
                                       f32_2 %346 = OpVectorShuffle %345 %345 0 3 
                                                      OpStore %340 %346 
                                                      OpBranch %342 
                                             %342 = OpLabel 
                                       f32_2 %347 = OpLoad %340 
                                       f32_4 %348 = OpLoad vs_TEXCOORD0 
                                       f32_4 %349 = OpVectorShuffle %348 %347 4 5 2 3 
                                                      OpStore vs_TEXCOORD0 %349 
                                       f32_4 %351 = OpLoad %350 
                              Uniform f32_4* %353 = OpAccessChain %83 %352 
                                       f32_4 %354 = OpLoad %353 
                                       f32_4 %355 = OpFMul %351 %354 
                                                      OpStore %117 %355 
                                Private f32* %356 = OpAccessChain %56 %48 
                                         f32 %357 = OpLoad %356 
                                Private f32* %358 = OpAccessChain %56 %14 
                                         f32 %359 = OpLoad %358 
                                         f32 %360 = OpFAdd %357 %359 
                                Private f32* %361 = OpAccessChain %9 %14 
                                                      OpStore %361 %360 
                                Private f32* %362 = OpAccessChain %56 %179 
                                         f32 %363 = OpLoad %362 
                                Private f32* %364 = OpAccessChain %9 %14 
                                         f32 %365 = OpLoad %364 
                                         f32 %366 = OpFAdd %363 %365 
                                Private f32* %367 = OpAccessChain %9 %14 
                                                      OpStore %367 %366 
                                Private f32* %368 = OpAccessChain %9 %14 
                                         f32 %369 = OpLoad %368 
                                         f32 %370 = OpExtInst %1 37 %369 %26 
                                Private f32* %371 = OpAccessChain %9 %14 
                                                      OpStore %371 %370 
                                Private f32* %372 = OpAccessChain %9 %14 
                                         f32 %373 = OpLoad %372 
                                         f32 %374 = OpFNegate %373 
                                         f32 %375 = OpFAdd %374 %26 
                                Private f32* %376 = OpAccessChain %56 %286 
                                                      OpStore %376 %375 
                                       f32_4 %377 = OpLoad %75 
                                       f32_2 %378 = OpVectorShuffle %377 %377 2 3 
                               Output f32_4* %379 = OpAccessChain %285 %71 
                                       f32_4 %380 = OpLoad %379 
                                       f32_4 %381 = OpVectorShuffle %380 %378 0 1 4 5 
                                                      OpStore %379 %381 
                                       f32_4 %383 = OpLoad %117 
                                                      OpStore %382 %383 
                                       f32_2 %384 = OpLoad %188 
                                       f32_4 %385 = OpLoad vs_TEXCOORD0 
                                       f32_4 %386 = OpVectorShuffle %385 %384 0 1 4 5 
                                                      OpStore vs_TEXCOORD0 %386 
                                       f32_4 %388 = OpLoad %56 
                                                      OpStore vs_TEXCOORD1 %388 
                                Private u32* %390 = OpAccessChain %35 %286 
                                         u32 %391 = OpLoad %390 
                                         i32 %392 = OpBitcast %391 
                              Uniform f32_4* %393 = OpAccessChain %83 %84 %392 
                                       f32_4 %394 = OpLoad %393 
                                                      OpStore vs_TEXCOORD2 %394 
                                 Output f32* %396 = OpAccessChain %285 %71 %48 
                                         f32 %397 = OpLoad %396 
                                         f32 %398 = OpFNegate %397 
                                 Output f32* %399 = OpAccessChain %285 %71 %48 
                                                      OpStore %399 %398 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 201
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %11 %30 %33 %151 %195 %197 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpDecorate %11 BuiltIn TessLevelOuter 
                                              OpDecorate vs_TEXCOORD0 Location 30 
                                              OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD2 Flat 
                                              OpDecorate vs_TEXCOORD2 Location 33 
                                              OpDecorate %34 RelaxedPrecision 
                                              OpDecorate %35 RelaxedPrecision 
                                              OpDecorate %41 RelaxedPrecision 
                                              OpDecorate %42 RelaxedPrecision 
                                              OpMemberDecorate %69 0 Offset 69 
                                              OpDecorate %69 Block 
                                              OpDecorate %71 DescriptorSet 71 
                                              OpDecorate %71 Binding 71 
                                              OpDecorate %134 RelaxedPrecision 
                                              OpDecorate %137 RelaxedPrecision 
                                              OpDecorate %137 DescriptorSet 137 
                                              OpDecorate %137 Binding 137 
                                              OpDecorate %138 RelaxedPrecision 
                                              OpDecorate %141 RelaxedPrecision 
                                              OpDecorate %141 DescriptorSet 141 
                                              OpDecorate %141 Binding 141 
                                              OpDecorate %142 RelaxedPrecision 
                                              OpDecorate %148 RelaxedPrecision 
                                              OpDecorate %149 RelaxedPrecision 
                                              OpDecorate %150 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD1 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD1 Flat 
                                              OpDecorate vs_TEXCOORD1 Location 151 
                                              OpDecorate %153 RelaxedPrecision 
                                              OpDecorate %154 RelaxedPrecision 
                                              OpDecorate %156 RelaxedPrecision 
                                              OpDecorate %157 RelaxedPrecision 
                                              OpDecorate %157 DescriptorSet 157 
                                              OpDecorate %157 Binding 157 
                                              OpDecorate %158 RelaxedPrecision 
                                              OpDecorate %159 RelaxedPrecision 
                                              OpDecorate %159 DescriptorSet 159 
                                              OpDecorate %159 Binding 159 
                                              OpDecorate %160 RelaxedPrecision 
                                              OpDecorate %165 RelaxedPrecision 
                                              OpDecorate %166 RelaxedPrecision 
                                              OpDecorate %167 RelaxedPrecision 
                                              OpDecorate %168 RelaxedPrecision 
                                              OpDecorate %169 RelaxedPrecision 
                                              OpDecorate %170 RelaxedPrecision 
                                              OpDecorate %171 RelaxedPrecision 
                                              OpDecorate %172 RelaxedPrecision 
                                              OpDecorate %173 RelaxedPrecision 
                                              OpDecorate %174 RelaxedPrecision 
                                              OpDecorate %177 RelaxedPrecision 
                                              OpDecorate %178 RelaxedPrecision 
                                              OpDecorate %179 RelaxedPrecision 
                                              OpDecorate %180 RelaxedPrecision 
                                              OpDecorate %180 DescriptorSet 180 
                                              OpDecorate %180 Binding 180 
                                              OpDecorate %181 RelaxedPrecision 
                                              OpDecorate %182 RelaxedPrecision 
                                              OpDecorate %182 DescriptorSet 182 
                                              OpDecorate %182 Binding 182 
                                              OpDecorate %183 RelaxedPrecision 
                                              OpDecorate %188 RelaxedPrecision 
                                              OpDecorate %189 RelaxedPrecision 
                                              OpDecorate %190 RelaxedPrecision 
                                              OpDecorate %191 RelaxedPrecision 
                                              OpDecorate %192 RelaxedPrecision 
                                              OpDecorate %193 RelaxedPrecision 
                                              OpDecorate %195 RelaxedPrecision 
                                              OpDecorate %195 Location 195 
                                              OpDecorate %196 RelaxedPrecision 
                                              OpDecorate %197 RelaxedPrecision 
                                              OpDecorate %197 Location 197 
                                              OpDecorate %198 RelaxedPrecision 
                                              OpDecorate %199 RelaxedPrecision 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Function %7 
                                      %10 = OpTypePointer Input %7 
                         Input f32_4* %11 = OpVariable Input 
                                      %12 = OpTypeVector %6 3 
                                  f32 %15 = OpConstant 3.674022E-40 
                                      %16 = OpTypeInt 32 0 
                                  u32 %17 = OpConstant 3 
                                      %18 = OpTypePointer Input %6 
                                      %26 = OpTypeBool 
                                      %27 = OpTypeVector %26 4 
                                      %28 = OpTypePointer Private %27 
                      Private bool_4* %29 = OpVariable Private 
                Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                      %37 = OpTypeVector %26 2 
                                      %49 = OpTypePointer Private %7 
                       Private f32_4* %50 = OpVariable Private 
                                  f32 %51 = OpConstant 3.674022E-40 
                                f32_4 %52 = OpConstantComposite %51 %51 %51 %51 
                                f32_4 %53 = OpConstantComposite %15 %15 %15 %15 
                                      %57 = OpTypeVector %6 2 
                                      %65 = OpTypePointer Private %37 
                      Private bool_2* %66 = OpVariable Private 
                                      %69 = OpTypeStruct %7 
                                      %70 = OpTypePointer Uniform %69 
             Uniform struct {f32_4;}* %71 = OpVariable Uniform 
                                      %72 = OpTypeInt 32 1 
                                  i32 %73 = OpConstant 0 
                                      %74 = OpTypePointer Uniform %7 
                                      %80 = OpTypePointer Private %57 
                       Private f32_2* %81 = OpVariable Private 
                                f32_2 %82 = OpConstantComposite %51 %51 
                                f32_2 %83 = OpConstantComposite %15 %15 
                                 u32 %109 = OpConstant 2 
                                     %110 = OpTypePointer Private %6 
                                 f32 %114 = OpConstant 3.674022E-40 
                               f32_3 %115 = OpConstantComposite %15 %15 %114 
                                 u32 %117 = OpConstant 0 
                                     %122 = OpTypePointer Private %26 
                                 i32 %126 = OpConstant 1 
                                 i32 %128 = OpConstant -1 
                        Private f32* %134 = OpVariable Private 
                                     %135 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %136 = OpTypePointer UniformConstant %135 
UniformConstant read_only Texture2D* %137 = OpVariable UniformConstant 
                                     %139 = OpTypeSampler 
                                     %140 = OpTypePointer UniformConstant %139 
            UniformConstant sampler* %141 = OpVariable UniformConstant 
                                     %143 = OpTypeSampledImage %135 
                      Private f32_4* %149 = OpVariable Private 
                Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                      Private f32_4* %156 = OpVariable Private 
UniformConstant read_only Texture2D* %157 = OpVariable UniformConstant 
            UniformConstant sampler* %159 = OpVariable UniformConstant 
                      Private f32_4* %165 = OpVariable Private 
UniformConstant read_only Texture2D* %180 = OpVariable UniformConstant 
            UniformConstant sampler* %182 = OpVariable UniformConstant 
                                     %194 = OpTypePointer Output %7 
                       Output f32_4* %195 = OpVariable Output 
                        Input f32_4* %197 = OpVariable Input 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                       Function f32_4* %9 = OpVariable Function 
                                f32_4 %13 = OpLoad %11 
                                f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                           Input f32* %19 = OpAccessChain %11 %17 
                                  f32 %20 = OpLoad %19 
                                  f32 %21 = OpFDiv %15 %20 
                                  f32 %22 = OpCompositeExtract %14 0 
                                  f32 %23 = OpCompositeExtract %14 1 
                                  f32 %24 = OpCompositeExtract %14 2 
                                f32_4 %25 = OpCompositeConstruct %22 %23 %24 %21 
                                              OpStore %9 %25 
                                f32_4 %31 = OpLoad vs_TEXCOORD0 
                                f32_4 %32 = OpVectorShuffle %31 %31 2 3 2 2 
                                f32_4 %34 = OpLoad vs_TEXCOORD2 
                                f32_4 %35 = OpVectorShuffle %34 %34 0 1 0 0 
                               bool_4 %36 = OpFOrdGreaterThanEqual %32 %35 
                               bool_2 %38 = OpVectorShuffle %36 %36 0 1 
                               bool_4 %39 = OpLoad %29 
                               bool_4 %40 = OpVectorShuffle %39 %38 4 5 2 3 
                                              OpStore %29 %40 
                                f32_4 %41 = OpLoad vs_TEXCOORD2 
                                f32_4 %42 = OpVectorShuffle %41 %41 2 2 2 3 
                                f32_4 %43 = OpLoad vs_TEXCOORD0 
                                f32_4 %44 = OpVectorShuffle %43 %43 2 2 2 3 
                               bool_4 %45 = OpFOrdGreaterThanEqual %42 %44 
                               bool_2 %46 = OpVectorShuffle %45 %45 2 3 
                               bool_4 %47 = OpLoad %29 
                               bool_4 %48 = OpVectorShuffle %47 %46 0 1 4 5 
                                              OpStore %29 %48 
                               bool_4 %54 = OpLoad %29 
                                f32_4 %55 = OpSelect %54 %53 %52 
                                f32_4 %56 = OpExtInst %1 46 %52 %53 %55 
                                              OpStore %50 %56 
                                f32_4 %58 = OpLoad %50 
                                f32_2 %59 = OpVectorShuffle %58 %58 2 3 
                                f32_4 %60 = OpLoad %50 
                                f32_2 %61 = OpVectorShuffle %60 %60 0 1 
                                f32_2 %62 = OpFAdd %59 %61 
                                f32_4 %63 = OpLoad %50 
                                f32_4 %64 = OpVectorShuffle %63 %62 4 5 2 3 
                                              OpStore %50 %64 
                                f32_4 %67 = OpLoad %9 
                                f32_4 %68 = OpVectorShuffle %67 %67 0 1 0 1 
                       Uniform f32_4* %75 = OpAccessChain %71 %73 
                                f32_4 %76 = OpLoad %75 
                                f32_4 %77 = OpVectorShuffle %76 %76 0 1 0 1 
                               bool_4 %78 = OpFOrdGreaterThanEqual %68 %77 
                               bool_2 %79 = OpVectorShuffle %78 %78 0 1 
                                              OpStore %66 %79 
                               bool_2 %84 = OpLoad %66 
                                f32_2 %85 = OpSelect %84 %83 %82 
                                f32_2 %86 = OpExtInst %1 46 %82 %83 %85 
                                              OpStore %81 %86 
                                f32_2 %87 = OpLoad %81 
                                f32_4 %88 = OpLoad %50 
                                f32_2 %89 = OpVectorShuffle %88 %88 0 1 
                                f32_2 %90 = OpFAdd %87 %89 
                                f32_4 %91 = OpLoad %50 
                                f32_4 %92 = OpVectorShuffle %91 %90 4 5 2 3 
                                              OpStore %50 %92 
                       Uniform f32_4* %93 = OpAccessChain %71 %73 
                                f32_4 %94 = OpLoad %93 
                                f32_4 %95 = OpVectorShuffle %94 %94 2 3 2 3 
                                f32_4 %96 = OpLoad %9 
                                f32_4 %97 = OpVectorShuffle %96 %96 0 1 0 1 
                               bool_4 %98 = OpFOrdGreaterThanEqual %95 %97 
                               bool_2 %99 = OpVectorShuffle %98 %98 0 1 
                                              OpStore %66 %99 
                              bool_2 %100 = OpLoad %66 
                               f32_2 %101 = OpSelect %100 %83 %82 
                               f32_2 %102 = OpExtInst %1 46 %82 %83 %101 
                                              OpStore %81 %102 
                               f32_2 %103 = OpLoad %81 
                               f32_4 %104 = OpLoad %50 
                               f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                               f32_2 %106 = OpFAdd %103 %105 
                               f32_4 %107 = OpLoad %50 
                               f32_4 %108 = OpVectorShuffle %107 %106 4 5 2 3 
                                              OpStore %50 %108 
                        Private f32* %111 = OpAccessChain %50 %109 
                                              OpStore %111 %15 
                               f32_4 %112 = OpLoad %50 
                               f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                                 f32 %116 = OpDot %113 %115 
                        Private f32* %118 = OpAccessChain %50 %117 
                                              OpStore %118 %116 
                        Private f32* %119 = OpAccessChain %50 %117 
                                 f32 %120 = OpLoad %119 
                                bool %121 = OpFOrdLessThan %120 %51 
                       Private bool* %123 = OpAccessChain %29 %117 
                                              OpStore %123 %121 
                       Private bool* %124 = OpAccessChain %29 %117 
                                bool %125 = OpLoad %124 
                                 i32 %127 = OpSelect %125 %126 %73 
                                 i32 %129 = OpIMul %127 %128 
                                bool %130 = OpINotEqual %129 %73 
                                              OpSelectionMerge %132 None 
                                              OpBranchConditional %130 %131 %132 
                                     %131 = OpLabel 
                                              OpKill
                                     %132 = OpLabel 
                 read_only Texture2D %138 = OpLoad %137 
                             sampler %142 = OpLoad %141 
          read_only Texture2DSampled %144 = OpSampledImage %138 %142 
                               f32_4 %145 = OpLoad vs_TEXCOORD0 
                               f32_2 %146 = OpVectorShuffle %145 %145 0 1 
                               f32_4 %147 = OpImageSampleImplicitLod %144 %146 
                                 f32 %148 = OpCompositeExtract %147 3 
                                              OpStore %134 %148 
                                 f32 %150 = OpLoad %134 
                          Input f32* %152 = OpAccessChain vs_TEXCOORD1 %117 
                                 f32 %153 = OpLoad %152 
                                 f32 %154 = OpFMul %150 %153 
                        Private f32* %155 = OpAccessChain %149 %17 
                                              OpStore %155 %154 
                 read_only Texture2D %158 = OpLoad %157 
                             sampler %160 = OpLoad %159 
          read_only Texture2DSampled %161 = OpSampledImage %158 %160 
                               f32_4 %162 = OpLoad vs_TEXCOORD0 
                               f32_2 %163 = OpVectorShuffle %162 %162 0 1 
                               f32_4 %164 = OpImageSampleImplicitLod %161 %163 
                                              OpStore %156 %164 
                               f32_4 %166 = OpLoad %156 
                               f32_4 %167 = OpLoad vs_TEXCOORD1 
                               f32_4 %168 = OpVectorShuffle %167 %167 1 1 1 1 
                               f32_4 %169 = OpFMul %166 %168 
                               f32_4 %170 = OpLoad vs_TEXCOORD1 
                               f32_4 %171 = OpVectorShuffle %170 %170 3 3 3 3 
                               f32_4 %172 = OpFAdd %169 %171 
                                              OpStore %165 %172 
                               f32_4 %173 = OpLoad vs_TEXCOORD1 
                               f32_3 %174 = OpVectorShuffle %173 %173 0 0 0 
                               f32_4 %175 = OpLoad %149 
                               f32_4 %176 = OpVectorShuffle %175 %174 4 5 6 3 
                                              OpStore %149 %176 
                               f32_4 %177 = OpLoad %149 
                               f32_4 %178 = OpLoad %165 
                               f32_4 %179 = OpFAdd %177 %178 
                                              OpStore %149 %179 
                 read_only Texture2D %181 = OpLoad %180 
                             sampler %183 = OpLoad %182 
          read_only Texture2DSampled %184 = OpSampledImage %181 %183 
                               f32_4 %185 = OpLoad vs_TEXCOORD0 
                               f32_2 %186 = OpVectorShuffle %185 %185 0 1 
                               f32_4 %187 = OpImageSampleImplicitLod %184 %186 
                                              OpStore %156 %187 
                               f32_4 %188 = OpLoad %156 
                               f32_4 %189 = OpLoad vs_TEXCOORD1 
                               f32_4 %190 = OpVectorShuffle %189 %189 2 2 2 2 
                               f32_4 %191 = OpFMul %188 %190 
                               f32_4 %192 = OpLoad %149 
                               f32_4 %193 = OpFAdd %191 %192 
                                              OpStore %149 %193 
                               f32_4 %196 = OpLoad %149 
                               f32_4 %198 = OpLoad %197 
                               f32_4 %199 = OpFMul %196 %198 
                                              OpStore %195 %199 
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