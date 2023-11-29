//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/FogPlus" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 52000
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
highp  vec4 phase0_Output0_0;
out highp vec2 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    phase0_Output0_0 = in_TEXCOORD0.xyxy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.z = u_xlat0.z;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
vs_TEXCOORD0 = phase0_Output0_0.xy;
vs_TEXCOORD1 = phase0_Output0_0.zw;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	mediump float _Near;
uniform 	mediump float _Far;
uniform 	mediump float _UseDistanceFog;
uniform 	mediump float _UseDistanceFogOnSky;
uniform 	mediump float _LowWorldY;
uniform 	mediump float _HighWorldY;
uniform 	mediump float _UseHeightFog;
uniform 	mediump float _UseHeightFogOnSky;
uniform 	mediump float _DistanceFogIntensity;
uniform 	mediump float _HeightFogIntensity;
uniform 	mediump float _DistanceHeightBlend;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _DistanceLUT;
UNITY_LOCATION(3) uniform mediump sampler2D _HeightLUT;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bvec3 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
float u_xlat8;
vec2 u_xlat9;
void main()
{
    u_xlat0.x = (-_ProjectionParams.y) + _ProjectionParams.z;
    u_xlat4.x = texture(_CameraDepthTexture, vs_TEXCOORD1.xy).x;
    u_xlat4.xy = _ZBufferParams.zx * u_xlat4.xx + _ZBufferParams.wy;
    u_xlat4.xy = vec2(1.0, 1.0) / u_xlat4.xy;
    u_xlat0.x = u_xlat0.x * u_xlat4.y + _ProjectionParams.y;
    u_xlat0.x = u_xlat0.x + (-_Near);
    u_xlat16_1.x = (-_Near) + _Far;
    u_xlat1.x = u_xlat0.x / u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.y = float(0.5);
    u_xlat9.y = float(0.5);
    u_xlat2 = texture(_DistanceLUT, u_xlat1.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat4.y>=0.999000013);
#else
    u_xlatb0.x = u_xlat4.y>=0.999000013;
#endif
    u_xlat4.x = vs_TEXCOORD2.y * u_xlat4.x + _WorldSpaceCameraPos.y;
    u_xlat4.x = u_xlat4.x + (-_LowWorldY);
    u_xlat0.x = u_xlatb0.x ? 1.0 : float(0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.z = !!(_UseDistanceFogOnSky>=u_xlat0.x);
#else
    u_xlatb0.z = _UseDistanceFogOnSky>=u_xlat0.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(_UseHeightFogOnSky>=u_xlat0.x);
#else
    u_xlatb0.x = _UseHeightFogOnSky>=u_xlat0.x;
#endif
    u_xlat0.xz = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb0.xz));
    u_xlat8 = u_xlat0.z * u_xlat2.w;
    u_xlat16_3.x = _UseDistanceFog * _DistanceFogIntensity;
    u_xlat2.w = u_xlat8 * u_xlat16_3.x;
    u_xlat16_3.x = (-_LowWorldY) + _HighWorldY;
    u_xlat9.x = u_xlat4.x / u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat16_1 = texture(_HeightLUT, u_xlat9.xy);
    u_xlat0.x = u_xlat0.x * u_xlat16_1.w;
    u_xlat1.xyz = (-u_xlat2.xyz) + u_xlat16_1.xyz;
    u_xlat16_3.x = _UseHeightFog * _HeightFogIntensity;
    u_xlat1.w = u_xlat0.x * u_xlat16_3.x + (-u_xlat2.w);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseDistanceFog));
#else
    u_xlatb0.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseDistanceFog);
#endif
    u_xlat16_3.x = (u_xlatb0.x) ? _DistanceHeightBlend : 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseHeightFog));
#else
    u_xlatb0.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseHeightFog);
#endif
    u_xlat16_3.x = (u_xlatb0.x) ? u_xlat16_3.x : 0.0;
    u_xlat0 = u_xlat16_3.xxxx * u_xlat1 + u_xlat2;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = u_xlat0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_1.w;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
highp  vec4 phase0_Output0_0;
out highp vec2 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    phase0_Output0_0 = in_TEXCOORD0.xyxy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.z = u_xlat0.z;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
vs_TEXCOORD0 = phase0_Output0_0.xy;
vs_TEXCOORD1 = phase0_Output0_0.zw;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	mediump float _Near;
uniform 	mediump float _Far;
uniform 	mediump float _UseDistanceFog;
uniform 	mediump float _UseDistanceFogOnSky;
uniform 	mediump float _LowWorldY;
uniform 	mediump float _HighWorldY;
uniform 	mediump float _UseHeightFog;
uniform 	mediump float _UseHeightFogOnSky;
uniform 	mediump float _DistanceFogIntensity;
uniform 	mediump float _HeightFogIntensity;
uniform 	mediump float _DistanceHeightBlend;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _DistanceLUT;
UNITY_LOCATION(3) uniform mediump sampler2D _HeightLUT;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bvec3 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
float u_xlat8;
vec2 u_xlat9;
void main()
{
    u_xlat0.x = (-_ProjectionParams.y) + _ProjectionParams.z;
    u_xlat4.x = texture(_CameraDepthTexture, vs_TEXCOORD1.xy).x;
    u_xlat4.xy = _ZBufferParams.zx * u_xlat4.xx + _ZBufferParams.wy;
    u_xlat4.xy = vec2(1.0, 1.0) / u_xlat4.xy;
    u_xlat0.x = u_xlat0.x * u_xlat4.y + _ProjectionParams.y;
    u_xlat0.x = u_xlat0.x + (-_Near);
    u_xlat16_1.x = (-_Near) + _Far;
    u_xlat1.x = u_xlat0.x / u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.y = float(0.5);
    u_xlat9.y = float(0.5);
    u_xlat2 = texture(_DistanceLUT, u_xlat1.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat4.y>=0.999000013);
#else
    u_xlatb0.x = u_xlat4.y>=0.999000013;
#endif
    u_xlat4.x = vs_TEXCOORD2.y * u_xlat4.x + _WorldSpaceCameraPos.y;
    u_xlat4.x = u_xlat4.x + (-_LowWorldY);
    u_xlat0.x = u_xlatb0.x ? 1.0 : float(0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.z = !!(_UseDistanceFogOnSky>=u_xlat0.x);
#else
    u_xlatb0.z = _UseDistanceFogOnSky>=u_xlat0.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(_UseHeightFogOnSky>=u_xlat0.x);
#else
    u_xlatb0.x = _UseHeightFogOnSky>=u_xlat0.x;
#endif
    u_xlat0.xz = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb0.xz));
    u_xlat8 = u_xlat0.z * u_xlat2.w;
    u_xlat16_3.x = _UseDistanceFog * _DistanceFogIntensity;
    u_xlat2.w = u_xlat8 * u_xlat16_3.x;
    u_xlat16_3.x = (-_LowWorldY) + _HighWorldY;
    u_xlat9.x = u_xlat4.x / u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat16_1 = texture(_HeightLUT, u_xlat9.xy);
    u_xlat0.x = u_xlat0.x * u_xlat16_1.w;
    u_xlat1.xyz = (-u_xlat2.xyz) + u_xlat16_1.xyz;
    u_xlat16_3.x = _UseHeightFog * _HeightFogIntensity;
    u_xlat1.w = u_xlat0.x * u_xlat16_3.x + (-u_xlat2.w);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseDistanceFog));
#else
    u_xlatb0.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseDistanceFog);
#endif
    u_xlat16_3.x = (u_xlatb0.x) ? _DistanceHeightBlend : 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseHeightFog));
#else
    u_xlatb0.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseHeightFog);
#endif
    u_xlat16_3.x = (u_xlatb0.x) ? u_xlat16_3.x : 0.0;
    u_xlat0 = u_xlat16_3.xxxx * u_xlat1 + u_xlat2;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = u_xlat0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_1.w;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
highp  vec4 phase0_Output0_0;
out highp vec2 vs_TEXCOORD1;
out highp vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    phase0_Output0_0 = in_TEXCOORD0.xyxy;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.z = u_xlat0.z;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
vs_TEXCOORD0 = phase0_Output0_0.xy;
vs_TEXCOORD1 = phase0_Output0_0.zw;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	mediump float _Near;
uniform 	mediump float _Far;
uniform 	mediump float _UseDistanceFog;
uniform 	mediump float _UseDistanceFogOnSky;
uniform 	mediump float _LowWorldY;
uniform 	mediump float _HighWorldY;
uniform 	mediump float _UseHeightFog;
uniform 	mediump float _UseHeightFogOnSky;
uniform 	mediump float _DistanceFogIntensity;
uniform 	mediump float _HeightFogIntensity;
uniform 	mediump float _DistanceHeightBlend;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _DistanceLUT;
UNITY_LOCATION(3) uniform mediump sampler2D _HeightLUT;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bvec3 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
vec2 u_xlat4;
float u_xlat8;
vec2 u_xlat9;
void main()
{
    u_xlat0.x = (-_ProjectionParams.y) + _ProjectionParams.z;
    u_xlat4.x = texture(_CameraDepthTexture, vs_TEXCOORD1.xy).x;
    u_xlat4.xy = _ZBufferParams.zx * u_xlat4.xx + _ZBufferParams.wy;
    u_xlat4.xy = vec2(1.0, 1.0) / u_xlat4.xy;
    u_xlat0.x = u_xlat0.x * u_xlat4.y + _ProjectionParams.y;
    u_xlat0.x = u_xlat0.x + (-_Near);
    u_xlat16_1.x = (-_Near) + _Far;
    u_xlat1.x = u_xlat0.x / u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.y = float(0.5);
    u_xlat9.y = float(0.5);
    u_xlat2 = texture(_DistanceLUT, u_xlat1.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat4.y>=0.999000013);
#else
    u_xlatb0.x = u_xlat4.y>=0.999000013;
#endif
    u_xlat4.x = vs_TEXCOORD2.y * u_xlat4.x + _WorldSpaceCameraPos.y;
    u_xlat4.x = u_xlat4.x + (-_LowWorldY);
    u_xlat0.x = u_xlatb0.x ? 1.0 : float(0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.z = !!(_UseDistanceFogOnSky>=u_xlat0.x);
#else
    u_xlatb0.z = _UseDistanceFogOnSky>=u_xlat0.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(_UseHeightFogOnSky>=u_xlat0.x);
#else
    u_xlatb0.x = _UseHeightFogOnSky>=u_xlat0.x;
#endif
    u_xlat0.xz = mix(vec2(0.0, 0.0), vec2(1.0, 1.0), vec2(u_xlatb0.xz));
    u_xlat8 = u_xlat0.z * u_xlat2.w;
    u_xlat16_3.x = _UseDistanceFog * _DistanceFogIntensity;
    u_xlat2.w = u_xlat8 * u_xlat16_3.x;
    u_xlat16_3.x = (-_LowWorldY) + _HighWorldY;
    u_xlat9.x = u_xlat4.x / u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat16_1 = texture(_HeightLUT, u_xlat9.xy);
    u_xlat0.x = u_xlat0.x * u_xlat16_1.w;
    u_xlat1.xyz = (-u_xlat2.xyz) + u_xlat16_1.xyz;
    u_xlat16_3.x = _UseHeightFog * _HeightFogIntensity;
    u_xlat1.w = u_xlat0.x * u_xlat16_3.x + (-u_xlat2.w);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseDistanceFog));
#else
    u_xlatb0.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseDistanceFog);
#endif
    u_xlat16_3.x = (u_xlatb0.x) ? _DistanceHeightBlend : 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseHeightFog));
#else
    u_xlatb0.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseHeightFog);
#endif
    u_xlat16_3.x = (u_xlatb0.x) ? u_xlat16_3.x : 0.0;
    u_xlat0 = u_xlat16_3.xxxx * u_xlat1 + u_xlat2;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat0.xyz + (-u_xlat16_1.xyz);
    SV_Target0.xyz = u_xlat0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
    SV_Target0.w = u_xlat16_1.w;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 132
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %12 %17 %85 %107 %121 %124 
                                                     OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                     OpDecorate %12 RelaxedPrecision 
                                                     OpDecorate %12 Location 12 
                                                     OpDecorate %13 RelaxedPrecision 
                                                     OpDecorate %14 RelaxedPrecision 
                                                     OpDecorate %17 Location 17 
                                                     OpDecorate %22 ArrayStride 22 
                                                     OpDecorate %23 ArrayStride 23 
                                                     OpMemberDecorate %24 0 Offset 24 
                                                     OpMemberDecorate %24 1 Offset 24 
                                                     OpMemberDecorate %24 2 Offset 24 
                                                     OpDecorate %24 Block 
                                                     OpDecorate %26 DescriptorSet 26 
                                                     OpDecorate %26 Binding 26 
                                                     OpMemberDecorate %83 0 BuiltIn 83 
                                                     OpMemberDecorate %83 1 BuiltIn 83 
                                                     OpMemberDecorate %83 2 BuiltIn 83 
                                                     OpDecorate %83 Block 
                                                     OpDecorate vs_TEXCOORD2 Location 107 
                                                     OpDecorate vs_TEXCOORD0 Location 121 
                                                     OpDecorate vs_TEXCOORD1 Location 124 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypeVector %6 2 
                                             %11 = OpTypePointer Input %10 
                                Input f32_2* %12 = OpVariable Input 
                              Private f32_4* %15 = OpVariable Private 
                                             %16 = OpTypePointer Input %7 
                                Input f32_4* %17 = OpVariable Input 
                                             %20 = OpTypeInt 32 0 
                                         u32 %21 = OpConstant 4 
                                             %22 = OpTypeArray %7 %21 
                                             %23 = OpTypeArray %7 %21 
                                             %24 = OpTypeStruct %7 %22 %23 
                                             %25 = OpTypePointer Uniform %24 
Uniform struct {f32_4; f32_4[4]; f32_4[4];}* %26 = OpVariable Uniform 
                                             %27 = OpTypeInt 32 1 
                                         i32 %28 = OpConstant 1 
                                             %29 = OpTypePointer Uniform %7 
                                         i32 %33 = OpConstant 0 
                                         i32 %41 = OpConstant 2 
                                         i32 %50 = OpConstant 3 
                              Private f32_4* %54 = OpVariable Private 
                                         u32 %81 = OpConstant 1 
                                             %82 = OpTypeArray %6 %81 
                                             %83 = OpTypeStruct %7 %6 %82 
                                             %84 = OpTypePointer Output %83 
        Output struct {f32_4; f32; f32[1];}* %85 = OpVariable Output 
                                             %87 = OpTypePointer Output %7 
                                             %89 = OpTypePointer Private %6 
                                         u32 %92 = OpConstant 0 
                                             %93 = OpTypePointer Uniform %6 
                                             %98 = OpTypeVector %6 3 
                                        f32 %101 = OpConstant 3.674022E-40 
                                      f32_3 %102 = OpConstantComposite %101 %101 %101 
                                            %106 = OpTypePointer Output %98 
                      Output f32_3* vs_TEXCOORD2 = OpVariable Output 
                                        u32 %108 = OpConstant 2 
                                            %111 = OpTypePointer Output %6 
                                            %120 = OpTypePointer Output %10 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_2 %13 = OpLoad %12 
                                       f32_4 %14 = OpVectorShuffle %13 %13 0 1 0 1 
                                                     OpStore %9 %14 
                                       f32_4 %18 = OpLoad %17 
                                       f32_4 %19 = OpVectorShuffle %18 %18 1 1 1 1 
                              Uniform f32_4* %30 = OpAccessChain %26 %28 %28 
                                       f32_4 %31 = OpLoad %30 
                                       f32_4 %32 = OpFMul %19 %31 
                                                     OpStore %15 %32 
                              Uniform f32_4* %34 = OpAccessChain %26 %28 %33 
                                       f32_4 %35 = OpLoad %34 
                                       f32_4 %36 = OpLoad %17 
                                       f32_4 %37 = OpVectorShuffle %36 %36 0 0 0 0 
                                       f32_4 %38 = OpFMul %35 %37 
                                       f32_4 %39 = OpLoad %15 
                                       f32_4 %40 = OpFAdd %38 %39 
                                                     OpStore %15 %40 
                              Uniform f32_4* %42 = OpAccessChain %26 %28 %41 
                                       f32_4 %43 = OpLoad %42 
                                       f32_4 %44 = OpLoad %17 
                                       f32_4 %45 = OpVectorShuffle %44 %44 2 2 2 2 
                                       f32_4 %46 = OpFMul %43 %45 
                                       f32_4 %47 = OpLoad %15 
                                       f32_4 %48 = OpFAdd %46 %47 
                                                     OpStore %15 %48 
                                       f32_4 %49 = OpLoad %15 
                              Uniform f32_4* %51 = OpAccessChain %26 %28 %50 
                                       f32_4 %52 = OpLoad %51 
                                       f32_4 %53 = OpFAdd %49 %52 
                                                     OpStore %15 %53 
                                       f32_4 %55 = OpLoad %15 
                                       f32_4 %56 = OpVectorShuffle %55 %55 1 1 1 1 
                              Uniform f32_4* %57 = OpAccessChain %26 %41 %28 
                                       f32_4 %58 = OpLoad %57 
                                       f32_4 %59 = OpFMul %56 %58 
                                                     OpStore %54 %59 
                              Uniform f32_4* %60 = OpAccessChain %26 %41 %33 
                                       f32_4 %61 = OpLoad %60 
                                       f32_4 %62 = OpLoad %15 
                                       f32_4 %63 = OpVectorShuffle %62 %62 0 0 0 0 
                                       f32_4 %64 = OpFMul %61 %63 
                                       f32_4 %65 = OpLoad %54 
                                       f32_4 %66 = OpFAdd %64 %65 
                                                     OpStore %54 %66 
                              Uniform f32_4* %67 = OpAccessChain %26 %41 %41 
                                       f32_4 %68 = OpLoad %67 
                                       f32_4 %69 = OpLoad %15 
                                       f32_4 %70 = OpVectorShuffle %69 %69 2 2 2 2 
                                       f32_4 %71 = OpFMul %68 %70 
                                       f32_4 %72 = OpLoad %54 
                                       f32_4 %73 = OpFAdd %71 %72 
                                                     OpStore %54 %73 
                              Uniform f32_4* %74 = OpAccessChain %26 %41 %50 
                                       f32_4 %75 = OpLoad %74 
                                       f32_4 %76 = OpLoad %15 
                                       f32_4 %77 = OpVectorShuffle %76 %76 3 3 3 3 
                                       f32_4 %78 = OpFMul %75 %77 
                                       f32_4 %79 = OpLoad %54 
                                       f32_4 %80 = OpFAdd %78 %79 
                                                     OpStore %15 %80 
                                       f32_4 %86 = OpLoad %15 
                               Output f32_4* %88 = OpAccessChain %85 %33 
                                                     OpStore %88 %86 
                                Private f32* %90 = OpAccessChain %15 %81 
                                         f32 %91 = OpLoad %90 
                                Uniform f32* %94 = OpAccessChain %26 %33 %92 
                                         f32 %95 = OpLoad %94 
                                         f32 %96 = OpFMul %91 %95 
                                Private f32* %97 = OpAccessChain %15 %81 
                                                     OpStore %97 %96 
                                       f32_4 %99 = OpLoad %15 
                                      f32_3 %100 = OpVectorShuffle %99 %99 0 3 1 
                                      f32_3 %103 = OpFMul %100 %102 
                                      f32_4 %104 = OpLoad %54 
                                      f32_4 %105 = OpVectorShuffle %104 %103 4 1 5 6 
                                                     OpStore %54 %105 
                               Private f32* %109 = OpAccessChain %15 %108 
                                        f32 %110 = OpLoad %109 
                                Output f32* %112 = OpAccessChain vs_TEXCOORD2 %108 
                                                     OpStore %112 %110 
                                      f32_4 %113 = OpLoad %54 
                                      f32_2 %114 = OpVectorShuffle %113 %113 2 2 
                                      f32_4 %115 = OpLoad %54 
                                      f32_2 %116 = OpVectorShuffle %115 %115 0 3 
                                      f32_2 %117 = OpFAdd %114 %116 
                                      f32_3 %118 = OpLoad vs_TEXCOORD2 
                                      f32_3 %119 = OpVectorShuffle %118 %117 3 4 2 
                                                     OpStore vs_TEXCOORD2 %119 
                                      f32_4 %122 = OpLoad %9 
                                      f32_2 %123 = OpVectorShuffle %122 %122 0 1 
                                                     OpStore vs_TEXCOORD0 %123 
                                      f32_4 %125 = OpLoad %9 
                                      f32_2 %126 = OpVectorShuffle %125 %125 2 3 
                                                     OpStore vs_TEXCOORD1 %126 
                                Output f32* %127 = OpAccessChain %85 %33 %81 
                                        f32 %128 = OpLoad %127 
                                        f32 %129 = OpFNegate %128 
                                Output f32* %130 = OpAccessChain %85 %33 %81 
                                                     OpStore %130 %129 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 322
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %43 %124 %297 %307 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpMemberDecorate %11 0 Offset 11 
                                                      OpMemberDecorate %11 1 Offset 11 
                                                      OpMemberDecorate %11 2 Offset 11 
                                                      OpMemberDecorate %11 3 RelaxedPrecision 
                                                      OpMemberDecorate %11 3 Offset 11 
                                                      OpMemberDecorate %11 4 RelaxedPrecision 
                                                      OpMemberDecorate %11 4 Offset 11 
                                                      OpMemberDecorate %11 5 RelaxedPrecision 
                                                      OpMemberDecorate %11 5 Offset 11 
                                                      OpMemberDecorate %11 6 RelaxedPrecision 
                                                      OpMemberDecorate %11 6 Offset 11 
                                                      OpMemberDecorate %11 7 RelaxedPrecision 
                                                      OpMemberDecorate %11 7 Offset 11 
                                                      OpMemberDecorate %11 8 RelaxedPrecision 
                                                      OpMemberDecorate %11 8 Offset 11 
                                                      OpMemberDecorate %11 9 RelaxedPrecision 
                                                      OpMemberDecorate %11 9 Offset 11 
                                                      OpMemberDecorate %11 10 RelaxedPrecision 
                                                      OpMemberDecorate %11 10 Offset 11 
                                                      OpMemberDecorate %11 11 RelaxedPrecision 
                                                      OpMemberDecorate %11 11 Offset 11 
                                                      OpMemberDecorate %11 12 RelaxedPrecision 
                                                      OpMemberDecorate %11 12 Offset 11 
                                                      OpMemberDecorate %11 13 RelaxedPrecision 
                                                      OpMemberDecorate %11 13 Offset 11 
                                                      OpDecorate %11 Block 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %34 DescriptorSet 34 
                                                      OpDecorate %34 Binding 34 
                                                      OpDecorate %38 DescriptorSet 38 
                                                      OpDecorate %38 Binding 38 
                                                      OpDecorate vs_TEXCOORD1 Location 43 
                                                      OpDecorate %77 RelaxedPrecision 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %83 RelaxedPrecision 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %87 RelaxedPrecision 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %92 RelaxedPrecision 
                                                      OpDecorate %105 RelaxedPrecision 
                                                      OpDecorate %105 DescriptorSet 105 
                                                      OpDecorate %105 Binding 105 
                                                      OpDecorate %106 RelaxedPrecision 
                                                      OpDecorate %107 RelaxedPrecision 
                                                      OpDecorate %107 DescriptorSet 107 
                                                      OpDecorate %107 Binding 107 
                                                      OpDecorate %108 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 Location 124 
                                                      OpDecorate %140 RelaxedPrecision 
                                                      OpDecorate %141 RelaxedPrecision 
                                                      OpDecorate %150 RelaxedPrecision 
                                                      OpDecorate %157 RelaxedPrecision 
                                                      OpDecorate %178 RelaxedPrecision 
                                                      OpDecorate %181 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %211 DescriptorSet 211 
                                                      OpDecorate %211 Binding 211 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %213 DescriptorSet 213 
                                                      OpDecorate %213 Binding 213 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %284 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %292 RelaxedPrecision 
                                                      OpDecorate %292 DescriptorSet 292 
                                                      OpDecorate %292 Binding 292 
                                                      OpDecorate %293 RelaxedPrecision 
                                                      OpDecorate %294 RelaxedPrecision 
                                                      OpDecorate %294 DescriptorSet 294 
                                                      OpDecorate %294 Binding 294 
                                                      OpDecorate %295 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 297 
                                                      OpDecorate %302 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %307 RelaxedPrecision 
                                                      OpDecorate %307 Location 307 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate %312 RelaxedPrecision 
                                                      OpDecorate %313 RelaxedPrecision 
                                                      OpDecorate %318 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypeStruct %10 %7 %7 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 
                                              %12 = OpTypePointer Uniform %11 
Uniform struct {f32_3; f32_4; f32_4; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32;}* %13 = OpVariable Uniform 
                                              %14 = OpTypeInt 32 1 
                                          i32 %15 = OpConstant 1 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 1 
                                              %18 = OpTypePointer Uniform %6 
                                          u32 %22 = OpConstant 2 
                                          u32 %26 = OpConstant 0 
                                              %27 = OpTypePointer Private %6 
                                              %29 = OpTypeVector %6 2 
                                              %30 = OpTypePointer Private %29 
                               Private f32_2* %31 = OpVariable Private 
                                              %32 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %33 = OpTypePointer UniformConstant %32 
         UniformConstant read_only Texture2D* %34 = OpVariable UniformConstant 
                                              %36 = OpTypeSampler 
                                              %37 = OpTypePointer UniformConstant %36 
                     UniformConstant sampler* %38 = OpVariable UniformConstant 
                                              %40 = OpTypeSampledImage %32 
                                              %42 = OpTypePointer Input %29 
                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                          i32 %48 = OpConstant 2 
                                              %49 = OpTypePointer Uniform %7 
                                          f32 %60 = OpConstant 3.674022E-40 
                                        f32_2 %61 = OpConstantComposite %60 %60 
                                          i32 %75 = OpConstant 3 
                                 Private f32* %81 = OpVariable Private 
                                          i32 %85 = OpConstant 4 
                               Private f32_4* %89 = OpVariable Private 
                                          f32 %97 = OpConstant 3.674022E-40 
                                         f32 %100 = OpConstant 3.674022E-40 
                              Private f32_2* %102 = OpVariable Private 
                              Private f32_4* %104 = OpVariable Private 
        UniformConstant read_only Texture2D* %105 = OpVariable UniformConstant 
                    UniformConstant sampler* %107 = OpVariable UniformConstant 
                                             %113 = OpTypeBool 
                                             %114 = OpTypeVector %113 3 
                                             %115 = OpTypePointer Private %114 
                             Private bool_3* %116 = OpVariable Private 
                                         f32 %119 = OpConstant 3.674022E-40 
                                             %121 = OpTypePointer Private %113 
                                             %123 = OpTypePointer Input %10 
                        Input f32_3* vs_TEXCOORD2 = OpVariable Input 
                                             %125 = OpTypePointer Input %6 
                                         i32 %131 = OpConstant 0 
                                         i32 %138 = OpConstant 7 
                                         i32 %148 = OpConstant 6 
                                         i32 %155 = OpConstant 10 
                                       f32_2 %162 = OpConstantComposite %97 %97 
                                             %163 = OpTypeVector %113 2 
                                Private f32* %170 = OpVariable Private 
                                         u32 %173 = OpConstant 3 
                                             %177 = OpTypePointer Private %10 
                              Private f32_3* %178 = OpVariable Private 
                                         i32 %179 = OpConstant 5 
                                         i32 %182 = OpConstant 11 
                                         i32 %195 = OpConstant 8 
                              Private f32_4* %210 = OpVariable Private 
        UniformConstant read_only Texture2D* %211 = OpVariable UniformConstant 
                    UniformConstant sampler* %213 = OpVariable UniformConstant 
                                         i32 %232 = OpConstant 9 
                                         i32 %235 = OpConstant 12 
                                       f32_4 %250 = OpConstantComposite %97 %97 %97 %97 
                                             %254 = OpTypeVector %113 4 
                                             %260 = OpTypePointer Function %6 
                                         i32 %264 = OpConstant 13 
        UniformConstant read_only Texture2D* %292 = OpVariable UniformConstant 
                    UniformConstant sampler* %294 = OpVariable UniformConstant 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                             %306 = OpTypePointer Output %7 
                               Output f32_4* %307 = OpVariable Output 
                                             %319 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %261 = OpVariable Function 
                               Function f32* %278 = OpVariable Function 
                                 Uniform f32* %19 = OpAccessChain %13 %15 %17 
                                          f32 %20 = OpLoad %19 
                                          f32 %21 = OpFNegate %20 
                                 Uniform f32* %23 = OpAccessChain %13 %15 %22 
                                          f32 %24 = OpLoad %23 
                                          f32 %25 = OpFAdd %21 %24 
                                 Private f32* %28 = OpAccessChain %9 %26 
                                                      OpStore %28 %25 
                          read_only Texture2D %35 = OpLoad %34 
                                      sampler %39 = OpLoad %38 
                   read_only Texture2DSampled %41 = OpSampledImage %35 %39 
                                        f32_2 %44 = OpLoad vs_TEXCOORD1 
                                        f32_4 %45 = OpImageSampleImplicitLod %41 %44 
                                          f32 %46 = OpCompositeExtract %45 0 
                                 Private f32* %47 = OpAccessChain %31 %26 
                                                      OpStore %47 %46 
                               Uniform f32_4* %50 = OpAccessChain %13 %48 
                                        f32_4 %51 = OpLoad %50 
                                        f32_2 %52 = OpVectorShuffle %51 %51 2 0 
                                        f32_2 %53 = OpLoad %31 
                                        f32_2 %54 = OpVectorShuffle %53 %53 0 0 
                                        f32_2 %55 = OpFMul %52 %54 
                               Uniform f32_4* %56 = OpAccessChain %13 %48 
                                        f32_4 %57 = OpLoad %56 
                                        f32_2 %58 = OpVectorShuffle %57 %57 3 1 
                                        f32_2 %59 = OpFAdd %55 %58 
                                                      OpStore %31 %59 
                                        f32_2 %62 = OpLoad %31 
                                        f32_2 %63 = OpFDiv %61 %62 
                                                      OpStore %31 %63 
                                 Private f32* %64 = OpAccessChain %9 %26 
                                          f32 %65 = OpLoad %64 
                                 Private f32* %66 = OpAccessChain %31 %17 
                                          f32 %67 = OpLoad %66 
                                          f32 %68 = OpFMul %65 %67 
                                 Uniform f32* %69 = OpAccessChain %13 %15 %17 
                                          f32 %70 = OpLoad %69 
                                          f32 %71 = OpFAdd %68 %70 
                                 Private f32* %72 = OpAccessChain %9 %26 
                                                      OpStore %72 %71 
                                 Private f32* %73 = OpAccessChain %9 %26 
                                          f32 %74 = OpLoad %73 
                                 Uniform f32* %76 = OpAccessChain %13 %75 
                                          f32 %77 = OpLoad %76 
                                          f32 %78 = OpFNegate %77 
                                          f32 %79 = OpFAdd %74 %78 
                                 Private f32* %80 = OpAccessChain %9 %26 
                                                      OpStore %80 %79 
                                 Uniform f32* %82 = OpAccessChain %13 %75 
                                          f32 %83 = OpLoad %82 
                                          f32 %84 = OpFNegate %83 
                                 Uniform f32* %86 = OpAccessChain %13 %85 
                                          f32 %87 = OpLoad %86 
                                          f32 %88 = OpFAdd %84 %87 
                                                      OpStore %81 %88 
                                 Private f32* %90 = OpAccessChain %9 %26 
                                          f32 %91 = OpLoad %90 
                                          f32 %92 = OpLoad %81 
                                          f32 %93 = OpFDiv %91 %92 
                                 Private f32* %94 = OpAccessChain %89 %26 
                                                      OpStore %94 %93 
                                 Private f32* %95 = OpAccessChain %89 %26 
                                          f32 %96 = OpLoad %95 
                                          f32 %98 = OpExtInst %1 43 %96 %97 %60 
                                 Private f32* %99 = OpAccessChain %89 %26 
                                                      OpStore %99 %98 
                                Private f32* %101 = OpAccessChain %89 %17 
                                                      OpStore %101 %100 
                                Private f32* %103 = OpAccessChain %102 %17 
                                                      OpStore %103 %100 
                         read_only Texture2D %106 = OpLoad %105 
                                     sampler %108 = OpLoad %107 
                  read_only Texture2DSampled %109 = OpSampledImage %106 %108 
                                       f32_4 %110 = OpLoad %89 
                                       f32_2 %111 = OpVectorShuffle %110 %110 0 1 
                                       f32_4 %112 = OpImageSampleImplicitLod %109 %111 
                                                      OpStore %104 %112 
                                Private f32* %117 = OpAccessChain %31 %17 
                                         f32 %118 = OpLoad %117 
                                        bool %120 = OpFOrdGreaterThanEqual %118 %119 
                               Private bool* %122 = OpAccessChain %116 %26 
                                                      OpStore %122 %120 
                                  Input f32* %126 = OpAccessChain vs_TEXCOORD2 %17 
                                         f32 %127 = OpLoad %126 
                                Private f32* %128 = OpAccessChain %31 %26 
                                         f32 %129 = OpLoad %128 
                                         f32 %130 = OpFMul %127 %129 
                                Uniform f32* %132 = OpAccessChain %13 %131 %17 
                                         f32 %133 = OpLoad %132 
                                         f32 %134 = OpFAdd %130 %133 
                                Private f32* %135 = OpAccessChain %31 %26 
                                                      OpStore %135 %134 
                                Private f32* %136 = OpAccessChain %31 %26 
                                         f32 %137 = OpLoad %136 
                                Uniform f32* %139 = OpAccessChain %13 %138 
                                         f32 %140 = OpLoad %139 
                                         f32 %141 = OpFNegate %140 
                                         f32 %142 = OpFAdd %137 %141 
                                Private f32* %143 = OpAccessChain %31 %26 
                                                      OpStore %143 %142 
                               Private bool* %144 = OpAccessChain %116 %26 
                                        bool %145 = OpLoad %144 
                                         f32 %146 = OpSelect %145 %60 %97 
                                Private f32* %147 = OpAccessChain %9 %26 
                                                      OpStore %147 %146 
                                Uniform f32* %149 = OpAccessChain %13 %148 
                                         f32 %150 = OpLoad %149 
                                Private f32* %151 = OpAccessChain %9 %26 
                                         f32 %152 = OpLoad %151 
                                        bool %153 = OpFOrdGreaterThanEqual %150 %152 
                               Private bool* %154 = OpAccessChain %116 %22 
                                                      OpStore %154 %153 
                                Uniform f32* %156 = OpAccessChain %13 %155 
                                         f32 %157 = OpLoad %156 
                                Private f32* %158 = OpAccessChain %9 %26 
                                         f32 %159 = OpLoad %158 
                                        bool %160 = OpFOrdGreaterThanEqual %157 %159 
                               Private bool* %161 = OpAccessChain %116 %26 
                                                      OpStore %161 %160 
                                      bool_3 %164 = OpLoad %116 
                                      bool_2 %165 = OpVectorShuffle %164 %164 0 2 
                                       f32_2 %166 = OpSelect %165 %61 %162 
                                       f32_2 %167 = OpExtInst %1 46 %162 %61 %166 
                                       f32_4 %168 = OpLoad %9 
                                       f32_4 %169 = OpVectorShuffle %168 %167 4 1 5 3 
                                                      OpStore %9 %169 
                                Private f32* %171 = OpAccessChain %9 %22 
                                         f32 %172 = OpLoad %171 
                                Private f32* %174 = OpAccessChain %104 %173 
                                         f32 %175 = OpLoad %174 
                                         f32 %176 = OpFMul %172 %175 
                                                      OpStore %170 %176 
                                Uniform f32* %180 = OpAccessChain %13 %179 
                                         f32 %181 = OpLoad %180 
                                Uniform f32* %183 = OpAccessChain %13 %182 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpFMul %181 %184 
                                Private f32* %186 = OpAccessChain %178 %26 
                                                      OpStore %186 %185 
                                         f32 %187 = OpLoad %170 
                                Private f32* %188 = OpAccessChain %178 %26 
                                         f32 %189 = OpLoad %188 
                                         f32 %190 = OpFMul %187 %189 
                                Private f32* %191 = OpAccessChain %104 %173 
                                                      OpStore %191 %190 
                                Uniform f32* %192 = OpAccessChain %13 %138 
                                         f32 %193 = OpLoad %192 
                                         f32 %194 = OpFNegate %193 
                                Uniform f32* %196 = OpAccessChain %13 %195 
                                         f32 %197 = OpLoad %196 
                                         f32 %198 = OpFAdd %194 %197 
                                Private f32* %199 = OpAccessChain %178 %26 
                                                      OpStore %199 %198 
                                Private f32* %200 = OpAccessChain %31 %26 
                                         f32 %201 = OpLoad %200 
                                Private f32* %202 = OpAccessChain %178 %26 
                                         f32 %203 = OpLoad %202 
                                         f32 %204 = OpFDiv %201 %203 
                                Private f32* %205 = OpAccessChain %102 %26 
                                                      OpStore %205 %204 
                                Private f32* %206 = OpAccessChain %102 %26 
                                         f32 %207 = OpLoad %206 
                                         f32 %208 = OpExtInst %1 43 %207 %97 %60 
                                Private f32* %209 = OpAccessChain %102 %26 
                                                      OpStore %209 %208 
                         read_only Texture2D %212 = OpLoad %211 
                                     sampler %214 = OpLoad %213 
                  read_only Texture2DSampled %215 = OpSampledImage %212 %214 
                                       f32_2 %216 = OpLoad %102 
                                       f32_4 %217 = OpImageSampleImplicitLod %215 %216 
                                                      OpStore %210 %217 
                                Private f32* %218 = OpAccessChain %9 %26 
                                         f32 %219 = OpLoad %218 
                                Private f32* %220 = OpAccessChain %210 %173 
                                         f32 %221 = OpLoad %220 
                                         f32 %222 = OpFMul %219 %221 
                                Private f32* %223 = OpAccessChain %9 %26 
                                                      OpStore %223 %222 
                                       f32_4 %224 = OpLoad %104 
                                       f32_3 %225 = OpVectorShuffle %224 %224 0 1 2 
                                       f32_3 %226 = OpFNegate %225 
                                       f32_4 %227 = OpLoad %210 
                                       f32_3 %228 = OpVectorShuffle %227 %227 0 1 2 
                                       f32_3 %229 = OpFAdd %226 %228 
                                       f32_4 %230 = OpLoad %89 
                                       f32_4 %231 = OpVectorShuffle %230 %229 4 5 6 3 
                                                      OpStore %89 %231 
                                Uniform f32* %233 = OpAccessChain %13 %232 
                                         f32 %234 = OpLoad %233 
                                Uniform f32* %236 = OpAccessChain %13 %235 
                                         f32 %237 = OpLoad %236 
                                         f32 %238 = OpFMul %234 %237 
                                Private f32* %239 = OpAccessChain %178 %26 
                                                      OpStore %239 %238 
                                Private f32* %240 = OpAccessChain %9 %26 
                                         f32 %241 = OpLoad %240 
                                Private f32* %242 = OpAccessChain %178 %26 
                                         f32 %243 = OpLoad %242 
                                         f32 %244 = OpFMul %241 %243 
                                Private f32* %245 = OpAccessChain %104 %173 
                                         f32 %246 = OpLoad %245 
                                         f32 %247 = OpFNegate %246 
                                         f32 %248 = OpFAdd %244 %247 
                                Private f32* %249 = OpAccessChain %89 %173 
                                                      OpStore %249 %248 
                                Uniform f32* %251 = OpAccessChain %13 %179 
                                         f32 %252 = OpLoad %251 
                                       f32_4 %253 = OpCompositeConstruct %252 %252 %252 %252 
                                      bool_4 %255 = OpFOrdNotEqual %250 %253 
                                        bool %256 = OpAny %255 
                               Private bool* %257 = OpAccessChain %116 %26 
                                                      OpStore %257 %256 
                               Private bool* %258 = OpAccessChain %116 %26 
                                        bool %259 = OpLoad %258 
                                                      OpSelectionMerge %263 None 
                                                      OpBranchConditional %259 %262 %267 
                                             %262 = OpLabel 
                                Uniform f32* %265 = OpAccessChain %13 %264 
                                         f32 %266 = OpLoad %265 
                                                      OpStore %261 %266 
                                                      OpBranch %263 
                                             %267 = OpLabel 
                                                      OpStore %261 %60 
                                                      OpBranch %263 
                                             %263 = OpLabel 
                                         f32 %268 = OpLoad %261 
                                Private f32* %269 = OpAccessChain %178 %26 
                                                      OpStore %269 %268 
                                Uniform f32* %270 = OpAccessChain %13 %232 
                                         f32 %271 = OpLoad %270 
                                       f32_4 %272 = OpCompositeConstruct %271 %271 %271 %271 
                                      bool_4 %273 = OpFOrdNotEqual %250 %272 
                                        bool %274 = OpAny %273 
                               Private bool* %275 = OpAccessChain %116 %26 
                                                      OpStore %275 %274 
                               Private bool* %276 = OpAccessChain %116 %26 
                                        bool %277 = OpLoad %276 
                                                      OpSelectionMerge %280 None 
                                                      OpBranchConditional %277 %279 %283 
                                             %279 = OpLabel 
                                Private f32* %281 = OpAccessChain %178 %26 
                                         f32 %282 = OpLoad %281 
                                                      OpStore %278 %282 
                                                      OpBranch %280 
                                             %283 = OpLabel 
                                                      OpStore %278 %97 
                                                      OpBranch %280 
                                             %280 = OpLabel 
                                         f32 %284 = OpLoad %278 
                                Private f32* %285 = OpAccessChain %178 %26 
                                                      OpStore %285 %284 
                                       f32_3 %286 = OpLoad %178 
                                       f32_4 %287 = OpVectorShuffle %286 %286 0 0 0 0 
                                       f32_4 %288 = OpLoad %89 
                                       f32_4 %289 = OpFMul %287 %288 
                                       f32_4 %290 = OpLoad %104 
                                       f32_4 %291 = OpFAdd %289 %290 
                                                      OpStore %9 %291 
                         read_only Texture2D %293 = OpLoad %292 
                                     sampler %295 = OpLoad %294 
                  read_only Texture2DSampled %296 = OpSampledImage %293 %295 
                                       f32_2 %298 = OpLoad vs_TEXCOORD0 
                                       f32_4 %299 = OpImageSampleImplicitLod %296 %298 
                                                      OpStore %210 %299 
                                       f32_4 %300 = OpLoad %9 
                                       f32_3 %301 = OpVectorShuffle %300 %300 0 1 2 
                                       f32_4 %302 = OpLoad %210 
                                       f32_3 %303 = OpVectorShuffle %302 %302 0 1 2 
                                       f32_3 %304 = OpFNegate %303 
                                       f32_3 %305 = OpFAdd %301 %304 
                                                      OpStore %178 %305 
                                       f32_4 %308 = OpLoad %9 
                                       f32_3 %309 = OpVectorShuffle %308 %308 3 3 3 
                                       f32_3 %310 = OpLoad %178 
                                       f32_3 %311 = OpFMul %309 %310 
                                       f32_4 %312 = OpLoad %210 
                                       f32_3 %313 = OpVectorShuffle %312 %312 0 1 2 
                                       f32_3 %314 = OpFAdd %311 %313 
                                       f32_4 %315 = OpLoad %307 
                                       f32_4 %316 = OpVectorShuffle %315 %314 4 5 6 3 
                                                      OpStore %307 %316 
                                Private f32* %317 = OpAccessChain %210 %173 
                                         f32 %318 = OpLoad %317 
                                 Output f32* %320 = OpAccessChain %307 %173 
                                                      OpStore %320 %318 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 132
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %12 %17 %85 %107 %121 %124 
                                                     OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                     OpDecorate %12 RelaxedPrecision 
                                                     OpDecorate %12 Location 12 
                                                     OpDecorate %13 RelaxedPrecision 
                                                     OpDecorate %14 RelaxedPrecision 
                                                     OpDecorate %17 Location 17 
                                                     OpDecorate %22 ArrayStride 22 
                                                     OpDecorate %23 ArrayStride 23 
                                                     OpMemberDecorate %24 0 Offset 24 
                                                     OpMemberDecorate %24 1 Offset 24 
                                                     OpMemberDecorate %24 2 Offset 24 
                                                     OpDecorate %24 Block 
                                                     OpDecorate %26 DescriptorSet 26 
                                                     OpDecorate %26 Binding 26 
                                                     OpMemberDecorate %83 0 BuiltIn 83 
                                                     OpMemberDecorate %83 1 BuiltIn 83 
                                                     OpMemberDecorate %83 2 BuiltIn 83 
                                                     OpDecorate %83 Block 
                                                     OpDecorate vs_TEXCOORD2 Location 107 
                                                     OpDecorate vs_TEXCOORD0 Location 121 
                                                     OpDecorate vs_TEXCOORD1 Location 124 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypeVector %6 2 
                                             %11 = OpTypePointer Input %10 
                                Input f32_2* %12 = OpVariable Input 
                              Private f32_4* %15 = OpVariable Private 
                                             %16 = OpTypePointer Input %7 
                                Input f32_4* %17 = OpVariable Input 
                                             %20 = OpTypeInt 32 0 
                                         u32 %21 = OpConstant 4 
                                             %22 = OpTypeArray %7 %21 
                                             %23 = OpTypeArray %7 %21 
                                             %24 = OpTypeStruct %7 %22 %23 
                                             %25 = OpTypePointer Uniform %24 
Uniform struct {f32_4; f32_4[4]; f32_4[4];}* %26 = OpVariable Uniform 
                                             %27 = OpTypeInt 32 1 
                                         i32 %28 = OpConstant 1 
                                             %29 = OpTypePointer Uniform %7 
                                         i32 %33 = OpConstant 0 
                                         i32 %41 = OpConstant 2 
                                         i32 %50 = OpConstant 3 
                              Private f32_4* %54 = OpVariable Private 
                                         u32 %81 = OpConstant 1 
                                             %82 = OpTypeArray %6 %81 
                                             %83 = OpTypeStruct %7 %6 %82 
                                             %84 = OpTypePointer Output %83 
        Output struct {f32_4; f32; f32[1];}* %85 = OpVariable Output 
                                             %87 = OpTypePointer Output %7 
                                             %89 = OpTypePointer Private %6 
                                         u32 %92 = OpConstant 0 
                                             %93 = OpTypePointer Uniform %6 
                                             %98 = OpTypeVector %6 3 
                                        f32 %101 = OpConstant 3.674022E-40 
                                      f32_3 %102 = OpConstantComposite %101 %101 %101 
                                            %106 = OpTypePointer Output %98 
                      Output f32_3* vs_TEXCOORD2 = OpVariable Output 
                                        u32 %108 = OpConstant 2 
                                            %111 = OpTypePointer Output %6 
                                            %120 = OpTypePointer Output %10 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_2 %13 = OpLoad %12 
                                       f32_4 %14 = OpVectorShuffle %13 %13 0 1 0 1 
                                                     OpStore %9 %14 
                                       f32_4 %18 = OpLoad %17 
                                       f32_4 %19 = OpVectorShuffle %18 %18 1 1 1 1 
                              Uniform f32_4* %30 = OpAccessChain %26 %28 %28 
                                       f32_4 %31 = OpLoad %30 
                                       f32_4 %32 = OpFMul %19 %31 
                                                     OpStore %15 %32 
                              Uniform f32_4* %34 = OpAccessChain %26 %28 %33 
                                       f32_4 %35 = OpLoad %34 
                                       f32_4 %36 = OpLoad %17 
                                       f32_4 %37 = OpVectorShuffle %36 %36 0 0 0 0 
                                       f32_4 %38 = OpFMul %35 %37 
                                       f32_4 %39 = OpLoad %15 
                                       f32_4 %40 = OpFAdd %38 %39 
                                                     OpStore %15 %40 
                              Uniform f32_4* %42 = OpAccessChain %26 %28 %41 
                                       f32_4 %43 = OpLoad %42 
                                       f32_4 %44 = OpLoad %17 
                                       f32_4 %45 = OpVectorShuffle %44 %44 2 2 2 2 
                                       f32_4 %46 = OpFMul %43 %45 
                                       f32_4 %47 = OpLoad %15 
                                       f32_4 %48 = OpFAdd %46 %47 
                                                     OpStore %15 %48 
                                       f32_4 %49 = OpLoad %15 
                              Uniform f32_4* %51 = OpAccessChain %26 %28 %50 
                                       f32_4 %52 = OpLoad %51 
                                       f32_4 %53 = OpFAdd %49 %52 
                                                     OpStore %15 %53 
                                       f32_4 %55 = OpLoad %15 
                                       f32_4 %56 = OpVectorShuffle %55 %55 1 1 1 1 
                              Uniform f32_4* %57 = OpAccessChain %26 %41 %28 
                                       f32_4 %58 = OpLoad %57 
                                       f32_4 %59 = OpFMul %56 %58 
                                                     OpStore %54 %59 
                              Uniform f32_4* %60 = OpAccessChain %26 %41 %33 
                                       f32_4 %61 = OpLoad %60 
                                       f32_4 %62 = OpLoad %15 
                                       f32_4 %63 = OpVectorShuffle %62 %62 0 0 0 0 
                                       f32_4 %64 = OpFMul %61 %63 
                                       f32_4 %65 = OpLoad %54 
                                       f32_4 %66 = OpFAdd %64 %65 
                                                     OpStore %54 %66 
                              Uniform f32_4* %67 = OpAccessChain %26 %41 %41 
                                       f32_4 %68 = OpLoad %67 
                                       f32_4 %69 = OpLoad %15 
                                       f32_4 %70 = OpVectorShuffle %69 %69 2 2 2 2 
                                       f32_4 %71 = OpFMul %68 %70 
                                       f32_4 %72 = OpLoad %54 
                                       f32_4 %73 = OpFAdd %71 %72 
                                                     OpStore %54 %73 
                              Uniform f32_4* %74 = OpAccessChain %26 %41 %50 
                                       f32_4 %75 = OpLoad %74 
                                       f32_4 %76 = OpLoad %15 
                                       f32_4 %77 = OpVectorShuffle %76 %76 3 3 3 3 
                                       f32_4 %78 = OpFMul %75 %77 
                                       f32_4 %79 = OpLoad %54 
                                       f32_4 %80 = OpFAdd %78 %79 
                                                     OpStore %15 %80 
                                       f32_4 %86 = OpLoad %15 
                               Output f32_4* %88 = OpAccessChain %85 %33 
                                                     OpStore %88 %86 
                                Private f32* %90 = OpAccessChain %15 %81 
                                         f32 %91 = OpLoad %90 
                                Uniform f32* %94 = OpAccessChain %26 %33 %92 
                                         f32 %95 = OpLoad %94 
                                         f32 %96 = OpFMul %91 %95 
                                Private f32* %97 = OpAccessChain %15 %81 
                                                     OpStore %97 %96 
                                       f32_4 %99 = OpLoad %15 
                                      f32_3 %100 = OpVectorShuffle %99 %99 0 3 1 
                                      f32_3 %103 = OpFMul %100 %102 
                                      f32_4 %104 = OpLoad %54 
                                      f32_4 %105 = OpVectorShuffle %104 %103 4 1 5 6 
                                                     OpStore %54 %105 
                               Private f32* %109 = OpAccessChain %15 %108 
                                        f32 %110 = OpLoad %109 
                                Output f32* %112 = OpAccessChain vs_TEXCOORD2 %108 
                                                     OpStore %112 %110 
                                      f32_4 %113 = OpLoad %54 
                                      f32_2 %114 = OpVectorShuffle %113 %113 2 2 
                                      f32_4 %115 = OpLoad %54 
                                      f32_2 %116 = OpVectorShuffle %115 %115 0 3 
                                      f32_2 %117 = OpFAdd %114 %116 
                                      f32_3 %118 = OpLoad vs_TEXCOORD2 
                                      f32_3 %119 = OpVectorShuffle %118 %117 3 4 2 
                                                     OpStore vs_TEXCOORD2 %119 
                                      f32_4 %122 = OpLoad %9 
                                      f32_2 %123 = OpVectorShuffle %122 %122 0 1 
                                                     OpStore vs_TEXCOORD0 %123 
                                      f32_4 %125 = OpLoad %9 
                                      f32_2 %126 = OpVectorShuffle %125 %125 2 3 
                                                     OpStore vs_TEXCOORD1 %126 
                                Output f32* %127 = OpAccessChain %85 %33 %81 
                                        f32 %128 = OpLoad %127 
                                        f32 %129 = OpFNegate %128 
                                Output f32* %130 = OpAccessChain %85 %33 %81 
                                                     OpStore %130 %129 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 322
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %43 %124 %297 %307 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpMemberDecorate %11 0 Offset 11 
                                                      OpMemberDecorate %11 1 Offset 11 
                                                      OpMemberDecorate %11 2 Offset 11 
                                                      OpMemberDecorate %11 3 RelaxedPrecision 
                                                      OpMemberDecorate %11 3 Offset 11 
                                                      OpMemberDecorate %11 4 RelaxedPrecision 
                                                      OpMemberDecorate %11 4 Offset 11 
                                                      OpMemberDecorate %11 5 RelaxedPrecision 
                                                      OpMemberDecorate %11 5 Offset 11 
                                                      OpMemberDecorate %11 6 RelaxedPrecision 
                                                      OpMemberDecorate %11 6 Offset 11 
                                                      OpMemberDecorate %11 7 RelaxedPrecision 
                                                      OpMemberDecorate %11 7 Offset 11 
                                                      OpMemberDecorate %11 8 RelaxedPrecision 
                                                      OpMemberDecorate %11 8 Offset 11 
                                                      OpMemberDecorate %11 9 RelaxedPrecision 
                                                      OpMemberDecorate %11 9 Offset 11 
                                                      OpMemberDecorate %11 10 RelaxedPrecision 
                                                      OpMemberDecorate %11 10 Offset 11 
                                                      OpMemberDecorate %11 11 RelaxedPrecision 
                                                      OpMemberDecorate %11 11 Offset 11 
                                                      OpMemberDecorate %11 12 RelaxedPrecision 
                                                      OpMemberDecorate %11 12 Offset 11 
                                                      OpMemberDecorate %11 13 RelaxedPrecision 
                                                      OpMemberDecorate %11 13 Offset 11 
                                                      OpDecorate %11 Block 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %34 DescriptorSet 34 
                                                      OpDecorate %34 Binding 34 
                                                      OpDecorate %38 DescriptorSet 38 
                                                      OpDecorate %38 Binding 38 
                                                      OpDecorate vs_TEXCOORD1 Location 43 
                                                      OpDecorate %77 RelaxedPrecision 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %83 RelaxedPrecision 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %87 RelaxedPrecision 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %92 RelaxedPrecision 
                                                      OpDecorate %105 RelaxedPrecision 
                                                      OpDecorate %105 DescriptorSet 105 
                                                      OpDecorate %105 Binding 105 
                                                      OpDecorate %106 RelaxedPrecision 
                                                      OpDecorate %107 RelaxedPrecision 
                                                      OpDecorate %107 DescriptorSet 107 
                                                      OpDecorate %107 Binding 107 
                                                      OpDecorate %108 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 Location 124 
                                                      OpDecorate %140 RelaxedPrecision 
                                                      OpDecorate %141 RelaxedPrecision 
                                                      OpDecorate %150 RelaxedPrecision 
                                                      OpDecorate %157 RelaxedPrecision 
                                                      OpDecorate %178 RelaxedPrecision 
                                                      OpDecorate %181 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %211 DescriptorSet 211 
                                                      OpDecorate %211 Binding 211 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %213 DescriptorSet 213 
                                                      OpDecorate %213 Binding 213 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %284 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %292 RelaxedPrecision 
                                                      OpDecorate %292 DescriptorSet 292 
                                                      OpDecorate %292 Binding 292 
                                                      OpDecorate %293 RelaxedPrecision 
                                                      OpDecorate %294 RelaxedPrecision 
                                                      OpDecorate %294 DescriptorSet 294 
                                                      OpDecorate %294 Binding 294 
                                                      OpDecorate %295 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 297 
                                                      OpDecorate %302 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %307 RelaxedPrecision 
                                                      OpDecorate %307 Location 307 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate %312 RelaxedPrecision 
                                                      OpDecorate %313 RelaxedPrecision 
                                                      OpDecorate %318 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypeStruct %10 %7 %7 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 
                                              %12 = OpTypePointer Uniform %11 
Uniform struct {f32_3; f32_4; f32_4; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32;}* %13 = OpVariable Uniform 
                                              %14 = OpTypeInt 32 1 
                                          i32 %15 = OpConstant 1 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 1 
                                              %18 = OpTypePointer Uniform %6 
                                          u32 %22 = OpConstant 2 
                                          u32 %26 = OpConstant 0 
                                              %27 = OpTypePointer Private %6 
                                              %29 = OpTypeVector %6 2 
                                              %30 = OpTypePointer Private %29 
                               Private f32_2* %31 = OpVariable Private 
                                              %32 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %33 = OpTypePointer UniformConstant %32 
         UniformConstant read_only Texture2D* %34 = OpVariable UniformConstant 
                                              %36 = OpTypeSampler 
                                              %37 = OpTypePointer UniformConstant %36 
                     UniformConstant sampler* %38 = OpVariable UniformConstant 
                                              %40 = OpTypeSampledImage %32 
                                              %42 = OpTypePointer Input %29 
                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                          i32 %48 = OpConstant 2 
                                              %49 = OpTypePointer Uniform %7 
                                          f32 %60 = OpConstant 3.674022E-40 
                                        f32_2 %61 = OpConstantComposite %60 %60 
                                          i32 %75 = OpConstant 3 
                                 Private f32* %81 = OpVariable Private 
                                          i32 %85 = OpConstant 4 
                               Private f32_4* %89 = OpVariable Private 
                                          f32 %97 = OpConstant 3.674022E-40 
                                         f32 %100 = OpConstant 3.674022E-40 
                              Private f32_2* %102 = OpVariable Private 
                              Private f32_4* %104 = OpVariable Private 
        UniformConstant read_only Texture2D* %105 = OpVariable UniformConstant 
                    UniformConstant sampler* %107 = OpVariable UniformConstant 
                                             %113 = OpTypeBool 
                                             %114 = OpTypeVector %113 3 
                                             %115 = OpTypePointer Private %114 
                             Private bool_3* %116 = OpVariable Private 
                                         f32 %119 = OpConstant 3.674022E-40 
                                             %121 = OpTypePointer Private %113 
                                             %123 = OpTypePointer Input %10 
                        Input f32_3* vs_TEXCOORD2 = OpVariable Input 
                                             %125 = OpTypePointer Input %6 
                                         i32 %131 = OpConstant 0 
                                         i32 %138 = OpConstant 7 
                                         i32 %148 = OpConstant 6 
                                         i32 %155 = OpConstant 10 
                                       f32_2 %162 = OpConstantComposite %97 %97 
                                             %163 = OpTypeVector %113 2 
                                Private f32* %170 = OpVariable Private 
                                         u32 %173 = OpConstant 3 
                                             %177 = OpTypePointer Private %10 
                              Private f32_3* %178 = OpVariable Private 
                                         i32 %179 = OpConstant 5 
                                         i32 %182 = OpConstant 11 
                                         i32 %195 = OpConstant 8 
                              Private f32_4* %210 = OpVariable Private 
        UniformConstant read_only Texture2D* %211 = OpVariable UniformConstant 
                    UniformConstant sampler* %213 = OpVariable UniformConstant 
                                         i32 %232 = OpConstant 9 
                                         i32 %235 = OpConstant 12 
                                       f32_4 %250 = OpConstantComposite %97 %97 %97 %97 
                                             %254 = OpTypeVector %113 4 
                                             %260 = OpTypePointer Function %6 
                                         i32 %264 = OpConstant 13 
        UniformConstant read_only Texture2D* %292 = OpVariable UniformConstant 
                    UniformConstant sampler* %294 = OpVariable UniformConstant 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                             %306 = OpTypePointer Output %7 
                               Output f32_4* %307 = OpVariable Output 
                                             %319 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %261 = OpVariable Function 
                               Function f32* %278 = OpVariable Function 
                                 Uniform f32* %19 = OpAccessChain %13 %15 %17 
                                          f32 %20 = OpLoad %19 
                                          f32 %21 = OpFNegate %20 
                                 Uniform f32* %23 = OpAccessChain %13 %15 %22 
                                          f32 %24 = OpLoad %23 
                                          f32 %25 = OpFAdd %21 %24 
                                 Private f32* %28 = OpAccessChain %9 %26 
                                                      OpStore %28 %25 
                          read_only Texture2D %35 = OpLoad %34 
                                      sampler %39 = OpLoad %38 
                   read_only Texture2DSampled %41 = OpSampledImage %35 %39 
                                        f32_2 %44 = OpLoad vs_TEXCOORD1 
                                        f32_4 %45 = OpImageSampleImplicitLod %41 %44 
                                          f32 %46 = OpCompositeExtract %45 0 
                                 Private f32* %47 = OpAccessChain %31 %26 
                                                      OpStore %47 %46 
                               Uniform f32_4* %50 = OpAccessChain %13 %48 
                                        f32_4 %51 = OpLoad %50 
                                        f32_2 %52 = OpVectorShuffle %51 %51 2 0 
                                        f32_2 %53 = OpLoad %31 
                                        f32_2 %54 = OpVectorShuffle %53 %53 0 0 
                                        f32_2 %55 = OpFMul %52 %54 
                               Uniform f32_4* %56 = OpAccessChain %13 %48 
                                        f32_4 %57 = OpLoad %56 
                                        f32_2 %58 = OpVectorShuffle %57 %57 3 1 
                                        f32_2 %59 = OpFAdd %55 %58 
                                                      OpStore %31 %59 
                                        f32_2 %62 = OpLoad %31 
                                        f32_2 %63 = OpFDiv %61 %62 
                                                      OpStore %31 %63 
                                 Private f32* %64 = OpAccessChain %9 %26 
                                          f32 %65 = OpLoad %64 
                                 Private f32* %66 = OpAccessChain %31 %17 
                                          f32 %67 = OpLoad %66 
                                          f32 %68 = OpFMul %65 %67 
                                 Uniform f32* %69 = OpAccessChain %13 %15 %17 
                                          f32 %70 = OpLoad %69 
                                          f32 %71 = OpFAdd %68 %70 
                                 Private f32* %72 = OpAccessChain %9 %26 
                                                      OpStore %72 %71 
                                 Private f32* %73 = OpAccessChain %9 %26 
                                          f32 %74 = OpLoad %73 
                                 Uniform f32* %76 = OpAccessChain %13 %75 
                                          f32 %77 = OpLoad %76 
                                          f32 %78 = OpFNegate %77 
                                          f32 %79 = OpFAdd %74 %78 
                                 Private f32* %80 = OpAccessChain %9 %26 
                                                      OpStore %80 %79 
                                 Uniform f32* %82 = OpAccessChain %13 %75 
                                          f32 %83 = OpLoad %82 
                                          f32 %84 = OpFNegate %83 
                                 Uniform f32* %86 = OpAccessChain %13 %85 
                                          f32 %87 = OpLoad %86 
                                          f32 %88 = OpFAdd %84 %87 
                                                      OpStore %81 %88 
                                 Private f32* %90 = OpAccessChain %9 %26 
                                          f32 %91 = OpLoad %90 
                                          f32 %92 = OpLoad %81 
                                          f32 %93 = OpFDiv %91 %92 
                                 Private f32* %94 = OpAccessChain %89 %26 
                                                      OpStore %94 %93 
                                 Private f32* %95 = OpAccessChain %89 %26 
                                          f32 %96 = OpLoad %95 
                                          f32 %98 = OpExtInst %1 43 %96 %97 %60 
                                 Private f32* %99 = OpAccessChain %89 %26 
                                                      OpStore %99 %98 
                                Private f32* %101 = OpAccessChain %89 %17 
                                                      OpStore %101 %100 
                                Private f32* %103 = OpAccessChain %102 %17 
                                                      OpStore %103 %100 
                         read_only Texture2D %106 = OpLoad %105 
                                     sampler %108 = OpLoad %107 
                  read_only Texture2DSampled %109 = OpSampledImage %106 %108 
                                       f32_4 %110 = OpLoad %89 
                                       f32_2 %111 = OpVectorShuffle %110 %110 0 1 
                                       f32_4 %112 = OpImageSampleImplicitLod %109 %111 
                                                      OpStore %104 %112 
                                Private f32* %117 = OpAccessChain %31 %17 
                                         f32 %118 = OpLoad %117 
                                        bool %120 = OpFOrdGreaterThanEqual %118 %119 
                               Private bool* %122 = OpAccessChain %116 %26 
                                                      OpStore %122 %120 
                                  Input f32* %126 = OpAccessChain vs_TEXCOORD2 %17 
                                         f32 %127 = OpLoad %126 
                                Private f32* %128 = OpAccessChain %31 %26 
                                         f32 %129 = OpLoad %128 
                                         f32 %130 = OpFMul %127 %129 
                                Uniform f32* %132 = OpAccessChain %13 %131 %17 
                                         f32 %133 = OpLoad %132 
                                         f32 %134 = OpFAdd %130 %133 
                                Private f32* %135 = OpAccessChain %31 %26 
                                                      OpStore %135 %134 
                                Private f32* %136 = OpAccessChain %31 %26 
                                         f32 %137 = OpLoad %136 
                                Uniform f32* %139 = OpAccessChain %13 %138 
                                         f32 %140 = OpLoad %139 
                                         f32 %141 = OpFNegate %140 
                                         f32 %142 = OpFAdd %137 %141 
                                Private f32* %143 = OpAccessChain %31 %26 
                                                      OpStore %143 %142 
                               Private bool* %144 = OpAccessChain %116 %26 
                                        bool %145 = OpLoad %144 
                                         f32 %146 = OpSelect %145 %60 %97 
                                Private f32* %147 = OpAccessChain %9 %26 
                                                      OpStore %147 %146 
                                Uniform f32* %149 = OpAccessChain %13 %148 
                                         f32 %150 = OpLoad %149 
                                Private f32* %151 = OpAccessChain %9 %26 
                                         f32 %152 = OpLoad %151 
                                        bool %153 = OpFOrdGreaterThanEqual %150 %152 
                               Private bool* %154 = OpAccessChain %116 %22 
                                                      OpStore %154 %153 
                                Uniform f32* %156 = OpAccessChain %13 %155 
                                         f32 %157 = OpLoad %156 
                                Private f32* %158 = OpAccessChain %9 %26 
                                         f32 %159 = OpLoad %158 
                                        bool %160 = OpFOrdGreaterThanEqual %157 %159 
                               Private bool* %161 = OpAccessChain %116 %26 
                                                      OpStore %161 %160 
                                      bool_3 %164 = OpLoad %116 
                                      bool_2 %165 = OpVectorShuffle %164 %164 0 2 
                                       f32_2 %166 = OpSelect %165 %61 %162 
                                       f32_2 %167 = OpExtInst %1 46 %162 %61 %166 
                                       f32_4 %168 = OpLoad %9 
                                       f32_4 %169 = OpVectorShuffle %168 %167 4 1 5 3 
                                                      OpStore %9 %169 
                                Private f32* %171 = OpAccessChain %9 %22 
                                         f32 %172 = OpLoad %171 
                                Private f32* %174 = OpAccessChain %104 %173 
                                         f32 %175 = OpLoad %174 
                                         f32 %176 = OpFMul %172 %175 
                                                      OpStore %170 %176 
                                Uniform f32* %180 = OpAccessChain %13 %179 
                                         f32 %181 = OpLoad %180 
                                Uniform f32* %183 = OpAccessChain %13 %182 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpFMul %181 %184 
                                Private f32* %186 = OpAccessChain %178 %26 
                                                      OpStore %186 %185 
                                         f32 %187 = OpLoad %170 
                                Private f32* %188 = OpAccessChain %178 %26 
                                         f32 %189 = OpLoad %188 
                                         f32 %190 = OpFMul %187 %189 
                                Private f32* %191 = OpAccessChain %104 %173 
                                                      OpStore %191 %190 
                                Uniform f32* %192 = OpAccessChain %13 %138 
                                         f32 %193 = OpLoad %192 
                                         f32 %194 = OpFNegate %193 
                                Uniform f32* %196 = OpAccessChain %13 %195 
                                         f32 %197 = OpLoad %196 
                                         f32 %198 = OpFAdd %194 %197 
                                Private f32* %199 = OpAccessChain %178 %26 
                                                      OpStore %199 %198 
                                Private f32* %200 = OpAccessChain %31 %26 
                                         f32 %201 = OpLoad %200 
                                Private f32* %202 = OpAccessChain %178 %26 
                                         f32 %203 = OpLoad %202 
                                         f32 %204 = OpFDiv %201 %203 
                                Private f32* %205 = OpAccessChain %102 %26 
                                                      OpStore %205 %204 
                                Private f32* %206 = OpAccessChain %102 %26 
                                         f32 %207 = OpLoad %206 
                                         f32 %208 = OpExtInst %1 43 %207 %97 %60 
                                Private f32* %209 = OpAccessChain %102 %26 
                                                      OpStore %209 %208 
                         read_only Texture2D %212 = OpLoad %211 
                                     sampler %214 = OpLoad %213 
                  read_only Texture2DSampled %215 = OpSampledImage %212 %214 
                                       f32_2 %216 = OpLoad %102 
                                       f32_4 %217 = OpImageSampleImplicitLod %215 %216 
                                                      OpStore %210 %217 
                                Private f32* %218 = OpAccessChain %9 %26 
                                         f32 %219 = OpLoad %218 
                                Private f32* %220 = OpAccessChain %210 %173 
                                         f32 %221 = OpLoad %220 
                                         f32 %222 = OpFMul %219 %221 
                                Private f32* %223 = OpAccessChain %9 %26 
                                                      OpStore %223 %222 
                                       f32_4 %224 = OpLoad %104 
                                       f32_3 %225 = OpVectorShuffle %224 %224 0 1 2 
                                       f32_3 %226 = OpFNegate %225 
                                       f32_4 %227 = OpLoad %210 
                                       f32_3 %228 = OpVectorShuffle %227 %227 0 1 2 
                                       f32_3 %229 = OpFAdd %226 %228 
                                       f32_4 %230 = OpLoad %89 
                                       f32_4 %231 = OpVectorShuffle %230 %229 4 5 6 3 
                                                      OpStore %89 %231 
                                Uniform f32* %233 = OpAccessChain %13 %232 
                                         f32 %234 = OpLoad %233 
                                Uniform f32* %236 = OpAccessChain %13 %235 
                                         f32 %237 = OpLoad %236 
                                         f32 %238 = OpFMul %234 %237 
                                Private f32* %239 = OpAccessChain %178 %26 
                                                      OpStore %239 %238 
                                Private f32* %240 = OpAccessChain %9 %26 
                                         f32 %241 = OpLoad %240 
                                Private f32* %242 = OpAccessChain %178 %26 
                                         f32 %243 = OpLoad %242 
                                         f32 %244 = OpFMul %241 %243 
                                Private f32* %245 = OpAccessChain %104 %173 
                                         f32 %246 = OpLoad %245 
                                         f32 %247 = OpFNegate %246 
                                         f32 %248 = OpFAdd %244 %247 
                                Private f32* %249 = OpAccessChain %89 %173 
                                                      OpStore %249 %248 
                                Uniform f32* %251 = OpAccessChain %13 %179 
                                         f32 %252 = OpLoad %251 
                                       f32_4 %253 = OpCompositeConstruct %252 %252 %252 %252 
                                      bool_4 %255 = OpFOrdNotEqual %250 %253 
                                        bool %256 = OpAny %255 
                               Private bool* %257 = OpAccessChain %116 %26 
                                                      OpStore %257 %256 
                               Private bool* %258 = OpAccessChain %116 %26 
                                        bool %259 = OpLoad %258 
                                                      OpSelectionMerge %263 None 
                                                      OpBranchConditional %259 %262 %267 
                                             %262 = OpLabel 
                                Uniform f32* %265 = OpAccessChain %13 %264 
                                         f32 %266 = OpLoad %265 
                                                      OpStore %261 %266 
                                                      OpBranch %263 
                                             %267 = OpLabel 
                                                      OpStore %261 %60 
                                                      OpBranch %263 
                                             %263 = OpLabel 
                                         f32 %268 = OpLoad %261 
                                Private f32* %269 = OpAccessChain %178 %26 
                                                      OpStore %269 %268 
                                Uniform f32* %270 = OpAccessChain %13 %232 
                                         f32 %271 = OpLoad %270 
                                       f32_4 %272 = OpCompositeConstruct %271 %271 %271 %271 
                                      bool_4 %273 = OpFOrdNotEqual %250 %272 
                                        bool %274 = OpAny %273 
                               Private bool* %275 = OpAccessChain %116 %26 
                                                      OpStore %275 %274 
                               Private bool* %276 = OpAccessChain %116 %26 
                                        bool %277 = OpLoad %276 
                                                      OpSelectionMerge %280 None 
                                                      OpBranchConditional %277 %279 %283 
                                             %279 = OpLabel 
                                Private f32* %281 = OpAccessChain %178 %26 
                                         f32 %282 = OpLoad %281 
                                                      OpStore %278 %282 
                                                      OpBranch %280 
                                             %283 = OpLabel 
                                                      OpStore %278 %97 
                                                      OpBranch %280 
                                             %280 = OpLabel 
                                         f32 %284 = OpLoad %278 
                                Private f32* %285 = OpAccessChain %178 %26 
                                                      OpStore %285 %284 
                                       f32_3 %286 = OpLoad %178 
                                       f32_4 %287 = OpVectorShuffle %286 %286 0 0 0 0 
                                       f32_4 %288 = OpLoad %89 
                                       f32_4 %289 = OpFMul %287 %288 
                                       f32_4 %290 = OpLoad %104 
                                       f32_4 %291 = OpFAdd %289 %290 
                                                      OpStore %9 %291 
                         read_only Texture2D %293 = OpLoad %292 
                                     sampler %295 = OpLoad %294 
                  read_only Texture2DSampled %296 = OpSampledImage %293 %295 
                                       f32_2 %298 = OpLoad vs_TEXCOORD0 
                                       f32_4 %299 = OpImageSampleImplicitLod %296 %298 
                                                      OpStore %210 %299 
                                       f32_4 %300 = OpLoad %9 
                                       f32_3 %301 = OpVectorShuffle %300 %300 0 1 2 
                                       f32_4 %302 = OpLoad %210 
                                       f32_3 %303 = OpVectorShuffle %302 %302 0 1 2 
                                       f32_3 %304 = OpFNegate %303 
                                       f32_3 %305 = OpFAdd %301 %304 
                                                      OpStore %178 %305 
                                       f32_4 %308 = OpLoad %9 
                                       f32_3 %309 = OpVectorShuffle %308 %308 3 3 3 
                                       f32_3 %310 = OpLoad %178 
                                       f32_3 %311 = OpFMul %309 %310 
                                       f32_4 %312 = OpLoad %210 
                                       f32_3 %313 = OpVectorShuffle %312 %312 0 1 2 
                                       f32_3 %314 = OpFAdd %311 %313 
                                       f32_4 %315 = OpLoad %307 
                                       f32_4 %316 = OpVectorShuffle %315 %314 4 5 6 3 
                                                      OpStore %307 %316 
                                Private f32* %317 = OpAccessChain %210 %173 
                                         f32 %318 = OpLoad %317 
                                 Output f32* %320 = OpAccessChain %307 %173 
                                                      OpStore %320 %318 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 132
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %12 %17 %85 %107 %121 %124 
                                                     OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                     OpDecorate %12 RelaxedPrecision 
                                                     OpDecorate %12 Location 12 
                                                     OpDecorate %13 RelaxedPrecision 
                                                     OpDecorate %14 RelaxedPrecision 
                                                     OpDecorate %17 Location 17 
                                                     OpDecorate %22 ArrayStride 22 
                                                     OpDecorate %23 ArrayStride 23 
                                                     OpMemberDecorate %24 0 Offset 24 
                                                     OpMemberDecorate %24 1 Offset 24 
                                                     OpMemberDecorate %24 2 Offset 24 
                                                     OpDecorate %24 Block 
                                                     OpDecorate %26 DescriptorSet 26 
                                                     OpDecorate %26 Binding 26 
                                                     OpMemberDecorate %83 0 BuiltIn 83 
                                                     OpMemberDecorate %83 1 BuiltIn 83 
                                                     OpMemberDecorate %83 2 BuiltIn 83 
                                                     OpDecorate %83 Block 
                                                     OpDecorate vs_TEXCOORD2 Location 107 
                                                     OpDecorate vs_TEXCOORD0 Location 121 
                                                     OpDecorate vs_TEXCOORD1 Location 124 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypeVector %6 2 
                                             %11 = OpTypePointer Input %10 
                                Input f32_2* %12 = OpVariable Input 
                              Private f32_4* %15 = OpVariable Private 
                                             %16 = OpTypePointer Input %7 
                                Input f32_4* %17 = OpVariable Input 
                                             %20 = OpTypeInt 32 0 
                                         u32 %21 = OpConstant 4 
                                             %22 = OpTypeArray %7 %21 
                                             %23 = OpTypeArray %7 %21 
                                             %24 = OpTypeStruct %7 %22 %23 
                                             %25 = OpTypePointer Uniform %24 
Uniform struct {f32_4; f32_4[4]; f32_4[4];}* %26 = OpVariable Uniform 
                                             %27 = OpTypeInt 32 1 
                                         i32 %28 = OpConstant 1 
                                             %29 = OpTypePointer Uniform %7 
                                         i32 %33 = OpConstant 0 
                                         i32 %41 = OpConstant 2 
                                         i32 %50 = OpConstant 3 
                              Private f32_4* %54 = OpVariable Private 
                                         u32 %81 = OpConstant 1 
                                             %82 = OpTypeArray %6 %81 
                                             %83 = OpTypeStruct %7 %6 %82 
                                             %84 = OpTypePointer Output %83 
        Output struct {f32_4; f32; f32[1];}* %85 = OpVariable Output 
                                             %87 = OpTypePointer Output %7 
                                             %89 = OpTypePointer Private %6 
                                         u32 %92 = OpConstant 0 
                                             %93 = OpTypePointer Uniform %6 
                                             %98 = OpTypeVector %6 3 
                                        f32 %101 = OpConstant 3.674022E-40 
                                      f32_3 %102 = OpConstantComposite %101 %101 %101 
                                            %106 = OpTypePointer Output %98 
                      Output f32_3* vs_TEXCOORD2 = OpVariable Output 
                                        u32 %108 = OpConstant 2 
                                            %111 = OpTypePointer Output %6 
                                            %120 = OpTypePointer Output %10 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_2 %13 = OpLoad %12 
                                       f32_4 %14 = OpVectorShuffle %13 %13 0 1 0 1 
                                                     OpStore %9 %14 
                                       f32_4 %18 = OpLoad %17 
                                       f32_4 %19 = OpVectorShuffle %18 %18 1 1 1 1 
                              Uniform f32_4* %30 = OpAccessChain %26 %28 %28 
                                       f32_4 %31 = OpLoad %30 
                                       f32_4 %32 = OpFMul %19 %31 
                                                     OpStore %15 %32 
                              Uniform f32_4* %34 = OpAccessChain %26 %28 %33 
                                       f32_4 %35 = OpLoad %34 
                                       f32_4 %36 = OpLoad %17 
                                       f32_4 %37 = OpVectorShuffle %36 %36 0 0 0 0 
                                       f32_4 %38 = OpFMul %35 %37 
                                       f32_4 %39 = OpLoad %15 
                                       f32_4 %40 = OpFAdd %38 %39 
                                                     OpStore %15 %40 
                              Uniform f32_4* %42 = OpAccessChain %26 %28 %41 
                                       f32_4 %43 = OpLoad %42 
                                       f32_4 %44 = OpLoad %17 
                                       f32_4 %45 = OpVectorShuffle %44 %44 2 2 2 2 
                                       f32_4 %46 = OpFMul %43 %45 
                                       f32_4 %47 = OpLoad %15 
                                       f32_4 %48 = OpFAdd %46 %47 
                                                     OpStore %15 %48 
                                       f32_4 %49 = OpLoad %15 
                              Uniform f32_4* %51 = OpAccessChain %26 %28 %50 
                                       f32_4 %52 = OpLoad %51 
                                       f32_4 %53 = OpFAdd %49 %52 
                                                     OpStore %15 %53 
                                       f32_4 %55 = OpLoad %15 
                                       f32_4 %56 = OpVectorShuffle %55 %55 1 1 1 1 
                              Uniform f32_4* %57 = OpAccessChain %26 %41 %28 
                                       f32_4 %58 = OpLoad %57 
                                       f32_4 %59 = OpFMul %56 %58 
                                                     OpStore %54 %59 
                              Uniform f32_4* %60 = OpAccessChain %26 %41 %33 
                                       f32_4 %61 = OpLoad %60 
                                       f32_4 %62 = OpLoad %15 
                                       f32_4 %63 = OpVectorShuffle %62 %62 0 0 0 0 
                                       f32_4 %64 = OpFMul %61 %63 
                                       f32_4 %65 = OpLoad %54 
                                       f32_4 %66 = OpFAdd %64 %65 
                                                     OpStore %54 %66 
                              Uniform f32_4* %67 = OpAccessChain %26 %41 %41 
                                       f32_4 %68 = OpLoad %67 
                                       f32_4 %69 = OpLoad %15 
                                       f32_4 %70 = OpVectorShuffle %69 %69 2 2 2 2 
                                       f32_4 %71 = OpFMul %68 %70 
                                       f32_4 %72 = OpLoad %54 
                                       f32_4 %73 = OpFAdd %71 %72 
                                                     OpStore %54 %73 
                              Uniform f32_4* %74 = OpAccessChain %26 %41 %50 
                                       f32_4 %75 = OpLoad %74 
                                       f32_4 %76 = OpLoad %15 
                                       f32_4 %77 = OpVectorShuffle %76 %76 3 3 3 3 
                                       f32_4 %78 = OpFMul %75 %77 
                                       f32_4 %79 = OpLoad %54 
                                       f32_4 %80 = OpFAdd %78 %79 
                                                     OpStore %15 %80 
                                       f32_4 %86 = OpLoad %15 
                               Output f32_4* %88 = OpAccessChain %85 %33 
                                                     OpStore %88 %86 
                                Private f32* %90 = OpAccessChain %15 %81 
                                         f32 %91 = OpLoad %90 
                                Uniform f32* %94 = OpAccessChain %26 %33 %92 
                                         f32 %95 = OpLoad %94 
                                         f32 %96 = OpFMul %91 %95 
                                Private f32* %97 = OpAccessChain %15 %81 
                                                     OpStore %97 %96 
                                       f32_4 %99 = OpLoad %15 
                                      f32_3 %100 = OpVectorShuffle %99 %99 0 3 1 
                                      f32_3 %103 = OpFMul %100 %102 
                                      f32_4 %104 = OpLoad %54 
                                      f32_4 %105 = OpVectorShuffle %104 %103 4 1 5 6 
                                                     OpStore %54 %105 
                               Private f32* %109 = OpAccessChain %15 %108 
                                        f32 %110 = OpLoad %109 
                                Output f32* %112 = OpAccessChain vs_TEXCOORD2 %108 
                                                     OpStore %112 %110 
                                      f32_4 %113 = OpLoad %54 
                                      f32_2 %114 = OpVectorShuffle %113 %113 2 2 
                                      f32_4 %115 = OpLoad %54 
                                      f32_2 %116 = OpVectorShuffle %115 %115 0 3 
                                      f32_2 %117 = OpFAdd %114 %116 
                                      f32_3 %118 = OpLoad vs_TEXCOORD2 
                                      f32_3 %119 = OpVectorShuffle %118 %117 3 4 2 
                                                     OpStore vs_TEXCOORD2 %119 
                                      f32_4 %122 = OpLoad %9 
                                      f32_2 %123 = OpVectorShuffle %122 %122 0 1 
                                                     OpStore vs_TEXCOORD0 %123 
                                      f32_4 %125 = OpLoad %9 
                                      f32_2 %126 = OpVectorShuffle %125 %125 2 3 
                                                     OpStore vs_TEXCOORD1 %126 
                                Output f32* %127 = OpAccessChain %85 %33 %81 
                                        f32 %128 = OpLoad %127 
                                        f32 %129 = OpFNegate %128 
                                Output f32* %130 = OpAccessChain %85 %33 %81 
                                                     OpStore %130 %129 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 322
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %43 %124 %297 %307 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpMemberDecorate %11 0 Offset 11 
                                                      OpMemberDecorate %11 1 Offset 11 
                                                      OpMemberDecorate %11 2 Offset 11 
                                                      OpMemberDecorate %11 3 RelaxedPrecision 
                                                      OpMemberDecorate %11 3 Offset 11 
                                                      OpMemberDecorate %11 4 RelaxedPrecision 
                                                      OpMemberDecorate %11 4 Offset 11 
                                                      OpMemberDecorate %11 5 RelaxedPrecision 
                                                      OpMemberDecorate %11 5 Offset 11 
                                                      OpMemberDecorate %11 6 RelaxedPrecision 
                                                      OpMemberDecorate %11 6 Offset 11 
                                                      OpMemberDecorate %11 7 RelaxedPrecision 
                                                      OpMemberDecorate %11 7 Offset 11 
                                                      OpMemberDecorate %11 8 RelaxedPrecision 
                                                      OpMemberDecorate %11 8 Offset 11 
                                                      OpMemberDecorate %11 9 RelaxedPrecision 
                                                      OpMemberDecorate %11 9 Offset 11 
                                                      OpMemberDecorate %11 10 RelaxedPrecision 
                                                      OpMemberDecorate %11 10 Offset 11 
                                                      OpMemberDecorate %11 11 RelaxedPrecision 
                                                      OpMemberDecorate %11 11 Offset 11 
                                                      OpMemberDecorate %11 12 RelaxedPrecision 
                                                      OpMemberDecorate %11 12 Offset 11 
                                                      OpMemberDecorate %11 13 RelaxedPrecision 
                                                      OpMemberDecorate %11 13 Offset 11 
                                                      OpDecorate %11 Block 
                                                      OpDecorate %13 DescriptorSet 13 
                                                      OpDecorate %13 Binding 13 
                                                      OpDecorate %34 DescriptorSet 34 
                                                      OpDecorate %34 Binding 34 
                                                      OpDecorate %38 DescriptorSet 38 
                                                      OpDecorate %38 Binding 38 
                                                      OpDecorate vs_TEXCOORD1 Location 43 
                                                      OpDecorate %77 RelaxedPrecision 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %81 RelaxedPrecision 
                                                      OpDecorate %83 RelaxedPrecision 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %87 RelaxedPrecision 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %92 RelaxedPrecision 
                                                      OpDecorate %105 RelaxedPrecision 
                                                      OpDecorate %105 DescriptorSet 105 
                                                      OpDecorate %105 Binding 105 
                                                      OpDecorate %106 RelaxedPrecision 
                                                      OpDecorate %107 RelaxedPrecision 
                                                      OpDecorate %107 DescriptorSet 107 
                                                      OpDecorate %107 Binding 107 
                                                      OpDecorate %108 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 Location 124 
                                                      OpDecorate %140 RelaxedPrecision 
                                                      OpDecorate %141 RelaxedPrecision 
                                                      OpDecorate %150 RelaxedPrecision 
                                                      OpDecorate %157 RelaxedPrecision 
                                                      OpDecorate %178 RelaxedPrecision 
                                                      OpDecorate %181 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %211 DescriptorSet 211 
                                                      OpDecorate %211 Binding 211 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %213 DescriptorSet 213 
                                                      OpDecorate %213 Binding 213 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %284 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %292 RelaxedPrecision 
                                                      OpDecorate %292 DescriptorSet 292 
                                                      OpDecorate %292 Binding 292 
                                                      OpDecorate %293 RelaxedPrecision 
                                                      OpDecorate %294 RelaxedPrecision 
                                                      OpDecorate %294 DescriptorSet 294 
                                                      OpDecorate %294 Binding 294 
                                                      OpDecorate %295 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 297 
                                                      OpDecorate %302 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %307 RelaxedPrecision 
                                                      OpDecorate %307 Location 307 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate %312 RelaxedPrecision 
                                                      OpDecorate %313 RelaxedPrecision 
                                                      OpDecorate %318 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypeStruct %10 %7 %7 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 %6 
                                              %12 = OpTypePointer Uniform %11 
Uniform struct {f32_3; f32_4; f32_4; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32; f32;}* %13 = OpVariable Uniform 
                                              %14 = OpTypeInt 32 1 
                                          i32 %15 = OpConstant 1 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 1 
                                              %18 = OpTypePointer Uniform %6 
                                          u32 %22 = OpConstant 2 
                                          u32 %26 = OpConstant 0 
                                              %27 = OpTypePointer Private %6 
                                              %29 = OpTypeVector %6 2 
                                              %30 = OpTypePointer Private %29 
                               Private f32_2* %31 = OpVariable Private 
                                              %32 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %33 = OpTypePointer UniformConstant %32 
         UniformConstant read_only Texture2D* %34 = OpVariable UniformConstant 
                                              %36 = OpTypeSampler 
                                              %37 = OpTypePointer UniformConstant %36 
                     UniformConstant sampler* %38 = OpVariable UniformConstant 
                                              %40 = OpTypeSampledImage %32 
                                              %42 = OpTypePointer Input %29 
                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                          i32 %48 = OpConstant 2 
                                              %49 = OpTypePointer Uniform %7 
                                          f32 %60 = OpConstant 3.674022E-40 
                                        f32_2 %61 = OpConstantComposite %60 %60 
                                          i32 %75 = OpConstant 3 
                                 Private f32* %81 = OpVariable Private 
                                          i32 %85 = OpConstant 4 
                               Private f32_4* %89 = OpVariable Private 
                                          f32 %97 = OpConstant 3.674022E-40 
                                         f32 %100 = OpConstant 3.674022E-40 
                              Private f32_2* %102 = OpVariable Private 
                              Private f32_4* %104 = OpVariable Private 
        UniformConstant read_only Texture2D* %105 = OpVariable UniformConstant 
                    UniformConstant sampler* %107 = OpVariable UniformConstant 
                                             %113 = OpTypeBool 
                                             %114 = OpTypeVector %113 3 
                                             %115 = OpTypePointer Private %114 
                             Private bool_3* %116 = OpVariable Private 
                                         f32 %119 = OpConstant 3.674022E-40 
                                             %121 = OpTypePointer Private %113 
                                             %123 = OpTypePointer Input %10 
                        Input f32_3* vs_TEXCOORD2 = OpVariable Input 
                                             %125 = OpTypePointer Input %6 
                                         i32 %131 = OpConstant 0 
                                         i32 %138 = OpConstant 7 
                                         i32 %148 = OpConstant 6 
                                         i32 %155 = OpConstant 10 
                                       f32_2 %162 = OpConstantComposite %97 %97 
                                             %163 = OpTypeVector %113 2 
                                Private f32* %170 = OpVariable Private 
                                         u32 %173 = OpConstant 3 
                                             %177 = OpTypePointer Private %10 
                              Private f32_3* %178 = OpVariable Private 
                                         i32 %179 = OpConstant 5 
                                         i32 %182 = OpConstant 11 
                                         i32 %195 = OpConstant 8 
                              Private f32_4* %210 = OpVariable Private 
        UniformConstant read_only Texture2D* %211 = OpVariable UniformConstant 
                    UniformConstant sampler* %213 = OpVariable UniformConstant 
                                         i32 %232 = OpConstant 9 
                                         i32 %235 = OpConstant 12 
                                       f32_4 %250 = OpConstantComposite %97 %97 %97 %97 
                                             %254 = OpTypeVector %113 4 
                                             %260 = OpTypePointer Function %6 
                                         i32 %264 = OpConstant 13 
        UniformConstant read_only Texture2D* %292 = OpVariable UniformConstant 
                    UniformConstant sampler* %294 = OpVariable UniformConstant 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                             %306 = OpTypePointer Output %7 
                               Output f32_4* %307 = OpVariable Output 
                                             %319 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %261 = OpVariable Function 
                               Function f32* %278 = OpVariable Function 
                                 Uniform f32* %19 = OpAccessChain %13 %15 %17 
                                          f32 %20 = OpLoad %19 
                                          f32 %21 = OpFNegate %20 
                                 Uniform f32* %23 = OpAccessChain %13 %15 %22 
                                          f32 %24 = OpLoad %23 
                                          f32 %25 = OpFAdd %21 %24 
                                 Private f32* %28 = OpAccessChain %9 %26 
                                                      OpStore %28 %25 
                          read_only Texture2D %35 = OpLoad %34 
                                      sampler %39 = OpLoad %38 
                   read_only Texture2DSampled %41 = OpSampledImage %35 %39 
                                        f32_2 %44 = OpLoad vs_TEXCOORD1 
                                        f32_4 %45 = OpImageSampleImplicitLod %41 %44 
                                          f32 %46 = OpCompositeExtract %45 0 
                                 Private f32* %47 = OpAccessChain %31 %26 
                                                      OpStore %47 %46 
                               Uniform f32_4* %50 = OpAccessChain %13 %48 
                                        f32_4 %51 = OpLoad %50 
                                        f32_2 %52 = OpVectorShuffle %51 %51 2 0 
                                        f32_2 %53 = OpLoad %31 
                                        f32_2 %54 = OpVectorShuffle %53 %53 0 0 
                                        f32_2 %55 = OpFMul %52 %54 
                               Uniform f32_4* %56 = OpAccessChain %13 %48 
                                        f32_4 %57 = OpLoad %56 
                                        f32_2 %58 = OpVectorShuffle %57 %57 3 1 
                                        f32_2 %59 = OpFAdd %55 %58 
                                                      OpStore %31 %59 
                                        f32_2 %62 = OpLoad %31 
                                        f32_2 %63 = OpFDiv %61 %62 
                                                      OpStore %31 %63 
                                 Private f32* %64 = OpAccessChain %9 %26 
                                          f32 %65 = OpLoad %64 
                                 Private f32* %66 = OpAccessChain %31 %17 
                                          f32 %67 = OpLoad %66 
                                          f32 %68 = OpFMul %65 %67 
                                 Uniform f32* %69 = OpAccessChain %13 %15 %17 
                                          f32 %70 = OpLoad %69 
                                          f32 %71 = OpFAdd %68 %70 
                                 Private f32* %72 = OpAccessChain %9 %26 
                                                      OpStore %72 %71 
                                 Private f32* %73 = OpAccessChain %9 %26 
                                          f32 %74 = OpLoad %73 
                                 Uniform f32* %76 = OpAccessChain %13 %75 
                                          f32 %77 = OpLoad %76 
                                          f32 %78 = OpFNegate %77 
                                          f32 %79 = OpFAdd %74 %78 
                                 Private f32* %80 = OpAccessChain %9 %26 
                                                      OpStore %80 %79 
                                 Uniform f32* %82 = OpAccessChain %13 %75 
                                          f32 %83 = OpLoad %82 
                                          f32 %84 = OpFNegate %83 
                                 Uniform f32* %86 = OpAccessChain %13 %85 
                                          f32 %87 = OpLoad %86 
                                          f32 %88 = OpFAdd %84 %87 
                                                      OpStore %81 %88 
                                 Private f32* %90 = OpAccessChain %9 %26 
                                          f32 %91 = OpLoad %90 
                                          f32 %92 = OpLoad %81 
                                          f32 %93 = OpFDiv %91 %92 
                                 Private f32* %94 = OpAccessChain %89 %26 
                                                      OpStore %94 %93 
                                 Private f32* %95 = OpAccessChain %89 %26 
                                          f32 %96 = OpLoad %95 
                                          f32 %98 = OpExtInst %1 43 %96 %97 %60 
                                 Private f32* %99 = OpAccessChain %89 %26 
                                                      OpStore %99 %98 
                                Private f32* %101 = OpAccessChain %89 %17 
                                                      OpStore %101 %100 
                                Private f32* %103 = OpAccessChain %102 %17 
                                                      OpStore %103 %100 
                         read_only Texture2D %106 = OpLoad %105 
                                     sampler %108 = OpLoad %107 
                  read_only Texture2DSampled %109 = OpSampledImage %106 %108 
                                       f32_4 %110 = OpLoad %89 
                                       f32_2 %111 = OpVectorShuffle %110 %110 0 1 
                                       f32_4 %112 = OpImageSampleImplicitLod %109 %111 
                                                      OpStore %104 %112 
                                Private f32* %117 = OpAccessChain %31 %17 
                                         f32 %118 = OpLoad %117 
                                        bool %120 = OpFOrdGreaterThanEqual %118 %119 
                               Private bool* %122 = OpAccessChain %116 %26 
                                                      OpStore %122 %120 
                                  Input f32* %126 = OpAccessChain vs_TEXCOORD2 %17 
                                         f32 %127 = OpLoad %126 
                                Private f32* %128 = OpAccessChain %31 %26 
                                         f32 %129 = OpLoad %128 
                                         f32 %130 = OpFMul %127 %129 
                                Uniform f32* %132 = OpAccessChain %13 %131 %17 
                                         f32 %133 = OpLoad %132 
                                         f32 %134 = OpFAdd %130 %133 
                                Private f32* %135 = OpAccessChain %31 %26 
                                                      OpStore %135 %134 
                                Private f32* %136 = OpAccessChain %31 %26 
                                         f32 %137 = OpLoad %136 
                                Uniform f32* %139 = OpAccessChain %13 %138 
                                         f32 %140 = OpLoad %139 
                                         f32 %141 = OpFNegate %140 
                                         f32 %142 = OpFAdd %137 %141 
                                Private f32* %143 = OpAccessChain %31 %26 
                                                      OpStore %143 %142 
                               Private bool* %144 = OpAccessChain %116 %26 
                                        bool %145 = OpLoad %144 
                                         f32 %146 = OpSelect %145 %60 %97 
                                Private f32* %147 = OpAccessChain %9 %26 
                                                      OpStore %147 %146 
                                Uniform f32* %149 = OpAccessChain %13 %148 
                                         f32 %150 = OpLoad %149 
                                Private f32* %151 = OpAccessChain %9 %26 
                                         f32 %152 = OpLoad %151 
                                        bool %153 = OpFOrdGreaterThanEqual %150 %152 
                               Private bool* %154 = OpAccessChain %116 %22 
                                                      OpStore %154 %153 
                                Uniform f32* %156 = OpAccessChain %13 %155 
                                         f32 %157 = OpLoad %156 
                                Private f32* %158 = OpAccessChain %9 %26 
                                         f32 %159 = OpLoad %158 
                                        bool %160 = OpFOrdGreaterThanEqual %157 %159 
                               Private bool* %161 = OpAccessChain %116 %26 
                                                      OpStore %161 %160 
                                      bool_3 %164 = OpLoad %116 
                                      bool_2 %165 = OpVectorShuffle %164 %164 0 2 
                                       f32_2 %166 = OpSelect %165 %61 %162 
                                       f32_2 %167 = OpExtInst %1 46 %162 %61 %166 
                                       f32_4 %168 = OpLoad %9 
                                       f32_4 %169 = OpVectorShuffle %168 %167 4 1 5 3 
                                                      OpStore %9 %169 
                                Private f32* %171 = OpAccessChain %9 %22 
                                         f32 %172 = OpLoad %171 
                                Private f32* %174 = OpAccessChain %104 %173 
                                         f32 %175 = OpLoad %174 
                                         f32 %176 = OpFMul %172 %175 
                                                      OpStore %170 %176 
                                Uniform f32* %180 = OpAccessChain %13 %179 
                                         f32 %181 = OpLoad %180 
                                Uniform f32* %183 = OpAccessChain %13 %182 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpFMul %181 %184 
                                Private f32* %186 = OpAccessChain %178 %26 
                                                      OpStore %186 %185 
                                         f32 %187 = OpLoad %170 
                                Private f32* %188 = OpAccessChain %178 %26 
                                         f32 %189 = OpLoad %188 
                                         f32 %190 = OpFMul %187 %189 
                                Private f32* %191 = OpAccessChain %104 %173 
                                                      OpStore %191 %190 
                                Uniform f32* %192 = OpAccessChain %13 %138 
                                         f32 %193 = OpLoad %192 
                                         f32 %194 = OpFNegate %193 
                                Uniform f32* %196 = OpAccessChain %13 %195 
                                         f32 %197 = OpLoad %196 
                                         f32 %198 = OpFAdd %194 %197 
                                Private f32* %199 = OpAccessChain %178 %26 
                                                      OpStore %199 %198 
                                Private f32* %200 = OpAccessChain %31 %26 
                                         f32 %201 = OpLoad %200 
                                Private f32* %202 = OpAccessChain %178 %26 
                                         f32 %203 = OpLoad %202 
                                         f32 %204 = OpFDiv %201 %203 
                                Private f32* %205 = OpAccessChain %102 %26 
                                                      OpStore %205 %204 
                                Private f32* %206 = OpAccessChain %102 %26 
                                         f32 %207 = OpLoad %206 
                                         f32 %208 = OpExtInst %1 43 %207 %97 %60 
                                Private f32* %209 = OpAccessChain %102 %26 
                                                      OpStore %209 %208 
                         read_only Texture2D %212 = OpLoad %211 
                                     sampler %214 = OpLoad %213 
                  read_only Texture2DSampled %215 = OpSampledImage %212 %214 
                                       f32_2 %216 = OpLoad %102 
                                       f32_4 %217 = OpImageSampleImplicitLod %215 %216 
                                                      OpStore %210 %217 
                                Private f32* %218 = OpAccessChain %9 %26 
                                         f32 %219 = OpLoad %218 
                                Private f32* %220 = OpAccessChain %210 %173 
                                         f32 %221 = OpLoad %220 
                                         f32 %222 = OpFMul %219 %221 
                                Private f32* %223 = OpAccessChain %9 %26 
                                                      OpStore %223 %222 
                                       f32_4 %224 = OpLoad %104 
                                       f32_3 %225 = OpVectorShuffle %224 %224 0 1 2 
                                       f32_3 %226 = OpFNegate %225 
                                       f32_4 %227 = OpLoad %210 
                                       f32_3 %228 = OpVectorShuffle %227 %227 0 1 2 
                                       f32_3 %229 = OpFAdd %226 %228 
                                       f32_4 %230 = OpLoad %89 
                                       f32_4 %231 = OpVectorShuffle %230 %229 4 5 6 3 
                                                      OpStore %89 %231 
                                Uniform f32* %233 = OpAccessChain %13 %232 
                                         f32 %234 = OpLoad %233 
                                Uniform f32* %236 = OpAccessChain %13 %235 
                                         f32 %237 = OpLoad %236 
                                         f32 %238 = OpFMul %234 %237 
                                Private f32* %239 = OpAccessChain %178 %26 
                                                      OpStore %239 %238 
                                Private f32* %240 = OpAccessChain %9 %26 
                                         f32 %241 = OpLoad %240 
                                Private f32* %242 = OpAccessChain %178 %26 
                                         f32 %243 = OpLoad %242 
                                         f32 %244 = OpFMul %241 %243 
                                Private f32* %245 = OpAccessChain %104 %173 
                                         f32 %246 = OpLoad %245 
                                         f32 %247 = OpFNegate %246 
                                         f32 %248 = OpFAdd %244 %247 
                                Private f32* %249 = OpAccessChain %89 %173 
                                                      OpStore %249 %248 
                                Uniform f32* %251 = OpAccessChain %13 %179 
                                         f32 %252 = OpLoad %251 
                                       f32_4 %253 = OpCompositeConstruct %252 %252 %252 %252 
                                      bool_4 %255 = OpFOrdNotEqual %250 %253 
                                        bool %256 = OpAny %255 
                               Private bool* %257 = OpAccessChain %116 %26 
                                                      OpStore %257 %256 
                               Private bool* %258 = OpAccessChain %116 %26 
                                        bool %259 = OpLoad %258 
                                                      OpSelectionMerge %263 None 
                                                      OpBranchConditional %259 %262 %267 
                                             %262 = OpLabel 
                                Uniform f32* %265 = OpAccessChain %13 %264 
                                         f32 %266 = OpLoad %265 
                                                      OpStore %261 %266 
                                                      OpBranch %263 
                                             %267 = OpLabel 
                                                      OpStore %261 %60 
                                                      OpBranch %263 
                                             %263 = OpLabel 
                                         f32 %268 = OpLoad %261 
                                Private f32* %269 = OpAccessChain %178 %26 
                                                      OpStore %269 %268 
                                Uniform f32* %270 = OpAccessChain %13 %232 
                                         f32 %271 = OpLoad %270 
                                       f32_4 %272 = OpCompositeConstruct %271 %271 %271 %271 
                                      bool_4 %273 = OpFOrdNotEqual %250 %272 
                                        bool %274 = OpAny %273 
                               Private bool* %275 = OpAccessChain %116 %26 
                                                      OpStore %275 %274 
                               Private bool* %276 = OpAccessChain %116 %26 
                                        bool %277 = OpLoad %276 
                                                      OpSelectionMerge %280 None 
                                                      OpBranchConditional %277 %279 %283 
                                             %279 = OpLabel 
                                Private f32* %281 = OpAccessChain %178 %26 
                                         f32 %282 = OpLoad %281 
                                                      OpStore %278 %282 
                                                      OpBranch %280 
                                             %283 = OpLabel 
                                                      OpStore %278 %97 
                                                      OpBranch %280 
                                             %280 = OpLabel 
                                         f32 %284 = OpLoad %278 
                                Private f32* %285 = OpAccessChain %178 %26 
                                                      OpStore %285 %284 
                                       f32_3 %286 = OpLoad %178 
                                       f32_4 %287 = OpVectorShuffle %286 %286 0 0 0 0 
                                       f32_4 %288 = OpLoad %89 
                                       f32_4 %289 = OpFMul %287 %288 
                                       f32_4 %290 = OpLoad %104 
                                       f32_4 %291 = OpFAdd %289 %290 
                                                      OpStore %9 %291 
                         read_only Texture2D %293 = OpLoad %292 
                                     sampler %295 = OpLoad %294 
                  read_only Texture2DSampled %296 = OpSampledImage %293 %295 
                                       f32_2 %298 = OpLoad vs_TEXCOORD0 
                                       f32_4 %299 = OpImageSampleImplicitLod %296 %298 
                                                      OpStore %210 %299 
                                       f32_4 %300 = OpLoad %9 
                                       f32_3 %301 = OpVectorShuffle %300 %300 0 1 2 
                                       f32_4 %302 = OpLoad %210 
                                       f32_3 %303 = OpVectorShuffle %302 %302 0 1 2 
                                       f32_3 %304 = OpFNegate %303 
                                       f32_3 %305 = OpFAdd %301 %304 
                                                      OpStore %178 %305 
                                       f32_4 %308 = OpLoad %9 
                                       f32_3 %309 = OpVectorShuffle %308 %308 3 3 3 
                                       f32_3 %310 = OpLoad %178 
                                       f32_3 %311 = OpFMul %309 %310 
                                       f32_4 %312 = OpLoad %210 
                                       f32_3 %313 = OpVectorShuffle %312 %312 0 1 2 
                                       f32_3 %314 = OpFAdd %311 %313 
                                       f32_4 %315 = OpLoad %307 
                                       f32_4 %316 = OpVectorShuffle %315 %314 4 5 6 3 
                                                      OpStore %307 %316 
                                Private f32* %317 = OpAccessChain %210 %173 
                                         f32 %318 = OpLoad %317 
                                 Output f32* %320 = OpAccessChain %307 %173 
                                                      OpStore %320 %318 
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