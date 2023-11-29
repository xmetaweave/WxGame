//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/CubeBlend" {
Properties {
_TexA ("Cubemap", Cube) = "grey" { }
_TexB ("Cubemap", Cube) = "grey" { }
_value ("Value", Range(0, 1)) = 0.5
}
SubShader {
 Tags { "QUEUE" = "Background" "RenderType" = "Background" }
 Pass {
  Tags { "QUEUE" = "Background" "RenderType" = "Background" }
  ZTest Always
  ZWrite Off
  Fog {
   Mode Off
  }
  GpuProgramID 54436
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
uniform 	mediump vec4 _TexA_HDR;
uniform 	mediump vec4 _TexB_HDR;
uniform 	float _Level;
uniform 	float _value;
UNITY_LOCATION(0) uniform mediump samplerCube _TexA;
UNITY_LOCATION(1) uniform mediump samplerCube _TexB;
in highp vec3 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_7;
void main()
{
    u_xlat16_0 = textureLod(_TexA, vs_TEXCOORD0.xyz, _Level);
    u_xlat16_1.x = u_xlat16_0.w + -1.0;
    u_xlat16_1.x = _TexA_HDR.w * u_xlat16_1.x + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * _TexA_HDR.x;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xxx;
    u_xlat16_0 = textureLod(_TexB, vs_TEXCOORD0.xyz, _Level);
    u_xlat16_7 = u_xlat16_0.w + -1.0;
    u_xlat16_7 = _TexB_HDR.w * u_xlat16_7 + 1.0;
    u_xlat16_7 = u_xlat16_7 * _TexB_HDR.x;
    u_xlat16_0.xyz = vec3(u_xlat16_7) * u_xlat16_0.xyz + (-u_xlat16_1.xyz);
    u_xlat0.xyz = vec3(vec3(_value, _value, _value)) * u_xlat16_0.xyz + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _TexA_HDR;
uniform 	mediump vec4 _TexB_HDR;
uniform 	float _Level;
uniform 	float _value;
UNITY_LOCATION(0) uniform mediump samplerCube _TexA;
UNITY_LOCATION(1) uniform mediump samplerCube _TexB;
in highp vec3 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_7;
void main()
{
    u_xlat16_0 = textureLod(_TexA, vs_TEXCOORD0.xyz, _Level);
    u_xlat16_1.x = u_xlat16_0.w + -1.0;
    u_xlat16_1.x = _TexA_HDR.w * u_xlat16_1.x + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * _TexA_HDR.x;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xxx;
    u_xlat16_0 = textureLod(_TexB, vs_TEXCOORD0.xyz, _Level);
    u_xlat16_7 = u_xlat16_0.w + -1.0;
    u_xlat16_7 = _TexB_HDR.w * u_xlat16_7 + 1.0;
    u_xlat16_7 = u_xlat16_7 * _TexB_HDR.x;
    u_xlat16_0.xyz = vec3(u_xlat16_7) * u_xlat16_0.xyz + (-u_xlat16_1.xyz);
    u_xlat0.xyz = vec3(vec3(_value, _value, _value)) * u_xlat16_0.xyz + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _TexA_HDR;
uniform 	mediump vec4 _TexB_HDR;
uniform 	float _Level;
uniform 	float _value;
UNITY_LOCATION(0) uniform mediump samplerCube _TexA;
UNITY_LOCATION(1) uniform mediump samplerCube _TexB;
in highp vec3 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_7;
void main()
{
    u_xlat16_0 = textureLod(_TexA, vs_TEXCOORD0.xyz, _Level);
    u_xlat16_1.x = u_xlat16_0.w + -1.0;
    u_xlat16_1.x = _TexA_HDR.w * u_xlat16_1.x + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * _TexA_HDR.x;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xxx;
    u_xlat16_0 = textureLod(_TexB, vs_TEXCOORD0.xyz, _Level);
    u_xlat16_7 = u_xlat16_0.w + -1.0;
    u_xlat16_7 = _TexB_HDR.w * u_xlat16_7 + 1.0;
    u_xlat16_7 = u_xlat16_7 * _TexB_HDR.x;
    u_xlat16_0.xyz = vec3(u_xlat16_7) * u_xlat16_0.xyz + (-u_xlat16_1.xyz);
    u_xlat0.xyz = vec3(vec3(_value, _value, _value)) * u_xlat16_0.xyz + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
; Bound: 121
; Schema: 0
                                                  OpCapability Shader 
                                           %1 = OpExtInstImport "GLSL.std.450" 
                                                  OpMemoryModel Logical GLSL450 
                                                  OpEntryPoint Fragment %4 "main" %22 %114 
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
                                                  OpMemberDecorate %24 0 RelaxedPrecision 
                                                  OpMemberDecorate %24 0 Offset 24 
                                                  OpMemberDecorate %24 1 RelaxedPrecision 
                                                  OpMemberDecorate %24 1 Offset 24 
                                                  OpMemberDecorate %24 2 Offset 24 
                                                  OpMemberDecorate %24 3 Offset 24 
                                                  OpDecorate %24 Block 
                                                  OpDecorate %26 DescriptorSet 26 
                                                  OpDecorate %26 Binding 26 
                                                  OpDecorate %34 RelaxedPrecision 
                                                  OpDecorate %39 RelaxedPrecision 
                                                  OpDecorate %41 RelaxedPrecision 
                                                  OpDecorate %46 RelaxedPrecision 
                                                  OpDecorate %48 RelaxedPrecision 
                                                  OpDecorate %49 RelaxedPrecision 
                                                  OpDecorate %51 RelaxedPrecision 
                                                  OpDecorate %54 RelaxedPrecision 
                                                  OpDecorate %56 RelaxedPrecision 
                                                  OpDecorate %57 RelaxedPrecision 
                                                  OpDecorate %59 RelaxedPrecision 
                                                  OpDecorate %60 RelaxedPrecision 
                                                  OpDecorate %61 RelaxedPrecision 
                                                  OpDecorate %62 RelaxedPrecision 
                                                  OpDecorate %63 RelaxedPrecision 
                                                  OpDecorate %64 RelaxedPrecision 
                                                  OpDecorate %64 DescriptorSet 64 
                                                  OpDecorate %64 Binding 64 
                                                  OpDecorate %65 RelaxedPrecision 
                                                  OpDecorate %66 RelaxedPrecision 
                                                  OpDecorate %66 DescriptorSet 66 
                                                  OpDecorate %66 Binding 66 
                                                  OpDecorate %67 RelaxedPrecision 
                                                  OpDecorate %73 RelaxedPrecision 
                                                  OpDecorate %75 RelaxedPrecision 
                                                  OpDecorate %76 RelaxedPrecision 
                                                  OpDecorate %79 RelaxedPrecision 
                                                  OpDecorate %80 RelaxedPrecision 
                                                  OpDecorate %81 RelaxedPrecision 
                                                  OpDecorate %82 RelaxedPrecision 
                                                  OpDecorate %83 RelaxedPrecision 
                                                  OpDecorate %85 RelaxedPrecision 
                                                  OpDecorate %86 RelaxedPrecision 
                                                  OpDecorate %87 RelaxedPrecision 
                                                  OpDecorate %88 RelaxedPrecision 
                                                  OpDecorate %89 RelaxedPrecision 
                                                  OpDecorate %90 RelaxedPrecision 
                                                  OpDecorate %91 RelaxedPrecision 
                                                  OpDecorate %92 RelaxedPrecision 
                                                  OpDecorate %93 RelaxedPrecision 
                                                  OpDecorate %94 RelaxedPrecision 
                                                  OpDecorate %95 RelaxedPrecision 
                                                  OpDecorate %104 RelaxedPrecision 
                                                  OpDecorate %105 RelaxedPrecision 
                                                  OpDecorate %106 RelaxedPrecision 
                                                  OpDecorate %107 RelaxedPrecision 
                                                  OpDecorate %108 RelaxedPrecision 
                                                  OpDecorate %109 RelaxedPrecision 
                                                  OpDecorate %110 RelaxedPrecision 
                                                  OpDecorate %111 RelaxedPrecision 
                                                  OpDecorate %112 RelaxedPrecision 
                                                  OpDecorate %114 RelaxedPrecision 
                                                  OpDecorate %114 Location 114 
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
                                          %20 = OpTypeVector %6 3 
                                          %21 = OpTypePointer Input %20 
                    Input f32_3* vs_TEXCOORD0 = OpVariable Input 
                                          %24 = OpTypeStruct %7 %7 %6 %6 
                                          %25 = OpTypePointer Uniform %24 
Uniform struct {f32_4; f32_4; f32; f32;}* %26 = OpVariable Uniform 
                                          %27 = OpTypeInt 32 1 
                                      i32 %28 = OpConstant 2 
                                          %29 = OpTypePointer Uniform %6 
                                          %33 = OpTypePointer Private %20 
                           Private f32_3* %34 = OpVariable Private 
                                          %35 = OpTypeInt 32 0 
                                      u32 %36 = OpConstant 3 
                                          %37 = OpTypePointer Private %6 
                                      f32 %40 = OpConstant 3.674022E-40 
                                      u32 %42 = OpConstant 0 
                                      i32 %44 = OpConstant 0 
                                      f32 %50 = OpConstant 3.674022E-40 
   UniformConstant read_only TextureCube* %64 = OpVariable UniformConstant 
                 UniformConstant sampler* %66 = OpVariable UniformConstant 
                             Private f32* %73 = OpVariable Private 
                                      i32 %77 = OpConstant 1 
                           Private f32_3* %87 = OpVariable Private 
                           Private f32_3* %96 = OpVariable Private 
                                      i32 %97 = OpConstant 3 
                                         %113 = OpTypePointer Output %7 
                           Output f32_4* %114 = OpVariable Output 
                                         %118 = OpTypePointer Output %6 
                                      void %4 = OpFunction None %3 
                                           %5 = OpLabel 
                    read_only TextureCube %13 = OpLoad %12 
                                  sampler %17 = OpLoad %16 
             read_only TextureCubeSampled %19 = OpSampledImage %13 %17 
                                    f32_3 %23 = OpLoad vs_TEXCOORD0 
                             Uniform f32* %30 = OpAccessChain %26 %28 
                                      f32 %31 = OpLoad %30 
                                    f32_4 %32 = OpImageSampleExplicitLod %19 %23 Lod %7 
                                                  OpStore %9 %32 
                             Private f32* %38 = OpAccessChain %9 %36 
                                      f32 %39 = OpLoad %38 
                                      f32 %41 = OpFAdd %39 %40 
                             Private f32* %43 = OpAccessChain %34 %42 
                                                  OpStore %43 %41 
                             Uniform f32* %45 = OpAccessChain %26 %44 %36 
                                      f32 %46 = OpLoad %45 
                             Private f32* %47 = OpAccessChain %34 %42 
                                      f32 %48 = OpLoad %47 
                                      f32 %49 = OpFMul %46 %48 
                                      f32 %51 = OpFAdd %49 %50 
                             Private f32* %52 = OpAccessChain %34 %42 
                                                  OpStore %52 %51 
                             Private f32* %53 = OpAccessChain %34 %42 
                                      f32 %54 = OpLoad %53 
                             Uniform f32* %55 = OpAccessChain %26 %44 %42 
                                      f32 %56 = OpLoad %55 
                                      f32 %57 = OpFMul %54 %56 
                             Private f32* %58 = OpAccessChain %34 %42 
                                                  OpStore %58 %57 
                                    f32_4 %59 = OpLoad %9 
                                    f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                    f32_3 %61 = OpLoad %34 
                                    f32_3 %62 = OpVectorShuffle %61 %61 0 0 0 
                                    f32_3 %63 = OpFMul %60 %62 
                                                  OpStore %34 %63 
                    read_only TextureCube %65 = OpLoad %64 
                                  sampler %67 = OpLoad %66 
             read_only TextureCubeSampled %68 = OpSampledImage %65 %67 
                                    f32_3 %69 = OpLoad vs_TEXCOORD0 
                             Uniform f32* %70 = OpAccessChain %26 %28 
                                      f32 %71 = OpLoad %70 
                                    f32_4 %72 = OpImageSampleExplicitLod %68 %69 Lod %7 
                                                  OpStore %9 %72 
                             Private f32* %74 = OpAccessChain %9 %36 
                                      f32 %75 = OpLoad %74 
                                      f32 %76 = OpFAdd %75 %40 
                                                  OpStore %73 %76 
                             Uniform f32* %78 = OpAccessChain %26 %77 %36 
                                      f32 %79 = OpLoad %78 
                                      f32 %80 = OpLoad %73 
                                      f32 %81 = OpFMul %79 %80 
                                      f32 %82 = OpFAdd %81 %50 
                                                  OpStore %73 %82 
                                      f32 %83 = OpLoad %73 
                             Uniform f32* %84 = OpAccessChain %26 %77 %42 
                                      f32 %85 = OpLoad %84 
                                      f32 %86 = OpFMul %83 %85 
                                                  OpStore %73 %86 
                                      f32 %88 = OpLoad %73 
                                    f32_3 %89 = OpCompositeConstruct %88 %88 %88 
                                    f32_4 %90 = OpLoad %9 
                                    f32_3 %91 = OpVectorShuffle %90 %90 0 1 2 
                                    f32_3 %92 = OpFMul %89 %91 
                                    f32_3 %93 = OpLoad %34 
                                    f32_3 %94 = OpFNegate %93 
                                    f32_3 %95 = OpFAdd %92 %94 
                                                  OpStore %87 %95 
                             Uniform f32* %98 = OpAccessChain %26 %97 
                                      f32 %99 = OpLoad %98 
                            Uniform f32* %100 = OpAccessChain %26 %97 
                                     f32 %101 = OpLoad %100 
                            Uniform f32* %102 = OpAccessChain %26 %97 
                                     f32 %103 = OpLoad %102 
                                   f32_3 %104 = OpCompositeConstruct %99 %101 %103 
                                     f32 %105 = OpCompositeExtract %104 0 
                                     f32 %106 = OpCompositeExtract %104 1 
                                     f32 %107 = OpCompositeExtract %104 2 
                                   f32_3 %108 = OpCompositeConstruct %105 %106 %107 
                                   f32_3 %109 = OpLoad %87 
                                   f32_3 %110 = OpFMul %108 %109 
                                   f32_3 %111 = OpLoad %34 
                                   f32_3 %112 = OpFAdd %110 %111 
                                                  OpStore %96 %112 
                                   f32_3 %115 = OpLoad %96 
                                   f32_4 %116 = OpLoad %114 
                                   f32_4 %117 = OpVectorShuffle %116 %115 4 5 6 3 
                                                  OpStore %114 %117 
                             Output f32* %119 = OpAccessChain %114 %36 
                                                  OpStore %119 %50 
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
; Bound: 121
; Schema: 0
                                                  OpCapability Shader 
                                           %1 = OpExtInstImport "GLSL.std.450" 
                                                  OpMemoryModel Logical GLSL450 
                                                  OpEntryPoint Fragment %4 "main" %22 %114 
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
                                                  OpMemberDecorate %24 0 RelaxedPrecision 
                                                  OpMemberDecorate %24 0 Offset 24 
                                                  OpMemberDecorate %24 1 RelaxedPrecision 
                                                  OpMemberDecorate %24 1 Offset 24 
                                                  OpMemberDecorate %24 2 Offset 24 
                                                  OpMemberDecorate %24 3 Offset 24 
                                                  OpDecorate %24 Block 
                                                  OpDecorate %26 DescriptorSet 26 
                                                  OpDecorate %26 Binding 26 
                                                  OpDecorate %34 RelaxedPrecision 
                                                  OpDecorate %39 RelaxedPrecision 
                                                  OpDecorate %41 RelaxedPrecision 
                                                  OpDecorate %46 RelaxedPrecision 
                                                  OpDecorate %48 RelaxedPrecision 
                                                  OpDecorate %49 RelaxedPrecision 
                                                  OpDecorate %51 RelaxedPrecision 
                                                  OpDecorate %54 RelaxedPrecision 
                                                  OpDecorate %56 RelaxedPrecision 
                                                  OpDecorate %57 RelaxedPrecision 
                                                  OpDecorate %59 RelaxedPrecision 
                                                  OpDecorate %60 RelaxedPrecision 
                                                  OpDecorate %61 RelaxedPrecision 
                                                  OpDecorate %62 RelaxedPrecision 
                                                  OpDecorate %63 RelaxedPrecision 
                                                  OpDecorate %64 RelaxedPrecision 
                                                  OpDecorate %64 DescriptorSet 64 
                                                  OpDecorate %64 Binding 64 
                                                  OpDecorate %65 RelaxedPrecision 
                                                  OpDecorate %66 RelaxedPrecision 
                                                  OpDecorate %66 DescriptorSet 66 
                                                  OpDecorate %66 Binding 66 
                                                  OpDecorate %67 RelaxedPrecision 
                                                  OpDecorate %73 RelaxedPrecision 
                                                  OpDecorate %75 RelaxedPrecision 
                                                  OpDecorate %76 RelaxedPrecision 
                                                  OpDecorate %79 RelaxedPrecision 
                                                  OpDecorate %80 RelaxedPrecision 
                                                  OpDecorate %81 RelaxedPrecision 
                                                  OpDecorate %82 RelaxedPrecision 
                                                  OpDecorate %83 RelaxedPrecision 
                                                  OpDecorate %85 RelaxedPrecision 
                                                  OpDecorate %86 RelaxedPrecision 
                                                  OpDecorate %87 RelaxedPrecision 
                                                  OpDecorate %88 RelaxedPrecision 
                                                  OpDecorate %89 RelaxedPrecision 
                                                  OpDecorate %90 RelaxedPrecision 
                                                  OpDecorate %91 RelaxedPrecision 
                                                  OpDecorate %92 RelaxedPrecision 
                                                  OpDecorate %93 RelaxedPrecision 
                                                  OpDecorate %94 RelaxedPrecision 
                                                  OpDecorate %95 RelaxedPrecision 
                                                  OpDecorate %104 RelaxedPrecision 
                                                  OpDecorate %105 RelaxedPrecision 
                                                  OpDecorate %106 RelaxedPrecision 
                                                  OpDecorate %107 RelaxedPrecision 
                                                  OpDecorate %108 RelaxedPrecision 
                                                  OpDecorate %109 RelaxedPrecision 
                                                  OpDecorate %110 RelaxedPrecision 
                                                  OpDecorate %111 RelaxedPrecision 
                                                  OpDecorate %112 RelaxedPrecision 
                                                  OpDecorate %114 RelaxedPrecision 
                                                  OpDecorate %114 Location 114 
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
                                          %20 = OpTypeVector %6 3 
                                          %21 = OpTypePointer Input %20 
                    Input f32_3* vs_TEXCOORD0 = OpVariable Input 
                                          %24 = OpTypeStruct %7 %7 %6 %6 
                                          %25 = OpTypePointer Uniform %24 
Uniform struct {f32_4; f32_4; f32; f32;}* %26 = OpVariable Uniform 
                                          %27 = OpTypeInt 32 1 
                                      i32 %28 = OpConstant 2 
                                          %29 = OpTypePointer Uniform %6 
                                          %33 = OpTypePointer Private %20 
                           Private f32_3* %34 = OpVariable Private 
                                          %35 = OpTypeInt 32 0 
                                      u32 %36 = OpConstant 3 
                                          %37 = OpTypePointer Private %6 
                                      f32 %40 = OpConstant 3.674022E-40 
                                      u32 %42 = OpConstant 0 
                                      i32 %44 = OpConstant 0 
                                      f32 %50 = OpConstant 3.674022E-40 
   UniformConstant read_only TextureCube* %64 = OpVariable UniformConstant 
                 UniformConstant sampler* %66 = OpVariable UniformConstant 
                             Private f32* %73 = OpVariable Private 
                                      i32 %77 = OpConstant 1 
                           Private f32_3* %87 = OpVariable Private 
                           Private f32_3* %96 = OpVariable Private 
                                      i32 %97 = OpConstant 3 
                                         %113 = OpTypePointer Output %7 
                           Output f32_4* %114 = OpVariable Output 
                                         %118 = OpTypePointer Output %6 
                                      void %4 = OpFunction None %3 
                                           %5 = OpLabel 
                    read_only TextureCube %13 = OpLoad %12 
                                  sampler %17 = OpLoad %16 
             read_only TextureCubeSampled %19 = OpSampledImage %13 %17 
                                    f32_3 %23 = OpLoad vs_TEXCOORD0 
                             Uniform f32* %30 = OpAccessChain %26 %28 
                                      f32 %31 = OpLoad %30 
                                    f32_4 %32 = OpImageSampleExplicitLod %19 %23 Lod %7 
                                                  OpStore %9 %32 
                             Private f32* %38 = OpAccessChain %9 %36 
                                      f32 %39 = OpLoad %38 
                                      f32 %41 = OpFAdd %39 %40 
                             Private f32* %43 = OpAccessChain %34 %42 
                                                  OpStore %43 %41 
                             Uniform f32* %45 = OpAccessChain %26 %44 %36 
                                      f32 %46 = OpLoad %45 
                             Private f32* %47 = OpAccessChain %34 %42 
                                      f32 %48 = OpLoad %47 
                                      f32 %49 = OpFMul %46 %48 
                                      f32 %51 = OpFAdd %49 %50 
                             Private f32* %52 = OpAccessChain %34 %42 
                                                  OpStore %52 %51 
                             Private f32* %53 = OpAccessChain %34 %42 
                                      f32 %54 = OpLoad %53 
                             Uniform f32* %55 = OpAccessChain %26 %44 %42 
                                      f32 %56 = OpLoad %55 
                                      f32 %57 = OpFMul %54 %56 
                             Private f32* %58 = OpAccessChain %34 %42 
                                                  OpStore %58 %57 
                                    f32_4 %59 = OpLoad %9 
                                    f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                    f32_3 %61 = OpLoad %34 
                                    f32_3 %62 = OpVectorShuffle %61 %61 0 0 0 
                                    f32_3 %63 = OpFMul %60 %62 
                                                  OpStore %34 %63 
                    read_only TextureCube %65 = OpLoad %64 
                                  sampler %67 = OpLoad %66 
             read_only TextureCubeSampled %68 = OpSampledImage %65 %67 
                                    f32_3 %69 = OpLoad vs_TEXCOORD0 
                             Uniform f32* %70 = OpAccessChain %26 %28 
                                      f32 %71 = OpLoad %70 
                                    f32_4 %72 = OpImageSampleExplicitLod %68 %69 Lod %7 
                                                  OpStore %9 %72 
                             Private f32* %74 = OpAccessChain %9 %36 
                                      f32 %75 = OpLoad %74 
                                      f32 %76 = OpFAdd %75 %40 
                                                  OpStore %73 %76 
                             Uniform f32* %78 = OpAccessChain %26 %77 %36 
                                      f32 %79 = OpLoad %78 
                                      f32 %80 = OpLoad %73 
                                      f32 %81 = OpFMul %79 %80 
                                      f32 %82 = OpFAdd %81 %50 
                                                  OpStore %73 %82 
                                      f32 %83 = OpLoad %73 
                             Uniform f32* %84 = OpAccessChain %26 %77 %42 
                                      f32 %85 = OpLoad %84 
                                      f32 %86 = OpFMul %83 %85 
                                                  OpStore %73 %86 
                                      f32 %88 = OpLoad %73 
                                    f32_3 %89 = OpCompositeConstruct %88 %88 %88 
                                    f32_4 %90 = OpLoad %9 
                                    f32_3 %91 = OpVectorShuffle %90 %90 0 1 2 
                                    f32_3 %92 = OpFMul %89 %91 
                                    f32_3 %93 = OpLoad %34 
                                    f32_3 %94 = OpFNegate %93 
                                    f32_3 %95 = OpFAdd %92 %94 
                                                  OpStore %87 %95 
                             Uniform f32* %98 = OpAccessChain %26 %97 
                                      f32 %99 = OpLoad %98 
                            Uniform f32* %100 = OpAccessChain %26 %97 
                                     f32 %101 = OpLoad %100 
                            Uniform f32* %102 = OpAccessChain %26 %97 
                                     f32 %103 = OpLoad %102 
                                   f32_3 %104 = OpCompositeConstruct %99 %101 %103 
                                     f32 %105 = OpCompositeExtract %104 0 
                                     f32 %106 = OpCompositeExtract %104 1 
                                     f32 %107 = OpCompositeExtract %104 2 
                                   f32_3 %108 = OpCompositeConstruct %105 %106 %107 
                                   f32_3 %109 = OpLoad %87 
                                   f32_3 %110 = OpFMul %108 %109 
                                   f32_3 %111 = OpLoad %34 
                                   f32_3 %112 = OpFAdd %110 %111 
                                                  OpStore %96 %112 
                                   f32_3 %115 = OpLoad %96 
                                   f32_4 %116 = OpLoad %114 
                                   f32_4 %117 = OpVectorShuffle %116 %115 4 5 6 3 
                                                  OpStore %114 %117 
                             Output f32* %119 = OpAccessChain %114 %36 
                                                  OpStore %119 %50 
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
; Bound: 121
; Schema: 0
                                                  OpCapability Shader 
                                           %1 = OpExtInstImport "GLSL.std.450" 
                                                  OpMemoryModel Logical GLSL450 
                                                  OpEntryPoint Fragment %4 "main" %22 %114 
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
                                                  OpMemberDecorate %24 0 RelaxedPrecision 
                                                  OpMemberDecorate %24 0 Offset 24 
                                                  OpMemberDecorate %24 1 RelaxedPrecision 
                                                  OpMemberDecorate %24 1 Offset 24 
                                                  OpMemberDecorate %24 2 Offset 24 
                                                  OpMemberDecorate %24 3 Offset 24 
                                                  OpDecorate %24 Block 
                                                  OpDecorate %26 DescriptorSet 26 
                                                  OpDecorate %26 Binding 26 
                                                  OpDecorate %34 RelaxedPrecision 
                                                  OpDecorate %39 RelaxedPrecision 
                                                  OpDecorate %41 RelaxedPrecision 
                                                  OpDecorate %46 RelaxedPrecision 
                                                  OpDecorate %48 RelaxedPrecision 
                                                  OpDecorate %49 RelaxedPrecision 
                                                  OpDecorate %51 RelaxedPrecision 
                                                  OpDecorate %54 RelaxedPrecision 
                                                  OpDecorate %56 RelaxedPrecision 
                                                  OpDecorate %57 RelaxedPrecision 
                                                  OpDecorate %59 RelaxedPrecision 
                                                  OpDecorate %60 RelaxedPrecision 
                                                  OpDecorate %61 RelaxedPrecision 
                                                  OpDecorate %62 RelaxedPrecision 
                                                  OpDecorate %63 RelaxedPrecision 
                                                  OpDecorate %64 RelaxedPrecision 
                                                  OpDecorate %64 DescriptorSet 64 
                                                  OpDecorate %64 Binding 64 
                                                  OpDecorate %65 RelaxedPrecision 
                                                  OpDecorate %66 RelaxedPrecision 
                                                  OpDecorate %66 DescriptorSet 66 
                                                  OpDecorate %66 Binding 66 
                                                  OpDecorate %67 RelaxedPrecision 
                                                  OpDecorate %73 RelaxedPrecision 
                                                  OpDecorate %75 RelaxedPrecision 
                                                  OpDecorate %76 RelaxedPrecision 
                                                  OpDecorate %79 RelaxedPrecision 
                                                  OpDecorate %80 RelaxedPrecision 
                                                  OpDecorate %81 RelaxedPrecision 
                                                  OpDecorate %82 RelaxedPrecision 
                                                  OpDecorate %83 RelaxedPrecision 
                                                  OpDecorate %85 RelaxedPrecision 
                                                  OpDecorate %86 RelaxedPrecision 
                                                  OpDecorate %87 RelaxedPrecision 
                                                  OpDecorate %88 RelaxedPrecision 
                                                  OpDecorate %89 RelaxedPrecision 
                                                  OpDecorate %90 RelaxedPrecision 
                                                  OpDecorate %91 RelaxedPrecision 
                                                  OpDecorate %92 RelaxedPrecision 
                                                  OpDecorate %93 RelaxedPrecision 
                                                  OpDecorate %94 RelaxedPrecision 
                                                  OpDecorate %95 RelaxedPrecision 
                                                  OpDecorate %104 RelaxedPrecision 
                                                  OpDecorate %105 RelaxedPrecision 
                                                  OpDecorate %106 RelaxedPrecision 
                                                  OpDecorate %107 RelaxedPrecision 
                                                  OpDecorate %108 RelaxedPrecision 
                                                  OpDecorate %109 RelaxedPrecision 
                                                  OpDecorate %110 RelaxedPrecision 
                                                  OpDecorate %111 RelaxedPrecision 
                                                  OpDecorate %112 RelaxedPrecision 
                                                  OpDecorate %114 RelaxedPrecision 
                                                  OpDecorate %114 Location 114 
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
                                          %20 = OpTypeVector %6 3 
                                          %21 = OpTypePointer Input %20 
                    Input f32_3* vs_TEXCOORD0 = OpVariable Input 
                                          %24 = OpTypeStruct %7 %7 %6 %6 
                                          %25 = OpTypePointer Uniform %24 
Uniform struct {f32_4; f32_4; f32; f32;}* %26 = OpVariable Uniform 
                                          %27 = OpTypeInt 32 1 
                                      i32 %28 = OpConstant 2 
                                          %29 = OpTypePointer Uniform %6 
                                          %33 = OpTypePointer Private %20 
                           Private f32_3* %34 = OpVariable Private 
                                          %35 = OpTypeInt 32 0 
                                      u32 %36 = OpConstant 3 
                                          %37 = OpTypePointer Private %6 
                                      f32 %40 = OpConstant 3.674022E-40 
                                      u32 %42 = OpConstant 0 
                                      i32 %44 = OpConstant 0 
                                      f32 %50 = OpConstant 3.674022E-40 
   UniformConstant read_only TextureCube* %64 = OpVariable UniformConstant 
                 UniformConstant sampler* %66 = OpVariable UniformConstant 
                             Private f32* %73 = OpVariable Private 
                                      i32 %77 = OpConstant 1 
                           Private f32_3* %87 = OpVariable Private 
                           Private f32_3* %96 = OpVariable Private 
                                      i32 %97 = OpConstant 3 
                                         %113 = OpTypePointer Output %7 
                           Output f32_4* %114 = OpVariable Output 
                                         %118 = OpTypePointer Output %6 
                                      void %4 = OpFunction None %3 
                                           %5 = OpLabel 
                    read_only TextureCube %13 = OpLoad %12 
                                  sampler %17 = OpLoad %16 
             read_only TextureCubeSampled %19 = OpSampledImage %13 %17 
                                    f32_3 %23 = OpLoad vs_TEXCOORD0 
                             Uniform f32* %30 = OpAccessChain %26 %28 
                                      f32 %31 = OpLoad %30 
                                    f32_4 %32 = OpImageSampleExplicitLod %19 %23 Lod %7 
                                                  OpStore %9 %32 
                             Private f32* %38 = OpAccessChain %9 %36 
                                      f32 %39 = OpLoad %38 
                                      f32 %41 = OpFAdd %39 %40 
                             Private f32* %43 = OpAccessChain %34 %42 
                                                  OpStore %43 %41 
                             Uniform f32* %45 = OpAccessChain %26 %44 %36 
                                      f32 %46 = OpLoad %45 
                             Private f32* %47 = OpAccessChain %34 %42 
                                      f32 %48 = OpLoad %47 
                                      f32 %49 = OpFMul %46 %48 
                                      f32 %51 = OpFAdd %49 %50 
                             Private f32* %52 = OpAccessChain %34 %42 
                                                  OpStore %52 %51 
                             Private f32* %53 = OpAccessChain %34 %42 
                                      f32 %54 = OpLoad %53 
                             Uniform f32* %55 = OpAccessChain %26 %44 %42 
                                      f32 %56 = OpLoad %55 
                                      f32 %57 = OpFMul %54 %56 
                             Private f32* %58 = OpAccessChain %34 %42 
                                                  OpStore %58 %57 
                                    f32_4 %59 = OpLoad %9 
                                    f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                    f32_3 %61 = OpLoad %34 
                                    f32_3 %62 = OpVectorShuffle %61 %61 0 0 0 
                                    f32_3 %63 = OpFMul %60 %62 
                                                  OpStore %34 %63 
                    read_only TextureCube %65 = OpLoad %64 
                                  sampler %67 = OpLoad %66 
             read_only TextureCubeSampled %68 = OpSampledImage %65 %67 
                                    f32_3 %69 = OpLoad vs_TEXCOORD0 
                             Uniform f32* %70 = OpAccessChain %26 %28 
                                      f32 %71 = OpLoad %70 
                                    f32_4 %72 = OpImageSampleExplicitLod %68 %69 Lod %7 
                                                  OpStore %9 %72 
                             Private f32* %74 = OpAccessChain %9 %36 
                                      f32 %75 = OpLoad %74 
                                      f32 %76 = OpFAdd %75 %40 
                                                  OpStore %73 %76 
                             Uniform f32* %78 = OpAccessChain %26 %77 %36 
                                      f32 %79 = OpLoad %78 
                                      f32 %80 = OpLoad %73 
                                      f32 %81 = OpFMul %79 %80 
                                      f32 %82 = OpFAdd %81 %50 
                                                  OpStore %73 %82 
                                      f32 %83 = OpLoad %73 
                             Uniform f32* %84 = OpAccessChain %26 %77 %42 
                                      f32 %85 = OpLoad %84 
                                      f32 %86 = OpFMul %83 %85 
                                                  OpStore %73 %86 
                                      f32 %88 = OpLoad %73 
                                    f32_3 %89 = OpCompositeConstruct %88 %88 %88 
                                    f32_4 %90 = OpLoad %9 
                                    f32_3 %91 = OpVectorShuffle %90 %90 0 1 2 
                                    f32_3 %92 = OpFMul %89 %91 
                                    f32_3 %93 = OpLoad %34 
                                    f32_3 %94 = OpFNegate %93 
                                    f32_3 %95 = OpFAdd %92 %94 
                                                  OpStore %87 %95 
                             Uniform f32* %98 = OpAccessChain %26 %97 
                                      f32 %99 = OpLoad %98 
                            Uniform f32* %100 = OpAccessChain %26 %97 
                                     f32 %101 = OpLoad %100 
                            Uniform f32* %102 = OpAccessChain %26 %97 
                                     f32 %103 = OpLoad %102 
                                   f32_3 %104 = OpCompositeConstruct %99 %101 %103 
                                     f32 %105 = OpCompositeExtract %104 0 
                                     f32 %106 = OpCompositeExtract %104 1 
                                     f32 %107 = OpCompositeExtract %104 2 
                                   f32_3 %108 = OpCompositeConstruct %105 %106 %107 
                                   f32_3 %109 = OpLoad %87 
                                   f32_3 %110 = OpFMul %108 %109 
                                   f32_3 %111 = OpLoad %34 
                                   f32_3 %112 = OpFAdd %110 %111 
                                                  OpStore %96 %112 
                                   f32_3 %115 = OpLoad %96 
                                   f32_4 %116 = OpLoad %114 
                                   f32_4 %117 = OpVectorShuffle %116 %115 4 5 6 3 
                                                  OpStore %114 %117 
                             Output f32* %119 = OpAccessChain %114 %36 
                                                  OpStore %119 %50 
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
 Tags { "QUEUE" = "Background" "RenderType" = "Background" }
 Pass {
  Tags { "QUEUE" = "Background" "RenderType" = "Background" }
  ZTest Always
  ZWrite Off
  Fog {
   Mode Off
  }
  GpuProgramID 120266
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
uniform 	mediump vec4 _TexA_HDR;
uniform 	mediump vec4 _TexB_HDR;
uniform 	float _Level;
uniform 	float _value;
UNITY_LOCATION(0) uniform mediump samplerCube _TexA;
UNITY_LOCATION(1) uniform mediump samplerCube _TexB;
in highp vec3 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_7;
void main()
{
    u_xlat16_0 = textureLod(_TexA, vs_TEXCOORD0.xyz, _Level);
    u_xlat16_1.x = u_xlat16_0.w + -1.0;
    u_xlat16_1.x = _TexA_HDR.w * u_xlat16_1.x + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * _TexA_HDR.x;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xxx;
    u_xlat16_0 = textureLod(_TexB, vs_TEXCOORD0.xyz, _Level);
    u_xlat16_7 = u_xlat16_0.w + -1.0;
    u_xlat16_7 = _TexB_HDR.w * u_xlat16_7 + 1.0;
    u_xlat16_7 = u_xlat16_7 * _TexB_HDR.x;
    u_xlat16_0.xyz = vec3(u_xlat16_7) * u_xlat16_0.xyz + (-u_xlat16_1.xyz);
    u_xlat0.xyz = vec3(vec3(_value, _value, _value)) * u_xlat16_0.xyz + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _TexA_HDR;
uniform 	mediump vec4 _TexB_HDR;
uniform 	float _Level;
uniform 	float _value;
UNITY_LOCATION(0) uniform mediump samplerCube _TexA;
UNITY_LOCATION(1) uniform mediump samplerCube _TexB;
in highp vec3 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_7;
void main()
{
    u_xlat16_0 = textureLod(_TexA, vs_TEXCOORD0.xyz, _Level);
    u_xlat16_1.x = u_xlat16_0.w + -1.0;
    u_xlat16_1.x = _TexA_HDR.w * u_xlat16_1.x + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * _TexA_HDR.x;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xxx;
    u_xlat16_0 = textureLod(_TexB, vs_TEXCOORD0.xyz, _Level);
    u_xlat16_7 = u_xlat16_0.w + -1.0;
    u_xlat16_7 = _TexB_HDR.w * u_xlat16_7 + 1.0;
    u_xlat16_7 = u_xlat16_7 * _TexB_HDR.x;
    u_xlat16_0.xyz = vec3(u_xlat16_7) * u_xlat16_0.xyz + (-u_xlat16_1.xyz);
    u_xlat0.xyz = vec3(vec3(_value, _value, _value)) * u_xlat16_0.xyz + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _TexA_HDR;
uniform 	mediump vec4 _TexB_HDR;
uniform 	float _Level;
uniform 	float _value;
UNITY_LOCATION(0) uniform mediump samplerCube _TexA;
UNITY_LOCATION(1) uniform mediump samplerCube _TexB;
in highp vec3 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_7;
void main()
{
    u_xlat16_0 = textureLod(_TexA, vs_TEXCOORD0.xyz, _Level);
    u_xlat16_1.x = u_xlat16_0.w + -1.0;
    u_xlat16_1.x = _TexA_HDR.w * u_xlat16_1.x + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * _TexA_HDR.x;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xxx;
    u_xlat16_0 = textureLod(_TexB, vs_TEXCOORD0.xyz, _Level);
    u_xlat16_7 = u_xlat16_0.w + -1.0;
    u_xlat16_7 = _TexB_HDR.w * u_xlat16_7 + 1.0;
    u_xlat16_7 = u_xlat16_7 * _TexB_HDR.x;
    u_xlat16_0.xyz = vec3(u_xlat16_7) * u_xlat16_0.xyz + (-u_xlat16_1.xyz);
    u_xlat0.xyz = vec3(vec3(_value, _value, _value)) * u_xlat16_0.xyz + u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
; Bound: 121
; Schema: 0
                                                  OpCapability Shader 
                                           %1 = OpExtInstImport "GLSL.std.450" 
                                                  OpMemoryModel Logical GLSL450 
                                                  OpEntryPoint Fragment %4 "main" %22 %114 
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
                                                  OpMemberDecorate %24 0 RelaxedPrecision 
                                                  OpMemberDecorate %24 0 Offset 24 
                                                  OpMemberDecorate %24 1 RelaxedPrecision 
                                                  OpMemberDecorate %24 1 Offset 24 
                                                  OpMemberDecorate %24 2 Offset 24 
                                                  OpMemberDecorate %24 3 Offset 24 
                                                  OpDecorate %24 Block 
                                                  OpDecorate %26 DescriptorSet 26 
                                                  OpDecorate %26 Binding 26 
                                                  OpDecorate %34 RelaxedPrecision 
                                                  OpDecorate %39 RelaxedPrecision 
                                                  OpDecorate %41 RelaxedPrecision 
                                                  OpDecorate %46 RelaxedPrecision 
                                                  OpDecorate %48 RelaxedPrecision 
                                                  OpDecorate %49 RelaxedPrecision 
                                                  OpDecorate %51 RelaxedPrecision 
                                                  OpDecorate %54 RelaxedPrecision 
                                                  OpDecorate %56 RelaxedPrecision 
                                                  OpDecorate %57 RelaxedPrecision 
                                                  OpDecorate %59 RelaxedPrecision 
                                                  OpDecorate %60 RelaxedPrecision 
                                                  OpDecorate %61 RelaxedPrecision 
                                                  OpDecorate %62 RelaxedPrecision 
                                                  OpDecorate %63 RelaxedPrecision 
                                                  OpDecorate %64 RelaxedPrecision 
                                                  OpDecorate %64 DescriptorSet 64 
                                                  OpDecorate %64 Binding 64 
                                                  OpDecorate %65 RelaxedPrecision 
                                                  OpDecorate %66 RelaxedPrecision 
                                                  OpDecorate %66 DescriptorSet 66 
                                                  OpDecorate %66 Binding 66 
                                                  OpDecorate %67 RelaxedPrecision 
                                                  OpDecorate %73 RelaxedPrecision 
                                                  OpDecorate %75 RelaxedPrecision 
                                                  OpDecorate %76 RelaxedPrecision 
                                                  OpDecorate %79 RelaxedPrecision 
                                                  OpDecorate %80 RelaxedPrecision 
                                                  OpDecorate %81 RelaxedPrecision 
                                                  OpDecorate %82 RelaxedPrecision 
                                                  OpDecorate %83 RelaxedPrecision 
                                                  OpDecorate %85 RelaxedPrecision 
                                                  OpDecorate %86 RelaxedPrecision 
                                                  OpDecorate %87 RelaxedPrecision 
                                                  OpDecorate %88 RelaxedPrecision 
                                                  OpDecorate %89 RelaxedPrecision 
                                                  OpDecorate %90 RelaxedPrecision 
                                                  OpDecorate %91 RelaxedPrecision 
                                                  OpDecorate %92 RelaxedPrecision 
                                                  OpDecorate %93 RelaxedPrecision 
                                                  OpDecorate %94 RelaxedPrecision 
                                                  OpDecorate %95 RelaxedPrecision 
                                                  OpDecorate %104 RelaxedPrecision 
                                                  OpDecorate %105 RelaxedPrecision 
                                                  OpDecorate %106 RelaxedPrecision 
                                                  OpDecorate %107 RelaxedPrecision 
                                                  OpDecorate %108 RelaxedPrecision 
                                                  OpDecorate %109 RelaxedPrecision 
                                                  OpDecorate %110 RelaxedPrecision 
                                                  OpDecorate %111 RelaxedPrecision 
                                                  OpDecorate %112 RelaxedPrecision 
                                                  OpDecorate %114 RelaxedPrecision 
                                                  OpDecorate %114 Location 114 
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
                                          %20 = OpTypeVector %6 3 
                                          %21 = OpTypePointer Input %20 
                    Input f32_3* vs_TEXCOORD0 = OpVariable Input 
                                          %24 = OpTypeStruct %7 %7 %6 %6 
                                          %25 = OpTypePointer Uniform %24 
Uniform struct {f32_4; f32_4; f32; f32;}* %26 = OpVariable Uniform 
                                          %27 = OpTypeInt 32 1 
                                      i32 %28 = OpConstant 2 
                                          %29 = OpTypePointer Uniform %6 
                                          %33 = OpTypePointer Private %20 
                           Private f32_3* %34 = OpVariable Private 
                                          %35 = OpTypeInt 32 0 
                                      u32 %36 = OpConstant 3 
                                          %37 = OpTypePointer Private %6 
                                      f32 %40 = OpConstant 3.674022E-40 
                                      u32 %42 = OpConstant 0 
                                      i32 %44 = OpConstant 0 
                                      f32 %50 = OpConstant 3.674022E-40 
   UniformConstant read_only TextureCube* %64 = OpVariable UniformConstant 
                 UniformConstant sampler* %66 = OpVariable UniformConstant 
                             Private f32* %73 = OpVariable Private 
                                      i32 %77 = OpConstant 1 
                           Private f32_3* %87 = OpVariable Private 
                           Private f32_3* %96 = OpVariable Private 
                                      i32 %97 = OpConstant 3 
                                         %113 = OpTypePointer Output %7 
                           Output f32_4* %114 = OpVariable Output 
                                         %118 = OpTypePointer Output %6 
                                      void %4 = OpFunction None %3 
                                           %5 = OpLabel 
                    read_only TextureCube %13 = OpLoad %12 
                                  sampler %17 = OpLoad %16 
             read_only TextureCubeSampled %19 = OpSampledImage %13 %17 
                                    f32_3 %23 = OpLoad vs_TEXCOORD0 
                             Uniform f32* %30 = OpAccessChain %26 %28 
                                      f32 %31 = OpLoad %30 
                                    f32_4 %32 = OpImageSampleExplicitLod %19 %23 Lod %7 
                                                  OpStore %9 %32 
                             Private f32* %38 = OpAccessChain %9 %36 
                                      f32 %39 = OpLoad %38 
                                      f32 %41 = OpFAdd %39 %40 
                             Private f32* %43 = OpAccessChain %34 %42 
                                                  OpStore %43 %41 
                             Uniform f32* %45 = OpAccessChain %26 %44 %36 
                                      f32 %46 = OpLoad %45 
                             Private f32* %47 = OpAccessChain %34 %42 
                                      f32 %48 = OpLoad %47 
                                      f32 %49 = OpFMul %46 %48 
                                      f32 %51 = OpFAdd %49 %50 
                             Private f32* %52 = OpAccessChain %34 %42 
                                                  OpStore %52 %51 
                             Private f32* %53 = OpAccessChain %34 %42 
                                      f32 %54 = OpLoad %53 
                             Uniform f32* %55 = OpAccessChain %26 %44 %42 
                                      f32 %56 = OpLoad %55 
                                      f32 %57 = OpFMul %54 %56 
                             Private f32* %58 = OpAccessChain %34 %42 
                                                  OpStore %58 %57 
                                    f32_4 %59 = OpLoad %9 
                                    f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                    f32_3 %61 = OpLoad %34 
                                    f32_3 %62 = OpVectorShuffle %61 %61 0 0 0 
                                    f32_3 %63 = OpFMul %60 %62 
                                                  OpStore %34 %63 
                    read_only TextureCube %65 = OpLoad %64 
                                  sampler %67 = OpLoad %66 
             read_only TextureCubeSampled %68 = OpSampledImage %65 %67 
                                    f32_3 %69 = OpLoad vs_TEXCOORD0 
                             Uniform f32* %70 = OpAccessChain %26 %28 
                                      f32 %71 = OpLoad %70 
                                    f32_4 %72 = OpImageSampleExplicitLod %68 %69 Lod %7 
                                                  OpStore %9 %72 
                             Private f32* %74 = OpAccessChain %9 %36 
                                      f32 %75 = OpLoad %74 
                                      f32 %76 = OpFAdd %75 %40 
                                                  OpStore %73 %76 
                             Uniform f32* %78 = OpAccessChain %26 %77 %36 
                                      f32 %79 = OpLoad %78 
                                      f32 %80 = OpLoad %73 
                                      f32 %81 = OpFMul %79 %80 
                                      f32 %82 = OpFAdd %81 %50 
                                                  OpStore %73 %82 
                                      f32 %83 = OpLoad %73 
                             Uniform f32* %84 = OpAccessChain %26 %77 %42 
                                      f32 %85 = OpLoad %84 
                                      f32 %86 = OpFMul %83 %85 
                                                  OpStore %73 %86 
                                      f32 %88 = OpLoad %73 
                                    f32_3 %89 = OpCompositeConstruct %88 %88 %88 
                                    f32_4 %90 = OpLoad %9 
                                    f32_3 %91 = OpVectorShuffle %90 %90 0 1 2 
                                    f32_3 %92 = OpFMul %89 %91 
                                    f32_3 %93 = OpLoad %34 
                                    f32_3 %94 = OpFNegate %93 
                                    f32_3 %95 = OpFAdd %92 %94 
                                                  OpStore %87 %95 
                             Uniform f32* %98 = OpAccessChain %26 %97 
                                      f32 %99 = OpLoad %98 
                            Uniform f32* %100 = OpAccessChain %26 %97 
                                     f32 %101 = OpLoad %100 
                            Uniform f32* %102 = OpAccessChain %26 %97 
                                     f32 %103 = OpLoad %102 
                                   f32_3 %104 = OpCompositeConstruct %99 %101 %103 
                                     f32 %105 = OpCompositeExtract %104 0 
                                     f32 %106 = OpCompositeExtract %104 1 
                                     f32 %107 = OpCompositeExtract %104 2 
                                   f32_3 %108 = OpCompositeConstruct %105 %106 %107 
                                   f32_3 %109 = OpLoad %87 
                                   f32_3 %110 = OpFMul %108 %109 
                                   f32_3 %111 = OpLoad %34 
                                   f32_3 %112 = OpFAdd %110 %111 
                                                  OpStore %96 %112 
                                   f32_3 %115 = OpLoad %96 
                                   f32_4 %116 = OpLoad %114 
                                   f32_4 %117 = OpVectorShuffle %116 %115 4 5 6 3 
                                                  OpStore %114 %117 
                             Output f32* %119 = OpAccessChain %114 %36 
                                                  OpStore %119 %50 
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
; Bound: 121
; Schema: 0
                                                  OpCapability Shader 
                                           %1 = OpExtInstImport "GLSL.std.450" 
                                                  OpMemoryModel Logical GLSL450 
                                                  OpEntryPoint Fragment %4 "main" %22 %114 
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
                                                  OpMemberDecorate %24 0 RelaxedPrecision 
                                                  OpMemberDecorate %24 0 Offset 24 
                                                  OpMemberDecorate %24 1 RelaxedPrecision 
                                                  OpMemberDecorate %24 1 Offset 24 
                                                  OpMemberDecorate %24 2 Offset 24 
                                                  OpMemberDecorate %24 3 Offset 24 
                                                  OpDecorate %24 Block 
                                                  OpDecorate %26 DescriptorSet 26 
                                                  OpDecorate %26 Binding 26 
                                                  OpDecorate %34 RelaxedPrecision 
                                                  OpDecorate %39 RelaxedPrecision 
                                                  OpDecorate %41 RelaxedPrecision 
                                                  OpDecorate %46 RelaxedPrecision 
                                                  OpDecorate %48 RelaxedPrecision 
                                                  OpDecorate %49 RelaxedPrecision 
                                                  OpDecorate %51 RelaxedPrecision 
                                                  OpDecorate %54 RelaxedPrecision 
                                                  OpDecorate %56 RelaxedPrecision 
                                                  OpDecorate %57 RelaxedPrecision 
                                                  OpDecorate %59 RelaxedPrecision 
                                                  OpDecorate %60 RelaxedPrecision 
                                                  OpDecorate %61 RelaxedPrecision 
                                                  OpDecorate %62 RelaxedPrecision 
                                                  OpDecorate %63 RelaxedPrecision 
                                                  OpDecorate %64 RelaxedPrecision 
                                                  OpDecorate %64 DescriptorSet 64 
                                                  OpDecorate %64 Binding 64 
                                                  OpDecorate %65 RelaxedPrecision 
                                                  OpDecorate %66 RelaxedPrecision 
                                                  OpDecorate %66 DescriptorSet 66 
                                                  OpDecorate %66 Binding 66 
                                                  OpDecorate %67 RelaxedPrecision 
                                                  OpDecorate %73 RelaxedPrecision 
                                                  OpDecorate %75 RelaxedPrecision 
                                                  OpDecorate %76 RelaxedPrecision 
                                                  OpDecorate %79 RelaxedPrecision 
                                                  OpDecorate %80 RelaxedPrecision 
                                                  OpDecorate %81 RelaxedPrecision 
                                                  OpDecorate %82 RelaxedPrecision 
                                                  OpDecorate %83 RelaxedPrecision 
                                                  OpDecorate %85 RelaxedPrecision 
                                                  OpDecorate %86 RelaxedPrecision 
                                                  OpDecorate %87 RelaxedPrecision 
                                                  OpDecorate %88 RelaxedPrecision 
                                                  OpDecorate %89 RelaxedPrecision 
                                                  OpDecorate %90 RelaxedPrecision 
                                                  OpDecorate %91 RelaxedPrecision 
                                                  OpDecorate %92 RelaxedPrecision 
                                                  OpDecorate %93 RelaxedPrecision 
                                                  OpDecorate %94 RelaxedPrecision 
                                                  OpDecorate %95 RelaxedPrecision 
                                                  OpDecorate %104 RelaxedPrecision 
                                                  OpDecorate %105 RelaxedPrecision 
                                                  OpDecorate %106 RelaxedPrecision 
                                                  OpDecorate %107 RelaxedPrecision 
                                                  OpDecorate %108 RelaxedPrecision 
                                                  OpDecorate %109 RelaxedPrecision 
                                                  OpDecorate %110 RelaxedPrecision 
                                                  OpDecorate %111 RelaxedPrecision 
                                                  OpDecorate %112 RelaxedPrecision 
                                                  OpDecorate %114 RelaxedPrecision 
                                                  OpDecorate %114 Location 114 
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
                                          %20 = OpTypeVector %6 3 
                                          %21 = OpTypePointer Input %20 
                    Input f32_3* vs_TEXCOORD0 = OpVariable Input 
                                          %24 = OpTypeStruct %7 %7 %6 %6 
                                          %25 = OpTypePointer Uniform %24 
Uniform struct {f32_4; f32_4; f32; f32;}* %26 = OpVariable Uniform 
                                          %27 = OpTypeInt 32 1 
                                      i32 %28 = OpConstant 2 
                                          %29 = OpTypePointer Uniform %6 
                                          %33 = OpTypePointer Private %20 
                           Private f32_3* %34 = OpVariable Private 
                                          %35 = OpTypeInt 32 0 
                                      u32 %36 = OpConstant 3 
                                          %37 = OpTypePointer Private %6 
                                      f32 %40 = OpConstant 3.674022E-40 
                                      u32 %42 = OpConstant 0 
                                      i32 %44 = OpConstant 0 
                                      f32 %50 = OpConstant 3.674022E-40 
   UniformConstant read_only TextureCube* %64 = OpVariable UniformConstant 
                 UniformConstant sampler* %66 = OpVariable UniformConstant 
                             Private f32* %73 = OpVariable Private 
                                      i32 %77 = OpConstant 1 
                           Private f32_3* %87 = OpVariable Private 
                           Private f32_3* %96 = OpVariable Private 
                                      i32 %97 = OpConstant 3 
                                         %113 = OpTypePointer Output %7 
                           Output f32_4* %114 = OpVariable Output 
                                         %118 = OpTypePointer Output %6 
                                      void %4 = OpFunction None %3 
                                           %5 = OpLabel 
                    read_only TextureCube %13 = OpLoad %12 
                                  sampler %17 = OpLoad %16 
             read_only TextureCubeSampled %19 = OpSampledImage %13 %17 
                                    f32_3 %23 = OpLoad vs_TEXCOORD0 
                             Uniform f32* %30 = OpAccessChain %26 %28 
                                      f32 %31 = OpLoad %30 
                                    f32_4 %32 = OpImageSampleExplicitLod %19 %23 Lod %7 
                                                  OpStore %9 %32 
                             Private f32* %38 = OpAccessChain %9 %36 
                                      f32 %39 = OpLoad %38 
                                      f32 %41 = OpFAdd %39 %40 
                             Private f32* %43 = OpAccessChain %34 %42 
                                                  OpStore %43 %41 
                             Uniform f32* %45 = OpAccessChain %26 %44 %36 
                                      f32 %46 = OpLoad %45 
                             Private f32* %47 = OpAccessChain %34 %42 
                                      f32 %48 = OpLoad %47 
                                      f32 %49 = OpFMul %46 %48 
                                      f32 %51 = OpFAdd %49 %50 
                             Private f32* %52 = OpAccessChain %34 %42 
                                                  OpStore %52 %51 
                             Private f32* %53 = OpAccessChain %34 %42 
                                      f32 %54 = OpLoad %53 
                             Uniform f32* %55 = OpAccessChain %26 %44 %42 
                                      f32 %56 = OpLoad %55 
                                      f32 %57 = OpFMul %54 %56 
                             Private f32* %58 = OpAccessChain %34 %42 
                                                  OpStore %58 %57 
                                    f32_4 %59 = OpLoad %9 
                                    f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                    f32_3 %61 = OpLoad %34 
                                    f32_3 %62 = OpVectorShuffle %61 %61 0 0 0 
                                    f32_3 %63 = OpFMul %60 %62 
                                                  OpStore %34 %63 
                    read_only TextureCube %65 = OpLoad %64 
                                  sampler %67 = OpLoad %66 
             read_only TextureCubeSampled %68 = OpSampledImage %65 %67 
                                    f32_3 %69 = OpLoad vs_TEXCOORD0 
                             Uniform f32* %70 = OpAccessChain %26 %28 
                                      f32 %71 = OpLoad %70 
                                    f32_4 %72 = OpImageSampleExplicitLod %68 %69 Lod %7 
                                                  OpStore %9 %72 
                             Private f32* %74 = OpAccessChain %9 %36 
                                      f32 %75 = OpLoad %74 
                                      f32 %76 = OpFAdd %75 %40 
                                                  OpStore %73 %76 
                             Uniform f32* %78 = OpAccessChain %26 %77 %36 
                                      f32 %79 = OpLoad %78 
                                      f32 %80 = OpLoad %73 
                                      f32 %81 = OpFMul %79 %80 
                                      f32 %82 = OpFAdd %81 %50 
                                                  OpStore %73 %82 
                                      f32 %83 = OpLoad %73 
                             Uniform f32* %84 = OpAccessChain %26 %77 %42 
                                      f32 %85 = OpLoad %84 
                                      f32 %86 = OpFMul %83 %85 
                                                  OpStore %73 %86 
                                      f32 %88 = OpLoad %73 
                                    f32_3 %89 = OpCompositeConstruct %88 %88 %88 
                                    f32_4 %90 = OpLoad %9 
                                    f32_3 %91 = OpVectorShuffle %90 %90 0 1 2 
                                    f32_3 %92 = OpFMul %89 %91 
                                    f32_3 %93 = OpLoad %34 
                                    f32_3 %94 = OpFNegate %93 
                                    f32_3 %95 = OpFAdd %92 %94 
                                                  OpStore %87 %95 
                             Uniform f32* %98 = OpAccessChain %26 %97 
                                      f32 %99 = OpLoad %98 
                            Uniform f32* %100 = OpAccessChain %26 %97 
                                     f32 %101 = OpLoad %100 
                            Uniform f32* %102 = OpAccessChain %26 %97 
                                     f32 %103 = OpLoad %102 
                                   f32_3 %104 = OpCompositeConstruct %99 %101 %103 
                                     f32 %105 = OpCompositeExtract %104 0 
                                     f32 %106 = OpCompositeExtract %104 1 
                                     f32 %107 = OpCompositeExtract %104 2 
                                   f32_3 %108 = OpCompositeConstruct %105 %106 %107 
                                   f32_3 %109 = OpLoad %87 
                                   f32_3 %110 = OpFMul %108 %109 
                                   f32_3 %111 = OpLoad %34 
                                   f32_3 %112 = OpFAdd %110 %111 
                                                  OpStore %96 %112 
                                   f32_3 %115 = OpLoad %96 
                                   f32_4 %116 = OpLoad %114 
                                   f32_4 %117 = OpVectorShuffle %116 %115 4 5 6 3 
                                                  OpStore %114 %117 
                             Output f32* %119 = OpAccessChain %114 %36 
                                                  OpStore %119 %50 
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
; Bound: 121
; Schema: 0
                                                  OpCapability Shader 
                                           %1 = OpExtInstImport "GLSL.std.450" 
                                                  OpMemoryModel Logical GLSL450 
                                                  OpEntryPoint Fragment %4 "main" %22 %114 
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
                                                  OpMemberDecorate %24 0 RelaxedPrecision 
                                                  OpMemberDecorate %24 0 Offset 24 
                                                  OpMemberDecorate %24 1 RelaxedPrecision 
                                                  OpMemberDecorate %24 1 Offset 24 
                                                  OpMemberDecorate %24 2 Offset 24 
                                                  OpMemberDecorate %24 3 Offset 24 
                                                  OpDecorate %24 Block 
                                                  OpDecorate %26 DescriptorSet 26 
                                                  OpDecorate %26 Binding 26 
                                                  OpDecorate %34 RelaxedPrecision 
                                                  OpDecorate %39 RelaxedPrecision 
                                                  OpDecorate %41 RelaxedPrecision 
                                                  OpDecorate %46 RelaxedPrecision 
                                                  OpDecorate %48 RelaxedPrecision 
                                                  OpDecorate %49 RelaxedPrecision 
                                                  OpDecorate %51 RelaxedPrecision 
                                                  OpDecorate %54 RelaxedPrecision 
                                                  OpDecorate %56 RelaxedPrecision 
                                                  OpDecorate %57 RelaxedPrecision 
                                                  OpDecorate %59 RelaxedPrecision 
                                                  OpDecorate %60 RelaxedPrecision 
                                                  OpDecorate %61 RelaxedPrecision 
                                                  OpDecorate %62 RelaxedPrecision 
                                                  OpDecorate %63 RelaxedPrecision 
                                                  OpDecorate %64 RelaxedPrecision 
                                                  OpDecorate %64 DescriptorSet 64 
                                                  OpDecorate %64 Binding 64 
                                                  OpDecorate %65 RelaxedPrecision 
                                                  OpDecorate %66 RelaxedPrecision 
                                                  OpDecorate %66 DescriptorSet 66 
                                                  OpDecorate %66 Binding 66 
                                                  OpDecorate %67 RelaxedPrecision 
                                                  OpDecorate %73 RelaxedPrecision 
                                                  OpDecorate %75 RelaxedPrecision 
                                                  OpDecorate %76 RelaxedPrecision 
                                                  OpDecorate %79 RelaxedPrecision 
                                                  OpDecorate %80 RelaxedPrecision 
                                                  OpDecorate %81 RelaxedPrecision 
                                                  OpDecorate %82 RelaxedPrecision 
                                                  OpDecorate %83 RelaxedPrecision 
                                                  OpDecorate %85 RelaxedPrecision 
                                                  OpDecorate %86 RelaxedPrecision 
                                                  OpDecorate %87 RelaxedPrecision 
                                                  OpDecorate %88 RelaxedPrecision 
                                                  OpDecorate %89 RelaxedPrecision 
                                                  OpDecorate %90 RelaxedPrecision 
                                                  OpDecorate %91 RelaxedPrecision 
                                                  OpDecorate %92 RelaxedPrecision 
                                                  OpDecorate %93 RelaxedPrecision 
                                                  OpDecorate %94 RelaxedPrecision 
                                                  OpDecorate %95 RelaxedPrecision 
                                                  OpDecorate %104 RelaxedPrecision 
                                                  OpDecorate %105 RelaxedPrecision 
                                                  OpDecorate %106 RelaxedPrecision 
                                                  OpDecorate %107 RelaxedPrecision 
                                                  OpDecorate %108 RelaxedPrecision 
                                                  OpDecorate %109 RelaxedPrecision 
                                                  OpDecorate %110 RelaxedPrecision 
                                                  OpDecorate %111 RelaxedPrecision 
                                                  OpDecorate %112 RelaxedPrecision 
                                                  OpDecorate %114 RelaxedPrecision 
                                                  OpDecorate %114 Location 114 
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
                                          %20 = OpTypeVector %6 3 
                                          %21 = OpTypePointer Input %20 
                    Input f32_3* vs_TEXCOORD0 = OpVariable Input 
                                          %24 = OpTypeStruct %7 %7 %6 %6 
                                          %25 = OpTypePointer Uniform %24 
Uniform struct {f32_4; f32_4; f32; f32;}* %26 = OpVariable Uniform 
                                          %27 = OpTypeInt 32 1 
                                      i32 %28 = OpConstant 2 
                                          %29 = OpTypePointer Uniform %6 
                                          %33 = OpTypePointer Private %20 
                           Private f32_3* %34 = OpVariable Private 
                                          %35 = OpTypeInt 32 0 
                                      u32 %36 = OpConstant 3 
                                          %37 = OpTypePointer Private %6 
                                      f32 %40 = OpConstant 3.674022E-40 
                                      u32 %42 = OpConstant 0 
                                      i32 %44 = OpConstant 0 
                                      f32 %50 = OpConstant 3.674022E-40 
   UniformConstant read_only TextureCube* %64 = OpVariable UniformConstant 
                 UniformConstant sampler* %66 = OpVariable UniformConstant 
                             Private f32* %73 = OpVariable Private 
                                      i32 %77 = OpConstant 1 
                           Private f32_3* %87 = OpVariable Private 
                           Private f32_3* %96 = OpVariable Private 
                                      i32 %97 = OpConstant 3 
                                         %113 = OpTypePointer Output %7 
                           Output f32_4* %114 = OpVariable Output 
                                         %118 = OpTypePointer Output %6 
                                      void %4 = OpFunction None %3 
                                           %5 = OpLabel 
                    read_only TextureCube %13 = OpLoad %12 
                                  sampler %17 = OpLoad %16 
             read_only TextureCubeSampled %19 = OpSampledImage %13 %17 
                                    f32_3 %23 = OpLoad vs_TEXCOORD0 
                             Uniform f32* %30 = OpAccessChain %26 %28 
                                      f32 %31 = OpLoad %30 
                                    f32_4 %32 = OpImageSampleExplicitLod %19 %23 Lod %7 
                                                  OpStore %9 %32 
                             Private f32* %38 = OpAccessChain %9 %36 
                                      f32 %39 = OpLoad %38 
                                      f32 %41 = OpFAdd %39 %40 
                             Private f32* %43 = OpAccessChain %34 %42 
                                                  OpStore %43 %41 
                             Uniform f32* %45 = OpAccessChain %26 %44 %36 
                                      f32 %46 = OpLoad %45 
                             Private f32* %47 = OpAccessChain %34 %42 
                                      f32 %48 = OpLoad %47 
                                      f32 %49 = OpFMul %46 %48 
                                      f32 %51 = OpFAdd %49 %50 
                             Private f32* %52 = OpAccessChain %34 %42 
                                                  OpStore %52 %51 
                             Private f32* %53 = OpAccessChain %34 %42 
                                      f32 %54 = OpLoad %53 
                             Uniform f32* %55 = OpAccessChain %26 %44 %42 
                                      f32 %56 = OpLoad %55 
                                      f32 %57 = OpFMul %54 %56 
                             Private f32* %58 = OpAccessChain %34 %42 
                                                  OpStore %58 %57 
                                    f32_4 %59 = OpLoad %9 
                                    f32_3 %60 = OpVectorShuffle %59 %59 0 1 2 
                                    f32_3 %61 = OpLoad %34 
                                    f32_3 %62 = OpVectorShuffle %61 %61 0 0 0 
                                    f32_3 %63 = OpFMul %60 %62 
                                                  OpStore %34 %63 
                    read_only TextureCube %65 = OpLoad %64 
                                  sampler %67 = OpLoad %66 
             read_only TextureCubeSampled %68 = OpSampledImage %65 %67 
                                    f32_3 %69 = OpLoad vs_TEXCOORD0 
                             Uniform f32* %70 = OpAccessChain %26 %28 
                                      f32 %71 = OpLoad %70 
                                    f32_4 %72 = OpImageSampleExplicitLod %68 %69 Lod %7 
                                                  OpStore %9 %72 
                             Private f32* %74 = OpAccessChain %9 %36 
                                      f32 %75 = OpLoad %74 
                                      f32 %76 = OpFAdd %75 %40 
                                                  OpStore %73 %76 
                             Uniform f32* %78 = OpAccessChain %26 %77 %36 
                                      f32 %79 = OpLoad %78 
                                      f32 %80 = OpLoad %73 
                                      f32 %81 = OpFMul %79 %80 
                                      f32 %82 = OpFAdd %81 %50 
                                                  OpStore %73 %82 
                                      f32 %83 = OpLoad %73 
                             Uniform f32* %84 = OpAccessChain %26 %77 %42 
                                      f32 %85 = OpLoad %84 
                                      f32 %86 = OpFMul %83 %85 
                                                  OpStore %73 %86 
                                      f32 %88 = OpLoad %73 
                                    f32_3 %89 = OpCompositeConstruct %88 %88 %88 
                                    f32_4 %90 = OpLoad %9 
                                    f32_3 %91 = OpVectorShuffle %90 %90 0 1 2 
                                    f32_3 %92 = OpFMul %89 %91 
                                    f32_3 %93 = OpLoad %34 
                                    f32_3 %94 = OpFNegate %93 
                                    f32_3 %95 = OpFAdd %92 %94 
                                                  OpStore %87 %95 
                             Uniform f32* %98 = OpAccessChain %26 %97 
                                      f32 %99 = OpLoad %98 
                            Uniform f32* %100 = OpAccessChain %26 %97 
                                     f32 %101 = OpLoad %100 
                            Uniform f32* %102 = OpAccessChain %26 %97 
                                     f32 %103 = OpLoad %102 
                                   f32_3 %104 = OpCompositeConstruct %99 %101 %103 
                                     f32 %105 = OpCompositeExtract %104 0 
                                     f32 %106 = OpCompositeExtract %104 1 
                                     f32 %107 = OpCompositeExtract %104 2 
                                   f32_3 %108 = OpCompositeConstruct %105 %106 %107 
                                   f32_3 %109 = OpLoad %87 
                                   f32_3 %110 = OpFMul %108 %109 
                                   f32_3 %111 = OpLoad %34 
                                   f32_3 %112 = OpFAdd %110 %111 
                                                  OpStore %96 %112 
                                   f32_3 %115 = OpLoad %96 
                                   f32_4 %116 = OpLoad %114 
                                   f32_4 %117 = OpVectorShuffle %116 %115 4 5 6 3 
                                                  OpStore %114 %117 
                             Output f32* %119 = OpAccessChain %114 %36 
                                                  OpStore %119 %50 
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