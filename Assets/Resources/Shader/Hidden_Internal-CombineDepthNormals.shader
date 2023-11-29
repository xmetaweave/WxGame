//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-CombineDepthNormals" {
Properties {
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 58289
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
uniform 	vec4 _CameraNormalsTexture_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _CameraNormalsTexture_ST.xy + _CameraNormalsTexture_ST.zw;
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
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _CameraNormalsTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
bool u_xlatb3;
float u_xlat4;
void main()
{
    u_xlat16_0.xyz = texture(_CameraNormalsTexture, vs_TEXCOORD0.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_0.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat16_0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat16_0.zzz + u_xlat0.xyw;
    u_xlat4 = (-u_xlat0.z) + 1.0;
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat4);
    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
    u_xlat1.x = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat1.x = _ZBufferParams.x * u_xlat1.x + _ZBufferParams.y;
    u_xlat1.x = float(1.0) / u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat1.x<0.999984622);
#else
    u_xlatb3 = u_xlat1.x<0.999984622;
#endif
    u_xlat1.xz = u_xlat1.xx * vec2(1.0, 255.0);
    u_xlat1.xz = fract(u_xlat1.xz);
    u_xlat0.z = (-u_xlat1.z) * 0.00392156886 + u_xlat1.x;
    u_xlat0.w = u_xlat1.z;
    u_xlat0 = (bool(u_xlatb3)) ? u_xlat0 : vec4(0.5, 0.5, 1.0, 1.0);
    SV_Target0 = u_xlat0;
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
uniform 	vec4 _CameraNormalsTexture_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _CameraNormalsTexture_ST.xy + _CameraNormalsTexture_ST.zw;
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
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _CameraNormalsTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
bool u_xlatb3;
float u_xlat4;
void main()
{
    u_xlat16_0.xyz = texture(_CameraNormalsTexture, vs_TEXCOORD0.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_0.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat16_0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat16_0.zzz + u_xlat0.xyw;
    u_xlat4 = (-u_xlat0.z) + 1.0;
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat4);
    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
    u_xlat1.x = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat1.x = _ZBufferParams.x * u_xlat1.x + _ZBufferParams.y;
    u_xlat1.x = float(1.0) / u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat1.x<0.999984622);
#else
    u_xlatb3 = u_xlat1.x<0.999984622;
#endif
    u_xlat1.xz = u_xlat1.xx * vec2(1.0, 255.0);
    u_xlat1.xz = fract(u_xlat1.xz);
    u_xlat0.z = (-u_xlat1.z) * 0.00392156886 + u_xlat1.x;
    u_xlat0.w = u_xlat1.z;
    u_xlat0 = (bool(u_xlatb3)) ? u_xlat0 : vec4(0.5, 0.5, 1.0, 1.0);
    SV_Target0 = u_xlat0;
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
uniform 	vec4 _CameraNormalsTexture_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _CameraNormalsTexture_ST.xy + _CameraNormalsTexture_ST.zw;
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
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _CameraNormalsTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
bool u_xlatb3;
float u_xlat4;
void main()
{
    u_xlat16_0.xyz = texture(_CameraNormalsTexture, vs_TEXCOORD0.xy).xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat16_0.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat16_0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat16_0.zzz + u_xlat0.xyw;
    u_xlat4 = (-u_xlat0.z) + 1.0;
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat4);
    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
    u_xlat1.x = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat1.x = _ZBufferParams.x * u_xlat1.x + _ZBufferParams.y;
    u_xlat1.x = float(1.0) / u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat1.x<0.999984622);
#else
    u_xlatb3 = u_xlat1.x<0.999984622;
#endif
    u_xlat1.xz = u_xlat1.xx * vec2(1.0, 255.0);
    u_xlat1.xz = fract(u_xlat1.xz);
    u_xlat0.z = (-u_xlat1.z) * 0.00392156886 + u_xlat1.x;
    u_xlat0.w = u_xlat1.z;
    u_xlat0 = (bool(u_xlatb3)) ? u_xlat0 : vec4(0.5, 0.5, 1.0, 1.0);
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 102
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %70 0 BuiltIn 70 
                                                     OpMemberDecorate %70 1 BuiltIn 70 
                                                     OpMemberDecorate %70 2 BuiltIn 70 
                                                     OpDecorate %70 Block 
                                                     OpDecorate vs_TEXCOORD0 Location 84 
                                                     OpDecorate %86 Location 86 
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
                                             %18 = OpTypeStruct %16 %17 %7 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 0 
                                         i32 %23 = OpConstant 1 
                                             %24 = OpTypePointer Uniform %7 
                                         i32 %35 = OpConstant 2 
                                         i32 %44 = OpConstant 3 
                              Private f32_4* %48 = OpVariable Private 
                                         u32 %68 = OpConstant 1 
                                             %69 = OpTypeArray %6 %68 
                                             %70 = OpTypeStruct %7 %6 %69 
                                             %71 = OpTypePointer Output %70 
        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                             %80 = OpTypePointer Output %7 
                                             %82 = OpTypeVector %6 2 
                                             %83 = OpTypePointer Output %82 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %85 = OpTypePointer Input %82 
                                Input f32_2* %86 = OpVariable Input 
                                             %96 = OpTypePointer Output %6 
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
                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                       f32_4 %74 = OpLoad %73 
                                       f32_4 %75 = OpLoad %9 
                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                       f32_4 %77 = OpFMul %74 %76 
                                       f32_4 %78 = OpLoad %48 
                                       f32_4 %79 = OpFAdd %77 %78 
                               Output f32_4* %81 = OpAccessChain %72 %22 
                                                     OpStore %81 %79 
                                       f32_2 %87 = OpLoad %86 
                              Uniform f32_4* %88 = OpAccessChain %20 %35 
                                       f32_4 %89 = OpLoad %88 
                                       f32_2 %90 = OpVectorShuffle %89 %89 0 1 
                                       f32_2 %91 = OpFMul %87 %90 
                              Uniform f32_4* %92 = OpAccessChain %20 %35 
                                       f32_4 %93 = OpLoad %92 
                                       f32_2 %94 = OpVectorShuffle %93 %93 2 3 
                                       f32_2 %95 = OpFAdd %91 %94 
                                                     OpStore vs_TEXCOORD0 %95 
                                 Output f32* %97 = OpAccessChain %72 %22 %68 
                                         f32 %98 = OpLoad %97 
                                         f32 %99 = OpFNegate %98 
                                Output f32* %100 = OpAccessChain %72 %22 %68 
                                                     OpStore %100 %99 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 168
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %22 %165 
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
                                              OpDecorate %31 RelaxedPrecision 
                                              OpDecorate %34 RelaxedPrecision 
                                              OpDecorate %36 RelaxedPrecision 
                                              OpDecorate %37 RelaxedPrecision 
                                              OpDecorate %40 ArrayStride 40 
                                              OpMemberDecorate %41 0 Offset 41 
                                              OpMemberDecorate %41 1 Offset 41 
                                              OpDecorate %41 Block 
                                              OpDecorate %43 DescriptorSet 43 
                                              OpDecorate %43 Binding 43 
                                              OpDecorate %57 RelaxedPrecision 
                                              OpDecorate %58 RelaxedPrecision 
                                              OpDecorate %68 RelaxedPrecision 
                                              OpDecorate %69 RelaxedPrecision 
                                              OpDecorate %101 DescriptorSet 101 
                                              OpDecorate %101 Binding 101 
                                              OpDecorate %103 DescriptorSet 103 
                                              OpDecorate %103 Binding 103 
                                              OpDecorate %165 RelaxedPrecision 
                                              OpDecorate %165 Location 165 
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
                                  f32 %29 = OpConstant 3.674022E-40 
                                f32_3 %30 = OpConstantComposite %29 %29 %29 
                                  f32 %32 = OpConstant 3.674022E-40 
                                f32_3 %33 = OpConstantComposite %32 %32 %32 
                       Private f32_3* %35 = OpVariable Private 
                                      %38 = OpTypeInt 32 0 
                                  u32 %39 = OpConstant 4 
                                      %40 = OpTypeArray %24 %39 
                                      %41 = OpTypeStruct %24 %40 
                                      %42 = OpTypePointer Uniform %41 
   Uniform struct {f32_4; f32_4[4];}* %43 = OpVariable Uniform 
                                      %44 = OpTypeInt 32 1 
                                  i32 %45 = OpConstant 1 
                                      %46 = OpTypePointer Uniform %24 
                                      %51 = OpTypePointer Private %24 
                       Private f32_4* %52 = OpVariable Private 
                                  i32 %53 = OpConstant 0 
                                  i32 %64 = OpConstant 2 
                                      %76 = OpTypePointer Private %6 
                         Private f32* %77 = OpVariable Private 
                                  u32 %78 = OpConstant 2 
                                  f32 %82 = OpConstant 3.674022E-40 
                                  f32 %93 = OpConstant 3.674022E-40 
                                f32_2 %94 = OpConstantComposite %93 %93 
                                  f32 %96 = OpConstant 3.674022E-40 
                                f32_2 %97 = OpConstantComposite %96 %96 
UniformConstant read_only Texture2D* %101 = OpVariable UniformConstant 
            UniformConstant sampler* %103 = OpVariable UniformConstant 
                                 u32 %108 = OpConstant 0 
                                     %111 = OpTypePointer Uniform %6 
                                 u32 %117 = OpConstant 1 
                                     %126 = OpTypeBool 
                                     %127 = OpTypePointer Private %126 
                       Private bool* %128 = OpVariable Private 
                                 f32 %131 = OpConstant 3.674022E-40 
                                 f32 %135 = OpConstant 3.674022E-40 
                               f32_2 %136 = OpConstantComposite %82 %135 
                                 f32 %148 = OpConstant 3.674022E-40 
                                 u32 %156 = OpConstant 3 
                               f32_4 %160 = OpConstantComposite %96 %96 %82 %82 
                                     %161 = OpTypeVector %126 4 
                                     %164 = OpTypePointer Output %24 
                       Output f32_4* %165 = OpVariable Output 
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
                                f32_3 %31 = OpFMul %28 %30 
                                f32_3 %34 = OpFAdd %31 %33 
                                              OpStore %27 %34 
                                f32_3 %36 = OpLoad %27 
                                f32_3 %37 = OpVectorShuffle %36 %36 1 1 1 
                       Uniform f32_4* %47 = OpAccessChain %43 %45 %45 
                                f32_4 %48 = OpLoad %47 
                                f32_3 %49 = OpVectorShuffle %48 %48 0 1 2 
                                f32_3 %50 = OpFMul %37 %49 
                                              OpStore %35 %50 
                       Uniform f32_4* %54 = OpAccessChain %43 %45 %53 
                                f32_4 %55 = OpLoad %54 
                                f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                                f32_3 %57 = OpLoad %27 
                                f32_3 %58 = OpVectorShuffle %57 %57 0 0 0 
                                f32_3 %59 = OpFMul %56 %58 
                                f32_3 %60 = OpLoad %35 
                                f32_3 %61 = OpFAdd %59 %60 
                                f32_4 %62 = OpLoad %52 
                                f32_4 %63 = OpVectorShuffle %62 %61 4 5 2 6 
                                              OpStore %52 %63 
                       Uniform f32_4* %65 = OpAccessChain %43 %45 %64 
                                f32_4 %66 = OpLoad %65 
                                f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
                                f32_3 %68 = OpLoad %27 
                                f32_3 %69 = OpVectorShuffle %68 %68 2 2 2 
                                f32_3 %70 = OpFMul %67 %69 
                                f32_4 %71 = OpLoad %52 
                                f32_3 %72 = OpVectorShuffle %71 %71 0 1 3 
                                f32_3 %73 = OpFAdd %70 %72 
                                f32_4 %74 = OpLoad %52 
                                f32_4 %75 = OpVectorShuffle %74 %73 4 5 6 3 
                                              OpStore %52 %75 
                         Private f32* %79 = OpAccessChain %52 %78 
                                  f32 %80 = OpLoad %79 
                                  f32 %81 = OpFNegate %80 
                                  f32 %83 = OpFAdd %81 %82 
                                              OpStore %77 %83 
                                f32_4 %84 = OpLoad %52 
                                f32_2 %85 = OpVectorShuffle %84 %84 0 1 
                                  f32 %86 = OpLoad %77 
                                f32_2 %87 = OpCompositeConstruct %86 %86 
                                f32_2 %88 = OpFDiv %85 %87 
                                f32_4 %89 = OpLoad %52 
                                f32_4 %90 = OpVectorShuffle %89 %88 4 5 2 3 
                                              OpStore %52 %90 
                                f32_4 %91 = OpLoad %52 
                                f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                f32_2 %95 = OpFMul %92 %94 
                                f32_2 %98 = OpFAdd %95 %97 
                                f32_4 %99 = OpLoad %52 
                               f32_4 %100 = OpVectorShuffle %99 %98 4 5 2 3 
                                              OpStore %52 %100 
                 read_only Texture2D %102 = OpLoad %101 
                             sampler %104 = OpLoad %103 
          read_only Texture2DSampled %105 = OpSampledImage %102 %104 
                               f32_2 %106 = OpLoad vs_TEXCOORD0 
                               f32_4 %107 = OpImageSampleImplicitLod %105 %106 
                                 f32 %109 = OpCompositeExtract %107 0 
                        Private f32* %110 = OpAccessChain %35 %108 
                                              OpStore %110 %109 
                        Uniform f32* %112 = OpAccessChain %43 %53 %108 
                                 f32 %113 = OpLoad %112 
                        Private f32* %114 = OpAccessChain %35 %108 
                                 f32 %115 = OpLoad %114 
                                 f32 %116 = OpFMul %113 %115 
                        Uniform f32* %118 = OpAccessChain %43 %53 %117 
                                 f32 %119 = OpLoad %118 
                                 f32 %120 = OpFAdd %116 %119 
                        Private f32* %121 = OpAccessChain %35 %108 
                                              OpStore %121 %120 
                        Private f32* %122 = OpAccessChain %35 %108 
                                 f32 %123 = OpLoad %122 
                                 f32 %124 = OpFDiv %82 %123 
                        Private f32* %125 = OpAccessChain %35 %108 
                                              OpStore %125 %124 
                        Private f32* %129 = OpAccessChain %35 %108 
                                 f32 %130 = OpLoad %129 
                                bool %132 = OpFOrdLessThan %130 %131 
                                              OpStore %128 %132 
                               f32_3 %133 = OpLoad %35 
                               f32_2 %134 = OpVectorShuffle %133 %133 0 0 
                               f32_2 %137 = OpFMul %134 %136 
                               f32_3 %138 = OpLoad %35 
                               f32_3 %139 = OpVectorShuffle %138 %137 3 1 4 
                                              OpStore %35 %139 
                               f32_3 %140 = OpLoad %35 
                               f32_2 %141 = OpVectorShuffle %140 %140 0 2 
                               f32_2 %142 = OpExtInst %1 10 %141 
                               f32_3 %143 = OpLoad %35 
                               f32_3 %144 = OpVectorShuffle %143 %142 3 1 4 
                                              OpStore %35 %144 
                        Private f32* %145 = OpAccessChain %35 %78 
                                 f32 %146 = OpLoad %145 
                                 f32 %147 = OpFNegate %146 
                                 f32 %149 = OpFMul %147 %148 
                        Private f32* %150 = OpAccessChain %35 %108 
                                 f32 %151 = OpLoad %150 
                                 f32 %152 = OpFAdd %149 %151 
                        Private f32* %153 = OpAccessChain %52 %78 
                                              OpStore %153 %152 
                        Private f32* %154 = OpAccessChain %35 %78 
                                 f32 %155 = OpLoad %154 
                        Private f32* %157 = OpAccessChain %52 %156 
                                              OpStore %157 %155 
                                bool %158 = OpLoad %128 
                               f32_4 %159 = OpLoad %52 
                              bool_4 %162 = OpCompositeConstruct %158 %158 %158 %158 
                               f32_4 %163 = OpSelect %162 %159 %160 
                                              OpStore %52 %163 
                               f32_4 %166 = OpLoad %52 
                                              OpStore %165 %166 
                                              OpReturn
                                              OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 102
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %70 0 BuiltIn 70 
                                                     OpMemberDecorate %70 1 BuiltIn 70 
                                                     OpMemberDecorate %70 2 BuiltIn 70 
                                                     OpDecorate %70 Block 
                                                     OpDecorate vs_TEXCOORD0 Location 84 
                                                     OpDecorate %86 Location 86 
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
                                             %18 = OpTypeStruct %16 %17 %7 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 0 
                                         i32 %23 = OpConstant 1 
                                             %24 = OpTypePointer Uniform %7 
                                         i32 %35 = OpConstant 2 
                                         i32 %44 = OpConstant 3 
                              Private f32_4* %48 = OpVariable Private 
                                         u32 %68 = OpConstant 1 
                                             %69 = OpTypeArray %6 %68 
                                             %70 = OpTypeStruct %7 %6 %69 
                                             %71 = OpTypePointer Output %70 
        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                             %80 = OpTypePointer Output %7 
                                             %82 = OpTypeVector %6 2 
                                             %83 = OpTypePointer Output %82 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %85 = OpTypePointer Input %82 
                                Input f32_2* %86 = OpVariable Input 
                                             %96 = OpTypePointer Output %6 
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
                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                       f32_4 %74 = OpLoad %73 
                                       f32_4 %75 = OpLoad %9 
                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                       f32_4 %77 = OpFMul %74 %76 
                                       f32_4 %78 = OpLoad %48 
                                       f32_4 %79 = OpFAdd %77 %78 
                               Output f32_4* %81 = OpAccessChain %72 %22 
                                                     OpStore %81 %79 
                                       f32_2 %87 = OpLoad %86 
                              Uniform f32_4* %88 = OpAccessChain %20 %35 
                                       f32_4 %89 = OpLoad %88 
                                       f32_2 %90 = OpVectorShuffle %89 %89 0 1 
                                       f32_2 %91 = OpFMul %87 %90 
                              Uniform f32_4* %92 = OpAccessChain %20 %35 
                                       f32_4 %93 = OpLoad %92 
                                       f32_2 %94 = OpVectorShuffle %93 %93 2 3 
                                       f32_2 %95 = OpFAdd %91 %94 
                                                     OpStore vs_TEXCOORD0 %95 
                                 Output f32* %97 = OpAccessChain %72 %22 %68 
                                         f32 %98 = OpLoad %97 
                                         f32 %99 = OpFNegate %98 
                                Output f32* %100 = OpAccessChain %72 %22 %68 
                                                     OpStore %100 %99 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 168
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %22 %165 
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
                                              OpDecorate %31 RelaxedPrecision 
                                              OpDecorate %34 RelaxedPrecision 
                                              OpDecorate %36 RelaxedPrecision 
                                              OpDecorate %37 RelaxedPrecision 
                                              OpDecorate %40 ArrayStride 40 
                                              OpMemberDecorate %41 0 Offset 41 
                                              OpMemberDecorate %41 1 Offset 41 
                                              OpDecorate %41 Block 
                                              OpDecorate %43 DescriptorSet 43 
                                              OpDecorate %43 Binding 43 
                                              OpDecorate %57 RelaxedPrecision 
                                              OpDecorate %58 RelaxedPrecision 
                                              OpDecorate %68 RelaxedPrecision 
                                              OpDecorate %69 RelaxedPrecision 
                                              OpDecorate %101 DescriptorSet 101 
                                              OpDecorate %101 Binding 101 
                                              OpDecorate %103 DescriptorSet 103 
                                              OpDecorate %103 Binding 103 
                                              OpDecorate %165 RelaxedPrecision 
                                              OpDecorate %165 Location 165 
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
                                  f32 %29 = OpConstant 3.674022E-40 
                                f32_3 %30 = OpConstantComposite %29 %29 %29 
                                  f32 %32 = OpConstant 3.674022E-40 
                                f32_3 %33 = OpConstantComposite %32 %32 %32 
                       Private f32_3* %35 = OpVariable Private 
                                      %38 = OpTypeInt 32 0 
                                  u32 %39 = OpConstant 4 
                                      %40 = OpTypeArray %24 %39 
                                      %41 = OpTypeStruct %24 %40 
                                      %42 = OpTypePointer Uniform %41 
   Uniform struct {f32_4; f32_4[4];}* %43 = OpVariable Uniform 
                                      %44 = OpTypeInt 32 1 
                                  i32 %45 = OpConstant 1 
                                      %46 = OpTypePointer Uniform %24 
                                      %51 = OpTypePointer Private %24 
                       Private f32_4* %52 = OpVariable Private 
                                  i32 %53 = OpConstant 0 
                                  i32 %64 = OpConstant 2 
                                      %76 = OpTypePointer Private %6 
                         Private f32* %77 = OpVariable Private 
                                  u32 %78 = OpConstant 2 
                                  f32 %82 = OpConstant 3.674022E-40 
                                  f32 %93 = OpConstant 3.674022E-40 
                                f32_2 %94 = OpConstantComposite %93 %93 
                                  f32 %96 = OpConstant 3.674022E-40 
                                f32_2 %97 = OpConstantComposite %96 %96 
UniformConstant read_only Texture2D* %101 = OpVariable UniformConstant 
            UniformConstant sampler* %103 = OpVariable UniformConstant 
                                 u32 %108 = OpConstant 0 
                                     %111 = OpTypePointer Uniform %6 
                                 u32 %117 = OpConstant 1 
                                     %126 = OpTypeBool 
                                     %127 = OpTypePointer Private %126 
                       Private bool* %128 = OpVariable Private 
                                 f32 %131 = OpConstant 3.674022E-40 
                                 f32 %135 = OpConstant 3.674022E-40 
                               f32_2 %136 = OpConstantComposite %82 %135 
                                 f32 %148 = OpConstant 3.674022E-40 
                                 u32 %156 = OpConstant 3 
                               f32_4 %160 = OpConstantComposite %96 %96 %82 %82 
                                     %161 = OpTypeVector %126 4 
                                     %164 = OpTypePointer Output %24 
                       Output f32_4* %165 = OpVariable Output 
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
                                f32_3 %31 = OpFMul %28 %30 
                                f32_3 %34 = OpFAdd %31 %33 
                                              OpStore %27 %34 
                                f32_3 %36 = OpLoad %27 
                                f32_3 %37 = OpVectorShuffle %36 %36 1 1 1 
                       Uniform f32_4* %47 = OpAccessChain %43 %45 %45 
                                f32_4 %48 = OpLoad %47 
                                f32_3 %49 = OpVectorShuffle %48 %48 0 1 2 
                                f32_3 %50 = OpFMul %37 %49 
                                              OpStore %35 %50 
                       Uniform f32_4* %54 = OpAccessChain %43 %45 %53 
                                f32_4 %55 = OpLoad %54 
                                f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                                f32_3 %57 = OpLoad %27 
                                f32_3 %58 = OpVectorShuffle %57 %57 0 0 0 
                                f32_3 %59 = OpFMul %56 %58 
                                f32_3 %60 = OpLoad %35 
                                f32_3 %61 = OpFAdd %59 %60 
                                f32_4 %62 = OpLoad %52 
                                f32_4 %63 = OpVectorShuffle %62 %61 4 5 2 6 
                                              OpStore %52 %63 
                       Uniform f32_4* %65 = OpAccessChain %43 %45 %64 
                                f32_4 %66 = OpLoad %65 
                                f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
                                f32_3 %68 = OpLoad %27 
                                f32_3 %69 = OpVectorShuffle %68 %68 2 2 2 
                                f32_3 %70 = OpFMul %67 %69 
                                f32_4 %71 = OpLoad %52 
                                f32_3 %72 = OpVectorShuffle %71 %71 0 1 3 
                                f32_3 %73 = OpFAdd %70 %72 
                                f32_4 %74 = OpLoad %52 
                                f32_4 %75 = OpVectorShuffle %74 %73 4 5 6 3 
                                              OpStore %52 %75 
                         Private f32* %79 = OpAccessChain %52 %78 
                                  f32 %80 = OpLoad %79 
                                  f32 %81 = OpFNegate %80 
                                  f32 %83 = OpFAdd %81 %82 
                                              OpStore %77 %83 
                                f32_4 %84 = OpLoad %52 
                                f32_2 %85 = OpVectorShuffle %84 %84 0 1 
                                  f32 %86 = OpLoad %77 
                                f32_2 %87 = OpCompositeConstruct %86 %86 
                                f32_2 %88 = OpFDiv %85 %87 
                                f32_4 %89 = OpLoad %52 
                                f32_4 %90 = OpVectorShuffle %89 %88 4 5 2 3 
                                              OpStore %52 %90 
                                f32_4 %91 = OpLoad %52 
                                f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                f32_2 %95 = OpFMul %92 %94 
                                f32_2 %98 = OpFAdd %95 %97 
                                f32_4 %99 = OpLoad %52 
                               f32_4 %100 = OpVectorShuffle %99 %98 4 5 2 3 
                                              OpStore %52 %100 
                 read_only Texture2D %102 = OpLoad %101 
                             sampler %104 = OpLoad %103 
          read_only Texture2DSampled %105 = OpSampledImage %102 %104 
                               f32_2 %106 = OpLoad vs_TEXCOORD0 
                               f32_4 %107 = OpImageSampleImplicitLod %105 %106 
                                 f32 %109 = OpCompositeExtract %107 0 
                        Private f32* %110 = OpAccessChain %35 %108 
                                              OpStore %110 %109 
                        Uniform f32* %112 = OpAccessChain %43 %53 %108 
                                 f32 %113 = OpLoad %112 
                        Private f32* %114 = OpAccessChain %35 %108 
                                 f32 %115 = OpLoad %114 
                                 f32 %116 = OpFMul %113 %115 
                        Uniform f32* %118 = OpAccessChain %43 %53 %117 
                                 f32 %119 = OpLoad %118 
                                 f32 %120 = OpFAdd %116 %119 
                        Private f32* %121 = OpAccessChain %35 %108 
                                              OpStore %121 %120 
                        Private f32* %122 = OpAccessChain %35 %108 
                                 f32 %123 = OpLoad %122 
                                 f32 %124 = OpFDiv %82 %123 
                        Private f32* %125 = OpAccessChain %35 %108 
                                              OpStore %125 %124 
                        Private f32* %129 = OpAccessChain %35 %108 
                                 f32 %130 = OpLoad %129 
                                bool %132 = OpFOrdLessThan %130 %131 
                                              OpStore %128 %132 
                               f32_3 %133 = OpLoad %35 
                               f32_2 %134 = OpVectorShuffle %133 %133 0 0 
                               f32_2 %137 = OpFMul %134 %136 
                               f32_3 %138 = OpLoad %35 
                               f32_3 %139 = OpVectorShuffle %138 %137 3 1 4 
                                              OpStore %35 %139 
                               f32_3 %140 = OpLoad %35 
                               f32_2 %141 = OpVectorShuffle %140 %140 0 2 
                               f32_2 %142 = OpExtInst %1 10 %141 
                               f32_3 %143 = OpLoad %35 
                               f32_3 %144 = OpVectorShuffle %143 %142 3 1 4 
                                              OpStore %35 %144 
                        Private f32* %145 = OpAccessChain %35 %78 
                                 f32 %146 = OpLoad %145 
                                 f32 %147 = OpFNegate %146 
                                 f32 %149 = OpFMul %147 %148 
                        Private f32* %150 = OpAccessChain %35 %108 
                                 f32 %151 = OpLoad %150 
                                 f32 %152 = OpFAdd %149 %151 
                        Private f32* %153 = OpAccessChain %52 %78 
                                              OpStore %153 %152 
                        Private f32* %154 = OpAccessChain %35 %78 
                                 f32 %155 = OpLoad %154 
                        Private f32* %157 = OpAccessChain %52 %156 
                                              OpStore %157 %155 
                                bool %158 = OpLoad %128 
                               f32_4 %159 = OpLoad %52 
                              bool_4 %162 = OpCompositeConstruct %158 %158 %158 %158 
                               f32_4 %163 = OpSelect %162 %159 %160 
                                              OpStore %52 %163 
                               f32_4 %166 = OpLoad %52 
                                              OpStore %165 %166 
                                              OpReturn
                                              OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 102
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %70 0 BuiltIn 70 
                                                     OpMemberDecorate %70 1 BuiltIn 70 
                                                     OpMemberDecorate %70 2 BuiltIn 70 
                                                     OpDecorate %70 Block 
                                                     OpDecorate vs_TEXCOORD0 Location 84 
                                                     OpDecorate %86 Location 86 
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
                                             %18 = OpTypeStruct %16 %17 %7 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 0 
                                         i32 %23 = OpConstant 1 
                                             %24 = OpTypePointer Uniform %7 
                                         i32 %35 = OpConstant 2 
                                         i32 %44 = OpConstant 3 
                              Private f32_4* %48 = OpVariable Private 
                                         u32 %68 = OpConstant 1 
                                             %69 = OpTypeArray %6 %68 
                                             %70 = OpTypeStruct %7 %6 %69 
                                             %71 = OpTypePointer Output %70 
        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                             %80 = OpTypePointer Output %7 
                                             %82 = OpTypeVector %6 2 
                                             %83 = OpTypePointer Output %82 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %85 = OpTypePointer Input %82 
                                Input f32_2* %86 = OpVariable Input 
                                             %96 = OpTypePointer Output %6 
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
                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                       f32_4 %74 = OpLoad %73 
                                       f32_4 %75 = OpLoad %9 
                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                       f32_4 %77 = OpFMul %74 %76 
                                       f32_4 %78 = OpLoad %48 
                                       f32_4 %79 = OpFAdd %77 %78 
                               Output f32_4* %81 = OpAccessChain %72 %22 
                                                     OpStore %81 %79 
                                       f32_2 %87 = OpLoad %86 
                              Uniform f32_4* %88 = OpAccessChain %20 %35 
                                       f32_4 %89 = OpLoad %88 
                                       f32_2 %90 = OpVectorShuffle %89 %89 0 1 
                                       f32_2 %91 = OpFMul %87 %90 
                              Uniform f32_4* %92 = OpAccessChain %20 %35 
                                       f32_4 %93 = OpLoad %92 
                                       f32_2 %94 = OpVectorShuffle %93 %93 2 3 
                                       f32_2 %95 = OpFAdd %91 %94 
                                                     OpStore vs_TEXCOORD0 %95 
                                 Output f32* %97 = OpAccessChain %72 %22 %68 
                                         f32 %98 = OpLoad %97 
                                         f32 %99 = OpFNegate %98 
                                Output f32* %100 = OpAccessChain %72 %22 %68 
                                                     OpStore %100 %99 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 168
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %22 %165 
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
                                              OpDecorate %31 RelaxedPrecision 
                                              OpDecorate %34 RelaxedPrecision 
                                              OpDecorate %36 RelaxedPrecision 
                                              OpDecorate %37 RelaxedPrecision 
                                              OpDecorate %40 ArrayStride 40 
                                              OpMemberDecorate %41 0 Offset 41 
                                              OpMemberDecorate %41 1 Offset 41 
                                              OpDecorate %41 Block 
                                              OpDecorate %43 DescriptorSet 43 
                                              OpDecorate %43 Binding 43 
                                              OpDecorate %57 RelaxedPrecision 
                                              OpDecorate %58 RelaxedPrecision 
                                              OpDecorate %68 RelaxedPrecision 
                                              OpDecorate %69 RelaxedPrecision 
                                              OpDecorate %101 DescriptorSet 101 
                                              OpDecorate %101 Binding 101 
                                              OpDecorate %103 DescriptorSet 103 
                                              OpDecorate %103 Binding 103 
                                              OpDecorate %165 RelaxedPrecision 
                                              OpDecorate %165 Location 165 
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
                                  f32 %29 = OpConstant 3.674022E-40 
                                f32_3 %30 = OpConstantComposite %29 %29 %29 
                                  f32 %32 = OpConstant 3.674022E-40 
                                f32_3 %33 = OpConstantComposite %32 %32 %32 
                       Private f32_3* %35 = OpVariable Private 
                                      %38 = OpTypeInt 32 0 
                                  u32 %39 = OpConstant 4 
                                      %40 = OpTypeArray %24 %39 
                                      %41 = OpTypeStruct %24 %40 
                                      %42 = OpTypePointer Uniform %41 
   Uniform struct {f32_4; f32_4[4];}* %43 = OpVariable Uniform 
                                      %44 = OpTypeInt 32 1 
                                  i32 %45 = OpConstant 1 
                                      %46 = OpTypePointer Uniform %24 
                                      %51 = OpTypePointer Private %24 
                       Private f32_4* %52 = OpVariable Private 
                                  i32 %53 = OpConstant 0 
                                  i32 %64 = OpConstant 2 
                                      %76 = OpTypePointer Private %6 
                         Private f32* %77 = OpVariable Private 
                                  u32 %78 = OpConstant 2 
                                  f32 %82 = OpConstant 3.674022E-40 
                                  f32 %93 = OpConstant 3.674022E-40 
                                f32_2 %94 = OpConstantComposite %93 %93 
                                  f32 %96 = OpConstant 3.674022E-40 
                                f32_2 %97 = OpConstantComposite %96 %96 
UniformConstant read_only Texture2D* %101 = OpVariable UniformConstant 
            UniformConstant sampler* %103 = OpVariable UniformConstant 
                                 u32 %108 = OpConstant 0 
                                     %111 = OpTypePointer Uniform %6 
                                 u32 %117 = OpConstant 1 
                                     %126 = OpTypeBool 
                                     %127 = OpTypePointer Private %126 
                       Private bool* %128 = OpVariable Private 
                                 f32 %131 = OpConstant 3.674022E-40 
                                 f32 %135 = OpConstant 3.674022E-40 
                               f32_2 %136 = OpConstantComposite %82 %135 
                                 f32 %148 = OpConstant 3.674022E-40 
                                 u32 %156 = OpConstant 3 
                               f32_4 %160 = OpConstantComposite %96 %96 %82 %82 
                                     %161 = OpTypeVector %126 4 
                                     %164 = OpTypePointer Output %24 
                       Output f32_4* %165 = OpVariable Output 
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
                                f32_3 %31 = OpFMul %28 %30 
                                f32_3 %34 = OpFAdd %31 %33 
                                              OpStore %27 %34 
                                f32_3 %36 = OpLoad %27 
                                f32_3 %37 = OpVectorShuffle %36 %36 1 1 1 
                       Uniform f32_4* %47 = OpAccessChain %43 %45 %45 
                                f32_4 %48 = OpLoad %47 
                                f32_3 %49 = OpVectorShuffle %48 %48 0 1 2 
                                f32_3 %50 = OpFMul %37 %49 
                                              OpStore %35 %50 
                       Uniform f32_4* %54 = OpAccessChain %43 %45 %53 
                                f32_4 %55 = OpLoad %54 
                                f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                                f32_3 %57 = OpLoad %27 
                                f32_3 %58 = OpVectorShuffle %57 %57 0 0 0 
                                f32_3 %59 = OpFMul %56 %58 
                                f32_3 %60 = OpLoad %35 
                                f32_3 %61 = OpFAdd %59 %60 
                                f32_4 %62 = OpLoad %52 
                                f32_4 %63 = OpVectorShuffle %62 %61 4 5 2 6 
                                              OpStore %52 %63 
                       Uniform f32_4* %65 = OpAccessChain %43 %45 %64 
                                f32_4 %66 = OpLoad %65 
                                f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
                                f32_3 %68 = OpLoad %27 
                                f32_3 %69 = OpVectorShuffle %68 %68 2 2 2 
                                f32_3 %70 = OpFMul %67 %69 
                                f32_4 %71 = OpLoad %52 
                                f32_3 %72 = OpVectorShuffle %71 %71 0 1 3 
                                f32_3 %73 = OpFAdd %70 %72 
                                f32_4 %74 = OpLoad %52 
                                f32_4 %75 = OpVectorShuffle %74 %73 4 5 6 3 
                                              OpStore %52 %75 
                         Private f32* %79 = OpAccessChain %52 %78 
                                  f32 %80 = OpLoad %79 
                                  f32 %81 = OpFNegate %80 
                                  f32 %83 = OpFAdd %81 %82 
                                              OpStore %77 %83 
                                f32_4 %84 = OpLoad %52 
                                f32_2 %85 = OpVectorShuffle %84 %84 0 1 
                                  f32 %86 = OpLoad %77 
                                f32_2 %87 = OpCompositeConstruct %86 %86 
                                f32_2 %88 = OpFDiv %85 %87 
                                f32_4 %89 = OpLoad %52 
                                f32_4 %90 = OpVectorShuffle %89 %88 4 5 2 3 
                                              OpStore %52 %90 
                                f32_4 %91 = OpLoad %52 
                                f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                f32_2 %95 = OpFMul %92 %94 
                                f32_2 %98 = OpFAdd %95 %97 
                                f32_4 %99 = OpLoad %52 
                               f32_4 %100 = OpVectorShuffle %99 %98 4 5 2 3 
                                              OpStore %52 %100 
                 read_only Texture2D %102 = OpLoad %101 
                             sampler %104 = OpLoad %103 
          read_only Texture2DSampled %105 = OpSampledImage %102 %104 
                               f32_2 %106 = OpLoad vs_TEXCOORD0 
                               f32_4 %107 = OpImageSampleImplicitLod %105 %106 
                                 f32 %109 = OpCompositeExtract %107 0 
                        Private f32* %110 = OpAccessChain %35 %108 
                                              OpStore %110 %109 
                        Uniform f32* %112 = OpAccessChain %43 %53 %108 
                                 f32 %113 = OpLoad %112 
                        Private f32* %114 = OpAccessChain %35 %108 
                                 f32 %115 = OpLoad %114 
                                 f32 %116 = OpFMul %113 %115 
                        Uniform f32* %118 = OpAccessChain %43 %53 %117 
                                 f32 %119 = OpLoad %118 
                                 f32 %120 = OpFAdd %116 %119 
                        Private f32* %121 = OpAccessChain %35 %108 
                                              OpStore %121 %120 
                        Private f32* %122 = OpAccessChain %35 %108 
                                 f32 %123 = OpLoad %122 
                                 f32 %124 = OpFDiv %82 %123 
                        Private f32* %125 = OpAccessChain %35 %108 
                                              OpStore %125 %124 
                        Private f32* %129 = OpAccessChain %35 %108 
                                 f32 %130 = OpLoad %129 
                                bool %132 = OpFOrdLessThan %130 %131 
                                              OpStore %128 %132 
                               f32_3 %133 = OpLoad %35 
                               f32_2 %134 = OpVectorShuffle %133 %133 0 0 
                               f32_2 %137 = OpFMul %134 %136 
                               f32_3 %138 = OpLoad %35 
                               f32_3 %139 = OpVectorShuffle %138 %137 3 1 4 
                                              OpStore %35 %139 
                               f32_3 %140 = OpLoad %35 
                               f32_2 %141 = OpVectorShuffle %140 %140 0 2 
                               f32_2 %142 = OpExtInst %1 10 %141 
                               f32_3 %143 = OpLoad %35 
                               f32_3 %144 = OpVectorShuffle %143 %142 3 1 4 
                                              OpStore %35 %144 
                        Private f32* %145 = OpAccessChain %35 %78 
                                 f32 %146 = OpLoad %145 
                                 f32 %147 = OpFNegate %146 
                                 f32 %149 = OpFMul %147 %148 
                        Private f32* %150 = OpAccessChain %35 %108 
                                 f32 %151 = OpLoad %150 
                                 f32 %152 = OpFAdd %149 %151 
                        Private f32* %153 = OpAccessChain %52 %78 
                                              OpStore %153 %152 
                        Private f32* %154 = OpAccessChain %35 %78 
                                 f32 %155 = OpLoad %154 
                        Private f32* %157 = OpAccessChain %52 %156 
                                              OpStore %157 %155 
                                bool %158 = OpLoad %128 
                               f32_4 %159 = OpLoad %52 
                              bool_4 %162 = OpCompositeConstruct %158 %158 %158 %158 
                               f32_4 %163 = OpSelect %162 %159 %160 
                                              OpStore %52 %163 
                               f32_4 %166 = OpLoad %52 
                                              OpStore %165 %166 
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