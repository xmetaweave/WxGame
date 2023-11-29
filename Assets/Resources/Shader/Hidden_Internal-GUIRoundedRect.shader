//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-GUIRoundedRect" {
Properties {
_MainTex ("Texture", any) = "white" { }
_SrcBlend ("SrcBlend", Float) = 5
_DstBlend ("DstBlend", Float) = 10
}
SubShader {
 Pass {
  Blend Zero Zero, One OneMinusSrcAlpha
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 44824
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat0.xy;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat0.xx + u_xlat2.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	int _ManualTex2SRGB;
uniform 	int _SrcBlend;
uniform 	float _CornerRadiuses[4];
uniform 	float _BorderWidths[4];
uniform 	float _Rect[4];
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bvec2 u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
ivec2 u_xlati2;
vec3 u_xlat3;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bvec3 u_xlatb6;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
bool u_xlatb13;
vec2 u_xlat15;
vec2 u_xlat16;
float u_xlat18;
bool u_xlatb18;
int u_xlati19;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.x = _BorderWidths[0];
    u_xlat1.x = _BorderWidths[2];
    u_xlat12 = vs_TEXCOORD2.x + (-_Rect[0]);
    u_xlat12 = (-_Rect[2]) * 0.5 + u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=u_xlat12);
#else
    u_xlatb12 = 0.0>=u_xlat12;
#endif
    u_xlat18 = _Rect[0] + _Rect[2];
    u_xlat13 = vs_TEXCOORD2.y + (-_Rect[1]);
    u_xlat13 = (-_Rect[3]) * 0.5 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.0>=u_xlat13);
#else
    u_xlatb13 = 0.0>=u_xlat13;
#endif
    u_xlati2.xy = (bool(u_xlatb13)) ? ivec2(0, 1) : ivec2(3, 2);
    u_xlati19 = (u_xlatb12) ? u_xlati2.x : u_xlati2.y;
    u_xlat1.y = u_xlat18 + (-_CornerRadiuses[u_xlati19]);
    u_xlat0.y = _Rect[0] + _CornerRadiuses[u_xlati19];
    u_xlat2.xy = (bool(u_xlatb12)) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat15.x = _BorderWidths[1];
    u_xlat16.x = _BorderWidths[3];
    u_xlat0.x = _Rect[1] + _Rect[3];
    u_xlat16.y = u_xlat0.x + (-_CornerRadiuses[u_xlati19]);
    u_xlat15.y = _Rect[1] + _CornerRadiuses[u_xlati19];
    u_xlat2.zw = (bool(u_xlatb13)) ? u_xlat15.xy : u_xlat16.xy;
    u_xlat0.xy = (-u_xlat2.xz) + vec2(_CornerRadiuses[u_xlati19]);
    u_xlat18 = u_xlat0.x / u_xlat0.y;
    u_xlat3.xy = (-u_xlat2.yw) + vs_TEXCOORD2.xy;
    u_xlat3.z = u_xlat18 * u_xlat3.y;
    u_xlat18 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat1.x = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + (-_CornerRadiuses[u_xlati19]);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = (-u_xlat0.x) + u_xlat18;
    u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
    u_xlat6.x = dFdx(vs_TEXCOORD2.x);
    u_xlat6.x = float(1.0) / abs(u_xlat6.x);
    u_xlat18 = u_xlat18 * u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat1.x * u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat0.x = (u_xlatb0.x) ? u_xlat18 : 1.0;
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat2.xzxx).xy;
    u_xlatb18 = u_xlatb1.y || u_xlatb1.x;
    u_xlat0.x = u_xlatb18 ? u_xlat0.x : float(0.0);
    u_xlat6.x = u_xlatb18 ? u_xlat6.x : float(0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat6.x==0.0);
#else
    u_xlatb18 = u_xlat6.x==0.0;
#endif
    u_xlat6.x = (-u_xlat6.x) + 1.0;
    u_xlat0.x = (u_xlatb18) ? u_xlat0.x : u_xlat6.x;
    u_xlatb6.xz = greaterThanEqual(u_xlat2.yyww, vs_TEXCOORD2.xxyy).xz;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD2.xyxx, u_xlat2.ywyy).xy;
    u_xlatb6.x = (u_xlatb12) ? u_xlatb6.x : u_xlatb1.x;
    u_xlatb12 = (u_xlatb13) ? u_xlatb6.z : u_xlatb1.y;
    u_xlatb6.x = u_xlatb12 && u_xlatb6.x;
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : 1.0;
    u_xlat12 = _BorderWidths[0] + _BorderWidths[2];
    u_xlat12 = (-u_xlat12) + _Rect[2];
    u_xlat18 = _BorderWidths[0] + _Rect[0];
    u_xlat12 = u_xlat12 + u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vs_TEXCOORD2.x>=u_xlat18);
#else
    u_xlatb18 = vs_TEXCOORD2.x>=u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat12>=vs_TEXCOORD2.x);
#else
    u_xlatb12 = u_xlat12>=vs_TEXCOORD2.x;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb18;
    u_xlat18 = _BorderWidths[1] + _Rect[1];
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(vs_TEXCOORD2.y>=u_xlat18);
#else
    u_xlatb1.x = vs_TEXCOORD2.y>=u_xlat18;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb1.x;
    u_xlat1.x = _BorderWidths[1] + _BorderWidths[3];
    u_xlat1.x = (-u_xlat1.x) + _Rect[3];
    u_xlat18 = u_xlat18 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18>=vs_TEXCOORD2.y);
#else
    u_xlatb18 = u_xlat18>=vs_TEXCOORD2.y;
#endif
    u_xlatb12 = u_xlatb18 && u_xlatb12;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat6.x = (u_xlatb6.x) ? 1.0 : u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0<_BorderWidths[0]);
#else
    u_xlatb12 = 0.0<_BorderWidths[0];
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[1]);
#else
    u_xlatb18 = 0.0<_BorderWidths[1];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[2]);
#else
    u_xlatb18 = 0.0<_BorderWidths[2];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[3]);
#else
    u_xlatb18 = 0.0<_BorderWidths[3];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
    u_xlat6.x = (u_xlatb12) ? u_xlat6.x : 1.0;
    u_xlat0.z = u_xlat6.x * u_xlat0.x;
    u_xlat6.z = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_5.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = log2(u_xlat16_5.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = (_ManualTex2SRGB != 0) ? u_xlat2.xyz : u_xlat16_1.xyz;
    u_xlat16_23 = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * u_xlat16_23;
    u_xlat0.xz = u_xlat6.xz * u_xlat0.xz;
    u_xlat0.x = u_xlat6.z * u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.zzz * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_SrcBlend!=5);
#else
    u_xlatb18 = _SrcBlend!=5;
#endif
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat16_5.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat0.xy;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat0.xx + u_xlat2.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	int _ManualTex2SRGB;
uniform 	int _SrcBlend;
uniform 	float _CornerRadiuses[4];
uniform 	float _BorderWidths[4];
uniform 	float _Rect[4];
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bvec2 u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
ivec2 u_xlati2;
vec3 u_xlat3;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bvec3 u_xlatb6;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
bool u_xlatb13;
vec2 u_xlat15;
vec2 u_xlat16;
float u_xlat18;
bool u_xlatb18;
int u_xlati19;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.x = _BorderWidths[0];
    u_xlat1.x = _BorderWidths[2];
    u_xlat12 = vs_TEXCOORD2.x + (-_Rect[0]);
    u_xlat12 = (-_Rect[2]) * 0.5 + u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=u_xlat12);
#else
    u_xlatb12 = 0.0>=u_xlat12;
#endif
    u_xlat18 = _Rect[0] + _Rect[2];
    u_xlat13 = vs_TEXCOORD2.y + (-_Rect[1]);
    u_xlat13 = (-_Rect[3]) * 0.5 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.0>=u_xlat13);
#else
    u_xlatb13 = 0.0>=u_xlat13;
#endif
    u_xlati2.xy = (bool(u_xlatb13)) ? ivec2(0, 1) : ivec2(3, 2);
    u_xlati19 = (u_xlatb12) ? u_xlati2.x : u_xlati2.y;
    u_xlat1.y = u_xlat18 + (-_CornerRadiuses[u_xlati19]);
    u_xlat0.y = _Rect[0] + _CornerRadiuses[u_xlati19];
    u_xlat2.xy = (bool(u_xlatb12)) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat15.x = _BorderWidths[1];
    u_xlat16.x = _BorderWidths[3];
    u_xlat0.x = _Rect[1] + _Rect[3];
    u_xlat16.y = u_xlat0.x + (-_CornerRadiuses[u_xlati19]);
    u_xlat15.y = _Rect[1] + _CornerRadiuses[u_xlati19];
    u_xlat2.zw = (bool(u_xlatb13)) ? u_xlat15.xy : u_xlat16.xy;
    u_xlat0.xy = (-u_xlat2.xz) + vec2(_CornerRadiuses[u_xlati19]);
    u_xlat18 = u_xlat0.x / u_xlat0.y;
    u_xlat3.xy = (-u_xlat2.yw) + vs_TEXCOORD2.xy;
    u_xlat3.z = u_xlat18 * u_xlat3.y;
    u_xlat18 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat1.x = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + (-_CornerRadiuses[u_xlati19]);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = (-u_xlat0.x) + u_xlat18;
    u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
    u_xlat6.x = dFdx(vs_TEXCOORD2.x);
    u_xlat6.x = float(1.0) / abs(u_xlat6.x);
    u_xlat18 = u_xlat18 * u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat1.x * u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat0.x = (u_xlatb0.x) ? u_xlat18 : 1.0;
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat2.xzxx).xy;
    u_xlatb18 = u_xlatb1.y || u_xlatb1.x;
    u_xlat0.x = u_xlatb18 ? u_xlat0.x : float(0.0);
    u_xlat6.x = u_xlatb18 ? u_xlat6.x : float(0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat6.x==0.0);
#else
    u_xlatb18 = u_xlat6.x==0.0;
#endif
    u_xlat6.x = (-u_xlat6.x) + 1.0;
    u_xlat0.x = (u_xlatb18) ? u_xlat0.x : u_xlat6.x;
    u_xlatb6.xz = greaterThanEqual(u_xlat2.yyww, vs_TEXCOORD2.xxyy).xz;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD2.xyxx, u_xlat2.ywyy).xy;
    u_xlatb6.x = (u_xlatb12) ? u_xlatb6.x : u_xlatb1.x;
    u_xlatb12 = (u_xlatb13) ? u_xlatb6.z : u_xlatb1.y;
    u_xlatb6.x = u_xlatb12 && u_xlatb6.x;
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : 1.0;
    u_xlat12 = _BorderWidths[0] + _BorderWidths[2];
    u_xlat12 = (-u_xlat12) + _Rect[2];
    u_xlat18 = _BorderWidths[0] + _Rect[0];
    u_xlat12 = u_xlat12 + u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vs_TEXCOORD2.x>=u_xlat18);
#else
    u_xlatb18 = vs_TEXCOORD2.x>=u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat12>=vs_TEXCOORD2.x);
#else
    u_xlatb12 = u_xlat12>=vs_TEXCOORD2.x;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb18;
    u_xlat18 = _BorderWidths[1] + _Rect[1];
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(vs_TEXCOORD2.y>=u_xlat18);
#else
    u_xlatb1.x = vs_TEXCOORD2.y>=u_xlat18;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb1.x;
    u_xlat1.x = _BorderWidths[1] + _BorderWidths[3];
    u_xlat1.x = (-u_xlat1.x) + _Rect[3];
    u_xlat18 = u_xlat18 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18>=vs_TEXCOORD2.y);
#else
    u_xlatb18 = u_xlat18>=vs_TEXCOORD2.y;
#endif
    u_xlatb12 = u_xlatb18 && u_xlatb12;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat6.x = (u_xlatb6.x) ? 1.0 : u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0<_BorderWidths[0]);
#else
    u_xlatb12 = 0.0<_BorderWidths[0];
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[1]);
#else
    u_xlatb18 = 0.0<_BorderWidths[1];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[2]);
#else
    u_xlatb18 = 0.0<_BorderWidths[2];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[3]);
#else
    u_xlatb18 = 0.0<_BorderWidths[3];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
    u_xlat6.x = (u_xlatb12) ? u_xlat6.x : 1.0;
    u_xlat0.z = u_xlat6.x * u_xlat0.x;
    u_xlat6.z = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_5.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = log2(u_xlat16_5.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = (_ManualTex2SRGB != 0) ? u_xlat2.xyz : u_xlat16_1.xyz;
    u_xlat16_23 = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * u_xlat16_23;
    u_xlat0.xz = u_xlat6.xz * u_xlat0.xz;
    u_xlat0.x = u_xlat6.z * u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.zzz * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_SrcBlend!=5);
#else
    u_xlatb18 = _SrcBlend!=5;
#endif
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat16_5.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat0.xy;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat0.xx + u_xlat2.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	int _ManualTex2SRGB;
uniform 	int _SrcBlend;
uniform 	float _CornerRadiuses[4];
uniform 	float _BorderWidths[4];
uniform 	float _Rect[4];
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bvec2 u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
ivec2 u_xlati2;
vec3 u_xlat3;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bvec3 u_xlatb6;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
bool u_xlatb13;
vec2 u_xlat15;
vec2 u_xlat16;
float u_xlat18;
bool u_xlatb18;
int u_xlati19;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.x = _BorderWidths[0];
    u_xlat1.x = _BorderWidths[2];
    u_xlat12 = vs_TEXCOORD2.x + (-_Rect[0]);
    u_xlat12 = (-_Rect[2]) * 0.5 + u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=u_xlat12);
#else
    u_xlatb12 = 0.0>=u_xlat12;
#endif
    u_xlat18 = _Rect[0] + _Rect[2];
    u_xlat13 = vs_TEXCOORD2.y + (-_Rect[1]);
    u_xlat13 = (-_Rect[3]) * 0.5 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.0>=u_xlat13);
#else
    u_xlatb13 = 0.0>=u_xlat13;
#endif
    u_xlati2.xy = (bool(u_xlatb13)) ? ivec2(0, 1) : ivec2(3, 2);
    u_xlati19 = (u_xlatb12) ? u_xlati2.x : u_xlati2.y;
    u_xlat1.y = u_xlat18 + (-_CornerRadiuses[u_xlati19]);
    u_xlat0.y = _Rect[0] + _CornerRadiuses[u_xlati19];
    u_xlat2.xy = (bool(u_xlatb12)) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat15.x = _BorderWidths[1];
    u_xlat16.x = _BorderWidths[3];
    u_xlat0.x = _Rect[1] + _Rect[3];
    u_xlat16.y = u_xlat0.x + (-_CornerRadiuses[u_xlati19]);
    u_xlat15.y = _Rect[1] + _CornerRadiuses[u_xlati19];
    u_xlat2.zw = (bool(u_xlatb13)) ? u_xlat15.xy : u_xlat16.xy;
    u_xlat0.xy = (-u_xlat2.xz) + vec2(_CornerRadiuses[u_xlati19]);
    u_xlat18 = u_xlat0.x / u_xlat0.y;
    u_xlat3.xy = (-u_xlat2.yw) + vs_TEXCOORD2.xy;
    u_xlat3.z = u_xlat18 * u_xlat3.y;
    u_xlat18 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat1.x = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + (-_CornerRadiuses[u_xlati19]);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = (-u_xlat0.x) + u_xlat18;
    u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
    u_xlat6.x = dFdx(vs_TEXCOORD2.x);
    u_xlat6.x = float(1.0) / abs(u_xlat6.x);
    u_xlat18 = u_xlat18 * u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat1.x * u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat0.x = (u_xlatb0.x) ? u_xlat18 : 1.0;
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat2.xzxx).xy;
    u_xlatb18 = u_xlatb1.y || u_xlatb1.x;
    u_xlat0.x = u_xlatb18 ? u_xlat0.x : float(0.0);
    u_xlat6.x = u_xlatb18 ? u_xlat6.x : float(0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat6.x==0.0);
#else
    u_xlatb18 = u_xlat6.x==0.0;
#endif
    u_xlat6.x = (-u_xlat6.x) + 1.0;
    u_xlat0.x = (u_xlatb18) ? u_xlat0.x : u_xlat6.x;
    u_xlatb6.xz = greaterThanEqual(u_xlat2.yyww, vs_TEXCOORD2.xxyy).xz;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD2.xyxx, u_xlat2.ywyy).xy;
    u_xlatb6.x = (u_xlatb12) ? u_xlatb6.x : u_xlatb1.x;
    u_xlatb12 = (u_xlatb13) ? u_xlatb6.z : u_xlatb1.y;
    u_xlatb6.x = u_xlatb12 && u_xlatb6.x;
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : 1.0;
    u_xlat12 = _BorderWidths[0] + _BorderWidths[2];
    u_xlat12 = (-u_xlat12) + _Rect[2];
    u_xlat18 = _BorderWidths[0] + _Rect[0];
    u_xlat12 = u_xlat12 + u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vs_TEXCOORD2.x>=u_xlat18);
#else
    u_xlatb18 = vs_TEXCOORD2.x>=u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat12>=vs_TEXCOORD2.x);
#else
    u_xlatb12 = u_xlat12>=vs_TEXCOORD2.x;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb18;
    u_xlat18 = _BorderWidths[1] + _Rect[1];
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(vs_TEXCOORD2.y>=u_xlat18);
#else
    u_xlatb1.x = vs_TEXCOORD2.y>=u_xlat18;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb1.x;
    u_xlat1.x = _BorderWidths[1] + _BorderWidths[3];
    u_xlat1.x = (-u_xlat1.x) + _Rect[3];
    u_xlat18 = u_xlat18 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18>=vs_TEXCOORD2.y);
#else
    u_xlatb18 = u_xlat18>=vs_TEXCOORD2.y;
#endif
    u_xlatb12 = u_xlatb18 && u_xlatb12;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat6.x = (u_xlatb6.x) ? 1.0 : u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0<_BorderWidths[0]);
#else
    u_xlatb12 = 0.0<_BorderWidths[0];
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[1]);
#else
    u_xlatb18 = 0.0<_BorderWidths[1];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[2]);
#else
    u_xlatb18 = 0.0<_BorderWidths[2];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[3]);
#else
    u_xlatb18 = 0.0<_BorderWidths[3];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
    u_xlat6.x = (u_xlatb12) ? u_xlat6.x : 1.0;
    u_xlat0.z = u_xlat6.x * u_xlat0.x;
    u_xlat6.z = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_5.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = log2(u_xlat16_5.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = (_ManualTex2SRGB != 0) ? u_xlat2.xyz : u_xlat16_1.xyz;
    u_xlat16_23 = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * u_xlat16_23;
    u_xlat0.xz = u_xlat6.xz * u_xlat0.xz;
    u_xlat0.x = u_xlat6.z * u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.zzz * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_SrcBlend!=5);
#else
    u_xlatb18 = _SrcBlend!=5;
#endif
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat16_5.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 176
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %74 %84 %85 %149 %156 %158 %168 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpMemberDecorate %72 0 BuiltIn 72 
                                                      OpMemberDecorate %72 1 BuiltIn 72 
                                                      OpMemberDecorate %72 2 BuiltIn 72 
                                                      OpDecorate %72 Block 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 149 
                                                      OpDecorate vs_TEXCOORD0 Location 156 
                                                      OpDecorate %158 Location 158 
                                                      OpDecorate vs_TEXCOORD2 Location 168 
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
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeArray %7 %15 
                                              %20 = OpTypeStruct %16 %17 %18 %7 %19 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4[4];}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 0 
                                          i32 %25 = OpConstant 1 
                                              %26 = OpTypePointer Uniform %7 
                                          i32 %37 = OpConstant 2 
                                          i32 %46 = OpConstant 3 
                               Private f32_4* %50 = OpVariable Private 
                                          u32 %70 = OpConstant 1 
                                              %71 = OpTypeArray %6 %70 
                                              %72 = OpTypeStruct %7 %6 %71 
                                              %73 = OpTypePointer Output %72 
         Output struct {f32_4; f32; f32[1];}* %74 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                Output f32_4* %84 = OpVariable Output 
                                 Input f32_4* %85 = OpVariable Input 
                                              %87 = OpTypeVector %6 2 
                                             %129 = OpTypePointer Private %87 
                              Private f32_2* %130 = OpVariable Private 
                                         i32 %133 = OpConstant 4 
                                             %148 = OpTypePointer Output %87 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %157 = OpTypePointer Input %87 
                                Input f32_2* %158 = OpVariable Input 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                             %170 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %27 = OpAccessChain %22 %24 %25 
                                        f32_4 %28 = OpLoad %27 
                                        f32_4 %29 = OpFMul %13 %28 
                                                      OpStore %9 %29 
                               Uniform f32_4* %30 = OpAccessChain %22 %24 %24 
                                        f32_4 %31 = OpLoad %30 
                                        f32_4 %32 = OpLoad %11 
                                        f32_4 %33 = OpVectorShuffle %32 %32 0 0 0 0 
                                        f32_4 %34 = OpFMul %31 %33 
                                        f32_4 %35 = OpLoad %9 
                                        f32_4 %36 = OpFAdd %34 %35 
                                                      OpStore %9 %36 
                               Uniform f32_4* %38 = OpAccessChain %22 %24 %37 
                                        f32_4 %39 = OpLoad %38 
                                        f32_4 %40 = OpLoad %11 
                                        f32_4 %41 = OpVectorShuffle %40 %40 2 2 2 2 
                                        f32_4 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpFAdd %42 %43 
                                                      OpStore %9 %44 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %22 %24 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %9 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_4 %52 = OpVectorShuffle %51 %51 1 1 1 1 
                               Uniform f32_4* %53 = OpAccessChain %22 %37 %25 
                                        f32_4 %54 = OpLoad %53 
                                        f32_4 %55 = OpFMul %52 %54 
                                                      OpStore %50 %55 
                               Uniform f32_4* %56 = OpAccessChain %22 %37 %24 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                                        f32_4 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %50 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %50 %62 
                               Uniform f32_4* %63 = OpAccessChain %22 %37 %37 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpVectorShuffle %65 %65 2 2 2 2 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %50 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %50 %69 
                               Uniform f32_4* %75 = OpAccessChain %22 %37 %46 
                                        f32_4 %76 = OpLoad %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpVectorShuffle %77 %77 3 3 3 3 
                                        f32_4 %79 = OpFMul %76 %78 
                                        f32_4 %80 = OpLoad %50 
                                        f32_4 %81 = OpFAdd %79 %80 
                                Output f32_4* %83 = OpAccessChain %74 %24 
                                                      OpStore %83 %81 
                                        f32_4 %86 = OpLoad %85 
                                                      OpStore %84 %86 
                                        f32_4 %88 = OpLoad %9 
                                        f32_2 %89 = OpVectorShuffle %88 %88 1 1 
                               Uniform f32_4* %90 = OpAccessChain %22 %25 %25 
                                        f32_4 %91 = OpLoad %90 
                                        f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                        f32_2 %93 = OpFMul %89 %92 
                                        f32_4 %94 = OpLoad %50 
                                        f32_4 %95 = OpVectorShuffle %94 %93 4 5 2 3 
                                                      OpStore %50 %95 
                               Uniform f32_4* %96 = OpAccessChain %22 %25 %24 
                                        f32_4 %97 = OpLoad %96 
                                        f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                                        f32_4 %99 = OpLoad %9 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 0 
                                       f32_2 %101 = OpFMul %98 %100 
                                       f32_4 %102 = OpLoad %50 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFAdd %101 %103 
                                       f32_4 %105 = OpLoad %9 
                                       f32_4 %106 = OpVectorShuffle %105 %104 4 5 2 3 
                                                      OpStore %9 %106 
                              Uniform f32_4* %107 = OpAccessChain %22 %25 %37 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                       f32_4 %110 = OpLoad %9 
                                       f32_2 %111 = OpVectorShuffle %110 %110 2 2 
                                       f32_2 %112 = OpFMul %109 %111 
                                       f32_4 %113 = OpLoad %9 
                                       f32_2 %114 = OpVectorShuffle %113 %113 0 1 
                                       f32_2 %115 = OpFAdd %112 %114 
                                       f32_4 %116 = OpLoad %9 
                                       f32_4 %117 = OpVectorShuffle %116 %115 4 5 2 3 
                                                      OpStore %9 %117 
                              Uniform f32_4* %118 = OpAccessChain %22 %25 %46 
                                       f32_4 %119 = OpLoad %118 
                                       f32_2 %120 = OpVectorShuffle %119 %119 0 1 
                                       f32_4 %121 = OpLoad %9 
                                       f32_2 %122 = OpVectorShuffle %121 %121 3 3 
                                       f32_2 %123 = OpFMul %120 %122 
                                       f32_4 %124 = OpLoad %9 
                                       f32_2 %125 = OpVectorShuffle %124 %124 0 1 
                                       f32_2 %126 = OpFAdd %123 %125 
                                       f32_4 %127 = OpLoad %9 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 2 3 
                                                      OpStore %9 %128 
                                       f32_4 %131 = OpLoad %9 
                                       f32_2 %132 = OpVectorShuffle %131 %131 1 1 
                              Uniform f32_4* %134 = OpAccessChain %22 %133 %25 
                                       f32_4 %135 = OpLoad %134 
                                       f32_2 %136 = OpVectorShuffle %135 %135 0 1 
                                       f32_2 %137 = OpFMul %132 %136 
                                                      OpStore %130 %137 
                              Uniform f32_4* %138 = OpAccessChain %22 %133 %24 
                                       f32_4 %139 = OpLoad %138 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_4 %141 = OpLoad %9 
                                       f32_2 %142 = OpVectorShuffle %141 %141 0 0 
                                       f32_2 %143 = OpFMul %140 %142 
                                       f32_2 %144 = OpLoad %130 
                                       f32_2 %145 = OpFAdd %143 %144 
                                       f32_4 %146 = OpLoad %9 
                                       f32_4 %147 = OpVectorShuffle %146 %145 4 5 2 3 
                                                      OpStore %9 %147 
                                       f32_4 %150 = OpLoad %9 
                                       f32_2 %151 = OpVectorShuffle %150 %150 0 1 
                              Uniform f32_4* %152 = OpAccessChain %22 %133 %46 
                                       f32_4 %153 = OpLoad %152 
                                       f32_2 %154 = OpVectorShuffle %153 %153 0 1 
                                       f32_2 %155 = OpFAdd %151 %154 
                                                      OpStore vs_TEXCOORD1 %155 
                                       f32_2 %159 = OpLoad %158 
                              Uniform f32_4* %160 = OpAccessChain %22 %46 
                                       f32_4 %161 = OpLoad %160 
                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                       f32_2 %163 = OpFMul %159 %162 
                              Uniform f32_4* %164 = OpAccessChain %22 %46 
                                       f32_4 %165 = OpLoad %164 
                                       f32_2 %166 = OpVectorShuffle %165 %165 2 3 
                                       f32_2 %167 = OpFAdd %163 %166 
                                                      OpStore vs_TEXCOORD0 %167 
                                       f32_4 %169 = OpLoad %11 
                                                      OpStore vs_TEXCOORD2 %169 
                                 Output f32* %171 = OpAccessChain %74 %24 %70 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpFNegate %172 
                                 Output f32* %174 = OpAccessChain %74 %24 %70 
                                                      OpStore %174 %173 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 612
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %37 %504 %516 %561 %584 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpMemberDecorate %16 0 Offset 16 
                                                      OpMemberDecorate %16 1 Offset 16 
                                                      OpMemberDecorate %16 2 Offset 16 
                                                      OpMemberDecorate %16 3 Offset 16 
                                                      OpMemberDecorate %16 4 Offset 16 
                                                      OpDecorate %16 Block 
                                                      OpDecorate %18 DescriptorSet 18 
                                                      OpDecorate %18 Binding 18 
                                                      OpDecorate vs_TEXCOORD2 Location 37 
                                                      OpDecorate %495 RelaxedPrecision 
                                                      OpDecorate %495 DescriptorSet 495 
                                                      OpDecorate %495 Binding 495 
                                                      OpDecorate %496 RelaxedPrecision 
                                                      OpDecorate %499 RelaxedPrecision 
                                                      OpDecorate %499 DescriptorSet 499 
                                                      OpDecorate %499 Binding 499 
                                                      OpDecorate %500 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 504 
                                                      OpDecorate %510 RelaxedPrecision 
                                                      OpDecorate %511 RelaxedPrecision 
                                                      OpDecorate %511 DescriptorSet 511 
                                                      OpDecorate %511 Binding 511 
                                                      OpDecorate %512 RelaxedPrecision 
                                                      OpDecorate %513 RelaxedPrecision 
                                                      OpDecorate %513 DescriptorSet 513 
                                                      OpDecorate %513 Binding 513 
                                                      OpDecorate %514 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 516 
                                                      OpDecorate %519 RelaxedPrecision 
                                                      OpDecorate %520 RelaxedPrecision 
                                                      OpDecorate %521 RelaxedPrecision 
                                                      OpDecorate %523 RelaxedPrecision 
                                                      OpDecorate %524 RelaxedPrecision 
                                                      OpDecorate %525 RelaxedPrecision 
                                                      OpDecorate %526 RelaxedPrecision 
                                                      OpDecorate %527 RelaxedPrecision 
                                                      OpDecorate %530 RelaxedPrecision 
                                                      OpDecorate %531 RelaxedPrecision 
                                                      OpDecorate %532 RelaxedPrecision 
                                                      OpDecorate %533 RelaxedPrecision 
                                                      OpDecorate %536 RelaxedPrecision 
                                                      OpDecorate %539 RelaxedPrecision 
                                                      OpDecorate %540 RelaxedPrecision 
                                                      OpDecorate %541 RelaxedPrecision 
                                                      OpDecorate %555 RelaxedPrecision 
                                                      OpDecorate %556 RelaxedPrecision 
                                                      OpDecorate %558 RelaxedPrecision 
                                                      OpDecorate %560 RelaxedPrecision 
                                                      OpDecorate %561 RelaxedPrecision 
                                                      OpDecorate %561 Location 561 
                                                      OpDecorate %563 RelaxedPrecision 
                                                      OpDecorate %564 RelaxedPrecision 
                                                      OpDecorate %567 RelaxedPrecision 
                                                      OpDecorate %584 RelaxedPrecision 
                                                      OpDecorate %584 Location 584 
                                                      OpDecorate %589 RelaxedPrecision 
                                                      OpDecorate %590 RelaxedPrecision 
                                                      OpDecorate %591 RelaxedPrecision 
                                                      OpDecorate %592 RelaxedPrecision 
                                                      OpDecorate %595 RelaxedPrecision 
                                                      OpDecorate %607 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 1 
                                              %11 = OpTypeInt 32 0 
                                          u32 %12 = OpConstant 4 
                                              %13 = OpTypeArray %6 %12 
                                              %14 = OpTypeArray %6 %12 
                                              %15 = OpTypeArray %6 %12 
                                              %16 = OpTypeStruct %10 %10 %13 %14 %15 
                                              %17 = OpTypePointer Uniform %16 
Uniform struct {i32; i32; f32[4]; f32[4]; f32[4];}* %18 = OpVariable Uniform 
                                          i32 %19 = OpConstant 3 
                                          i32 %20 = OpConstant 0 
                                              %21 = OpTypePointer Uniform %6 
                                          u32 %24 = OpConstant 0 
                                              %25 = OpTypePointer Private %6 
                                              %27 = OpTypeVector %6 2 
                                              %28 = OpTypePointer Private %27 
                               Private f32_2* %29 = OpVariable Private 
                                          i32 %30 = OpConstant 2 
                                 Private f32* %34 = OpVariable Private 
                                              %35 = OpTypeVector %6 4 
                                              %36 = OpTypePointer Input %35 
                        Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                              %38 = OpTypePointer Input %6 
                                          i32 %41 = OpConstant 4 
                                          f32 %49 = OpConstant 3.674022E-40 
                                              %53 = OpTypeBool 
                                              %54 = OpTypePointer Private %53 
                                Private bool* %55 = OpVariable Private 
                                          f32 %56 = OpConstant 3.674022E-40 
                                 Private f32* %59 = OpVariable Private 
                                 Private f32* %65 = OpVariable Private 
                                          u32 %66 = OpConstant 1 
                                          i32 %69 = OpConstant 1 
                                Private bool* %80 = OpVariable Private 
                                              %83 = OpTypeVector %10 2 
                                              %84 = OpTypePointer Private %83 
                               Private i32_2* %85 = OpVariable Private 
                                        i32_2 %87 = OpConstantComposite %20 %69 
                                        i32_2 %88 = OpConstantComposite %19 %30 
                                              %89 = OpTypeVector %53 2 
                                              %92 = OpTypePointer Private %10 
                                 Private i32* %93 = OpVariable Private 
                                              %95 = OpTypePointer Function %10 
                                             %119 = OpTypePointer Private %35 
                              Private f32_4* %120 = OpVariable Private 
                                             %122 = OpTypePointer Function %27 
                              Private f32_2* %133 = OpVariable Private 
                              Private f32_2* %137 = OpVariable Private 
                              Private f32_3* %187 = OpVariable Private 
                                         u32 %200 = OpConstant 2 
                                             %232 = OpTypePointer Private %89 
                             Private bool_2* %233 = OpVariable Private 
                                       f32_4 %234 = OpConstantComposite %56 %56 %56 %56 
                                             %237 = OpTypeVector %53 4 
                              Private f32_3* %246 = OpVariable Private 
                                         f32 %251 = OpConstant 3.674022E-40 
                             Private bool_2* %280 = OpVariable Private 
                               Private bool* %285 = OpVariable Private 
                                             %292 = OpTypePointer Function %6 
                                             %329 = OpTypeVector %53 3 
                                             %330 = OpTypePointer Private %329 
                             Private bool_3* %331 = OpVariable Private 
                                             %347 = OpTypePointer Function %53 
                                             %493 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %494 = OpTypePointer UniformConstant %493 
        UniformConstant read_only Texture2D* %495 = OpVariable UniformConstant 
                                             %497 = OpTypeSampler 
                                             %498 = OpTypePointer UniformConstant %497 
                    UniformConstant sampler* %499 = OpVariable UniformConstant 
                                             %501 = OpTypeSampledImage %493 
                                             %503 = OpTypePointer Input %27 
                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                         u32 %507 = OpConstant 3 
                              Private f32_4* %510 = OpVariable Private 
        UniformConstant read_only Texture2D* %511 = OpVariable UniformConstant 
                    UniformConstant sampler* %513 = OpVariable UniformConstant 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                              Private f32_3* %519 = OpVariable Private 
                                       f32_3 %522 = OpConstantComposite %56 %56 %56 
                              Private f32_3* %524 = OpVariable Private 
                                         f32 %528 = OpConstant 3.674022E-40 
                                       f32_3 %529 = OpConstantComposite %528 %528 %528 
                                         f32 %534 = OpConstant 3.674022E-40 
                                       f32_3 %535 = OpConstantComposite %534 %534 %534 
                                         f32 %537 = OpConstant 3.674022E-40 
                                       f32_3 %538 = OpConstantComposite %537 %537 %537 
                                             %544 = OpTypePointer Uniform %10 
                                             %548 = OpTypePointer Function %7 
                                Private f32* %558 = OpVariable Private 
                                Input f32_4* %561 = OpVariable Input 
                                             %583 = OpTypePointer Output %35 
                               Output f32_4* %584 = OpVariable Output 
                                             %587 = OpTypePointer Output %6 
                                         i32 %599 = OpConstant 5 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function i32* %96 = OpVariable Function 
                             Function f32_2* %123 = OpVariable Function 
                             Function f32_2* %163 = OpVariable Function 
                               Function f32* %293 = OpVariable Function 
                               Function f32* %302 = OpVariable Function 
                               Function f32* %319 = OpVariable Function 
                              Function bool* %348 = OpVariable Function 
                              Function bool* %359 = OpVariable Function 
                               Function f32* %375 = OpVariable Function 
                               Function f32* %479 = OpVariable Function 
                             Function f32_3* %549 = OpVariable Function 
                             Function f32_3* %602 = OpVariable Function 
                                 Uniform f32* %22 = OpAccessChain %18 %19 %20 
                                          f32 %23 = OpLoad %22 
                                 Private f32* %26 = OpAccessChain %9 %24 
                                                      OpStore %26 %23 
                                 Uniform f32* %31 = OpAccessChain %18 %19 %30 
                                          f32 %32 = OpLoad %31 
                                 Private f32* %33 = OpAccessChain %29 %24 
                                                      OpStore %33 %32 
                                   Input f32* %39 = OpAccessChain vs_TEXCOORD2 %24 
                                          f32 %40 = OpLoad %39 
                                 Uniform f32* %42 = OpAccessChain %18 %41 %20 
                                          f32 %43 = OpLoad %42 
                                          f32 %44 = OpFNegate %43 
                                          f32 %45 = OpFAdd %40 %44 
                                                      OpStore %34 %45 
                                 Uniform f32* %46 = OpAccessChain %18 %41 %30 
                                          f32 %47 = OpLoad %46 
                                          f32 %48 = OpFNegate %47 
                                          f32 %50 = OpFMul %48 %49 
                                          f32 %51 = OpLoad %34 
                                          f32 %52 = OpFAdd %50 %51 
                                                      OpStore %34 %52 
                                          f32 %57 = OpLoad %34 
                                         bool %58 = OpFOrdGreaterThanEqual %56 %57 
                                                      OpStore %55 %58 
                                 Uniform f32* %60 = OpAccessChain %18 %41 %20 
                                          f32 %61 = OpLoad %60 
                                 Uniform f32* %62 = OpAccessChain %18 %41 %30 
                                          f32 %63 = OpLoad %62 
                                          f32 %64 = OpFAdd %61 %63 
                                                      OpStore %59 %64 
                                   Input f32* %67 = OpAccessChain vs_TEXCOORD2 %66 
                                          f32 %68 = OpLoad %67 
                                 Uniform f32* %70 = OpAccessChain %18 %41 %69 
                                          f32 %71 = OpLoad %70 
                                          f32 %72 = OpFNegate %71 
                                          f32 %73 = OpFAdd %68 %72 
                                                      OpStore %65 %73 
                                 Uniform f32* %74 = OpAccessChain %18 %41 %19 
                                          f32 %75 = OpLoad %74 
                                          f32 %76 = OpFNegate %75 
                                          f32 %77 = OpFMul %76 %49 
                                          f32 %78 = OpLoad %65 
                                          f32 %79 = OpFAdd %77 %78 
                                                      OpStore %65 %79 
                                          f32 %81 = OpLoad %65 
                                         bool %82 = OpFOrdGreaterThanEqual %56 %81 
                                                      OpStore %80 %82 
                                         bool %86 = OpLoad %80 
                                       bool_2 %90 = OpCompositeConstruct %86 %86 
                                        i32_2 %91 = OpSelect %90 %87 %88 
                                                      OpStore %85 %91 
                                         bool %94 = OpLoad %55 
                                                      OpSelectionMerge %98 None 
                                                      OpBranchConditional %94 %97 %101 
                                              %97 = OpLabel 
                                 Private i32* %99 = OpAccessChain %85 %24 
                                         i32 %100 = OpLoad %99 
                                                      OpStore %96 %100 
                                                      OpBranch %98 
                                             %101 = OpLabel 
                                Private i32* %102 = OpAccessChain %85 %66 
                                         i32 %103 = OpLoad %102 
                                                      OpStore %96 %103 
                                                      OpBranch %98 
                                              %98 = OpLabel 
                                         i32 %104 = OpLoad %96 
                                                      OpStore %93 %104 
                                         f32 %105 = OpLoad %59 
                                         i32 %106 = OpLoad %93 
                                Uniform f32* %107 = OpAccessChain %18 %30 %106 
                                         f32 %108 = OpLoad %107 
                                         f32 %109 = OpFNegate %108 
                                         f32 %110 = OpFAdd %105 %109 
                                Private f32* %111 = OpAccessChain %29 %66 
                                                      OpStore %111 %110 
                                Uniform f32* %112 = OpAccessChain %18 %41 %20 
                                         f32 %113 = OpLoad %112 
                                         i32 %114 = OpLoad %93 
                                Uniform f32* %115 = OpAccessChain %18 %30 %114 
                                         f32 %116 = OpLoad %115 
                                         f32 %117 = OpFAdd %113 %116 
                                Private f32* %118 = OpAccessChain %9 %66 
                                                      OpStore %118 %117 
                                        bool %121 = OpLoad %55 
                                                      OpSelectionMerge %125 None 
                                                      OpBranchConditional %121 %124 %128 
                                             %124 = OpLabel 
                                       f32_3 %126 = OpLoad %9 
                                       f32_2 %127 = OpVectorShuffle %126 %126 0 1 
                                                      OpStore %123 %127 
                                                      OpBranch %125 
                                             %128 = OpLabel 
                                       f32_2 %129 = OpLoad %29 
                                                      OpStore %123 %129 
                                                      OpBranch %125 
                                             %125 = OpLabel 
                                       f32_2 %130 = OpLoad %123 
                                       f32_4 %131 = OpLoad %120 
                                       f32_4 %132 = OpVectorShuffle %131 %130 4 5 2 3 
                                                      OpStore %120 %132 
                                Uniform f32* %134 = OpAccessChain %18 %19 %69 
                                         f32 %135 = OpLoad %134 
                                Private f32* %136 = OpAccessChain %133 %24 
                                                      OpStore %136 %135 
                                Uniform f32* %138 = OpAccessChain %18 %19 %19 
                                         f32 %139 = OpLoad %138 
                                Private f32* %140 = OpAccessChain %137 %24 
                                                      OpStore %140 %139 
                                Uniform f32* %141 = OpAccessChain %18 %41 %69 
                                         f32 %142 = OpLoad %141 
                                Uniform f32* %143 = OpAccessChain %18 %41 %19 
                                         f32 %144 = OpLoad %143 
                                         f32 %145 = OpFAdd %142 %144 
                                Private f32* %146 = OpAccessChain %9 %24 
                                                      OpStore %146 %145 
                                Private f32* %147 = OpAccessChain %9 %24 
                                         f32 %148 = OpLoad %147 
                                         i32 %149 = OpLoad %93 
                                Uniform f32* %150 = OpAccessChain %18 %30 %149 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFNegate %151 
                                         f32 %153 = OpFAdd %148 %152 
                                Private f32* %154 = OpAccessChain %137 %66 
                                                      OpStore %154 %153 
                                Uniform f32* %155 = OpAccessChain %18 %41 %69 
                                         f32 %156 = OpLoad %155 
                                         i32 %157 = OpLoad %93 
                                Uniform f32* %158 = OpAccessChain %18 %30 %157 
                                         f32 %159 = OpLoad %158 
                                         f32 %160 = OpFAdd %156 %159 
                                Private f32* %161 = OpAccessChain %133 %66 
                                                      OpStore %161 %160 
                                        bool %162 = OpLoad %80 
                                                      OpSelectionMerge %165 None 
                                                      OpBranchConditional %162 %164 %167 
                                             %164 = OpLabel 
                                       f32_2 %166 = OpLoad %133 
                                                      OpStore %163 %166 
                                                      OpBranch %165 
                                             %167 = OpLabel 
                                       f32_2 %168 = OpLoad %137 
                                                      OpStore %163 %168 
                                                      OpBranch %165 
                                             %165 = OpLabel 
                                       f32_2 %169 = OpLoad %163 
                                       f32_4 %170 = OpLoad %120 
                                       f32_4 %171 = OpVectorShuffle %170 %169 0 1 4 5 
                                                      OpStore %120 %171 
                                       f32_4 %172 = OpLoad %120 
                                       f32_2 %173 = OpVectorShuffle %172 %172 0 2 
                                       f32_2 %174 = OpFNegate %173 
                                         i32 %175 = OpLoad %93 
                                Uniform f32* %176 = OpAccessChain %18 %30 %175 
                                         f32 %177 = OpLoad %176 
                                       f32_2 %178 = OpCompositeConstruct %177 %177 
                                       f32_2 %179 = OpFAdd %174 %178 
                                       f32_3 %180 = OpLoad %9 
                                       f32_3 %181 = OpVectorShuffle %180 %179 3 4 2 
                                                      OpStore %9 %181 
                                Private f32* %182 = OpAccessChain %9 %24 
                                         f32 %183 = OpLoad %182 
                                Private f32* %184 = OpAccessChain %9 %66 
                                         f32 %185 = OpLoad %184 
                                         f32 %186 = OpFDiv %183 %185 
                                                      OpStore %59 %186 
                                       f32_4 %188 = OpLoad %120 
                                       f32_2 %189 = OpVectorShuffle %188 %188 1 3 
                                       f32_2 %190 = OpFNegate %189 
                                       f32_4 %191 = OpLoad vs_TEXCOORD2 
                                       f32_2 %192 = OpVectorShuffle %191 %191 0 1 
                                       f32_2 %193 = OpFAdd %190 %192 
                                       f32_3 %194 = OpLoad %187 
                                       f32_3 %195 = OpVectorShuffle %194 %193 3 4 2 
                                                      OpStore %187 %195 
                                         f32 %196 = OpLoad %59 
                                Private f32* %197 = OpAccessChain %187 %66 
                                         f32 %198 = OpLoad %197 
                                         f32 %199 = OpFMul %196 %198 
                                Private f32* %201 = OpAccessChain %187 %200 
                                                      OpStore %201 %199 
                                       f32_3 %202 = OpLoad %187 
                                       f32_2 %203 = OpVectorShuffle %202 %202 0 2 
                                       f32_3 %204 = OpLoad %187 
                                       f32_2 %205 = OpVectorShuffle %204 %204 0 2 
                                         f32 %206 = OpDot %203 %205 
                                                      OpStore %59 %206 
                                       f32_3 %207 = OpLoad %187 
                                       f32_2 %208 = OpVectorShuffle %207 %207 0 1 
                                       f32_3 %209 = OpLoad %187 
                                       f32_2 %210 = OpVectorShuffle %209 %209 0 1 
                                         f32 %211 = OpDot %208 %210 
                                Private f32* %212 = OpAccessChain %29 %24 
                                                      OpStore %212 %211 
                                Private f32* %213 = OpAccessChain %29 %24 
                                         f32 %214 = OpLoad %213 
                                         f32 %215 = OpExtInst %1 31 %214 
                                Private f32* %216 = OpAccessChain %29 %24 
                                                      OpStore %216 %215 
                                Private f32* %217 = OpAccessChain %29 %24 
                                         f32 %218 = OpLoad %217 
                                         i32 %219 = OpLoad %93 
                                Uniform f32* %220 = OpAccessChain %18 %30 %219 
                                         f32 %221 = OpLoad %220 
                                         f32 %222 = OpFNegate %221 
                                         f32 %223 = OpFAdd %218 %222 
                                Private f32* %224 = OpAccessChain %29 %24 
                                                      OpStore %224 %223 
                                         f32 %225 = OpLoad %59 
                                         f32 %226 = OpExtInst %1 31 %225 
                                                      OpStore %59 %226 
                                Private f32* %227 = OpAccessChain %9 %24 
                                         f32 %228 = OpLoad %227 
                                         f32 %229 = OpFNegate %228 
                                         f32 %230 = OpLoad %59 
                                         f32 %231 = OpFAdd %229 %230 
                                                      OpStore %59 %231 
                                       f32_3 %235 = OpLoad %9 
                                       f32_4 %236 = OpVectorShuffle %235 %235 0 1 0 0 
                                      bool_4 %238 = OpFOrdLessThan %234 %236 
                                      bool_2 %239 = OpVectorShuffle %238 %238 0 1 
                                                      OpStore %233 %239 
                               Private bool* %240 = OpAccessChain %233 %66 
                                        bool %241 = OpLoad %240 
                               Private bool* %242 = OpAccessChain %233 %24 
                                        bool %243 = OpLoad %242 
                                        bool %244 = OpLogicalAnd %241 %243 
                               Private bool* %245 = OpAccessChain %233 %24 
                                                      OpStore %245 %244 
                                  Input f32* %247 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %248 = OpLoad %247 
                                         f32 %249 = OpDPdx %248 
                                Private f32* %250 = OpAccessChain %246 %24 
                                                      OpStore %250 %249 
                                Private f32* %252 = OpAccessChain %246 %24 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpExtInst %1 4 %253 
                                         f32 %255 = OpFDiv %251 %254 
                                Private f32* %256 = OpAccessChain %246 %24 
                                                      OpStore %256 %255 
                                         f32 %257 = OpLoad %59 
                                Private f32* %258 = OpAccessChain %246 %24 
                                         f32 %259 = OpLoad %258 
                                         f32 %260 = OpFMul %257 %259 
                                         f32 %261 = OpFAdd %260 %49 
                                                      OpStore %59 %261 
                                         f32 %262 = OpLoad %59 
                                         f32 %263 = OpExtInst %1 43 %262 %56 %251 
                                                      OpStore %59 %263 
                                Private f32* %264 = OpAccessChain %29 %24 
                                         f32 %265 = OpLoad %264 
                                Private f32* %266 = OpAccessChain %246 %24 
                                         f32 %267 = OpLoad %266 
                                         f32 %268 = OpFMul %265 %267 
                                         f32 %269 = OpFAdd %268 %49 
                                Private f32* %270 = OpAccessChain %246 %24 
                                                      OpStore %270 %269 
                                Private f32* %271 = OpAccessChain %246 %24 
                                         f32 %272 = OpLoad %271 
                                         f32 %273 = OpExtInst %1 43 %272 %56 %251 
                                Private f32* %274 = OpAccessChain %246 %24 
                                                      OpStore %274 %273 
                               Private bool* %275 = OpAccessChain %233 %24 
                                        bool %276 = OpLoad %275 
                                         f32 %277 = OpLoad %59 
                                         f32 %278 = OpSelect %276 %277 %251 
                                Private f32* %279 = OpAccessChain %9 %24 
                                                      OpStore %279 %278 
                                       f32_4 %281 = OpLoad %120 
                                       f32_4 %282 = OpVectorShuffle %281 %281 0 2 0 0 
                                      bool_4 %283 = OpFOrdLessThan %234 %282 
                                      bool_2 %284 = OpVectorShuffle %283 %283 0 1 
                                                      OpStore %280 %284 
                               Private bool* %286 = OpAccessChain %280 %66 
                                        bool %287 = OpLoad %286 
                               Private bool* %288 = OpAccessChain %280 %24 
                                        bool %289 = OpLoad %288 
                                        bool %290 = OpLogicalOr %287 %289 
                                                      OpStore %285 %290 
                                        bool %291 = OpLoad %285 
                                                      OpSelectionMerge %295 None 
                                                      OpBranchConditional %291 %294 %298 
                                             %294 = OpLabel 
                                Private f32* %296 = OpAccessChain %9 %24 
                                         f32 %297 = OpLoad %296 
                                                      OpStore %293 %297 
                                                      OpBranch %295 
                                             %298 = OpLabel 
                                                      OpStore %293 %56 
                                                      OpBranch %295 
                                             %295 = OpLabel 
                                         f32 %299 = OpLoad %293 
                                Private f32* %300 = OpAccessChain %9 %24 
                                                      OpStore %300 %299 
                                        bool %301 = OpLoad %285 
                                                      OpSelectionMerge %304 None 
                                                      OpBranchConditional %301 %303 %307 
                                             %303 = OpLabel 
                                Private f32* %305 = OpAccessChain %246 %24 
                                         f32 %306 = OpLoad %305 
                                                      OpStore %302 %306 
                                                      OpBranch %304 
                                             %307 = OpLabel 
                                                      OpStore %302 %56 
                                                      OpBranch %304 
                                             %304 = OpLabel 
                                         f32 %308 = OpLoad %302 
                                Private f32* %309 = OpAccessChain %246 %24 
                                                      OpStore %309 %308 
                                Private f32* %310 = OpAccessChain %246 %24 
                                         f32 %311 = OpLoad %310 
                                        bool %312 = OpFOrdEqual %311 %56 
                                                      OpStore %285 %312 
                                Private f32* %313 = OpAccessChain %246 %24 
                                         f32 %314 = OpLoad %313 
                                         f32 %315 = OpFNegate %314 
                                         f32 %316 = OpFAdd %315 %251 
                                Private f32* %317 = OpAccessChain %246 %24 
                                                      OpStore %317 %316 
                                        bool %318 = OpLoad %285 
                                                      OpSelectionMerge %321 None 
                                                      OpBranchConditional %318 %320 %324 
                                             %320 = OpLabel 
                                Private f32* %322 = OpAccessChain %9 %24 
                                         f32 %323 = OpLoad %322 
                                                      OpStore %319 %323 
                                                      OpBranch %321 
                                             %324 = OpLabel 
                                Private f32* %325 = OpAccessChain %246 %24 
                                         f32 %326 = OpLoad %325 
                                                      OpStore %319 %326 
                                                      OpBranch %321 
                                             %321 = OpLabel 
                                         f32 %327 = OpLoad %319 
                                Private f32* %328 = OpAccessChain %9 %24 
                                                      OpStore %328 %327 
                                       f32_4 %332 = OpLoad %120 
                                       f32_4 %333 = OpVectorShuffle %332 %332 1 1 3 3 
                                       f32_4 %334 = OpLoad vs_TEXCOORD2 
                                       f32_4 %335 = OpVectorShuffle %334 %334 0 0 1 1 
                                      bool_4 %336 = OpFOrdGreaterThanEqual %333 %335 
                                      bool_2 %337 = OpVectorShuffle %336 %336 0 2 
                                      bool_3 %338 = OpLoad %331 
                                      bool_3 %339 = OpVectorShuffle %338 %337 3 1 4 
                                                      OpStore %331 %339 
                                       f32_4 %340 = OpLoad vs_TEXCOORD2 
                                       f32_4 %341 = OpVectorShuffle %340 %340 0 1 0 0 
                                       f32_4 %342 = OpLoad %120 
                                       f32_4 %343 = OpVectorShuffle %342 %342 1 3 1 1 
                                      bool_4 %344 = OpFOrdGreaterThanEqual %341 %343 
                                      bool_2 %345 = OpVectorShuffle %344 %344 0 1 
                                                      OpStore %280 %345 
                                        bool %346 = OpLoad %55 
                                                      OpSelectionMerge %350 None 
                                                      OpBranchConditional %346 %349 %353 
                                             %349 = OpLabel 
                               Private bool* %351 = OpAccessChain %331 %24 
                                        bool %352 = OpLoad %351 
                                                      OpStore %348 %352 
                                                      OpBranch %350 
                                             %353 = OpLabel 
                               Private bool* %354 = OpAccessChain %280 %24 
                                        bool %355 = OpLoad %354 
                                                      OpStore %348 %355 
                                                      OpBranch %350 
                                             %350 = OpLabel 
                                        bool %356 = OpLoad %348 
                               Private bool* %357 = OpAccessChain %331 %24 
                                                      OpStore %357 %356 
                                        bool %358 = OpLoad %80 
                                                      OpSelectionMerge %361 None 
                                                      OpBranchConditional %358 %360 %364 
                                             %360 = OpLabel 
                               Private bool* %362 = OpAccessChain %331 %200 
                                        bool %363 = OpLoad %362 
                                                      OpStore %359 %363 
                                                      OpBranch %361 
                                             %364 = OpLabel 
                               Private bool* %365 = OpAccessChain %280 %66 
                                        bool %366 = OpLoad %365 
                                                      OpStore %359 %366 
                                                      OpBranch %361 
                                             %361 = OpLabel 
                                        bool %367 = OpLoad %359 
                                                      OpStore %55 %367 
                                        bool %368 = OpLoad %55 
                               Private bool* %369 = OpAccessChain %331 %24 
                                        bool %370 = OpLoad %369 
                                        bool %371 = OpLogicalAnd %368 %370 
                               Private bool* %372 = OpAccessChain %331 %24 
                                                      OpStore %372 %371 
                               Private bool* %373 = OpAccessChain %331 %24 
                                        bool %374 = OpLoad %373 
                                                      OpSelectionMerge %377 None 
                                                      OpBranchConditional %374 %376 %380 
                                             %376 = OpLabel 
                                Private f32* %378 = OpAccessChain %9 %24 
                                         f32 %379 = OpLoad %378 
                                                      OpStore %375 %379 
                                                      OpBranch %377 
                                             %380 = OpLabel 
                                                      OpStore %375 %251 
                                                      OpBranch %377 
                                             %377 = OpLabel 
                                         f32 %381 = OpLoad %375 
                                Private f32* %382 = OpAccessChain %9 %24 
                                                      OpStore %382 %381 
                                Uniform f32* %383 = OpAccessChain %18 %19 %20 
                                         f32 %384 = OpLoad %383 
                                Uniform f32* %385 = OpAccessChain %18 %19 %30 
                                         f32 %386 = OpLoad %385 
                                         f32 %387 = OpFAdd %384 %386 
                                                      OpStore %34 %387 
                                         f32 %388 = OpLoad %34 
                                         f32 %389 = OpFNegate %388 
                                Uniform f32* %390 = OpAccessChain %18 %41 %30 
                                         f32 %391 = OpLoad %390 
                                         f32 %392 = OpFAdd %389 %391 
                                                      OpStore %34 %392 
                                Uniform f32* %393 = OpAccessChain %18 %19 %20 
                                         f32 %394 = OpLoad %393 
                                Uniform f32* %395 = OpAccessChain %18 %41 %20 
                                         f32 %396 = OpLoad %395 
                                         f32 %397 = OpFAdd %394 %396 
                                                      OpStore %59 %397 
                                         f32 %398 = OpLoad %34 
                                         f32 %399 = OpLoad %59 
                                         f32 %400 = OpFAdd %398 %399 
                                                      OpStore %34 %400 
                                  Input f32* %401 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %402 = OpLoad %401 
                                         f32 %403 = OpLoad %59 
                                        bool %404 = OpFOrdGreaterThanEqual %402 %403 
                                                      OpStore %285 %404 
                                         f32 %405 = OpLoad %34 
                                  Input f32* %406 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %407 = OpLoad %406 
                                        bool %408 = OpFOrdGreaterThanEqual %405 %407 
                                                      OpStore %55 %408 
                                        bool %409 = OpLoad %55 
                                        bool %410 = OpLoad %285 
                                        bool %411 = OpLogicalAnd %409 %410 
                                                      OpStore %55 %411 
                                Uniform f32* %412 = OpAccessChain %18 %19 %69 
                                         f32 %413 = OpLoad %412 
                                Uniform f32* %414 = OpAccessChain %18 %41 %69 
                                         f32 %415 = OpLoad %414 
                                         f32 %416 = OpFAdd %413 %415 
                                                      OpStore %59 %416 
                                  Input f32* %417 = OpAccessChain vs_TEXCOORD2 %66 
                                         f32 %418 = OpLoad %417 
                                         f32 %419 = OpLoad %59 
                                        bool %420 = OpFOrdGreaterThanEqual %418 %419 
                               Private bool* %421 = OpAccessChain %280 %24 
                                                      OpStore %421 %420 
                                        bool %422 = OpLoad %55 
                               Private bool* %423 = OpAccessChain %280 %24 
                                        bool %424 = OpLoad %423 
                                        bool %425 = OpLogicalAnd %422 %424 
                                                      OpStore %55 %425 
                                Uniform f32* %426 = OpAccessChain %18 %19 %69 
                                         f32 %427 = OpLoad %426 
                                Uniform f32* %428 = OpAccessChain %18 %19 %19 
                                         f32 %429 = OpLoad %428 
                                         f32 %430 = OpFAdd %427 %429 
                                Private f32* %431 = OpAccessChain %29 %24 
                                                      OpStore %431 %430 
                                Private f32* %432 = OpAccessChain %29 %24 
                                         f32 %433 = OpLoad %432 
                                         f32 %434 = OpFNegate %433 
                                Uniform f32* %435 = OpAccessChain %18 %41 %19 
                                         f32 %436 = OpLoad %435 
                                         f32 %437 = OpFAdd %434 %436 
                                Private f32* %438 = OpAccessChain %29 %24 
                                                      OpStore %438 %437 
                                         f32 %439 = OpLoad %59 
                                Private f32* %440 = OpAccessChain %29 %24 
                                         f32 %441 = OpLoad %440 
                                         f32 %442 = OpFAdd %439 %441 
                                                      OpStore %59 %442 
                                         f32 %443 = OpLoad %59 
                                  Input f32* %444 = OpAccessChain vs_TEXCOORD2 %66 
                                         f32 %445 = OpLoad %444 
                                        bool %446 = OpFOrdGreaterThanEqual %443 %445 
                                                      OpStore %285 %446 
                                        bool %447 = OpLoad %285 
                                        bool %448 = OpLoad %55 
                                        bool %449 = OpLogicalAnd %447 %448 
                                                      OpStore %55 %449 
                                        bool %450 = OpLoad %55 
                                         f32 %451 = OpSelect %450 %56 %251 
                                                      OpStore %34 %451 
                               Private bool* %452 = OpAccessChain %331 %24 
                                        bool %453 = OpLoad %452 
                                         f32 %454 = OpLoad %34 
                                         f32 %455 = OpSelect %453 %251 %454 
                                Private f32* %456 = OpAccessChain %246 %24 
                                                      OpStore %456 %455 
                                Uniform f32* %457 = OpAccessChain %18 %19 %20 
                                         f32 %458 = OpLoad %457 
                                        bool %459 = OpFOrdLessThan %56 %458 
                                                      OpStore %55 %459 
                                Uniform f32* %460 = OpAccessChain %18 %19 %69 
                                         f32 %461 = OpLoad %460 
                                        bool %462 = OpFOrdLessThan %56 %461 
                                                      OpStore %285 %462 
                                        bool %463 = OpLoad %285 
                                        bool %464 = OpLoad %55 
                                        bool %465 = OpLogicalOr %463 %464 
                                                      OpStore %55 %465 
                                Uniform f32* %466 = OpAccessChain %18 %19 %30 
                                         f32 %467 = OpLoad %466 
                                        bool %468 = OpFOrdLessThan %56 %467 
                                                      OpStore %285 %468 
                                        bool %469 = OpLoad %285 
                                        bool %470 = OpLoad %55 
                                        bool %471 = OpLogicalOr %469 %470 
                                                      OpStore %55 %471 
                                Uniform f32* %472 = OpAccessChain %18 %19 %19 
                                         f32 %473 = OpLoad %472 
                                        bool %474 = OpFOrdLessThan %56 %473 
                                                      OpStore %285 %474 
                                        bool %475 = OpLoad %285 
                                        bool %476 = OpLoad %55 
                                        bool %477 = OpLogicalOr %475 %476 
                                                      OpStore %55 %477 
                                        bool %478 = OpLoad %55 
                                                      OpSelectionMerge %481 None 
                                                      OpBranchConditional %478 %480 %484 
                                             %480 = OpLabel 
                                Private f32* %482 = OpAccessChain %246 %24 
                                         f32 %483 = OpLoad %482 
                                                      OpStore %479 %483 
                                                      OpBranch %481 
                                             %484 = OpLabel 
                                                      OpStore %479 %251 
                                                      OpBranch %481 
                                             %481 = OpLabel 
                                         f32 %485 = OpLoad %479 
                                Private f32* %486 = OpAccessChain %246 %24 
                                                      OpStore %486 %485 
                                Private f32* %487 = OpAccessChain %246 %24 
                                         f32 %488 = OpLoad %487 
                                Private f32* %489 = OpAccessChain %9 %24 
                                         f32 %490 = OpLoad %489 
                                         f32 %491 = OpFMul %488 %490 
                                Private f32* %492 = OpAccessChain %9 %200 
                                                      OpStore %492 %491 
                         read_only Texture2D %496 = OpLoad %495 
                                     sampler %500 = OpLoad %499 
                  read_only Texture2DSampled %502 = OpSampledImage %496 %500 
                                       f32_2 %505 = OpLoad vs_TEXCOORD1 
                                       f32_4 %506 = OpImageSampleImplicitLod %502 %505 
                                         f32 %508 = OpCompositeExtract %506 3 
                                Private f32* %509 = OpAccessChain %246 %200 
                                                      OpStore %509 %508 
                         read_only Texture2D %512 = OpLoad %511 
                                     sampler %514 = OpLoad %513 
                  read_only Texture2DSampled %515 = OpSampledImage %512 %514 
                                       f32_2 %517 = OpLoad vs_TEXCOORD0 
                                       f32_4 %518 = OpImageSampleImplicitLod %515 %517 
                                                      OpStore %510 %518 
                                       f32_4 %520 = OpLoad %510 
                                       f32_3 %521 = OpVectorShuffle %520 %520 0 1 2 
                                       f32_3 %523 = OpExtInst %1 40 %521 %522 
                                                      OpStore %519 %523 
                                       f32_3 %525 = OpLoad %519 
                                       f32_3 %526 = OpExtInst %1 30 %525 
                                                      OpStore %524 %526 
                                       f32_3 %527 = OpLoad %524 
                                       f32_3 %530 = OpFMul %527 %529 
                                                      OpStore %524 %530 
                                       f32_3 %531 = OpLoad %524 
                                       f32_3 %532 = OpExtInst %1 29 %531 
                                                      OpStore %524 %532 
                                       f32_3 %533 = OpLoad %524 
                                       f32_3 %536 = OpFMul %533 %535 
                                       f32_3 %539 = OpFAdd %536 %538 
                                                      OpStore %524 %539 
                                       f32_3 %540 = OpLoad %524 
                                       f32_3 %541 = OpExtInst %1 40 %540 %522 
                                       f32_4 %542 = OpLoad %120 
                                       f32_4 %543 = OpVectorShuffle %542 %541 4 5 6 3 
                                                      OpStore %120 %543 
                                Uniform i32* %545 = OpAccessChain %18 %20 
                                         i32 %546 = OpLoad %545 
                                        bool %547 = OpINotEqual %546 %20 
                                                      OpSelectionMerge %551 None 
                                                      OpBranchConditional %547 %550 %554 
                                             %550 = OpLabel 
                                       f32_4 %552 = OpLoad %120 
                                       f32_3 %553 = OpVectorShuffle %552 %552 0 1 2 
                                                      OpStore %549 %553 
                                                      OpBranch %551 
                                             %554 = OpLabel 
                                       f32_4 %555 = OpLoad %510 
                                       f32_3 %556 = OpVectorShuffle %555 %555 0 1 2 
                                                      OpStore %549 %556 
                                                      OpBranch %551 
                                             %551 = OpLabel 
                                       f32_3 %557 = OpLoad %549 
                                                      OpStore %519 %557 
                                Private f32* %559 = OpAccessChain %510 %507 
                                         f32 %560 = OpLoad %559 
                                  Input f32* %562 = OpAccessChain %561 %507 
                                         f32 %563 = OpLoad %562 
                                         f32 %564 = OpFMul %560 %563 
                                                      OpStore %558 %564 
                                Private f32* %565 = OpAccessChain %9 %24 
                                         f32 %566 = OpLoad %565 
                                         f32 %567 = OpLoad %558 
                                         f32 %568 = OpFMul %566 %567 
                                Private f32* %569 = OpAccessChain %9 %24 
                                                      OpStore %569 %568 
                                       f32_3 %570 = OpLoad %246 
                                       f32_2 %571 = OpVectorShuffle %570 %570 0 2 
                                       f32_3 %572 = OpLoad %9 
                                       f32_2 %573 = OpVectorShuffle %572 %572 0 2 
                                       f32_2 %574 = OpFMul %571 %573 
                                       f32_3 %575 = OpLoad %9 
                                       f32_3 %576 = OpVectorShuffle %575 %574 3 1 4 
                                                      OpStore %9 %576 
                                Private f32* %577 = OpAccessChain %246 %200 
                                         f32 %578 = OpLoad %577 
                                Private f32* %579 = OpAccessChain %9 %24 
                                         f32 %580 = OpLoad %579 
                                         f32 %581 = OpFMul %578 %580 
                                Private f32* %582 = OpAccessChain %9 %24 
                                                      OpStore %582 %581 
                                Private f32* %585 = OpAccessChain %9 %24 
                                         f32 %586 = OpLoad %585 
                                 Output f32* %588 = OpAccessChain %584 %507 
                                                      OpStore %588 %586 
                                       f32_3 %589 = OpLoad %519 
                                       f32_4 %590 = OpLoad %561 
                                       f32_3 %591 = OpVectorShuffle %590 %590 0 1 2 
                                       f32_3 %592 = OpFMul %589 %591 
                                                      OpStore %519 %592 
                                       f32_3 %593 = OpLoad %9 
                                       f32_3 %594 = OpVectorShuffle %593 %593 2 2 2 
                                       f32_3 %595 = OpLoad %519 
                                       f32_3 %596 = OpFMul %594 %595 
                                                      OpStore %9 %596 
                                Uniform i32* %597 = OpAccessChain %18 %69 
                                         i32 %598 = OpLoad %597 
                                        bool %600 = OpINotEqual %598 %599 
                                                      OpStore %285 %600 
                                        bool %601 = OpLoad %285 
                                                      OpSelectionMerge %604 None 
                                                      OpBranchConditional %601 %603 %606 
                                             %603 = OpLabel 
                                       f32_3 %605 = OpLoad %9 
                                                      OpStore %602 %605 
                                                      OpBranch %604 
                                             %606 = OpLabel 
                                       f32_3 %607 = OpLoad %519 
                                                      OpStore %602 %607 
                                                      OpBranch %604 
                                             %604 = OpLabel 
                                       f32_3 %608 = OpLoad %602 
                                       f32_4 %609 = OpLoad %584 
                                       f32_4 %610 = OpVectorShuffle %609 %608 4 5 6 3 
                                                      OpStore %584 %610 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 176
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %74 %84 %85 %149 %156 %158 %168 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpMemberDecorate %72 0 BuiltIn 72 
                                                      OpMemberDecorate %72 1 BuiltIn 72 
                                                      OpMemberDecorate %72 2 BuiltIn 72 
                                                      OpDecorate %72 Block 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 149 
                                                      OpDecorate vs_TEXCOORD0 Location 156 
                                                      OpDecorate %158 Location 158 
                                                      OpDecorate vs_TEXCOORD2 Location 168 
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
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeArray %7 %15 
                                              %20 = OpTypeStruct %16 %17 %18 %7 %19 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4[4];}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 0 
                                          i32 %25 = OpConstant 1 
                                              %26 = OpTypePointer Uniform %7 
                                          i32 %37 = OpConstant 2 
                                          i32 %46 = OpConstant 3 
                               Private f32_4* %50 = OpVariable Private 
                                          u32 %70 = OpConstant 1 
                                              %71 = OpTypeArray %6 %70 
                                              %72 = OpTypeStruct %7 %6 %71 
                                              %73 = OpTypePointer Output %72 
         Output struct {f32_4; f32; f32[1];}* %74 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                Output f32_4* %84 = OpVariable Output 
                                 Input f32_4* %85 = OpVariable Input 
                                              %87 = OpTypeVector %6 2 
                                             %129 = OpTypePointer Private %87 
                              Private f32_2* %130 = OpVariable Private 
                                         i32 %133 = OpConstant 4 
                                             %148 = OpTypePointer Output %87 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %157 = OpTypePointer Input %87 
                                Input f32_2* %158 = OpVariable Input 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                             %170 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %27 = OpAccessChain %22 %24 %25 
                                        f32_4 %28 = OpLoad %27 
                                        f32_4 %29 = OpFMul %13 %28 
                                                      OpStore %9 %29 
                               Uniform f32_4* %30 = OpAccessChain %22 %24 %24 
                                        f32_4 %31 = OpLoad %30 
                                        f32_4 %32 = OpLoad %11 
                                        f32_4 %33 = OpVectorShuffle %32 %32 0 0 0 0 
                                        f32_4 %34 = OpFMul %31 %33 
                                        f32_4 %35 = OpLoad %9 
                                        f32_4 %36 = OpFAdd %34 %35 
                                                      OpStore %9 %36 
                               Uniform f32_4* %38 = OpAccessChain %22 %24 %37 
                                        f32_4 %39 = OpLoad %38 
                                        f32_4 %40 = OpLoad %11 
                                        f32_4 %41 = OpVectorShuffle %40 %40 2 2 2 2 
                                        f32_4 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpFAdd %42 %43 
                                                      OpStore %9 %44 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %22 %24 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %9 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_4 %52 = OpVectorShuffle %51 %51 1 1 1 1 
                               Uniform f32_4* %53 = OpAccessChain %22 %37 %25 
                                        f32_4 %54 = OpLoad %53 
                                        f32_4 %55 = OpFMul %52 %54 
                                                      OpStore %50 %55 
                               Uniform f32_4* %56 = OpAccessChain %22 %37 %24 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                                        f32_4 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %50 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %50 %62 
                               Uniform f32_4* %63 = OpAccessChain %22 %37 %37 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpVectorShuffle %65 %65 2 2 2 2 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %50 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %50 %69 
                               Uniform f32_4* %75 = OpAccessChain %22 %37 %46 
                                        f32_4 %76 = OpLoad %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpVectorShuffle %77 %77 3 3 3 3 
                                        f32_4 %79 = OpFMul %76 %78 
                                        f32_4 %80 = OpLoad %50 
                                        f32_4 %81 = OpFAdd %79 %80 
                                Output f32_4* %83 = OpAccessChain %74 %24 
                                                      OpStore %83 %81 
                                        f32_4 %86 = OpLoad %85 
                                                      OpStore %84 %86 
                                        f32_4 %88 = OpLoad %9 
                                        f32_2 %89 = OpVectorShuffle %88 %88 1 1 
                               Uniform f32_4* %90 = OpAccessChain %22 %25 %25 
                                        f32_4 %91 = OpLoad %90 
                                        f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                        f32_2 %93 = OpFMul %89 %92 
                                        f32_4 %94 = OpLoad %50 
                                        f32_4 %95 = OpVectorShuffle %94 %93 4 5 2 3 
                                                      OpStore %50 %95 
                               Uniform f32_4* %96 = OpAccessChain %22 %25 %24 
                                        f32_4 %97 = OpLoad %96 
                                        f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                                        f32_4 %99 = OpLoad %9 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 0 
                                       f32_2 %101 = OpFMul %98 %100 
                                       f32_4 %102 = OpLoad %50 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFAdd %101 %103 
                                       f32_4 %105 = OpLoad %9 
                                       f32_4 %106 = OpVectorShuffle %105 %104 4 5 2 3 
                                                      OpStore %9 %106 
                              Uniform f32_4* %107 = OpAccessChain %22 %25 %37 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                       f32_4 %110 = OpLoad %9 
                                       f32_2 %111 = OpVectorShuffle %110 %110 2 2 
                                       f32_2 %112 = OpFMul %109 %111 
                                       f32_4 %113 = OpLoad %9 
                                       f32_2 %114 = OpVectorShuffle %113 %113 0 1 
                                       f32_2 %115 = OpFAdd %112 %114 
                                       f32_4 %116 = OpLoad %9 
                                       f32_4 %117 = OpVectorShuffle %116 %115 4 5 2 3 
                                                      OpStore %9 %117 
                              Uniform f32_4* %118 = OpAccessChain %22 %25 %46 
                                       f32_4 %119 = OpLoad %118 
                                       f32_2 %120 = OpVectorShuffle %119 %119 0 1 
                                       f32_4 %121 = OpLoad %9 
                                       f32_2 %122 = OpVectorShuffle %121 %121 3 3 
                                       f32_2 %123 = OpFMul %120 %122 
                                       f32_4 %124 = OpLoad %9 
                                       f32_2 %125 = OpVectorShuffle %124 %124 0 1 
                                       f32_2 %126 = OpFAdd %123 %125 
                                       f32_4 %127 = OpLoad %9 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 2 3 
                                                      OpStore %9 %128 
                                       f32_4 %131 = OpLoad %9 
                                       f32_2 %132 = OpVectorShuffle %131 %131 1 1 
                              Uniform f32_4* %134 = OpAccessChain %22 %133 %25 
                                       f32_4 %135 = OpLoad %134 
                                       f32_2 %136 = OpVectorShuffle %135 %135 0 1 
                                       f32_2 %137 = OpFMul %132 %136 
                                                      OpStore %130 %137 
                              Uniform f32_4* %138 = OpAccessChain %22 %133 %24 
                                       f32_4 %139 = OpLoad %138 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_4 %141 = OpLoad %9 
                                       f32_2 %142 = OpVectorShuffle %141 %141 0 0 
                                       f32_2 %143 = OpFMul %140 %142 
                                       f32_2 %144 = OpLoad %130 
                                       f32_2 %145 = OpFAdd %143 %144 
                                       f32_4 %146 = OpLoad %9 
                                       f32_4 %147 = OpVectorShuffle %146 %145 4 5 2 3 
                                                      OpStore %9 %147 
                                       f32_4 %150 = OpLoad %9 
                                       f32_2 %151 = OpVectorShuffle %150 %150 0 1 
                              Uniform f32_4* %152 = OpAccessChain %22 %133 %46 
                                       f32_4 %153 = OpLoad %152 
                                       f32_2 %154 = OpVectorShuffle %153 %153 0 1 
                                       f32_2 %155 = OpFAdd %151 %154 
                                                      OpStore vs_TEXCOORD1 %155 
                                       f32_2 %159 = OpLoad %158 
                              Uniform f32_4* %160 = OpAccessChain %22 %46 
                                       f32_4 %161 = OpLoad %160 
                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                       f32_2 %163 = OpFMul %159 %162 
                              Uniform f32_4* %164 = OpAccessChain %22 %46 
                                       f32_4 %165 = OpLoad %164 
                                       f32_2 %166 = OpVectorShuffle %165 %165 2 3 
                                       f32_2 %167 = OpFAdd %163 %166 
                                                      OpStore vs_TEXCOORD0 %167 
                                       f32_4 %169 = OpLoad %11 
                                                      OpStore vs_TEXCOORD2 %169 
                                 Output f32* %171 = OpAccessChain %74 %24 %70 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpFNegate %172 
                                 Output f32* %174 = OpAccessChain %74 %24 %70 
                                                      OpStore %174 %173 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 612
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %37 %504 %516 %561 %584 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpMemberDecorate %16 0 Offset 16 
                                                      OpMemberDecorate %16 1 Offset 16 
                                                      OpMemberDecorate %16 2 Offset 16 
                                                      OpMemberDecorate %16 3 Offset 16 
                                                      OpMemberDecorate %16 4 Offset 16 
                                                      OpDecorate %16 Block 
                                                      OpDecorate %18 DescriptorSet 18 
                                                      OpDecorate %18 Binding 18 
                                                      OpDecorate vs_TEXCOORD2 Location 37 
                                                      OpDecorate %495 RelaxedPrecision 
                                                      OpDecorate %495 DescriptorSet 495 
                                                      OpDecorate %495 Binding 495 
                                                      OpDecorate %496 RelaxedPrecision 
                                                      OpDecorate %499 RelaxedPrecision 
                                                      OpDecorate %499 DescriptorSet 499 
                                                      OpDecorate %499 Binding 499 
                                                      OpDecorate %500 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 504 
                                                      OpDecorate %510 RelaxedPrecision 
                                                      OpDecorate %511 RelaxedPrecision 
                                                      OpDecorate %511 DescriptorSet 511 
                                                      OpDecorate %511 Binding 511 
                                                      OpDecorate %512 RelaxedPrecision 
                                                      OpDecorate %513 RelaxedPrecision 
                                                      OpDecorate %513 DescriptorSet 513 
                                                      OpDecorate %513 Binding 513 
                                                      OpDecorate %514 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 516 
                                                      OpDecorate %519 RelaxedPrecision 
                                                      OpDecorate %520 RelaxedPrecision 
                                                      OpDecorate %521 RelaxedPrecision 
                                                      OpDecorate %523 RelaxedPrecision 
                                                      OpDecorate %524 RelaxedPrecision 
                                                      OpDecorate %525 RelaxedPrecision 
                                                      OpDecorate %526 RelaxedPrecision 
                                                      OpDecorate %527 RelaxedPrecision 
                                                      OpDecorate %530 RelaxedPrecision 
                                                      OpDecorate %531 RelaxedPrecision 
                                                      OpDecorate %532 RelaxedPrecision 
                                                      OpDecorate %533 RelaxedPrecision 
                                                      OpDecorate %536 RelaxedPrecision 
                                                      OpDecorate %539 RelaxedPrecision 
                                                      OpDecorate %540 RelaxedPrecision 
                                                      OpDecorate %541 RelaxedPrecision 
                                                      OpDecorate %555 RelaxedPrecision 
                                                      OpDecorate %556 RelaxedPrecision 
                                                      OpDecorate %558 RelaxedPrecision 
                                                      OpDecorate %560 RelaxedPrecision 
                                                      OpDecorate %561 RelaxedPrecision 
                                                      OpDecorate %561 Location 561 
                                                      OpDecorate %563 RelaxedPrecision 
                                                      OpDecorate %564 RelaxedPrecision 
                                                      OpDecorate %567 RelaxedPrecision 
                                                      OpDecorate %584 RelaxedPrecision 
                                                      OpDecorate %584 Location 584 
                                                      OpDecorate %589 RelaxedPrecision 
                                                      OpDecorate %590 RelaxedPrecision 
                                                      OpDecorate %591 RelaxedPrecision 
                                                      OpDecorate %592 RelaxedPrecision 
                                                      OpDecorate %595 RelaxedPrecision 
                                                      OpDecorate %607 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 1 
                                              %11 = OpTypeInt 32 0 
                                          u32 %12 = OpConstant 4 
                                              %13 = OpTypeArray %6 %12 
                                              %14 = OpTypeArray %6 %12 
                                              %15 = OpTypeArray %6 %12 
                                              %16 = OpTypeStruct %10 %10 %13 %14 %15 
                                              %17 = OpTypePointer Uniform %16 
Uniform struct {i32; i32; f32[4]; f32[4]; f32[4];}* %18 = OpVariable Uniform 
                                          i32 %19 = OpConstant 3 
                                          i32 %20 = OpConstant 0 
                                              %21 = OpTypePointer Uniform %6 
                                          u32 %24 = OpConstant 0 
                                              %25 = OpTypePointer Private %6 
                                              %27 = OpTypeVector %6 2 
                                              %28 = OpTypePointer Private %27 
                               Private f32_2* %29 = OpVariable Private 
                                          i32 %30 = OpConstant 2 
                                 Private f32* %34 = OpVariable Private 
                                              %35 = OpTypeVector %6 4 
                                              %36 = OpTypePointer Input %35 
                        Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                              %38 = OpTypePointer Input %6 
                                          i32 %41 = OpConstant 4 
                                          f32 %49 = OpConstant 3.674022E-40 
                                              %53 = OpTypeBool 
                                              %54 = OpTypePointer Private %53 
                                Private bool* %55 = OpVariable Private 
                                          f32 %56 = OpConstant 3.674022E-40 
                                 Private f32* %59 = OpVariable Private 
                                 Private f32* %65 = OpVariable Private 
                                          u32 %66 = OpConstant 1 
                                          i32 %69 = OpConstant 1 
                                Private bool* %80 = OpVariable Private 
                                              %83 = OpTypeVector %10 2 
                                              %84 = OpTypePointer Private %83 
                               Private i32_2* %85 = OpVariable Private 
                                        i32_2 %87 = OpConstantComposite %20 %69 
                                        i32_2 %88 = OpConstantComposite %19 %30 
                                              %89 = OpTypeVector %53 2 
                                              %92 = OpTypePointer Private %10 
                                 Private i32* %93 = OpVariable Private 
                                              %95 = OpTypePointer Function %10 
                                             %119 = OpTypePointer Private %35 
                              Private f32_4* %120 = OpVariable Private 
                                             %122 = OpTypePointer Function %27 
                              Private f32_2* %133 = OpVariable Private 
                              Private f32_2* %137 = OpVariable Private 
                              Private f32_3* %187 = OpVariable Private 
                                         u32 %200 = OpConstant 2 
                                             %232 = OpTypePointer Private %89 
                             Private bool_2* %233 = OpVariable Private 
                                       f32_4 %234 = OpConstantComposite %56 %56 %56 %56 
                                             %237 = OpTypeVector %53 4 
                              Private f32_3* %246 = OpVariable Private 
                                         f32 %251 = OpConstant 3.674022E-40 
                             Private bool_2* %280 = OpVariable Private 
                               Private bool* %285 = OpVariable Private 
                                             %292 = OpTypePointer Function %6 
                                             %329 = OpTypeVector %53 3 
                                             %330 = OpTypePointer Private %329 
                             Private bool_3* %331 = OpVariable Private 
                                             %347 = OpTypePointer Function %53 
                                             %493 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %494 = OpTypePointer UniformConstant %493 
        UniformConstant read_only Texture2D* %495 = OpVariable UniformConstant 
                                             %497 = OpTypeSampler 
                                             %498 = OpTypePointer UniformConstant %497 
                    UniformConstant sampler* %499 = OpVariable UniformConstant 
                                             %501 = OpTypeSampledImage %493 
                                             %503 = OpTypePointer Input %27 
                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                         u32 %507 = OpConstant 3 
                              Private f32_4* %510 = OpVariable Private 
        UniformConstant read_only Texture2D* %511 = OpVariable UniformConstant 
                    UniformConstant sampler* %513 = OpVariable UniformConstant 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                              Private f32_3* %519 = OpVariable Private 
                                       f32_3 %522 = OpConstantComposite %56 %56 %56 
                              Private f32_3* %524 = OpVariable Private 
                                         f32 %528 = OpConstant 3.674022E-40 
                                       f32_3 %529 = OpConstantComposite %528 %528 %528 
                                         f32 %534 = OpConstant 3.674022E-40 
                                       f32_3 %535 = OpConstantComposite %534 %534 %534 
                                         f32 %537 = OpConstant 3.674022E-40 
                                       f32_3 %538 = OpConstantComposite %537 %537 %537 
                                             %544 = OpTypePointer Uniform %10 
                                             %548 = OpTypePointer Function %7 
                                Private f32* %558 = OpVariable Private 
                                Input f32_4* %561 = OpVariable Input 
                                             %583 = OpTypePointer Output %35 
                               Output f32_4* %584 = OpVariable Output 
                                             %587 = OpTypePointer Output %6 
                                         i32 %599 = OpConstant 5 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function i32* %96 = OpVariable Function 
                             Function f32_2* %123 = OpVariable Function 
                             Function f32_2* %163 = OpVariable Function 
                               Function f32* %293 = OpVariable Function 
                               Function f32* %302 = OpVariable Function 
                               Function f32* %319 = OpVariable Function 
                              Function bool* %348 = OpVariable Function 
                              Function bool* %359 = OpVariable Function 
                               Function f32* %375 = OpVariable Function 
                               Function f32* %479 = OpVariable Function 
                             Function f32_3* %549 = OpVariable Function 
                             Function f32_3* %602 = OpVariable Function 
                                 Uniform f32* %22 = OpAccessChain %18 %19 %20 
                                          f32 %23 = OpLoad %22 
                                 Private f32* %26 = OpAccessChain %9 %24 
                                                      OpStore %26 %23 
                                 Uniform f32* %31 = OpAccessChain %18 %19 %30 
                                          f32 %32 = OpLoad %31 
                                 Private f32* %33 = OpAccessChain %29 %24 
                                                      OpStore %33 %32 
                                   Input f32* %39 = OpAccessChain vs_TEXCOORD2 %24 
                                          f32 %40 = OpLoad %39 
                                 Uniform f32* %42 = OpAccessChain %18 %41 %20 
                                          f32 %43 = OpLoad %42 
                                          f32 %44 = OpFNegate %43 
                                          f32 %45 = OpFAdd %40 %44 
                                                      OpStore %34 %45 
                                 Uniform f32* %46 = OpAccessChain %18 %41 %30 
                                          f32 %47 = OpLoad %46 
                                          f32 %48 = OpFNegate %47 
                                          f32 %50 = OpFMul %48 %49 
                                          f32 %51 = OpLoad %34 
                                          f32 %52 = OpFAdd %50 %51 
                                                      OpStore %34 %52 
                                          f32 %57 = OpLoad %34 
                                         bool %58 = OpFOrdGreaterThanEqual %56 %57 
                                                      OpStore %55 %58 
                                 Uniform f32* %60 = OpAccessChain %18 %41 %20 
                                          f32 %61 = OpLoad %60 
                                 Uniform f32* %62 = OpAccessChain %18 %41 %30 
                                          f32 %63 = OpLoad %62 
                                          f32 %64 = OpFAdd %61 %63 
                                                      OpStore %59 %64 
                                   Input f32* %67 = OpAccessChain vs_TEXCOORD2 %66 
                                          f32 %68 = OpLoad %67 
                                 Uniform f32* %70 = OpAccessChain %18 %41 %69 
                                          f32 %71 = OpLoad %70 
                                          f32 %72 = OpFNegate %71 
                                          f32 %73 = OpFAdd %68 %72 
                                                      OpStore %65 %73 
                                 Uniform f32* %74 = OpAccessChain %18 %41 %19 
                                          f32 %75 = OpLoad %74 
                                          f32 %76 = OpFNegate %75 
                                          f32 %77 = OpFMul %76 %49 
                                          f32 %78 = OpLoad %65 
                                          f32 %79 = OpFAdd %77 %78 
                                                      OpStore %65 %79 
                                          f32 %81 = OpLoad %65 
                                         bool %82 = OpFOrdGreaterThanEqual %56 %81 
                                                      OpStore %80 %82 
                                         bool %86 = OpLoad %80 
                                       bool_2 %90 = OpCompositeConstruct %86 %86 
                                        i32_2 %91 = OpSelect %90 %87 %88 
                                                      OpStore %85 %91 
                                         bool %94 = OpLoad %55 
                                                      OpSelectionMerge %98 None 
                                                      OpBranchConditional %94 %97 %101 
                                              %97 = OpLabel 
                                 Private i32* %99 = OpAccessChain %85 %24 
                                         i32 %100 = OpLoad %99 
                                                      OpStore %96 %100 
                                                      OpBranch %98 
                                             %101 = OpLabel 
                                Private i32* %102 = OpAccessChain %85 %66 
                                         i32 %103 = OpLoad %102 
                                                      OpStore %96 %103 
                                                      OpBranch %98 
                                              %98 = OpLabel 
                                         i32 %104 = OpLoad %96 
                                                      OpStore %93 %104 
                                         f32 %105 = OpLoad %59 
                                         i32 %106 = OpLoad %93 
                                Uniform f32* %107 = OpAccessChain %18 %30 %106 
                                         f32 %108 = OpLoad %107 
                                         f32 %109 = OpFNegate %108 
                                         f32 %110 = OpFAdd %105 %109 
                                Private f32* %111 = OpAccessChain %29 %66 
                                                      OpStore %111 %110 
                                Uniform f32* %112 = OpAccessChain %18 %41 %20 
                                         f32 %113 = OpLoad %112 
                                         i32 %114 = OpLoad %93 
                                Uniform f32* %115 = OpAccessChain %18 %30 %114 
                                         f32 %116 = OpLoad %115 
                                         f32 %117 = OpFAdd %113 %116 
                                Private f32* %118 = OpAccessChain %9 %66 
                                                      OpStore %118 %117 
                                        bool %121 = OpLoad %55 
                                                      OpSelectionMerge %125 None 
                                                      OpBranchConditional %121 %124 %128 
                                             %124 = OpLabel 
                                       f32_3 %126 = OpLoad %9 
                                       f32_2 %127 = OpVectorShuffle %126 %126 0 1 
                                                      OpStore %123 %127 
                                                      OpBranch %125 
                                             %128 = OpLabel 
                                       f32_2 %129 = OpLoad %29 
                                                      OpStore %123 %129 
                                                      OpBranch %125 
                                             %125 = OpLabel 
                                       f32_2 %130 = OpLoad %123 
                                       f32_4 %131 = OpLoad %120 
                                       f32_4 %132 = OpVectorShuffle %131 %130 4 5 2 3 
                                                      OpStore %120 %132 
                                Uniform f32* %134 = OpAccessChain %18 %19 %69 
                                         f32 %135 = OpLoad %134 
                                Private f32* %136 = OpAccessChain %133 %24 
                                                      OpStore %136 %135 
                                Uniform f32* %138 = OpAccessChain %18 %19 %19 
                                         f32 %139 = OpLoad %138 
                                Private f32* %140 = OpAccessChain %137 %24 
                                                      OpStore %140 %139 
                                Uniform f32* %141 = OpAccessChain %18 %41 %69 
                                         f32 %142 = OpLoad %141 
                                Uniform f32* %143 = OpAccessChain %18 %41 %19 
                                         f32 %144 = OpLoad %143 
                                         f32 %145 = OpFAdd %142 %144 
                                Private f32* %146 = OpAccessChain %9 %24 
                                                      OpStore %146 %145 
                                Private f32* %147 = OpAccessChain %9 %24 
                                         f32 %148 = OpLoad %147 
                                         i32 %149 = OpLoad %93 
                                Uniform f32* %150 = OpAccessChain %18 %30 %149 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFNegate %151 
                                         f32 %153 = OpFAdd %148 %152 
                                Private f32* %154 = OpAccessChain %137 %66 
                                                      OpStore %154 %153 
                                Uniform f32* %155 = OpAccessChain %18 %41 %69 
                                         f32 %156 = OpLoad %155 
                                         i32 %157 = OpLoad %93 
                                Uniform f32* %158 = OpAccessChain %18 %30 %157 
                                         f32 %159 = OpLoad %158 
                                         f32 %160 = OpFAdd %156 %159 
                                Private f32* %161 = OpAccessChain %133 %66 
                                                      OpStore %161 %160 
                                        bool %162 = OpLoad %80 
                                                      OpSelectionMerge %165 None 
                                                      OpBranchConditional %162 %164 %167 
                                             %164 = OpLabel 
                                       f32_2 %166 = OpLoad %133 
                                                      OpStore %163 %166 
                                                      OpBranch %165 
                                             %167 = OpLabel 
                                       f32_2 %168 = OpLoad %137 
                                                      OpStore %163 %168 
                                                      OpBranch %165 
                                             %165 = OpLabel 
                                       f32_2 %169 = OpLoad %163 
                                       f32_4 %170 = OpLoad %120 
                                       f32_4 %171 = OpVectorShuffle %170 %169 0 1 4 5 
                                                      OpStore %120 %171 
                                       f32_4 %172 = OpLoad %120 
                                       f32_2 %173 = OpVectorShuffle %172 %172 0 2 
                                       f32_2 %174 = OpFNegate %173 
                                         i32 %175 = OpLoad %93 
                                Uniform f32* %176 = OpAccessChain %18 %30 %175 
                                         f32 %177 = OpLoad %176 
                                       f32_2 %178 = OpCompositeConstruct %177 %177 
                                       f32_2 %179 = OpFAdd %174 %178 
                                       f32_3 %180 = OpLoad %9 
                                       f32_3 %181 = OpVectorShuffle %180 %179 3 4 2 
                                                      OpStore %9 %181 
                                Private f32* %182 = OpAccessChain %9 %24 
                                         f32 %183 = OpLoad %182 
                                Private f32* %184 = OpAccessChain %9 %66 
                                         f32 %185 = OpLoad %184 
                                         f32 %186 = OpFDiv %183 %185 
                                                      OpStore %59 %186 
                                       f32_4 %188 = OpLoad %120 
                                       f32_2 %189 = OpVectorShuffle %188 %188 1 3 
                                       f32_2 %190 = OpFNegate %189 
                                       f32_4 %191 = OpLoad vs_TEXCOORD2 
                                       f32_2 %192 = OpVectorShuffle %191 %191 0 1 
                                       f32_2 %193 = OpFAdd %190 %192 
                                       f32_3 %194 = OpLoad %187 
                                       f32_3 %195 = OpVectorShuffle %194 %193 3 4 2 
                                                      OpStore %187 %195 
                                         f32 %196 = OpLoad %59 
                                Private f32* %197 = OpAccessChain %187 %66 
                                         f32 %198 = OpLoad %197 
                                         f32 %199 = OpFMul %196 %198 
                                Private f32* %201 = OpAccessChain %187 %200 
                                                      OpStore %201 %199 
                                       f32_3 %202 = OpLoad %187 
                                       f32_2 %203 = OpVectorShuffle %202 %202 0 2 
                                       f32_3 %204 = OpLoad %187 
                                       f32_2 %205 = OpVectorShuffle %204 %204 0 2 
                                         f32 %206 = OpDot %203 %205 
                                                      OpStore %59 %206 
                                       f32_3 %207 = OpLoad %187 
                                       f32_2 %208 = OpVectorShuffle %207 %207 0 1 
                                       f32_3 %209 = OpLoad %187 
                                       f32_2 %210 = OpVectorShuffle %209 %209 0 1 
                                         f32 %211 = OpDot %208 %210 
                                Private f32* %212 = OpAccessChain %29 %24 
                                                      OpStore %212 %211 
                                Private f32* %213 = OpAccessChain %29 %24 
                                         f32 %214 = OpLoad %213 
                                         f32 %215 = OpExtInst %1 31 %214 
                                Private f32* %216 = OpAccessChain %29 %24 
                                                      OpStore %216 %215 
                                Private f32* %217 = OpAccessChain %29 %24 
                                         f32 %218 = OpLoad %217 
                                         i32 %219 = OpLoad %93 
                                Uniform f32* %220 = OpAccessChain %18 %30 %219 
                                         f32 %221 = OpLoad %220 
                                         f32 %222 = OpFNegate %221 
                                         f32 %223 = OpFAdd %218 %222 
                                Private f32* %224 = OpAccessChain %29 %24 
                                                      OpStore %224 %223 
                                         f32 %225 = OpLoad %59 
                                         f32 %226 = OpExtInst %1 31 %225 
                                                      OpStore %59 %226 
                                Private f32* %227 = OpAccessChain %9 %24 
                                         f32 %228 = OpLoad %227 
                                         f32 %229 = OpFNegate %228 
                                         f32 %230 = OpLoad %59 
                                         f32 %231 = OpFAdd %229 %230 
                                                      OpStore %59 %231 
                                       f32_3 %235 = OpLoad %9 
                                       f32_4 %236 = OpVectorShuffle %235 %235 0 1 0 0 
                                      bool_4 %238 = OpFOrdLessThan %234 %236 
                                      bool_2 %239 = OpVectorShuffle %238 %238 0 1 
                                                      OpStore %233 %239 
                               Private bool* %240 = OpAccessChain %233 %66 
                                        bool %241 = OpLoad %240 
                               Private bool* %242 = OpAccessChain %233 %24 
                                        bool %243 = OpLoad %242 
                                        bool %244 = OpLogicalAnd %241 %243 
                               Private bool* %245 = OpAccessChain %233 %24 
                                                      OpStore %245 %244 
                                  Input f32* %247 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %248 = OpLoad %247 
                                         f32 %249 = OpDPdx %248 
                                Private f32* %250 = OpAccessChain %246 %24 
                                                      OpStore %250 %249 
                                Private f32* %252 = OpAccessChain %246 %24 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpExtInst %1 4 %253 
                                         f32 %255 = OpFDiv %251 %254 
                                Private f32* %256 = OpAccessChain %246 %24 
                                                      OpStore %256 %255 
                                         f32 %257 = OpLoad %59 
                                Private f32* %258 = OpAccessChain %246 %24 
                                         f32 %259 = OpLoad %258 
                                         f32 %260 = OpFMul %257 %259 
                                         f32 %261 = OpFAdd %260 %49 
                                                      OpStore %59 %261 
                                         f32 %262 = OpLoad %59 
                                         f32 %263 = OpExtInst %1 43 %262 %56 %251 
                                                      OpStore %59 %263 
                                Private f32* %264 = OpAccessChain %29 %24 
                                         f32 %265 = OpLoad %264 
                                Private f32* %266 = OpAccessChain %246 %24 
                                         f32 %267 = OpLoad %266 
                                         f32 %268 = OpFMul %265 %267 
                                         f32 %269 = OpFAdd %268 %49 
                                Private f32* %270 = OpAccessChain %246 %24 
                                                      OpStore %270 %269 
                                Private f32* %271 = OpAccessChain %246 %24 
                                         f32 %272 = OpLoad %271 
                                         f32 %273 = OpExtInst %1 43 %272 %56 %251 
                                Private f32* %274 = OpAccessChain %246 %24 
                                                      OpStore %274 %273 
                               Private bool* %275 = OpAccessChain %233 %24 
                                        bool %276 = OpLoad %275 
                                         f32 %277 = OpLoad %59 
                                         f32 %278 = OpSelect %276 %277 %251 
                                Private f32* %279 = OpAccessChain %9 %24 
                                                      OpStore %279 %278 
                                       f32_4 %281 = OpLoad %120 
                                       f32_4 %282 = OpVectorShuffle %281 %281 0 2 0 0 
                                      bool_4 %283 = OpFOrdLessThan %234 %282 
                                      bool_2 %284 = OpVectorShuffle %283 %283 0 1 
                                                      OpStore %280 %284 
                               Private bool* %286 = OpAccessChain %280 %66 
                                        bool %287 = OpLoad %286 
                               Private bool* %288 = OpAccessChain %280 %24 
                                        bool %289 = OpLoad %288 
                                        bool %290 = OpLogicalOr %287 %289 
                                                      OpStore %285 %290 
                                        bool %291 = OpLoad %285 
                                                      OpSelectionMerge %295 None 
                                                      OpBranchConditional %291 %294 %298 
                                             %294 = OpLabel 
                                Private f32* %296 = OpAccessChain %9 %24 
                                         f32 %297 = OpLoad %296 
                                                      OpStore %293 %297 
                                                      OpBranch %295 
                                             %298 = OpLabel 
                                                      OpStore %293 %56 
                                                      OpBranch %295 
                                             %295 = OpLabel 
                                         f32 %299 = OpLoad %293 
                                Private f32* %300 = OpAccessChain %9 %24 
                                                      OpStore %300 %299 
                                        bool %301 = OpLoad %285 
                                                      OpSelectionMerge %304 None 
                                                      OpBranchConditional %301 %303 %307 
                                             %303 = OpLabel 
                                Private f32* %305 = OpAccessChain %246 %24 
                                         f32 %306 = OpLoad %305 
                                                      OpStore %302 %306 
                                                      OpBranch %304 
                                             %307 = OpLabel 
                                                      OpStore %302 %56 
                                                      OpBranch %304 
                                             %304 = OpLabel 
                                         f32 %308 = OpLoad %302 
                                Private f32* %309 = OpAccessChain %246 %24 
                                                      OpStore %309 %308 
                                Private f32* %310 = OpAccessChain %246 %24 
                                         f32 %311 = OpLoad %310 
                                        bool %312 = OpFOrdEqual %311 %56 
                                                      OpStore %285 %312 
                                Private f32* %313 = OpAccessChain %246 %24 
                                         f32 %314 = OpLoad %313 
                                         f32 %315 = OpFNegate %314 
                                         f32 %316 = OpFAdd %315 %251 
                                Private f32* %317 = OpAccessChain %246 %24 
                                                      OpStore %317 %316 
                                        bool %318 = OpLoad %285 
                                                      OpSelectionMerge %321 None 
                                                      OpBranchConditional %318 %320 %324 
                                             %320 = OpLabel 
                                Private f32* %322 = OpAccessChain %9 %24 
                                         f32 %323 = OpLoad %322 
                                                      OpStore %319 %323 
                                                      OpBranch %321 
                                             %324 = OpLabel 
                                Private f32* %325 = OpAccessChain %246 %24 
                                         f32 %326 = OpLoad %325 
                                                      OpStore %319 %326 
                                                      OpBranch %321 
                                             %321 = OpLabel 
                                         f32 %327 = OpLoad %319 
                                Private f32* %328 = OpAccessChain %9 %24 
                                                      OpStore %328 %327 
                                       f32_4 %332 = OpLoad %120 
                                       f32_4 %333 = OpVectorShuffle %332 %332 1 1 3 3 
                                       f32_4 %334 = OpLoad vs_TEXCOORD2 
                                       f32_4 %335 = OpVectorShuffle %334 %334 0 0 1 1 
                                      bool_4 %336 = OpFOrdGreaterThanEqual %333 %335 
                                      bool_2 %337 = OpVectorShuffle %336 %336 0 2 
                                      bool_3 %338 = OpLoad %331 
                                      bool_3 %339 = OpVectorShuffle %338 %337 3 1 4 
                                                      OpStore %331 %339 
                                       f32_4 %340 = OpLoad vs_TEXCOORD2 
                                       f32_4 %341 = OpVectorShuffle %340 %340 0 1 0 0 
                                       f32_4 %342 = OpLoad %120 
                                       f32_4 %343 = OpVectorShuffle %342 %342 1 3 1 1 
                                      bool_4 %344 = OpFOrdGreaterThanEqual %341 %343 
                                      bool_2 %345 = OpVectorShuffle %344 %344 0 1 
                                                      OpStore %280 %345 
                                        bool %346 = OpLoad %55 
                                                      OpSelectionMerge %350 None 
                                                      OpBranchConditional %346 %349 %353 
                                             %349 = OpLabel 
                               Private bool* %351 = OpAccessChain %331 %24 
                                        bool %352 = OpLoad %351 
                                                      OpStore %348 %352 
                                                      OpBranch %350 
                                             %353 = OpLabel 
                               Private bool* %354 = OpAccessChain %280 %24 
                                        bool %355 = OpLoad %354 
                                                      OpStore %348 %355 
                                                      OpBranch %350 
                                             %350 = OpLabel 
                                        bool %356 = OpLoad %348 
                               Private bool* %357 = OpAccessChain %331 %24 
                                                      OpStore %357 %356 
                                        bool %358 = OpLoad %80 
                                                      OpSelectionMerge %361 None 
                                                      OpBranchConditional %358 %360 %364 
                                             %360 = OpLabel 
                               Private bool* %362 = OpAccessChain %331 %200 
                                        bool %363 = OpLoad %362 
                                                      OpStore %359 %363 
                                                      OpBranch %361 
                                             %364 = OpLabel 
                               Private bool* %365 = OpAccessChain %280 %66 
                                        bool %366 = OpLoad %365 
                                                      OpStore %359 %366 
                                                      OpBranch %361 
                                             %361 = OpLabel 
                                        bool %367 = OpLoad %359 
                                                      OpStore %55 %367 
                                        bool %368 = OpLoad %55 
                               Private bool* %369 = OpAccessChain %331 %24 
                                        bool %370 = OpLoad %369 
                                        bool %371 = OpLogicalAnd %368 %370 
                               Private bool* %372 = OpAccessChain %331 %24 
                                                      OpStore %372 %371 
                               Private bool* %373 = OpAccessChain %331 %24 
                                        bool %374 = OpLoad %373 
                                                      OpSelectionMerge %377 None 
                                                      OpBranchConditional %374 %376 %380 
                                             %376 = OpLabel 
                                Private f32* %378 = OpAccessChain %9 %24 
                                         f32 %379 = OpLoad %378 
                                                      OpStore %375 %379 
                                                      OpBranch %377 
                                             %380 = OpLabel 
                                                      OpStore %375 %251 
                                                      OpBranch %377 
                                             %377 = OpLabel 
                                         f32 %381 = OpLoad %375 
                                Private f32* %382 = OpAccessChain %9 %24 
                                                      OpStore %382 %381 
                                Uniform f32* %383 = OpAccessChain %18 %19 %20 
                                         f32 %384 = OpLoad %383 
                                Uniform f32* %385 = OpAccessChain %18 %19 %30 
                                         f32 %386 = OpLoad %385 
                                         f32 %387 = OpFAdd %384 %386 
                                                      OpStore %34 %387 
                                         f32 %388 = OpLoad %34 
                                         f32 %389 = OpFNegate %388 
                                Uniform f32* %390 = OpAccessChain %18 %41 %30 
                                         f32 %391 = OpLoad %390 
                                         f32 %392 = OpFAdd %389 %391 
                                                      OpStore %34 %392 
                                Uniform f32* %393 = OpAccessChain %18 %19 %20 
                                         f32 %394 = OpLoad %393 
                                Uniform f32* %395 = OpAccessChain %18 %41 %20 
                                         f32 %396 = OpLoad %395 
                                         f32 %397 = OpFAdd %394 %396 
                                                      OpStore %59 %397 
                                         f32 %398 = OpLoad %34 
                                         f32 %399 = OpLoad %59 
                                         f32 %400 = OpFAdd %398 %399 
                                                      OpStore %34 %400 
                                  Input f32* %401 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %402 = OpLoad %401 
                                         f32 %403 = OpLoad %59 
                                        bool %404 = OpFOrdGreaterThanEqual %402 %403 
                                                      OpStore %285 %404 
                                         f32 %405 = OpLoad %34 
                                  Input f32* %406 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %407 = OpLoad %406 
                                        bool %408 = OpFOrdGreaterThanEqual %405 %407 
                                                      OpStore %55 %408 
                                        bool %409 = OpLoad %55 
                                        bool %410 = OpLoad %285 
                                        bool %411 = OpLogicalAnd %409 %410 
                                                      OpStore %55 %411 
                                Uniform f32* %412 = OpAccessChain %18 %19 %69 
                                         f32 %413 = OpLoad %412 
                                Uniform f32* %414 = OpAccessChain %18 %41 %69 
                                         f32 %415 = OpLoad %414 
                                         f32 %416 = OpFAdd %413 %415 
                                                      OpStore %59 %416 
                                  Input f32* %417 = OpAccessChain vs_TEXCOORD2 %66 
                                         f32 %418 = OpLoad %417 
                                         f32 %419 = OpLoad %59 
                                        bool %420 = OpFOrdGreaterThanEqual %418 %419 
                               Private bool* %421 = OpAccessChain %280 %24 
                                                      OpStore %421 %420 
                                        bool %422 = OpLoad %55 
                               Private bool* %423 = OpAccessChain %280 %24 
                                        bool %424 = OpLoad %423 
                                        bool %425 = OpLogicalAnd %422 %424 
                                                      OpStore %55 %425 
                                Uniform f32* %426 = OpAccessChain %18 %19 %69 
                                         f32 %427 = OpLoad %426 
                                Uniform f32* %428 = OpAccessChain %18 %19 %19 
                                         f32 %429 = OpLoad %428 
                                         f32 %430 = OpFAdd %427 %429 
                                Private f32* %431 = OpAccessChain %29 %24 
                                                      OpStore %431 %430 
                                Private f32* %432 = OpAccessChain %29 %24 
                                         f32 %433 = OpLoad %432 
                                         f32 %434 = OpFNegate %433 
                                Uniform f32* %435 = OpAccessChain %18 %41 %19 
                                         f32 %436 = OpLoad %435 
                                         f32 %437 = OpFAdd %434 %436 
                                Private f32* %438 = OpAccessChain %29 %24 
                                                      OpStore %438 %437 
                                         f32 %439 = OpLoad %59 
                                Private f32* %440 = OpAccessChain %29 %24 
                                         f32 %441 = OpLoad %440 
                                         f32 %442 = OpFAdd %439 %441 
                                                      OpStore %59 %442 
                                         f32 %443 = OpLoad %59 
                                  Input f32* %444 = OpAccessChain vs_TEXCOORD2 %66 
                                         f32 %445 = OpLoad %444 
                                        bool %446 = OpFOrdGreaterThanEqual %443 %445 
                                                      OpStore %285 %446 
                                        bool %447 = OpLoad %285 
                                        bool %448 = OpLoad %55 
                                        bool %449 = OpLogicalAnd %447 %448 
                                                      OpStore %55 %449 
                                        bool %450 = OpLoad %55 
                                         f32 %451 = OpSelect %450 %56 %251 
                                                      OpStore %34 %451 
                               Private bool* %452 = OpAccessChain %331 %24 
                                        bool %453 = OpLoad %452 
                                         f32 %454 = OpLoad %34 
                                         f32 %455 = OpSelect %453 %251 %454 
                                Private f32* %456 = OpAccessChain %246 %24 
                                                      OpStore %456 %455 
                                Uniform f32* %457 = OpAccessChain %18 %19 %20 
                                         f32 %458 = OpLoad %457 
                                        bool %459 = OpFOrdLessThan %56 %458 
                                                      OpStore %55 %459 
                                Uniform f32* %460 = OpAccessChain %18 %19 %69 
                                         f32 %461 = OpLoad %460 
                                        bool %462 = OpFOrdLessThan %56 %461 
                                                      OpStore %285 %462 
                                        bool %463 = OpLoad %285 
                                        bool %464 = OpLoad %55 
                                        bool %465 = OpLogicalOr %463 %464 
                                                      OpStore %55 %465 
                                Uniform f32* %466 = OpAccessChain %18 %19 %30 
                                         f32 %467 = OpLoad %466 
                                        bool %468 = OpFOrdLessThan %56 %467 
                                                      OpStore %285 %468 
                                        bool %469 = OpLoad %285 
                                        bool %470 = OpLoad %55 
                                        bool %471 = OpLogicalOr %469 %470 
                                                      OpStore %55 %471 
                                Uniform f32* %472 = OpAccessChain %18 %19 %19 
                                         f32 %473 = OpLoad %472 
                                        bool %474 = OpFOrdLessThan %56 %473 
                                                      OpStore %285 %474 
                                        bool %475 = OpLoad %285 
                                        bool %476 = OpLoad %55 
                                        bool %477 = OpLogicalOr %475 %476 
                                                      OpStore %55 %477 
                                        bool %478 = OpLoad %55 
                                                      OpSelectionMerge %481 None 
                                                      OpBranchConditional %478 %480 %484 
                                             %480 = OpLabel 
                                Private f32* %482 = OpAccessChain %246 %24 
                                         f32 %483 = OpLoad %482 
                                                      OpStore %479 %483 
                                                      OpBranch %481 
                                             %484 = OpLabel 
                                                      OpStore %479 %251 
                                                      OpBranch %481 
                                             %481 = OpLabel 
                                         f32 %485 = OpLoad %479 
                                Private f32* %486 = OpAccessChain %246 %24 
                                                      OpStore %486 %485 
                                Private f32* %487 = OpAccessChain %246 %24 
                                         f32 %488 = OpLoad %487 
                                Private f32* %489 = OpAccessChain %9 %24 
                                         f32 %490 = OpLoad %489 
                                         f32 %491 = OpFMul %488 %490 
                                Private f32* %492 = OpAccessChain %9 %200 
                                                      OpStore %492 %491 
                         read_only Texture2D %496 = OpLoad %495 
                                     sampler %500 = OpLoad %499 
                  read_only Texture2DSampled %502 = OpSampledImage %496 %500 
                                       f32_2 %505 = OpLoad vs_TEXCOORD1 
                                       f32_4 %506 = OpImageSampleImplicitLod %502 %505 
                                         f32 %508 = OpCompositeExtract %506 3 
                                Private f32* %509 = OpAccessChain %246 %200 
                                                      OpStore %509 %508 
                         read_only Texture2D %512 = OpLoad %511 
                                     sampler %514 = OpLoad %513 
                  read_only Texture2DSampled %515 = OpSampledImage %512 %514 
                                       f32_2 %517 = OpLoad vs_TEXCOORD0 
                                       f32_4 %518 = OpImageSampleImplicitLod %515 %517 
                                                      OpStore %510 %518 
                                       f32_4 %520 = OpLoad %510 
                                       f32_3 %521 = OpVectorShuffle %520 %520 0 1 2 
                                       f32_3 %523 = OpExtInst %1 40 %521 %522 
                                                      OpStore %519 %523 
                                       f32_3 %525 = OpLoad %519 
                                       f32_3 %526 = OpExtInst %1 30 %525 
                                                      OpStore %524 %526 
                                       f32_3 %527 = OpLoad %524 
                                       f32_3 %530 = OpFMul %527 %529 
                                                      OpStore %524 %530 
                                       f32_3 %531 = OpLoad %524 
                                       f32_3 %532 = OpExtInst %1 29 %531 
                                                      OpStore %524 %532 
                                       f32_3 %533 = OpLoad %524 
                                       f32_3 %536 = OpFMul %533 %535 
                                       f32_3 %539 = OpFAdd %536 %538 
                                                      OpStore %524 %539 
                                       f32_3 %540 = OpLoad %524 
                                       f32_3 %541 = OpExtInst %1 40 %540 %522 
                                       f32_4 %542 = OpLoad %120 
                                       f32_4 %543 = OpVectorShuffle %542 %541 4 5 6 3 
                                                      OpStore %120 %543 
                                Uniform i32* %545 = OpAccessChain %18 %20 
                                         i32 %546 = OpLoad %545 
                                        bool %547 = OpINotEqual %546 %20 
                                                      OpSelectionMerge %551 None 
                                                      OpBranchConditional %547 %550 %554 
                                             %550 = OpLabel 
                                       f32_4 %552 = OpLoad %120 
                                       f32_3 %553 = OpVectorShuffle %552 %552 0 1 2 
                                                      OpStore %549 %553 
                                                      OpBranch %551 
                                             %554 = OpLabel 
                                       f32_4 %555 = OpLoad %510 
                                       f32_3 %556 = OpVectorShuffle %555 %555 0 1 2 
                                                      OpStore %549 %556 
                                                      OpBranch %551 
                                             %551 = OpLabel 
                                       f32_3 %557 = OpLoad %549 
                                                      OpStore %519 %557 
                                Private f32* %559 = OpAccessChain %510 %507 
                                         f32 %560 = OpLoad %559 
                                  Input f32* %562 = OpAccessChain %561 %507 
                                         f32 %563 = OpLoad %562 
                                         f32 %564 = OpFMul %560 %563 
                                                      OpStore %558 %564 
                                Private f32* %565 = OpAccessChain %9 %24 
                                         f32 %566 = OpLoad %565 
                                         f32 %567 = OpLoad %558 
                                         f32 %568 = OpFMul %566 %567 
                                Private f32* %569 = OpAccessChain %9 %24 
                                                      OpStore %569 %568 
                                       f32_3 %570 = OpLoad %246 
                                       f32_2 %571 = OpVectorShuffle %570 %570 0 2 
                                       f32_3 %572 = OpLoad %9 
                                       f32_2 %573 = OpVectorShuffle %572 %572 0 2 
                                       f32_2 %574 = OpFMul %571 %573 
                                       f32_3 %575 = OpLoad %9 
                                       f32_3 %576 = OpVectorShuffle %575 %574 3 1 4 
                                                      OpStore %9 %576 
                                Private f32* %577 = OpAccessChain %246 %200 
                                         f32 %578 = OpLoad %577 
                                Private f32* %579 = OpAccessChain %9 %24 
                                         f32 %580 = OpLoad %579 
                                         f32 %581 = OpFMul %578 %580 
                                Private f32* %582 = OpAccessChain %9 %24 
                                                      OpStore %582 %581 
                                Private f32* %585 = OpAccessChain %9 %24 
                                         f32 %586 = OpLoad %585 
                                 Output f32* %588 = OpAccessChain %584 %507 
                                                      OpStore %588 %586 
                                       f32_3 %589 = OpLoad %519 
                                       f32_4 %590 = OpLoad %561 
                                       f32_3 %591 = OpVectorShuffle %590 %590 0 1 2 
                                       f32_3 %592 = OpFMul %589 %591 
                                                      OpStore %519 %592 
                                       f32_3 %593 = OpLoad %9 
                                       f32_3 %594 = OpVectorShuffle %593 %593 2 2 2 
                                       f32_3 %595 = OpLoad %519 
                                       f32_3 %596 = OpFMul %594 %595 
                                                      OpStore %9 %596 
                                Uniform i32* %597 = OpAccessChain %18 %69 
                                         i32 %598 = OpLoad %597 
                                        bool %600 = OpINotEqual %598 %599 
                                                      OpStore %285 %600 
                                        bool %601 = OpLoad %285 
                                                      OpSelectionMerge %604 None 
                                                      OpBranchConditional %601 %603 %606 
                                             %603 = OpLabel 
                                       f32_3 %605 = OpLoad %9 
                                                      OpStore %602 %605 
                                                      OpBranch %604 
                                             %606 = OpLabel 
                                       f32_3 %607 = OpLoad %519 
                                                      OpStore %602 %607 
                                                      OpBranch %604 
                                             %604 = OpLabel 
                                       f32_3 %608 = OpLoad %602 
                                       f32_4 %609 = OpLoad %584 
                                       f32_4 %610 = OpVectorShuffle %609 %608 4 5 6 3 
                                                      OpStore %584 %610 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 176
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %74 %84 %85 %149 %156 %158 %168 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpMemberDecorate %72 0 BuiltIn 72 
                                                      OpMemberDecorate %72 1 BuiltIn 72 
                                                      OpMemberDecorate %72 2 BuiltIn 72 
                                                      OpDecorate %72 Block 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 149 
                                                      OpDecorate vs_TEXCOORD0 Location 156 
                                                      OpDecorate %158 Location 158 
                                                      OpDecorate vs_TEXCOORD2 Location 168 
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
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeArray %7 %15 
                                              %20 = OpTypeStruct %16 %17 %18 %7 %19 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4[4];}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 0 
                                          i32 %25 = OpConstant 1 
                                              %26 = OpTypePointer Uniform %7 
                                          i32 %37 = OpConstant 2 
                                          i32 %46 = OpConstant 3 
                               Private f32_4* %50 = OpVariable Private 
                                          u32 %70 = OpConstant 1 
                                              %71 = OpTypeArray %6 %70 
                                              %72 = OpTypeStruct %7 %6 %71 
                                              %73 = OpTypePointer Output %72 
         Output struct {f32_4; f32; f32[1];}* %74 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                Output f32_4* %84 = OpVariable Output 
                                 Input f32_4* %85 = OpVariable Input 
                                              %87 = OpTypeVector %6 2 
                                             %129 = OpTypePointer Private %87 
                              Private f32_2* %130 = OpVariable Private 
                                         i32 %133 = OpConstant 4 
                                             %148 = OpTypePointer Output %87 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %157 = OpTypePointer Input %87 
                                Input f32_2* %158 = OpVariable Input 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                             %170 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %27 = OpAccessChain %22 %24 %25 
                                        f32_4 %28 = OpLoad %27 
                                        f32_4 %29 = OpFMul %13 %28 
                                                      OpStore %9 %29 
                               Uniform f32_4* %30 = OpAccessChain %22 %24 %24 
                                        f32_4 %31 = OpLoad %30 
                                        f32_4 %32 = OpLoad %11 
                                        f32_4 %33 = OpVectorShuffle %32 %32 0 0 0 0 
                                        f32_4 %34 = OpFMul %31 %33 
                                        f32_4 %35 = OpLoad %9 
                                        f32_4 %36 = OpFAdd %34 %35 
                                                      OpStore %9 %36 
                               Uniform f32_4* %38 = OpAccessChain %22 %24 %37 
                                        f32_4 %39 = OpLoad %38 
                                        f32_4 %40 = OpLoad %11 
                                        f32_4 %41 = OpVectorShuffle %40 %40 2 2 2 2 
                                        f32_4 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpFAdd %42 %43 
                                                      OpStore %9 %44 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %22 %24 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %9 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_4 %52 = OpVectorShuffle %51 %51 1 1 1 1 
                               Uniform f32_4* %53 = OpAccessChain %22 %37 %25 
                                        f32_4 %54 = OpLoad %53 
                                        f32_4 %55 = OpFMul %52 %54 
                                                      OpStore %50 %55 
                               Uniform f32_4* %56 = OpAccessChain %22 %37 %24 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                                        f32_4 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %50 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %50 %62 
                               Uniform f32_4* %63 = OpAccessChain %22 %37 %37 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpVectorShuffle %65 %65 2 2 2 2 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %50 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %50 %69 
                               Uniform f32_4* %75 = OpAccessChain %22 %37 %46 
                                        f32_4 %76 = OpLoad %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpVectorShuffle %77 %77 3 3 3 3 
                                        f32_4 %79 = OpFMul %76 %78 
                                        f32_4 %80 = OpLoad %50 
                                        f32_4 %81 = OpFAdd %79 %80 
                                Output f32_4* %83 = OpAccessChain %74 %24 
                                                      OpStore %83 %81 
                                        f32_4 %86 = OpLoad %85 
                                                      OpStore %84 %86 
                                        f32_4 %88 = OpLoad %9 
                                        f32_2 %89 = OpVectorShuffle %88 %88 1 1 
                               Uniform f32_4* %90 = OpAccessChain %22 %25 %25 
                                        f32_4 %91 = OpLoad %90 
                                        f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                        f32_2 %93 = OpFMul %89 %92 
                                        f32_4 %94 = OpLoad %50 
                                        f32_4 %95 = OpVectorShuffle %94 %93 4 5 2 3 
                                                      OpStore %50 %95 
                               Uniform f32_4* %96 = OpAccessChain %22 %25 %24 
                                        f32_4 %97 = OpLoad %96 
                                        f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                                        f32_4 %99 = OpLoad %9 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 0 
                                       f32_2 %101 = OpFMul %98 %100 
                                       f32_4 %102 = OpLoad %50 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFAdd %101 %103 
                                       f32_4 %105 = OpLoad %9 
                                       f32_4 %106 = OpVectorShuffle %105 %104 4 5 2 3 
                                                      OpStore %9 %106 
                              Uniform f32_4* %107 = OpAccessChain %22 %25 %37 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                       f32_4 %110 = OpLoad %9 
                                       f32_2 %111 = OpVectorShuffle %110 %110 2 2 
                                       f32_2 %112 = OpFMul %109 %111 
                                       f32_4 %113 = OpLoad %9 
                                       f32_2 %114 = OpVectorShuffle %113 %113 0 1 
                                       f32_2 %115 = OpFAdd %112 %114 
                                       f32_4 %116 = OpLoad %9 
                                       f32_4 %117 = OpVectorShuffle %116 %115 4 5 2 3 
                                                      OpStore %9 %117 
                              Uniform f32_4* %118 = OpAccessChain %22 %25 %46 
                                       f32_4 %119 = OpLoad %118 
                                       f32_2 %120 = OpVectorShuffle %119 %119 0 1 
                                       f32_4 %121 = OpLoad %9 
                                       f32_2 %122 = OpVectorShuffle %121 %121 3 3 
                                       f32_2 %123 = OpFMul %120 %122 
                                       f32_4 %124 = OpLoad %9 
                                       f32_2 %125 = OpVectorShuffle %124 %124 0 1 
                                       f32_2 %126 = OpFAdd %123 %125 
                                       f32_4 %127 = OpLoad %9 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 2 3 
                                                      OpStore %9 %128 
                                       f32_4 %131 = OpLoad %9 
                                       f32_2 %132 = OpVectorShuffle %131 %131 1 1 
                              Uniform f32_4* %134 = OpAccessChain %22 %133 %25 
                                       f32_4 %135 = OpLoad %134 
                                       f32_2 %136 = OpVectorShuffle %135 %135 0 1 
                                       f32_2 %137 = OpFMul %132 %136 
                                                      OpStore %130 %137 
                              Uniform f32_4* %138 = OpAccessChain %22 %133 %24 
                                       f32_4 %139 = OpLoad %138 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_4 %141 = OpLoad %9 
                                       f32_2 %142 = OpVectorShuffle %141 %141 0 0 
                                       f32_2 %143 = OpFMul %140 %142 
                                       f32_2 %144 = OpLoad %130 
                                       f32_2 %145 = OpFAdd %143 %144 
                                       f32_4 %146 = OpLoad %9 
                                       f32_4 %147 = OpVectorShuffle %146 %145 4 5 2 3 
                                                      OpStore %9 %147 
                                       f32_4 %150 = OpLoad %9 
                                       f32_2 %151 = OpVectorShuffle %150 %150 0 1 
                              Uniform f32_4* %152 = OpAccessChain %22 %133 %46 
                                       f32_4 %153 = OpLoad %152 
                                       f32_2 %154 = OpVectorShuffle %153 %153 0 1 
                                       f32_2 %155 = OpFAdd %151 %154 
                                                      OpStore vs_TEXCOORD1 %155 
                                       f32_2 %159 = OpLoad %158 
                              Uniform f32_4* %160 = OpAccessChain %22 %46 
                                       f32_4 %161 = OpLoad %160 
                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                       f32_2 %163 = OpFMul %159 %162 
                              Uniform f32_4* %164 = OpAccessChain %22 %46 
                                       f32_4 %165 = OpLoad %164 
                                       f32_2 %166 = OpVectorShuffle %165 %165 2 3 
                                       f32_2 %167 = OpFAdd %163 %166 
                                                      OpStore vs_TEXCOORD0 %167 
                                       f32_4 %169 = OpLoad %11 
                                                      OpStore vs_TEXCOORD2 %169 
                                 Output f32* %171 = OpAccessChain %74 %24 %70 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpFNegate %172 
                                 Output f32* %174 = OpAccessChain %74 %24 %70 
                                                      OpStore %174 %173 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 612
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %37 %504 %516 %561 %584 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpMemberDecorate %16 0 Offset 16 
                                                      OpMemberDecorate %16 1 Offset 16 
                                                      OpMemberDecorate %16 2 Offset 16 
                                                      OpMemberDecorate %16 3 Offset 16 
                                                      OpMemberDecorate %16 4 Offset 16 
                                                      OpDecorate %16 Block 
                                                      OpDecorate %18 DescriptorSet 18 
                                                      OpDecorate %18 Binding 18 
                                                      OpDecorate vs_TEXCOORD2 Location 37 
                                                      OpDecorate %495 RelaxedPrecision 
                                                      OpDecorate %495 DescriptorSet 495 
                                                      OpDecorate %495 Binding 495 
                                                      OpDecorate %496 RelaxedPrecision 
                                                      OpDecorate %499 RelaxedPrecision 
                                                      OpDecorate %499 DescriptorSet 499 
                                                      OpDecorate %499 Binding 499 
                                                      OpDecorate %500 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 504 
                                                      OpDecorate %510 RelaxedPrecision 
                                                      OpDecorate %511 RelaxedPrecision 
                                                      OpDecorate %511 DescriptorSet 511 
                                                      OpDecorate %511 Binding 511 
                                                      OpDecorate %512 RelaxedPrecision 
                                                      OpDecorate %513 RelaxedPrecision 
                                                      OpDecorate %513 DescriptorSet 513 
                                                      OpDecorate %513 Binding 513 
                                                      OpDecorate %514 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 516 
                                                      OpDecorate %519 RelaxedPrecision 
                                                      OpDecorate %520 RelaxedPrecision 
                                                      OpDecorate %521 RelaxedPrecision 
                                                      OpDecorate %523 RelaxedPrecision 
                                                      OpDecorate %524 RelaxedPrecision 
                                                      OpDecorate %525 RelaxedPrecision 
                                                      OpDecorate %526 RelaxedPrecision 
                                                      OpDecorate %527 RelaxedPrecision 
                                                      OpDecorate %530 RelaxedPrecision 
                                                      OpDecorate %531 RelaxedPrecision 
                                                      OpDecorate %532 RelaxedPrecision 
                                                      OpDecorate %533 RelaxedPrecision 
                                                      OpDecorate %536 RelaxedPrecision 
                                                      OpDecorate %539 RelaxedPrecision 
                                                      OpDecorate %540 RelaxedPrecision 
                                                      OpDecorate %541 RelaxedPrecision 
                                                      OpDecorate %555 RelaxedPrecision 
                                                      OpDecorate %556 RelaxedPrecision 
                                                      OpDecorate %558 RelaxedPrecision 
                                                      OpDecorate %560 RelaxedPrecision 
                                                      OpDecorate %561 RelaxedPrecision 
                                                      OpDecorate %561 Location 561 
                                                      OpDecorate %563 RelaxedPrecision 
                                                      OpDecorate %564 RelaxedPrecision 
                                                      OpDecorate %567 RelaxedPrecision 
                                                      OpDecorate %584 RelaxedPrecision 
                                                      OpDecorate %584 Location 584 
                                                      OpDecorate %589 RelaxedPrecision 
                                                      OpDecorate %590 RelaxedPrecision 
                                                      OpDecorate %591 RelaxedPrecision 
                                                      OpDecorate %592 RelaxedPrecision 
                                                      OpDecorate %595 RelaxedPrecision 
                                                      OpDecorate %607 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 1 
                                              %11 = OpTypeInt 32 0 
                                          u32 %12 = OpConstant 4 
                                              %13 = OpTypeArray %6 %12 
                                              %14 = OpTypeArray %6 %12 
                                              %15 = OpTypeArray %6 %12 
                                              %16 = OpTypeStruct %10 %10 %13 %14 %15 
                                              %17 = OpTypePointer Uniform %16 
Uniform struct {i32; i32; f32[4]; f32[4]; f32[4];}* %18 = OpVariable Uniform 
                                          i32 %19 = OpConstant 3 
                                          i32 %20 = OpConstant 0 
                                              %21 = OpTypePointer Uniform %6 
                                          u32 %24 = OpConstant 0 
                                              %25 = OpTypePointer Private %6 
                                              %27 = OpTypeVector %6 2 
                                              %28 = OpTypePointer Private %27 
                               Private f32_2* %29 = OpVariable Private 
                                          i32 %30 = OpConstant 2 
                                 Private f32* %34 = OpVariable Private 
                                              %35 = OpTypeVector %6 4 
                                              %36 = OpTypePointer Input %35 
                        Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                              %38 = OpTypePointer Input %6 
                                          i32 %41 = OpConstant 4 
                                          f32 %49 = OpConstant 3.674022E-40 
                                              %53 = OpTypeBool 
                                              %54 = OpTypePointer Private %53 
                                Private bool* %55 = OpVariable Private 
                                          f32 %56 = OpConstant 3.674022E-40 
                                 Private f32* %59 = OpVariable Private 
                                 Private f32* %65 = OpVariable Private 
                                          u32 %66 = OpConstant 1 
                                          i32 %69 = OpConstant 1 
                                Private bool* %80 = OpVariable Private 
                                              %83 = OpTypeVector %10 2 
                                              %84 = OpTypePointer Private %83 
                               Private i32_2* %85 = OpVariable Private 
                                        i32_2 %87 = OpConstantComposite %20 %69 
                                        i32_2 %88 = OpConstantComposite %19 %30 
                                              %89 = OpTypeVector %53 2 
                                              %92 = OpTypePointer Private %10 
                                 Private i32* %93 = OpVariable Private 
                                              %95 = OpTypePointer Function %10 
                                             %119 = OpTypePointer Private %35 
                              Private f32_4* %120 = OpVariable Private 
                                             %122 = OpTypePointer Function %27 
                              Private f32_2* %133 = OpVariable Private 
                              Private f32_2* %137 = OpVariable Private 
                              Private f32_3* %187 = OpVariable Private 
                                         u32 %200 = OpConstant 2 
                                             %232 = OpTypePointer Private %89 
                             Private bool_2* %233 = OpVariable Private 
                                       f32_4 %234 = OpConstantComposite %56 %56 %56 %56 
                                             %237 = OpTypeVector %53 4 
                              Private f32_3* %246 = OpVariable Private 
                                         f32 %251 = OpConstant 3.674022E-40 
                             Private bool_2* %280 = OpVariable Private 
                               Private bool* %285 = OpVariable Private 
                                             %292 = OpTypePointer Function %6 
                                             %329 = OpTypeVector %53 3 
                                             %330 = OpTypePointer Private %329 
                             Private bool_3* %331 = OpVariable Private 
                                             %347 = OpTypePointer Function %53 
                                             %493 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %494 = OpTypePointer UniformConstant %493 
        UniformConstant read_only Texture2D* %495 = OpVariable UniformConstant 
                                             %497 = OpTypeSampler 
                                             %498 = OpTypePointer UniformConstant %497 
                    UniformConstant sampler* %499 = OpVariable UniformConstant 
                                             %501 = OpTypeSampledImage %493 
                                             %503 = OpTypePointer Input %27 
                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                         u32 %507 = OpConstant 3 
                              Private f32_4* %510 = OpVariable Private 
        UniformConstant read_only Texture2D* %511 = OpVariable UniformConstant 
                    UniformConstant sampler* %513 = OpVariable UniformConstant 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                              Private f32_3* %519 = OpVariable Private 
                                       f32_3 %522 = OpConstantComposite %56 %56 %56 
                              Private f32_3* %524 = OpVariable Private 
                                         f32 %528 = OpConstant 3.674022E-40 
                                       f32_3 %529 = OpConstantComposite %528 %528 %528 
                                         f32 %534 = OpConstant 3.674022E-40 
                                       f32_3 %535 = OpConstantComposite %534 %534 %534 
                                         f32 %537 = OpConstant 3.674022E-40 
                                       f32_3 %538 = OpConstantComposite %537 %537 %537 
                                             %544 = OpTypePointer Uniform %10 
                                             %548 = OpTypePointer Function %7 
                                Private f32* %558 = OpVariable Private 
                                Input f32_4* %561 = OpVariable Input 
                                             %583 = OpTypePointer Output %35 
                               Output f32_4* %584 = OpVariable Output 
                                             %587 = OpTypePointer Output %6 
                                         i32 %599 = OpConstant 5 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function i32* %96 = OpVariable Function 
                             Function f32_2* %123 = OpVariable Function 
                             Function f32_2* %163 = OpVariable Function 
                               Function f32* %293 = OpVariable Function 
                               Function f32* %302 = OpVariable Function 
                               Function f32* %319 = OpVariable Function 
                              Function bool* %348 = OpVariable Function 
                              Function bool* %359 = OpVariable Function 
                               Function f32* %375 = OpVariable Function 
                               Function f32* %479 = OpVariable Function 
                             Function f32_3* %549 = OpVariable Function 
                             Function f32_3* %602 = OpVariable Function 
                                 Uniform f32* %22 = OpAccessChain %18 %19 %20 
                                          f32 %23 = OpLoad %22 
                                 Private f32* %26 = OpAccessChain %9 %24 
                                                      OpStore %26 %23 
                                 Uniform f32* %31 = OpAccessChain %18 %19 %30 
                                          f32 %32 = OpLoad %31 
                                 Private f32* %33 = OpAccessChain %29 %24 
                                                      OpStore %33 %32 
                                   Input f32* %39 = OpAccessChain vs_TEXCOORD2 %24 
                                          f32 %40 = OpLoad %39 
                                 Uniform f32* %42 = OpAccessChain %18 %41 %20 
                                          f32 %43 = OpLoad %42 
                                          f32 %44 = OpFNegate %43 
                                          f32 %45 = OpFAdd %40 %44 
                                                      OpStore %34 %45 
                                 Uniform f32* %46 = OpAccessChain %18 %41 %30 
                                          f32 %47 = OpLoad %46 
                                          f32 %48 = OpFNegate %47 
                                          f32 %50 = OpFMul %48 %49 
                                          f32 %51 = OpLoad %34 
                                          f32 %52 = OpFAdd %50 %51 
                                                      OpStore %34 %52 
                                          f32 %57 = OpLoad %34 
                                         bool %58 = OpFOrdGreaterThanEqual %56 %57 
                                                      OpStore %55 %58 
                                 Uniform f32* %60 = OpAccessChain %18 %41 %20 
                                          f32 %61 = OpLoad %60 
                                 Uniform f32* %62 = OpAccessChain %18 %41 %30 
                                          f32 %63 = OpLoad %62 
                                          f32 %64 = OpFAdd %61 %63 
                                                      OpStore %59 %64 
                                   Input f32* %67 = OpAccessChain vs_TEXCOORD2 %66 
                                          f32 %68 = OpLoad %67 
                                 Uniform f32* %70 = OpAccessChain %18 %41 %69 
                                          f32 %71 = OpLoad %70 
                                          f32 %72 = OpFNegate %71 
                                          f32 %73 = OpFAdd %68 %72 
                                                      OpStore %65 %73 
                                 Uniform f32* %74 = OpAccessChain %18 %41 %19 
                                          f32 %75 = OpLoad %74 
                                          f32 %76 = OpFNegate %75 
                                          f32 %77 = OpFMul %76 %49 
                                          f32 %78 = OpLoad %65 
                                          f32 %79 = OpFAdd %77 %78 
                                                      OpStore %65 %79 
                                          f32 %81 = OpLoad %65 
                                         bool %82 = OpFOrdGreaterThanEqual %56 %81 
                                                      OpStore %80 %82 
                                         bool %86 = OpLoad %80 
                                       bool_2 %90 = OpCompositeConstruct %86 %86 
                                        i32_2 %91 = OpSelect %90 %87 %88 
                                                      OpStore %85 %91 
                                         bool %94 = OpLoad %55 
                                                      OpSelectionMerge %98 None 
                                                      OpBranchConditional %94 %97 %101 
                                              %97 = OpLabel 
                                 Private i32* %99 = OpAccessChain %85 %24 
                                         i32 %100 = OpLoad %99 
                                                      OpStore %96 %100 
                                                      OpBranch %98 
                                             %101 = OpLabel 
                                Private i32* %102 = OpAccessChain %85 %66 
                                         i32 %103 = OpLoad %102 
                                                      OpStore %96 %103 
                                                      OpBranch %98 
                                              %98 = OpLabel 
                                         i32 %104 = OpLoad %96 
                                                      OpStore %93 %104 
                                         f32 %105 = OpLoad %59 
                                         i32 %106 = OpLoad %93 
                                Uniform f32* %107 = OpAccessChain %18 %30 %106 
                                         f32 %108 = OpLoad %107 
                                         f32 %109 = OpFNegate %108 
                                         f32 %110 = OpFAdd %105 %109 
                                Private f32* %111 = OpAccessChain %29 %66 
                                                      OpStore %111 %110 
                                Uniform f32* %112 = OpAccessChain %18 %41 %20 
                                         f32 %113 = OpLoad %112 
                                         i32 %114 = OpLoad %93 
                                Uniform f32* %115 = OpAccessChain %18 %30 %114 
                                         f32 %116 = OpLoad %115 
                                         f32 %117 = OpFAdd %113 %116 
                                Private f32* %118 = OpAccessChain %9 %66 
                                                      OpStore %118 %117 
                                        bool %121 = OpLoad %55 
                                                      OpSelectionMerge %125 None 
                                                      OpBranchConditional %121 %124 %128 
                                             %124 = OpLabel 
                                       f32_3 %126 = OpLoad %9 
                                       f32_2 %127 = OpVectorShuffle %126 %126 0 1 
                                                      OpStore %123 %127 
                                                      OpBranch %125 
                                             %128 = OpLabel 
                                       f32_2 %129 = OpLoad %29 
                                                      OpStore %123 %129 
                                                      OpBranch %125 
                                             %125 = OpLabel 
                                       f32_2 %130 = OpLoad %123 
                                       f32_4 %131 = OpLoad %120 
                                       f32_4 %132 = OpVectorShuffle %131 %130 4 5 2 3 
                                                      OpStore %120 %132 
                                Uniform f32* %134 = OpAccessChain %18 %19 %69 
                                         f32 %135 = OpLoad %134 
                                Private f32* %136 = OpAccessChain %133 %24 
                                                      OpStore %136 %135 
                                Uniform f32* %138 = OpAccessChain %18 %19 %19 
                                         f32 %139 = OpLoad %138 
                                Private f32* %140 = OpAccessChain %137 %24 
                                                      OpStore %140 %139 
                                Uniform f32* %141 = OpAccessChain %18 %41 %69 
                                         f32 %142 = OpLoad %141 
                                Uniform f32* %143 = OpAccessChain %18 %41 %19 
                                         f32 %144 = OpLoad %143 
                                         f32 %145 = OpFAdd %142 %144 
                                Private f32* %146 = OpAccessChain %9 %24 
                                                      OpStore %146 %145 
                                Private f32* %147 = OpAccessChain %9 %24 
                                         f32 %148 = OpLoad %147 
                                         i32 %149 = OpLoad %93 
                                Uniform f32* %150 = OpAccessChain %18 %30 %149 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFNegate %151 
                                         f32 %153 = OpFAdd %148 %152 
                                Private f32* %154 = OpAccessChain %137 %66 
                                                      OpStore %154 %153 
                                Uniform f32* %155 = OpAccessChain %18 %41 %69 
                                         f32 %156 = OpLoad %155 
                                         i32 %157 = OpLoad %93 
                                Uniform f32* %158 = OpAccessChain %18 %30 %157 
                                         f32 %159 = OpLoad %158 
                                         f32 %160 = OpFAdd %156 %159 
                                Private f32* %161 = OpAccessChain %133 %66 
                                                      OpStore %161 %160 
                                        bool %162 = OpLoad %80 
                                                      OpSelectionMerge %165 None 
                                                      OpBranchConditional %162 %164 %167 
                                             %164 = OpLabel 
                                       f32_2 %166 = OpLoad %133 
                                                      OpStore %163 %166 
                                                      OpBranch %165 
                                             %167 = OpLabel 
                                       f32_2 %168 = OpLoad %137 
                                                      OpStore %163 %168 
                                                      OpBranch %165 
                                             %165 = OpLabel 
                                       f32_2 %169 = OpLoad %163 
                                       f32_4 %170 = OpLoad %120 
                                       f32_4 %171 = OpVectorShuffle %170 %169 0 1 4 5 
                                                      OpStore %120 %171 
                                       f32_4 %172 = OpLoad %120 
                                       f32_2 %173 = OpVectorShuffle %172 %172 0 2 
                                       f32_2 %174 = OpFNegate %173 
                                         i32 %175 = OpLoad %93 
                                Uniform f32* %176 = OpAccessChain %18 %30 %175 
                                         f32 %177 = OpLoad %176 
                                       f32_2 %178 = OpCompositeConstruct %177 %177 
                                       f32_2 %179 = OpFAdd %174 %178 
                                       f32_3 %180 = OpLoad %9 
                                       f32_3 %181 = OpVectorShuffle %180 %179 3 4 2 
                                                      OpStore %9 %181 
                                Private f32* %182 = OpAccessChain %9 %24 
                                         f32 %183 = OpLoad %182 
                                Private f32* %184 = OpAccessChain %9 %66 
                                         f32 %185 = OpLoad %184 
                                         f32 %186 = OpFDiv %183 %185 
                                                      OpStore %59 %186 
                                       f32_4 %188 = OpLoad %120 
                                       f32_2 %189 = OpVectorShuffle %188 %188 1 3 
                                       f32_2 %190 = OpFNegate %189 
                                       f32_4 %191 = OpLoad vs_TEXCOORD2 
                                       f32_2 %192 = OpVectorShuffle %191 %191 0 1 
                                       f32_2 %193 = OpFAdd %190 %192 
                                       f32_3 %194 = OpLoad %187 
                                       f32_3 %195 = OpVectorShuffle %194 %193 3 4 2 
                                                      OpStore %187 %195 
                                         f32 %196 = OpLoad %59 
                                Private f32* %197 = OpAccessChain %187 %66 
                                         f32 %198 = OpLoad %197 
                                         f32 %199 = OpFMul %196 %198 
                                Private f32* %201 = OpAccessChain %187 %200 
                                                      OpStore %201 %199 
                                       f32_3 %202 = OpLoad %187 
                                       f32_2 %203 = OpVectorShuffle %202 %202 0 2 
                                       f32_3 %204 = OpLoad %187 
                                       f32_2 %205 = OpVectorShuffle %204 %204 0 2 
                                         f32 %206 = OpDot %203 %205 
                                                      OpStore %59 %206 
                                       f32_3 %207 = OpLoad %187 
                                       f32_2 %208 = OpVectorShuffle %207 %207 0 1 
                                       f32_3 %209 = OpLoad %187 
                                       f32_2 %210 = OpVectorShuffle %209 %209 0 1 
                                         f32 %211 = OpDot %208 %210 
                                Private f32* %212 = OpAccessChain %29 %24 
                                                      OpStore %212 %211 
                                Private f32* %213 = OpAccessChain %29 %24 
                                         f32 %214 = OpLoad %213 
                                         f32 %215 = OpExtInst %1 31 %214 
                                Private f32* %216 = OpAccessChain %29 %24 
                                                      OpStore %216 %215 
                                Private f32* %217 = OpAccessChain %29 %24 
                                         f32 %218 = OpLoad %217 
                                         i32 %219 = OpLoad %93 
                                Uniform f32* %220 = OpAccessChain %18 %30 %219 
                                         f32 %221 = OpLoad %220 
                                         f32 %222 = OpFNegate %221 
                                         f32 %223 = OpFAdd %218 %222 
                                Private f32* %224 = OpAccessChain %29 %24 
                                                      OpStore %224 %223 
                                         f32 %225 = OpLoad %59 
                                         f32 %226 = OpExtInst %1 31 %225 
                                                      OpStore %59 %226 
                                Private f32* %227 = OpAccessChain %9 %24 
                                         f32 %228 = OpLoad %227 
                                         f32 %229 = OpFNegate %228 
                                         f32 %230 = OpLoad %59 
                                         f32 %231 = OpFAdd %229 %230 
                                                      OpStore %59 %231 
                                       f32_3 %235 = OpLoad %9 
                                       f32_4 %236 = OpVectorShuffle %235 %235 0 1 0 0 
                                      bool_4 %238 = OpFOrdLessThan %234 %236 
                                      bool_2 %239 = OpVectorShuffle %238 %238 0 1 
                                                      OpStore %233 %239 
                               Private bool* %240 = OpAccessChain %233 %66 
                                        bool %241 = OpLoad %240 
                               Private bool* %242 = OpAccessChain %233 %24 
                                        bool %243 = OpLoad %242 
                                        bool %244 = OpLogicalAnd %241 %243 
                               Private bool* %245 = OpAccessChain %233 %24 
                                                      OpStore %245 %244 
                                  Input f32* %247 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %248 = OpLoad %247 
                                         f32 %249 = OpDPdx %248 
                                Private f32* %250 = OpAccessChain %246 %24 
                                                      OpStore %250 %249 
                                Private f32* %252 = OpAccessChain %246 %24 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpExtInst %1 4 %253 
                                         f32 %255 = OpFDiv %251 %254 
                                Private f32* %256 = OpAccessChain %246 %24 
                                                      OpStore %256 %255 
                                         f32 %257 = OpLoad %59 
                                Private f32* %258 = OpAccessChain %246 %24 
                                         f32 %259 = OpLoad %258 
                                         f32 %260 = OpFMul %257 %259 
                                         f32 %261 = OpFAdd %260 %49 
                                                      OpStore %59 %261 
                                         f32 %262 = OpLoad %59 
                                         f32 %263 = OpExtInst %1 43 %262 %56 %251 
                                                      OpStore %59 %263 
                                Private f32* %264 = OpAccessChain %29 %24 
                                         f32 %265 = OpLoad %264 
                                Private f32* %266 = OpAccessChain %246 %24 
                                         f32 %267 = OpLoad %266 
                                         f32 %268 = OpFMul %265 %267 
                                         f32 %269 = OpFAdd %268 %49 
                                Private f32* %270 = OpAccessChain %246 %24 
                                                      OpStore %270 %269 
                                Private f32* %271 = OpAccessChain %246 %24 
                                         f32 %272 = OpLoad %271 
                                         f32 %273 = OpExtInst %1 43 %272 %56 %251 
                                Private f32* %274 = OpAccessChain %246 %24 
                                                      OpStore %274 %273 
                               Private bool* %275 = OpAccessChain %233 %24 
                                        bool %276 = OpLoad %275 
                                         f32 %277 = OpLoad %59 
                                         f32 %278 = OpSelect %276 %277 %251 
                                Private f32* %279 = OpAccessChain %9 %24 
                                                      OpStore %279 %278 
                                       f32_4 %281 = OpLoad %120 
                                       f32_4 %282 = OpVectorShuffle %281 %281 0 2 0 0 
                                      bool_4 %283 = OpFOrdLessThan %234 %282 
                                      bool_2 %284 = OpVectorShuffle %283 %283 0 1 
                                                      OpStore %280 %284 
                               Private bool* %286 = OpAccessChain %280 %66 
                                        bool %287 = OpLoad %286 
                               Private bool* %288 = OpAccessChain %280 %24 
                                        bool %289 = OpLoad %288 
                                        bool %290 = OpLogicalOr %287 %289 
                                                      OpStore %285 %290 
                                        bool %291 = OpLoad %285 
                                                      OpSelectionMerge %295 None 
                                                      OpBranchConditional %291 %294 %298 
                                             %294 = OpLabel 
                                Private f32* %296 = OpAccessChain %9 %24 
                                         f32 %297 = OpLoad %296 
                                                      OpStore %293 %297 
                                                      OpBranch %295 
                                             %298 = OpLabel 
                                                      OpStore %293 %56 
                                                      OpBranch %295 
                                             %295 = OpLabel 
                                         f32 %299 = OpLoad %293 
                                Private f32* %300 = OpAccessChain %9 %24 
                                                      OpStore %300 %299 
                                        bool %301 = OpLoad %285 
                                                      OpSelectionMerge %304 None 
                                                      OpBranchConditional %301 %303 %307 
                                             %303 = OpLabel 
                                Private f32* %305 = OpAccessChain %246 %24 
                                         f32 %306 = OpLoad %305 
                                                      OpStore %302 %306 
                                                      OpBranch %304 
                                             %307 = OpLabel 
                                                      OpStore %302 %56 
                                                      OpBranch %304 
                                             %304 = OpLabel 
                                         f32 %308 = OpLoad %302 
                                Private f32* %309 = OpAccessChain %246 %24 
                                                      OpStore %309 %308 
                                Private f32* %310 = OpAccessChain %246 %24 
                                         f32 %311 = OpLoad %310 
                                        bool %312 = OpFOrdEqual %311 %56 
                                                      OpStore %285 %312 
                                Private f32* %313 = OpAccessChain %246 %24 
                                         f32 %314 = OpLoad %313 
                                         f32 %315 = OpFNegate %314 
                                         f32 %316 = OpFAdd %315 %251 
                                Private f32* %317 = OpAccessChain %246 %24 
                                                      OpStore %317 %316 
                                        bool %318 = OpLoad %285 
                                                      OpSelectionMerge %321 None 
                                                      OpBranchConditional %318 %320 %324 
                                             %320 = OpLabel 
                                Private f32* %322 = OpAccessChain %9 %24 
                                         f32 %323 = OpLoad %322 
                                                      OpStore %319 %323 
                                                      OpBranch %321 
                                             %324 = OpLabel 
                                Private f32* %325 = OpAccessChain %246 %24 
                                         f32 %326 = OpLoad %325 
                                                      OpStore %319 %326 
                                                      OpBranch %321 
                                             %321 = OpLabel 
                                         f32 %327 = OpLoad %319 
                                Private f32* %328 = OpAccessChain %9 %24 
                                                      OpStore %328 %327 
                                       f32_4 %332 = OpLoad %120 
                                       f32_4 %333 = OpVectorShuffle %332 %332 1 1 3 3 
                                       f32_4 %334 = OpLoad vs_TEXCOORD2 
                                       f32_4 %335 = OpVectorShuffle %334 %334 0 0 1 1 
                                      bool_4 %336 = OpFOrdGreaterThanEqual %333 %335 
                                      bool_2 %337 = OpVectorShuffle %336 %336 0 2 
                                      bool_3 %338 = OpLoad %331 
                                      bool_3 %339 = OpVectorShuffle %338 %337 3 1 4 
                                                      OpStore %331 %339 
                                       f32_4 %340 = OpLoad vs_TEXCOORD2 
                                       f32_4 %341 = OpVectorShuffle %340 %340 0 1 0 0 
                                       f32_4 %342 = OpLoad %120 
                                       f32_4 %343 = OpVectorShuffle %342 %342 1 3 1 1 
                                      bool_4 %344 = OpFOrdGreaterThanEqual %341 %343 
                                      bool_2 %345 = OpVectorShuffle %344 %344 0 1 
                                                      OpStore %280 %345 
                                        bool %346 = OpLoad %55 
                                                      OpSelectionMerge %350 None 
                                                      OpBranchConditional %346 %349 %353 
                                             %349 = OpLabel 
                               Private bool* %351 = OpAccessChain %331 %24 
                                        bool %352 = OpLoad %351 
                                                      OpStore %348 %352 
                                                      OpBranch %350 
                                             %353 = OpLabel 
                               Private bool* %354 = OpAccessChain %280 %24 
                                        bool %355 = OpLoad %354 
                                                      OpStore %348 %355 
                                                      OpBranch %350 
                                             %350 = OpLabel 
                                        bool %356 = OpLoad %348 
                               Private bool* %357 = OpAccessChain %331 %24 
                                                      OpStore %357 %356 
                                        bool %358 = OpLoad %80 
                                                      OpSelectionMerge %361 None 
                                                      OpBranchConditional %358 %360 %364 
                                             %360 = OpLabel 
                               Private bool* %362 = OpAccessChain %331 %200 
                                        bool %363 = OpLoad %362 
                                                      OpStore %359 %363 
                                                      OpBranch %361 
                                             %364 = OpLabel 
                               Private bool* %365 = OpAccessChain %280 %66 
                                        bool %366 = OpLoad %365 
                                                      OpStore %359 %366 
                                                      OpBranch %361 
                                             %361 = OpLabel 
                                        bool %367 = OpLoad %359 
                                                      OpStore %55 %367 
                                        bool %368 = OpLoad %55 
                               Private bool* %369 = OpAccessChain %331 %24 
                                        bool %370 = OpLoad %369 
                                        bool %371 = OpLogicalAnd %368 %370 
                               Private bool* %372 = OpAccessChain %331 %24 
                                                      OpStore %372 %371 
                               Private bool* %373 = OpAccessChain %331 %24 
                                        bool %374 = OpLoad %373 
                                                      OpSelectionMerge %377 None 
                                                      OpBranchConditional %374 %376 %380 
                                             %376 = OpLabel 
                                Private f32* %378 = OpAccessChain %9 %24 
                                         f32 %379 = OpLoad %378 
                                                      OpStore %375 %379 
                                                      OpBranch %377 
                                             %380 = OpLabel 
                                                      OpStore %375 %251 
                                                      OpBranch %377 
                                             %377 = OpLabel 
                                         f32 %381 = OpLoad %375 
                                Private f32* %382 = OpAccessChain %9 %24 
                                                      OpStore %382 %381 
                                Uniform f32* %383 = OpAccessChain %18 %19 %20 
                                         f32 %384 = OpLoad %383 
                                Uniform f32* %385 = OpAccessChain %18 %19 %30 
                                         f32 %386 = OpLoad %385 
                                         f32 %387 = OpFAdd %384 %386 
                                                      OpStore %34 %387 
                                         f32 %388 = OpLoad %34 
                                         f32 %389 = OpFNegate %388 
                                Uniform f32* %390 = OpAccessChain %18 %41 %30 
                                         f32 %391 = OpLoad %390 
                                         f32 %392 = OpFAdd %389 %391 
                                                      OpStore %34 %392 
                                Uniform f32* %393 = OpAccessChain %18 %19 %20 
                                         f32 %394 = OpLoad %393 
                                Uniform f32* %395 = OpAccessChain %18 %41 %20 
                                         f32 %396 = OpLoad %395 
                                         f32 %397 = OpFAdd %394 %396 
                                                      OpStore %59 %397 
                                         f32 %398 = OpLoad %34 
                                         f32 %399 = OpLoad %59 
                                         f32 %400 = OpFAdd %398 %399 
                                                      OpStore %34 %400 
                                  Input f32* %401 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %402 = OpLoad %401 
                                         f32 %403 = OpLoad %59 
                                        bool %404 = OpFOrdGreaterThanEqual %402 %403 
                                                      OpStore %285 %404 
                                         f32 %405 = OpLoad %34 
                                  Input f32* %406 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %407 = OpLoad %406 
                                        bool %408 = OpFOrdGreaterThanEqual %405 %407 
                                                      OpStore %55 %408 
                                        bool %409 = OpLoad %55 
                                        bool %410 = OpLoad %285 
                                        bool %411 = OpLogicalAnd %409 %410 
                                                      OpStore %55 %411 
                                Uniform f32* %412 = OpAccessChain %18 %19 %69 
                                         f32 %413 = OpLoad %412 
                                Uniform f32* %414 = OpAccessChain %18 %41 %69 
                                         f32 %415 = OpLoad %414 
                                         f32 %416 = OpFAdd %413 %415 
                                                      OpStore %59 %416 
                                  Input f32* %417 = OpAccessChain vs_TEXCOORD2 %66 
                                         f32 %418 = OpLoad %417 
                                         f32 %419 = OpLoad %59 
                                        bool %420 = OpFOrdGreaterThanEqual %418 %419 
                               Private bool* %421 = OpAccessChain %280 %24 
                                                      OpStore %421 %420 
                                        bool %422 = OpLoad %55 
                               Private bool* %423 = OpAccessChain %280 %24 
                                        bool %424 = OpLoad %423 
                                        bool %425 = OpLogicalAnd %422 %424 
                                                      OpStore %55 %425 
                                Uniform f32* %426 = OpAccessChain %18 %19 %69 
                                         f32 %427 = OpLoad %426 
                                Uniform f32* %428 = OpAccessChain %18 %19 %19 
                                         f32 %429 = OpLoad %428 
                                         f32 %430 = OpFAdd %427 %429 
                                Private f32* %431 = OpAccessChain %29 %24 
                                                      OpStore %431 %430 
                                Private f32* %432 = OpAccessChain %29 %24 
                                         f32 %433 = OpLoad %432 
                                         f32 %434 = OpFNegate %433 
                                Uniform f32* %435 = OpAccessChain %18 %41 %19 
                                         f32 %436 = OpLoad %435 
                                         f32 %437 = OpFAdd %434 %436 
                                Private f32* %438 = OpAccessChain %29 %24 
                                                      OpStore %438 %437 
                                         f32 %439 = OpLoad %59 
                                Private f32* %440 = OpAccessChain %29 %24 
                                         f32 %441 = OpLoad %440 
                                         f32 %442 = OpFAdd %439 %441 
                                                      OpStore %59 %442 
                                         f32 %443 = OpLoad %59 
                                  Input f32* %444 = OpAccessChain vs_TEXCOORD2 %66 
                                         f32 %445 = OpLoad %444 
                                        bool %446 = OpFOrdGreaterThanEqual %443 %445 
                                                      OpStore %285 %446 
                                        bool %447 = OpLoad %285 
                                        bool %448 = OpLoad %55 
                                        bool %449 = OpLogicalAnd %447 %448 
                                                      OpStore %55 %449 
                                        bool %450 = OpLoad %55 
                                         f32 %451 = OpSelect %450 %56 %251 
                                                      OpStore %34 %451 
                               Private bool* %452 = OpAccessChain %331 %24 
                                        bool %453 = OpLoad %452 
                                         f32 %454 = OpLoad %34 
                                         f32 %455 = OpSelect %453 %251 %454 
                                Private f32* %456 = OpAccessChain %246 %24 
                                                      OpStore %456 %455 
                                Uniform f32* %457 = OpAccessChain %18 %19 %20 
                                         f32 %458 = OpLoad %457 
                                        bool %459 = OpFOrdLessThan %56 %458 
                                                      OpStore %55 %459 
                                Uniform f32* %460 = OpAccessChain %18 %19 %69 
                                         f32 %461 = OpLoad %460 
                                        bool %462 = OpFOrdLessThan %56 %461 
                                                      OpStore %285 %462 
                                        bool %463 = OpLoad %285 
                                        bool %464 = OpLoad %55 
                                        bool %465 = OpLogicalOr %463 %464 
                                                      OpStore %55 %465 
                                Uniform f32* %466 = OpAccessChain %18 %19 %30 
                                         f32 %467 = OpLoad %466 
                                        bool %468 = OpFOrdLessThan %56 %467 
                                                      OpStore %285 %468 
                                        bool %469 = OpLoad %285 
                                        bool %470 = OpLoad %55 
                                        bool %471 = OpLogicalOr %469 %470 
                                                      OpStore %55 %471 
                                Uniform f32* %472 = OpAccessChain %18 %19 %19 
                                         f32 %473 = OpLoad %472 
                                        bool %474 = OpFOrdLessThan %56 %473 
                                                      OpStore %285 %474 
                                        bool %475 = OpLoad %285 
                                        bool %476 = OpLoad %55 
                                        bool %477 = OpLogicalOr %475 %476 
                                                      OpStore %55 %477 
                                        bool %478 = OpLoad %55 
                                                      OpSelectionMerge %481 None 
                                                      OpBranchConditional %478 %480 %484 
                                             %480 = OpLabel 
                                Private f32* %482 = OpAccessChain %246 %24 
                                         f32 %483 = OpLoad %482 
                                                      OpStore %479 %483 
                                                      OpBranch %481 
                                             %484 = OpLabel 
                                                      OpStore %479 %251 
                                                      OpBranch %481 
                                             %481 = OpLabel 
                                         f32 %485 = OpLoad %479 
                                Private f32* %486 = OpAccessChain %246 %24 
                                                      OpStore %486 %485 
                                Private f32* %487 = OpAccessChain %246 %24 
                                         f32 %488 = OpLoad %487 
                                Private f32* %489 = OpAccessChain %9 %24 
                                         f32 %490 = OpLoad %489 
                                         f32 %491 = OpFMul %488 %490 
                                Private f32* %492 = OpAccessChain %9 %200 
                                                      OpStore %492 %491 
                         read_only Texture2D %496 = OpLoad %495 
                                     sampler %500 = OpLoad %499 
                  read_only Texture2DSampled %502 = OpSampledImage %496 %500 
                                       f32_2 %505 = OpLoad vs_TEXCOORD1 
                                       f32_4 %506 = OpImageSampleImplicitLod %502 %505 
                                         f32 %508 = OpCompositeExtract %506 3 
                                Private f32* %509 = OpAccessChain %246 %200 
                                                      OpStore %509 %508 
                         read_only Texture2D %512 = OpLoad %511 
                                     sampler %514 = OpLoad %513 
                  read_only Texture2DSampled %515 = OpSampledImage %512 %514 
                                       f32_2 %517 = OpLoad vs_TEXCOORD0 
                                       f32_4 %518 = OpImageSampleImplicitLod %515 %517 
                                                      OpStore %510 %518 
                                       f32_4 %520 = OpLoad %510 
                                       f32_3 %521 = OpVectorShuffle %520 %520 0 1 2 
                                       f32_3 %523 = OpExtInst %1 40 %521 %522 
                                                      OpStore %519 %523 
                                       f32_3 %525 = OpLoad %519 
                                       f32_3 %526 = OpExtInst %1 30 %525 
                                                      OpStore %524 %526 
                                       f32_3 %527 = OpLoad %524 
                                       f32_3 %530 = OpFMul %527 %529 
                                                      OpStore %524 %530 
                                       f32_3 %531 = OpLoad %524 
                                       f32_3 %532 = OpExtInst %1 29 %531 
                                                      OpStore %524 %532 
                                       f32_3 %533 = OpLoad %524 
                                       f32_3 %536 = OpFMul %533 %535 
                                       f32_3 %539 = OpFAdd %536 %538 
                                                      OpStore %524 %539 
                                       f32_3 %540 = OpLoad %524 
                                       f32_3 %541 = OpExtInst %1 40 %540 %522 
                                       f32_4 %542 = OpLoad %120 
                                       f32_4 %543 = OpVectorShuffle %542 %541 4 5 6 3 
                                                      OpStore %120 %543 
                                Uniform i32* %545 = OpAccessChain %18 %20 
                                         i32 %546 = OpLoad %545 
                                        bool %547 = OpINotEqual %546 %20 
                                                      OpSelectionMerge %551 None 
                                                      OpBranchConditional %547 %550 %554 
                                             %550 = OpLabel 
                                       f32_4 %552 = OpLoad %120 
                                       f32_3 %553 = OpVectorShuffle %552 %552 0 1 2 
                                                      OpStore %549 %553 
                                                      OpBranch %551 
                                             %554 = OpLabel 
                                       f32_4 %555 = OpLoad %510 
                                       f32_3 %556 = OpVectorShuffle %555 %555 0 1 2 
                                                      OpStore %549 %556 
                                                      OpBranch %551 
                                             %551 = OpLabel 
                                       f32_3 %557 = OpLoad %549 
                                                      OpStore %519 %557 
                                Private f32* %559 = OpAccessChain %510 %507 
                                         f32 %560 = OpLoad %559 
                                  Input f32* %562 = OpAccessChain %561 %507 
                                         f32 %563 = OpLoad %562 
                                         f32 %564 = OpFMul %560 %563 
                                                      OpStore %558 %564 
                                Private f32* %565 = OpAccessChain %9 %24 
                                         f32 %566 = OpLoad %565 
                                         f32 %567 = OpLoad %558 
                                         f32 %568 = OpFMul %566 %567 
                                Private f32* %569 = OpAccessChain %9 %24 
                                                      OpStore %569 %568 
                                       f32_3 %570 = OpLoad %246 
                                       f32_2 %571 = OpVectorShuffle %570 %570 0 2 
                                       f32_3 %572 = OpLoad %9 
                                       f32_2 %573 = OpVectorShuffle %572 %572 0 2 
                                       f32_2 %574 = OpFMul %571 %573 
                                       f32_3 %575 = OpLoad %9 
                                       f32_3 %576 = OpVectorShuffle %575 %574 3 1 4 
                                                      OpStore %9 %576 
                                Private f32* %577 = OpAccessChain %246 %200 
                                         f32 %578 = OpLoad %577 
                                Private f32* %579 = OpAccessChain %9 %24 
                                         f32 %580 = OpLoad %579 
                                         f32 %581 = OpFMul %578 %580 
                                Private f32* %582 = OpAccessChain %9 %24 
                                                      OpStore %582 %581 
                                Private f32* %585 = OpAccessChain %9 %24 
                                         f32 %586 = OpLoad %585 
                                 Output f32* %588 = OpAccessChain %584 %507 
                                                      OpStore %588 %586 
                                       f32_3 %589 = OpLoad %519 
                                       f32_4 %590 = OpLoad %561 
                                       f32_3 %591 = OpVectorShuffle %590 %590 0 1 2 
                                       f32_3 %592 = OpFMul %589 %591 
                                                      OpStore %519 %592 
                                       f32_3 %593 = OpLoad %9 
                                       f32_3 %594 = OpVectorShuffle %593 %593 2 2 2 
                                       f32_3 %595 = OpLoad %519 
                                       f32_3 %596 = OpFMul %594 %595 
                                                      OpStore %9 %596 
                                Uniform i32* %597 = OpAccessChain %18 %69 
                                         i32 %598 = OpLoad %597 
                                        bool %600 = OpINotEqual %598 %599 
                                                      OpStore %285 %600 
                                        bool %601 = OpLoad %285 
                                                      OpSelectionMerge %604 None 
                                                      OpBranchConditional %601 %603 %606 
                                             %603 = OpLabel 
                                       f32_3 %605 = OpLoad %9 
                                                      OpStore %602 %605 
                                                      OpBranch %604 
                                             %606 = OpLabel 
                                       f32_3 %607 = OpLoad %519 
                                                      OpStore %602 %607 
                                                      OpBranch %604 
                                             %604 = OpLabel 
                                       f32_3 %608 = OpLoad %602 
                                       f32_4 %609 = OpLoad %584 
                                       f32_4 %610 = OpVectorShuffle %609 %608 4 5 6 3 
                                                      OpStore %584 %610 
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
 Pass {
  Blend Zero Zero, Zero Zero
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 99788
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat0.xy;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat0.xx + u_xlat2.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	int _ManualTex2SRGB;
uniform 	int _SrcBlend;
uniform 	float _CornerRadiuses[4];
uniform 	float _BorderWidths[4];
uniform 	float _Rect[4];
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bvec2 u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
ivec2 u_xlati2;
vec3 u_xlat3;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bvec3 u_xlatb6;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
bool u_xlatb13;
vec2 u_xlat15;
vec2 u_xlat16;
float u_xlat18;
bool u_xlatb18;
int u_xlati19;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.x = _BorderWidths[0];
    u_xlat1.x = _BorderWidths[2];
    u_xlat12 = vs_TEXCOORD2.x + (-_Rect[0]);
    u_xlat12 = (-_Rect[2]) * 0.5 + u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=u_xlat12);
#else
    u_xlatb12 = 0.0>=u_xlat12;
#endif
    u_xlat18 = _Rect[0] + _Rect[2];
    u_xlat13 = vs_TEXCOORD2.y + (-_Rect[1]);
    u_xlat13 = (-_Rect[3]) * 0.5 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.0>=u_xlat13);
#else
    u_xlatb13 = 0.0>=u_xlat13;
#endif
    u_xlati2.xy = (bool(u_xlatb13)) ? ivec2(0, 1) : ivec2(3, 2);
    u_xlati19 = (u_xlatb12) ? u_xlati2.x : u_xlati2.y;
    u_xlat1.y = u_xlat18 + (-_CornerRadiuses[u_xlati19]);
    u_xlat0.y = _Rect[0] + _CornerRadiuses[u_xlati19];
    u_xlat2.xy = (bool(u_xlatb12)) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat15.x = _BorderWidths[1];
    u_xlat16.x = _BorderWidths[3];
    u_xlat0.x = _Rect[1] + _Rect[3];
    u_xlat16.y = u_xlat0.x + (-_CornerRadiuses[u_xlati19]);
    u_xlat15.y = _Rect[1] + _CornerRadiuses[u_xlati19];
    u_xlat2.zw = (bool(u_xlatb13)) ? u_xlat15.xy : u_xlat16.xy;
    u_xlat0.xy = (-u_xlat2.xz) + vec2(_CornerRadiuses[u_xlati19]);
    u_xlat18 = u_xlat0.x / u_xlat0.y;
    u_xlat3.xy = (-u_xlat2.yw) + vs_TEXCOORD2.xy;
    u_xlat3.z = u_xlat18 * u_xlat3.y;
    u_xlat18 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat1.x = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + (-_CornerRadiuses[u_xlati19]);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = (-u_xlat0.x) + u_xlat18;
    u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
    u_xlat6.x = dFdx(vs_TEXCOORD2.x);
    u_xlat6.x = float(1.0) / abs(u_xlat6.x);
    u_xlat18 = u_xlat18 * u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat1.x * u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat0.x = (u_xlatb0.x) ? u_xlat18 : 1.0;
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat2.xzxx).xy;
    u_xlatb18 = u_xlatb1.y || u_xlatb1.x;
    u_xlat0.x = u_xlatb18 ? u_xlat0.x : float(0.0);
    u_xlat6.x = u_xlatb18 ? u_xlat6.x : float(0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat6.x==0.0);
#else
    u_xlatb18 = u_xlat6.x==0.0;
#endif
    u_xlat6.x = (-u_xlat6.x) + 1.0;
    u_xlat0.x = (u_xlatb18) ? u_xlat0.x : u_xlat6.x;
    u_xlatb6.xz = greaterThanEqual(u_xlat2.yyww, vs_TEXCOORD2.xxyy).xz;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD2.xyxx, u_xlat2.ywyy).xy;
    u_xlatb6.x = (u_xlatb12) ? u_xlatb6.x : u_xlatb1.x;
    u_xlatb12 = (u_xlatb13) ? u_xlatb6.z : u_xlatb1.y;
    u_xlatb6.x = u_xlatb12 && u_xlatb6.x;
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : 1.0;
    u_xlat12 = _BorderWidths[0] + _BorderWidths[2];
    u_xlat12 = (-u_xlat12) + _Rect[2];
    u_xlat18 = _BorderWidths[0] + _Rect[0];
    u_xlat12 = u_xlat12 + u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vs_TEXCOORD2.x>=u_xlat18);
#else
    u_xlatb18 = vs_TEXCOORD2.x>=u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat12>=vs_TEXCOORD2.x);
#else
    u_xlatb12 = u_xlat12>=vs_TEXCOORD2.x;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb18;
    u_xlat18 = _BorderWidths[1] + _Rect[1];
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(vs_TEXCOORD2.y>=u_xlat18);
#else
    u_xlatb1.x = vs_TEXCOORD2.y>=u_xlat18;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb1.x;
    u_xlat1.x = _BorderWidths[1] + _BorderWidths[3];
    u_xlat1.x = (-u_xlat1.x) + _Rect[3];
    u_xlat18 = u_xlat18 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18>=vs_TEXCOORD2.y);
#else
    u_xlatb18 = u_xlat18>=vs_TEXCOORD2.y;
#endif
    u_xlatb12 = u_xlatb18 && u_xlatb12;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat6.x = (u_xlatb6.x) ? 1.0 : u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0<_BorderWidths[0]);
#else
    u_xlatb12 = 0.0<_BorderWidths[0];
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[1]);
#else
    u_xlatb18 = 0.0<_BorderWidths[1];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[2]);
#else
    u_xlatb18 = 0.0<_BorderWidths[2];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[3]);
#else
    u_xlatb18 = 0.0<_BorderWidths[3];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
    u_xlat6.x = (u_xlatb12) ? u_xlat6.x : 1.0;
    u_xlat0.z = u_xlat6.x * u_xlat0.x;
    u_xlat6.z = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_5.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = log2(u_xlat16_5.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = (_ManualTex2SRGB != 0) ? u_xlat2.xyz : u_xlat16_1.xyz;
    u_xlat16_23 = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * u_xlat16_23;
    u_xlat0.xz = u_xlat6.xz * u_xlat0.xz;
    u_xlat0.x = u_xlat6.z * u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.zzz * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_SrcBlend!=5);
#else
    u_xlatb18 = _SrcBlend!=5;
#endif
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat16_5.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat0.xy;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat0.xx + u_xlat2.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	int _ManualTex2SRGB;
uniform 	int _SrcBlend;
uniform 	float _CornerRadiuses[4];
uniform 	float _BorderWidths[4];
uniform 	float _Rect[4];
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bvec2 u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
ivec2 u_xlati2;
vec3 u_xlat3;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bvec3 u_xlatb6;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
bool u_xlatb13;
vec2 u_xlat15;
vec2 u_xlat16;
float u_xlat18;
bool u_xlatb18;
int u_xlati19;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.x = _BorderWidths[0];
    u_xlat1.x = _BorderWidths[2];
    u_xlat12 = vs_TEXCOORD2.x + (-_Rect[0]);
    u_xlat12 = (-_Rect[2]) * 0.5 + u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=u_xlat12);
#else
    u_xlatb12 = 0.0>=u_xlat12;
#endif
    u_xlat18 = _Rect[0] + _Rect[2];
    u_xlat13 = vs_TEXCOORD2.y + (-_Rect[1]);
    u_xlat13 = (-_Rect[3]) * 0.5 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.0>=u_xlat13);
#else
    u_xlatb13 = 0.0>=u_xlat13;
#endif
    u_xlati2.xy = (bool(u_xlatb13)) ? ivec2(0, 1) : ivec2(3, 2);
    u_xlati19 = (u_xlatb12) ? u_xlati2.x : u_xlati2.y;
    u_xlat1.y = u_xlat18 + (-_CornerRadiuses[u_xlati19]);
    u_xlat0.y = _Rect[0] + _CornerRadiuses[u_xlati19];
    u_xlat2.xy = (bool(u_xlatb12)) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat15.x = _BorderWidths[1];
    u_xlat16.x = _BorderWidths[3];
    u_xlat0.x = _Rect[1] + _Rect[3];
    u_xlat16.y = u_xlat0.x + (-_CornerRadiuses[u_xlati19]);
    u_xlat15.y = _Rect[1] + _CornerRadiuses[u_xlati19];
    u_xlat2.zw = (bool(u_xlatb13)) ? u_xlat15.xy : u_xlat16.xy;
    u_xlat0.xy = (-u_xlat2.xz) + vec2(_CornerRadiuses[u_xlati19]);
    u_xlat18 = u_xlat0.x / u_xlat0.y;
    u_xlat3.xy = (-u_xlat2.yw) + vs_TEXCOORD2.xy;
    u_xlat3.z = u_xlat18 * u_xlat3.y;
    u_xlat18 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat1.x = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + (-_CornerRadiuses[u_xlati19]);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = (-u_xlat0.x) + u_xlat18;
    u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
    u_xlat6.x = dFdx(vs_TEXCOORD2.x);
    u_xlat6.x = float(1.0) / abs(u_xlat6.x);
    u_xlat18 = u_xlat18 * u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat1.x * u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat0.x = (u_xlatb0.x) ? u_xlat18 : 1.0;
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat2.xzxx).xy;
    u_xlatb18 = u_xlatb1.y || u_xlatb1.x;
    u_xlat0.x = u_xlatb18 ? u_xlat0.x : float(0.0);
    u_xlat6.x = u_xlatb18 ? u_xlat6.x : float(0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat6.x==0.0);
#else
    u_xlatb18 = u_xlat6.x==0.0;
#endif
    u_xlat6.x = (-u_xlat6.x) + 1.0;
    u_xlat0.x = (u_xlatb18) ? u_xlat0.x : u_xlat6.x;
    u_xlatb6.xz = greaterThanEqual(u_xlat2.yyww, vs_TEXCOORD2.xxyy).xz;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD2.xyxx, u_xlat2.ywyy).xy;
    u_xlatb6.x = (u_xlatb12) ? u_xlatb6.x : u_xlatb1.x;
    u_xlatb12 = (u_xlatb13) ? u_xlatb6.z : u_xlatb1.y;
    u_xlatb6.x = u_xlatb12 && u_xlatb6.x;
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : 1.0;
    u_xlat12 = _BorderWidths[0] + _BorderWidths[2];
    u_xlat12 = (-u_xlat12) + _Rect[2];
    u_xlat18 = _BorderWidths[0] + _Rect[0];
    u_xlat12 = u_xlat12 + u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vs_TEXCOORD2.x>=u_xlat18);
#else
    u_xlatb18 = vs_TEXCOORD2.x>=u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat12>=vs_TEXCOORD2.x);
#else
    u_xlatb12 = u_xlat12>=vs_TEXCOORD2.x;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb18;
    u_xlat18 = _BorderWidths[1] + _Rect[1];
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(vs_TEXCOORD2.y>=u_xlat18);
#else
    u_xlatb1.x = vs_TEXCOORD2.y>=u_xlat18;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb1.x;
    u_xlat1.x = _BorderWidths[1] + _BorderWidths[3];
    u_xlat1.x = (-u_xlat1.x) + _Rect[3];
    u_xlat18 = u_xlat18 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18>=vs_TEXCOORD2.y);
#else
    u_xlatb18 = u_xlat18>=vs_TEXCOORD2.y;
#endif
    u_xlatb12 = u_xlatb18 && u_xlatb12;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat6.x = (u_xlatb6.x) ? 1.0 : u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0<_BorderWidths[0]);
#else
    u_xlatb12 = 0.0<_BorderWidths[0];
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[1]);
#else
    u_xlatb18 = 0.0<_BorderWidths[1];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[2]);
#else
    u_xlatb18 = 0.0<_BorderWidths[2];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[3]);
#else
    u_xlatb18 = 0.0<_BorderWidths[3];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
    u_xlat6.x = (u_xlatb12) ? u_xlat6.x : 1.0;
    u_xlat0.z = u_xlat6.x * u_xlat0.x;
    u_xlat6.z = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_5.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = log2(u_xlat16_5.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = (_ManualTex2SRGB != 0) ? u_xlat2.xyz : u_xlat16_1.xyz;
    u_xlat16_23 = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * u_xlat16_23;
    u_xlat0.xz = u_xlat6.xz * u_xlat0.xz;
    u_xlat0.x = u_xlat6.z * u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.zzz * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_SrcBlend!=5);
#else
    u_xlatb18 = _SrcBlend!=5;
#endif
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat16_5.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat0.xy;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat0.xx + u_xlat2.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	int _ManualTex2SRGB;
uniform 	int _SrcBlend;
uniform 	float _CornerRadiuses[4];
uniform 	float _BorderWidths[4];
uniform 	float _Rect[4];
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bvec2 u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
ivec2 u_xlati2;
vec3 u_xlat3;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bvec3 u_xlatb6;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
bool u_xlatb13;
vec2 u_xlat15;
vec2 u_xlat16;
float u_xlat18;
bool u_xlatb18;
int u_xlati19;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.x = _BorderWidths[0];
    u_xlat1.x = _BorderWidths[2];
    u_xlat12 = vs_TEXCOORD2.x + (-_Rect[0]);
    u_xlat12 = (-_Rect[2]) * 0.5 + u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=u_xlat12);
#else
    u_xlatb12 = 0.0>=u_xlat12;
#endif
    u_xlat18 = _Rect[0] + _Rect[2];
    u_xlat13 = vs_TEXCOORD2.y + (-_Rect[1]);
    u_xlat13 = (-_Rect[3]) * 0.5 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.0>=u_xlat13);
#else
    u_xlatb13 = 0.0>=u_xlat13;
#endif
    u_xlati2.xy = (bool(u_xlatb13)) ? ivec2(0, 1) : ivec2(3, 2);
    u_xlati19 = (u_xlatb12) ? u_xlati2.x : u_xlati2.y;
    u_xlat1.y = u_xlat18 + (-_CornerRadiuses[u_xlati19]);
    u_xlat0.y = _Rect[0] + _CornerRadiuses[u_xlati19];
    u_xlat2.xy = (bool(u_xlatb12)) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat15.x = _BorderWidths[1];
    u_xlat16.x = _BorderWidths[3];
    u_xlat0.x = _Rect[1] + _Rect[3];
    u_xlat16.y = u_xlat0.x + (-_CornerRadiuses[u_xlati19]);
    u_xlat15.y = _Rect[1] + _CornerRadiuses[u_xlati19];
    u_xlat2.zw = (bool(u_xlatb13)) ? u_xlat15.xy : u_xlat16.xy;
    u_xlat0.xy = (-u_xlat2.xz) + vec2(_CornerRadiuses[u_xlati19]);
    u_xlat18 = u_xlat0.x / u_xlat0.y;
    u_xlat3.xy = (-u_xlat2.yw) + vs_TEXCOORD2.xy;
    u_xlat3.z = u_xlat18 * u_xlat3.y;
    u_xlat18 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat1.x = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + (-_CornerRadiuses[u_xlati19]);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = (-u_xlat0.x) + u_xlat18;
    u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
    u_xlat6.x = dFdx(vs_TEXCOORD2.x);
    u_xlat6.x = float(1.0) / abs(u_xlat6.x);
    u_xlat18 = u_xlat18 * u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat1.x * u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat0.x = (u_xlatb0.x) ? u_xlat18 : 1.0;
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat2.xzxx).xy;
    u_xlatb18 = u_xlatb1.y || u_xlatb1.x;
    u_xlat0.x = u_xlatb18 ? u_xlat0.x : float(0.0);
    u_xlat6.x = u_xlatb18 ? u_xlat6.x : float(0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat6.x==0.0);
#else
    u_xlatb18 = u_xlat6.x==0.0;
#endif
    u_xlat6.x = (-u_xlat6.x) + 1.0;
    u_xlat0.x = (u_xlatb18) ? u_xlat0.x : u_xlat6.x;
    u_xlatb6.xz = greaterThanEqual(u_xlat2.yyww, vs_TEXCOORD2.xxyy).xz;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD2.xyxx, u_xlat2.ywyy).xy;
    u_xlatb6.x = (u_xlatb12) ? u_xlatb6.x : u_xlatb1.x;
    u_xlatb12 = (u_xlatb13) ? u_xlatb6.z : u_xlatb1.y;
    u_xlatb6.x = u_xlatb12 && u_xlatb6.x;
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : 1.0;
    u_xlat12 = _BorderWidths[0] + _BorderWidths[2];
    u_xlat12 = (-u_xlat12) + _Rect[2];
    u_xlat18 = _BorderWidths[0] + _Rect[0];
    u_xlat12 = u_xlat12 + u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vs_TEXCOORD2.x>=u_xlat18);
#else
    u_xlatb18 = vs_TEXCOORD2.x>=u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat12>=vs_TEXCOORD2.x);
#else
    u_xlatb12 = u_xlat12>=vs_TEXCOORD2.x;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb18;
    u_xlat18 = _BorderWidths[1] + _Rect[1];
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(vs_TEXCOORD2.y>=u_xlat18);
#else
    u_xlatb1.x = vs_TEXCOORD2.y>=u_xlat18;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb1.x;
    u_xlat1.x = _BorderWidths[1] + _BorderWidths[3];
    u_xlat1.x = (-u_xlat1.x) + _Rect[3];
    u_xlat18 = u_xlat18 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18>=vs_TEXCOORD2.y);
#else
    u_xlatb18 = u_xlat18>=vs_TEXCOORD2.y;
#endif
    u_xlatb12 = u_xlatb18 && u_xlatb12;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat6.x = (u_xlatb6.x) ? 1.0 : u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0<_BorderWidths[0]);
#else
    u_xlatb12 = 0.0<_BorderWidths[0];
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[1]);
#else
    u_xlatb18 = 0.0<_BorderWidths[1];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[2]);
#else
    u_xlatb18 = 0.0<_BorderWidths[2];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[3]);
#else
    u_xlatb18 = 0.0<_BorderWidths[3];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
    u_xlat6.x = (u_xlatb12) ? u_xlat6.x : 1.0;
    u_xlat0.z = u_xlat6.x * u_xlat0.x;
    u_xlat6.z = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_5.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = log2(u_xlat16_5.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat16_2.xyz = exp2(u_xlat16_2.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = (_ManualTex2SRGB != 0) ? u_xlat2.xyz : u_xlat16_1.xyz;
    u_xlat16_23 = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * u_xlat16_23;
    u_xlat0.xz = u_xlat6.xz * u_xlat0.xz;
    u_xlat0.x = u_xlat6.z * u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.zzz * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_SrcBlend!=5);
#else
    u_xlatb18 = _SrcBlend!=5;
#endif
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat16_5.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 176
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %74 %84 %85 %149 %156 %158 %168 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpMemberDecorate %72 0 BuiltIn 72 
                                                      OpMemberDecorate %72 1 BuiltIn 72 
                                                      OpMemberDecorate %72 2 BuiltIn 72 
                                                      OpDecorate %72 Block 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 149 
                                                      OpDecorate vs_TEXCOORD0 Location 156 
                                                      OpDecorate %158 Location 158 
                                                      OpDecorate vs_TEXCOORD2 Location 168 
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
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeArray %7 %15 
                                              %20 = OpTypeStruct %16 %17 %18 %7 %19 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4[4];}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 0 
                                          i32 %25 = OpConstant 1 
                                              %26 = OpTypePointer Uniform %7 
                                          i32 %37 = OpConstant 2 
                                          i32 %46 = OpConstant 3 
                               Private f32_4* %50 = OpVariable Private 
                                          u32 %70 = OpConstant 1 
                                              %71 = OpTypeArray %6 %70 
                                              %72 = OpTypeStruct %7 %6 %71 
                                              %73 = OpTypePointer Output %72 
         Output struct {f32_4; f32; f32[1];}* %74 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                Output f32_4* %84 = OpVariable Output 
                                 Input f32_4* %85 = OpVariable Input 
                                              %87 = OpTypeVector %6 2 
                                             %129 = OpTypePointer Private %87 
                              Private f32_2* %130 = OpVariable Private 
                                         i32 %133 = OpConstant 4 
                                             %148 = OpTypePointer Output %87 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %157 = OpTypePointer Input %87 
                                Input f32_2* %158 = OpVariable Input 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                             %170 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %27 = OpAccessChain %22 %24 %25 
                                        f32_4 %28 = OpLoad %27 
                                        f32_4 %29 = OpFMul %13 %28 
                                                      OpStore %9 %29 
                               Uniform f32_4* %30 = OpAccessChain %22 %24 %24 
                                        f32_4 %31 = OpLoad %30 
                                        f32_4 %32 = OpLoad %11 
                                        f32_4 %33 = OpVectorShuffle %32 %32 0 0 0 0 
                                        f32_4 %34 = OpFMul %31 %33 
                                        f32_4 %35 = OpLoad %9 
                                        f32_4 %36 = OpFAdd %34 %35 
                                                      OpStore %9 %36 
                               Uniform f32_4* %38 = OpAccessChain %22 %24 %37 
                                        f32_4 %39 = OpLoad %38 
                                        f32_4 %40 = OpLoad %11 
                                        f32_4 %41 = OpVectorShuffle %40 %40 2 2 2 2 
                                        f32_4 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpFAdd %42 %43 
                                                      OpStore %9 %44 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %22 %24 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %9 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_4 %52 = OpVectorShuffle %51 %51 1 1 1 1 
                               Uniform f32_4* %53 = OpAccessChain %22 %37 %25 
                                        f32_4 %54 = OpLoad %53 
                                        f32_4 %55 = OpFMul %52 %54 
                                                      OpStore %50 %55 
                               Uniform f32_4* %56 = OpAccessChain %22 %37 %24 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                                        f32_4 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %50 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %50 %62 
                               Uniform f32_4* %63 = OpAccessChain %22 %37 %37 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpVectorShuffle %65 %65 2 2 2 2 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %50 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %50 %69 
                               Uniform f32_4* %75 = OpAccessChain %22 %37 %46 
                                        f32_4 %76 = OpLoad %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpVectorShuffle %77 %77 3 3 3 3 
                                        f32_4 %79 = OpFMul %76 %78 
                                        f32_4 %80 = OpLoad %50 
                                        f32_4 %81 = OpFAdd %79 %80 
                                Output f32_4* %83 = OpAccessChain %74 %24 
                                                      OpStore %83 %81 
                                        f32_4 %86 = OpLoad %85 
                                                      OpStore %84 %86 
                                        f32_4 %88 = OpLoad %9 
                                        f32_2 %89 = OpVectorShuffle %88 %88 1 1 
                               Uniform f32_4* %90 = OpAccessChain %22 %25 %25 
                                        f32_4 %91 = OpLoad %90 
                                        f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                        f32_2 %93 = OpFMul %89 %92 
                                        f32_4 %94 = OpLoad %50 
                                        f32_4 %95 = OpVectorShuffle %94 %93 4 5 2 3 
                                                      OpStore %50 %95 
                               Uniform f32_4* %96 = OpAccessChain %22 %25 %24 
                                        f32_4 %97 = OpLoad %96 
                                        f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                                        f32_4 %99 = OpLoad %9 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 0 
                                       f32_2 %101 = OpFMul %98 %100 
                                       f32_4 %102 = OpLoad %50 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFAdd %101 %103 
                                       f32_4 %105 = OpLoad %9 
                                       f32_4 %106 = OpVectorShuffle %105 %104 4 5 2 3 
                                                      OpStore %9 %106 
                              Uniform f32_4* %107 = OpAccessChain %22 %25 %37 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                       f32_4 %110 = OpLoad %9 
                                       f32_2 %111 = OpVectorShuffle %110 %110 2 2 
                                       f32_2 %112 = OpFMul %109 %111 
                                       f32_4 %113 = OpLoad %9 
                                       f32_2 %114 = OpVectorShuffle %113 %113 0 1 
                                       f32_2 %115 = OpFAdd %112 %114 
                                       f32_4 %116 = OpLoad %9 
                                       f32_4 %117 = OpVectorShuffle %116 %115 4 5 2 3 
                                                      OpStore %9 %117 
                              Uniform f32_4* %118 = OpAccessChain %22 %25 %46 
                                       f32_4 %119 = OpLoad %118 
                                       f32_2 %120 = OpVectorShuffle %119 %119 0 1 
                                       f32_4 %121 = OpLoad %9 
                                       f32_2 %122 = OpVectorShuffle %121 %121 3 3 
                                       f32_2 %123 = OpFMul %120 %122 
                                       f32_4 %124 = OpLoad %9 
                                       f32_2 %125 = OpVectorShuffle %124 %124 0 1 
                                       f32_2 %126 = OpFAdd %123 %125 
                                       f32_4 %127 = OpLoad %9 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 2 3 
                                                      OpStore %9 %128 
                                       f32_4 %131 = OpLoad %9 
                                       f32_2 %132 = OpVectorShuffle %131 %131 1 1 
                              Uniform f32_4* %134 = OpAccessChain %22 %133 %25 
                                       f32_4 %135 = OpLoad %134 
                                       f32_2 %136 = OpVectorShuffle %135 %135 0 1 
                                       f32_2 %137 = OpFMul %132 %136 
                                                      OpStore %130 %137 
                              Uniform f32_4* %138 = OpAccessChain %22 %133 %24 
                                       f32_4 %139 = OpLoad %138 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_4 %141 = OpLoad %9 
                                       f32_2 %142 = OpVectorShuffle %141 %141 0 0 
                                       f32_2 %143 = OpFMul %140 %142 
                                       f32_2 %144 = OpLoad %130 
                                       f32_2 %145 = OpFAdd %143 %144 
                                       f32_4 %146 = OpLoad %9 
                                       f32_4 %147 = OpVectorShuffle %146 %145 4 5 2 3 
                                                      OpStore %9 %147 
                                       f32_4 %150 = OpLoad %9 
                                       f32_2 %151 = OpVectorShuffle %150 %150 0 1 
                              Uniform f32_4* %152 = OpAccessChain %22 %133 %46 
                                       f32_4 %153 = OpLoad %152 
                                       f32_2 %154 = OpVectorShuffle %153 %153 0 1 
                                       f32_2 %155 = OpFAdd %151 %154 
                                                      OpStore vs_TEXCOORD1 %155 
                                       f32_2 %159 = OpLoad %158 
                              Uniform f32_4* %160 = OpAccessChain %22 %46 
                                       f32_4 %161 = OpLoad %160 
                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                       f32_2 %163 = OpFMul %159 %162 
                              Uniform f32_4* %164 = OpAccessChain %22 %46 
                                       f32_4 %165 = OpLoad %164 
                                       f32_2 %166 = OpVectorShuffle %165 %165 2 3 
                                       f32_2 %167 = OpFAdd %163 %166 
                                                      OpStore vs_TEXCOORD0 %167 
                                       f32_4 %169 = OpLoad %11 
                                                      OpStore vs_TEXCOORD2 %169 
                                 Output f32* %171 = OpAccessChain %74 %24 %70 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpFNegate %172 
                                 Output f32* %174 = OpAccessChain %74 %24 %70 
                                                      OpStore %174 %173 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 612
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %37 %504 %516 %561 %584 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpMemberDecorate %16 0 Offset 16 
                                                      OpMemberDecorate %16 1 Offset 16 
                                                      OpMemberDecorate %16 2 Offset 16 
                                                      OpMemberDecorate %16 3 Offset 16 
                                                      OpMemberDecorate %16 4 Offset 16 
                                                      OpDecorate %16 Block 
                                                      OpDecorate %18 DescriptorSet 18 
                                                      OpDecorate %18 Binding 18 
                                                      OpDecorate vs_TEXCOORD2 Location 37 
                                                      OpDecorate %495 RelaxedPrecision 
                                                      OpDecorate %495 DescriptorSet 495 
                                                      OpDecorate %495 Binding 495 
                                                      OpDecorate %496 RelaxedPrecision 
                                                      OpDecorate %499 RelaxedPrecision 
                                                      OpDecorate %499 DescriptorSet 499 
                                                      OpDecorate %499 Binding 499 
                                                      OpDecorate %500 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 504 
                                                      OpDecorate %510 RelaxedPrecision 
                                                      OpDecorate %511 RelaxedPrecision 
                                                      OpDecorate %511 DescriptorSet 511 
                                                      OpDecorate %511 Binding 511 
                                                      OpDecorate %512 RelaxedPrecision 
                                                      OpDecorate %513 RelaxedPrecision 
                                                      OpDecorate %513 DescriptorSet 513 
                                                      OpDecorate %513 Binding 513 
                                                      OpDecorate %514 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 516 
                                                      OpDecorate %519 RelaxedPrecision 
                                                      OpDecorate %520 RelaxedPrecision 
                                                      OpDecorate %521 RelaxedPrecision 
                                                      OpDecorate %523 RelaxedPrecision 
                                                      OpDecorate %524 RelaxedPrecision 
                                                      OpDecorate %525 RelaxedPrecision 
                                                      OpDecorate %526 RelaxedPrecision 
                                                      OpDecorate %527 RelaxedPrecision 
                                                      OpDecorate %530 RelaxedPrecision 
                                                      OpDecorate %531 RelaxedPrecision 
                                                      OpDecorate %532 RelaxedPrecision 
                                                      OpDecorate %533 RelaxedPrecision 
                                                      OpDecorate %536 RelaxedPrecision 
                                                      OpDecorate %539 RelaxedPrecision 
                                                      OpDecorate %540 RelaxedPrecision 
                                                      OpDecorate %541 RelaxedPrecision 
                                                      OpDecorate %555 RelaxedPrecision 
                                                      OpDecorate %556 RelaxedPrecision 
                                                      OpDecorate %558 RelaxedPrecision 
                                                      OpDecorate %560 RelaxedPrecision 
                                                      OpDecorate %561 RelaxedPrecision 
                                                      OpDecorate %561 Location 561 
                                                      OpDecorate %563 RelaxedPrecision 
                                                      OpDecorate %564 RelaxedPrecision 
                                                      OpDecorate %567 RelaxedPrecision 
                                                      OpDecorate %584 RelaxedPrecision 
                                                      OpDecorate %584 Location 584 
                                                      OpDecorate %589 RelaxedPrecision 
                                                      OpDecorate %590 RelaxedPrecision 
                                                      OpDecorate %591 RelaxedPrecision 
                                                      OpDecorate %592 RelaxedPrecision 
                                                      OpDecorate %595 RelaxedPrecision 
                                                      OpDecorate %607 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 1 
                                              %11 = OpTypeInt 32 0 
                                          u32 %12 = OpConstant 4 
                                              %13 = OpTypeArray %6 %12 
                                              %14 = OpTypeArray %6 %12 
                                              %15 = OpTypeArray %6 %12 
                                              %16 = OpTypeStruct %10 %10 %13 %14 %15 
                                              %17 = OpTypePointer Uniform %16 
Uniform struct {i32; i32; f32[4]; f32[4]; f32[4];}* %18 = OpVariable Uniform 
                                          i32 %19 = OpConstant 3 
                                          i32 %20 = OpConstant 0 
                                              %21 = OpTypePointer Uniform %6 
                                          u32 %24 = OpConstant 0 
                                              %25 = OpTypePointer Private %6 
                                              %27 = OpTypeVector %6 2 
                                              %28 = OpTypePointer Private %27 
                               Private f32_2* %29 = OpVariable Private 
                                          i32 %30 = OpConstant 2 
                                 Private f32* %34 = OpVariable Private 
                                              %35 = OpTypeVector %6 4 
                                              %36 = OpTypePointer Input %35 
                        Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                              %38 = OpTypePointer Input %6 
                                          i32 %41 = OpConstant 4 
                                          f32 %49 = OpConstant 3.674022E-40 
                                              %53 = OpTypeBool 
                                              %54 = OpTypePointer Private %53 
                                Private bool* %55 = OpVariable Private 
                                          f32 %56 = OpConstant 3.674022E-40 
                                 Private f32* %59 = OpVariable Private 
                                 Private f32* %65 = OpVariable Private 
                                          u32 %66 = OpConstant 1 
                                          i32 %69 = OpConstant 1 
                                Private bool* %80 = OpVariable Private 
                                              %83 = OpTypeVector %10 2 
                                              %84 = OpTypePointer Private %83 
                               Private i32_2* %85 = OpVariable Private 
                                        i32_2 %87 = OpConstantComposite %20 %69 
                                        i32_2 %88 = OpConstantComposite %19 %30 
                                              %89 = OpTypeVector %53 2 
                                              %92 = OpTypePointer Private %10 
                                 Private i32* %93 = OpVariable Private 
                                              %95 = OpTypePointer Function %10 
                                             %119 = OpTypePointer Private %35 
                              Private f32_4* %120 = OpVariable Private 
                                             %122 = OpTypePointer Function %27 
                              Private f32_2* %133 = OpVariable Private 
                              Private f32_2* %137 = OpVariable Private 
                              Private f32_3* %187 = OpVariable Private 
                                         u32 %200 = OpConstant 2 
                                             %232 = OpTypePointer Private %89 
                             Private bool_2* %233 = OpVariable Private 
                                       f32_4 %234 = OpConstantComposite %56 %56 %56 %56 
                                             %237 = OpTypeVector %53 4 
                              Private f32_3* %246 = OpVariable Private 
                                         f32 %251 = OpConstant 3.674022E-40 
                             Private bool_2* %280 = OpVariable Private 
                               Private bool* %285 = OpVariable Private 
                                             %292 = OpTypePointer Function %6 
                                             %329 = OpTypeVector %53 3 
                                             %330 = OpTypePointer Private %329 
                             Private bool_3* %331 = OpVariable Private 
                                             %347 = OpTypePointer Function %53 
                                             %493 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %494 = OpTypePointer UniformConstant %493 
        UniformConstant read_only Texture2D* %495 = OpVariable UniformConstant 
                                             %497 = OpTypeSampler 
                                             %498 = OpTypePointer UniformConstant %497 
                    UniformConstant sampler* %499 = OpVariable UniformConstant 
                                             %501 = OpTypeSampledImage %493 
                                             %503 = OpTypePointer Input %27 
                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                         u32 %507 = OpConstant 3 
                              Private f32_4* %510 = OpVariable Private 
        UniformConstant read_only Texture2D* %511 = OpVariable UniformConstant 
                    UniformConstant sampler* %513 = OpVariable UniformConstant 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                              Private f32_3* %519 = OpVariable Private 
                                       f32_3 %522 = OpConstantComposite %56 %56 %56 
                              Private f32_3* %524 = OpVariable Private 
                                         f32 %528 = OpConstant 3.674022E-40 
                                       f32_3 %529 = OpConstantComposite %528 %528 %528 
                                         f32 %534 = OpConstant 3.674022E-40 
                                       f32_3 %535 = OpConstantComposite %534 %534 %534 
                                         f32 %537 = OpConstant 3.674022E-40 
                                       f32_3 %538 = OpConstantComposite %537 %537 %537 
                                             %544 = OpTypePointer Uniform %10 
                                             %548 = OpTypePointer Function %7 
                                Private f32* %558 = OpVariable Private 
                                Input f32_4* %561 = OpVariable Input 
                                             %583 = OpTypePointer Output %35 
                               Output f32_4* %584 = OpVariable Output 
                                             %587 = OpTypePointer Output %6 
                                         i32 %599 = OpConstant 5 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function i32* %96 = OpVariable Function 
                             Function f32_2* %123 = OpVariable Function 
                             Function f32_2* %163 = OpVariable Function 
                               Function f32* %293 = OpVariable Function 
                               Function f32* %302 = OpVariable Function 
                               Function f32* %319 = OpVariable Function 
                              Function bool* %348 = OpVariable Function 
                              Function bool* %359 = OpVariable Function 
                               Function f32* %375 = OpVariable Function 
                               Function f32* %479 = OpVariable Function 
                             Function f32_3* %549 = OpVariable Function 
                             Function f32_3* %602 = OpVariable Function 
                                 Uniform f32* %22 = OpAccessChain %18 %19 %20 
                                          f32 %23 = OpLoad %22 
                                 Private f32* %26 = OpAccessChain %9 %24 
                                                      OpStore %26 %23 
                                 Uniform f32* %31 = OpAccessChain %18 %19 %30 
                                          f32 %32 = OpLoad %31 
                                 Private f32* %33 = OpAccessChain %29 %24 
                                                      OpStore %33 %32 
                                   Input f32* %39 = OpAccessChain vs_TEXCOORD2 %24 
                                          f32 %40 = OpLoad %39 
                                 Uniform f32* %42 = OpAccessChain %18 %41 %20 
                                          f32 %43 = OpLoad %42 
                                          f32 %44 = OpFNegate %43 
                                          f32 %45 = OpFAdd %40 %44 
                                                      OpStore %34 %45 
                                 Uniform f32* %46 = OpAccessChain %18 %41 %30 
                                          f32 %47 = OpLoad %46 
                                          f32 %48 = OpFNegate %47 
                                          f32 %50 = OpFMul %48 %49 
                                          f32 %51 = OpLoad %34 
                                          f32 %52 = OpFAdd %50 %51 
                                                      OpStore %34 %52 
                                          f32 %57 = OpLoad %34 
                                         bool %58 = OpFOrdGreaterThanEqual %56 %57 
                                                      OpStore %55 %58 
                                 Uniform f32* %60 = OpAccessChain %18 %41 %20 
                                          f32 %61 = OpLoad %60 
                                 Uniform f32* %62 = OpAccessChain %18 %41 %30 
                                          f32 %63 = OpLoad %62 
                                          f32 %64 = OpFAdd %61 %63 
                                                      OpStore %59 %64 
                                   Input f32* %67 = OpAccessChain vs_TEXCOORD2 %66 
                                          f32 %68 = OpLoad %67 
                                 Uniform f32* %70 = OpAccessChain %18 %41 %69 
                                          f32 %71 = OpLoad %70 
                                          f32 %72 = OpFNegate %71 
                                          f32 %73 = OpFAdd %68 %72 
                                                      OpStore %65 %73 
                                 Uniform f32* %74 = OpAccessChain %18 %41 %19 
                                          f32 %75 = OpLoad %74 
                                          f32 %76 = OpFNegate %75 
                                          f32 %77 = OpFMul %76 %49 
                                          f32 %78 = OpLoad %65 
                                          f32 %79 = OpFAdd %77 %78 
                                                      OpStore %65 %79 
                                          f32 %81 = OpLoad %65 
                                         bool %82 = OpFOrdGreaterThanEqual %56 %81 
                                                      OpStore %80 %82 
                                         bool %86 = OpLoad %80 
                                       bool_2 %90 = OpCompositeConstruct %86 %86 
                                        i32_2 %91 = OpSelect %90 %87 %88 
                                                      OpStore %85 %91 
                                         bool %94 = OpLoad %55 
                                                      OpSelectionMerge %98 None 
                                                      OpBranchConditional %94 %97 %101 
                                              %97 = OpLabel 
                                 Private i32* %99 = OpAccessChain %85 %24 
                                         i32 %100 = OpLoad %99 
                                                      OpStore %96 %100 
                                                      OpBranch %98 
                                             %101 = OpLabel 
                                Private i32* %102 = OpAccessChain %85 %66 
                                         i32 %103 = OpLoad %102 
                                                      OpStore %96 %103 
                                                      OpBranch %98 
                                              %98 = OpLabel 
                                         i32 %104 = OpLoad %96 
                                                      OpStore %93 %104 
                                         f32 %105 = OpLoad %59 
                                         i32 %106 = OpLoad %93 
                                Uniform f32* %107 = OpAccessChain %18 %30 %106 
                                         f32 %108 = OpLoad %107 
                                         f32 %109 = OpFNegate %108 
                                         f32 %110 = OpFAdd %105 %109 
                                Private f32* %111 = OpAccessChain %29 %66 
                                                      OpStore %111 %110 
                                Uniform f32* %112 = OpAccessChain %18 %41 %20 
                                         f32 %113 = OpLoad %112 
                                         i32 %114 = OpLoad %93 
                                Uniform f32* %115 = OpAccessChain %18 %30 %114 
                                         f32 %116 = OpLoad %115 
                                         f32 %117 = OpFAdd %113 %116 
                                Private f32* %118 = OpAccessChain %9 %66 
                                                      OpStore %118 %117 
                                        bool %121 = OpLoad %55 
                                                      OpSelectionMerge %125 None 
                                                      OpBranchConditional %121 %124 %128 
                                             %124 = OpLabel 
                                       f32_3 %126 = OpLoad %9 
                                       f32_2 %127 = OpVectorShuffle %126 %126 0 1 
                                                      OpStore %123 %127 
                                                      OpBranch %125 
                                             %128 = OpLabel 
                                       f32_2 %129 = OpLoad %29 
                                                      OpStore %123 %129 
                                                      OpBranch %125 
                                             %125 = OpLabel 
                                       f32_2 %130 = OpLoad %123 
                                       f32_4 %131 = OpLoad %120 
                                       f32_4 %132 = OpVectorShuffle %131 %130 4 5 2 3 
                                                      OpStore %120 %132 
                                Uniform f32* %134 = OpAccessChain %18 %19 %69 
                                         f32 %135 = OpLoad %134 
                                Private f32* %136 = OpAccessChain %133 %24 
                                                      OpStore %136 %135 
                                Uniform f32* %138 = OpAccessChain %18 %19 %19 
                                         f32 %139 = OpLoad %138 
                                Private f32* %140 = OpAccessChain %137 %24 
                                                      OpStore %140 %139 
                                Uniform f32* %141 = OpAccessChain %18 %41 %69 
                                         f32 %142 = OpLoad %141 
                                Uniform f32* %143 = OpAccessChain %18 %41 %19 
                                         f32 %144 = OpLoad %143 
                                         f32 %145 = OpFAdd %142 %144 
                                Private f32* %146 = OpAccessChain %9 %24 
                                                      OpStore %146 %145 
                                Private f32* %147 = OpAccessChain %9 %24 
                                         f32 %148 = OpLoad %147 
                                         i32 %149 = OpLoad %93 
                                Uniform f32* %150 = OpAccessChain %18 %30 %149 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFNegate %151 
                                         f32 %153 = OpFAdd %148 %152 
                                Private f32* %154 = OpAccessChain %137 %66 
                                                      OpStore %154 %153 
                                Uniform f32* %155 = OpAccessChain %18 %41 %69 
                                         f32 %156 = OpLoad %155 
                                         i32 %157 = OpLoad %93 
                                Uniform f32* %158 = OpAccessChain %18 %30 %157 
                                         f32 %159 = OpLoad %158 
                                         f32 %160 = OpFAdd %156 %159 
                                Private f32* %161 = OpAccessChain %133 %66 
                                                      OpStore %161 %160 
                                        bool %162 = OpLoad %80 
                                                      OpSelectionMerge %165 None 
                                                      OpBranchConditional %162 %164 %167 
                                             %164 = OpLabel 
                                       f32_2 %166 = OpLoad %133 
                                                      OpStore %163 %166 
                                                      OpBranch %165 
                                             %167 = OpLabel 
                                       f32_2 %168 = OpLoad %137 
                                                      OpStore %163 %168 
                                                      OpBranch %165 
                                             %165 = OpLabel 
                                       f32_2 %169 = OpLoad %163 
                                       f32_4 %170 = OpLoad %120 
                                       f32_4 %171 = OpVectorShuffle %170 %169 0 1 4 5 
                                                      OpStore %120 %171 
                                       f32_4 %172 = OpLoad %120 
                                       f32_2 %173 = OpVectorShuffle %172 %172 0 2 
                                       f32_2 %174 = OpFNegate %173 
                                         i32 %175 = OpLoad %93 
                                Uniform f32* %176 = OpAccessChain %18 %30 %175 
                                         f32 %177 = OpLoad %176 
                                       f32_2 %178 = OpCompositeConstruct %177 %177 
                                       f32_2 %179 = OpFAdd %174 %178 
                                       f32_3 %180 = OpLoad %9 
                                       f32_3 %181 = OpVectorShuffle %180 %179 3 4 2 
                                                      OpStore %9 %181 
                                Private f32* %182 = OpAccessChain %9 %24 
                                         f32 %183 = OpLoad %182 
                                Private f32* %184 = OpAccessChain %9 %66 
                                         f32 %185 = OpLoad %184 
                                         f32 %186 = OpFDiv %183 %185 
                                                      OpStore %59 %186 
                                       f32_4 %188 = OpLoad %120 
                                       f32_2 %189 = OpVectorShuffle %188 %188 1 3 
                                       f32_2 %190 = OpFNegate %189 
                                       f32_4 %191 = OpLoad vs_TEXCOORD2 
                                       f32_2 %192 = OpVectorShuffle %191 %191 0 1 
                                       f32_2 %193 = OpFAdd %190 %192 
                                       f32_3 %194 = OpLoad %187 
                                       f32_3 %195 = OpVectorShuffle %194 %193 3 4 2 
                                                      OpStore %187 %195 
                                         f32 %196 = OpLoad %59 
                                Private f32* %197 = OpAccessChain %187 %66 
                                         f32 %198 = OpLoad %197 
                                         f32 %199 = OpFMul %196 %198 
                                Private f32* %201 = OpAccessChain %187 %200 
                                                      OpStore %201 %199 
                                       f32_3 %202 = OpLoad %187 
                                       f32_2 %203 = OpVectorShuffle %202 %202 0 2 
                                       f32_3 %204 = OpLoad %187 
                                       f32_2 %205 = OpVectorShuffle %204 %204 0 2 
                                         f32 %206 = OpDot %203 %205 
                                                      OpStore %59 %206 
                                       f32_3 %207 = OpLoad %187 
                                       f32_2 %208 = OpVectorShuffle %207 %207 0 1 
                                       f32_3 %209 = OpLoad %187 
                                       f32_2 %210 = OpVectorShuffle %209 %209 0 1 
                                         f32 %211 = OpDot %208 %210 
                                Private f32* %212 = OpAccessChain %29 %24 
                                                      OpStore %212 %211 
                                Private f32* %213 = OpAccessChain %29 %24 
                                         f32 %214 = OpLoad %213 
                                         f32 %215 = OpExtInst %1 31 %214 
                                Private f32* %216 = OpAccessChain %29 %24 
                                                      OpStore %216 %215 
                                Private f32* %217 = OpAccessChain %29 %24 
                                         f32 %218 = OpLoad %217 
                                         i32 %219 = OpLoad %93 
                                Uniform f32* %220 = OpAccessChain %18 %30 %219 
                                         f32 %221 = OpLoad %220 
                                         f32 %222 = OpFNegate %221 
                                         f32 %223 = OpFAdd %218 %222 
                                Private f32* %224 = OpAccessChain %29 %24 
                                                      OpStore %224 %223 
                                         f32 %225 = OpLoad %59 
                                         f32 %226 = OpExtInst %1 31 %225 
                                                      OpStore %59 %226 
                                Private f32* %227 = OpAccessChain %9 %24 
                                         f32 %228 = OpLoad %227 
                                         f32 %229 = OpFNegate %228 
                                         f32 %230 = OpLoad %59 
                                         f32 %231 = OpFAdd %229 %230 
                                                      OpStore %59 %231 
                                       f32_3 %235 = OpLoad %9 
                                       f32_4 %236 = OpVectorShuffle %235 %235 0 1 0 0 
                                      bool_4 %238 = OpFOrdLessThan %234 %236 
                                      bool_2 %239 = OpVectorShuffle %238 %238 0 1 
                                                      OpStore %233 %239 
                               Private bool* %240 = OpAccessChain %233 %66 
                                        bool %241 = OpLoad %240 
                               Private bool* %242 = OpAccessChain %233 %24 
                                        bool %243 = OpLoad %242 
                                        bool %244 = OpLogicalAnd %241 %243 
                               Private bool* %245 = OpAccessChain %233 %24 
                                                      OpStore %245 %244 
                                  Input f32* %247 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %248 = OpLoad %247 
                                         f32 %249 = OpDPdx %248 
                                Private f32* %250 = OpAccessChain %246 %24 
                                                      OpStore %250 %249 
                                Private f32* %252 = OpAccessChain %246 %24 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpExtInst %1 4 %253 
                                         f32 %255 = OpFDiv %251 %254 
                                Private f32* %256 = OpAccessChain %246 %24 
                                                      OpStore %256 %255 
                                         f32 %257 = OpLoad %59 
                                Private f32* %258 = OpAccessChain %246 %24 
                                         f32 %259 = OpLoad %258 
                                         f32 %260 = OpFMul %257 %259 
                                         f32 %261 = OpFAdd %260 %49 
                                                      OpStore %59 %261 
                                         f32 %262 = OpLoad %59 
                                         f32 %263 = OpExtInst %1 43 %262 %56 %251 
                                                      OpStore %59 %263 
                                Private f32* %264 = OpAccessChain %29 %24 
                                         f32 %265 = OpLoad %264 
                                Private f32* %266 = OpAccessChain %246 %24 
                                         f32 %267 = OpLoad %266 
                                         f32 %268 = OpFMul %265 %267 
                                         f32 %269 = OpFAdd %268 %49 
                                Private f32* %270 = OpAccessChain %246 %24 
                                                      OpStore %270 %269 
                                Private f32* %271 = OpAccessChain %246 %24 
                                         f32 %272 = OpLoad %271 
                                         f32 %273 = OpExtInst %1 43 %272 %56 %251 
                                Private f32* %274 = OpAccessChain %246 %24 
                                                      OpStore %274 %273 
                               Private bool* %275 = OpAccessChain %233 %24 
                                        bool %276 = OpLoad %275 
                                         f32 %277 = OpLoad %59 
                                         f32 %278 = OpSelect %276 %277 %251 
                                Private f32* %279 = OpAccessChain %9 %24 
                                                      OpStore %279 %278 
                                       f32_4 %281 = OpLoad %120 
                                       f32_4 %282 = OpVectorShuffle %281 %281 0 2 0 0 
                                      bool_4 %283 = OpFOrdLessThan %234 %282 
                                      bool_2 %284 = OpVectorShuffle %283 %283 0 1 
                                                      OpStore %280 %284 
                               Private bool* %286 = OpAccessChain %280 %66 
                                        bool %287 = OpLoad %286 
                               Private bool* %288 = OpAccessChain %280 %24 
                                        bool %289 = OpLoad %288 
                                        bool %290 = OpLogicalOr %287 %289 
                                                      OpStore %285 %290 
                                        bool %291 = OpLoad %285 
                                                      OpSelectionMerge %295 None 
                                                      OpBranchConditional %291 %294 %298 
                                             %294 = OpLabel 
                                Private f32* %296 = OpAccessChain %9 %24 
                                         f32 %297 = OpLoad %296 
                                                      OpStore %293 %297 
                                                      OpBranch %295 
                                             %298 = OpLabel 
                                                      OpStore %293 %56 
                                                      OpBranch %295 
                                             %295 = OpLabel 
                                         f32 %299 = OpLoad %293 
                                Private f32* %300 = OpAccessChain %9 %24 
                                                      OpStore %300 %299 
                                        bool %301 = OpLoad %285 
                                                      OpSelectionMerge %304 None 
                                                      OpBranchConditional %301 %303 %307 
                                             %303 = OpLabel 
                                Private f32* %305 = OpAccessChain %246 %24 
                                         f32 %306 = OpLoad %305 
                                                      OpStore %302 %306 
                                                      OpBranch %304 
                                             %307 = OpLabel 
                                                      OpStore %302 %56 
                                                      OpBranch %304 
                                             %304 = OpLabel 
                                         f32 %308 = OpLoad %302 
                                Private f32* %309 = OpAccessChain %246 %24 
                                                      OpStore %309 %308 
                                Private f32* %310 = OpAccessChain %246 %24 
                                         f32 %311 = OpLoad %310 
                                        bool %312 = OpFOrdEqual %311 %56 
                                                      OpStore %285 %312 
                                Private f32* %313 = OpAccessChain %246 %24 
                                         f32 %314 = OpLoad %313 
                                         f32 %315 = OpFNegate %314 
                                         f32 %316 = OpFAdd %315 %251 
                                Private f32* %317 = OpAccessChain %246 %24 
                                                      OpStore %317 %316 
                                        bool %318 = OpLoad %285 
                                                      OpSelectionMerge %321 None 
                                                      OpBranchConditional %318 %320 %324 
                                             %320 = OpLabel 
                                Private f32* %322 = OpAccessChain %9 %24 
                                         f32 %323 = OpLoad %322 
                                                      OpStore %319 %323 
                                                      OpBranch %321 
                                             %324 = OpLabel 
                                Private f32* %325 = OpAccessChain %246 %24 
                                         f32 %326 = OpLoad %325 
                                                      OpStore %319 %326 
                                                      OpBranch %321 
                                             %321 = OpLabel 
                                         f32 %327 = OpLoad %319 
                                Private f32* %328 = OpAccessChain %9 %24 
                                                      OpStore %328 %327 
                                       f32_4 %332 = OpLoad %120 
                                       f32_4 %333 = OpVectorShuffle %332 %332 1 1 3 3 
                                       f32_4 %334 = OpLoad vs_TEXCOORD2 
                                       f32_4 %335 = OpVectorShuffle %334 %334 0 0 1 1 
                                      bool_4 %336 = OpFOrdGreaterThanEqual %333 %335 
                                      bool_2 %337 = OpVectorShuffle %336 %336 0 2 
                                      bool_3 %338 = OpLoad %331 
                                      bool_3 %339 = OpVectorShuffle %338 %337 3 1 4 
                                                      OpStore %331 %339 
                                       f32_4 %340 = OpLoad vs_TEXCOORD2 
                                       f32_4 %341 = OpVectorShuffle %340 %340 0 1 0 0 
                                       f32_4 %342 = OpLoad %120 
                                       f32_4 %343 = OpVectorShuffle %342 %342 1 3 1 1 
                                      bool_4 %344 = OpFOrdGreaterThanEqual %341 %343 
                                      bool_2 %345 = OpVectorShuffle %344 %344 0 1 
                                                      OpStore %280 %345 
                                        bool %346 = OpLoad %55 
                                                      OpSelectionMerge %350 None 
                                                      OpBranchConditional %346 %349 %353 
                                             %349 = OpLabel 
                               Private bool* %351 = OpAccessChain %331 %24 
                                        bool %352 = OpLoad %351 
                                                      OpStore %348 %352 
                                                      OpBranch %350 
                                             %353 = OpLabel 
                               Private bool* %354 = OpAccessChain %280 %24 
                                        bool %355 = OpLoad %354 
                                                      OpStore %348 %355 
                                                      OpBranch %350 
                                             %350 = OpLabel 
                                        bool %356 = OpLoad %348 
                               Private bool* %357 = OpAccessChain %331 %24 
                                                      OpStore %357 %356 
                                        bool %358 = OpLoad %80 
                                                      OpSelectionMerge %361 None 
                                                      OpBranchConditional %358 %360 %364 
                                             %360 = OpLabel 
                               Private bool* %362 = OpAccessChain %331 %200 
                                        bool %363 = OpLoad %362 
                                                      OpStore %359 %363 
                                                      OpBranch %361 
                                             %364 = OpLabel 
                               Private bool* %365 = OpAccessChain %280 %66 
                                        bool %366 = OpLoad %365 
                                                      OpStore %359 %366 
                                                      OpBranch %361 
                                             %361 = OpLabel 
                                        bool %367 = OpLoad %359 
                                                      OpStore %55 %367 
                                        bool %368 = OpLoad %55 
                               Private bool* %369 = OpAccessChain %331 %24 
                                        bool %370 = OpLoad %369 
                                        bool %371 = OpLogicalAnd %368 %370 
                               Private bool* %372 = OpAccessChain %331 %24 
                                                      OpStore %372 %371 
                               Private bool* %373 = OpAccessChain %331 %24 
                                        bool %374 = OpLoad %373 
                                                      OpSelectionMerge %377 None 
                                                      OpBranchConditional %374 %376 %380 
                                             %376 = OpLabel 
                                Private f32* %378 = OpAccessChain %9 %24 
                                         f32 %379 = OpLoad %378 
                                                      OpStore %375 %379 
                                                      OpBranch %377 
                                             %380 = OpLabel 
                                                      OpStore %375 %251 
                                                      OpBranch %377 
                                             %377 = OpLabel 
                                         f32 %381 = OpLoad %375 
                                Private f32* %382 = OpAccessChain %9 %24 
                                                      OpStore %382 %381 
                                Uniform f32* %383 = OpAccessChain %18 %19 %20 
                                         f32 %384 = OpLoad %383 
                                Uniform f32* %385 = OpAccessChain %18 %19 %30 
                                         f32 %386 = OpLoad %385 
                                         f32 %387 = OpFAdd %384 %386 
                                                      OpStore %34 %387 
                                         f32 %388 = OpLoad %34 
                                         f32 %389 = OpFNegate %388 
                                Uniform f32* %390 = OpAccessChain %18 %41 %30 
                                         f32 %391 = OpLoad %390 
                                         f32 %392 = OpFAdd %389 %391 
                                                      OpStore %34 %392 
                                Uniform f32* %393 = OpAccessChain %18 %19 %20 
                                         f32 %394 = OpLoad %393 
                                Uniform f32* %395 = OpAccessChain %18 %41 %20 
                                         f32 %396 = OpLoad %395 
                                         f32 %397 = OpFAdd %394 %396 
                                                      OpStore %59 %397 
                                         f32 %398 = OpLoad %34 
                                         f32 %399 = OpLoad %59 
                                         f32 %400 = OpFAdd %398 %399 
                                                      OpStore %34 %400 
                                  Input f32* %401 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %402 = OpLoad %401 
                                         f32 %403 = OpLoad %59 
                                        bool %404 = OpFOrdGreaterThanEqual %402 %403 
                                                      OpStore %285 %404 
                                         f32 %405 = OpLoad %34 
                                  Input f32* %406 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %407 = OpLoad %406 
                                        bool %408 = OpFOrdGreaterThanEqual %405 %407 
                                                      OpStore %55 %408 
                                        bool %409 = OpLoad %55 
                                        bool %410 = OpLoad %285 
                                        bool %411 = OpLogicalAnd %409 %410 
                                                      OpStore %55 %411 
                                Uniform f32* %412 = OpAccessChain %18 %19 %69 
                                         f32 %413 = OpLoad %412 
                                Uniform f32* %414 = OpAccessChain %18 %41 %69 
                                         f32 %415 = OpLoad %414 
                                         f32 %416 = OpFAdd %413 %415 
                                                      OpStore %59 %416 
                                  Input f32* %417 = OpAccessChain vs_TEXCOORD2 %66 
                                         f32 %418 = OpLoad %417 
                                         f32 %419 = OpLoad %59 
                                        bool %420 = OpFOrdGreaterThanEqual %418 %419 
                               Private bool* %421 = OpAccessChain %280 %24 
                                                      OpStore %421 %420 
                                        bool %422 = OpLoad %55 
                               Private bool* %423 = OpAccessChain %280 %24 
                                        bool %424 = OpLoad %423 
                                        bool %425 = OpLogicalAnd %422 %424 
                                                      OpStore %55 %425 
                                Uniform f32* %426 = OpAccessChain %18 %19 %69 
                                         f32 %427 = OpLoad %426 
                                Uniform f32* %428 = OpAccessChain %18 %19 %19 
                                         f32 %429 = OpLoad %428 
                                         f32 %430 = OpFAdd %427 %429 
                                Private f32* %431 = OpAccessChain %29 %24 
                                                      OpStore %431 %430 
                                Private f32* %432 = OpAccessChain %29 %24 
                                         f32 %433 = OpLoad %432 
                                         f32 %434 = OpFNegate %433 
                                Uniform f32* %435 = OpAccessChain %18 %41 %19 
                                         f32 %436 = OpLoad %435 
                                         f32 %437 = OpFAdd %434 %436 
                                Private f32* %438 = OpAccessChain %29 %24 
                                                      OpStore %438 %437 
                                         f32 %439 = OpLoad %59 
                                Private f32* %440 = OpAccessChain %29 %24 
                                         f32 %441 = OpLoad %440 
                                         f32 %442 = OpFAdd %439 %441 
                                                      OpStore %59 %442 
                                         f32 %443 = OpLoad %59 
                                  Input f32* %444 = OpAccessChain vs_TEXCOORD2 %66 
                                         f32 %445 = OpLoad %444 
                                        bool %446 = OpFOrdGreaterThanEqual %443 %445 
                                                      OpStore %285 %446 
                                        bool %447 = OpLoad %285 
                                        bool %448 = OpLoad %55 
                                        bool %449 = OpLogicalAnd %447 %448 
                                                      OpStore %55 %449 
                                        bool %450 = OpLoad %55 
                                         f32 %451 = OpSelect %450 %56 %251 
                                                      OpStore %34 %451 
                               Private bool* %452 = OpAccessChain %331 %24 
                                        bool %453 = OpLoad %452 
                                         f32 %454 = OpLoad %34 
                                         f32 %455 = OpSelect %453 %251 %454 
                                Private f32* %456 = OpAccessChain %246 %24 
                                                      OpStore %456 %455 
                                Uniform f32* %457 = OpAccessChain %18 %19 %20 
                                         f32 %458 = OpLoad %457 
                                        bool %459 = OpFOrdLessThan %56 %458 
                                                      OpStore %55 %459 
                                Uniform f32* %460 = OpAccessChain %18 %19 %69 
                                         f32 %461 = OpLoad %460 
                                        bool %462 = OpFOrdLessThan %56 %461 
                                                      OpStore %285 %462 
                                        bool %463 = OpLoad %285 
                                        bool %464 = OpLoad %55 
                                        bool %465 = OpLogicalOr %463 %464 
                                                      OpStore %55 %465 
                                Uniform f32* %466 = OpAccessChain %18 %19 %30 
                                         f32 %467 = OpLoad %466 
                                        bool %468 = OpFOrdLessThan %56 %467 
                                                      OpStore %285 %468 
                                        bool %469 = OpLoad %285 
                                        bool %470 = OpLoad %55 
                                        bool %471 = OpLogicalOr %469 %470 
                                                      OpStore %55 %471 
                                Uniform f32* %472 = OpAccessChain %18 %19 %19 
                                         f32 %473 = OpLoad %472 
                                        bool %474 = OpFOrdLessThan %56 %473 
                                                      OpStore %285 %474 
                                        bool %475 = OpLoad %285 
                                        bool %476 = OpLoad %55 
                                        bool %477 = OpLogicalOr %475 %476 
                                                      OpStore %55 %477 
                                        bool %478 = OpLoad %55 
                                                      OpSelectionMerge %481 None 
                                                      OpBranchConditional %478 %480 %484 
                                             %480 = OpLabel 
                                Private f32* %482 = OpAccessChain %246 %24 
                                         f32 %483 = OpLoad %482 
                                                      OpStore %479 %483 
                                                      OpBranch %481 
                                             %484 = OpLabel 
                                                      OpStore %479 %251 
                                                      OpBranch %481 
                                             %481 = OpLabel 
                                         f32 %485 = OpLoad %479 
                                Private f32* %486 = OpAccessChain %246 %24 
                                                      OpStore %486 %485 
                                Private f32* %487 = OpAccessChain %246 %24 
                                         f32 %488 = OpLoad %487 
                                Private f32* %489 = OpAccessChain %9 %24 
                                         f32 %490 = OpLoad %489 
                                         f32 %491 = OpFMul %488 %490 
                                Private f32* %492 = OpAccessChain %9 %200 
                                                      OpStore %492 %491 
                         read_only Texture2D %496 = OpLoad %495 
                                     sampler %500 = OpLoad %499 
                  read_only Texture2DSampled %502 = OpSampledImage %496 %500 
                                       f32_2 %505 = OpLoad vs_TEXCOORD1 
                                       f32_4 %506 = OpImageSampleImplicitLod %502 %505 
                                         f32 %508 = OpCompositeExtract %506 3 
                                Private f32* %509 = OpAccessChain %246 %200 
                                                      OpStore %509 %508 
                         read_only Texture2D %512 = OpLoad %511 
                                     sampler %514 = OpLoad %513 
                  read_only Texture2DSampled %515 = OpSampledImage %512 %514 
                                       f32_2 %517 = OpLoad vs_TEXCOORD0 
                                       f32_4 %518 = OpImageSampleImplicitLod %515 %517 
                                                      OpStore %510 %518 
                                       f32_4 %520 = OpLoad %510 
                                       f32_3 %521 = OpVectorShuffle %520 %520 0 1 2 
                                       f32_3 %523 = OpExtInst %1 40 %521 %522 
                                                      OpStore %519 %523 
                                       f32_3 %525 = OpLoad %519 
                                       f32_3 %526 = OpExtInst %1 30 %525 
                                                      OpStore %524 %526 
                                       f32_3 %527 = OpLoad %524 
                                       f32_3 %530 = OpFMul %527 %529 
                                                      OpStore %524 %530 
                                       f32_3 %531 = OpLoad %524 
                                       f32_3 %532 = OpExtInst %1 29 %531 
                                                      OpStore %524 %532 
                                       f32_3 %533 = OpLoad %524 
                                       f32_3 %536 = OpFMul %533 %535 
                                       f32_3 %539 = OpFAdd %536 %538 
                                                      OpStore %524 %539 
                                       f32_3 %540 = OpLoad %524 
                                       f32_3 %541 = OpExtInst %1 40 %540 %522 
                                       f32_4 %542 = OpLoad %120 
                                       f32_4 %543 = OpVectorShuffle %542 %541 4 5 6 3 
                                                      OpStore %120 %543 
                                Uniform i32* %545 = OpAccessChain %18 %20 
                                         i32 %546 = OpLoad %545 
                                        bool %547 = OpINotEqual %546 %20 
                                                      OpSelectionMerge %551 None 
                                                      OpBranchConditional %547 %550 %554 
                                             %550 = OpLabel 
                                       f32_4 %552 = OpLoad %120 
                                       f32_3 %553 = OpVectorShuffle %552 %552 0 1 2 
                                                      OpStore %549 %553 
                                                      OpBranch %551 
                                             %554 = OpLabel 
                                       f32_4 %555 = OpLoad %510 
                                       f32_3 %556 = OpVectorShuffle %555 %555 0 1 2 
                                                      OpStore %549 %556 
                                                      OpBranch %551 
                                             %551 = OpLabel 
                                       f32_3 %557 = OpLoad %549 
                                                      OpStore %519 %557 
                                Private f32* %559 = OpAccessChain %510 %507 
                                         f32 %560 = OpLoad %559 
                                  Input f32* %562 = OpAccessChain %561 %507 
                                         f32 %563 = OpLoad %562 
                                         f32 %564 = OpFMul %560 %563 
                                                      OpStore %558 %564 
                                Private f32* %565 = OpAccessChain %9 %24 
                                         f32 %566 = OpLoad %565 
                                         f32 %567 = OpLoad %558 
                                         f32 %568 = OpFMul %566 %567 
                                Private f32* %569 = OpAccessChain %9 %24 
                                                      OpStore %569 %568 
                                       f32_3 %570 = OpLoad %246 
                                       f32_2 %571 = OpVectorShuffle %570 %570 0 2 
                                       f32_3 %572 = OpLoad %9 
                                       f32_2 %573 = OpVectorShuffle %572 %572 0 2 
                                       f32_2 %574 = OpFMul %571 %573 
                                       f32_3 %575 = OpLoad %9 
                                       f32_3 %576 = OpVectorShuffle %575 %574 3 1 4 
                                                      OpStore %9 %576 
                                Private f32* %577 = OpAccessChain %246 %200 
                                         f32 %578 = OpLoad %577 
                                Private f32* %579 = OpAccessChain %9 %24 
                                         f32 %580 = OpLoad %579 
                                         f32 %581 = OpFMul %578 %580 
                                Private f32* %582 = OpAccessChain %9 %24 
                                                      OpStore %582 %581 
                                Private f32* %585 = OpAccessChain %9 %24 
                                         f32 %586 = OpLoad %585 
                                 Output f32* %588 = OpAccessChain %584 %507 
                                                      OpStore %588 %586 
                                       f32_3 %589 = OpLoad %519 
                                       f32_4 %590 = OpLoad %561 
                                       f32_3 %591 = OpVectorShuffle %590 %590 0 1 2 
                                       f32_3 %592 = OpFMul %589 %591 
                                                      OpStore %519 %592 
                                       f32_3 %593 = OpLoad %9 
                                       f32_3 %594 = OpVectorShuffle %593 %593 2 2 2 
                                       f32_3 %595 = OpLoad %519 
                                       f32_3 %596 = OpFMul %594 %595 
                                                      OpStore %9 %596 
                                Uniform i32* %597 = OpAccessChain %18 %69 
                                         i32 %598 = OpLoad %597 
                                        bool %600 = OpINotEqual %598 %599 
                                                      OpStore %285 %600 
                                        bool %601 = OpLoad %285 
                                                      OpSelectionMerge %604 None 
                                                      OpBranchConditional %601 %603 %606 
                                             %603 = OpLabel 
                                       f32_3 %605 = OpLoad %9 
                                                      OpStore %602 %605 
                                                      OpBranch %604 
                                             %606 = OpLabel 
                                       f32_3 %607 = OpLoad %519 
                                                      OpStore %602 %607 
                                                      OpBranch %604 
                                             %604 = OpLabel 
                                       f32_3 %608 = OpLoad %602 
                                       f32_4 %609 = OpLoad %584 
                                       f32_4 %610 = OpVectorShuffle %609 %608 4 5 6 3 
                                                      OpStore %584 %610 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 176
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %74 %84 %85 %149 %156 %158 %168 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpMemberDecorate %72 0 BuiltIn 72 
                                                      OpMemberDecorate %72 1 BuiltIn 72 
                                                      OpMemberDecorate %72 2 BuiltIn 72 
                                                      OpDecorate %72 Block 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 149 
                                                      OpDecorate vs_TEXCOORD0 Location 156 
                                                      OpDecorate %158 Location 158 
                                                      OpDecorate vs_TEXCOORD2 Location 168 
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
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeArray %7 %15 
                                              %20 = OpTypeStruct %16 %17 %18 %7 %19 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4[4];}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 0 
                                          i32 %25 = OpConstant 1 
                                              %26 = OpTypePointer Uniform %7 
                                          i32 %37 = OpConstant 2 
                                          i32 %46 = OpConstant 3 
                               Private f32_4* %50 = OpVariable Private 
                                          u32 %70 = OpConstant 1 
                                              %71 = OpTypeArray %6 %70 
                                              %72 = OpTypeStruct %7 %6 %71 
                                              %73 = OpTypePointer Output %72 
         Output struct {f32_4; f32; f32[1];}* %74 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                Output f32_4* %84 = OpVariable Output 
                                 Input f32_4* %85 = OpVariable Input 
                                              %87 = OpTypeVector %6 2 
                                             %129 = OpTypePointer Private %87 
                              Private f32_2* %130 = OpVariable Private 
                                         i32 %133 = OpConstant 4 
                                             %148 = OpTypePointer Output %87 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %157 = OpTypePointer Input %87 
                                Input f32_2* %158 = OpVariable Input 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                             %170 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %27 = OpAccessChain %22 %24 %25 
                                        f32_4 %28 = OpLoad %27 
                                        f32_4 %29 = OpFMul %13 %28 
                                                      OpStore %9 %29 
                               Uniform f32_4* %30 = OpAccessChain %22 %24 %24 
                                        f32_4 %31 = OpLoad %30 
                                        f32_4 %32 = OpLoad %11 
                                        f32_4 %33 = OpVectorShuffle %32 %32 0 0 0 0 
                                        f32_4 %34 = OpFMul %31 %33 
                                        f32_4 %35 = OpLoad %9 
                                        f32_4 %36 = OpFAdd %34 %35 
                                                      OpStore %9 %36 
                               Uniform f32_4* %38 = OpAccessChain %22 %24 %37 
                                        f32_4 %39 = OpLoad %38 
                                        f32_4 %40 = OpLoad %11 
                                        f32_4 %41 = OpVectorShuffle %40 %40 2 2 2 2 
                                        f32_4 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpFAdd %42 %43 
                                                      OpStore %9 %44 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %22 %24 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %9 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_4 %52 = OpVectorShuffle %51 %51 1 1 1 1 
                               Uniform f32_4* %53 = OpAccessChain %22 %37 %25 
                                        f32_4 %54 = OpLoad %53 
                                        f32_4 %55 = OpFMul %52 %54 
                                                      OpStore %50 %55 
                               Uniform f32_4* %56 = OpAccessChain %22 %37 %24 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                                        f32_4 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %50 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %50 %62 
                               Uniform f32_4* %63 = OpAccessChain %22 %37 %37 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpVectorShuffle %65 %65 2 2 2 2 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %50 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %50 %69 
                               Uniform f32_4* %75 = OpAccessChain %22 %37 %46 
                                        f32_4 %76 = OpLoad %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpVectorShuffle %77 %77 3 3 3 3 
                                        f32_4 %79 = OpFMul %76 %78 
                                        f32_4 %80 = OpLoad %50 
                                        f32_4 %81 = OpFAdd %79 %80 
                                Output f32_4* %83 = OpAccessChain %74 %24 
                                                      OpStore %83 %81 
                                        f32_4 %86 = OpLoad %85 
                                                      OpStore %84 %86 
                                        f32_4 %88 = OpLoad %9 
                                        f32_2 %89 = OpVectorShuffle %88 %88 1 1 
                               Uniform f32_4* %90 = OpAccessChain %22 %25 %25 
                                        f32_4 %91 = OpLoad %90 
                                        f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                        f32_2 %93 = OpFMul %89 %92 
                                        f32_4 %94 = OpLoad %50 
                                        f32_4 %95 = OpVectorShuffle %94 %93 4 5 2 3 
                                                      OpStore %50 %95 
                               Uniform f32_4* %96 = OpAccessChain %22 %25 %24 
                                        f32_4 %97 = OpLoad %96 
                                        f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                                        f32_4 %99 = OpLoad %9 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 0 
                                       f32_2 %101 = OpFMul %98 %100 
                                       f32_4 %102 = OpLoad %50 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFAdd %101 %103 
                                       f32_4 %105 = OpLoad %9 
                                       f32_4 %106 = OpVectorShuffle %105 %104 4 5 2 3 
                                                      OpStore %9 %106 
                              Uniform f32_4* %107 = OpAccessChain %22 %25 %37 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                       f32_4 %110 = OpLoad %9 
                                       f32_2 %111 = OpVectorShuffle %110 %110 2 2 
                                       f32_2 %112 = OpFMul %109 %111 
                                       f32_4 %113 = OpLoad %9 
                                       f32_2 %114 = OpVectorShuffle %113 %113 0 1 
                                       f32_2 %115 = OpFAdd %112 %114 
                                       f32_4 %116 = OpLoad %9 
                                       f32_4 %117 = OpVectorShuffle %116 %115 4 5 2 3 
                                                      OpStore %9 %117 
                              Uniform f32_4* %118 = OpAccessChain %22 %25 %46 
                                       f32_4 %119 = OpLoad %118 
                                       f32_2 %120 = OpVectorShuffle %119 %119 0 1 
                                       f32_4 %121 = OpLoad %9 
                                       f32_2 %122 = OpVectorShuffle %121 %121 3 3 
                                       f32_2 %123 = OpFMul %120 %122 
                                       f32_4 %124 = OpLoad %9 
                                       f32_2 %125 = OpVectorShuffle %124 %124 0 1 
                                       f32_2 %126 = OpFAdd %123 %125 
                                       f32_4 %127 = OpLoad %9 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 2 3 
                                                      OpStore %9 %128 
                                       f32_4 %131 = OpLoad %9 
                                       f32_2 %132 = OpVectorShuffle %131 %131 1 1 
                              Uniform f32_4* %134 = OpAccessChain %22 %133 %25 
                                       f32_4 %135 = OpLoad %134 
                                       f32_2 %136 = OpVectorShuffle %135 %135 0 1 
                                       f32_2 %137 = OpFMul %132 %136 
                                                      OpStore %130 %137 
                              Uniform f32_4* %138 = OpAccessChain %22 %133 %24 
                                       f32_4 %139 = OpLoad %138 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_4 %141 = OpLoad %9 
                                       f32_2 %142 = OpVectorShuffle %141 %141 0 0 
                                       f32_2 %143 = OpFMul %140 %142 
                                       f32_2 %144 = OpLoad %130 
                                       f32_2 %145 = OpFAdd %143 %144 
                                       f32_4 %146 = OpLoad %9 
                                       f32_4 %147 = OpVectorShuffle %146 %145 4 5 2 3 
                                                      OpStore %9 %147 
                                       f32_4 %150 = OpLoad %9 
                                       f32_2 %151 = OpVectorShuffle %150 %150 0 1 
                              Uniform f32_4* %152 = OpAccessChain %22 %133 %46 
                                       f32_4 %153 = OpLoad %152 
                                       f32_2 %154 = OpVectorShuffle %153 %153 0 1 
                                       f32_2 %155 = OpFAdd %151 %154 
                                                      OpStore vs_TEXCOORD1 %155 
                                       f32_2 %159 = OpLoad %158 
                              Uniform f32_4* %160 = OpAccessChain %22 %46 
                                       f32_4 %161 = OpLoad %160 
                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                       f32_2 %163 = OpFMul %159 %162 
                              Uniform f32_4* %164 = OpAccessChain %22 %46 
                                       f32_4 %165 = OpLoad %164 
                                       f32_2 %166 = OpVectorShuffle %165 %165 2 3 
                                       f32_2 %167 = OpFAdd %163 %166 
                                                      OpStore vs_TEXCOORD0 %167 
                                       f32_4 %169 = OpLoad %11 
                                                      OpStore vs_TEXCOORD2 %169 
                                 Output f32* %171 = OpAccessChain %74 %24 %70 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpFNegate %172 
                                 Output f32* %174 = OpAccessChain %74 %24 %70 
                                                      OpStore %174 %173 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 612
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %37 %504 %516 %561 %584 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpMemberDecorate %16 0 Offset 16 
                                                      OpMemberDecorate %16 1 Offset 16 
                                                      OpMemberDecorate %16 2 Offset 16 
                                                      OpMemberDecorate %16 3 Offset 16 
                                                      OpMemberDecorate %16 4 Offset 16 
                                                      OpDecorate %16 Block 
                                                      OpDecorate %18 DescriptorSet 18 
                                                      OpDecorate %18 Binding 18 
                                                      OpDecorate vs_TEXCOORD2 Location 37 
                                                      OpDecorate %495 RelaxedPrecision 
                                                      OpDecorate %495 DescriptorSet 495 
                                                      OpDecorate %495 Binding 495 
                                                      OpDecorate %496 RelaxedPrecision 
                                                      OpDecorate %499 RelaxedPrecision 
                                                      OpDecorate %499 DescriptorSet 499 
                                                      OpDecorate %499 Binding 499 
                                                      OpDecorate %500 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 504 
                                                      OpDecorate %510 RelaxedPrecision 
                                                      OpDecorate %511 RelaxedPrecision 
                                                      OpDecorate %511 DescriptorSet 511 
                                                      OpDecorate %511 Binding 511 
                                                      OpDecorate %512 RelaxedPrecision 
                                                      OpDecorate %513 RelaxedPrecision 
                                                      OpDecorate %513 DescriptorSet 513 
                                                      OpDecorate %513 Binding 513 
                                                      OpDecorate %514 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 516 
                                                      OpDecorate %519 RelaxedPrecision 
                                                      OpDecorate %520 RelaxedPrecision 
                                                      OpDecorate %521 RelaxedPrecision 
                                                      OpDecorate %523 RelaxedPrecision 
                                                      OpDecorate %524 RelaxedPrecision 
                                                      OpDecorate %525 RelaxedPrecision 
                                                      OpDecorate %526 RelaxedPrecision 
                                                      OpDecorate %527 RelaxedPrecision 
                                                      OpDecorate %530 RelaxedPrecision 
                                                      OpDecorate %531 RelaxedPrecision 
                                                      OpDecorate %532 RelaxedPrecision 
                                                      OpDecorate %533 RelaxedPrecision 
                                                      OpDecorate %536 RelaxedPrecision 
                                                      OpDecorate %539 RelaxedPrecision 
                                                      OpDecorate %540 RelaxedPrecision 
                                                      OpDecorate %541 RelaxedPrecision 
                                                      OpDecorate %555 RelaxedPrecision 
                                                      OpDecorate %556 RelaxedPrecision 
                                                      OpDecorate %558 RelaxedPrecision 
                                                      OpDecorate %560 RelaxedPrecision 
                                                      OpDecorate %561 RelaxedPrecision 
                                                      OpDecorate %561 Location 561 
                                                      OpDecorate %563 RelaxedPrecision 
                                                      OpDecorate %564 RelaxedPrecision 
                                                      OpDecorate %567 RelaxedPrecision 
                                                      OpDecorate %584 RelaxedPrecision 
                                                      OpDecorate %584 Location 584 
                                                      OpDecorate %589 RelaxedPrecision 
                                                      OpDecorate %590 RelaxedPrecision 
                                                      OpDecorate %591 RelaxedPrecision 
                                                      OpDecorate %592 RelaxedPrecision 
                                                      OpDecorate %595 RelaxedPrecision 
                                                      OpDecorate %607 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 1 
                                              %11 = OpTypeInt 32 0 
                                          u32 %12 = OpConstant 4 
                                              %13 = OpTypeArray %6 %12 
                                              %14 = OpTypeArray %6 %12 
                                              %15 = OpTypeArray %6 %12 
                                              %16 = OpTypeStruct %10 %10 %13 %14 %15 
                                              %17 = OpTypePointer Uniform %16 
Uniform struct {i32; i32; f32[4]; f32[4]; f32[4];}* %18 = OpVariable Uniform 
                                          i32 %19 = OpConstant 3 
                                          i32 %20 = OpConstant 0 
                                              %21 = OpTypePointer Uniform %6 
                                          u32 %24 = OpConstant 0 
                                              %25 = OpTypePointer Private %6 
                                              %27 = OpTypeVector %6 2 
                                              %28 = OpTypePointer Private %27 
                               Private f32_2* %29 = OpVariable Private 
                                          i32 %30 = OpConstant 2 
                                 Private f32* %34 = OpVariable Private 
                                              %35 = OpTypeVector %6 4 
                                              %36 = OpTypePointer Input %35 
                        Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                              %38 = OpTypePointer Input %6 
                                          i32 %41 = OpConstant 4 
                                          f32 %49 = OpConstant 3.674022E-40 
                                              %53 = OpTypeBool 
                                              %54 = OpTypePointer Private %53 
                                Private bool* %55 = OpVariable Private 
                                          f32 %56 = OpConstant 3.674022E-40 
                                 Private f32* %59 = OpVariable Private 
                                 Private f32* %65 = OpVariable Private 
                                          u32 %66 = OpConstant 1 
                                          i32 %69 = OpConstant 1 
                                Private bool* %80 = OpVariable Private 
                                              %83 = OpTypeVector %10 2 
                                              %84 = OpTypePointer Private %83 
                               Private i32_2* %85 = OpVariable Private 
                                        i32_2 %87 = OpConstantComposite %20 %69 
                                        i32_2 %88 = OpConstantComposite %19 %30 
                                              %89 = OpTypeVector %53 2 
                                              %92 = OpTypePointer Private %10 
                                 Private i32* %93 = OpVariable Private 
                                              %95 = OpTypePointer Function %10 
                                             %119 = OpTypePointer Private %35 
                              Private f32_4* %120 = OpVariable Private 
                                             %122 = OpTypePointer Function %27 
                              Private f32_2* %133 = OpVariable Private 
                              Private f32_2* %137 = OpVariable Private 
                              Private f32_3* %187 = OpVariable Private 
                                         u32 %200 = OpConstant 2 
                                             %232 = OpTypePointer Private %89 
                             Private bool_2* %233 = OpVariable Private 
                                       f32_4 %234 = OpConstantComposite %56 %56 %56 %56 
                                             %237 = OpTypeVector %53 4 
                              Private f32_3* %246 = OpVariable Private 
                                         f32 %251 = OpConstant 3.674022E-40 
                             Private bool_2* %280 = OpVariable Private 
                               Private bool* %285 = OpVariable Private 
                                             %292 = OpTypePointer Function %6 
                                             %329 = OpTypeVector %53 3 
                                             %330 = OpTypePointer Private %329 
                             Private bool_3* %331 = OpVariable Private 
                                             %347 = OpTypePointer Function %53 
                                             %493 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %494 = OpTypePointer UniformConstant %493 
        UniformConstant read_only Texture2D* %495 = OpVariable UniformConstant 
                                             %497 = OpTypeSampler 
                                             %498 = OpTypePointer UniformConstant %497 
                    UniformConstant sampler* %499 = OpVariable UniformConstant 
                                             %501 = OpTypeSampledImage %493 
                                             %503 = OpTypePointer Input %27 
                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                         u32 %507 = OpConstant 3 
                              Private f32_4* %510 = OpVariable Private 
        UniformConstant read_only Texture2D* %511 = OpVariable UniformConstant 
                    UniformConstant sampler* %513 = OpVariable UniformConstant 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                              Private f32_3* %519 = OpVariable Private 
                                       f32_3 %522 = OpConstantComposite %56 %56 %56 
                              Private f32_3* %524 = OpVariable Private 
                                         f32 %528 = OpConstant 3.674022E-40 
                                       f32_3 %529 = OpConstantComposite %528 %528 %528 
                                         f32 %534 = OpConstant 3.674022E-40 
                                       f32_3 %535 = OpConstantComposite %534 %534 %534 
                                         f32 %537 = OpConstant 3.674022E-40 
                                       f32_3 %538 = OpConstantComposite %537 %537 %537 
                                             %544 = OpTypePointer Uniform %10 
                                             %548 = OpTypePointer Function %7 
                                Private f32* %558 = OpVariable Private 
                                Input f32_4* %561 = OpVariable Input 
                                             %583 = OpTypePointer Output %35 
                               Output f32_4* %584 = OpVariable Output 
                                             %587 = OpTypePointer Output %6 
                                         i32 %599 = OpConstant 5 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function i32* %96 = OpVariable Function 
                             Function f32_2* %123 = OpVariable Function 
                             Function f32_2* %163 = OpVariable Function 
                               Function f32* %293 = OpVariable Function 
                               Function f32* %302 = OpVariable Function 
                               Function f32* %319 = OpVariable Function 
                              Function bool* %348 = OpVariable Function 
                              Function bool* %359 = OpVariable Function 
                               Function f32* %375 = OpVariable Function 
                               Function f32* %479 = OpVariable Function 
                             Function f32_3* %549 = OpVariable Function 
                             Function f32_3* %602 = OpVariable Function 
                                 Uniform f32* %22 = OpAccessChain %18 %19 %20 
                                          f32 %23 = OpLoad %22 
                                 Private f32* %26 = OpAccessChain %9 %24 
                                                      OpStore %26 %23 
                                 Uniform f32* %31 = OpAccessChain %18 %19 %30 
                                          f32 %32 = OpLoad %31 
                                 Private f32* %33 = OpAccessChain %29 %24 
                                                      OpStore %33 %32 
                                   Input f32* %39 = OpAccessChain vs_TEXCOORD2 %24 
                                          f32 %40 = OpLoad %39 
                                 Uniform f32* %42 = OpAccessChain %18 %41 %20 
                                          f32 %43 = OpLoad %42 
                                          f32 %44 = OpFNegate %43 
                                          f32 %45 = OpFAdd %40 %44 
                                                      OpStore %34 %45 
                                 Uniform f32* %46 = OpAccessChain %18 %41 %30 
                                          f32 %47 = OpLoad %46 
                                          f32 %48 = OpFNegate %47 
                                          f32 %50 = OpFMul %48 %49 
                                          f32 %51 = OpLoad %34 
                                          f32 %52 = OpFAdd %50 %51 
                                                      OpStore %34 %52 
                                          f32 %57 = OpLoad %34 
                                         bool %58 = OpFOrdGreaterThanEqual %56 %57 
                                                      OpStore %55 %58 
                                 Uniform f32* %60 = OpAccessChain %18 %41 %20 
                                          f32 %61 = OpLoad %60 
                                 Uniform f32* %62 = OpAccessChain %18 %41 %30 
                                          f32 %63 = OpLoad %62 
                                          f32 %64 = OpFAdd %61 %63 
                                                      OpStore %59 %64 
                                   Input f32* %67 = OpAccessChain vs_TEXCOORD2 %66 
                                          f32 %68 = OpLoad %67 
                                 Uniform f32* %70 = OpAccessChain %18 %41 %69 
                                          f32 %71 = OpLoad %70 
                                          f32 %72 = OpFNegate %71 
                                          f32 %73 = OpFAdd %68 %72 
                                                      OpStore %65 %73 
                                 Uniform f32* %74 = OpAccessChain %18 %41 %19 
                                          f32 %75 = OpLoad %74 
                                          f32 %76 = OpFNegate %75 
                                          f32 %77 = OpFMul %76 %49 
                                          f32 %78 = OpLoad %65 
                                          f32 %79 = OpFAdd %77 %78 
                                                      OpStore %65 %79 
                                          f32 %81 = OpLoad %65 
                                         bool %82 = OpFOrdGreaterThanEqual %56 %81 
                                                      OpStore %80 %82 
                                         bool %86 = OpLoad %80 
                                       bool_2 %90 = OpCompositeConstruct %86 %86 
                                        i32_2 %91 = OpSelect %90 %87 %88 
                                                      OpStore %85 %91 
                                         bool %94 = OpLoad %55 
                                                      OpSelectionMerge %98 None 
                                                      OpBranchConditional %94 %97 %101 
                                              %97 = OpLabel 
                                 Private i32* %99 = OpAccessChain %85 %24 
                                         i32 %100 = OpLoad %99 
                                                      OpStore %96 %100 
                                                      OpBranch %98 
                                             %101 = OpLabel 
                                Private i32* %102 = OpAccessChain %85 %66 
                                         i32 %103 = OpLoad %102 
                                                      OpStore %96 %103 
                                                      OpBranch %98 
                                              %98 = OpLabel 
                                         i32 %104 = OpLoad %96 
                                                      OpStore %93 %104 
                                         f32 %105 = OpLoad %59 
                                         i32 %106 = OpLoad %93 
                                Uniform f32* %107 = OpAccessChain %18 %30 %106 
                                         f32 %108 = OpLoad %107 
                                         f32 %109 = OpFNegate %108 
                                         f32 %110 = OpFAdd %105 %109 
                                Private f32* %111 = OpAccessChain %29 %66 
                                                      OpStore %111 %110 
                                Uniform f32* %112 = OpAccessChain %18 %41 %20 
                                         f32 %113 = OpLoad %112 
                                         i32 %114 = OpLoad %93 
                                Uniform f32* %115 = OpAccessChain %18 %30 %114 
                                         f32 %116 = OpLoad %115 
                                         f32 %117 = OpFAdd %113 %116 
                                Private f32* %118 = OpAccessChain %9 %66 
                                                      OpStore %118 %117 
                                        bool %121 = OpLoad %55 
                                                      OpSelectionMerge %125 None 
                                                      OpBranchConditional %121 %124 %128 
                                             %124 = OpLabel 
                                       f32_3 %126 = OpLoad %9 
                                       f32_2 %127 = OpVectorShuffle %126 %126 0 1 
                                                      OpStore %123 %127 
                                                      OpBranch %125 
                                             %128 = OpLabel 
                                       f32_2 %129 = OpLoad %29 
                                                      OpStore %123 %129 
                                                      OpBranch %125 
                                             %125 = OpLabel 
                                       f32_2 %130 = OpLoad %123 
                                       f32_4 %131 = OpLoad %120 
                                       f32_4 %132 = OpVectorShuffle %131 %130 4 5 2 3 
                                                      OpStore %120 %132 
                                Uniform f32* %134 = OpAccessChain %18 %19 %69 
                                         f32 %135 = OpLoad %134 
                                Private f32* %136 = OpAccessChain %133 %24 
                                                      OpStore %136 %135 
                                Uniform f32* %138 = OpAccessChain %18 %19 %19 
                                         f32 %139 = OpLoad %138 
                                Private f32* %140 = OpAccessChain %137 %24 
                                                      OpStore %140 %139 
                                Uniform f32* %141 = OpAccessChain %18 %41 %69 
                                         f32 %142 = OpLoad %141 
                                Uniform f32* %143 = OpAccessChain %18 %41 %19 
                                         f32 %144 = OpLoad %143 
                                         f32 %145 = OpFAdd %142 %144 
                                Private f32* %146 = OpAccessChain %9 %24 
                                                      OpStore %146 %145 
                                Private f32* %147 = OpAccessChain %9 %24 
                                         f32 %148 = OpLoad %147 
                                         i32 %149 = OpLoad %93 
                                Uniform f32* %150 = OpAccessChain %18 %30 %149 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFNegate %151 
                                         f32 %153 = OpFAdd %148 %152 
                                Private f32* %154 = OpAccessChain %137 %66 
                                                      OpStore %154 %153 
                                Uniform f32* %155 = OpAccessChain %18 %41 %69 
                                         f32 %156 = OpLoad %155 
                                         i32 %157 = OpLoad %93 
                                Uniform f32* %158 = OpAccessChain %18 %30 %157 
                                         f32 %159 = OpLoad %158 
                                         f32 %160 = OpFAdd %156 %159 
                                Private f32* %161 = OpAccessChain %133 %66 
                                                      OpStore %161 %160 
                                        bool %162 = OpLoad %80 
                                                      OpSelectionMerge %165 None 
                                                      OpBranchConditional %162 %164 %167 
                                             %164 = OpLabel 
                                       f32_2 %166 = OpLoad %133 
                                                      OpStore %163 %166 
                                                      OpBranch %165 
                                             %167 = OpLabel 
                                       f32_2 %168 = OpLoad %137 
                                                      OpStore %163 %168 
                                                      OpBranch %165 
                                             %165 = OpLabel 
                                       f32_2 %169 = OpLoad %163 
                                       f32_4 %170 = OpLoad %120 
                                       f32_4 %171 = OpVectorShuffle %170 %169 0 1 4 5 
                                                      OpStore %120 %171 
                                       f32_4 %172 = OpLoad %120 
                                       f32_2 %173 = OpVectorShuffle %172 %172 0 2 
                                       f32_2 %174 = OpFNegate %173 
                                         i32 %175 = OpLoad %93 
                                Uniform f32* %176 = OpAccessChain %18 %30 %175 
                                         f32 %177 = OpLoad %176 
                                       f32_2 %178 = OpCompositeConstruct %177 %177 
                                       f32_2 %179 = OpFAdd %174 %178 
                                       f32_3 %180 = OpLoad %9 
                                       f32_3 %181 = OpVectorShuffle %180 %179 3 4 2 
                                                      OpStore %9 %181 
                                Private f32* %182 = OpAccessChain %9 %24 
                                         f32 %183 = OpLoad %182 
                                Private f32* %184 = OpAccessChain %9 %66 
                                         f32 %185 = OpLoad %184 
                                         f32 %186 = OpFDiv %183 %185 
                                                      OpStore %59 %186 
                                       f32_4 %188 = OpLoad %120 
                                       f32_2 %189 = OpVectorShuffle %188 %188 1 3 
                                       f32_2 %190 = OpFNegate %189 
                                       f32_4 %191 = OpLoad vs_TEXCOORD2 
                                       f32_2 %192 = OpVectorShuffle %191 %191 0 1 
                                       f32_2 %193 = OpFAdd %190 %192 
                                       f32_3 %194 = OpLoad %187 
                                       f32_3 %195 = OpVectorShuffle %194 %193 3 4 2 
                                                      OpStore %187 %195 
                                         f32 %196 = OpLoad %59 
                                Private f32* %197 = OpAccessChain %187 %66 
                                         f32 %198 = OpLoad %197 
                                         f32 %199 = OpFMul %196 %198 
                                Private f32* %201 = OpAccessChain %187 %200 
                                                      OpStore %201 %199 
                                       f32_3 %202 = OpLoad %187 
                                       f32_2 %203 = OpVectorShuffle %202 %202 0 2 
                                       f32_3 %204 = OpLoad %187 
                                       f32_2 %205 = OpVectorShuffle %204 %204 0 2 
                                         f32 %206 = OpDot %203 %205 
                                                      OpStore %59 %206 
                                       f32_3 %207 = OpLoad %187 
                                       f32_2 %208 = OpVectorShuffle %207 %207 0 1 
                                       f32_3 %209 = OpLoad %187 
                                       f32_2 %210 = OpVectorShuffle %209 %209 0 1 
                                         f32 %211 = OpDot %208 %210 
                                Private f32* %212 = OpAccessChain %29 %24 
                                                      OpStore %212 %211 
                                Private f32* %213 = OpAccessChain %29 %24 
                                         f32 %214 = OpLoad %213 
                                         f32 %215 = OpExtInst %1 31 %214 
                                Private f32* %216 = OpAccessChain %29 %24 
                                                      OpStore %216 %215 
                                Private f32* %217 = OpAccessChain %29 %24 
                                         f32 %218 = OpLoad %217 
                                         i32 %219 = OpLoad %93 
                                Uniform f32* %220 = OpAccessChain %18 %30 %219 
                                         f32 %221 = OpLoad %220 
                                         f32 %222 = OpFNegate %221 
                                         f32 %223 = OpFAdd %218 %222 
                                Private f32* %224 = OpAccessChain %29 %24 
                                                      OpStore %224 %223 
                                         f32 %225 = OpLoad %59 
                                         f32 %226 = OpExtInst %1 31 %225 
                                                      OpStore %59 %226 
                                Private f32* %227 = OpAccessChain %9 %24 
                                         f32 %228 = OpLoad %227 
                                         f32 %229 = OpFNegate %228 
                                         f32 %230 = OpLoad %59 
                                         f32 %231 = OpFAdd %229 %230 
                                                      OpStore %59 %231 
                                       f32_3 %235 = OpLoad %9 
                                       f32_4 %236 = OpVectorShuffle %235 %235 0 1 0 0 
                                      bool_4 %238 = OpFOrdLessThan %234 %236 
                                      bool_2 %239 = OpVectorShuffle %238 %238 0 1 
                                                      OpStore %233 %239 
                               Private bool* %240 = OpAccessChain %233 %66 
                                        bool %241 = OpLoad %240 
                               Private bool* %242 = OpAccessChain %233 %24 
                                        bool %243 = OpLoad %242 
                                        bool %244 = OpLogicalAnd %241 %243 
                               Private bool* %245 = OpAccessChain %233 %24 
                                                      OpStore %245 %244 
                                  Input f32* %247 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %248 = OpLoad %247 
                                         f32 %249 = OpDPdx %248 
                                Private f32* %250 = OpAccessChain %246 %24 
                                                      OpStore %250 %249 
                                Private f32* %252 = OpAccessChain %246 %24 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpExtInst %1 4 %253 
                                         f32 %255 = OpFDiv %251 %254 
                                Private f32* %256 = OpAccessChain %246 %24 
                                                      OpStore %256 %255 
                                         f32 %257 = OpLoad %59 
                                Private f32* %258 = OpAccessChain %246 %24 
                                         f32 %259 = OpLoad %258 
                                         f32 %260 = OpFMul %257 %259 
                                         f32 %261 = OpFAdd %260 %49 
                                                      OpStore %59 %261 
                                         f32 %262 = OpLoad %59 
                                         f32 %263 = OpExtInst %1 43 %262 %56 %251 
                                                      OpStore %59 %263 
                                Private f32* %264 = OpAccessChain %29 %24 
                                         f32 %265 = OpLoad %264 
                                Private f32* %266 = OpAccessChain %246 %24 
                                         f32 %267 = OpLoad %266 
                                         f32 %268 = OpFMul %265 %267 
                                         f32 %269 = OpFAdd %268 %49 
                                Private f32* %270 = OpAccessChain %246 %24 
                                                      OpStore %270 %269 
                                Private f32* %271 = OpAccessChain %246 %24 
                                         f32 %272 = OpLoad %271 
                                         f32 %273 = OpExtInst %1 43 %272 %56 %251 
                                Private f32* %274 = OpAccessChain %246 %24 
                                                      OpStore %274 %273 
                               Private bool* %275 = OpAccessChain %233 %24 
                                        bool %276 = OpLoad %275 
                                         f32 %277 = OpLoad %59 
                                         f32 %278 = OpSelect %276 %277 %251 
                                Private f32* %279 = OpAccessChain %9 %24 
                                                      OpStore %279 %278 
                                       f32_4 %281 = OpLoad %120 
                                       f32_4 %282 = OpVectorShuffle %281 %281 0 2 0 0 
                                      bool_4 %283 = OpFOrdLessThan %234 %282 
                                      bool_2 %284 = OpVectorShuffle %283 %283 0 1 
                                                      OpStore %280 %284 
                               Private bool* %286 = OpAccessChain %280 %66 
                                        bool %287 = OpLoad %286 
                               Private bool* %288 = OpAccessChain %280 %24 
                                        bool %289 = OpLoad %288 
                                        bool %290 = OpLogicalOr %287 %289 
                                                      OpStore %285 %290 
                                        bool %291 = OpLoad %285 
                                                      OpSelectionMerge %295 None 
                                                      OpBranchConditional %291 %294 %298 
                                             %294 = OpLabel 
                                Private f32* %296 = OpAccessChain %9 %24 
                                         f32 %297 = OpLoad %296 
                                                      OpStore %293 %297 
                                                      OpBranch %295 
                                             %298 = OpLabel 
                                                      OpStore %293 %56 
                                                      OpBranch %295 
                                             %295 = OpLabel 
                                         f32 %299 = OpLoad %293 
                                Private f32* %300 = OpAccessChain %9 %24 
                                                      OpStore %300 %299 
                                        bool %301 = OpLoad %285 
                                                      OpSelectionMerge %304 None 
                                                      OpBranchConditional %301 %303 %307 
                                             %303 = OpLabel 
                                Private f32* %305 = OpAccessChain %246 %24 
                                         f32 %306 = OpLoad %305 
                                                      OpStore %302 %306 
                                                      OpBranch %304 
                                             %307 = OpLabel 
                                                      OpStore %302 %56 
                                                      OpBranch %304 
                                             %304 = OpLabel 
                                         f32 %308 = OpLoad %302 
                                Private f32* %309 = OpAccessChain %246 %24 
                                                      OpStore %309 %308 
                                Private f32* %310 = OpAccessChain %246 %24 
                                         f32 %311 = OpLoad %310 
                                        bool %312 = OpFOrdEqual %311 %56 
                                                      OpStore %285 %312 
                                Private f32* %313 = OpAccessChain %246 %24 
                                         f32 %314 = OpLoad %313 
                                         f32 %315 = OpFNegate %314 
                                         f32 %316 = OpFAdd %315 %251 
                                Private f32* %317 = OpAccessChain %246 %24 
                                                      OpStore %317 %316 
                                        bool %318 = OpLoad %285 
                                                      OpSelectionMerge %321 None 
                                                      OpBranchConditional %318 %320 %324 
                                             %320 = OpLabel 
                                Private f32* %322 = OpAccessChain %9 %24 
                                         f32 %323 = OpLoad %322 
                                                      OpStore %319 %323 
                                                      OpBranch %321 
                                             %324 = OpLabel 
                                Private f32* %325 = OpAccessChain %246 %24 
                                         f32 %326 = OpLoad %325 
                                                      OpStore %319 %326 
                                                      OpBranch %321 
                                             %321 = OpLabel 
                                         f32 %327 = OpLoad %319 
                                Private f32* %328 = OpAccessChain %9 %24 
                                                      OpStore %328 %327 
                                       f32_4 %332 = OpLoad %120 
                                       f32_4 %333 = OpVectorShuffle %332 %332 1 1 3 3 
                                       f32_4 %334 = OpLoad vs_TEXCOORD2 
                                       f32_4 %335 = OpVectorShuffle %334 %334 0 0 1 1 
                                      bool_4 %336 = OpFOrdGreaterThanEqual %333 %335 
                                      bool_2 %337 = OpVectorShuffle %336 %336 0 2 
                                      bool_3 %338 = OpLoad %331 
                                      bool_3 %339 = OpVectorShuffle %338 %337 3 1 4 
                                                      OpStore %331 %339 
                                       f32_4 %340 = OpLoad vs_TEXCOORD2 
                                       f32_4 %341 = OpVectorShuffle %340 %340 0 1 0 0 
                                       f32_4 %342 = OpLoad %120 
                                       f32_4 %343 = OpVectorShuffle %342 %342 1 3 1 1 
                                      bool_4 %344 = OpFOrdGreaterThanEqual %341 %343 
                                      bool_2 %345 = OpVectorShuffle %344 %344 0 1 
                                                      OpStore %280 %345 
                                        bool %346 = OpLoad %55 
                                                      OpSelectionMerge %350 None 
                                                      OpBranchConditional %346 %349 %353 
                                             %349 = OpLabel 
                               Private bool* %351 = OpAccessChain %331 %24 
                                        bool %352 = OpLoad %351 
                                                      OpStore %348 %352 
                                                      OpBranch %350 
                                             %353 = OpLabel 
                               Private bool* %354 = OpAccessChain %280 %24 
                                        bool %355 = OpLoad %354 
                                                      OpStore %348 %355 
                                                      OpBranch %350 
                                             %350 = OpLabel 
                                        bool %356 = OpLoad %348 
                               Private bool* %357 = OpAccessChain %331 %24 
                                                      OpStore %357 %356 
                                        bool %358 = OpLoad %80 
                                                      OpSelectionMerge %361 None 
                                                      OpBranchConditional %358 %360 %364 
                                             %360 = OpLabel 
                               Private bool* %362 = OpAccessChain %331 %200 
                                        bool %363 = OpLoad %362 
                                                      OpStore %359 %363 
                                                      OpBranch %361 
                                             %364 = OpLabel 
                               Private bool* %365 = OpAccessChain %280 %66 
                                        bool %366 = OpLoad %365 
                                                      OpStore %359 %366 
                                                      OpBranch %361 
                                             %361 = OpLabel 
                                        bool %367 = OpLoad %359 
                                                      OpStore %55 %367 
                                        bool %368 = OpLoad %55 
                               Private bool* %369 = OpAccessChain %331 %24 
                                        bool %370 = OpLoad %369 
                                        bool %371 = OpLogicalAnd %368 %370 
                               Private bool* %372 = OpAccessChain %331 %24 
                                                      OpStore %372 %371 
                               Private bool* %373 = OpAccessChain %331 %24 
                                        bool %374 = OpLoad %373 
                                                      OpSelectionMerge %377 None 
                                                      OpBranchConditional %374 %376 %380 
                                             %376 = OpLabel 
                                Private f32* %378 = OpAccessChain %9 %24 
                                         f32 %379 = OpLoad %378 
                                                      OpStore %375 %379 
                                                      OpBranch %377 
                                             %380 = OpLabel 
                                                      OpStore %375 %251 
                                                      OpBranch %377 
                                             %377 = OpLabel 
                                         f32 %381 = OpLoad %375 
                                Private f32* %382 = OpAccessChain %9 %24 
                                                      OpStore %382 %381 
                                Uniform f32* %383 = OpAccessChain %18 %19 %20 
                                         f32 %384 = OpLoad %383 
                                Uniform f32* %385 = OpAccessChain %18 %19 %30 
                                         f32 %386 = OpLoad %385 
                                         f32 %387 = OpFAdd %384 %386 
                                                      OpStore %34 %387 
                                         f32 %388 = OpLoad %34 
                                         f32 %389 = OpFNegate %388 
                                Uniform f32* %390 = OpAccessChain %18 %41 %30 
                                         f32 %391 = OpLoad %390 
                                         f32 %392 = OpFAdd %389 %391 
                                                      OpStore %34 %392 
                                Uniform f32* %393 = OpAccessChain %18 %19 %20 
                                         f32 %394 = OpLoad %393 
                                Uniform f32* %395 = OpAccessChain %18 %41 %20 
                                         f32 %396 = OpLoad %395 
                                         f32 %397 = OpFAdd %394 %396 
                                                      OpStore %59 %397 
                                         f32 %398 = OpLoad %34 
                                         f32 %399 = OpLoad %59 
                                         f32 %400 = OpFAdd %398 %399 
                                                      OpStore %34 %400 
                                  Input f32* %401 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %402 = OpLoad %401 
                                         f32 %403 = OpLoad %59 
                                        bool %404 = OpFOrdGreaterThanEqual %402 %403 
                                                      OpStore %285 %404 
                                         f32 %405 = OpLoad %34 
                                  Input f32* %406 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %407 = OpLoad %406 
                                        bool %408 = OpFOrdGreaterThanEqual %405 %407 
                                                      OpStore %55 %408 
                                        bool %409 = OpLoad %55 
                                        bool %410 = OpLoad %285 
                                        bool %411 = OpLogicalAnd %409 %410 
                                                      OpStore %55 %411 
                                Uniform f32* %412 = OpAccessChain %18 %19 %69 
                                         f32 %413 = OpLoad %412 
                                Uniform f32* %414 = OpAccessChain %18 %41 %69 
                                         f32 %415 = OpLoad %414 
                                         f32 %416 = OpFAdd %413 %415 
                                                      OpStore %59 %416 
                                  Input f32* %417 = OpAccessChain vs_TEXCOORD2 %66 
                                         f32 %418 = OpLoad %417 
                                         f32 %419 = OpLoad %59 
                                        bool %420 = OpFOrdGreaterThanEqual %418 %419 
                               Private bool* %421 = OpAccessChain %280 %24 
                                                      OpStore %421 %420 
                                        bool %422 = OpLoad %55 
                               Private bool* %423 = OpAccessChain %280 %24 
                                        bool %424 = OpLoad %423 
                                        bool %425 = OpLogicalAnd %422 %424 
                                                      OpStore %55 %425 
                                Uniform f32* %426 = OpAccessChain %18 %19 %69 
                                         f32 %427 = OpLoad %426 
                                Uniform f32* %428 = OpAccessChain %18 %19 %19 
                                         f32 %429 = OpLoad %428 
                                         f32 %430 = OpFAdd %427 %429 
                                Private f32* %431 = OpAccessChain %29 %24 
                                                      OpStore %431 %430 
                                Private f32* %432 = OpAccessChain %29 %24 
                                         f32 %433 = OpLoad %432 
                                         f32 %434 = OpFNegate %433 
                                Uniform f32* %435 = OpAccessChain %18 %41 %19 
                                         f32 %436 = OpLoad %435 
                                         f32 %437 = OpFAdd %434 %436 
                                Private f32* %438 = OpAccessChain %29 %24 
                                                      OpStore %438 %437 
                                         f32 %439 = OpLoad %59 
                                Private f32* %440 = OpAccessChain %29 %24 
                                         f32 %441 = OpLoad %440 
                                         f32 %442 = OpFAdd %439 %441 
                                                      OpStore %59 %442 
                                         f32 %443 = OpLoad %59 
                                  Input f32* %444 = OpAccessChain vs_TEXCOORD2 %66 
                                         f32 %445 = OpLoad %444 
                                        bool %446 = OpFOrdGreaterThanEqual %443 %445 
                                                      OpStore %285 %446 
                                        bool %447 = OpLoad %285 
                                        bool %448 = OpLoad %55 
                                        bool %449 = OpLogicalAnd %447 %448 
                                                      OpStore %55 %449 
                                        bool %450 = OpLoad %55 
                                         f32 %451 = OpSelect %450 %56 %251 
                                                      OpStore %34 %451 
                               Private bool* %452 = OpAccessChain %331 %24 
                                        bool %453 = OpLoad %452 
                                         f32 %454 = OpLoad %34 
                                         f32 %455 = OpSelect %453 %251 %454 
                                Private f32* %456 = OpAccessChain %246 %24 
                                                      OpStore %456 %455 
                                Uniform f32* %457 = OpAccessChain %18 %19 %20 
                                         f32 %458 = OpLoad %457 
                                        bool %459 = OpFOrdLessThan %56 %458 
                                                      OpStore %55 %459 
                                Uniform f32* %460 = OpAccessChain %18 %19 %69 
                                         f32 %461 = OpLoad %460 
                                        bool %462 = OpFOrdLessThan %56 %461 
                                                      OpStore %285 %462 
                                        bool %463 = OpLoad %285 
                                        bool %464 = OpLoad %55 
                                        bool %465 = OpLogicalOr %463 %464 
                                                      OpStore %55 %465 
                                Uniform f32* %466 = OpAccessChain %18 %19 %30 
                                         f32 %467 = OpLoad %466 
                                        bool %468 = OpFOrdLessThan %56 %467 
                                                      OpStore %285 %468 
                                        bool %469 = OpLoad %285 
                                        bool %470 = OpLoad %55 
                                        bool %471 = OpLogicalOr %469 %470 
                                                      OpStore %55 %471 
                                Uniform f32* %472 = OpAccessChain %18 %19 %19 
                                         f32 %473 = OpLoad %472 
                                        bool %474 = OpFOrdLessThan %56 %473 
                                                      OpStore %285 %474 
                                        bool %475 = OpLoad %285 
                                        bool %476 = OpLoad %55 
                                        bool %477 = OpLogicalOr %475 %476 
                                                      OpStore %55 %477 
                                        bool %478 = OpLoad %55 
                                                      OpSelectionMerge %481 None 
                                                      OpBranchConditional %478 %480 %484 
                                             %480 = OpLabel 
                                Private f32* %482 = OpAccessChain %246 %24 
                                         f32 %483 = OpLoad %482 
                                                      OpStore %479 %483 
                                                      OpBranch %481 
                                             %484 = OpLabel 
                                                      OpStore %479 %251 
                                                      OpBranch %481 
                                             %481 = OpLabel 
                                         f32 %485 = OpLoad %479 
                                Private f32* %486 = OpAccessChain %246 %24 
                                                      OpStore %486 %485 
                                Private f32* %487 = OpAccessChain %246 %24 
                                         f32 %488 = OpLoad %487 
                                Private f32* %489 = OpAccessChain %9 %24 
                                         f32 %490 = OpLoad %489 
                                         f32 %491 = OpFMul %488 %490 
                                Private f32* %492 = OpAccessChain %9 %200 
                                                      OpStore %492 %491 
                         read_only Texture2D %496 = OpLoad %495 
                                     sampler %500 = OpLoad %499 
                  read_only Texture2DSampled %502 = OpSampledImage %496 %500 
                                       f32_2 %505 = OpLoad vs_TEXCOORD1 
                                       f32_4 %506 = OpImageSampleImplicitLod %502 %505 
                                         f32 %508 = OpCompositeExtract %506 3 
                                Private f32* %509 = OpAccessChain %246 %200 
                                                      OpStore %509 %508 
                         read_only Texture2D %512 = OpLoad %511 
                                     sampler %514 = OpLoad %513 
                  read_only Texture2DSampled %515 = OpSampledImage %512 %514 
                                       f32_2 %517 = OpLoad vs_TEXCOORD0 
                                       f32_4 %518 = OpImageSampleImplicitLod %515 %517 
                                                      OpStore %510 %518 
                                       f32_4 %520 = OpLoad %510 
                                       f32_3 %521 = OpVectorShuffle %520 %520 0 1 2 
                                       f32_3 %523 = OpExtInst %1 40 %521 %522 
                                                      OpStore %519 %523 
                                       f32_3 %525 = OpLoad %519 
                                       f32_3 %526 = OpExtInst %1 30 %525 
                                                      OpStore %524 %526 
                                       f32_3 %527 = OpLoad %524 
                                       f32_3 %530 = OpFMul %527 %529 
                                                      OpStore %524 %530 
                                       f32_3 %531 = OpLoad %524 
                                       f32_3 %532 = OpExtInst %1 29 %531 
                                                      OpStore %524 %532 
                                       f32_3 %533 = OpLoad %524 
                                       f32_3 %536 = OpFMul %533 %535 
                                       f32_3 %539 = OpFAdd %536 %538 
                                                      OpStore %524 %539 
                                       f32_3 %540 = OpLoad %524 
                                       f32_3 %541 = OpExtInst %1 40 %540 %522 
                                       f32_4 %542 = OpLoad %120 
                                       f32_4 %543 = OpVectorShuffle %542 %541 4 5 6 3 
                                                      OpStore %120 %543 
                                Uniform i32* %545 = OpAccessChain %18 %20 
                                         i32 %546 = OpLoad %545 
                                        bool %547 = OpINotEqual %546 %20 
                                                      OpSelectionMerge %551 None 
                                                      OpBranchConditional %547 %550 %554 
                                             %550 = OpLabel 
                                       f32_4 %552 = OpLoad %120 
                                       f32_3 %553 = OpVectorShuffle %552 %552 0 1 2 
                                                      OpStore %549 %553 
                                                      OpBranch %551 
                                             %554 = OpLabel 
                                       f32_4 %555 = OpLoad %510 
                                       f32_3 %556 = OpVectorShuffle %555 %555 0 1 2 
                                                      OpStore %549 %556 
                                                      OpBranch %551 
                                             %551 = OpLabel 
                                       f32_3 %557 = OpLoad %549 
                                                      OpStore %519 %557 
                                Private f32* %559 = OpAccessChain %510 %507 
                                         f32 %560 = OpLoad %559 
                                  Input f32* %562 = OpAccessChain %561 %507 
                                         f32 %563 = OpLoad %562 
                                         f32 %564 = OpFMul %560 %563 
                                                      OpStore %558 %564 
                                Private f32* %565 = OpAccessChain %9 %24 
                                         f32 %566 = OpLoad %565 
                                         f32 %567 = OpLoad %558 
                                         f32 %568 = OpFMul %566 %567 
                                Private f32* %569 = OpAccessChain %9 %24 
                                                      OpStore %569 %568 
                                       f32_3 %570 = OpLoad %246 
                                       f32_2 %571 = OpVectorShuffle %570 %570 0 2 
                                       f32_3 %572 = OpLoad %9 
                                       f32_2 %573 = OpVectorShuffle %572 %572 0 2 
                                       f32_2 %574 = OpFMul %571 %573 
                                       f32_3 %575 = OpLoad %9 
                                       f32_3 %576 = OpVectorShuffle %575 %574 3 1 4 
                                                      OpStore %9 %576 
                                Private f32* %577 = OpAccessChain %246 %200 
                                         f32 %578 = OpLoad %577 
                                Private f32* %579 = OpAccessChain %9 %24 
                                         f32 %580 = OpLoad %579 
                                         f32 %581 = OpFMul %578 %580 
                                Private f32* %582 = OpAccessChain %9 %24 
                                                      OpStore %582 %581 
                                Private f32* %585 = OpAccessChain %9 %24 
                                         f32 %586 = OpLoad %585 
                                 Output f32* %588 = OpAccessChain %584 %507 
                                                      OpStore %588 %586 
                                       f32_3 %589 = OpLoad %519 
                                       f32_4 %590 = OpLoad %561 
                                       f32_3 %591 = OpVectorShuffle %590 %590 0 1 2 
                                       f32_3 %592 = OpFMul %589 %591 
                                                      OpStore %519 %592 
                                       f32_3 %593 = OpLoad %9 
                                       f32_3 %594 = OpVectorShuffle %593 %593 2 2 2 
                                       f32_3 %595 = OpLoad %519 
                                       f32_3 %596 = OpFMul %594 %595 
                                                      OpStore %9 %596 
                                Uniform i32* %597 = OpAccessChain %18 %69 
                                         i32 %598 = OpLoad %597 
                                        bool %600 = OpINotEqual %598 %599 
                                                      OpStore %285 %600 
                                        bool %601 = OpLoad %285 
                                                      OpSelectionMerge %604 None 
                                                      OpBranchConditional %601 %603 %606 
                                             %603 = OpLabel 
                                       f32_3 %605 = OpLoad %9 
                                                      OpStore %602 %605 
                                                      OpBranch %604 
                                             %606 = OpLabel 
                                       f32_3 %607 = OpLoad %519 
                                                      OpStore %602 %607 
                                                      OpBranch %604 
                                             %604 = OpLabel 
                                       f32_3 %608 = OpLoad %602 
                                       f32_4 %609 = OpLoad %584 
                                       f32_4 %610 = OpVectorShuffle %609 %608 4 5 6 3 
                                                      OpStore %584 %610 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 176
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %74 %84 %85 %149 %156 %158 %168 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpMemberDecorate %72 0 BuiltIn 72 
                                                      OpMemberDecorate %72 1 BuiltIn 72 
                                                      OpMemberDecorate %72 2 BuiltIn 72 
                                                      OpDecorate %72 Block 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 149 
                                                      OpDecorate vs_TEXCOORD0 Location 156 
                                                      OpDecorate %158 Location 158 
                                                      OpDecorate vs_TEXCOORD2 Location 168 
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
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeArray %7 %15 
                                              %20 = OpTypeStruct %16 %17 %18 %7 %19 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4[4];}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 0 
                                          i32 %25 = OpConstant 1 
                                              %26 = OpTypePointer Uniform %7 
                                          i32 %37 = OpConstant 2 
                                          i32 %46 = OpConstant 3 
                               Private f32_4* %50 = OpVariable Private 
                                          u32 %70 = OpConstant 1 
                                              %71 = OpTypeArray %6 %70 
                                              %72 = OpTypeStruct %7 %6 %71 
                                              %73 = OpTypePointer Output %72 
         Output struct {f32_4; f32; f32[1];}* %74 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                Output f32_4* %84 = OpVariable Output 
                                 Input f32_4* %85 = OpVariable Input 
                                              %87 = OpTypeVector %6 2 
                                             %129 = OpTypePointer Private %87 
                              Private f32_2* %130 = OpVariable Private 
                                         i32 %133 = OpConstant 4 
                                             %148 = OpTypePointer Output %87 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %157 = OpTypePointer Input %87 
                                Input f32_2* %158 = OpVariable Input 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                             %170 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %27 = OpAccessChain %22 %24 %25 
                                        f32_4 %28 = OpLoad %27 
                                        f32_4 %29 = OpFMul %13 %28 
                                                      OpStore %9 %29 
                               Uniform f32_4* %30 = OpAccessChain %22 %24 %24 
                                        f32_4 %31 = OpLoad %30 
                                        f32_4 %32 = OpLoad %11 
                                        f32_4 %33 = OpVectorShuffle %32 %32 0 0 0 0 
                                        f32_4 %34 = OpFMul %31 %33 
                                        f32_4 %35 = OpLoad %9 
                                        f32_4 %36 = OpFAdd %34 %35 
                                                      OpStore %9 %36 
                               Uniform f32_4* %38 = OpAccessChain %22 %24 %37 
                                        f32_4 %39 = OpLoad %38 
                                        f32_4 %40 = OpLoad %11 
                                        f32_4 %41 = OpVectorShuffle %40 %40 2 2 2 2 
                                        f32_4 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpFAdd %42 %43 
                                                      OpStore %9 %44 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %22 %24 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %9 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_4 %52 = OpVectorShuffle %51 %51 1 1 1 1 
                               Uniform f32_4* %53 = OpAccessChain %22 %37 %25 
                                        f32_4 %54 = OpLoad %53 
                                        f32_4 %55 = OpFMul %52 %54 
                                                      OpStore %50 %55 
                               Uniform f32_4* %56 = OpAccessChain %22 %37 %24 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                                        f32_4 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %50 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %50 %62 
                               Uniform f32_4* %63 = OpAccessChain %22 %37 %37 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpVectorShuffle %65 %65 2 2 2 2 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %50 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %50 %69 
                               Uniform f32_4* %75 = OpAccessChain %22 %37 %46 
                                        f32_4 %76 = OpLoad %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpVectorShuffle %77 %77 3 3 3 3 
                                        f32_4 %79 = OpFMul %76 %78 
                                        f32_4 %80 = OpLoad %50 
                                        f32_4 %81 = OpFAdd %79 %80 
                                Output f32_4* %83 = OpAccessChain %74 %24 
                                                      OpStore %83 %81 
                                        f32_4 %86 = OpLoad %85 
                                                      OpStore %84 %86 
                                        f32_4 %88 = OpLoad %9 
                                        f32_2 %89 = OpVectorShuffle %88 %88 1 1 
                               Uniform f32_4* %90 = OpAccessChain %22 %25 %25 
                                        f32_4 %91 = OpLoad %90 
                                        f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                        f32_2 %93 = OpFMul %89 %92 
                                        f32_4 %94 = OpLoad %50 
                                        f32_4 %95 = OpVectorShuffle %94 %93 4 5 2 3 
                                                      OpStore %50 %95 
                               Uniform f32_4* %96 = OpAccessChain %22 %25 %24 
                                        f32_4 %97 = OpLoad %96 
                                        f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                                        f32_4 %99 = OpLoad %9 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 0 
                                       f32_2 %101 = OpFMul %98 %100 
                                       f32_4 %102 = OpLoad %50 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFAdd %101 %103 
                                       f32_4 %105 = OpLoad %9 
                                       f32_4 %106 = OpVectorShuffle %105 %104 4 5 2 3 
                                                      OpStore %9 %106 
                              Uniform f32_4* %107 = OpAccessChain %22 %25 %37 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                       f32_4 %110 = OpLoad %9 
                                       f32_2 %111 = OpVectorShuffle %110 %110 2 2 
                                       f32_2 %112 = OpFMul %109 %111 
                                       f32_4 %113 = OpLoad %9 
                                       f32_2 %114 = OpVectorShuffle %113 %113 0 1 
                                       f32_2 %115 = OpFAdd %112 %114 
                                       f32_4 %116 = OpLoad %9 
                                       f32_4 %117 = OpVectorShuffle %116 %115 4 5 2 3 
                                                      OpStore %9 %117 
                              Uniform f32_4* %118 = OpAccessChain %22 %25 %46 
                                       f32_4 %119 = OpLoad %118 
                                       f32_2 %120 = OpVectorShuffle %119 %119 0 1 
                                       f32_4 %121 = OpLoad %9 
                                       f32_2 %122 = OpVectorShuffle %121 %121 3 3 
                                       f32_2 %123 = OpFMul %120 %122 
                                       f32_4 %124 = OpLoad %9 
                                       f32_2 %125 = OpVectorShuffle %124 %124 0 1 
                                       f32_2 %126 = OpFAdd %123 %125 
                                       f32_4 %127 = OpLoad %9 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 2 3 
                                                      OpStore %9 %128 
                                       f32_4 %131 = OpLoad %9 
                                       f32_2 %132 = OpVectorShuffle %131 %131 1 1 
                              Uniform f32_4* %134 = OpAccessChain %22 %133 %25 
                                       f32_4 %135 = OpLoad %134 
                                       f32_2 %136 = OpVectorShuffle %135 %135 0 1 
                                       f32_2 %137 = OpFMul %132 %136 
                                                      OpStore %130 %137 
                              Uniform f32_4* %138 = OpAccessChain %22 %133 %24 
                                       f32_4 %139 = OpLoad %138 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_4 %141 = OpLoad %9 
                                       f32_2 %142 = OpVectorShuffle %141 %141 0 0 
                                       f32_2 %143 = OpFMul %140 %142 
                                       f32_2 %144 = OpLoad %130 
                                       f32_2 %145 = OpFAdd %143 %144 
                                       f32_4 %146 = OpLoad %9 
                                       f32_4 %147 = OpVectorShuffle %146 %145 4 5 2 3 
                                                      OpStore %9 %147 
                                       f32_4 %150 = OpLoad %9 
                                       f32_2 %151 = OpVectorShuffle %150 %150 0 1 
                              Uniform f32_4* %152 = OpAccessChain %22 %133 %46 
                                       f32_4 %153 = OpLoad %152 
                                       f32_2 %154 = OpVectorShuffle %153 %153 0 1 
                                       f32_2 %155 = OpFAdd %151 %154 
                                                      OpStore vs_TEXCOORD1 %155 
                                       f32_2 %159 = OpLoad %158 
                              Uniform f32_4* %160 = OpAccessChain %22 %46 
                                       f32_4 %161 = OpLoad %160 
                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                       f32_2 %163 = OpFMul %159 %162 
                              Uniform f32_4* %164 = OpAccessChain %22 %46 
                                       f32_4 %165 = OpLoad %164 
                                       f32_2 %166 = OpVectorShuffle %165 %165 2 3 
                                       f32_2 %167 = OpFAdd %163 %166 
                                                      OpStore vs_TEXCOORD0 %167 
                                       f32_4 %169 = OpLoad %11 
                                                      OpStore vs_TEXCOORD2 %169 
                                 Output f32* %171 = OpAccessChain %74 %24 %70 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpFNegate %172 
                                 Output f32* %174 = OpAccessChain %74 %24 %70 
                                                      OpStore %174 %173 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 612
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %37 %504 %516 %561 %584 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpMemberDecorate %16 0 Offset 16 
                                                      OpMemberDecorate %16 1 Offset 16 
                                                      OpMemberDecorate %16 2 Offset 16 
                                                      OpMemberDecorate %16 3 Offset 16 
                                                      OpMemberDecorate %16 4 Offset 16 
                                                      OpDecorate %16 Block 
                                                      OpDecorate %18 DescriptorSet 18 
                                                      OpDecorate %18 Binding 18 
                                                      OpDecorate vs_TEXCOORD2 Location 37 
                                                      OpDecorate %495 RelaxedPrecision 
                                                      OpDecorate %495 DescriptorSet 495 
                                                      OpDecorate %495 Binding 495 
                                                      OpDecorate %496 RelaxedPrecision 
                                                      OpDecorate %499 RelaxedPrecision 
                                                      OpDecorate %499 DescriptorSet 499 
                                                      OpDecorate %499 Binding 499 
                                                      OpDecorate %500 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 504 
                                                      OpDecorate %510 RelaxedPrecision 
                                                      OpDecorate %511 RelaxedPrecision 
                                                      OpDecorate %511 DescriptorSet 511 
                                                      OpDecorate %511 Binding 511 
                                                      OpDecorate %512 RelaxedPrecision 
                                                      OpDecorate %513 RelaxedPrecision 
                                                      OpDecorate %513 DescriptorSet 513 
                                                      OpDecorate %513 Binding 513 
                                                      OpDecorate %514 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 516 
                                                      OpDecorate %519 RelaxedPrecision 
                                                      OpDecorate %520 RelaxedPrecision 
                                                      OpDecorate %521 RelaxedPrecision 
                                                      OpDecorate %523 RelaxedPrecision 
                                                      OpDecorate %524 RelaxedPrecision 
                                                      OpDecorate %525 RelaxedPrecision 
                                                      OpDecorate %526 RelaxedPrecision 
                                                      OpDecorate %527 RelaxedPrecision 
                                                      OpDecorate %530 RelaxedPrecision 
                                                      OpDecorate %531 RelaxedPrecision 
                                                      OpDecorate %532 RelaxedPrecision 
                                                      OpDecorate %533 RelaxedPrecision 
                                                      OpDecorate %536 RelaxedPrecision 
                                                      OpDecorate %539 RelaxedPrecision 
                                                      OpDecorate %540 RelaxedPrecision 
                                                      OpDecorate %541 RelaxedPrecision 
                                                      OpDecorate %555 RelaxedPrecision 
                                                      OpDecorate %556 RelaxedPrecision 
                                                      OpDecorate %558 RelaxedPrecision 
                                                      OpDecorate %560 RelaxedPrecision 
                                                      OpDecorate %561 RelaxedPrecision 
                                                      OpDecorate %561 Location 561 
                                                      OpDecorate %563 RelaxedPrecision 
                                                      OpDecorate %564 RelaxedPrecision 
                                                      OpDecorate %567 RelaxedPrecision 
                                                      OpDecorate %584 RelaxedPrecision 
                                                      OpDecorate %584 Location 584 
                                                      OpDecorate %589 RelaxedPrecision 
                                                      OpDecorate %590 RelaxedPrecision 
                                                      OpDecorate %591 RelaxedPrecision 
                                                      OpDecorate %592 RelaxedPrecision 
                                                      OpDecorate %595 RelaxedPrecision 
                                                      OpDecorate %607 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 1 
                                              %11 = OpTypeInt 32 0 
                                          u32 %12 = OpConstant 4 
                                              %13 = OpTypeArray %6 %12 
                                              %14 = OpTypeArray %6 %12 
                                              %15 = OpTypeArray %6 %12 
                                              %16 = OpTypeStruct %10 %10 %13 %14 %15 
                                              %17 = OpTypePointer Uniform %16 
Uniform struct {i32; i32; f32[4]; f32[4]; f32[4];}* %18 = OpVariable Uniform 
                                          i32 %19 = OpConstant 3 
                                          i32 %20 = OpConstant 0 
                                              %21 = OpTypePointer Uniform %6 
                                          u32 %24 = OpConstant 0 
                                              %25 = OpTypePointer Private %6 
                                              %27 = OpTypeVector %6 2 
                                              %28 = OpTypePointer Private %27 
                               Private f32_2* %29 = OpVariable Private 
                                          i32 %30 = OpConstant 2 
                                 Private f32* %34 = OpVariable Private 
                                              %35 = OpTypeVector %6 4 
                                              %36 = OpTypePointer Input %35 
                        Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                              %38 = OpTypePointer Input %6 
                                          i32 %41 = OpConstant 4 
                                          f32 %49 = OpConstant 3.674022E-40 
                                              %53 = OpTypeBool 
                                              %54 = OpTypePointer Private %53 
                                Private bool* %55 = OpVariable Private 
                                          f32 %56 = OpConstant 3.674022E-40 
                                 Private f32* %59 = OpVariable Private 
                                 Private f32* %65 = OpVariable Private 
                                          u32 %66 = OpConstant 1 
                                          i32 %69 = OpConstant 1 
                                Private bool* %80 = OpVariable Private 
                                              %83 = OpTypeVector %10 2 
                                              %84 = OpTypePointer Private %83 
                               Private i32_2* %85 = OpVariable Private 
                                        i32_2 %87 = OpConstantComposite %20 %69 
                                        i32_2 %88 = OpConstantComposite %19 %30 
                                              %89 = OpTypeVector %53 2 
                                              %92 = OpTypePointer Private %10 
                                 Private i32* %93 = OpVariable Private 
                                              %95 = OpTypePointer Function %10 
                                             %119 = OpTypePointer Private %35 
                              Private f32_4* %120 = OpVariable Private 
                                             %122 = OpTypePointer Function %27 
                              Private f32_2* %133 = OpVariable Private 
                              Private f32_2* %137 = OpVariable Private 
                              Private f32_3* %187 = OpVariable Private 
                                         u32 %200 = OpConstant 2 
                                             %232 = OpTypePointer Private %89 
                             Private bool_2* %233 = OpVariable Private 
                                       f32_4 %234 = OpConstantComposite %56 %56 %56 %56 
                                             %237 = OpTypeVector %53 4 
                              Private f32_3* %246 = OpVariable Private 
                                         f32 %251 = OpConstant 3.674022E-40 
                             Private bool_2* %280 = OpVariable Private 
                               Private bool* %285 = OpVariable Private 
                                             %292 = OpTypePointer Function %6 
                                             %329 = OpTypeVector %53 3 
                                             %330 = OpTypePointer Private %329 
                             Private bool_3* %331 = OpVariable Private 
                                             %347 = OpTypePointer Function %53 
                                             %493 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %494 = OpTypePointer UniformConstant %493 
        UniformConstant read_only Texture2D* %495 = OpVariable UniformConstant 
                                             %497 = OpTypeSampler 
                                             %498 = OpTypePointer UniformConstant %497 
                    UniformConstant sampler* %499 = OpVariable UniformConstant 
                                             %501 = OpTypeSampledImage %493 
                                             %503 = OpTypePointer Input %27 
                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                         u32 %507 = OpConstant 3 
                              Private f32_4* %510 = OpVariable Private 
        UniformConstant read_only Texture2D* %511 = OpVariable UniformConstant 
                    UniformConstant sampler* %513 = OpVariable UniformConstant 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                              Private f32_3* %519 = OpVariable Private 
                                       f32_3 %522 = OpConstantComposite %56 %56 %56 
                              Private f32_3* %524 = OpVariable Private 
                                         f32 %528 = OpConstant 3.674022E-40 
                                       f32_3 %529 = OpConstantComposite %528 %528 %528 
                                         f32 %534 = OpConstant 3.674022E-40 
                                       f32_3 %535 = OpConstantComposite %534 %534 %534 
                                         f32 %537 = OpConstant 3.674022E-40 
                                       f32_3 %538 = OpConstantComposite %537 %537 %537 
                                             %544 = OpTypePointer Uniform %10 
                                             %548 = OpTypePointer Function %7 
                                Private f32* %558 = OpVariable Private 
                                Input f32_4* %561 = OpVariable Input 
                                             %583 = OpTypePointer Output %35 
                               Output f32_4* %584 = OpVariable Output 
                                             %587 = OpTypePointer Output %6 
                                         i32 %599 = OpConstant 5 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function i32* %96 = OpVariable Function 
                             Function f32_2* %123 = OpVariable Function 
                             Function f32_2* %163 = OpVariable Function 
                               Function f32* %293 = OpVariable Function 
                               Function f32* %302 = OpVariable Function 
                               Function f32* %319 = OpVariable Function 
                              Function bool* %348 = OpVariable Function 
                              Function bool* %359 = OpVariable Function 
                               Function f32* %375 = OpVariable Function 
                               Function f32* %479 = OpVariable Function 
                             Function f32_3* %549 = OpVariable Function 
                             Function f32_3* %602 = OpVariable Function 
                                 Uniform f32* %22 = OpAccessChain %18 %19 %20 
                                          f32 %23 = OpLoad %22 
                                 Private f32* %26 = OpAccessChain %9 %24 
                                                      OpStore %26 %23 
                                 Uniform f32* %31 = OpAccessChain %18 %19 %30 
                                          f32 %32 = OpLoad %31 
                                 Private f32* %33 = OpAccessChain %29 %24 
                                                      OpStore %33 %32 
                                   Input f32* %39 = OpAccessChain vs_TEXCOORD2 %24 
                                          f32 %40 = OpLoad %39 
                                 Uniform f32* %42 = OpAccessChain %18 %41 %20 
                                          f32 %43 = OpLoad %42 
                                          f32 %44 = OpFNegate %43 
                                          f32 %45 = OpFAdd %40 %44 
                                                      OpStore %34 %45 
                                 Uniform f32* %46 = OpAccessChain %18 %41 %30 
                                          f32 %47 = OpLoad %46 
                                          f32 %48 = OpFNegate %47 
                                          f32 %50 = OpFMul %48 %49 
                                          f32 %51 = OpLoad %34 
                                          f32 %52 = OpFAdd %50 %51 
                                                      OpStore %34 %52 
                                          f32 %57 = OpLoad %34 
                                         bool %58 = OpFOrdGreaterThanEqual %56 %57 
                                                      OpStore %55 %58 
                                 Uniform f32* %60 = OpAccessChain %18 %41 %20 
                                          f32 %61 = OpLoad %60 
                                 Uniform f32* %62 = OpAccessChain %18 %41 %30 
                                          f32 %63 = OpLoad %62 
                                          f32 %64 = OpFAdd %61 %63 
                                                      OpStore %59 %64 
                                   Input f32* %67 = OpAccessChain vs_TEXCOORD2 %66 
                                          f32 %68 = OpLoad %67 
                                 Uniform f32* %70 = OpAccessChain %18 %41 %69 
                                          f32 %71 = OpLoad %70 
                                          f32 %72 = OpFNegate %71 
                                          f32 %73 = OpFAdd %68 %72 
                                                      OpStore %65 %73 
                                 Uniform f32* %74 = OpAccessChain %18 %41 %19 
                                          f32 %75 = OpLoad %74 
                                          f32 %76 = OpFNegate %75 
                                          f32 %77 = OpFMul %76 %49 
                                          f32 %78 = OpLoad %65 
                                          f32 %79 = OpFAdd %77 %78 
                                                      OpStore %65 %79 
                                          f32 %81 = OpLoad %65 
                                         bool %82 = OpFOrdGreaterThanEqual %56 %81 
                                                      OpStore %80 %82 
                                         bool %86 = OpLoad %80 
                                       bool_2 %90 = OpCompositeConstruct %86 %86 
                                        i32_2 %91 = OpSelect %90 %87 %88 
                                                      OpStore %85 %91 
                                         bool %94 = OpLoad %55 
                                                      OpSelectionMerge %98 None 
                                                      OpBranchConditional %94 %97 %101 
                                              %97 = OpLabel 
                                 Private i32* %99 = OpAccessChain %85 %24 
                                         i32 %100 = OpLoad %99 
                                                      OpStore %96 %100 
                                                      OpBranch %98 
                                             %101 = OpLabel 
                                Private i32* %102 = OpAccessChain %85 %66 
                                         i32 %103 = OpLoad %102 
                                                      OpStore %96 %103 
                                                      OpBranch %98 
                                              %98 = OpLabel 
                                         i32 %104 = OpLoad %96 
                                                      OpStore %93 %104 
                                         f32 %105 = OpLoad %59 
                                         i32 %106 = OpLoad %93 
                                Uniform f32* %107 = OpAccessChain %18 %30 %106 
                                         f32 %108 = OpLoad %107 
                                         f32 %109 = OpFNegate %108 
                                         f32 %110 = OpFAdd %105 %109 
                                Private f32* %111 = OpAccessChain %29 %66 
                                                      OpStore %111 %110 
                                Uniform f32* %112 = OpAccessChain %18 %41 %20 
                                         f32 %113 = OpLoad %112 
                                         i32 %114 = OpLoad %93 
                                Uniform f32* %115 = OpAccessChain %18 %30 %114 
                                         f32 %116 = OpLoad %115 
                                         f32 %117 = OpFAdd %113 %116 
                                Private f32* %118 = OpAccessChain %9 %66 
                                                      OpStore %118 %117 
                                        bool %121 = OpLoad %55 
                                                      OpSelectionMerge %125 None 
                                                      OpBranchConditional %121 %124 %128 
                                             %124 = OpLabel 
                                       f32_3 %126 = OpLoad %9 
                                       f32_2 %127 = OpVectorShuffle %126 %126 0 1 
                                                      OpStore %123 %127 
                                                      OpBranch %125 
                                             %128 = OpLabel 
                                       f32_2 %129 = OpLoad %29 
                                                      OpStore %123 %129 
                                                      OpBranch %125 
                                             %125 = OpLabel 
                                       f32_2 %130 = OpLoad %123 
                                       f32_4 %131 = OpLoad %120 
                                       f32_4 %132 = OpVectorShuffle %131 %130 4 5 2 3 
                                                      OpStore %120 %132 
                                Uniform f32* %134 = OpAccessChain %18 %19 %69 
                                         f32 %135 = OpLoad %134 
                                Private f32* %136 = OpAccessChain %133 %24 
                                                      OpStore %136 %135 
                                Uniform f32* %138 = OpAccessChain %18 %19 %19 
                                         f32 %139 = OpLoad %138 
                                Private f32* %140 = OpAccessChain %137 %24 
                                                      OpStore %140 %139 
                                Uniform f32* %141 = OpAccessChain %18 %41 %69 
                                         f32 %142 = OpLoad %141 
                                Uniform f32* %143 = OpAccessChain %18 %41 %19 
                                         f32 %144 = OpLoad %143 
                                         f32 %145 = OpFAdd %142 %144 
                                Private f32* %146 = OpAccessChain %9 %24 
                                                      OpStore %146 %145 
                                Private f32* %147 = OpAccessChain %9 %24 
                                         f32 %148 = OpLoad %147 
                                         i32 %149 = OpLoad %93 
                                Uniform f32* %150 = OpAccessChain %18 %30 %149 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFNegate %151 
                                         f32 %153 = OpFAdd %148 %152 
                                Private f32* %154 = OpAccessChain %137 %66 
                                                      OpStore %154 %153 
                                Uniform f32* %155 = OpAccessChain %18 %41 %69 
                                         f32 %156 = OpLoad %155 
                                         i32 %157 = OpLoad %93 
                                Uniform f32* %158 = OpAccessChain %18 %30 %157 
                                         f32 %159 = OpLoad %158 
                                         f32 %160 = OpFAdd %156 %159 
                                Private f32* %161 = OpAccessChain %133 %66 
                                                      OpStore %161 %160 
                                        bool %162 = OpLoad %80 
                                                      OpSelectionMerge %165 None 
                                                      OpBranchConditional %162 %164 %167 
                                             %164 = OpLabel 
                                       f32_2 %166 = OpLoad %133 
                                                      OpStore %163 %166 
                                                      OpBranch %165 
                                             %167 = OpLabel 
                                       f32_2 %168 = OpLoad %137 
                                                      OpStore %163 %168 
                                                      OpBranch %165 
                                             %165 = OpLabel 
                                       f32_2 %169 = OpLoad %163 
                                       f32_4 %170 = OpLoad %120 
                                       f32_4 %171 = OpVectorShuffle %170 %169 0 1 4 5 
                                                      OpStore %120 %171 
                                       f32_4 %172 = OpLoad %120 
                                       f32_2 %173 = OpVectorShuffle %172 %172 0 2 
                                       f32_2 %174 = OpFNegate %173 
                                         i32 %175 = OpLoad %93 
                                Uniform f32* %176 = OpAccessChain %18 %30 %175 
                                         f32 %177 = OpLoad %176 
                                       f32_2 %178 = OpCompositeConstruct %177 %177 
                                       f32_2 %179 = OpFAdd %174 %178 
                                       f32_3 %180 = OpLoad %9 
                                       f32_3 %181 = OpVectorShuffle %180 %179 3 4 2 
                                                      OpStore %9 %181 
                                Private f32* %182 = OpAccessChain %9 %24 
                                         f32 %183 = OpLoad %182 
                                Private f32* %184 = OpAccessChain %9 %66 
                                         f32 %185 = OpLoad %184 
                                         f32 %186 = OpFDiv %183 %185 
                                                      OpStore %59 %186 
                                       f32_4 %188 = OpLoad %120 
                                       f32_2 %189 = OpVectorShuffle %188 %188 1 3 
                                       f32_2 %190 = OpFNegate %189 
                                       f32_4 %191 = OpLoad vs_TEXCOORD2 
                                       f32_2 %192 = OpVectorShuffle %191 %191 0 1 
                                       f32_2 %193 = OpFAdd %190 %192 
                                       f32_3 %194 = OpLoad %187 
                                       f32_3 %195 = OpVectorShuffle %194 %193 3 4 2 
                                                      OpStore %187 %195 
                                         f32 %196 = OpLoad %59 
                                Private f32* %197 = OpAccessChain %187 %66 
                                         f32 %198 = OpLoad %197 
                                         f32 %199 = OpFMul %196 %198 
                                Private f32* %201 = OpAccessChain %187 %200 
                                                      OpStore %201 %199 
                                       f32_3 %202 = OpLoad %187 
                                       f32_2 %203 = OpVectorShuffle %202 %202 0 2 
                                       f32_3 %204 = OpLoad %187 
                                       f32_2 %205 = OpVectorShuffle %204 %204 0 2 
                                         f32 %206 = OpDot %203 %205 
                                                      OpStore %59 %206 
                                       f32_3 %207 = OpLoad %187 
                                       f32_2 %208 = OpVectorShuffle %207 %207 0 1 
                                       f32_3 %209 = OpLoad %187 
                                       f32_2 %210 = OpVectorShuffle %209 %209 0 1 
                                         f32 %211 = OpDot %208 %210 
                                Private f32* %212 = OpAccessChain %29 %24 
                                                      OpStore %212 %211 
                                Private f32* %213 = OpAccessChain %29 %24 
                                         f32 %214 = OpLoad %213 
                                         f32 %215 = OpExtInst %1 31 %214 
                                Private f32* %216 = OpAccessChain %29 %24 
                                                      OpStore %216 %215 
                                Private f32* %217 = OpAccessChain %29 %24 
                                         f32 %218 = OpLoad %217 
                                         i32 %219 = OpLoad %93 
                                Uniform f32* %220 = OpAccessChain %18 %30 %219 
                                         f32 %221 = OpLoad %220 
                                         f32 %222 = OpFNegate %221 
                                         f32 %223 = OpFAdd %218 %222 
                                Private f32* %224 = OpAccessChain %29 %24 
                                                      OpStore %224 %223 
                                         f32 %225 = OpLoad %59 
                                         f32 %226 = OpExtInst %1 31 %225 
                                                      OpStore %59 %226 
                                Private f32* %227 = OpAccessChain %9 %24 
                                         f32 %228 = OpLoad %227 
                                         f32 %229 = OpFNegate %228 
                                         f32 %230 = OpLoad %59 
                                         f32 %231 = OpFAdd %229 %230 
                                                      OpStore %59 %231 
                                       f32_3 %235 = OpLoad %9 
                                       f32_4 %236 = OpVectorShuffle %235 %235 0 1 0 0 
                                      bool_4 %238 = OpFOrdLessThan %234 %236 
                                      bool_2 %239 = OpVectorShuffle %238 %238 0 1 
                                                      OpStore %233 %239 
                               Private bool* %240 = OpAccessChain %233 %66 
                                        bool %241 = OpLoad %240 
                               Private bool* %242 = OpAccessChain %233 %24 
                                        bool %243 = OpLoad %242 
                                        bool %244 = OpLogicalAnd %241 %243 
                               Private bool* %245 = OpAccessChain %233 %24 
                                                      OpStore %245 %244 
                                  Input f32* %247 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %248 = OpLoad %247 
                                         f32 %249 = OpDPdx %248 
                                Private f32* %250 = OpAccessChain %246 %24 
                                                      OpStore %250 %249 
                                Private f32* %252 = OpAccessChain %246 %24 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpExtInst %1 4 %253 
                                         f32 %255 = OpFDiv %251 %254 
                                Private f32* %256 = OpAccessChain %246 %24 
                                                      OpStore %256 %255 
                                         f32 %257 = OpLoad %59 
                                Private f32* %258 = OpAccessChain %246 %24 
                                         f32 %259 = OpLoad %258 
                                         f32 %260 = OpFMul %257 %259 
                                         f32 %261 = OpFAdd %260 %49 
                                                      OpStore %59 %261 
                                         f32 %262 = OpLoad %59 
                                         f32 %263 = OpExtInst %1 43 %262 %56 %251 
                                                      OpStore %59 %263 
                                Private f32* %264 = OpAccessChain %29 %24 
                                         f32 %265 = OpLoad %264 
                                Private f32* %266 = OpAccessChain %246 %24 
                                         f32 %267 = OpLoad %266 
                                         f32 %268 = OpFMul %265 %267 
                                         f32 %269 = OpFAdd %268 %49 
                                Private f32* %270 = OpAccessChain %246 %24 
                                                      OpStore %270 %269 
                                Private f32* %271 = OpAccessChain %246 %24 
                                         f32 %272 = OpLoad %271 
                                         f32 %273 = OpExtInst %1 43 %272 %56 %251 
                                Private f32* %274 = OpAccessChain %246 %24 
                                                      OpStore %274 %273 
                               Private bool* %275 = OpAccessChain %233 %24 
                                        bool %276 = OpLoad %275 
                                         f32 %277 = OpLoad %59 
                                         f32 %278 = OpSelect %276 %277 %251 
                                Private f32* %279 = OpAccessChain %9 %24 
                                                      OpStore %279 %278 
                                       f32_4 %281 = OpLoad %120 
                                       f32_4 %282 = OpVectorShuffle %281 %281 0 2 0 0 
                                      bool_4 %283 = OpFOrdLessThan %234 %282 
                                      bool_2 %284 = OpVectorShuffle %283 %283 0 1 
                                                      OpStore %280 %284 
                               Private bool* %286 = OpAccessChain %280 %66 
                                        bool %287 = OpLoad %286 
                               Private bool* %288 = OpAccessChain %280 %24 
                                        bool %289 = OpLoad %288 
                                        bool %290 = OpLogicalOr %287 %289 
                                                      OpStore %285 %290 
                                        bool %291 = OpLoad %285 
                                                      OpSelectionMerge %295 None 
                                                      OpBranchConditional %291 %294 %298 
                                             %294 = OpLabel 
                                Private f32* %296 = OpAccessChain %9 %24 
                                         f32 %297 = OpLoad %296 
                                                      OpStore %293 %297 
                                                      OpBranch %295 
                                             %298 = OpLabel 
                                                      OpStore %293 %56 
                                                      OpBranch %295 
                                             %295 = OpLabel 
                                         f32 %299 = OpLoad %293 
                                Private f32* %300 = OpAccessChain %9 %24 
                                                      OpStore %300 %299 
                                        bool %301 = OpLoad %285 
                                                      OpSelectionMerge %304 None 
                                                      OpBranchConditional %301 %303 %307 
                                             %303 = OpLabel 
                                Private f32* %305 = OpAccessChain %246 %24 
                                         f32 %306 = OpLoad %305 
                                                      OpStore %302 %306 
                                                      OpBranch %304 
                                             %307 = OpLabel 
                                                      OpStore %302 %56 
                                                      OpBranch %304 
                                             %304 = OpLabel 
                                         f32 %308 = OpLoad %302 
                                Private f32* %309 = OpAccessChain %246 %24 
                                                      OpStore %309 %308 
                                Private f32* %310 = OpAccessChain %246 %24 
                                         f32 %311 = OpLoad %310 
                                        bool %312 = OpFOrdEqual %311 %56 
                                                      OpStore %285 %312 
                                Private f32* %313 = OpAccessChain %246 %24 
                                         f32 %314 = OpLoad %313 
                                         f32 %315 = OpFNegate %314 
                                         f32 %316 = OpFAdd %315 %251 
                                Private f32* %317 = OpAccessChain %246 %24 
                                                      OpStore %317 %316 
                                        bool %318 = OpLoad %285 
                                                      OpSelectionMerge %321 None 
                                                      OpBranchConditional %318 %320 %324 
                                             %320 = OpLabel 
                                Private f32* %322 = OpAccessChain %9 %24 
                                         f32 %323 = OpLoad %322 
                                                      OpStore %319 %323 
                                                      OpBranch %321 
                                             %324 = OpLabel 
                                Private f32* %325 = OpAccessChain %246 %24 
                                         f32 %326 = OpLoad %325 
                                                      OpStore %319 %326 
                                                      OpBranch %321 
                                             %321 = OpLabel 
                                         f32 %327 = OpLoad %319 
                                Private f32* %328 = OpAccessChain %9 %24 
                                                      OpStore %328 %327 
                                       f32_4 %332 = OpLoad %120 
                                       f32_4 %333 = OpVectorShuffle %332 %332 1 1 3 3 
                                       f32_4 %334 = OpLoad vs_TEXCOORD2 
                                       f32_4 %335 = OpVectorShuffle %334 %334 0 0 1 1 
                                      bool_4 %336 = OpFOrdGreaterThanEqual %333 %335 
                                      bool_2 %337 = OpVectorShuffle %336 %336 0 2 
                                      bool_3 %338 = OpLoad %331 
                                      bool_3 %339 = OpVectorShuffle %338 %337 3 1 4 
                                                      OpStore %331 %339 
                                       f32_4 %340 = OpLoad vs_TEXCOORD2 
                                       f32_4 %341 = OpVectorShuffle %340 %340 0 1 0 0 
                                       f32_4 %342 = OpLoad %120 
                                       f32_4 %343 = OpVectorShuffle %342 %342 1 3 1 1 
                                      bool_4 %344 = OpFOrdGreaterThanEqual %341 %343 
                                      bool_2 %345 = OpVectorShuffle %344 %344 0 1 
                                                      OpStore %280 %345 
                                        bool %346 = OpLoad %55 
                                                      OpSelectionMerge %350 None 
                                                      OpBranchConditional %346 %349 %353 
                                             %349 = OpLabel 
                               Private bool* %351 = OpAccessChain %331 %24 
                                        bool %352 = OpLoad %351 
                                                      OpStore %348 %352 
                                                      OpBranch %350 
                                             %353 = OpLabel 
                               Private bool* %354 = OpAccessChain %280 %24 
                                        bool %355 = OpLoad %354 
                                                      OpStore %348 %355 
                                                      OpBranch %350 
                                             %350 = OpLabel 
                                        bool %356 = OpLoad %348 
                               Private bool* %357 = OpAccessChain %331 %24 
                                                      OpStore %357 %356 
                                        bool %358 = OpLoad %80 
                                                      OpSelectionMerge %361 None 
                                                      OpBranchConditional %358 %360 %364 
                                             %360 = OpLabel 
                               Private bool* %362 = OpAccessChain %331 %200 
                                        bool %363 = OpLoad %362 
                                                      OpStore %359 %363 
                                                      OpBranch %361 
                                             %364 = OpLabel 
                               Private bool* %365 = OpAccessChain %280 %66 
                                        bool %366 = OpLoad %365 
                                                      OpStore %359 %366 
                                                      OpBranch %361 
                                             %361 = OpLabel 
                                        bool %367 = OpLoad %359 
                                                      OpStore %55 %367 
                                        bool %368 = OpLoad %55 
                               Private bool* %369 = OpAccessChain %331 %24 
                                        bool %370 = OpLoad %369 
                                        bool %371 = OpLogicalAnd %368 %370 
                               Private bool* %372 = OpAccessChain %331 %24 
                                                      OpStore %372 %371 
                               Private bool* %373 = OpAccessChain %331 %24 
                                        bool %374 = OpLoad %373 
                                                      OpSelectionMerge %377 None 
                                                      OpBranchConditional %374 %376 %380 
                                             %376 = OpLabel 
                                Private f32* %378 = OpAccessChain %9 %24 
                                         f32 %379 = OpLoad %378 
                                                      OpStore %375 %379 
                                                      OpBranch %377 
                                             %380 = OpLabel 
                                                      OpStore %375 %251 
                                                      OpBranch %377 
                                             %377 = OpLabel 
                                         f32 %381 = OpLoad %375 
                                Private f32* %382 = OpAccessChain %9 %24 
                                                      OpStore %382 %381 
                                Uniform f32* %383 = OpAccessChain %18 %19 %20 
                                         f32 %384 = OpLoad %383 
                                Uniform f32* %385 = OpAccessChain %18 %19 %30 
                                         f32 %386 = OpLoad %385 
                                         f32 %387 = OpFAdd %384 %386 
                                                      OpStore %34 %387 
                                         f32 %388 = OpLoad %34 
                                         f32 %389 = OpFNegate %388 
                                Uniform f32* %390 = OpAccessChain %18 %41 %30 
                                         f32 %391 = OpLoad %390 
                                         f32 %392 = OpFAdd %389 %391 
                                                      OpStore %34 %392 
                                Uniform f32* %393 = OpAccessChain %18 %19 %20 
                                         f32 %394 = OpLoad %393 
                                Uniform f32* %395 = OpAccessChain %18 %41 %20 
                                         f32 %396 = OpLoad %395 
                                         f32 %397 = OpFAdd %394 %396 
                                                      OpStore %59 %397 
                                         f32 %398 = OpLoad %34 
                                         f32 %399 = OpLoad %59 
                                         f32 %400 = OpFAdd %398 %399 
                                                      OpStore %34 %400 
                                  Input f32* %401 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %402 = OpLoad %401 
                                         f32 %403 = OpLoad %59 
                                        bool %404 = OpFOrdGreaterThanEqual %402 %403 
                                                      OpStore %285 %404 
                                         f32 %405 = OpLoad %34 
                                  Input f32* %406 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %407 = OpLoad %406 
                                        bool %408 = OpFOrdGreaterThanEqual %405 %407 
                                                      OpStore %55 %408 
                                        bool %409 = OpLoad %55 
                                        bool %410 = OpLoad %285 
                                        bool %411 = OpLogicalAnd %409 %410 
                                                      OpStore %55 %411 
                                Uniform f32* %412 = OpAccessChain %18 %19 %69 
                                         f32 %413 = OpLoad %412 
                                Uniform f32* %414 = OpAccessChain %18 %41 %69 
                                         f32 %415 = OpLoad %414 
                                         f32 %416 = OpFAdd %413 %415 
                                                      OpStore %59 %416 
                                  Input f32* %417 = OpAccessChain vs_TEXCOORD2 %66 
                                         f32 %418 = OpLoad %417 
                                         f32 %419 = OpLoad %59 
                                        bool %420 = OpFOrdGreaterThanEqual %418 %419 
                               Private bool* %421 = OpAccessChain %280 %24 
                                                      OpStore %421 %420 
                                        bool %422 = OpLoad %55 
                               Private bool* %423 = OpAccessChain %280 %24 
                                        bool %424 = OpLoad %423 
                                        bool %425 = OpLogicalAnd %422 %424 
                                                      OpStore %55 %425 
                                Uniform f32* %426 = OpAccessChain %18 %19 %69 
                                         f32 %427 = OpLoad %426 
                                Uniform f32* %428 = OpAccessChain %18 %19 %19 
                                         f32 %429 = OpLoad %428 
                                         f32 %430 = OpFAdd %427 %429 
                                Private f32* %431 = OpAccessChain %29 %24 
                                                      OpStore %431 %430 
                                Private f32* %432 = OpAccessChain %29 %24 
                                         f32 %433 = OpLoad %432 
                                         f32 %434 = OpFNegate %433 
                                Uniform f32* %435 = OpAccessChain %18 %41 %19 
                                         f32 %436 = OpLoad %435 
                                         f32 %437 = OpFAdd %434 %436 
                                Private f32* %438 = OpAccessChain %29 %24 
                                                      OpStore %438 %437 
                                         f32 %439 = OpLoad %59 
                                Private f32* %440 = OpAccessChain %29 %24 
                                         f32 %441 = OpLoad %440 
                                         f32 %442 = OpFAdd %439 %441 
                                                      OpStore %59 %442 
                                         f32 %443 = OpLoad %59 
                                  Input f32* %444 = OpAccessChain vs_TEXCOORD2 %66 
                                         f32 %445 = OpLoad %444 
                                        bool %446 = OpFOrdGreaterThanEqual %443 %445 
                                                      OpStore %285 %446 
                                        bool %447 = OpLoad %285 
                                        bool %448 = OpLoad %55 
                                        bool %449 = OpLogicalAnd %447 %448 
                                                      OpStore %55 %449 
                                        bool %450 = OpLoad %55 
                                         f32 %451 = OpSelect %450 %56 %251 
                                                      OpStore %34 %451 
                               Private bool* %452 = OpAccessChain %331 %24 
                                        bool %453 = OpLoad %452 
                                         f32 %454 = OpLoad %34 
                                         f32 %455 = OpSelect %453 %251 %454 
                                Private f32* %456 = OpAccessChain %246 %24 
                                                      OpStore %456 %455 
                                Uniform f32* %457 = OpAccessChain %18 %19 %20 
                                         f32 %458 = OpLoad %457 
                                        bool %459 = OpFOrdLessThan %56 %458 
                                                      OpStore %55 %459 
                                Uniform f32* %460 = OpAccessChain %18 %19 %69 
                                         f32 %461 = OpLoad %460 
                                        bool %462 = OpFOrdLessThan %56 %461 
                                                      OpStore %285 %462 
                                        bool %463 = OpLoad %285 
                                        bool %464 = OpLoad %55 
                                        bool %465 = OpLogicalOr %463 %464 
                                                      OpStore %55 %465 
                                Uniform f32* %466 = OpAccessChain %18 %19 %30 
                                         f32 %467 = OpLoad %466 
                                        bool %468 = OpFOrdLessThan %56 %467 
                                                      OpStore %285 %468 
                                        bool %469 = OpLoad %285 
                                        bool %470 = OpLoad %55 
                                        bool %471 = OpLogicalOr %469 %470 
                                                      OpStore %55 %471 
                                Uniform f32* %472 = OpAccessChain %18 %19 %19 
                                         f32 %473 = OpLoad %472 
                                        bool %474 = OpFOrdLessThan %56 %473 
                                                      OpStore %285 %474 
                                        bool %475 = OpLoad %285 
                                        bool %476 = OpLoad %55 
                                        bool %477 = OpLogicalOr %475 %476 
                                                      OpStore %55 %477 
                                        bool %478 = OpLoad %55 
                                                      OpSelectionMerge %481 None 
                                                      OpBranchConditional %478 %480 %484 
                                             %480 = OpLabel 
                                Private f32* %482 = OpAccessChain %246 %24 
                                         f32 %483 = OpLoad %482 
                                                      OpStore %479 %483 
                                                      OpBranch %481 
                                             %484 = OpLabel 
                                                      OpStore %479 %251 
                                                      OpBranch %481 
                                             %481 = OpLabel 
                                         f32 %485 = OpLoad %479 
                                Private f32* %486 = OpAccessChain %246 %24 
                                                      OpStore %486 %485 
                                Private f32* %487 = OpAccessChain %246 %24 
                                         f32 %488 = OpLoad %487 
                                Private f32* %489 = OpAccessChain %9 %24 
                                         f32 %490 = OpLoad %489 
                                         f32 %491 = OpFMul %488 %490 
                                Private f32* %492 = OpAccessChain %9 %200 
                                                      OpStore %492 %491 
                         read_only Texture2D %496 = OpLoad %495 
                                     sampler %500 = OpLoad %499 
                  read_only Texture2DSampled %502 = OpSampledImage %496 %500 
                                       f32_2 %505 = OpLoad vs_TEXCOORD1 
                                       f32_4 %506 = OpImageSampleImplicitLod %502 %505 
                                         f32 %508 = OpCompositeExtract %506 3 
                                Private f32* %509 = OpAccessChain %246 %200 
                                                      OpStore %509 %508 
                         read_only Texture2D %512 = OpLoad %511 
                                     sampler %514 = OpLoad %513 
                  read_only Texture2DSampled %515 = OpSampledImage %512 %514 
                                       f32_2 %517 = OpLoad vs_TEXCOORD0 
                                       f32_4 %518 = OpImageSampleImplicitLod %515 %517 
                                                      OpStore %510 %518 
                                       f32_4 %520 = OpLoad %510 
                                       f32_3 %521 = OpVectorShuffle %520 %520 0 1 2 
                                       f32_3 %523 = OpExtInst %1 40 %521 %522 
                                                      OpStore %519 %523 
                                       f32_3 %525 = OpLoad %519 
                                       f32_3 %526 = OpExtInst %1 30 %525 
                                                      OpStore %524 %526 
                                       f32_3 %527 = OpLoad %524 
                                       f32_3 %530 = OpFMul %527 %529 
                                                      OpStore %524 %530 
                                       f32_3 %531 = OpLoad %524 
                                       f32_3 %532 = OpExtInst %1 29 %531 
                                                      OpStore %524 %532 
                                       f32_3 %533 = OpLoad %524 
                                       f32_3 %536 = OpFMul %533 %535 
                                       f32_3 %539 = OpFAdd %536 %538 
                                                      OpStore %524 %539 
                                       f32_3 %540 = OpLoad %524 
                                       f32_3 %541 = OpExtInst %1 40 %540 %522 
                                       f32_4 %542 = OpLoad %120 
                                       f32_4 %543 = OpVectorShuffle %542 %541 4 5 6 3 
                                                      OpStore %120 %543 
                                Uniform i32* %545 = OpAccessChain %18 %20 
                                         i32 %546 = OpLoad %545 
                                        bool %547 = OpINotEqual %546 %20 
                                                      OpSelectionMerge %551 None 
                                                      OpBranchConditional %547 %550 %554 
                                             %550 = OpLabel 
                                       f32_4 %552 = OpLoad %120 
                                       f32_3 %553 = OpVectorShuffle %552 %552 0 1 2 
                                                      OpStore %549 %553 
                                                      OpBranch %551 
                                             %554 = OpLabel 
                                       f32_4 %555 = OpLoad %510 
                                       f32_3 %556 = OpVectorShuffle %555 %555 0 1 2 
                                                      OpStore %549 %556 
                                                      OpBranch %551 
                                             %551 = OpLabel 
                                       f32_3 %557 = OpLoad %549 
                                                      OpStore %519 %557 
                                Private f32* %559 = OpAccessChain %510 %507 
                                         f32 %560 = OpLoad %559 
                                  Input f32* %562 = OpAccessChain %561 %507 
                                         f32 %563 = OpLoad %562 
                                         f32 %564 = OpFMul %560 %563 
                                                      OpStore %558 %564 
                                Private f32* %565 = OpAccessChain %9 %24 
                                         f32 %566 = OpLoad %565 
                                         f32 %567 = OpLoad %558 
                                         f32 %568 = OpFMul %566 %567 
                                Private f32* %569 = OpAccessChain %9 %24 
                                                      OpStore %569 %568 
                                       f32_3 %570 = OpLoad %246 
                                       f32_2 %571 = OpVectorShuffle %570 %570 0 2 
                                       f32_3 %572 = OpLoad %9 
                                       f32_2 %573 = OpVectorShuffle %572 %572 0 2 
                                       f32_2 %574 = OpFMul %571 %573 
                                       f32_3 %575 = OpLoad %9 
                                       f32_3 %576 = OpVectorShuffle %575 %574 3 1 4 
                                                      OpStore %9 %576 
                                Private f32* %577 = OpAccessChain %246 %200 
                                         f32 %578 = OpLoad %577 
                                Private f32* %579 = OpAccessChain %9 %24 
                                         f32 %580 = OpLoad %579 
                                         f32 %581 = OpFMul %578 %580 
                                Private f32* %582 = OpAccessChain %9 %24 
                                                      OpStore %582 %581 
                                Private f32* %585 = OpAccessChain %9 %24 
                                         f32 %586 = OpLoad %585 
                                 Output f32* %588 = OpAccessChain %584 %507 
                                                      OpStore %588 %586 
                                       f32_3 %589 = OpLoad %519 
                                       f32_4 %590 = OpLoad %561 
                                       f32_3 %591 = OpVectorShuffle %590 %590 0 1 2 
                                       f32_3 %592 = OpFMul %589 %591 
                                                      OpStore %519 %592 
                                       f32_3 %593 = OpLoad %9 
                                       f32_3 %594 = OpVectorShuffle %593 %593 2 2 2 
                                       f32_3 %595 = OpLoad %519 
                                       f32_3 %596 = OpFMul %594 %595 
                                                      OpStore %9 %596 
                                Uniform i32* %597 = OpAccessChain %18 %69 
                                         i32 %598 = OpLoad %597 
                                        bool %600 = OpINotEqual %598 %599 
                                                      OpStore %285 %600 
                                        bool %601 = OpLoad %285 
                                                      OpSelectionMerge %604 None 
                                                      OpBranchConditional %601 %603 %606 
                                             %603 = OpLabel 
                                       f32_3 %605 = OpLoad %9 
                                                      OpStore %602 %605 
                                                      OpBranch %604 
                                             %606 = OpLabel 
                                       f32_3 %607 = OpLoad %519 
                                                      OpStore %602 %607 
                                                      OpBranch %604 
                                             %604 = OpLabel 
                                       f32_3 %608 = OpLoad %602 
                                       f32_4 %609 = OpLoad %584 
                                       f32_4 %610 = OpVectorShuffle %609 %608 4 5 6 3 
                                                      OpStore %584 %610 
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
Fallback "Hidden/Internal-GUITextureClip"
}