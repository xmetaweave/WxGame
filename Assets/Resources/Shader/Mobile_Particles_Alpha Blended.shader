//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Mobile/Particles/Alpha Blended" {
Properties {
_MainTex ("Particle Texture", 2D) = "white" { }
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 10119
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
in highp vec3 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
#else
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
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
in highp vec3 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
#else
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
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
in highp vec3 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
#else
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
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
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
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
; Bound: 113
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %9 %11 %21 %24 %47 %98 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpDecorate %9 RelaxedPrecision 
                                                     OpDecorate %9 Location 9 
                                                     OpDecorate %11 RelaxedPrecision 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %12 RelaxedPrecision 
                                                     OpDecorate %13 RelaxedPrecision 
                                                     OpDecorate %16 RelaxedPrecision 
                                                     OpDecorate %17 RelaxedPrecision 
                                                     OpDecorate %18 RelaxedPrecision 
                                                     OpDecorate vs_TEXCOORD0 Location 21 
                                                     OpDecorate %24 Location 24 
                                                     OpDecorate %29 ArrayStride 29 
                                                     OpDecorate %30 ArrayStride 30 
                                                     OpMemberDecorate %31 0 Offset 31 
                                                     OpMemberDecorate %31 1 Offset 31 
                                                     OpMemberDecorate %31 2 Offset 31 
                                                     OpDecorate %31 Block 
                                                     OpDecorate %33 DescriptorSet 33 
                                                     OpDecorate %33 Binding 33 
                                                     OpDecorate %47 Location 47 
                                                     OpMemberDecorate %96 0 BuiltIn 96 
                                                     OpMemberDecorate %96 1 BuiltIn 96 
                                                     OpMemberDecorate %96 2 BuiltIn 96 
                                                     OpDecorate %96 Block 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Output %7 
                                Output f32_4* %9 = OpVariable Output 
                                             %10 = OpTypePointer Input %7 
                                Input f32_4* %11 = OpVariable Input 
                                         f32 %14 = OpConstant 3.674022E-40 
                                         f32 %15 = OpConstant 3.674022E-40 
                                             %19 = OpTypeVector %6 2 
                                             %20 = OpTypePointer Output %19 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %22 = OpTypeVector %6 3 
                                             %23 = OpTypePointer Input %22 
                                Input f32_3* %24 = OpVariable Input 
                                             %27 = OpTypeInt 32 0 
                                         u32 %28 = OpConstant 4 
                                             %29 = OpTypeArray %7 %28 
                                             %30 = OpTypeArray %7 %28 
                                             %31 = OpTypeStruct %29 %30 %7 
                                             %32 = OpTypePointer Uniform %31 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %33 = OpVariable Uniform 
                                             %34 = OpTypeInt 32 1 
                                         i32 %35 = OpConstant 2 
                                             %36 = OpTypePointer Uniform %7 
                                             %45 = OpTypePointer Private %7 
                              Private f32_4* %46 = OpVariable Private 
                                Input f32_3* %47 = OpVariable Input 
                                         i32 %50 = OpConstant 0 
                                         i32 %51 = OpConstant 1 
                                         i32 %70 = OpConstant 3 
                              Private f32_4* %74 = OpVariable Private 
                                         u32 %94 = OpConstant 1 
                                             %95 = OpTypeArray %6 %94 
                                             %96 = OpTypeStruct %7 %6 %95 
                                             %97 = OpTypePointer Output %96 
        Output struct {f32_4; f32; f32[1];}* %98 = OpVariable Output 
                                            %107 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                                     OpStore %9 %12 
                                       f32_4 %13 = OpLoad %9 
                                       f32_4 %16 = OpCompositeConstruct %14 %14 %14 %14 
                                       f32_4 %17 = OpCompositeConstruct %15 %15 %15 %15 
                                       f32_4 %18 = OpExtInst %1 43 %13 %16 %17 
                                                     OpStore %9 %18 
                                       f32_3 %25 = OpLoad %24 
                                       f32_2 %26 = OpVectorShuffle %25 %25 0 1 
                              Uniform f32_4* %37 = OpAccessChain %33 %35 
                                       f32_4 %38 = OpLoad %37 
                                       f32_2 %39 = OpVectorShuffle %38 %38 0 1 
                                       f32_2 %40 = OpFMul %26 %39 
                              Uniform f32_4* %41 = OpAccessChain %33 %35 
                                       f32_4 %42 = OpLoad %41 
                                       f32_2 %43 = OpVectorShuffle %42 %42 2 3 
                                       f32_2 %44 = OpFAdd %40 %43 
                                                     OpStore vs_TEXCOORD0 %44 
                                       f32_3 %48 = OpLoad %47 
                                       f32_4 %49 = OpVectorShuffle %48 %48 1 1 1 1 
                              Uniform f32_4* %52 = OpAccessChain %33 %50 %51 
                                       f32_4 %53 = OpLoad %52 
                                       f32_4 %54 = OpFMul %49 %53 
                                                     OpStore %46 %54 
                              Uniform f32_4* %55 = OpAccessChain %33 %50 %50 
                                       f32_4 %56 = OpLoad %55 
                                       f32_3 %57 = OpLoad %47 
                                       f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                                       f32_4 %59 = OpFMul %56 %58 
                                       f32_4 %60 = OpLoad %46 
                                       f32_4 %61 = OpFAdd %59 %60 
                                                     OpStore %46 %61 
                              Uniform f32_4* %62 = OpAccessChain %33 %50 %35 
                                       f32_4 %63 = OpLoad %62 
                                       f32_3 %64 = OpLoad %47 
                                       f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
                                       f32_4 %66 = OpFMul %63 %65 
                                       f32_4 %67 = OpLoad %46 
                                       f32_4 %68 = OpFAdd %66 %67 
                                                     OpStore %46 %68 
                                       f32_4 %69 = OpLoad %46 
                              Uniform f32_4* %71 = OpAccessChain %33 %50 %70 
                                       f32_4 %72 = OpLoad %71 
                                       f32_4 %73 = OpFAdd %69 %72 
                                                     OpStore %46 %73 
                                       f32_4 %75 = OpLoad %46 
                                       f32_4 %76 = OpVectorShuffle %75 %75 1 1 1 1 
                              Uniform f32_4* %77 = OpAccessChain %33 %51 %51 
                                       f32_4 %78 = OpLoad %77 
                                       f32_4 %79 = OpFMul %76 %78 
                                                     OpStore %74 %79 
                              Uniform f32_4* %80 = OpAccessChain %33 %51 %50 
                                       f32_4 %81 = OpLoad %80 
                                       f32_4 %82 = OpLoad %46 
                                       f32_4 %83 = OpVectorShuffle %82 %82 0 0 0 0 
                                       f32_4 %84 = OpFMul %81 %83 
                                       f32_4 %85 = OpLoad %74 
                                       f32_4 %86 = OpFAdd %84 %85 
                                                     OpStore %74 %86 
                              Uniform f32_4* %87 = OpAccessChain %33 %51 %35 
                                       f32_4 %88 = OpLoad %87 
                                       f32_4 %89 = OpLoad %46 
                                       f32_4 %90 = OpVectorShuffle %89 %89 2 2 2 2 
                                       f32_4 %91 = OpFMul %88 %90 
                                       f32_4 %92 = OpLoad %74 
                                       f32_4 %93 = OpFAdd %91 %92 
                                                     OpStore %74 %93 
                              Uniform f32_4* %99 = OpAccessChain %33 %51 %70 
                                      f32_4 %100 = OpLoad %99 
                                      f32_4 %101 = OpLoad %46 
                                      f32_4 %102 = OpVectorShuffle %101 %101 3 3 3 3 
                                      f32_4 %103 = OpFMul %100 %102 
                                      f32_4 %104 = OpLoad %74 
                                      f32_4 %105 = OpFAdd %103 %104 
                              Output f32_4* %106 = OpAccessChain %98 %50 
                                                     OpStore %106 %105 
                                Output f32* %108 = OpAccessChain %98 %50 %94 
                                        f32 %109 = OpLoad %108 
                                        f32 %110 = OpFNegate %109 
                                Output f32* %111 = OpAccessChain %98 %50 %94 
                                                     OpStore %111 %110 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 33
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %26 %29 
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
                                             OpDecorate %26 Location 26 
                                             OpDecorate %27 RelaxedPrecision 
                                             OpDecorate %29 RelaxedPrecision 
                                             OpDecorate %29 Location 29 
                                             OpDecorate %30 RelaxedPrecision 
                                             OpDecorate %31 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
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
                                     %25 = OpTypePointer Output %7 
                       Output f32_4* %26 = OpVariable Output 
                                     %28 = OpTypePointer Input %7 
                        Input f32_4* %29 = OpVariable Input 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %27 = OpLoad %9 
                               f32_4 %30 = OpLoad %29 
                               f32_4 %31 = OpFMul %27 %30 
                                             OpStore %26 %31 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 113
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %9 %11 %21 %24 %47 %98 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpDecorate %9 RelaxedPrecision 
                                                     OpDecorate %9 Location 9 
                                                     OpDecorate %11 RelaxedPrecision 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %12 RelaxedPrecision 
                                                     OpDecorate %13 RelaxedPrecision 
                                                     OpDecorate %16 RelaxedPrecision 
                                                     OpDecorate %17 RelaxedPrecision 
                                                     OpDecorate %18 RelaxedPrecision 
                                                     OpDecorate vs_TEXCOORD0 Location 21 
                                                     OpDecorate %24 Location 24 
                                                     OpDecorate %29 ArrayStride 29 
                                                     OpDecorate %30 ArrayStride 30 
                                                     OpMemberDecorate %31 0 Offset 31 
                                                     OpMemberDecorate %31 1 Offset 31 
                                                     OpMemberDecorate %31 2 Offset 31 
                                                     OpDecorate %31 Block 
                                                     OpDecorate %33 DescriptorSet 33 
                                                     OpDecorate %33 Binding 33 
                                                     OpDecorate %47 Location 47 
                                                     OpMemberDecorate %96 0 BuiltIn 96 
                                                     OpMemberDecorate %96 1 BuiltIn 96 
                                                     OpMemberDecorate %96 2 BuiltIn 96 
                                                     OpDecorate %96 Block 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Output %7 
                                Output f32_4* %9 = OpVariable Output 
                                             %10 = OpTypePointer Input %7 
                                Input f32_4* %11 = OpVariable Input 
                                         f32 %14 = OpConstant 3.674022E-40 
                                         f32 %15 = OpConstant 3.674022E-40 
                                             %19 = OpTypeVector %6 2 
                                             %20 = OpTypePointer Output %19 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %22 = OpTypeVector %6 3 
                                             %23 = OpTypePointer Input %22 
                                Input f32_3* %24 = OpVariable Input 
                                             %27 = OpTypeInt 32 0 
                                         u32 %28 = OpConstant 4 
                                             %29 = OpTypeArray %7 %28 
                                             %30 = OpTypeArray %7 %28 
                                             %31 = OpTypeStruct %29 %30 %7 
                                             %32 = OpTypePointer Uniform %31 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %33 = OpVariable Uniform 
                                             %34 = OpTypeInt 32 1 
                                         i32 %35 = OpConstant 2 
                                             %36 = OpTypePointer Uniform %7 
                                             %45 = OpTypePointer Private %7 
                              Private f32_4* %46 = OpVariable Private 
                                Input f32_3* %47 = OpVariable Input 
                                         i32 %50 = OpConstant 0 
                                         i32 %51 = OpConstant 1 
                                         i32 %70 = OpConstant 3 
                              Private f32_4* %74 = OpVariable Private 
                                         u32 %94 = OpConstant 1 
                                             %95 = OpTypeArray %6 %94 
                                             %96 = OpTypeStruct %7 %6 %95 
                                             %97 = OpTypePointer Output %96 
        Output struct {f32_4; f32; f32[1];}* %98 = OpVariable Output 
                                            %107 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                                     OpStore %9 %12 
                                       f32_4 %13 = OpLoad %9 
                                       f32_4 %16 = OpCompositeConstruct %14 %14 %14 %14 
                                       f32_4 %17 = OpCompositeConstruct %15 %15 %15 %15 
                                       f32_4 %18 = OpExtInst %1 43 %13 %16 %17 
                                                     OpStore %9 %18 
                                       f32_3 %25 = OpLoad %24 
                                       f32_2 %26 = OpVectorShuffle %25 %25 0 1 
                              Uniform f32_4* %37 = OpAccessChain %33 %35 
                                       f32_4 %38 = OpLoad %37 
                                       f32_2 %39 = OpVectorShuffle %38 %38 0 1 
                                       f32_2 %40 = OpFMul %26 %39 
                              Uniform f32_4* %41 = OpAccessChain %33 %35 
                                       f32_4 %42 = OpLoad %41 
                                       f32_2 %43 = OpVectorShuffle %42 %42 2 3 
                                       f32_2 %44 = OpFAdd %40 %43 
                                                     OpStore vs_TEXCOORD0 %44 
                                       f32_3 %48 = OpLoad %47 
                                       f32_4 %49 = OpVectorShuffle %48 %48 1 1 1 1 
                              Uniform f32_4* %52 = OpAccessChain %33 %50 %51 
                                       f32_4 %53 = OpLoad %52 
                                       f32_4 %54 = OpFMul %49 %53 
                                                     OpStore %46 %54 
                              Uniform f32_4* %55 = OpAccessChain %33 %50 %50 
                                       f32_4 %56 = OpLoad %55 
                                       f32_3 %57 = OpLoad %47 
                                       f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                                       f32_4 %59 = OpFMul %56 %58 
                                       f32_4 %60 = OpLoad %46 
                                       f32_4 %61 = OpFAdd %59 %60 
                                                     OpStore %46 %61 
                              Uniform f32_4* %62 = OpAccessChain %33 %50 %35 
                                       f32_4 %63 = OpLoad %62 
                                       f32_3 %64 = OpLoad %47 
                                       f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
                                       f32_4 %66 = OpFMul %63 %65 
                                       f32_4 %67 = OpLoad %46 
                                       f32_4 %68 = OpFAdd %66 %67 
                                                     OpStore %46 %68 
                                       f32_4 %69 = OpLoad %46 
                              Uniform f32_4* %71 = OpAccessChain %33 %50 %70 
                                       f32_4 %72 = OpLoad %71 
                                       f32_4 %73 = OpFAdd %69 %72 
                                                     OpStore %46 %73 
                                       f32_4 %75 = OpLoad %46 
                                       f32_4 %76 = OpVectorShuffle %75 %75 1 1 1 1 
                              Uniform f32_4* %77 = OpAccessChain %33 %51 %51 
                                       f32_4 %78 = OpLoad %77 
                                       f32_4 %79 = OpFMul %76 %78 
                                                     OpStore %74 %79 
                              Uniform f32_4* %80 = OpAccessChain %33 %51 %50 
                                       f32_4 %81 = OpLoad %80 
                                       f32_4 %82 = OpLoad %46 
                                       f32_4 %83 = OpVectorShuffle %82 %82 0 0 0 0 
                                       f32_4 %84 = OpFMul %81 %83 
                                       f32_4 %85 = OpLoad %74 
                                       f32_4 %86 = OpFAdd %84 %85 
                                                     OpStore %74 %86 
                              Uniform f32_4* %87 = OpAccessChain %33 %51 %35 
                                       f32_4 %88 = OpLoad %87 
                                       f32_4 %89 = OpLoad %46 
                                       f32_4 %90 = OpVectorShuffle %89 %89 2 2 2 2 
                                       f32_4 %91 = OpFMul %88 %90 
                                       f32_4 %92 = OpLoad %74 
                                       f32_4 %93 = OpFAdd %91 %92 
                                                     OpStore %74 %93 
                              Uniform f32_4* %99 = OpAccessChain %33 %51 %70 
                                      f32_4 %100 = OpLoad %99 
                                      f32_4 %101 = OpLoad %46 
                                      f32_4 %102 = OpVectorShuffle %101 %101 3 3 3 3 
                                      f32_4 %103 = OpFMul %100 %102 
                                      f32_4 %104 = OpLoad %74 
                                      f32_4 %105 = OpFAdd %103 %104 
                              Output f32_4* %106 = OpAccessChain %98 %50 
                                                     OpStore %106 %105 
                                Output f32* %108 = OpAccessChain %98 %50 %94 
                                        f32 %109 = OpLoad %108 
                                        f32 %110 = OpFNegate %109 
                                Output f32* %111 = OpAccessChain %98 %50 %94 
                                                     OpStore %111 %110 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 33
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %26 %29 
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
                                             OpDecorate %26 Location 26 
                                             OpDecorate %27 RelaxedPrecision 
                                             OpDecorate %29 RelaxedPrecision 
                                             OpDecorate %29 Location 29 
                                             OpDecorate %30 RelaxedPrecision 
                                             OpDecorate %31 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
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
                                     %25 = OpTypePointer Output %7 
                       Output f32_4* %26 = OpVariable Output 
                                     %28 = OpTypePointer Input %7 
                        Input f32_4* %29 = OpVariable Input 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %27 = OpLoad %9 
                               f32_4 %30 = OpLoad %29 
                               f32_4 %31 = OpFMul %27 %30 
                                             OpStore %26 %31 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 113
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %9 %11 %21 %24 %47 %98 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpDecorate %9 RelaxedPrecision 
                                                     OpDecorate %9 Location 9 
                                                     OpDecorate %11 RelaxedPrecision 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %12 RelaxedPrecision 
                                                     OpDecorate %13 RelaxedPrecision 
                                                     OpDecorate %16 RelaxedPrecision 
                                                     OpDecorate %17 RelaxedPrecision 
                                                     OpDecorate %18 RelaxedPrecision 
                                                     OpDecorate vs_TEXCOORD0 Location 21 
                                                     OpDecorate %24 Location 24 
                                                     OpDecorate %29 ArrayStride 29 
                                                     OpDecorate %30 ArrayStride 30 
                                                     OpMemberDecorate %31 0 Offset 31 
                                                     OpMemberDecorate %31 1 Offset 31 
                                                     OpMemberDecorate %31 2 Offset 31 
                                                     OpDecorate %31 Block 
                                                     OpDecorate %33 DescriptorSet 33 
                                                     OpDecorate %33 Binding 33 
                                                     OpDecorate %47 Location 47 
                                                     OpMemberDecorate %96 0 BuiltIn 96 
                                                     OpMemberDecorate %96 1 BuiltIn 96 
                                                     OpMemberDecorate %96 2 BuiltIn 96 
                                                     OpDecorate %96 Block 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Output %7 
                                Output f32_4* %9 = OpVariable Output 
                                             %10 = OpTypePointer Input %7 
                                Input f32_4* %11 = OpVariable Input 
                                         f32 %14 = OpConstant 3.674022E-40 
                                         f32 %15 = OpConstant 3.674022E-40 
                                             %19 = OpTypeVector %6 2 
                                             %20 = OpTypePointer Output %19 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %22 = OpTypeVector %6 3 
                                             %23 = OpTypePointer Input %22 
                                Input f32_3* %24 = OpVariable Input 
                                             %27 = OpTypeInt 32 0 
                                         u32 %28 = OpConstant 4 
                                             %29 = OpTypeArray %7 %28 
                                             %30 = OpTypeArray %7 %28 
                                             %31 = OpTypeStruct %29 %30 %7 
                                             %32 = OpTypePointer Uniform %31 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %33 = OpVariable Uniform 
                                             %34 = OpTypeInt 32 1 
                                         i32 %35 = OpConstant 2 
                                             %36 = OpTypePointer Uniform %7 
                                             %45 = OpTypePointer Private %7 
                              Private f32_4* %46 = OpVariable Private 
                                Input f32_3* %47 = OpVariable Input 
                                         i32 %50 = OpConstant 0 
                                         i32 %51 = OpConstant 1 
                                         i32 %70 = OpConstant 3 
                              Private f32_4* %74 = OpVariable Private 
                                         u32 %94 = OpConstant 1 
                                             %95 = OpTypeArray %6 %94 
                                             %96 = OpTypeStruct %7 %6 %95 
                                             %97 = OpTypePointer Output %96 
        Output struct {f32_4; f32; f32[1];}* %98 = OpVariable Output 
                                            %107 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                                     OpStore %9 %12 
                                       f32_4 %13 = OpLoad %9 
                                       f32_4 %16 = OpCompositeConstruct %14 %14 %14 %14 
                                       f32_4 %17 = OpCompositeConstruct %15 %15 %15 %15 
                                       f32_4 %18 = OpExtInst %1 43 %13 %16 %17 
                                                     OpStore %9 %18 
                                       f32_3 %25 = OpLoad %24 
                                       f32_2 %26 = OpVectorShuffle %25 %25 0 1 
                              Uniform f32_4* %37 = OpAccessChain %33 %35 
                                       f32_4 %38 = OpLoad %37 
                                       f32_2 %39 = OpVectorShuffle %38 %38 0 1 
                                       f32_2 %40 = OpFMul %26 %39 
                              Uniform f32_4* %41 = OpAccessChain %33 %35 
                                       f32_4 %42 = OpLoad %41 
                                       f32_2 %43 = OpVectorShuffle %42 %42 2 3 
                                       f32_2 %44 = OpFAdd %40 %43 
                                                     OpStore vs_TEXCOORD0 %44 
                                       f32_3 %48 = OpLoad %47 
                                       f32_4 %49 = OpVectorShuffle %48 %48 1 1 1 1 
                              Uniform f32_4* %52 = OpAccessChain %33 %50 %51 
                                       f32_4 %53 = OpLoad %52 
                                       f32_4 %54 = OpFMul %49 %53 
                                                     OpStore %46 %54 
                              Uniform f32_4* %55 = OpAccessChain %33 %50 %50 
                                       f32_4 %56 = OpLoad %55 
                                       f32_3 %57 = OpLoad %47 
                                       f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                                       f32_4 %59 = OpFMul %56 %58 
                                       f32_4 %60 = OpLoad %46 
                                       f32_4 %61 = OpFAdd %59 %60 
                                                     OpStore %46 %61 
                              Uniform f32_4* %62 = OpAccessChain %33 %50 %35 
                                       f32_4 %63 = OpLoad %62 
                                       f32_3 %64 = OpLoad %47 
                                       f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
                                       f32_4 %66 = OpFMul %63 %65 
                                       f32_4 %67 = OpLoad %46 
                                       f32_4 %68 = OpFAdd %66 %67 
                                                     OpStore %46 %68 
                                       f32_4 %69 = OpLoad %46 
                              Uniform f32_4* %71 = OpAccessChain %33 %50 %70 
                                       f32_4 %72 = OpLoad %71 
                                       f32_4 %73 = OpFAdd %69 %72 
                                                     OpStore %46 %73 
                                       f32_4 %75 = OpLoad %46 
                                       f32_4 %76 = OpVectorShuffle %75 %75 1 1 1 1 
                              Uniform f32_4* %77 = OpAccessChain %33 %51 %51 
                                       f32_4 %78 = OpLoad %77 
                                       f32_4 %79 = OpFMul %76 %78 
                                                     OpStore %74 %79 
                              Uniform f32_4* %80 = OpAccessChain %33 %51 %50 
                                       f32_4 %81 = OpLoad %80 
                                       f32_4 %82 = OpLoad %46 
                                       f32_4 %83 = OpVectorShuffle %82 %82 0 0 0 0 
                                       f32_4 %84 = OpFMul %81 %83 
                                       f32_4 %85 = OpLoad %74 
                                       f32_4 %86 = OpFAdd %84 %85 
                                                     OpStore %74 %86 
                              Uniform f32_4* %87 = OpAccessChain %33 %51 %35 
                                       f32_4 %88 = OpLoad %87 
                                       f32_4 %89 = OpLoad %46 
                                       f32_4 %90 = OpVectorShuffle %89 %89 2 2 2 2 
                                       f32_4 %91 = OpFMul %88 %90 
                                       f32_4 %92 = OpLoad %74 
                                       f32_4 %93 = OpFAdd %91 %92 
                                                     OpStore %74 %93 
                              Uniform f32_4* %99 = OpAccessChain %33 %51 %70 
                                      f32_4 %100 = OpLoad %99 
                                      f32_4 %101 = OpLoad %46 
                                      f32_4 %102 = OpVectorShuffle %101 %101 3 3 3 3 
                                      f32_4 %103 = OpFMul %100 %102 
                                      f32_4 %104 = OpLoad %74 
                                      f32_4 %105 = OpFAdd %103 %104 
                              Output f32_4* %106 = OpAccessChain %98 %50 
                                                     OpStore %106 %105 
                                Output f32* %108 = OpAccessChain %98 %50 %94 
                                        f32 %109 = OpLoad %108 
                                        f32 %110 = OpFNegate %109 
                                Output f32* %111 = OpAccessChain %98 %50 %94 
                                                     OpStore %111 %110 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 33
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %26 %29 
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
                                             OpDecorate %26 Location 26 
                                             OpDecorate %27 RelaxedPrecision 
                                             OpDecorate %29 RelaxedPrecision 
                                             OpDecorate %29 Location 29 
                                             OpDecorate %30 RelaxedPrecision 
                                             OpDecorate %31 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
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
                                     %25 = OpTypePointer Output %7 
                       Output f32_4* %26 = OpVariable Output 
                                     %28 = OpTypePointer Input %7 
                        Input f32_4* %29 = OpVariable Input 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %27 = OpLoad %9 
                               f32_4 %30 = OpLoad %29 
                               f32_4 %31 = OpFMul %27 %30 
                                             OpStore %26 %31 
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