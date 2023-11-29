//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Legacy Shaders/Particles/Additive" {
Properties {
_TintColor ("Tint Color", Color) = (0.5,0.5,0.5,0.5)
_MainTex ("Particle Texture", 2D) = "white" { }
_InvFade ("Soft Particles Factor", Range(0.01, 3)) = 1
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha One, SrcAlpha One
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  GpuProgramID 63852
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
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _TintColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlat16_0 = vs_COLOR0 + vs_COLOR0;
    u_xlat16_0 = u_xlat16_0 * _TintColor;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    SV_Target0.w = u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat16_0.xyz;
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
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _TintColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlat16_0 = vs_COLOR0 + vs_COLOR0;
    u_xlat16_0 = u_xlat16_0 * _TintColor;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    SV_Target0.w = u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat16_0.xyz;
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
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
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
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _TintColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlat16_0 = vs_COLOR0 + vs_COLOR0;
    u_xlat16_0 = u_xlat16_0 * _TintColor;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * u_xlat16_1;
    SV_Target0.w = u_xlat16_0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat16_0.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 105
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %82 %83 %87 %89 
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
                                                     OpDecorate %82 RelaxedPrecision 
                                                     OpDecorate %82 Location 82 
                                                     OpDecorate %83 RelaxedPrecision 
                                                     OpDecorate %83 Location 83 
                                                     OpDecorate %84 RelaxedPrecision 
                                                     OpDecorate vs_TEXCOORD0 Location 87 
                                                     OpDecorate %89 Location 89 
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
                               Output f32_4* %82 = OpVariable Output 
                                Input f32_4* %83 = OpVariable Input 
                                             %85 = OpTypeVector %6 2 
                                             %86 = OpTypePointer Output %85 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %88 = OpTypePointer Input %85 
                                Input f32_2* %89 = OpVariable Input 
                                             %99 = OpTypePointer Output %6 
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
                                       f32_4 %84 = OpLoad %83 
                                                     OpStore %82 %84 
                                       f32_2 %90 = OpLoad %89 
                              Uniform f32_4* %91 = OpAccessChain %20 %35 
                                       f32_4 %92 = OpLoad %91 
                                       f32_2 %93 = OpVectorShuffle %92 %92 0 1 
                                       f32_2 %94 = OpFMul %90 %93 
                              Uniform f32_4* %95 = OpAccessChain %20 %35 
                                       f32_4 %96 = OpLoad %95 
                                       f32_2 %97 = OpVectorShuffle %96 %96 2 3 
                                       f32_2 %98 = OpFAdd %94 %97 
                                                     OpStore vs_TEXCOORD0 %98 
                                Output f32* %100 = OpAccessChain %72 %22 %68 
                                        f32 %101 = OpLoad %100 
                                        f32 %102 = OpFNegate %101 
                                Output f32* %103 = OpAccessChain %72 %22 %68 
                                                     OpStore %103 %102 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 65
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %11 %38 %45 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %9 RelaxedPrecision 
                                             OpDecorate %11 RelaxedPrecision 
                                             OpDecorate %11 Location 11 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %13 RelaxedPrecision 
                                             OpDecorate %14 RelaxedPrecision 
                                             OpDecorate %15 RelaxedPrecision 
                                             OpMemberDecorate %16 0 RelaxedPrecision 
                                             OpMemberDecorate %16 0 Offset 16 
                                             OpDecorate %16 Block 
                                             OpDecorate %18 DescriptorSet 18 
                                             OpDecorate %18 Binding 18 
                                             OpDecorate %23 RelaxedPrecision 
                                             OpDecorate %24 RelaxedPrecision 
                                             OpDecorate %25 RelaxedPrecision 
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %28 DescriptorSet 28 
                                             OpDecorate %28 Binding 28 
                                             OpDecorate %29 RelaxedPrecision 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate %33 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 38 
                                             OpDecorate %41 RelaxedPrecision 
                                             OpDecorate %42 RelaxedPrecision 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %45 RelaxedPrecision 
                                             OpDecorate %45 Location 45 
                                             OpDecorate %50 RelaxedPrecision 
                                             OpDecorate %54 RelaxedPrecision 
                                             OpDecorate %57 RelaxedPrecision 
                                             OpDecorate %60 RelaxedPrecision 
                                             OpDecorate %61 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypePointer Input %7 
                        Input f32_4* %11 = OpVariable Input 
                                     %16 = OpTypeStruct %7 
                                     %17 = OpTypePointer Uniform %16 
            Uniform struct {f32_4;}* %18 = OpVariable Uniform 
                                     %19 = OpTypeInt 32 1 
                                 i32 %20 = OpConstant 0 
                                     %21 = OpTypePointer Uniform %7 
                      Private f32_4* %25 = OpVariable Private 
                                     %26 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %27 = OpTypePointer UniformConstant %26 
UniformConstant read_only Texture2D* %28 = OpVariable UniformConstant 
                                     %30 = OpTypeSampler 
                                     %31 = OpTypePointer UniformConstant %30 
            UniformConstant sampler* %32 = OpVariable UniformConstant 
                                     %34 = OpTypeSampledImage %26 
                                     %36 = OpTypeVector %6 2 
                                     %37 = OpTypePointer Input %36 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %44 = OpTypePointer Output %7 
                       Output f32_4* %45 = OpVariable Output 
                                     %46 = OpTypeInt 32 0 
                                 u32 %47 = OpConstant 3 
                                     %48 = OpTypePointer Private %6 
                                     %51 = OpTypePointer Output %6 
                                 f32 %55 = OpConstant 3.674022E-40 
                                 f32 %56 = OpConstant 3.674022E-40 
                                     %59 = OpTypeVector %6 3 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_4 %12 = OpLoad %11 
                               f32_4 %13 = OpLoad %11 
                               f32_4 %14 = OpFAdd %12 %13 
                                             OpStore %9 %14 
                               f32_4 %15 = OpLoad %9 
                      Uniform f32_4* %22 = OpAccessChain %18 %20 
                               f32_4 %23 = OpLoad %22 
                               f32_4 %24 = OpFMul %15 %23 
                                             OpStore %9 %24 
                 read_only Texture2D %29 = OpLoad %28 
                             sampler %33 = OpLoad %32 
          read_only Texture2DSampled %35 = OpSampledImage %29 %33 
                               f32_2 %39 = OpLoad vs_TEXCOORD0 
                               f32_4 %40 = OpImageSampleImplicitLod %35 %39 
                                             OpStore %25 %40 
                               f32_4 %41 = OpLoad %9 
                               f32_4 %42 = OpLoad %25 
                               f32_4 %43 = OpFMul %41 %42 
                                             OpStore %9 %43 
                        Private f32* %49 = OpAccessChain %9 %47 
                                 f32 %50 = OpLoad %49 
                         Output f32* %52 = OpAccessChain %45 %47 
                                             OpStore %52 %50 
                         Output f32* %53 = OpAccessChain %45 %47 
                                 f32 %54 = OpLoad %53 
                                 f32 %57 = OpExtInst %1 43 %54 %55 %56 
                         Output f32* %58 = OpAccessChain %45 %47 
                                             OpStore %58 %57 
                               f32_4 %60 = OpLoad %9 
                               f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
                               f32_4 %62 = OpLoad %45 
                               f32_4 %63 = OpVectorShuffle %62 %61 4 5 6 3 
                                             OpStore %45 %63 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 105
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %82 %83 %87 %89 
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
                                                     OpDecorate %82 RelaxedPrecision 
                                                     OpDecorate %82 Location 82 
                                                     OpDecorate %83 RelaxedPrecision 
                                                     OpDecorate %83 Location 83 
                                                     OpDecorate %84 RelaxedPrecision 
                                                     OpDecorate vs_TEXCOORD0 Location 87 
                                                     OpDecorate %89 Location 89 
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
                               Output f32_4* %82 = OpVariable Output 
                                Input f32_4* %83 = OpVariable Input 
                                             %85 = OpTypeVector %6 2 
                                             %86 = OpTypePointer Output %85 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %88 = OpTypePointer Input %85 
                                Input f32_2* %89 = OpVariable Input 
                                             %99 = OpTypePointer Output %6 
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
                                       f32_4 %84 = OpLoad %83 
                                                     OpStore %82 %84 
                                       f32_2 %90 = OpLoad %89 
                              Uniform f32_4* %91 = OpAccessChain %20 %35 
                                       f32_4 %92 = OpLoad %91 
                                       f32_2 %93 = OpVectorShuffle %92 %92 0 1 
                                       f32_2 %94 = OpFMul %90 %93 
                              Uniform f32_4* %95 = OpAccessChain %20 %35 
                                       f32_4 %96 = OpLoad %95 
                                       f32_2 %97 = OpVectorShuffle %96 %96 2 3 
                                       f32_2 %98 = OpFAdd %94 %97 
                                                     OpStore vs_TEXCOORD0 %98 
                                Output f32* %100 = OpAccessChain %72 %22 %68 
                                        f32 %101 = OpLoad %100 
                                        f32 %102 = OpFNegate %101 
                                Output f32* %103 = OpAccessChain %72 %22 %68 
                                                     OpStore %103 %102 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 65
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %11 %38 %45 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %9 RelaxedPrecision 
                                             OpDecorate %11 RelaxedPrecision 
                                             OpDecorate %11 Location 11 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %13 RelaxedPrecision 
                                             OpDecorate %14 RelaxedPrecision 
                                             OpDecorate %15 RelaxedPrecision 
                                             OpMemberDecorate %16 0 RelaxedPrecision 
                                             OpMemberDecorate %16 0 Offset 16 
                                             OpDecorate %16 Block 
                                             OpDecorate %18 DescriptorSet 18 
                                             OpDecorate %18 Binding 18 
                                             OpDecorate %23 RelaxedPrecision 
                                             OpDecorate %24 RelaxedPrecision 
                                             OpDecorate %25 RelaxedPrecision 
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %28 DescriptorSet 28 
                                             OpDecorate %28 Binding 28 
                                             OpDecorate %29 RelaxedPrecision 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate %33 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 38 
                                             OpDecorate %41 RelaxedPrecision 
                                             OpDecorate %42 RelaxedPrecision 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %45 RelaxedPrecision 
                                             OpDecorate %45 Location 45 
                                             OpDecorate %50 RelaxedPrecision 
                                             OpDecorate %54 RelaxedPrecision 
                                             OpDecorate %57 RelaxedPrecision 
                                             OpDecorate %60 RelaxedPrecision 
                                             OpDecorate %61 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypePointer Input %7 
                        Input f32_4* %11 = OpVariable Input 
                                     %16 = OpTypeStruct %7 
                                     %17 = OpTypePointer Uniform %16 
            Uniform struct {f32_4;}* %18 = OpVariable Uniform 
                                     %19 = OpTypeInt 32 1 
                                 i32 %20 = OpConstant 0 
                                     %21 = OpTypePointer Uniform %7 
                      Private f32_4* %25 = OpVariable Private 
                                     %26 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %27 = OpTypePointer UniformConstant %26 
UniformConstant read_only Texture2D* %28 = OpVariable UniformConstant 
                                     %30 = OpTypeSampler 
                                     %31 = OpTypePointer UniformConstant %30 
            UniformConstant sampler* %32 = OpVariable UniformConstant 
                                     %34 = OpTypeSampledImage %26 
                                     %36 = OpTypeVector %6 2 
                                     %37 = OpTypePointer Input %36 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %44 = OpTypePointer Output %7 
                       Output f32_4* %45 = OpVariable Output 
                                     %46 = OpTypeInt 32 0 
                                 u32 %47 = OpConstant 3 
                                     %48 = OpTypePointer Private %6 
                                     %51 = OpTypePointer Output %6 
                                 f32 %55 = OpConstant 3.674022E-40 
                                 f32 %56 = OpConstant 3.674022E-40 
                                     %59 = OpTypeVector %6 3 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_4 %12 = OpLoad %11 
                               f32_4 %13 = OpLoad %11 
                               f32_4 %14 = OpFAdd %12 %13 
                                             OpStore %9 %14 
                               f32_4 %15 = OpLoad %9 
                      Uniform f32_4* %22 = OpAccessChain %18 %20 
                               f32_4 %23 = OpLoad %22 
                               f32_4 %24 = OpFMul %15 %23 
                                             OpStore %9 %24 
                 read_only Texture2D %29 = OpLoad %28 
                             sampler %33 = OpLoad %32 
          read_only Texture2DSampled %35 = OpSampledImage %29 %33 
                               f32_2 %39 = OpLoad vs_TEXCOORD0 
                               f32_4 %40 = OpImageSampleImplicitLod %35 %39 
                                             OpStore %25 %40 
                               f32_4 %41 = OpLoad %9 
                               f32_4 %42 = OpLoad %25 
                               f32_4 %43 = OpFMul %41 %42 
                                             OpStore %9 %43 
                        Private f32* %49 = OpAccessChain %9 %47 
                                 f32 %50 = OpLoad %49 
                         Output f32* %52 = OpAccessChain %45 %47 
                                             OpStore %52 %50 
                         Output f32* %53 = OpAccessChain %45 %47 
                                 f32 %54 = OpLoad %53 
                                 f32 %57 = OpExtInst %1 43 %54 %55 %56 
                         Output f32* %58 = OpAccessChain %45 %47 
                                             OpStore %58 %57 
                               f32_4 %60 = OpLoad %9 
                               f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
                               f32_4 %62 = OpLoad %45 
                               f32_4 %63 = OpVectorShuffle %62 %61 4 5 6 3 
                                             OpStore %45 %63 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 105
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %82 %83 %87 %89 
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
                                                     OpDecorate %82 RelaxedPrecision 
                                                     OpDecorate %82 Location 82 
                                                     OpDecorate %83 RelaxedPrecision 
                                                     OpDecorate %83 Location 83 
                                                     OpDecorate %84 RelaxedPrecision 
                                                     OpDecorate vs_TEXCOORD0 Location 87 
                                                     OpDecorate %89 Location 89 
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
                               Output f32_4* %82 = OpVariable Output 
                                Input f32_4* %83 = OpVariable Input 
                                             %85 = OpTypeVector %6 2 
                                             %86 = OpTypePointer Output %85 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %88 = OpTypePointer Input %85 
                                Input f32_2* %89 = OpVariable Input 
                                             %99 = OpTypePointer Output %6 
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
                                       f32_4 %84 = OpLoad %83 
                                                     OpStore %82 %84 
                                       f32_2 %90 = OpLoad %89 
                              Uniform f32_4* %91 = OpAccessChain %20 %35 
                                       f32_4 %92 = OpLoad %91 
                                       f32_2 %93 = OpVectorShuffle %92 %92 0 1 
                                       f32_2 %94 = OpFMul %90 %93 
                              Uniform f32_4* %95 = OpAccessChain %20 %35 
                                       f32_4 %96 = OpLoad %95 
                                       f32_2 %97 = OpVectorShuffle %96 %96 2 3 
                                       f32_2 %98 = OpFAdd %94 %97 
                                                     OpStore vs_TEXCOORD0 %98 
                                Output f32* %100 = OpAccessChain %72 %22 %68 
                                        f32 %101 = OpLoad %100 
                                        f32 %102 = OpFNegate %101 
                                Output f32* %103 = OpAccessChain %72 %22 %68 
                                                     OpStore %103 %102 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 65
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %11 %38 %45 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %9 RelaxedPrecision 
                                             OpDecorate %11 RelaxedPrecision 
                                             OpDecorate %11 Location 11 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %13 RelaxedPrecision 
                                             OpDecorate %14 RelaxedPrecision 
                                             OpDecorate %15 RelaxedPrecision 
                                             OpMemberDecorate %16 0 RelaxedPrecision 
                                             OpMemberDecorate %16 0 Offset 16 
                                             OpDecorate %16 Block 
                                             OpDecorate %18 DescriptorSet 18 
                                             OpDecorate %18 Binding 18 
                                             OpDecorate %23 RelaxedPrecision 
                                             OpDecorate %24 RelaxedPrecision 
                                             OpDecorate %25 RelaxedPrecision 
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %28 DescriptorSet 28 
                                             OpDecorate %28 Binding 28 
                                             OpDecorate %29 RelaxedPrecision 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate %33 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 38 
                                             OpDecorate %41 RelaxedPrecision 
                                             OpDecorate %42 RelaxedPrecision 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %45 RelaxedPrecision 
                                             OpDecorate %45 Location 45 
                                             OpDecorate %50 RelaxedPrecision 
                                             OpDecorate %54 RelaxedPrecision 
                                             OpDecorate %57 RelaxedPrecision 
                                             OpDecorate %60 RelaxedPrecision 
                                             OpDecorate %61 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypePointer Input %7 
                        Input f32_4* %11 = OpVariable Input 
                                     %16 = OpTypeStruct %7 
                                     %17 = OpTypePointer Uniform %16 
            Uniform struct {f32_4;}* %18 = OpVariable Uniform 
                                     %19 = OpTypeInt 32 1 
                                 i32 %20 = OpConstant 0 
                                     %21 = OpTypePointer Uniform %7 
                      Private f32_4* %25 = OpVariable Private 
                                     %26 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %27 = OpTypePointer UniformConstant %26 
UniformConstant read_only Texture2D* %28 = OpVariable UniformConstant 
                                     %30 = OpTypeSampler 
                                     %31 = OpTypePointer UniformConstant %30 
            UniformConstant sampler* %32 = OpVariable UniformConstant 
                                     %34 = OpTypeSampledImage %26 
                                     %36 = OpTypeVector %6 2 
                                     %37 = OpTypePointer Input %36 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %44 = OpTypePointer Output %7 
                       Output f32_4* %45 = OpVariable Output 
                                     %46 = OpTypeInt 32 0 
                                 u32 %47 = OpConstant 3 
                                     %48 = OpTypePointer Private %6 
                                     %51 = OpTypePointer Output %6 
                                 f32 %55 = OpConstant 3.674022E-40 
                                 f32 %56 = OpConstant 3.674022E-40 
                                     %59 = OpTypeVector %6 3 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_4 %12 = OpLoad %11 
                               f32_4 %13 = OpLoad %11 
                               f32_4 %14 = OpFAdd %12 %13 
                                             OpStore %9 %14 
                               f32_4 %15 = OpLoad %9 
                      Uniform f32_4* %22 = OpAccessChain %18 %20 
                               f32_4 %23 = OpLoad %22 
                               f32_4 %24 = OpFMul %15 %23 
                                             OpStore %9 %24 
                 read_only Texture2D %29 = OpLoad %28 
                             sampler %33 = OpLoad %32 
          read_only Texture2DSampled %35 = OpSampledImage %29 %33 
                               f32_2 %39 = OpLoad vs_TEXCOORD0 
                               f32_4 %40 = OpImageSampleImplicitLod %35 %39 
                                             OpStore %25 %40 
                               f32_4 %41 = OpLoad %9 
                               f32_4 %42 = OpLoad %25 
                               f32_4 %43 = OpFMul %41 %42 
                                             OpStore %9 %43 
                        Private f32* %49 = OpAccessChain %9 %47 
                                 f32 %50 = OpLoad %49 
                         Output f32* %52 = OpAccessChain %45 %47 
                                             OpStore %52 %50 
                         Output f32* %53 = OpAccessChain %45 %47 
                                 f32 %54 = OpLoad %53 
                                 f32 %57 = OpExtInst %1 43 %54 %55 %56 
                         Output f32* %58 = OpAccessChain %45 %47 
                                             OpStore %58 %57 
                               f32_4 %60 = OpLoad %9 
                               f32_3 %61 = OpVectorShuffle %60 %60 0 1 2 
                               f32_4 %62 = OpLoad %45 
                               f32_4 %63 = OpVectorShuffle %62 %61 4 5 6 3 
                                             OpStore %45 %63 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "SOFTPARTICLES_ON" }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
    vs_TEXCOORD2.z = (-u_xlat0.x);
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.w = u_xlat1.w;
    vs_TEXCOORD2.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _TintColor;
uniform 	float _InvFade;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat0.x = texture(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.z);
    u_xlat0.x = u_xlat0.x * _InvFade;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.w = dot(vs_COLOR0.ww, u_xlat0.xx);
    u_xlat0.xyz = vs_COLOR0.xyz + vs_COLOR0.xyz;
    u_xlat0 = u_xlat0 * _TintColor;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat0 * u_xlat16_1;
    SV_Target0.w = u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SOFTPARTICLES_ON" }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
    vs_TEXCOORD2.z = (-u_xlat0.x);
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.w = u_xlat1.w;
    vs_TEXCOORD2.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _TintColor;
uniform 	float _InvFade;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat0.x = texture(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.z);
    u_xlat0.x = u_xlat0.x * _InvFade;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.w = dot(vs_COLOR0.ww, u_xlat0.xx);
    u_xlat0.xyz = vs_COLOR0.xyz + vs_COLOR0.xyz;
    u_xlat0 = u_xlat0 * _TintColor;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat0 * u_xlat16_1;
    SV_Target0.w = u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SOFTPARTICLES_ON" }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2 = u_xlat0.y * hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[0].z * u_xlat0.x + u_xlat2;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[2].z * u_xlat0.z + u_xlat0.x;
    u_xlat0.x = hlslcc_mtx4x4unity_MatrixV[3].z * u_xlat0.w + u_xlat0.x;
    vs_TEXCOORD2.z = (-u_xlat0.x);
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD2.w = u_xlat1.w;
    vs_TEXCOORD2.xy = u_xlat0.zz + u_xlat0.xw;
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
uniform 	mediump vec4 _TintColor;
uniform 	float _InvFade;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlat0.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat0.x = texture(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD2.z);
    u_xlat0.x = u_xlat0.x * _InvFade;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.w = dot(vs_COLOR0.ww, u_xlat0.xx);
    u_xlat0.xyz = vs_COLOR0.xyz + vs_COLOR0.xyz;
    u_xlat0 = u_xlat0 * _TintColor;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat0 * u_xlat16_1;
    SV_Target0.w = u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    SV_Target0.w = min(max(SV_Target0.w, 0.0), 1.0);
#else
    SV_Target0.w = clamp(SV_Target0.w, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "SOFTPARTICLES_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 177
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %84 %85 %89 %91 %139 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
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
                                                      OpMemberDecorate %78 0 BuiltIn 78 
                                                      OpMemberDecorate %78 1 BuiltIn 78 
                                                      OpMemberDecorate %78 2 BuiltIn 78 
                                                      OpDecorate %78 Block 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 89 
                                                      OpDecorate %91 Location 91 
                                                      OpDecorate vs_TEXCOORD2 Location 139 
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
                                              %19 = OpTypeStruct %7 %16 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                                          i32 %45 = OpConstant 3 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %76 = OpConstant 1 
                                              %77 = OpTypeArray %6 %76 
                                              %78 = OpTypeStruct %7 %6 %77 
                                              %79 = OpTypePointer Output %78 
         Output struct {f32_4; f32; f32[1];}* %80 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                Output f32_4* %84 = OpVariable Output 
                                 Input f32_4* %85 = OpVariable Input 
                                              %87 = OpTypeVector %6 2 
                                              %88 = OpTypePointer Output %87 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                              %90 = OpTypePointer Input %87 
                                 Input f32_2* %91 = OpVariable Input 
                                          i32 %93 = OpConstant 4 
                                             %102 = OpTypePointer Private %6 
                                Private f32* %103 = OpVariable Private 
                                         u32 %106 = OpConstant 2 
                                             %107 = OpTypePointer Uniform %6 
                                         u32 %113 = OpConstant 0 
                                         u32 %131 = OpConstant 3 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                             %143 = OpTypePointer Output %6 
                                         f32 %153 = OpConstant 3.674022E-40 
                                       f32_2 %158 = OpConstantComposite %153 %153 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %44 = OpLoad %9 
                               Uniform f32_4* %46 = OpAccessChain %21 %23 %45 
                                        f32_4 %47 = OpLoad %46 
                                        f32_4 %48 = OpFAdd %44 %47 
                                                      OpStore %9 %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %50 1 1 1 1 
                               Uniform f32_4* %52 = OpAccessChain %21 %45 %23 
                                        f32_4 %53 = OpLoad %52 
                                        f32_4 %54 = OpFMul %51 %53 
                                                      OpStore %49 %54 
                               Uniform f32_4* %55 = OpAccessChain %21 %45 %28 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                                        f32_4 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %49 
                                        f32_4 %61 = OpFAdd %59 %60 
                                                      OpStore %49 %61 
                               Uniform f32_4* %62 = OpAccessChain %21 %45 %36 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
                                        f32_4 %66 = OpFMul %63 %65 
                                        f32_4 %67 = OpLoad %49 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %49 %68 
                               Uniform f32_4* %69 = OpAccessChain %21 %45 %45 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_4 %72 = OpVectorShuffle %71 %71 3 3 3 3 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %49 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %49 %75 
                                        f32_4 %81 = OpLoad %49 
                                Output f32_4* %83 = OpAccessChain %80 %28 
                                                      OpStore %83 %81 
                                        f32_4 %86 = OpLoad %85 
                                                      OpStore %84 %86 
                                        f32_2 %92 = OpLoad %91 
                               Uniform f32_4* %94 = OpAccessChain %21 %93 
                                        f32_4 %95 = OpLoad %94 
                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                                        f32_2 %97 = OpFMul %92 %96 
                               Uniform f32_4* %98 = OpAccessChain %21 %93 
                                        f32_4 %99 = OpLoad %98 
                                       f32_2 %100 = OpVectorShuffle %99 %99 2 3 
                                       f32_2 %101 = OpFAdd %97 %100 
                                                      OpStore vs_TEXCOORD0 %101 
                                Private f32* %104 = OpAccessChain %9 %76 
                                         f32 %105 = OpLoad %104 
                                Uniform f32* %108 = OpAccessChain %21 %36 %23 %106 
                                         f32 %109 = OpLoad %108 
                                         f32 %110 = OpFMul %105 %109 
                                                      OpStore %103 %110 
                                Uniform f32* %111 = OpAccessChain %21 %36 %28 %106 
                                         f32 %112 = OpLoad %111 
                                Private f32* %114 = OpAccessChain %9 %113 
                                         f32 %115 = OpLoad %114 
                                         f32 %116 = OpFMul %112 %115 
                                         f32 %117 = OpLoad %103 
                                         f32 %118 = OpFAdd %116 %117 
                                Private f32* %119 = OpAccessChain %9 %113 
                                                      OpStore %119 %118 
                                Uniform f32* %120 = OpAccessChain %21 %36 %36 %106 
                                         f32 %121 = OpLoad %120 
                                Private f32* %122 = OpAccessChain %9 %106 
                                         f32 %123 = OpLoad %122 
                                         f32 %124 = OpFMul %121 %123 
                                Private f32* %125 = OpAccessChain %9 %113 
                                         f32 %126 = OpLoad %125 
                                         f32 %127 = OpFAdd %124 %126 
                                Private f32* %128 = OpAccessChain %9 %113 
                                                      OpStore %128 %127 
                                Uniform f32* %129 = OpAccessChain %21 %36 %45 %106 
                                         f32 %130 = OpLoad %129 
                                Private f32* %132 = OpAccessChain %9 %131 
                                         f32 %133 = OpLoad %132 
                                         f32 %134 = OpFMul %130 %133 
                                Private f32* %135 = OpAccessChain %9 %113 
                                         f32 %136 = OpLoad %135 
                                         f32 %137 = OpFAdd %134 %136 
                                Private f32* %138 = OpAccessChain %9 %113 
                                                      OpStore %138 %137 
                                Private f32* %140 = OpAccessChain %9 %113 
                                         f32 %141 = OpLoad %140 
                                         f32 %142 = OpFNegate %141 
                                 Output f32* %144 = OpAccessChain vs_TEXCOORD2 %106 
                                                      OpStore %144 %142 
                                Private f32* %145 = OpAccessChain %49 %76 
                                         f32 %146 = OpLoad %145 
                                Uniform f32* %147 = OpAccessChain %21 %28 %113 
                                         f32 %148 = OpLoad %147 
                                         f32 %149 = OpFMul %146 %148 
                                Private f32* %150 = OpAccessChain %9 %113 
                                                      OpStore %150 %149 
                                Private f32* %151 = OpAccessChain %9 %113 
                                         f32 %152 = OpLoad %151 
                                         f32 %154 = OpFMul %152 %153 
                                Private f32* %155 = OpAccessChain %9 %131 
                                                      OpStore %155 %154 
                                       f32_4 %156 = OpLoad %49 
                                       f32_2 %157 = OpVectorShuffle %156 %156 0 3 
                                       f32_2 %159 = OpFMul %157 %158 
                                       f32_4 %160 = OpLoad %9 
                                       f32_4 %161 = OpVectorShuffle %160 %159 4 1 5 3 
                                                      OpStore %9 %161 
                                Private f32* %162 = OpAccessChain %49 %131 
                                         f32 %163 = OpLoad %162 
                                 Output f32* %164 = OpAccessChain vs_TEXCOORD2 %131 
                                                      OpStore %164 %163 
                                       f32_4 %165 = OpLoad %9 
                                       f32_2 %166 = OpVectorShuffle %165 %165 2 2 
                                       f32_4 %167 = OpLoad %9 
                                       f32_2 %168 = OpVectorShuffle %167 %167 0 3 
                                       f32_2 %169 = OpFAdd %166 %168 
                                       f32_4 %170 = OpLoad vs_TEXCOORD2 
                                       f32_4 %171 = OpVectorShuffle %170 %169 4 5 2 3 
                                                      OpStore vs_TEXCOORD2 %171 
                                 Output f32* %172 = OpAccessChain %80 %28 %76 
                                         f32 %173 = OpLoad %172 
                                         f32 %174 = OpFNegate %173 
                                 Output f32* %175 = OpAccessChain %80 %28 %76 
                                                      OpStore %175 %174 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 129
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %11 %80 %108 %115 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate vs_TEXCOORD2 Location 11 
                                              OpDecorate %22 DescriptorSet 22 
                                              OpDecorate %22 Binding 22 
                                              OpDecorate %26 DescriptorSet 26 
                                              OpDecorate %26 Binding 26 
                                              OpMemberDecorate %38 0 Offset 38 
                                              OpMemberDecorate %38 1 RelaxedPrecision 
                                              OpMemberDecorate %38 1 Offset 38 
                                              OpMemberDecorate %38 2 Offset 38 
                                              OpDecorate %38 Block 
                                              OpDecorate %40 DescriptorSet 40 
                                              OpDecorate %40 Binding 40 
                                              OpDecorate %80 RelaxedPrecision 
                                              OpDecorate %80 Location 80 
                                              OpDecorate %81 RelaxedPrecision 
                                              OpDecorate %82 RelaxedPrecision 
                                              OpDecorate %88 RelaxedPrecision 
                                              OpDecorate %89 RelaxedPrecision 
                                              OpDecorate %90 RelaxedPrecision 
                                              OpDecorate %91 RelaxedPrecision 
                                              OpDecorate %92 RelaxedPrecision 
                                              OpDecorate %99 RelaxedPrecision 
                                              OpDecorate %101 RelaxedPrecision 
                                              OpDecorate %102 RelaxedPrecision 
                                              OpDecorate %102 DescriptorSet 102 
                                              OpDecorate %102 Binding 102 
                                              OpDecorate %103 RelaxedPrecision 
                                              OpDecorate %104 RelaxedPrecision 
                                              OpDecorate %104 DescriptorSet 104 
                                              OpDecorate %104 Binding 104 
                                              OpDecorate %105 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD0 Location 108 
                                              OpDecorate %112 RelaxedPrecision 
                                              OpDecorate %115 RelaxedPrecision 
                                              OpDecorate %115 Location 115 
                                              OpDecorate %121 RelaxedPrecision 
                                              OpDecorate %122 RelaxedPrecision 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypePointer Input %7 
                Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                      %12 = OpTypeVector %6 2 
                                      %20 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                      %21 = OpTypePointer UniformConstant %20 
 UniformConstant read_only Texture2D* %22 = OpVariable UniformConstant 
                                      %24 = OpTypeSampler 
                                      %25 = OpTypePointer UniformConstant %24 
             UniformConstant sampler* %26 = OpVariable UniformConstant 
                                      %28 = OpTypeSampledImage %20 
                                      %33 = OpTypeInt 32 0 
                                  u32 %34 = OpConstant 0 
                                      %36 = OpTypePointer Private %6 
                                      %38 = OpTypeStruct %7 %7 %6 
                                      %39 = OpTypePointer Uniform %38 
 Uniform struct {f32_4; f32_4; f32;}* %40 = OpVariable Uniform 
                                      %41 = OpTypeInt 32 1 
                                  i32 %42 = OpConstant 0 
                                  u32 %43 = OpConstant 2 
                                      %44 = OpTypePointer Uniform %6 
                                  u32 %50 = OpConstant 3 
                                  f32 %55 = OpConstant 3.674022E-40 
                                      %62 = OpTypePointer Input %6 
                                  i32 %70 = OpConstant 2 
                                  f32 %77 = OpConstant 3.674022E-40 
                         Input f32_4* %80 = OpVariable Input 
                                      %87 = OpTypeVector %6 3 
                                  i32 %96 = OpConstant 1 
                                      %97 = OpTypePointer Uniform %7 
                      Private f32_4* %101 = OpVariable Private 
UniformConstant read_only Texture2D* %102 = OpVariable UniformConstant 
            UniformConstant sampler* %104 = OpVariable UniformConstant 
                                     %107 = OpTypePointer Input %12 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %114 = OpTypePointer Output %7 
                       Output f32_4* %115 = OpVariable Output 
                                     %118 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %13 = OpLoad vs_TEXCOORD2 
                                f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                                f32_4 %15 = OpLoad vs_TEXCOORD2 
                                f32_2 %16 = OpVectorShuffle %15 %15 3 3 
                                f32_2 %17 = OpFDiv %14 %16 
                                f32_4 %18 = OpLoad %9 
                                f32_4 %19 = OpVectorShuffle %18 %17 4 5 2 3 
                                              OpStore %9 %19 
                  read_only Texture2D %23 = OpLoad %22 
                              sampler %27 = OpLoad %26 
           read_only Texture2DSampled %29 = OpSampledImage %23 %27 
                                f32_4 %30 = OpLoad %9 
                                f32_2 %31 = OpVectorShuffle %30 %30 0 1 
                                f32_4 %32 = OpImageSampleImplicitLod %29 %31 
                                  f32 %35 = OpCompositeExtract %32 0 
                         Private f32* %37 = OpAccessChain %9 %34 
                                              OpStore %37 %35 
                         Uniform f32* %45 = OpAccessChain %40 %42 %43 
                                  f32 %46 = OpLoad %45 
                         Private f32* %47 = OpAccessChain %9 %34 
                                  f32 %48 = OpLoad %47 
                                  f32 %49 = OpFMul %46 %48 
                         Uniform f32* %51 = OpAccessChain %40 %42 %50 
                                  f32 %52 = OpLoad %51 
                                  f32 %53 = OpFAdd %49 %52 
                         Private f32* %54 = OpAccessChain %9 %34 
                                              OpStore %54 %53 
                         Private f32* %56 = OpAccessChain %9 %34 
                                  f32 %57 = OpLoad %56 
                                  f32 %58 = OpFDiv %55 %57 
                         Private f32* %59 = OpAccessChain %9 %34 
                                              OpStore %59 %58 
                         Private f32* %60 = OpAccessChain %9 %34 
                                  f32 %61 = OpLoad %60 
                           Input f32* %63 = OpAccessChain vs_TEXCOORD2 %43 
                                  f32 %64 = OpLoad %63 
                                  f32 %65 = OpFNegate %64 
                                  f32 %66 = OpFAdd %61 %65 
                         Private f32* %67 = OpAccessChain %9 %34 
                                              OpStore %67 %66 
                         Private f32* %68 = OpAccessChain %9 %34 
                                  f32 %69 = OpLoad %68 
                         Uniform f32* %71 = OpAccessChain %40 %70 
                                  f32 %72 = OpLoad %71 
                                  f32 %73 = OpFMul %69 %72 
                         Private f32* %74 = OpAccessChain %9 %34 
                                              OpStore %74 %73 
                         Private f32* %75 = OpAccessChain %9 %34 
                                  f32 %76 = OpLoad %75 
                                  f32 %78 = OpExtInst %1 43 %76 %77 %55 
                         Private f32* %79 = OpAccessChain %9 %34 
                                              OpStore %79 %78 
                                f32_4 %81 = OpLoad %80 
                                f32_2 %82 = OpVectorShuffle %81 %81 3 3 
                                f32_4 %83 = OpLoad %9 
                                f32_2 %84 = OpVectorShuffle %83 %83 0 0 
                                  f32 %85 = OpDot %82 %84 
                         Private f32* %86 = OpAccessChain %9 %50 
                                              OpStore %86 %85 
                                f32_4 %88 = OpLoad %80 
                                f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                f32_4 %90 = OpLoad %80 
                                f32_3 %91 = OpVectorShuffle %90 %90 0 1 2 
                                f32_3 %92 = OpFAdd %89 %91 
                                f32_4 %93 = OpLoad %9 
                                f32_4 %94 = OpVectorShuffle %93 %92 4 5 6 3 
                                              OpStore %9 %94 
                                f32_4 %95 = OpLoad %9 
                       Uniform f32_4* %98 = OpAccessChain %40 %96 
                                f32_4 %99 = OpLoad %98 
                               f32_4 %100 = OpFMul %95 %99 
                                              OpStore %9 %100 
                 read_only Texture2D %103 = OpLoad %102 
                             sampler %105 = OpLoad %104 
          read_only Texture2DSampled %106 = OpSampledImage %103 %105 
                               f32_2 %109 = OpLoad vs_TEXCOORD0 
                               f32_4 %110 = OpImageSampleImplicitLod %106 %109 
                                              OpStore %101 %110 
                               f32_4 %111 = OpLoad %9 
                               f32_4 %112 = OpLoad %101 
                               f32_4 %113 = OpFMul %111 %112 
                                              OpStore %9 %113 
                        Private f32* %116 = OpAccessChain %9 %50 
                                 f32 %117 = OpLoad %116 
                         Output f32* %119 = OpAccessChain %115 %50 
                                              OpStore %119 %117 
                         Output f32* %120 = OpAccessChain %115 %50 
                                 f32 %121 = OpLoad %120 
                                 f32 %122 = OpExtInst %1 43 %121 %77 %55 
                         Output f32* %123 = OpAccessChain %115 %50 
                                              OpStore %123 %122 
                               f32_4 %124 = OpLoad %9 
                               f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                               f32_4 %126 = OpLoad %115 
                               f32_4 %127 = OpVectorShuffle %126 %125 4 5 6 3 
                                              OpStore %115 %127 
                                              OpReturn
                                              OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "SOFTPARTICLES_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 177
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %84 %85 %89 %91 %139 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
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
                                                      OpMemberDecorate %78 0 BuiltIn 78 
                                                      OpMemberDecorate %78 1 BuiltIn 78 
                                                      OpMemberDecorate %78 2 BuiltIn 78 
                                                      OpDecorate %78 Block 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 89 
                                                      OpDecorate %91 Location 91 
                                                      OpDecorate vs_TEXCOORD2 Location 139 
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
                                              %19 = OpTypeStruct %7 %16 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                                          i32 %45 = OpConstant 3 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %76 = OpConstant 1 
                                              %77 = OpTypeArray %6 %76 
                                              %78 = OpTypeStruct %7 %6 %77 
                                              %79 = OpTypePointer Output %78 
         Output struct {f32_4; f32; f32[1];}* %80 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                Output f32_4* %84 = OpVariable Output 
                                 Input f32_4* %85 = OpVariable Input 
                                              %87 = OpTypeVector %6 2 
                                              %88 = OpTypePointer Output %87 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                              %90 = OpTypePointer Input %87 
                                 Input f32_2* %91 = OpVariable Input 
                                          i32 %93 = OpConstant 4 
                                             %102 = OpTypePointer Private %6 
                                Private f32* %103 = OpVariable Private 
                                         u32 %106 = OpConstant 2 
                                             %107 = OpTypePointer Uniform %6 
                                         u32 %113 = OpConstant 0 
                                         u32 %131 = OpConstant 3 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                             %143 = OpTypePointer Output %6 
                                         f32 %153 = OpConstant 3.674022E-40 
                                       f32_2 %158 = OpConstantComposite %153 %153 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %44 = OpLoad %9 
                               Uniform f32_4* %46 = OpAccessChain %21 %23 %45 
                                        f32_4 %47 = OpLoad %46 
                                        f32_4 %48 = OpFAdd %44 %47 
                                                      OpStore %9 %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %50 1 1 1 1 
                               Uniform f32_4* %52 = OpAccessChain %21 %45 %23 
                                        f32_4 %53 = OpLoad %52 
                                        f32_4 %54 = OpFMul %51 %53 
                                                      OpStore %49 %54 
                               Uniform f32_4* %55 = OpAccessChain %21 %45 %28 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                                        f32_4 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %49 
                                        f32_4 %61 = OpFAdd %59 %60 
                                                      OpStore %49 %61 
                               Uniform f32_4* %62 = OpAccessChain %21 %45 %36 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
                                        f32_4 %66 = OpFMul %63 %65 
                                        f32_4 %67 = OpLoad %49 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %49 %68 
                               Uniform f32_4* %69 = OpAccessChain %21 %45 %45 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_4 %72 = OpVectorShuffle %71 %71 3 3 3 3 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %49 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %49 %75 
                                        f32_4 %81 = OpLoad %49 
                                Output f32_4* %83 = OpAccessChain %80 %28 
                                                      OpStore %83 %81 
                                        f32_4 %86 = OpLoad %85 
                                                      OpStore %84 %86 
                                        f32_2 %92 = OpLoad %91 
                               Uniform f32_4* %94 = OpAccessChain %21 %93 
                                        f32_4 %95 = OpLoad %94 
                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                                        f32_2 %97 = OpFMul %92 %96 
                               Uniform f32_4* %98 = OpAccessChain %21 %93 
                                        f32_4 %99 = OpLoad %98 
                                       f32_2 %100 = OpVectorShuffle %99 %99 2 3 
                                       f32_2 %101 = OpFAdd %97 %100 
                                                      OpStore vs_TEXCOORD0 %101 
                                Private f32* %104 = OpAccessChain %9 %76 
                                         f32 %105 = OpLoad %104 
                                Uniform f32* %108 = OpAccessChain %21 %36 %23 %106 
                                         f32 %109 = OpLoad %108 
                                         f32 %110 = OpFMul %105 %109 
                                                      OpStore %103 %110 
                                Uniform f32* %111 = OpAccessChain %21 %36 %28 %106 
                                         f32 %112 = OpLoad %111 
                                Private f32* %114 = OpAccessChain %9 %113 
                                         f32 %115 = OpLoad %114 
                                         f32 %116 = OpFMul %112 %115 
                                         f32 %117 = OpLoad %103 
                                         f32 %118 = OpFAdd %116 %117 
                                Private f32* %119 = OpAccessChain %9 %113 
                                                      OpStore %119 %118 
                                Uniform f32* %120 = OpAccessChain %21 %36 %36 %106 
                                         f32 %121 = OpLoad %120 
                                Private f32* %122 = OpAccessChain %9 %106 
                                         f32 %123 = OpLoad %122 
                                         f32 %124 = OpFMul %121 %123 
                                Private f32* %125 = OpAccessChain %9 %113 
                                         f32 %126 = OpLoad %125 
                                         f32 %127 = OpFAdd %124 %126 
                                Private f32* %128 = OpAccessChain %9 %113 
                                                      OpStore %128 %127 
                                Uniform f32* %129 = OpAccessChain %21 %36 %45 %106 
                                         f32 %130 = OpLoad %129 
                                Private f32* %132 = OpAccessChain %9 %131 
                                         f32 %133 = OpLoad %132 
                                         f32 %134 = OpFMul %130 %133 
                                Private f32* %135 = OpAccessChain %9 %113 
                                         f32 %136 = OpLoad %135 
                                         f32 %137 = OpFAdd %134 %136 
                                Private f32* %138 = OpAccessChain %9 %113 
                                                      OpStore %138 %137 
                                Private f32* %140 = OpAccessChain %9 %113 
                                         f32 %141 = OpLoad %140 
                                         f32 %142 = OpFNegate %141 
                                 Output f32* %144 = OpAccessChain vs_TEXCOORD2 %106 
                                                      OpStore %144 %142 
                                Private f32* %145 = OpAccessChain %49 %76 
                                         f32 %146 = OpLoad %145 
                                Uniform f32* %147 = OpAccessChain %21 %28 %113 
                                         f32 %148 = OpLoad %147 
                                         f32 %149 = OpFMul %146 %148 
                                Private f32* %150 = OpAccessChain %9 %113 
                                                      OpStore %150 %149 
                                Private f32* %151 = OpAccessChain %9 %113 
                                         f32 %152 = OpLoad %151 
                                         f32 %154 = OpFMul %152 %153 
                                Private f32* %155 = OpAccessChain %9 %131 
                                                      OpStore %155 %154 
                                       f32_4 %156 = OpLoad %49 
                                       f32_2 %157 = OpVectorShuffle %156 %156 0 3 
                                       f32_2 %159 = OpFMul %157 %158 
                                       f32_4 %160 = OpLoad %9 
                                       f32_4 %161 = OpVectorShuffle %160 %159 4 1 5 3 
                                                      OpStore %9 %161 
                                Private f32* %162 = OpAccessChain %49 %131 
                                         f32 %163 = OpLoad %162 
                                 Output f32* %164 = OpAccessChain vs_TEXCOORD2 %131 
                                                      OpStore %164 %163 
                                       f32_4 %165 = OpLoad %9 
                                       f32_2 %166 = OpVectorShuffle %165 %165 2 2 
                                       f32_4 %167 = OpLoad %9 
                                       f32_2 %168 = OpVectorShuffle %167 %167 0 3 
                                       f32_2 %169 = OpFAdd %166 %168 
                                       f32_4 %170 = OpLoad vs_TEXCOORD2 
                                       f32_4 %171 = OpVectorShuffle %170 %169 4 5 2 3 
                                                      OpStore vs_TEXCOORD2 %171 
                                 Output f32* %172 = OpAccessChain %80 %28 %76 
                                         f32 %173 = OpLoad %172 
                                         f32 %174 = OpFNegate %173 
                                 Output f32* %175 = OpAccessChain %80 %28 %76 
                                                      OpStore %175 %174 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 129
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %11 %80 %108 %115 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate vs_TEXCOORD2 Location 11 
                                              OpDecorate %22 DescriptorSet 22 
                                              OpDecorate %22 Binding 22 
                                              OpDecorate %26 DescriptorSet 26 
                                              OpDecorate %26 Binding 26 
                                              OpMemberDecorate %38 0 Offset 38 
                                              OpMemberDecorate %38 1 RelaxedPrecision 
                                              OpMemberDecorate %38 1 Offset 38 
                                              OpMemberDecorate %38 2 Offset 38 
                                              OpDecorate %38 Block 
                                              OpDecorate %40 DescriptorSet 40 
                                              OpDecorate %40 Binding 40 
                                              OpDecorate %80 RelaxedPrecision 
                                              OpDecorate %80 Location 80 
                                              OpDecorate %81 RelaxedPrecision 
                                              OpDecorate %82 RelaxedPrecision 
                                              OpDecorate %88 RelaxedPrecision 
                                              OpDecorate %89 RelaxedPrecision 
                                              OpDecorate %90 RelaxedPrecision 
                                              OpDecorate %91 RelaxedPrecision 
                                              OpDecorate %92 RelaxedPrecision 
                                              OpDecorate %99 RelaxedPrecision 
                                              OpDecorate %101 RelaxedPrecision 
                                              OpDecorate %102 RelaxedPrecision 
                                              OpDecorate %102 DescriptorSet 102 
                                              OpDecorate %102 Binding 102 
                                              OpDecorate %103 RelaxedPrecision 
                                              OpDecorate %104 RelaxedPrecision 
                                              OpDecorate %104 DescriptorSet 104 
                                              OpDecorate %104 Binding 104 
                                              OpDecorate %105 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD0 Location 108 
                                              OpDecorate %112 RelaxedPrecision 
                                              OpDecorate %115 RelaxedPrecision 
                                              OpDecorate %115 Location 115 
                                              OpDecorate %121 RelaxedPrecision 
                                              OpDecorate %122 RelaxedPrecision 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypePointer Input %7 
                Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                      %12 = OpTypeVector %6 2 
                                      %20 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                      %21 = OpTypePointer UniformConstant %20 
 UniformConstant read_only Texture2D* %22 = OpVariable UniformConstant 
                                      %24 = OpTypeSampler 
                                      %25 = OpTypePointer UniformConstant %24 
             UniformConstant sampler* %26 = OpVariable UniformConstant 
                                      %28 = OpTypeSampledImage %20 
                                      %33 = OpTypeInt 32 0 
                                  u32 %34 = OpConstant 0 
                                      %36 = OpTypePointer Private %6 
                                      %38 = OpTypeStruct %7 %7 %6 
                                      %39 = OpTypePointer Uniform %38 
 Uniform struct {f32_4; f32_4; f32;}* %40 = OpVariable Uniform 
                                      %41 = OpTypeInt 32 1 
                                  i32 %42 = OpConstant 0 
                                  u32 %43 = OpConstant 2 
                                      %44 = OpTypePointer Uniform %6 
                                  u32 %50 = OpConstant 3 
                                  f32 %55 = OpConstant 3.674022E-40 
                                      %62 = OpTypePointer Input %6 
                                  i32 %70 = OpConstant 2 
                                  f32 %77 = OpConstant 3.674022E-40 
                         Input f32_4* %80 = OpVariable Input 
                                      %87 = OpTypeVector %6 3 
                                  i32 %96 = OpConstant 1 
                                      %97 = OpTypePointer Uniform %7 
                      Private f32_4* %101 = OpVariable Private 
UniformConstant read_only Texture2D* %102 = OpVariable UniformConstant 
            UniformConstant sampler* %104 = OpVariable UniformConstant 
                                     %107 = OpTypePointer Input %12 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %114 = OpTypePointer Output %7 
                       Output f32_4* %115 = OpVariable Output 
                                     %118 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %13 = OpLoad vs_TEXCOORD2 
                                f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                                f32_4 %15 = OpLoad vs_TEXCOORD2 
                                f32_2 %16 = OpVectorShuffle %15 %15 3 3 
                                f32_2 %17 = OpFDiv %14 %16 
                                f32_4 %18 = OpLoad %9 
                                f32_4 %19 = OpVectorShuffle %18 %17 4 5 2 3 
                                              OpStore %9 %19 
                  read_only Texture2D %23 = OpLoad %22 
                              sampler %27 = OpLoad %26 
           read_only Texture2DSampled %29 = OpSampledImage %23 %27 
                                f32_4 %30 = OpLoad %9 
                                f32_2 %31 = OpVectorShuffle %30 %30 0 1 
                                f32_4 %32 = OpImageSampleImplicitLod %29 %31 
                                  f32 %35 = OpCompositeExtract %32 0 
                         Private f32* %37 = OpAccessChain %9 %34 
                                              OpStore %37 %35 
                         Uniform f32* %45 = OpAccessChain %40 %42 %43 
                                  f32 %46 = OpLoad %45 
                         Private f32* %47 = OpAccessChain %9 %34 
                                  f32 %48 = OpLoad %47 
                                  f32 %49 = OpFMul %46 %48 
                         Uniform f32* %51 = OpAccessChain %40 %42 %50 
                                  f32 %52 = OpLoad %51 
                                  f32 %53 = OpFAdd %49 %52 
                         Private f32* %54 = OpAccessChain %9 %34 
                                              OpStore %54 %53 
                         Private f32* %56 = OpAccessChain %9 %34 
                                  f32 %57 = OpLoad %56 
                                  f32 %58 = OpFDiv %55 %57 
                         Private f32* %59 = OpAccessChain %9 %34 
                                              OpStore %59 %58 
                         Private f32* %60 = OpAccessChain %9 %34 
                                  f32 %61 = OpLoad %60 
                           Input f32* %63 = OpAccessChain vs_TEXCOORD2 %43 
                                  f32 %64 = OpLoad %63 
                                  f32 %65 = OpFNegate %64 
                                  f32 %66 = OpFAdd %61 %65 
                         Private f32* %67 = OpAccessChain %9 %34 
                                              OpStore %67 %66 
                         Private f32* %68 = OpAccessChain %9 %34 
                                  f32 %69 = OpLoad %68 
                         Uniform f32* %71 = OpAccessChain %40 %70 
                                  f32 %72 = OpLoad %71 
                                  f32 %73 = OpFMul %69 %72 
                         Private f32* %74 = OpAccessChain %9 %34 
                                              OpStore %74 %73 
                         Private f32* %75 = OpAccessChain %9 %34 
                                  f32 %76 = OpLoad %75 
                                  f32 %78 = OpExtInst %1 43 %76 %77 %55 
                         Private f32* %79 = OpAccessChain %9 %34 
                                              OpStore %79 %78 
                                f32_4 %81 = OpLoad %80 
                                f32_2 %82 = OpVectorShuffle %81 %81 3 3 
                                f32_4 %83 = OpLoad %9 
                                f32_2 %84 = OpVectorShuffle %83 %83 0 0 
                                  f32 %85 = OpDot %82 %84 
                         Private f32* %86 = OpAccessChain %9 %50 
                                              OpStore %86 %85 
                                f32_4 %88 = OpLoad %80 
                                f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                f32_4 %90 = OpLoad %80 
                                f32_3 %91 = OpVectorShuffle %90 %90 0 1 2 
                                f32_3 %92 = OpFAdd %89 %91 
                                f32_4 %93 = OpLoad %9 
                                f32_4 %94 = OpVectorShuffle %93 %92 4 5 6 3 
                                              OpStore %9 %94 
                                f32_4 %95 = OpLoad %9 
                       Uniform f32_4* %98 = OpAccessChain %40 %96 
                                f32_4 %99 = OpLoad %98 
                               f32_4 %100 = OpFMul %95 %99 
                                              OpStore %9 %100 
                 read_only Texture2D %103 = OpLoad %102 
                             sampler %105 = OpLoad %104 
          read_only Texture2DSampled %106 = OpSampledImage %103 %105 
                               f32_2 %109 = OpLoad vs_TEXCOORD0 
                               f32_4 %110 = OpImageSampleImplicitLod %106 %109 
                                              OpStore %101 %110 
                               f32_4 %111 = OpLoad %9 
                               f32_4 %112 = OpLoad %101 
                               f32_4 %113 = OpFMul %111 %112 
                                              OpStore %9 %113 
                        Private f32* %116 = OpAccessChain %9 %50 
                                 f32 %117 = OpLoad %116 
                         Output f32* %119 = OpAccessChain %115 %50 
                                              OpStore %119 %117 
                         Output f32* %120 = OpAccessChain %115 %50 
                                 f32 %121 = OpLoad %120 
                                 f32 %122 = OpExtInst %1 43 %121 %77 %55 
                         Output f32* %123 = OpAccessChain %115 %50 
                                              OpStore %123 %122 
                               f32_4 %124 = OpLoad %9 
                               f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                               f32_4 %126 = OpLoad %115 
                               f32_4 %127 = OpVectorShuffle %126 %125 4 5 6 3 
                                              OpStore %115 %127 
                                              OpReturn
                                              OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "SOFTPARTICLES_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 177
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %84 %85 %89 %91 %139 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
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
                                                      OpMemberDecorate %78 0 BuiltIn 78 
                                                      OpMemberDecorate %78 1 BuiltIn 78 
                                                      OpMemberDecorate %78 2 BuiltIn 78 
                                                      OpDecorate %78 Block 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 89 
                                                      OpDecorate %91 Location 91 
                                                      OpDecorate vs_TEXCOORD2 Location 139 
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
                                              %19 = OpTypeStruct %7 %16 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                                          i32 %45 = OpConstant 3 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %76 = OpConstant 1 
                                              %77 = OpTypeArray %6 %76 
                                              %78 = OpTypeStruct %7 %6 %77 
                                              %79 = OpTypePointer Output %78 
         Output struct {f32_4; f32; f32[1];}* %80 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                Output f32_4* %84 = OpVariable Output 
                                 Input f32_4* %85 = OpVariable Input 
                                              %87 = OpTypeVector %6 2 
                                              %88 = OpTypePointer Output %87 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                              %90 = OpTypePointer Input %87 
                                 Input f32_2* %91 = OpVariable Input 
                                          i32 %93 = OpConstant 4 
                                             %102 = OpTypePointer Private %6 
                                Private f32* %103 = OpVariable Private 
                                         u32 %106 = OpConstant 2 
                                             %107 = OpTypePointer Uniform %6 
                                         u32 %113 = OpConstant 0 
                                         u32 %131 = OpConstant 3 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                             %143 = OpTypePointer Output %6 
                                         f32 %153 = OpConstant 3.674022E-40 
                                       f32_2 %158 = OpConstantComposite %153 %153 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %44 = OpLoad %9 
                               Uniform f32_4* %46 = OpAccessChain %21 %23 %45 
                                        f32_4 %47 = OpLoad %46 
                                        f32_4 %48 = OpFAdd %44 %47 
                                                      OpStore %9 %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %50 1 1 1 1 
                               Uniform f32_4* %52 = OpAccessChain %21 %45 %23 
                                        f32_4 %53 = OpLoad %52 
                                        f32_4 %54 = OpFMul %51 %53 
                                                      OpStore %49 %54 
                               Uniform f32_4* %55 = OpAccessChain %21 %45 %28 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                                        f32_4 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %49 
                                        f32_4 %61 = OpFAdd %59 %60 
                                                      OpStore %49 %61 
                               Uniform f32_4* %62 = OpAccessChain %21 %45 %36 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
                                        f32_4 %66 = OpFMul %63 %65 
                                        f32_4 %67 = OpLoad %49 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %49 %68 
                               Uniform f32_4* %69 = OpAccessChain %21 %45 %45 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_4 %72 = OpVectorShuffle %71 %71 3 3 3 3 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %49 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %49 %75 
                                        f32_4 %81 = OpLoad %49 
                                Output f32_4* %83 = OpAccessChain %80 %28 
                                                      OpStore %83 %81 
                                        f32_4 %86 = OpLoad %85 
                                                      OpStore %84 %86 
                                        f32_2 %92 = OpLoad %91 
                               Uniform f32_4* %94 = OpAccessChain %21 %93 
                                        f32_4 %95 = OpLoad %94 
                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                                        f32_2 %97 = OpFMul %92 %96 
                               Uniform f32_4* %98 = OpAccessChain %21 %93 
                                        f32_4 %99 = OpLoad %98 
                                       f32_2 %100 = OpVectorShuffle %99 %99 2 3 
                                       f32_2 %101 = OpFAdd %97 %100 
                                                      OpStore vs_TEXCOORD0 %101 
                                Private f32* %104 = OpAccessChain %9 %76 
                                         f32 %105 = OpLoad %104 
                                Uniform f32* %108 = OpAccessChain %21 %36 %23 %106 
                                         f32 %109 = OpLoad %108 
                                         f32 %110 = OpFMul %105 %109 
                                                      OpStore %103 %110 
                                Uniform f32* %111 = OpAccessChain %21 %36 %28 %106 
                                         f32 %112 = OpLoad %111 
                                Private f32* %114 = OpAccessChain %9 %113 
                                         f32 %115 = OpLoad %114 
                                         f32 %116 = OpFMul %112 %115 
                                         f32 %117 = OpLoad %103 
                                         f32 %118 = OpFAdd %116 %117 
                                Private f32* %119 = OpAccessChain %9 %113 
                                                      OpStore %119 %118 
                                Uniform f32* %120 = OpAccessChain %21 %36 %36 %106 
                                         f32 %121 = OpLoad %120 
                                Private f32* %122 = OpAccessChain %9 %106 
                                         f32 %123 = OpLoad %122 
                                         f32 %124 = OpFMul %121 %123 
                                Private f32* %125 = OpAccessChain %9 %113 
                                         f32 %126 = OpLoad %125 
                                         f32 %127 = OpFAdd %124 %126 
                                Private f32* %128 = OpAccessChain %9 %113 
                                                      OpStore %128 %127 
                                Uniform f32* %129 = OpAccessChain %21 %36 %45 %106 
                                         f32 %130 = OpLoad %129 
                                Private f32* %132 = OpAccessChain %9 %131 
                                         f32 %133 = OpLoad %132 
                                         f32 %134 = OpFMul %130 %133 
                                Private f32* %135 = OpAccessChain %9 %113 
                                         f32 %136 = OpLoad %135 
                                         f32 %137 = OpFAdd %134 %136 
                                Private f32* %138 = OpAccessChain %9 %113 
                                                      OpStore %138 %137 
                                Private f32* %140 = OpAccessChain %9 %113 
                                         f32 %141 = OpLoad %140 
                                         f32 %142 = OpFNegate %141 
                                 Output f32* %144 = OpAccessChain vs_TEXCOORD2 %106 
                                                      OpStore %144 %142 
                                Private f32* %145 = OpAccessChain %49 %76 
                                         f32 %146 = OpLoad %145 
                                Uniform f32* %147 = OpAccessChain %21 %28 %113 
                                         f32 %148 = OpLoad %147 
                                         f32 %149 = OpFMul %146 %148 
                                Private f32* %150 = OpAccessChain %9 %113 
                                                      OpStore %150 %149 
                                Private f32* %151 = OpAccessChain %9 %113 
                                         f32 %152 = OpLoad %151 
                                         f32 %154 = OpFMul %152 %153 
                                Private f32* %155 = OpAccessChain %9 %131 
                                                      OpStore %155 %154 
                                       f32_4 %156 = OpLoad %49 
                                       f32_2 %157 = OpVectorShuffle %156 %156 0 3 
                                       f32_2 %159 = OpFMul %157 %158 
                                       f32_4 %160 = OpLoad %9 
                                       f32_4 %161 = OpVectorShuffle %160 %159 4 1 5 3 
                                                      OpStore %9 %161 
                                Private f32* %162 = OpAccessChain %49 %131 
                                         f32 %163 = OpLoad %162 
                                 Output f32* %164 = OpAccessChain vs_TEXCOORD2 %131 
                                                      OpStore %164 %163 
                                       f32_4 %165 = OpLoad %9 
                                       f32_2 %166 = OpVectorShuffle %165 %165 2 2 
                                       f32_4 %167 = OpLoad %9 
                                       f32_2 %168 = OpVectorShuffle %167 %167 0 3 
                                       f32_2 %169 = OpFAdd %166 %168 
                                       f32_4 %170 = OpLoad vs_TEXCOORD2 
                                       f32_4 %171 = OpVectorShuffle %170 %169 4 5 2 3 
                                                      OpStore vs_TEXCOORD2 %171 
                                 Output f32* %172 = OpAccessChain %80 %28 %76 
                                         f32 %173 = OpLoad %172 
                                         f32 %174 = OpFNegate %173 
                                 Output f32* %175 = OpAccessChain %80 %28 %76 
                                                      OpStore %175 %174 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 129
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %11 %80 %108 %115 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate vs_TEXCOORD2 Location 11 
                                              OpDecorate %22 DescriptorSet 22 
                                              OpDecorate %22 Binding 22 
                                              OpDecorate %26 DescriptorSet 26 
                                              OpDecorate %26 Binding 26 
                                              OpMemberDecorate %38 0 Offset 38 
                                              OpMemberDecorate %38 1 RelaxedPrecision 
                                              OpMemberDecorate %38 1 Offset 38 
                                              OpMemberDecorate %38 2 Offset 38 
                                              OpDecorate %38 Block 
                                              OpDecorate %40 DescriptorSet 40 
                                              OpDecorate %40 Binding 40 
                                              OpDecorate %80 RelaxedPrecision 
                                              OpDecorate %80 Location 80 
                                              OpDecorate %81 RelaxedPrecision 
                                              OpDecorate %82 RelaxedPrecision 
                                              OpDecorate %88 RelaxedPrecision 
                                              OpDecorate %89 RelaxedPrecision 
                                              OpDecorate %90 RelaxedPrecision 
                                              OpDecorate %91 RelaxedPrecision 
                                              OpDecorate %92 RelaxedPrecision 
                                              OpDecorate %99 RelaxedPrecision 
                                              OpDecorate %101 RelaxedPrecision 
                                              OpDecorate %102 RelaxedPrecision 
                                              OpDecorate %102 DescriptorSet 102 
                                              OpDecorate %102 Binding 102 
                                              OpDecorate %103 RelaxedPrecision 
                                              OpDecorate %104 RelaxedPrecision 
                                              OpDecorate %104 DescriptorSet 104 
                                              OpDecorate %104 Binding 104 
                                              OpDecorate %105 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD0 Location 108 
                                              OpDecorate %112 RelaxedPrecision 
                                              OpDecorate %115 RelaxedPrecision 
                                              OpDecorate %115 Location 115 
                                              OpDecorate %121 RelaxedPrecision 
                                              OpDecorate %122 RelaxedPrecision 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 4 
                                       %8 = OpTypePointer Private %7 
                        Private f32_4* %9 = OpVariable Private 
                                      %10 = OpTypePointer Input %7 
                Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                      %12 = OpTypeVector %6 2 
                                      %20 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                      %21 = OpTypePointer UniformConstant %20 
 UniformConstant read_only Texture2D* %22 = OpVariable UniformConstant 
                                      %24 = OpTypeSampler 
                                      %25 = OpTypePointer UniformConstant %24 
             UniformConstant sampler* %26 = OpVariable UniformConstant 
                                      %28 = OpTypeSampledImage %20 
                                      %33 = OpTypeInt 32 0 
                                  u32 %34 = OpConstant 0 
                                      %36 = OpTypePointer Private %6 
                                      %38 = OpTypeStruct %7 %7 %6 
                                      %39 = OpTypePointer Uniform %38 
 Uniform struct {f32_4; f32_4; f32;}* %40 = OpVariable Uniform 
                                      %41 = OpTypeInt 32 1 
                                  i32 %42 = OpConstant 0 
                                  u32 %43 = OpConstant 2 
                                      %44 = OpTypePointer Uniform %6 
                                  u32 %50 = OpConstant 3 
                                  f32 %55 = OpConstant 3.674022E-40 
                                      %62 = OpTypePointer Input %6 
                                  i32 %70 = OpConstant 2 
                                  f32 %77 = OpConstant 3.674022E-40 
                         Input f32_4* %80 = OpVariable Input 
                                      %87 = OpTypeVector %6 3 
                                  i32 %96 = OpConstant 1 
                                      %97 = OpTypePointer Uniform %7 
                      Private f32_4* %101 = OpVariable Private 
UniformConstant read_only Texture2D* %102 = OpVariable UniformConstant 
            UniformConstant sampler* %104 = OpVariable UniformConstant 
                                     %107 = OpTypePointer Input %12 
                Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %114 = OpTypePointer Output %7 
                       Output f32_4* %115 = OpVariable Output 
                                     %118 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %13 = OpLoad vs_TEXCOORD2 
                                f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                                f32_4 %15 = OpLoad vs_TEXCOORD2 
                                f32_2 %16 = OpVectorShuffle %15 %15 3 3 
                                f32_2 %17 = OpFDiv %14 %16 
                                f32_4 %18 = OpLoad %9 
                                f32_4 %19 = OpVectorShuffle %18 %17 4 5 2 3 
                                              OpStore %9 %19 
                  read_only Texture2D %23 = OpLoad %22 
                              sampler %27 = OpLoad %26 
           read_only Texture2DSampled %29 = OpSampledImage %23 %27 
                                f32_4 %30 = OpLoad %9 
                                f32_2 %31 = OpVectorShuffle %30 %30 0 1 
                                f32_4 %32 = OpImageSampleImplicitLod %29 %31 
                                  f32 %35 = OpCompositeExtract %32 0 
                         Private f32* %37 = OpAccessChain %9 %34 
                                              OpStore %37 %35 
                         Uniform f32* %45 = OpAccessChain %40 %42 %43 
                                  f32 %46 = OpLoad %45 
                         Private f32* %47 = OpAccessChain %9 %34 
                                  f32 %48 = OpLoad %47 
                                  f32 %49 = OpFMul %46 %48 
                         Uniform f32* %51 = OpAccessChain %40 %42 %50 
                                  f32 %52 = OpLoad %51 
                                  f32 %53 = OpFAdd %49 %52 
                         Private f32* %54 = OpAccessChain %9 %34 
                                              OpStore %54 %53 
                         Private f32* %56 = OpAccessChain %9 %34 
                                  f32 %57 = OpLoad %56 
                                  f32 %58 = OpFDiv %55 %57 
                         Private f32* %59 = OpAccessChain %9 %34 
                                              OpStore %59 %58 
                         Private f32* %60 = OpAccessChain %9 %34 
                                  f32 %61 = OpLoad %60 
                           Input f32* %63 = OpAccessChain vs_TEXCOORD2 %43 
                                  f32 %64 = OpLoad %63 
                                  f32 %65 = OpFNegate %64 
                                  f32 %66 = OpFAdd %61 %65 
                         Private f32* %67 = OpAccessChain %9 %34 
                                              OpStore %67 %66 
                         Private f32* %68 = OpAccessChain %9 %34 
                                  f32 %69 = OpLoad %68 
                         Uniform f32* %71 = OpAccessChain %40 %70 
                                  f32 %72 = OpLoad %71 
                                  f32 %73 = OpFMul %69 %72 
                         Private f32* %74 = OpAccessChain %9 %34 
                                              OpStore %74 %73 
                         Private f32* %75 = OpAccessChain %9 %34 
                                  f32 %76 = OpLoad %75 
                                  f32 %78 = OpExtInst %1 43 %76 %77 %55 
                         Private f32* %79 = OpAccessChain %9 %34 
                                              OpStore %79 %78 
                                f32_4 %81 = OpLoad %80 
                                f32_2 %82 = OpVectorShuffle %81 %81 3 3 
                                f32_4 %83 = OpLoad %9 
                                f32_2 %84 = OpVectorShuffle %83 %83 0 0 
                                  f32 %85 = OpDot %82 %84 
                         Private f32* %86 = OpAccessChain %9 %50 
                                              OpStore %86 %85 
                                f32_4 %88 = OpLoad %80 
                                f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                f32_4 %90 = OpLoad %80 
                                f32_3 %91 = OpVectorShuffle %90 %90 0 1 2 
                                f32_3 %92 = OpFAdd %89 %91 
                                f32_4 %93 = OpLoad %9 
                                f32_4 %94 = OpVectorShuffle %93 %92 4 5 6 3 
                                              OpStore %9 %94 
                                f32_4 %95 = OpLoad %9 
                       Uniform f32_4* %98 = OpAccessChain %40 %96 
                                f32_4 %99 = OpLoad %98 
                               f32_4 %100 = OpFMul %95 %99 
                                              OpStore %9 %100 
                 read_only Texture2D %103 = OpLoad %102 
                             sampler %105 = OpLoad %104 
          read_only Texture2DSampled %106 = OpSampledImage %103 %105 
                               f32_2 %109 = OpLoad vs_TEXCOORD0 
                               f32_4 %110 = OpImageSampleImplicitLod %106 %109 
                                              OpStore %101 %110 
                               f32_4 %111 = OpLoad %9 
                               f32_4 %112 = OpLoad %101 
                               f32_4 %113 = OpFMul %111 %112 
                                              OpStore %9 %113 
                        Private f32* %116 = OpAccessChain %9 %50 
                                 f32 %117 = OpLoad %116 
                         Output f32* %119 = OpAccessChain %115 %50 
                                              OpStore %119 %117 
                         Output f32* %120 = OpAccessChain %115 %50 
                                 f32 %121 = OpLoad %120 
                                 f32 %122 = OpExtInst %1 43 %121 %77 %55 
                         Output f32* %123 = OpAccessChain %115 %50 
                                              OpStore %123 %122 
                               f32_4 %124 = OpLoad %9 
                               f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                               f32_4 %126 = OpLoad %115 
                               f32_4 %127 = OpVectorShuffle %126 %125 4 5 6 3 
                                              OpStore %115 %127 
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
Keywords { "SOFTPARTICLES_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SOFTPARTICLES_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SOFTPARTICLES_ON" }
""
}
SubProgram "vulkan hw_tier00 " {
Keywords { "SOFTPARTICLES_ON" }
""
}
SubProgram "vulkan hw_tier01 " {
Keywords { "SOFTPARTICLES_ON" }
""
}
SubProgram "vulkan hw_tier02 " {
Keywords { "SOFTPARTICLES_ON" }
""
}
}
}
}
}