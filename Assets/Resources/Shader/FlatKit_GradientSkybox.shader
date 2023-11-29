//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "FlatKit/GradientSkybox" {
Properties {
_Color2 ("Top Color", Color) = (0.97,0.67,0.51,0)
_Color1 ("Bottom Color", Color) = (0,0.7,0.74,0)
[Space] _Intensity ("Intensity", Range(0, 2)) = 1
_Exponent ("Exponent", Range(0, 3)) = 1
[Space] _DirectionYaw ("Direction X angle", Range(0, 180)) = 0
_DirectionPitch ("Direction Y angle", Range(0, 180)) = 0
_Direction ("Direction", Vector) = (0,1,0,0)
}
SubShader {
 Tags { "QUEUE" = "Background" "RenderType" = "Background" }
 Pass {
  Tags { "QUEUE" = "Background" "RenderType" = "Background" }
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 14194
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
in highp vec3 in_TEXCOORD0;
out highp vec3 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
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
uniform 	mediump vec4 _Color1;
uniform 	mediump vec4 _Color2;
uniform 	mediump vec3 _Direction;
uniform 	mediump float _Intensity;
uniform 	mediump float _Exponent;
in highp vec3 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, _Direction.xyz);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_1 = log2(u_xlat0.x);
    u_xlat16_1 = u_xlat16_1 * _Exponent;
    u_xlat16_1 = exp2(u_xlat16_1);
    u_xlat16_0 = (-_Color1) + _Color2;
    u_xlat16_0 = vec4(u_xlat16_1) * u_xlat16_0 + _Color1;
    SV_Target0 = u_xlat16_0 * vec4(vec4(_Intensity, _Intensity, _Intensity, _Intensity));
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
in highp vec3 in_TEXCOORD0;
out highp vec3 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
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
uniform 	mediump vec4 _Color1;
uniform 	mediump vec4 _Color2;
uniform 	mediump vec3 _Direction;
uniform 	mediump float _Intensity;
uniform 	mediump float _Exponent;
in highp vec3 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, _Direction.xyz);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_1 = log2(u_xlat0.x);
    u_xlat16_1 = u_xlat16_1 * _Exponent;
    u_xlat16_1 = exp2(u_xlat16_1);
    u_xlat16_0 = (-_Color1) + _Color2;
    u_xlat16_0 = vec4(u_xlat16_1) * u_xlat16_0 + _Color1;
    SV_Target0 = u_xlat16_0 * vec4(vec4(_Intensity, _Intensity, _Intensity, _Intensity));
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
in highp vec3 in_TEXCOORD0;
out highp vec3 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xyz = in_TEXCOORD0.xyz;
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
uniform 	mediump vec4 _Color1;
uniform 	mediump vec4 _Color2;
uniform 	mediump vec3 _Direction;
uniform 	mediump float _Intensity;
uniform 	mediump float _Exponent;
in highp vec3 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD0.xyz, vs_TEXCOORD0.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, _Direction.xyz);
    u_xlat0.x = u_xlat0.x * 0.5 + 0.5;
    u_xlat16_1 = log2(u_xlat0.x);
    u_xlat16_1 = u_xlat16_1 * _Exponent;
    u_xlat16_1 = exp2(u_xlat16_1);
    u_xlat16_0 = (-_Color1) + _Color2;
    u_xlat16_0 = vec4(u_xlat16_1) * u_xlat16_0 + _Color1;
    SV_Target0 = u_xlat16_0 * vec4(vec4(_Intensity, _Intensity, _Intensity, _Intensity));
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 94
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
                                  u32 %68 = OpConstant 1 
                                      %69 = OpTypeArray %6 %68 
                                      %70 = OpTypeStruct %7 %6 %69 
                                      %71 = OpTypePointer Output %70 
 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                      %80 = OpTypePointer Output %7 
                                      %82 = OpTypeVector %6 3 
                                      %83 = OpTypePointer Output %82 
               Output f32_3* vs_TEXCOORD0 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_3* %86 = OpVariable Input 
                                      %88 = OpTypePointer Output %6 
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
                                f32_3 %87 = OpLoad %86 
                                              OpStore vs_TEXCOORD0 %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 95
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %76 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate vs_TEXCOORD0 Location 11 
                                                      OpMemberDecorate %29 0 RelaxedPrecision 
                                                      OpMemberDecorate %29 0 Offset 29 
                                                      OpMemberDecorate %29 1 RelaxedPrecision 
                                                      OpMemberDecorate %29 1 Offset 29 
                                                      OpMemberDecorate %29 2 RelaxedPrecision 
                                                      OpMemberDecorate %29 2 Offset 29 
                                                      OpMemberDecorate %29 3 RelaxedPrecision 
                                                      OpMemberDecorate %29 3 Offset 29 
                                                      OpMemberDecorate %29 4 RelaxedPrecision 
                                                      OpMemberDecorate %29 4 Offset 29 
                                                      OpDecorate %29 Block 
                                                      OpDecorate %31 DescriptorSet 31 
                                                      OpDecorate %31 Binding 31 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %62 RelaxedPrecision 
                                                      OpDecorate %63 RelaxedPrecision 
                                                      OpDecorate %66 RelaxedPrecision 
                                                      OpDecorate %67 RelaxedPrecision 
                                                      OpDecorate %68 RelaxedPrecision 
                                                      OpDecorate %69 RelaxedPrecision 
                                                      OpDecorate %70 RelaxedPrecision 
                                                      OpDecorate %71 RelaxedPrecision 
                                                      OpDecorate %73 RelaxedPrecision 
                                                      OpDecorate %74 RelaxedPrecision 
                                                      OpDecorate %76 RelaxedPrecision 
                                                      OpDecorate %76 Location 76 
                                                      OpDecorate %77 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %82 RelaxedPrecision 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate %87 RelaxedPrecision 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %91 RelaxedPrecision 
                                                      OpDecorate %92 RelaxedPrecision 
                                                      OpDecorate %93 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                        Input f32_3* vs_TEXCOORD0 = OpVariable Input 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 0 
                                              %17 = OpTypePointer Private %6 
                                              %28 = OpTypeVector %6 4 
                                              %29 = OpTypeStruct %28 %28 %7 %6 %6 
                                              %30 = OpTypePointer Uniform %29 
Uniform struct {f32_4; f32_4; f32_3; f32; f32;}* %31 = OpVariable Uniform 
                                              %32 = OpTypeInt 32 1 
                                          i32 %33 = OpConstant 2 
                                              %34 = OpTypePointer Uniform %7 
                                          f32 %41 = OpConstant 3.674022E-40 
                                 Private f32* %45 = OpVariable Private 
                                          i32 %50 = OpConstant 4 
                                              %51 = OpTypePointer Uniform %6 
                                              %57 = OpTypePointer Private %28 
                               Private f32_4* %58 = OpVariable Private 
                                          i32 %59 = OpConstant 0 
                                              %60 = OpTypePointer Uniform %28 
                                          i32 %64 = OpConstant 1 
                                              %75 = OpTypePointer Output %28 
                                Output f32_4* %76 = OpVariable Output 
                                          i32 %78 = OpConstant 3 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_3 %12 = OpLoad vs_TEXCOORD0 
                                        f32_3 %13 = OpLoad vs_TEXCOORD0 
                                          f32 %14 = OpDot %12 %13 
                                 Private f32* %18 = OpAccessChain %9 %16 
                                                      OpStore %18 %14 
                                 Private f32* %19 = OpAccessChain %9 %16 
                                          f32 %20 = OpLoad %19 
                                          f32 %21 = OpExtInst %1 32 %20 
                                 Private f32* %22 = OpAccessChain %9 %16 
                                                      OpStore %22 %21 
                                        f32_3 %23 = OpLoad %9 
                                        f32_3 %24 = OpVectorShuffle %23 %23 0 0 0 
                                        f32_3 %25 = OpLoad vs_TEXCOORD0 
                                        f32_3 %26 = OpFMul %24 %25 
                                                      OpStore %9 %26 
                                        f32_3 %27 = OpLoad %9 
                               Uniform f32_3* %35 = OpAccessChain %31 %33 
                                        f32_3 %36 = OpLoad %35 
                                          f32 %37 = OpDot %27 %36 
                                 Private f32* %38 = OpAccessChain %9 %16 
                                                      OpStore %38 %37 
                                 Private f32* %39 = OpAccessChain %9 %16 
                                          f32 %40 = OpLoad %39 
                                          f32 %42 = OpFMul %40 %41 
                                          f32 %43 = OpFAdd %42 %41 
                                 Private f32* %44 = OpAccessChain %9 %16 
                                                      OpStore %44 %43 
                                 Private f32* %46 = OpAccessChain %9 %16 
                                          f32 %47 = OpLoad %46 
                                          f32 %48 = OpExtInst %1 30 %47 
                                                      OpStore %45 %48 
                                          f32 %49 = OpLoad %45 
                                 Uniform f32* %52 = OpAccessChain %31 %50 
                                          f32 %53 = OpLoad %52 
                                          f32 %54 = OpFMul %49 %53 
                                                      OpStore %45 %54 
                                          f32 %55 = OpLoad %45 
                                          f32 %56 = OpExtInst %1 29 %55 
                                                      OpStore %45 %56 
                               Uniform f32_4* %61 = OpAccessChain %31 %59 
                                        f32_4 %62 = OpLoad %61 
                                        f32_4 %63 = OpFNegate %62 
                               Uniform f32_4* %65 = OpAccessChain %31 %64 
                                        f32_4 %66 = OpLoad %65 
                                        f32_4 %67 = OpFAdd %63 %66 
                                                      OpStore %58 %67 
                                          f32 %68 = OpLoad %45 
                                        f32_4 %69 = OpCompositeConstruct %68 %68 %68 %68 
                                        f32_4 %70 = OpLoad %58 
                                        f32_4 %71 = OpFMul %69 %70 
                               Uniform f32_4* %72 = OpAccessChain %31 %59 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpFAdd %71 %73 
                                                      OpStore %58 %74 
                                        f32_4 %77 = OpLoad %58 
                                 Uniform f32* %79 = OpAccessChain %31 %78 
                                          f32 %80 = OpLoad %79 
                                 Uniform f32* %81 = OpAccessChain %31 %78 
                                          f32 %82 = OpLoad %81 
                                 Uniform f32* %83 = OpAccessChain %31 %78 
                                          f32 %84 = OpLoad %83 
                                 Uniform f32* %85 = OpAccessChain %31 %78 
                                          f32 %86 = OpLoad %85 
                                        f32_4 %87 = OpCompositeConstruct %80 %82 %84 %86 
                                          f32 %88 = OpCompositeExtract %87 0 
                                          f32 %89 = OpCompositeExtract %87 1 
                                          f32 %90 = OpCompositeExtract %87 2 
                                          f32 %91 = OpCompositeExtract %87 3 
                                        f32_4 %92 = OpCompositeConstruct %88 %89 %90 %91 
                                        f32_4 %93 = OpFMul %77 %92 
                                                      OpStore %76 %93 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 94
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
                                  u32 %68 = OpConstant 1 
                                      %69 = OpTypeArray %6 %68 
                                      %70 = OpTypeStruct %7 %6 %69 
                                      %71 = OpTypePointer Output %70 
 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                      %80 = OpTypePointer Output %7 
                                      %82 = OpTypeVector %6 3 
                                      %83 = OpTypePointer Output %82 
               Output f32_3* vs_TEXCOORD0 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_3* %86 = OpVariable Input 
                                      %88 = OpTypePointer Output %6 
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
                                f32_3 %87 = OpLoad %86 
                                              OpStore vs_TEXCOORD0 %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 95
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %76 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate vs_TEXCOORD0 Location 11 
                                                      OpMemberDecorate %29 0 RelaxedPrecision 
                                                      OpMemberDecorate %29 0 Offset 29 
                                                      OpMemberDecorate %29 1 RelaxedPrecision 
                                                      OpMemberDecorate %29 1 Offset 29 
                                                      OpMemberDecorate %29 2 RelaxedPrecision 
                                                      OpMemberDecorate %29 2 Offset 29 
                                                      OpMemberDecorate %29 3 RelaxedPrecision 
                                                      OpMemberDecorate %29 3 Offset 29 
                                                      OpMemberDecorate %29 4 RelaxedPrecision 
                                                      OpMemberDecorate %29 4 Offset 29 
                                                      OpDecorate %29 Block 
                                                      OpDecorate %31 DescriptorSet 31 
                                                      OpDecorate %31 Binding 31 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %62 RelaxedPrecision 
                                                      OpDecorate %63 RelaxedPrecision 
                                                      OpDecorate %66 RelaxedPrecision 
                                                      OpDecorate %67 RelaxedPrecision 
                                                      OpDecorate %68 RelaxedPrecision 
                                                      OpDecorate %69 RelaxedPrecision 
                                                      OpDecorate %70 RelaxedPrecision 
                                                      OpDecorate %71 RelaxedPrecision 
                                                      OpDecorate %73 RelaxedPrecision 
                                                      OpDecorate %74 RelaxedPrecision 
                                                      OpDecorate %76 RelaxedPrecision 
                                                      OpDecorate %76 Location 76 
                                                      OpDecorate %77 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %82 RelaxedPrecision 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate %87 RelaxedPrecision 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %91 RelaxedPrecision 
                                                      OpDecorate %92 RelaxedPrecision 
                                                      OpDecorate %93 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                        Input f32_3* vs_TEXCOORD0 = OpVariable Input 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 0 
                                              %17 = OpTypePointer Private %6 
                                              %28 = OpTypeVector %6 4 
                                              %29 = OpTypeStruct %28 %28 %7 %6 %6 
                                              %30 = OpTypePointer Uniform %29 
Uniform struct {f32_4; f32_4; f32_3; f32; f32;}* %31 = OpVariable Uniform 
                                              %32 = OpTypeInt 32 1 
                                          i32 %33 = OpConstant 2 
                                              %34 = OpTypePointer Uniform %7 
                                          f32 %41 = OpConstant 3.674022E-40 
                                 Private f32* %45 = OpVariable Private 
                                          i32 %50 = OpConstant 4 
                                              %51 = OpTypePointer Uniform %6 
                                              %57 = OpTypePointer Private %28 
                               Private f32_4* %58 = OpVariable Private 
                                          i32 %59 = OpConstant 0 
                                              %60 = OpTypePointer Uniform %28 
                                          i32 %64 = OpConstant 1 
                                              %75 = OpTypePointer Output %28 
                                Output f32_4* %76 = OpVariable Output 
                                          i32 %78 = OpConstant 3 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_3 %12 = OpLoad vs_TEXCOORD0 
                                        f32_3 %13 = OpLoad vs_TEXCOORD0 
                                          f32 %14 = OpDot %12 %13 
                                 Private f32* %18 = OpAccessChain %9 %16 
                                                      OpStore %18 %14 
                                 Private f32* %19 = OpAccessChain %9 %16 
                                          f32 %20 = OpLoad %19 
                                          f32 %21 = OpExtInst %1 32 %20 
                                 Private f32* %22 = OpAccessChain %9 %16 
                                                      OpStore %22 %21 
                                        f32_3 %23 = OpLoad %9 
                                        f32_3 %24 = OpVectorShuffle %23 %23 0 0 0 
                                        f32_3 %25 = OpLoad vs_TEXCOORD0 
                                        f32_3 %26 = OpFMul %24 %25 
                                                      OpStore %9 %26 
                                        f32_3 %27 = OpLoad %9 
                               Uniform f32_3* %35 = OpAccessChain %31 %33 
                                        f32_3 %36 = OpLoad %35 
                                          f32 %37 = OpDot %27 %36 
                                 Private f32* %38 = OpAccessChain %9 %16 
                                                      OpStore %38 %37 
                                 Private f32* %39 = OpAccessChain %9 %16 
                                          f32 %40 = OpLoad %39 
                                          f32 %42 = OpFMul %40 %41 
                                          f32 %43 = OpFAdd %42 %41 
                                 Private f32* %44 = OpAccessChain %9 %16 
                                                      OpStore %44 %43 
                                 Private f32* %46 = OpAccessChain %9 %16 
                                          f32 %47 = OpLoad %46 
                                          f32 %48 = OpExtInst %1 30 %47 
                                                      OpStore %45 %48 
                                          f32 %49 = OpLoad %45 
                                 Uniform f32* %52 = OpAccessChain %31 %50 
                                          f32 %53 = OpLoad %52 
                                          f32 %54 = OpFMul %49 %53 
                                                      OpStore %45 %54 
                                          f32 %55 = OpLoad %45 
                                          f32 %56 = OpExtInst %1 29 %55 
                                                      OpStore %45 %56 
                               Uniform f32_4* %61 = OpAccessChain %31 %59 
                                        f32_4 %62 = OpLoad %61 
                                        f32_4 %63 = OpFNegate %62 
                               Uniform f32_4* %65 = OpAccessChain %31 %64 
                                        f32_4 %66 = OpLoad %65 
                                        f32_4 %67 = OpFAdd %63 %66 
                                                      OpStore %58 %67 
                                          f32 %68 = OpLoad %45 
                                        f32_4 %69 = OpCompositeConstruct %68 %68 %68 %68 
                                        f32_4 %70 = OpLoad %58 
                                        f32_4 %71 = OpFMul %69 %70 
                               Uniform f32_4* %72 = OpAccessChain %31 %59 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpFAdd %71 %73 
                                                      OpStore %58 %74 
                                        f32_4 %77 = OpLoad %58 
                                 Uniform f32* %79 = OpAccessChain %31 %78 
                                          f32 %80 = OpLoad %79 
                                 Uniform f32* %81 = OpAccessChain %31 %78 
                                          f32 %82 = OpLoad %81 
                                 Uniform f32* %83 = OpAccessChain %31 %78 
                                          f32 %84 = OpLoad %83 
                                 Uniform f32* %85 = OpAccessChain %31 %78 
                                          f32 %86 = OpLoad %85 
                                        f32_4 %87 = OpCompositeConstruct %80 %82 %84 %86 
                                          f32 %88 = OpCompositeExtract %87 0 
                                          f32 %89 = OpCompositeExtract %87 1 
                                          f32 %90 = OpCompositeExtract %87 2 
                                          f32 %91 = OpCompositeExtract %87 3 
                                        f32_4 %92 = OpCompositeConstruct %88 %89 %90 %91 
                                        f32_4 %93 = OpFMul %77 %92 
                                                      OpStore %76 %93 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 94
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
                                  u32 %68 = OpConstant 1 
                                      %69 = OpTypeArray %6 %68 
                                      %70 = OpTypeStruct %7 %6 %69 
                                      %71 = OpTypePointer Output %70 
 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                      %80 = OpTypePointer Output %7 
                                      %82 = OpTypeVector %6 3 
                                      %83 = OpTypePointer Output %82 
               Output f32_3* vs_TEXCOORD0 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_3* %86 = OpVariable Input 
                                      %88 = OpTypePointer Output %6 
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
                                f32_3 %87 = OpLoad %86 
                                              OpStore vs_TEXCOORD0 %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 95
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %76 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate vs_TEXCOORD0 Location 11 
                                                      OpMemberDecorate %29 0 RelaxedPrecision 
                                                      OpMemberDecorate %29 0 Offset 29 
                                                      OpMemberDecorate %29 1 RelaxedPrecision 
                                                      OpMemberDecorate %29 1 Offset 29 
                                                      OpMemberDecorate %29 2 RelaxedPrecision 
                                                      OpMemberDecorate %29 2 Offset 29 
                                                      OpMemberDecorate %29 3 RelaxedPrecision 
                                                      OpMemberDecorate %29 3 Offset 29 
                                                      OpMemberDecorate %29 4 RelaxedPrecision 
                                                      OpMemberDecorate %29 4 Offset 29 
                                                      OpDecorate %29 Block 
                                                      OpDecorate %31 DescriptorSet 31 
                                                      OpDecorate %31 Binding 31 
                                                      OpDecorate %36 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %53 RelaxedPrecision 
                                                      OpDecorate %54 RelaxedPrecision 
                                                      OpDecorate %55 RelaxedPrecision 
                                                      OpDecorate %56 RelaxedPrecision 
                                                      OpDecorate %58 RelaxedPrecision 
                                                      OpDecorate %62 RelaxedPrecision 
                                                      OpDecorate %63 RelaxedPrecision 
                                                      OpDecorate %66 RelaxedPrecision 
                                                      OpDecorate %67 RelaxedPrecision 
                                                      OpDecorate %68 RelaxedPrecision 
                                                      OpDecorate %69 RelaxedPrecision 
                                                      OpDecorate %70 RelaxedPrecision 
                                                      OpDecorate %71 RelaxedPrecision 
                                                      OpDecorate %73 RelaxedPrecision 
                                                      OpDecorate %74 RelaxedPrecision 
                                                      OpDecorate %76 RelaxedPrecision 
                                                      OpDecorate %76 Location 76 
                                                      OpDecorate %77 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate %82 RelaxedPrecision 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate %87 RelaxedPrecision 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %91 RelaxedPrecision 
                                                      OpDecorate %92 RelaxedPrecision 
                                                      OpDecorate %93 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                        Input f32_3* vs_TEXCOORD0 = OpVariable Input 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 0 
                                              %17 = OpTypePointer Private %6 
                                              %28 = OpTypeVector %6 4 
                                              %29 = OpTypeStruct %28 %28 %7 %6 %6 
                                              %30 = OpTypePointer Uniform %29 
Uniform struct {f32_4; f32_4; f32_3; f32; f32;}* %31 = OpVariable Uniform 
                                              %32 = OpTypeInt 32 1 
                                          i32 %33 = OpConstant 2 
                                              %34 = OpTypePointer Uniform %7 
                                          f32 %41 = OpConstant 3.674022E-40 
                                 Private f32* %45 = OpVariable Private 
                                          i32 %50 = OpConstant 4 
                                              %51 = OpTypePointer Uniform %6 
                                              %57 = OpTypePointer Private %28 
                               Private f32_4* %58 = OpVariable Private 
                                          i32 %59 = OpConstant 0 
                                              %60 = OpTypePointer Uniform %28 
                                          i32 %64 = OpConstant 1 
                                              %75 = OpTypePointer Output %28 
                                Output f32_4* %76 = OpVariable Output 
                                          i32 %78 = OpConstant 3 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_3 %12 = OpLoad vs_TEXCOORD0 
                                        f32_3 %13 = OpLoad vs_TEXCOORD0 
                                          f32 %14 = OpDot %12 %13 
                                 Private f32* %18 = OpAccessChain %9 %16 
                                                      OpStore %18 %14 
                                 Private f32* %19 = OpAccessChain %9 %16 
                                          f32 %20 = OpLoad %19 
                                          f32 %21 = OpExtInst %1 32 %20 
                                 Private f32* %22 = OpAccessChain %9 %16 
                                                      OpStore %22 %21 
                                        f32_3 %23 = OpLoad %9 
                                        f32_3 %24 = OpVectorShuffle %23 %23 0 0 0 
                                        f32_3 %25 = OpLoad vs_TEXCOORD0 
                                        f32_3 %26 = OpFMul %24 %25 
                                                      OpStore %9 %26 
                                        f32_3 %27 = OpLoad %9 
                               Uniform f32_3* %35 = OpAccessChain %31 %33 
                                        f32_3 %36 = OpLoad %35 
                                          f32 %37 = OpDot %27 %36 
                                 Private f32* %38 = OpAccessChain %9 %16 
                                                      OpStore %38 %37 
                                 Private f32* %39 = OpAccessChain %9 %16 
                                          f32 %40 = OpLoad %39 
                                          f32 %42 = OpFMul %40 %41 
                                          f32 %43 = OpFAdd %42 %41 
                                 Private f32* %44 = OpAccessChain %9 %16 
                                                      OpStore %44 %43 
                                 Private f32* %46 = OpAccessChain %9 %16 
                                          f32 %47 = OpLoad %46 
                                          f32 %48 = OpExtInst %1 30 %47 
                                                      OpStore %45 %48 
                                          f32 %49 = OpLoad %45 
                                 Uniform f32* %52 = OpAccessChain %31 %50 
                                          f32 %53 = OpLoad %52 
                                          f32 %54 = OpFMul %49 %53 
                                                      OpStore %45 %54 
                                          f32 %55 = OpLoad %45 
                                          f32 %56 = OpExtInst %1 29 %55 
                                                      OpStore %45 %56 
                               Uniform f32_4* %61 = OpAccessChain %31 %59 
                                        f32_4 %62 = OpLoad %61 
                                        f32_4 %63 = OpFNegate %62 
                               Uniform f32_4* %65 = OpAccessChain %31 %64 
                                        f32_4 %66 = OpLoad %65 
                                        f32_4 %67 = OpFAdd %63 %66 
                                                      OpStore %58 %67 
                                          f32 %68 = OpLoad %45 
                                        f32_4 %69 = OpCompositeConstruct %68 %68 %68 %68 
                                        f32_4 %70 = OpLoad %58 
                                        f32_4 %71 = OpFMul %69 %70 
                               Uniform f32_4* %72 = OpAccessChain %31 %59 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpFAdd %71 %73 
                                                      OpStore %58 %74 
                                        f32_4 %77 = OpLoad %58 
                                 Uniform f32* %79 = OpAccessChain %31 %78 
                                          f32 %80 = OpLoad %79 
                                 Uniform f32* %81 = OpAccessChain %31 %78 
                                          f32 %82 = OpLoad %81 
                                 Uniform f32* %83 = OpAccessChain %31 %78 
                                          f32 %84 = OpLoad %83 
                                 Uniform f32* %85 = OpAccessChain %31 %78 
                                          f32 %86 = OpLoad %85 
                                        f32_4 %87 = OpCompositeConstruct %80 %82 %84 %86 
                                          f32 %88 = OpCompositeExtract %87 0 
                                          f32 %89 = OpCompositeExtract %87 1 
                                          f32 %90 = OpCompositeExtract %87 2 
                                          f32 %91 = OpCompositeExtract %87 3 
                                        f32_4 %92 = OpCompositeConstruct %88 %89 %90 %91 
                                        f32_4 %93 = OpFMul %77 %92 
                                                      OpStore %76 %93 
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
CustomEditor "GradientSkyboxEditor"
}