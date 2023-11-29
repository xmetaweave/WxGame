//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Tzar/Standard Fog" {
Properties {
_Color ("Main Color", Color) = (1,1,1,0.5)
_Intensity ("Intensity", Float) = 1
}
SubShader {
 Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  GpuProgramID 52435
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
out highp vec4 vs_TEXCOORD0;
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
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    gl_Position = u_xlat0;
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
uniform 	vec4 _Color;
uniform 	float _Intensity;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_TARGET0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat3;
float u_xlat6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat0.x = texture(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD0.w);
    u_xlat0.x = u_xlat0.x * _Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat0.x * u_xlat0.x;
    u_xlat3 = u_xlat0.x * u_xlat3;
    u_xlat6 = u_xlat0.x * 6.0 + -15.0;
    u_xlat0.x = u_xlat0.x * u_xlat6 + 10.0;
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlat1.xyz = _Color.xyz;
    u_xlat1.w = 0.0;
    u_xlat2 = (-u_xlat1) + _Color;
    u_xlat0 = u_xlat0.xxxx * u_xlat2 + u_xlat1;
    SV_TARGET0 = u_xlat0;
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
out highp vec4 vs_TEXCOORD0;
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
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    gl_Position = u_xlat0;
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
uniform 	vec4 _Color;
uniform 	float _Intensity;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_TARGET0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat3;
float u_xlat6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat0.x = texture(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD0.w);
    u_xlat0.x = u_xlat0.x * _Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat0.x * u_xlat0.x;
    u_xlat3 = u_xlat0.x * u_xlat3;
    u_xlat6 = u_xlat0.x * 6.0 + -15.0;
    u_xlat0.x = u_xlat0.x * u_xlat6 + 10.0;
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlat1.xyz = _Color.xyz;
    u_xlat1.w = 0.0;
    u_xlat2 = (-u_xlat1) + _Color;
    u_xlat0 = u_xlat0.xxxx * u_xlat2 + u_xlat1;
    SV_TARGET0 = u_xlat0;
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
out highp vec4 vs_TEXCOORD0;
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
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    gl_Position = u_xlat0;
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
uniform 	vec4 _Color;
uniform 	float _Intensity;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_TARGET0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat3;
float u_xlat6;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat0.x = texture(_CameraDepthTexture, u_xlat0.xy).x;
    u_xlat0.x = _ZBufferParams.z * u_xlat0.x + _ZBufferParams.w;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x + (-vs_TEXCOORD0.w);
    u_xlat0.x = u_xlat0.x * _Intensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat3 = u_xlat0.x * u_xlat0.x;
    u_xlat3 = u_xlat0.x * u_xlat3;
    u_xlat6 = u_xlat0.x * 6.0 + -15.0;
    u_xlat0.x = u_xlat0.x * u_xlat6 + 10.0;
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlat1.xyz = _Color.xyz;
    u_xlat1.w = 0.0;
    u_xlat2 = (-u_xlat1) + _Color;
    u_xlat0 = u_xlat0.xxxx * u_xlat2 + u_xlat1;
    SV_TARGET0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 123
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %99 %114 
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
                                                     OpDecorate vs_TEXCOORD0 Location 99 
                                                     OpMemberDecorate %112 0 BuiltIn 112 
                                                     OpMemberDecorate %112 1 BuiltIn 112 
                                                     OpMemberDecorate %112 2 BuiltIn 112 
                                                     OpDecorate %112 Block 
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
                                             %18 = OpTypeStruct %7 %16 %17 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4; f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 1 
                                             %23 = OpTypePointer Uniform %7 
                                         i32 %27 = OpConstant 0 
                                         i32 %35 = OpConstant 2 
                                         i32 %44 = OpConstant 3 
                              Private f32_4* %48 = OpVariable Private 
                                         u32 %75 = OpConstant 1 
                                             %76 = OpTypePointer Private %6 
                                         u32 %79 = OpConstant 0 
                                             %80 = OpTypePointer Uniform %6 
                                         f32 %87 = OpConstant 3.674022E-40 
                                         u32 %89 = OpConstant 3 
                                             %91 = OpTypeVector %6 2 
                                       f32_2 %94 = OpConstantComposite %87 %87 
                                             %98 = OpTypePointer Output %7 
                      Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                            %111 = OpTypeArray %6 %75 
                                            %112 = OpTypeStruct %7 %6 %111 
                                            %113 = OpTypePointer Output %112 
       Output struct {f32_4; f32; f32[1];}* %114 = OpVariable Output 
                                            %117 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                              Uniform f32_4* %24 = OpAccessChain %20 %22 %22 
                                       f32_4 %25 = OpLoad %24 
                                       f32_4 %26 = OpFMul %13 %25 
                                                     OpStore %9 %26 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 %27 
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
                              Uniform f32_4* %51 = OpAccessChain %20 %35 %22 
                                       f32_4 %52 = OpLoad %51 
                                       f32_4 %53 = OpFMul %50 %52 
                                                     OpStore %48 %53 
                              Uniform f32_4* %54 = OpAccessChain %20 %35 %27 
                                       f32_4 %55 = OpLoad %54 
                                       f32_4 %56 = OpLoad %9 
                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                       f32_4 %58 = OpFMul %55 %57 
                                       f32_4 %59 = OpLoad %48 
                                       f32_4 %60 = OpFAdd %58 %59 
                                                     OpStore %48 %60 
                              Uniform f32_4* %61 = OpAccessChain %20 %35 %35 
                                       f32_4 %62 = OpLoad %61 
                                       f32_4 %63 = OpLoad %9 
                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                       f32_4 %65 = OpFMul %62 %64 
                                       f32_4 %66 = OpLoad %48 
                                       f32_4 %67 = OpFAdd %65 %66 
                                                     OpStore %48 %67 
                              Uniform f32_4* %68 = OpAccessChain %20 %35 %44 
                                       f32_4 %69 = OpLoad %68 
                                       f32_4 %70 = OpLoad %9 
                                       f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                       f32_4 %72 = OpFMul %69 %71 
                                       f32_4 %73 = OpLoad %48 
                                       f32_4 %74 = OpFAdd %72 %73 
                                                     OpStore %9 %74 
                                Private f32* %77 = OpAccessChain %9 %75 
                                         f32 %78 = OpLoad %77 
                                Uniform f32* %81 = OpAccessChain %20 %27 %79 
                                         f32 %82 = OpLoad %81 
                                         f32 %83 = OpFMul %78 %82 
                                Private f32* %84 = OpAccessChain %48 %79 
                                                     OpStore %84 %83 
                                Private f32* %85 = OpAccessChain %48 %79 
                                         f32 %86 = OpLoad %85 
                                         f32 %88 = OpFMul %86 %87 
                                Private f32* %90 = OpAccessChain %48 %89 
                                                     OpStore %90 %88 
                                       f32_4 %92 = OpLoad %9 
                                       f32_2 %93 = OpVectorShuffle %92 %92 0 3 
                                       f32_2 %95 = OpFMul %93 %94 
                                       f32_4 %96 = OpLoad %48 
                                       f32_4 %97 = OpVectorShuffle %96 %95 4 1 5 3 
                                                     OpStore %48 %97 
                                      f32_4 %100 = OpLoad %48 
                                      f32_2 %101 = OpVectorShuffle %100 %100 2 2 
                                      f32_4 %102 = OpLoad %48 
                                      f32_2 %103 = OpVectorShuffle %102 %102 0 3 
                                      f32_2 %104 = OpFAdd %101 %103 
                                      f32_4 %105 = OpLoad vs_TEXCOORD0 
                                      f32_4 %106 = OpVectorShuffle %105 %104 4 5 2 3 
                                                     OpStore vs_TEXCOORD0 %106 
                                      f32_4 %107 = OpLoad %9 
                                      f32_2 %108 = OpVectorShuffle %107 %107 2 3 
                                      f32_4 %109 = OpLoad vs_TEXCOORD0 
                                      f32_4 %110 = OpVectorShuffle %109 %108 0 1 4 5 
                                                     OpStore vs_TEXCOORD0 %110 
                                      f32_4 %115 = OpLoad %9 
                              Output f32_4* %116 = OpAccessChain %114 %27 
                                                     OpStore %116 %115 
                                Output f32* %118 = OpAccessChain %114 %27 %75 
                                        f32 %119 = OpLoad %118 
                                        f32 %120 = OpFNegate %119 
                                Output f32* %121 = OpAccessChain %114 %27 %75 
                                                     OpStore %121 %120 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 135
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %11 %132 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD0 Location 11 
                                             OpDecorate %22 DescriptorSet 22 
                                             OpDecorate %22 Binding 22 
                                             OpDecorate %26 DescriptorSet 26 
                                             OpDecorate %26 Binding 26 
                                             OpMemberDecorate %38 0 Offset 38 
                                             OpMemberDecorate %38 1 Offset 38 
                                             OpMemberDecorate %38 2 Offset 38 
                                             OpDecorate %38 Block 
                                             OpDecorate %40 DescriptorSet 40 
                                             OpDecorate %40 Binding 40 
                                             OpDecorate %132 RelaxedPrecision 
                                             OpDecorate %132 Location 132 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypePointer Input %7 
               Input f32_4* vs_TEXCOORD0 = OpVariable Input 
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
                        Private f32* %80 = OpVariable Private 
                        Private f32* %90 = OpVariable Private 
                                 f32 %93 = OpConstant 3.674022E-40 
                                 f32 %95 = OpConstant 3.674022E-40 
                                f32 %101 = OpConstant 3.674022E-40 
                     Private f32_4* %109 = OpVariable Private 
                                i32 %110 = OpConstant 1 
                                    %111 = OpTypeVector %6 3 
                                    %112 = OpTypePointer Uniform %7 
                     Private f32_4* %119 = OpVariable Private 
                                    %131 = OpTypePointer Output %7 
                      Output f32_4* %132 = OpVariable Output 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_4 %13 = OpLoad vs_TEXCOORD0 
                               f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                               f32_4 %15 = OpLoad vs_TEXCOORD0 
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
                          Input f32* %63 = OpAccessChain vs_TEXCOORD0 %50 
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
                        Private f32* %81 = OpAccessChain %9 %34 
                                 f32 %82 = OpLoad %81 
                        Private f32* %83 = OpAccessChain %9 %34 
                                 f32 %84 = OpLoad %83 
                                 f32 %85 = OpFMul %82 %84 
                                             OpStore %80 %85 
                        Private f32* %86 = OpAccessChain %9 %34 
                                 f32 %87 = OpLoad %86 
                                 f32 %88 = OpLoad %80 
                                 f32 %89 = OpFMul %87 %88 
                                             OpStore %80 %89 
                        Private f32* %91 = OpAccessChain %9 %34 
                                 f32 %92 = OpLoad %91 
                                 f32 %94 = OpFMul %92 %93 
                                 f32 %96 = OpFAdd %94 %95 
                                             OpStore %90 %96 
                        Private f32* %97 = OpAccessChain %9 %34 
                                 f32 %98 = OpLoad %97 
                                 f32 %99 = OpLoad %90 
                                f32 %100 = OpFMul %98 %99 
                                f32 %102 = OpFAdd %100 %101 
                       Private f32* %103 = OpAccessChain %9 %34 
                                             OpStore %103 %102 
                       Private f32* %104 = OpAccessChain %9 %34 
                                f32 %105 = OpLoad %104 
                                f32 %106 = OpLoad %80 
                                f32 %107 = OpFMul %105 %106 
                       Private f32* %108 = OpAccessChain %9 %34 
                                             OpStore %108 %107 
                     Uniform f32_4* %113 = OpAccessChain %40 %110 
                              f32_4 %114 = OpLoad %113 
                              f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                              f32_4 %116 = OpLoad %109 
                              f32_4 %117 = OpVectorShuffle %116 %115 4 5 6 3 
                                             OpStore %109 %117 
                       Private f32* %118 = OpAccessChain %109 %50 
                                             OpStore %118 %77 
                              f32_4 %120 = OpLoad %109 
                              f32_4 %121 = OpFNegate %120 
                     Uniform f32_4* %122 = OpAccessChain %40 %110 
                              f32_4 %123 = OpLoad %122 
                              f32_4 %124 = OpFAdd %121 %123 
                                             OpStore %119 %124 
                              f32_4 %125 = OpLoad %9 
                              f32_4 %126 = OpVectorShuffle %125 %125 0 0 0 0 
                              f32_4 %127 = OpLoad %119 
                              f32_4 %128 = OpFMul %126 %127 
                              f32_4 %129 = OpLoad %109 
                              f32_4 %130 = OpFAdd %128 %129 
                                             OpStore %9 %130 
                              f32_4 %133 = OpLoad %9 
                                             OpStore %132 %133 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 123
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %99 %114 
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
                                                     OpDecorate vs_TEXCOORD0 Location 99 
                                                     OpMemberDecorate %112 0 BuiltIn 112 
                                                     OpMemberDecorate %112 1 BuiltIn 112 
                                                     OpMemberDecorate %112 2 BuiltIn 112 
                                                     OpDecorate %112 Block 
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
                                             %18 = OpTypeStruct %7 %16 %17 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4; f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 1 
                                             %23 = OpTypePointer Uniform %7 
                                         i32 %27 = OpConstant 0 
                                         i32 %35 = OpConstant 2 
                                         i32 %44 = OpConstant 3 
                              Private f32_4* %48 = OpVariable Private 
                                         u32 %75 = OpConstant 1 
                                             %76 = OpTypePointer Private %6 
                                         u32 %79 = OpConstant 0 
                                             %80 = OpTypePointer Uniform %6 
                                         f32 %87 = OpConstant 3.674022E-40 
                                         u32 %89 = OpConstant 3 
                                             %91 = OpTypeVector %6 2 
                                       f32_2 %94 = OpConstantComposite %87 %87 
                                             %98 = OpTypePointer Output %7 
                      Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                            %111 = OpTypeArray %6 %75 
                                            %112 = OpTypeStruct %7 %6 %111 
                                            %113 = OpTypePointer Output %112 
       Output struct {f32_4; f32; f32[1];}* %114 = OpVariable Output 
                                            %117 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                              Uniform f32_4* %24 = OpAccessChain %20 %22 %22 
                                       f32_4 %25 = OpLoad %24 
                                       f32_4 %26 = OpFMul %13 %25 
                                                     OpStore %9 %26 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 %27 
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
                              Uniform f32_4* %51 = OpAccessChain %20 %35 %22 
                                       f32_4 %52 = OpLoad %51 
                                       f32_4 %53 = OpFMul %50 %52 
                                                     OpStore %48 %53 
                              Uniform f32_4* %54 = OpAccessChain %20 %35 %27 
                                       f32_4 %55 = OpLoad %54 
                                       f32_4 %56 = OpLoad %9 
                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                       f32_4 %58 = OpFMul %55 %57 
                                       f32_4 %59 = OpLoad %48 
                                       f32_4 %60 = OpFAdd %58 %59 
                                                     OpStore %48 %60 
                              Uniform f32_4* %61 = OpAccessChain %20 %35 %35 
                                       f32_4 %62 = OpLoad %61 
                                       f32_4 %63 = OpLoad %9 
                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                       f32_4 %65 = OpFMul %62 %64 
                                       f32_4 %66 = OpLoad %48 
                                       f32_4 %67 = OpFAdd %65 %66 
                                                     OpStore %48 %67 
                              Uniform f32_4* %68 = OpAccessChain %20 %35 %44 
                                       f32_4 %69 = OpLoad %68 
                                       f32_4 %70 = OpLoad %9 
                                       f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                       f32_4 %72 = OpFMul %69 %71 
                                       f32_4 %73 = OpLoad %48 
                                       f32_4 %74 = OpFAdd %72 %73 
                                                     OpStore %9 %74 
                                Private f32* %77 = OpAccessChain %9 %75 
                                         f32 %78 = OpLoad %77 
                                Uniform f32* %81 = OpAccessChain %20 %27 %79 
                                         f32 %82 = OpLoad %81 
                                         f32 %83 = OpFMul %78 %82 
                                Private f32* %84 = OpAccessChain %48 %79 
                                                     OpStore %84 %83 
                                Private f32* %85 = OpAccessChain %48 %79 
                                         f32 %86 = OpLoad %85 
                                         f32 %88 = OpFMul %86 %87 
                                Private f32* %90 = OpAccessChain %48 %89 
                                                     OpStore %90 %88 
                                       f32_4 %92 = OpLoad %9 
                                       f32_2 %93 = OpVectorShuffle %92 %92 0 3 
                                       f32_2 %95 = OpFMul %93 %94 
                                       f32_4 %96 = OpLoad %48 
                                       f32_4 %97 = OpVectorShuffle %96 %95 4 1 5 3 
                                                     OpStore %48 %97 
                                      f32_4 %100 = OpLoad %48 
                                      f32_2 %101 = OpVectorShuffle %100 %100 2 2 
                                      f32_4 %102 = OpLoad %48 
                                      f32_2 %103 = OpVectorShuffle %102 %102 0 3 
                                      f32_2 %104 = OpFAdd %101 %103 
                                      f32_4 %105 = OpLoad vs_TEXCOORD0 
                                      f32_4 %106 = OpVectorShuffle %105 %104 4 5 2 3 
                                                     OpStore vs_TEXCOORD0 %106 
                                      f32_4 %107 = OpLoad %9 
                                      f32_2 %108 = OpVectorShuffle %107 %107 2 3 
                                      f32_4 %109 = OpLoad vs_TEXCOORD0 
                                      f32_4 %110 = OpVectorShuffle %109 %108 0 1 4 5 
                                                     OpStore vs_TEXCOORD0 %110 
                                      f32_4 %115 = OpLoad %9 
                              Output f32_4* %116 = OpAccessChain %114 %27 
                                                     OpStore %116 %115 
                                Output f32* %118 = OpAccessChain %114 %27 %75 
                                        f32 %119 = OpLoad %118 
                                        f32 %120 = OpFNegate %119 
                                Output f32* %121 = OpAccessChain %114 %27 %75 
                                                     OpStore %121 %120 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 135
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %11 %132 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD0 Location 11 
                                             OpDecorate %22 DescriptorSet 22 
                                             OpDecorate %22 Binding 22 
                                             OpDecorate %26 DescriptorSet 26 
                                             OpDecorate %26 Binding 26 
                                             OpMemberDecorate %38 0 Offset 38 
                                             OpMemberDecorate %38 1 Offset 38 
                                             OpMemberDecorate %38 2 Offset 38 
                                             OpDecorate %38 Block 
                                             OpDecorate %40 DescriptorSet 40 
                                             OpDecorate %40 Binding 40 
                                             OpDecorate %132 RelaxedPrecision 
                                             OpDecorate %132 Location 132 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypePointer Input %7 
               Input f32_4* vs_TEXCOORD0 = OpVariable Input 
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
                        Private f32* %80 = OpVariable Private 
                        Private f32* %90 = OpVariable Private 
                                 f32 %93 = OpConstant 3.674022E-40 
                                 f32 %95 = OpConstant 3.674022E-40 
                                f32 %101 = OpConstant 3.674022E-40 
                     Private f32_4* %109 = OpVariable Private 
                                i32 %110 = OpConstant 1 
                                    %111 = OpTypeVector %6 3 
                                    %112 = OpTypePointer Uniform %7 
                     Private f32_4* %119 = OpVariable Private 
                                    %131 = OpTypePointer Output %7 
                      Output f32_4* %132 = OpVariable Output 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_4 %13 = OpLoad vs_TEXCOORD0 
                               f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                               f32_4 %15 = OpLoad vs_TEXCOORD0 
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
                          Input f32* %63 = OpAccessChain vs_TEXCOORD0 %50 
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
                        Private f32* %81 = OpAccessChain %9 %34 
                                 f32 %82 = OpLoad %81 
                        Private f32* %83 = OpAccessChain %9 %34 
                                 f32 %84 = OpLoad %83 
                                 f32 %85 = OpFMul %82 %84 
                                             OpStore %80 %85 
                        Private f32* %86 = OpAccessChain %9 %34 
                                 f32 %87 = OpLoad %86 
                                 f32 %88 = OpLoad %80 
                                 f32 %89 = OpFMul %87 %88 
                                             OpStore %80 %89 
                        Private f32* %91 = OpAccessChain %9 %34 
                                 f32 %92 = OpLoad %91 
                                 f32 %94 = OpFMul %92 %93 
                                 f32 %96 = OpFAdd %94 %95 
                                             OpStore %90 %96 
                        Private f32* %97 = OpAccessChain %9 %34 
                                 f32 %98 = OpLoad %97 
                                 f32 %99 = OpLoad %90 
                                f32 %100 = OpFMul %98 %99 
                                f32 %102 = OpFAdd %100 %101 
                       Private f32* %103 = OpAccessChain %9 %34 
                                             OpStore %103 %102 
                       Private f32* %104 = OpAccessChain %9 %34 
                                f32 %105 = OpLoad %104 
                                f32 %106 = OpLoad %80 
                                f32 %107 = OpFMul %105 %106 
                       Private f32* %108 = OpAccessChain %9 %34 
                                             OpStore %108 %107 
                     Uniform f32_4* %113 = OpAccessChain %40 %110 
                              f32_4 %114 = OpLoad %113 
                              f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                              f32_4 %116 = OpLoad %109 
                              f32_4 %117 = OpVectorShuffle %116 %115 4 5 6 3 
                                             OpStore %109 %117 
                       Private f32* %118 = OpAccessChain %109 %50 
                                             OpStore %118 %77 
                              f32_4 %120 = OpLoad %109 
                              f32_4 %121 = OpFNegate %120 
                     Uniform f32_4* %122 = OpAccessChain %40 %110 
                              f32_4 %123 = OpLoad %122 
                              f32_4 %124 = OpFAdd %121 %123 
                                             OpStore %119 %124 
                              f32_4 %125 = OpLoad %9 
                              f32_4 %126 = OpVectorShuffle %125 %125 0 0 0 0 
                              f32_4 %127 = OpLoad %119 
                              f32_4 %128 = OpFMul %126 %127 
                              f32_4 %129 = OpLoad %109 
                              f32_4 %130 = OpFAdd %128 %129 
                                             OpStore %9 %130 
                              f32_4 %133 = OpLoad %9 
                                             OpStore %132 %133 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 123
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %99 %114 
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
                                                     OpDecorate vs_TEXCOORD0 Location 99 
                                                     OpMemberDecorate %112 0 BuiltIn 112 
                                                     OpMemberDecorate %112 1 BuiltIn 112 
                                                     OpMemberDecorate %112 2 BuiltIn 112 
                                                     OpDecorate %112 Block 
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
                                             %18 = OpTypeStruct %7 %16 %17 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4; f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 1 
                                             %23 = OpTypePointer Uniform %7 
                                         i32 %27 = OpConstant 0 
                                         i32 %35 = OpConstant 2 
                                         i32 %44 = OpConstant 3 
                              Private f32_4* %48 = OpVariable Private 
                                         u32 %75 = OpConstant 1 
                                             %76 = OpTypePointer Private %6 
                                         u32 %79 = OpConstant 0 
                                             %80 = OpTypePointer Uniform %6 
                                         f32 %87 = OpConstant 3.674022E-40 
                                         u32 %89 = OpConstant 3 
                                             %91 = OpTypeVector %6 2 
                                       f32_2 %94 = OpConstantComposite %87 %87 
                                             %98 = OpTypePointer Output %7 
                      Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                            %111 = OpTypeArray %6 %75 
                                            %112 = OpTypeStruct %7 %6 %111 
                                            %113 = OpTypePointer Output %112 
       Output struct {f32_4; f32; f32[1];}* %114 = OpVariable Output 
                                            %117 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                              Uniform f32_4* %24 = OpAccessChain %20 %22 %22 
                                       f32_4 %25 = OpLoad %24 
                                       f32_4 %26 = OpFMul %13 %25 
                                                     OpStore %9 %26 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 %27 
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
                              Uniform f32_4* %51 = OpAccessChain %20 %35 %22 
                                       f32_4 %52 = OpLoad %51 
                                       f32_4 %53 = OpFMul %50 %52 
                                                     OpStore %48 %53 
                              Uniform f32_4* %54 = OpAccessChain %20 %35 %27 
                                       f32_4 %55 = OpLoad %54 
                                       f32_4 %56 = OpLoad %9 
                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                       f32_4 %58 = OpFMul %55 %57 
                                       f32_4 %59 = OpLoad %48 
                                       f32_4 %60 = OpFAdd %58 %59 
                                                     OpStore %48 %60 
                              Uniform f32_4* %61 = OpAccessChain %20 %35 %35 
                                       f32_4 %62 = OpLoad %61 
                                       f32_4 %63 = OpLoad %9 
                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                       f32_4 %65 = OpFMul %62 %64 
                                       f32_4 %66 = OpLoad %48 
                                       f32_4 %67 = OpFAdd %65 %66 
                                                     OpStore %48 %67 
                              Uniform f32_4* %68 = OpAccessChain %20 %35 %44 
                                       f32_4 %69 = OpLoad %68 
                                       f32_4 %70 = OpLoad %9 
                                       f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                       f32_4 %72 = OpFMul %69 %71 
                                       f32_4 %73 = OpLoad %48 
                                       f32_4 %74 = OpFAdd %72 %73 
                                                     OpStore %9 %74 
                                Private f32* %77 = OpAccessChain %9 %75 
                                         f32 %78 = OpLoad %77 
                                Uniform f32* %81 = OpAccessChain %20 %27 %79 
                                         f32 %82 = OpLoad %81 
                                         f32 %83 = OpFMul %78 %82 
                                Private f32* %84 = OpAccessChain %48 %79 
                                                     OpStore %84 %83 
                                Private f32* %85 = OpAccessChain %48 %79 
                                         f32 %86 = OpLoad %85 
                                         f32 %88 = OpFMul %86 %87 
                                Private f32* %90 = OpAccessChain %48 %89 
                                                     OpStore %90 %88 
                                       f32_4 %92 = OpLoad %9 
                                       f32_2 %93 = OpVectorShuffle %92 %92 0 3 
                                       f32_2 %95 = OpFMul %93 %94 
                                       f32_4 %96 = OpLoad %48 
                                       f32_4 %97 = OpVectorShuffle %96 %95 4 1 5 3 
                                                     OpStore %48 %97 
                                      f32_4 %100 = OpLoad %48 
                                      f32_2 %101 = OpVectorShuffle %100 %100 2 2 
                                      f32_4 %102 = OpLoad %48 
                                      f32_2 %103 = OpVectorShuffle %102 %102 0 3 
                                      f32_2 %104 = OpFAdd %101 %103 
                                      f32_4 %105 = OpLoad vs_TEXCOORD0 
                                      f32_4 %106 = OpVectorShuffle %105 %104 4 5 2 3 
                                                     OpStore vs_TEXCOORD0 %106 
                                      f32_4 %107 = OpLoad %9 
                                      f32_2 %108 = OpVectorShuffle %107 %107 2 3 
                                      f32_4 %109 = OpLoad vs_TEXCOORD0 
                                      f32_4 %110 = OpVectorShuffle %109 %108 0 1 4 5 
                                                     OpStore vs_TEXCOORD0 %110 
                                      f32_4 %115 = OpLoad %9 
                              Output f32_4* %116 = OpAccessChain %114 %27 
                                                     OpStore %116 %115 
                                Output f32* %118 = OpAccessChain %114 %27 %75 
                                        f32 %119 = OpLoad %118 
                                        f32 %120 = OpFNegate %119 
                                Output f32* %121 = OpAccessChain %114 %27 %75 
                                                     OpStore %121 %120 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 135
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %11 %132 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD0 Location 11 
                                             OpDecorate %22 DescriptorSet 22 
                                             OpDecorate %22 Binding 22 
                                             OpDecorate %26 DescriptorSet 26 
                                             OpDecorate %26 Binding 26 
                                             OpMemberDecorate %38 0 Offset 38 
                                             OpMemberDecorate %38 1 Offset 38 
                                             OpMemberDecorate %38 2 Offset 38 
                                             OpDecorate %38 Block 
                                             OpDecorate %40 DescriptorSet 40 
                                             OpDecorate %40 Binding 40 
                                             OpDecorate %132 RelaxedPrecision 
                                             OpDecorate %132 Location 132 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypePointer Input %7 
               Input f32_4* vs_TEXCOORD0 = OpVariable Input 
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
                        Private f32* %80 = OpVariable Private 
                        Private f32* %90 = OpVariable Private 
                                 f32 %93 = OpConstant 3.674022E-40 
                                 f32 %95 = OpConstant 3.674022E-40 
                                f32 %101 = OpConstant 3.674022E-40 
                     Private f32_4* %109 = OpVariable Private 
                                i32 %110 = OpConstant 1 
                                    %111 = OpTypeVector %6 3 
                                    %112 = OpTypePointer Uniform %7 
                     Private f32_4* %119 = OpVariable Private 
                                    %131 = OpTypePointer Output %7 
                      Output f32_4* %132 = OpVariable Output 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_4 %13 = OpLoad vs_TEXCOORD0 
                               f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                               f32_4 %15 = OpLoad vs_TEXCOORD0 
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
                          Input f32* %63 = OpAccessChain vs_TEXCOORD0 %50 
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
                        Private f32* %81 = OpAccessChain %9 %34 
                                 f32 %82 = OpLoad %81 
                        Private f32* %83 = OpAccessChain %9 %34 
                                 f32 %84 = OpLoad %83 
                                 f32 %85 = OpFMul %82 %84 
                                             OpStore %80 %85 
                        Private f32* %86 = OpAccessChain %9 %34 
                                 f32 %87 = OpLoad %86 
                                 f32 %88 = OpLoad %80 
                                 f32 %89 = OpFMul %87 %88 
                                             OpStore %80 %89 
                        Private f32* %91 = OpAccessChain %9 %34 
                                 f32 %92 = OpLoad %91 
                                 f32 %94 = OpFMul %92 %93 
                                 f32 %96 = OpFAdd %94 %95 
                                             OpStore %90 %96 
                        Private f32* %97 = OpAccessChain %9 %34 
                                 f32 %98 = OpLoad %97 
                                 f32 %99 = OpLoad %90 
                                f32 %100 = OpFMul %98 %99 
                                f32 %102 = OpFAdd %100 %101 
                       Private f32* %103 = OpAccessChain %9 %34 
                                             OpStore %103 %102 
                       Private f32* %104 = OpAccessChain %9 %34 
                                f32 %105 = OpLoad %104 
                                f32 %106 = OpLoad %80 
                                f32 %107 = OpFMul %105 %106 
                       Private f32* %108 = OpAccessChain %9 %34 
                                             OpStore %108 %107 
                     Uniform f32_4* %113 = OpAccessChain %40 %110 
                              f32_4 %114 = OpLoad %113 
                              f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                              f32_4 %116 = OpLoad %109 
                              f32_4 %117 = OpVectorShuffle %116 %115 4 5 6 3 
                                             OpStore %109 %117 
                       Private f32* %118 = OpAccessChain %109 %50 
                                             OpStore %118 %77 
                              f32_4 %120 = OpLoad %109 
                              f32_4 %121 = OpFNegate %120 
                     Uniform f32_4* %122 = OpAccessChain %40 %110 
                              f32_4 %123 = OpLoad %122 
                              f32_4 %124 = OpFAdd %121 %123 
                                             OpStore %119 %124 
                              f32_4 %125 = OpLoad %9 
                              f32_4 %126 = OpVectorShuffle %125 %125 0 0 0 0 
                              f32_4 %127 = OpLoad %119 
                              f32_4 %128 = OpFMul %126 %127 
                              f32_4 %129 = OpLoad %109 
                              f32_4 %130 = OpFAdd %128 %129 
                                             OpStore %9 %130 
                              f32_4 %133 = OpLoad %9 
                                             OpStore %132 %133 
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