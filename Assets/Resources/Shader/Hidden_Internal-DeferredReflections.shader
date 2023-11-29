//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-DeferredReflections" {
Properties {
_SrcBlend ("", Float) = 1
_DstBlend ("", Float) = 1
}
SubShader {
 Pass {
  Blend Zero Zero, Zero Zero
  ZWrite Off
  GpuProgramID 19311
Program "vp" {
SubProgram "gles3 " {
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
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
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
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_ProbePosition;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _CameraGBufferTexture0;
UNITY_LOCATION(2) uniform mediump sampler2D _CameraGBufferTexture1;
UNITY_LOCATION(3) uniform mediump sampler2D _CameraGBufferTexture2;
UNITY_LOCATION(4) uniform mediump samplerCube unity_SpecCube0;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec2 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat21;
mediump float u_xlat16_21;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat21 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat21 = _ZBufferParams.x * u_xlat21 + _ZBufferParams.y;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat16_3.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_21 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_21 = inversesqrt(u_xlat16_21);
    u_xlat16_3.xyz = vec3(u_xlat16_21) * u_xlat16_3.xyz;
    u_xlat21 = dot(u_xlat16_3.xyz, (-u_xlat2.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat21) + 1.0;
    u_xlat16_21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_21 = u_xlat16_4.x * u_xlat16_21;
    u_xlat16_21 = u_xlat16_4.x * u_xlat16_21;
    u_xlat16_4 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat16_1 = texture(_CameraGBufferTexture0, u_xlat1.xy).w;
    u_xlat16_5.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_5.x = max(u_xlat16_4.z, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_5.x = u_xlat16_4.w + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xxx;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat16_21 = (-u_xlat16_4.w) + 1.0;
    u_xlat16_26 = (-u_xlat16_21) * 0.699999988 + 1.70000005;
    u_xlat16_26 = u_xlat16_21 * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * 6.0;
    u_xlat16_6.x = dot(u_xlat2.xyz, u_xlat16_3.xyz);
    u_xlat16_6.x = u_xlat16_6.x + u_xlat16_6.x;
    u_xlat16_6.xyz = u_xlat16_3.xyz * (-u_xlat16_6.xxx) + u_xlat2.xyz;
    u_xlat16_2 = textureLod(unity_SpecCube0, u_xlat16_6.xyz, u_xlat16_26);
    u_xlat16_26 = u_xlat16_2.w + -1.0;
    u_xlat16_26 = unity_SpecCube0_HDR.w * u_xlat16_26 + 1.0;
    u_xlat16_26 = u_xlat16_26 * unity_SpecCube0_HDR.x;
    u_xlat16_6.xyz = u_xlat16_2.xyz * vec3(u_xlat16_26);
    u_xlat16_6.xyz = vec3(u_xlat16_1) * u_xlat16_6.xyz;
    SV_Target0.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz + (-unity_SpecCube0_BoxMax.xyz);
    u_xlat16_6.xyz = (-u_xlat0.xyz) + unity_SpecCube0_BoxMin.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, u_xlat16_6.xyz);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_5.x = sqrt(u_xlat16_5.x);
    u_xlat0.x = u_xlat16_5.x / unity_SpecCube1_ProbePosition.w;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat0.x;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 192
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %102 %169 %175 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
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
                                                      OpDecorate vs_TEXCOORD0 Location 102 
                                                      OpDecorate %169 Location 169 
                                                      OpDecorate vs_TEXCOORD1 Location 175 
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
                                              %19 = OpTypeStruct %7 %16 %17 %18 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32;}* %21 = OpVariable Uniform 
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
                                              %84 = OpTypePointer Private %6 
                                          u32 %87 = OpConstant 0 
                                              %88 = OpTypePointer Uniform %6 
                               Private f32_4* %93 = OpVariable Private 
                                              %94 = OpTypeVector %6 3 
                                          f32 %97 = OpConstant 3.674022E-40 
                                        f32_3 %98 = OpConstantComposite %97 %97 %97 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                             %103 = OpTypeVector %6 2 
                                         f32 %158 = OpConstant 3.674022E-40 
                                         f32 %159 = OpConstant 3.674022E-40 
                                       f32_3 %160 = OpConstantComposite %158 %158 %159 
                                             %168 = OpTypePointer Input %94 
                                Input f32_3* %169 = OpVariable Input 
                                             %174 = OpTypePointer Output %94 
                       Output f32_3* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %176 = OpConstant 4 
                                             %186 = OpTypePointer Output %6 
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
                                 Private f32* %85 = OpAccessChain %49 %76 
                                          f32 %86 = OpLoad %85 
                                 Uniform f32* %89 = OpAccessChain %21 %28 %87 
                                          f32 %90 = OpLoad %89 
                                          f32 %91 = OpFMul %86 %90 
                                 Private f32* %92 = OpAccessChain %49 %76 
                                                      OpStore %92 %91 
                                        f32_4 %95 = OpLoad %49 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 3 1 
                                        f32_3 %99 = OpFMul %96 %98 
                                       f32_4 %100 = OpLoad %93 
                                       f32_4 %101 = OpVectorShuffle %100 %99 4 1 5 6 
                                                      OpStore %93 %101 
                                       f32_4 %104 = OpLoad %49 
                                       f32_2 %105 = OpVectorShuffle %104 %104 2 3 
                                       f32_4 %106 = OpLoad vs_TEXCOORD0 
                                       f32_4 %107 = OpVectorShuffle %106 %105 0 1 4 5 
                                                      OpStore vs_TEXCOORD0 %107 
                                       f32_4 %108 = OpLoad %93 
                                       f32_2 %109 = OpVectorShuffle %108 %108 2 2 
                                       f32_4 %110 = OpLoad %93 
                                       f32_2 %111 = OpVectorShuffle %110 %110 0 3 
                                       f32_2 %112 = OpFAdd %109 %111 
                                       f32_4 %113 = OpLoad vs_TEXCOORD0 
                                       f32_4 %114 = OpVectorShuffle %113 %112 4 5 2 3 
                                                      OpStore vs_TEXCOORD0 %114 
                                       f32_4 %115 = OpLoad %9 
                                       f32_3 %116 = OpVectorShuffle %115 %115 1 1 1 
                              Uniform f32_4* %117 = OpAccessChain %21 %36 %23 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                       f32_3 %120 = OpFMul %116 %119 
                                       f32_4 %121 = OpLoad %49 
                                       f32_4 %122 = OpVectorShuffle %121 %120 4 5 6 3 
                                                      OpStore %49 %122 
                              Uniform f32_4* %123 = OpAccessChain %21 %36 %28 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                       f32_4 %126 = OpLoad %9 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 0 0 
                                       f32_3 %128 = OpFMul %125 %127 
                                       f32_4 %129 = OpLoad %49 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                       f32_3 %131 = OpFAdd %128 %130 
                                       f32_4 %132 = OpLoad %49 
                                       f32_4 %133 = OpVectorShuffle %132 %131 4 5 6 3 
                                                      OpStore %49 %133 
                              Uniform f32_4* %134 = OpAccessChain %21 %36 %36 
                                       f32_4 %135 = OpLoad %134 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                       f32_4 %137 = OpLoad %9 
                                       f32_3 %138 = OpVectorShuffle %137 %137 2 2 2 
                                       f32_3 %139 = OpFMul %136 %138 
                                       f32_4 %140 = OpLoad %49 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
                                       f32_3 %142 = OpFAdd %139 %141 
                                       f32_4 %143 = OpLoad %9 
                                       f32_4 %144 = OpVectorShuffle %143 %142 4 5 6 3 
                                                      OpStore %9 %144 
                              Uniform f32_4* %145 = OpAccessChain %21 %36 %45 
                                       f32_4 %146 = OpLoad %145 
                                       f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                       f32_4 %148 = OpLoad %9 
                                       f32_3 %149 = OpVectorShuffle %148 %148 3 3 3 
                                       f32_3 %150 = OpFMul %147 %149 
                                       f32_4 %151 = OpLoad %9 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                                       f32_3 %153 = OpFAdd %150 %152 
                                       f32_4 %154 = OpLoad %9 
                                       f32_4 %155 = OpVectorShuffle %154 %153 4 5 6 3 
                                                      OpStore %9 %155 
                                       f32_4 %156 = OpLoad %9 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                                       f32_3 %161 = OpFMul %157 %160 
                                       f32_4 %162 = OpLoad %49 
                                       f32_4 %163 = OpVectorShuffle %162 %161 4 5 6 3 
                                                      OpStore %49 %163 
                                       f32_4 %164 = OpLoad %9 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                                       f32_3 %166 = OpFNegate %165 
                                       f32_3 %167 = OpFMul %166 %160 
                                       f32_3 %170 = OpLoad %169 
                                       f32_3 %171 = OpFAdd %167 %170 
                                       f32_4 %172 = OpLoad %9 
                                       f32_4 %173 = OpVectorShuffle %172 %171 4 5 6 3 
                                                      OpStore %9 %173 
                                Uniform f32* %177 = OpAccessChain %21 %176 
                                         f32 %178 = OpLoad %177 
                                       f32_3 %179 = OpCompositeConstruct %178 %178 %178 
                                       f32_4 %180 = OpLoad %9 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                                       f32_3 %182 = OpFMul %179 %181 
                                       f32_4 %183 = OpLoad %49 
                                       f32_3 %184 = OpVectorShuffle %183 %183 0 1 2 
                                       f32_3 %185 = OpFAdd %182 %184 
                                                      OpStore vs_TEXCOORD1 %185 
                                 Output f32* %187 = OpAccessChain %80 %28 %76 
                                         f32 %188 = OpLoad %187 
                                         f32 %189 = OpFNegate %188 
                                 Output f32* %190 = OpAccessChain %80 %28 %76 
                                                      OpStore %190 %189 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 375
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %24 %42 %318 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpMemberDecorate %14 0 Offset 14 
                                                      OpMemberDecorate %14 1 Offset 14 
                                                      OpMemberDecorate %14 2 Offset 14 
                                                      OpMemberDecorate %14 3 Offset 14 
                                                      OpMemberDecorate %14 4 Offset 14 
                                                      OpMemberDecorate %14 5 Offset 14 
                                                      OpMemberDecorate %14 6 RelaxedPrecision 
                                                      OpMemberDecorate %14 6 Offset 14 
                                                      OpMemberDecorate %14 7 Offset 14 
                                                      OpDecorate %14 Block 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate vs_TEXCOORD1 Location 24 
                                                      OpDecorate vs_TEXCOORD0 Location 42 
                                                      OpDecorate %51 DescriptorSet 51 
                                                      OpDecorate %51 Binding 51 
                                                      OpDecorate %55 DescriptorSet 55 
                                                      OpDecorate %55 Binding 55 
                                                      OpDecorate %137 RelaxedPrecision 
                                                      OpDecorate %138 RelaxedPrecision 
                                                      OpDecorate %138 DescriptorSet 138 
                                                      OpDecorate %138 Binding 138 
                                                      OpDecorate %139 RelaxedPrecision 
                                                      OpDecorate %140 RelaxedPrecision 
                                                      OpDecorate %140 DescriptorSet 140 
                                                      OpDecorate %140 Binding 140 
                                                      OpDecorate %141 RelaxedPrecision 
                                                      OpDecorate %145 RelaxedPrecision 
                                                      OpDecorate %146 RelaxedPrecision 
                                                      OpDecorate %147 RelaxedPrecision 
                                                      OpDecorate %150 RelaxedPrecision 
                                                      OpDecorate %153 RelaxedPrecision 
                                                      OpDecorate %154 RelaxedPrecision 
                                                      OpDecorate %155 RelaxedPrecision 
                                                      OpDecorate %156 RelaxedPrecision 
                                                      OpDecorate %157 RelaxedPrecision 
                                                      OpDecorate %158 RelaxedPrecision 
                                                      OpDecorate %159 RelaxedPrecision 
                                                      OpDecorate %160 RelaxedPrecision 
                                                      OpDecorate %161 RelaxedPrecision 
                                                      OpDecorate %162 RelaxedPrecision 
                                                      OpDecorate %163 RelaxedPrecision 
                                                      OpDecorate %164 RelaxedPrecision 
                                                      OpDecorate %171 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %176 RelaxedPrecision 
                                                      OpDecorate %177 RelaxedPrecision 
                                                      OpDecorate %178 RelaxedPrecision 
                                                      OpDecorate %179 RelaxedPrecision 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %181 RelaxedPrecision 
                                                      OpDecorate %182 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %185 DescriptorSet 185 
                                                      OpDecorate %185 Binding 185 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %187 DescriptorSet 187 
                                                      OpDecorate %187 Binding 187 
                                                      OpDecorate %188 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %193 DescriptorSet 193 
                                                      OpDecorate %193 Binding 193 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %195 DescriptorSet 195 
                                                      OpDecorate %195 Binding 195 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
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
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %260 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %267 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %277 RelaxedPrecision 
                                                      OpDecorate %278 RelaxedPrecision 
                                                      OpDecorate %279 RelaxedPrecision 
                                                      OpDecorate %280 RelaxedPrecision 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %286 DescriptorSet 286 
                                                      OpDecorate %286 Binding 286 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %288 RelaxedPrecision 
                                                      OpDecorate %288 DescriptorSet 288 
                                                      OpDecorate %288 Binding 288 
                                                      OpDecorate %289 RelaxedPrecision 
                                                      OpDecorate %292 RelaxedPrecision 
                                                      OpDecorate %293 RelaxedPrecision 
                                                      OpDecorate %294 RelaxedPrecision 
                                                      OpDecorate %296 RelaxedPrecision 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate %302 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
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
                                                      OpDecorate %316 RelaxedPrecision 
                                                      OpDecorate %318 RelaxedPrecision 
                                                      OpDecorate %318 Location 318 
                                                      OpDecorate %319 RelaxedPrecision 
                                                      OpDecorate %320 RelaxedPrecision 
                                                      OpDecorate %321 RelaxedPrecision 
                                                      OpDecorate %340 RelaxedPrecision 
                                                      OpDecorate %341 RelaxedPrecision 
                                                      OpDecorate %342 RelaxedPrecision 
                                                      OpDecorate %343 RelaxedPrecision 
                                                      OpDecorate %345 RelaxedPrecision 
                                                      OpDecorate %346 RelaxedPrecision 
                                                      OpDecorate %347 RelaxedPrecision 
                                                      OpDecorate %348 RelaxedPrecision 
                                                      OpDecorate %351 RelaxedPrecision 
                                                      OpDecorate %352 RelaxedPrecision 
                                                      OpDecorate %355 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypeInt 32 0 
                                          u32 %12 = OpConstant 4 
                                              %13 = OpTypeArray %7 %12 
                                              %14 = OpTypeStruct %10 %7 %7 %13 %7 %7 %7 %7 
                                              %15 = OpTypePointer Uniform %14 
Uniform struct {f32_3; f32_4; f32_4; f32_4[4]; f32_4; f32_4; f32_4; f32_4;}* %16 = OpVariable Uniform 
                                              %17 = OpTypeInt 32 1 
                                          i32 %18 = OpConstant 1 
                                          u32 %19 = OpConstant 2 
                                              %20 = OpTypePointer Uniform %6 
                                              %23 = OpTypePointer Input %10 
                        Input f32_3* vs_TEXCOORD1 = OpVariable Input 
                                              %25 = OpTypePointer Input %6 
                                          u32 %29 = OpConstant 0 
                                              %30 = OpTypePointer Private %6 
                                              %38 = OpTypeVector %6 2 
                                              %39 = OpTypePointer Private %38 
                               Private f32_2* %40 = OpVariable Private 
                                              %41 = OpTypePointer Input %7 
                        Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                 Private f32* %48 = OpVariable Private 
                                              %49 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %50 = OpTypePointer UniformConstant %49 
         UniformConstant read_only Texture2D* %51 = OpVariable UniformConstant 
                                              %53 = OpTypeSampler 
                                              %54 = OpTypePointer UniformConstant %53 
                     UniformConstant sampler* %55 = OpVariable UniformConstant 
                                              %57 = OpTypeSampledImage %49 
                                          i32 %62 = OpConstant 2 
                                          u32 %67 = OpConstant 1 
                                          f32 %71 = OpConstant 3.674022E-40 
                                              %81 = OpTypePointer Private %10 
                               Private f32_3* %82 = OpVariable Private 
                                          i32 %85 = OpConstant 3 
                                              %86 = OpTypePointer Uniform %7 
                                          i32 %91 = OpConstant 0 
                                             %123 = OpTypePointer Uniform %10 
                              Private f32_3* %137 = OpVariable Private 
        UniformConstant read_only Texture2D* %138 = OpVariable UniformConstant 
                    UniformConstant sampler* %140 = OpVariable UniformConstant 
                              Private f32_3* %146 = OpVariable Private 
                                         f32 %148 = OpConstant 3.674022E-40 
                                       f32_3 %149 = OpConstantComposite %148 %148 %148 
                                         f32 %151 = OpConstant 3.674022E-40 
                                       f32_3 %152 = OpConstantComposite %151 %151 %151 
                                Private f32* %154 = OpVariable Private 
                                         f32 %169 = OpConstant 3.674022E-40 
                                Private f32* %171 = OpVariable Private 
                              Private f32_4* %184 = OpVariable Private 
        UniformConstant read_only Texture2D* %185 = OpVariable UniformConstant 
                    UniformConstant sampler* %187 = OpVariable UniformConstant 
                                Private f32* %192 = OpVariable Private 
        UniformConstant read_only Texture2D* %193 = OpVariable UniformConstant 
                    UniformConstant sampler* %195 = OpVariable UniformConstant 
                                         u32 %200 = OpConstant 3 
                              Private f32_3* %202 = OpVariable Private 
                                Private f32* %252 = OpVariable Private 
                                         f32 %255 = OpConstant 3.674022E-40 
                                         f32 %257 = OpConstant 3.674022E-40 
                                         f32 %263 = OpConstant 3.674022E-40 
                              Private f32_3* %265 = OpVariable Private 
                              Private f32_4* %283 = OpVariable Private 
                                             %284 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                             %285 = OpTypePointer UniformConstant %284 
      UniformConstant read_only TextureCube* %286 = OpVariable UniformConstant 
                    UniformConstant sampler* %288 = OpVariable UniformConstant 
                                             %290 = OpTypeSampledImage %284 
                                         i32 %298 = OpConstant 6 
                                             %317 = OpTypePointer Output %7 
                               Output f32_4* %318 = OpVariable Output 
                                         i32 %326 = OpConstant 4 
                                         i32 %335 = OpConstant 5 
                                       f32_3 %344 = OpConstantComposite %169 %169 %169 
                                         i32 %356 = OpConstant 7 
                                             %372 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %21 = OpAccessChain %16 %18 %19 
                                          f32 %22 = OpLoad %21 
                                   Input f32* %26 = OpAccessChain vs_TEXCOORD1 %19 
                                          f32 %27 = OpLoad %26 
                                          f32 %28 = OpFDiv %22 %27 
                                 Private f32* %31 = OpAccessChain %9 %29 
                                                      OpStore %31 %28 
                                        f32_4 %32 = OpLoad %9 
                                        f32_3 %33 = OpVectorShuffle %32 %32 0 0 0 
                                        f32_3 %34 = OpLoad vs_TEXCOORD1 
                                        f32_3 %35 = OpFMul %33 %34 
                                        f32_4 %36 = OpLoad %9 
                                        f32_4 %37 = OpVectorShuffle %36 %35 4 5 6 3 
                                                      OpStore %9 %37 
                                        f32_4 %43 = OpLoad vs_TEXCOORD0 
                                        f32_2 %44 = OpVectorShuffle %43 %43 0 1 
                                        f32_4 %45 = OpLoad vs_TEXCOORD0 
                                        f32_2 %46 = OpVectorShuffle %45 %45 3 3 
                                        f32_2 %47 = OpFDiv %44 %46 
                                                      OpStore %40 %47 
                          read_only Texture2D %52 = OpLoad %51 
                                      sampler %56 = OpLoad %55 
                   read_only Texture2DSampled %58 = OpSampledImage %52 %56 
                                        f32_2 %59 = OpLoad %40 
                                        f32_4 %60 = OpImageSampleImplicitLod %58 %59 
                                          f32 %61 = OpCompositeExtract %60 0 
                                                      OpStore %48 %61 
                                 Uniform f32* %63 = OpAccessChain %16 %62 %29 
                                          f32 %64 = OpLoad %63 
                                          f32 %65 = OpLoad %48 
                                          f32 %66 = OpFMul %64 %65 
                                 Uniform f32* %68 = OpAccessChain %16 %62 %67 
                                          f32 %69 = OpLoad %68 
                                          f32 %70 = OpFAdd %66 %69 
                                                      OpStore %48 %70 
                                          f32 %72 = OpLoad %48 
                                          f32 %73 = OpFDiv %71 %72 
                                                      OpStore %48 %73 
                                          f32 %74 = OpLoad %48 
                                        f32_3 %75 = OpCompositeConstruct %74 %74 %74 
                                        f32_4 %76 = OpLoad %9 
                                        f32_3 %77 = OpVectorShuffle %76 %76 0 1 2 
                                        f32_3 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpVectorShuffle %79 %78 4 5 6 3 
                                                      OpStore %9 %80 
                                        f32_4 %83 = OpLoad %9 
                                        f32_3 %84 = OpVectorShuffle %83 %83 1 1 1 
                               Uniform f32_4* %87 = OpAccessChain %16 %85 %18 
                                        f32_4 %88 = OpLoad %87 
                                        f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                        f32_3 %90 = OpFMul %84 %89 
                                                      OpStore %82 %90 
                               Uniform f32_4* %92 = OpAccessChain %16 %85 %91 
                                        f32_4 %93 = OpLoad %92 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                        f32_4 %95 = OpLoad %9 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 0 0 
                                        f32_3 %97 = OpFMul %94 %96 
                                        f32_3 %98 = OpLoad %82 
                                        f32_3 %99 = OpFAdd %97 %98 
                                       f32_4 %100 = OpLoad %9 
                                       f32_4 %101 = OpVectorShuffle %100 %99 4 5 2 6 
                                                      OpStore %9 %101 
                              Uniform f32_4* %102 = OpAccessChain %16 %85 %62 
                                       f32_4 %103 = OpLoad %102 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                       f32_4 %105 = OpLoad %9 
                                       f32_3 %106 = OpVectorShuffle %105 %105 2 2 2 
                                       f32_3 %107 = OpFMul %104 %106 
                                       f32_4 %108 = OpLoad %9 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 3 
                                       f32_3 %110 = OpFAdd %107 %109 
                                       f32_4 %111 = OpLoad %9 
                                       f32_4 %112 = OpVectorShuffle %111 %110 4 5 6 3 
                                                      OpStore %9 %112 
                                       f32_4 %113 = OpLoad %9 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                              Uniform f32_4* %115 = OpAccessChain %16 %85 %85 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_3 %118 = OpFAdd %114 %117 
                                       f32_4 %119 = OpLoad %9 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 6 3 
                                                      OpStore %9 %120 
                                       f32_4 %121 = OpLoad %9 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                              Uniform f32_3* %124 = OpAccessChain %16 %91 
                                       f32_3 %125 = OpLoad %124 
                                       f32_3 %126 = OpFNegate %125 
                                       f32_3 %127 = OpFAdd %122 %126 
                                                      OpStore %82 %127 
                                       f32_3 %128 = OpLoad %82 
                                       f32_3 %129 = OpLoad %82 
                                         f32 %130 = OpDot %128 %129 
                                                      OpStore %48 %130 
                                         f32 %131 = OpLoad %48 
                                         f32 %132 = OpExtInst %1 32 %131 
                                                      OpStore %48 %132 
                                         f32 %133 = OpLoad %48 
                                       f32_3 %134 = OpCompositeConstruct %133 %133 %133 
                                       f32_3 %135 = OpLoad %82 
                                       f32_3 %136 = OpFMul %134 %135 
                                                      OpStore %82 %136 
                         read_only Texture2D %139 = OpLoad %138 
                                     sampler %141 = OpLoad %140 
                  read_only Texture2DSampled %142 = OpSampledImage %139 %141 
                                       f32_2 %143 = OpLoad %40 
                                       f32_4 %144 = OpImageSampleImplicitLod %142 %143 
                                       f32_3 %145 = OpVectorShuffle %144 %144 0 1 2 
                                                      OpStore %137 %145 
                                       f32_3 %147 = OpLoad %137 
                                       f32_3 %150 = OpFMul %147 %149 
                                       f32_3 %153 = OpFAdd %150 %152 
                                                      OpStore %146 %153 
                                       f32_3 %155 = OpLoad %146 
                                       f32_3 %156 = OpLoad %146 
                                         f32 %157 = OpDot %155 %156 
                                                      OpStore %154 %157 
                                         f32 %158 = OpLoad %154 
                                         f32 %159 = OpExtInst %1 32 %158 
                                                      OpStore %154 %159 
                                         f32 %160 = OpLoad %154 
                                       f32_3 %161 = OpCompositeConstruct %160 %160 %160 
                                       f32_3 %162 = OpLoad %146 
                                       f32_3 %163 = OpFMul %161 %162 
                                                      OpStore %146 %163 
                                       f32_3 %164 = OpLoad %146 
                                       f32_3 %165 = OpLoad %82 
                                       f32_3 %166 = OpFNegate %165 
                                         f32 %167 = OpDot %164 %166 
                                                      OpStore %48 %167 
                                         f32 %168 = OpLoad %48 
                                         f32 %170 = OpExtInst %1 43 %168 %169 %71 
                                                      OpStore %48 %170 
                                         f32 %172 = OpLoad %48 
                                         f32 %173 = OpFNegate %172 
                                         f32 %174 = OpFAdd %173 %71 
                                                      OpStore %171 %174 
                                         f32 %175 = OpLoad %171 
                                         f32 %176 = OpLoad %171 
                                         f32 %177 = OpFMul %175 %176 
                                                      OpStore %154 %177 
                                         f32 %178 = OpLoad %171 
                                         f32 %179 = OpLoad %154 
                                         f32 %180 = OpFMul %178 %179 
                                                      OpStore %154 %180 
                                         f32 %181 = OpLoad %171 
                                         f32 %182 = OpLoad %154 
                                         f32 %183 = OpFMul %181 %182 
                                                      OpStore %154 %183 
                         read_only Texture2D %186 = OpLoad %185 
                                     sampler %188 = OpLoad %187 
                  read_only Texture2DSampled %189 = OpSampledImage %186 %188 
                                       f32_2 %190 = OpLoad %40 
                                       f32_4 %191 = OpImageSampleImplicitLod %189 %190 
                                                      OpStore %184 %191 
                         read_only Texture2D %194 = OpLoad %193 
                                     sampler %196 = OpLoad %195 
                  read_only Texture2DSampled %197 = OpSampledImage %194 %196 
                                       f32_2 %198 = OpLoad %40 
                                       f32_4 %199 = OpImageSampleImplicitLod %197 %198 
                                         f32 %201 = OpCompositeExtract %199 3 
                                                      OpStore %192 %201 
                                Private f32* %203 = OpAccessChain %184 %67 
                                         f32 %204 = OpLoad %203 
                                Private f32* %205 = OpAccessChain %184 %29 
                                         f32 %206 = OpLoad %205 
                                         f32 %207 = OpExtInst %1 40 %204 %206 
                                Private f32* %208 = OpAccessChain %202 %29 
                                                      OpStore %208 %207 
                                Private f32* %209 = OpAccessChain %184 %19 
                                         f32 %210 = OpLoad %209 
                                Private f32* %211 = OpAccessChain %202 %29 
                                         f32 %212 = OpLoad %211 
                                         f32 %213 = OpExtInst %1 40 %210 %212 
                                Private f32* %214 = OpAccessChain %202 %29 
                                                      OpStore %214 %213 
                                Private f32* %215 = OpAccessChain %202 %29 
                                         f32 %216 = OpLoad %215 
                                         f32 %217 = OpFNegate %216 
                                         f32 %218 = OpFAdd %217 %71 
                                Private f32* %219 = OpAccessChain %202 %29 
                                                      OpStore %219 %218 
                                Private f32* %220 = OpAccessChain %202 %29 
                                         f32 %221 = OpLoad %220 
                                         f32 %222 = OpFNegate %221 
                                         f32 %223 = OpFAdd %222 %71 
                                Private f32* %224 = OpAccessChain %202 %29 
                                                      OpStore %224 %223 
                                Private f32* %225 = OpAccessChain %184 %200 
                                         f32 %226 = OpLoad %225 
                                Private f32* %227 = OpAccessChain %202 %29 
                                         f32 %228 = OpLoad %227 
                                         f32 %229 = OpFAdd %226 %228 
                                Private f32* %230 = OpAccessChain %202 %29 
                                                      OpStore %230 %229 
                                Private f32* %231 = OpAccessChain %202 %29 
                                         f32 %232 = OpLoad %231 
                                         f32 %233 = OpExtInst %1 43 %232 %169 %71 
                                Private f32* %234 = OpAccessChain %202 %29 
                                                      OpStore %234 %233 
                                       f32_4 %235 = OpLoad %184 
                                       f32_3 %236 = OpVectorShuffle %235 %235 0 1 2 
                                       f32_3 %237 = OpFNegate %236 
                                       f32_3 %238 = OpLoad %202 
                                       f32_3 %239 = OpVectorShuffle %238 %238 0 0 0 
                                       f32_3 %240 = OpFAdd %237 %239 
                                                      OpStore %202 %240 
                                         f32 %241 = OpLoad %154 
                                       f32_3 %242 = OpCompositeConstruct %241 %241 %241 
                                       f32_3 %243 = OpLoad %202 
                                       f32_3 %244 = OpFMul %242 %243 
                                       f32_4 %245 = OpLoad %184 
                                       f32_3 %246 = OpVectorShuffle %245 %245 0 1 2 
                                       f32_3 %247 = OpFAdd %244 %246 
                                                      OpStore %202 %247 
                                Private f32* %248 = OpAccessChain %184 %200 
                                         f32 %249 = OpLoad %248 
                                         f32 %250 = OpFNegate %249 
                                         f32 %251 = OpFAdd %250 %71 
                                                      OpStore %154 %251 
                                         f32 %253 = OpLoad %154 
                                         f32 %254 = OpFNegate %253 
                                         f32 %256 = OpFMul %254 %255 
                                         f32 %258 = OpFAdd %256 %257 
                                                      OpStore %252 %258 
                                         f32 %259 = OpLoad %154 
                                         f32 %260 = OpLoad %252 
                                         f32 %261 = OpFMul %259 %260 
                                                      OpStore %252 %261 
                                         f32 %262 = OpLoad %252 
                                         f32 %264 = OpFMul %262 %263 
                                                      OpStore %252 %264 
                                       f32_3 %266 = OpLoad %82 
                                       f32_3 %267 = OpLoad %146 
                                         f32 %268 = OpDot %266 %267 
                                Private f32* %269 = OpAccessChain %265 %29 
                                                      OpStore %269 %268 
                                Private f32* %270 = OpAccessChain %265 %29 
                                         f32 %271 = OpLoad %270 
                                Private f32* %272 = OpAccessChain %265 %29 
                                         f32 %273 = OpLoad %272 
                                         f32 %274 = OpFAdd %271 %273 
                                Private f32* %275 = OpAccessChain %265 %29 
                                                      OpStore %275 %274 
                                       f32_3 %276 = OpLoad %146 
                                       f32_3 %277 = OpLoad %265 
                                       f32_3 %278 = OpVectorShuffle %277 %277 0 0 0 
                                       f32_3 %279 = OpFNegate %278 
                                       f32_3 %280 = OpFMul %276 %279 
                                       f32_3 %281 = OpLoad %82 
                                       f32_3 %282 = OpFAdd %280 %281 
                                                      OpStore %265 %282 
                       read_only TextureCube %287 = OpLoad %286 
                                     sampler %289 = OpLoad %288 
                read_only TextureCubeSampled %291 = OpSampledImage %287 %289 
                                       f32_3 %292 = OpLoad %265 
                                         f32 %293 = OpLoad %252 
                                       f32_4 %294 = OpImageSampleExplicitLod %291 %292 Lod %7 
                                                      OpStore %283 %294 
                                Private f32* %295 = OpAccessChain %283 %200 
                                         f32 %296 = OpLoad %295 
                                         f32 %297 = OpFAdd %296 %151 
                                                      OpStore %252 %297 
                                Uniform f32* %299 = OpAccessChain %16 %298 %200 
                                         f32 %300 = OpLoad %299 
                                         f32 %301 = OpLoad %252 
                                         f32 %302 = OpFMul %300 %301 
                                         f32 %303 = OpFAdd %302 %71 
                                                      OpStore %252 %303 
                                         f32 %304 = OpLoad %252 
                                Uniform f32* %305 = OpAccessChain %16 %298 %29 
                                         f32 %306 = OpLoad %305 
                                         f32 %307 = OpFMul %304 %306 
                                                      OpStore %252 %307 
                                       f32_4 %308 = OpLoad %283 
                                       f32_3 %309 = OpVectorShuffle %308 %308 0 1 2 
                                         f32 %310 = OpLoad %252 
                                       f32_3 %311 = OpCompositeConstruct %310 %310 %310 
                                       f32_3 %312 = OpFMul %309 %311 
                                                      OpStore %265 %312 
                                         f32 %313 = OpLoad %192 
                                       f32_3 %314 = OpCompositeConstruct %313 %313 %313 
                                       f32_3 %315 = OpLoad %265 
                                       f32_3 %316 = OpFMul %314 %315 
                                                      OpStore %265 %316 
                                       f32_3 %319 = OpLoad %202 
                                       f32_3 %320 = OpLoad %265 
                                       f32_3 %321 = OpFMul %319 %320 
                                       f32_4 %322 = OpLoad %318 
                                       f32_4 %323 = OpVectorShuffle %322 %321 4 5 6 3 
                                                      OpStore %318 %323 
                                       f32_4 %324 = OpLoad %9 
                                       f32_3 %325 = OpVectorShuffle %324 %324 0 1 2 
                              Uniform f32_4* %327 = OpAccessChain %16 %326 
                                       f32_4 %328 = OpLoad %327 
                                       f32_3 %329 = OpVectorShuffle %328 %328 0 1 2 
                                       f32_3 %330 = OpFNegate %329 
                                       f32_3 %331 = OpFAdd %325 %330 
                                                      OpStore %202 %331 
                                       f32_4 %332 = OpLoad %9 
                                       f32_3 %333 = OpVectorShuffle %332 %332 0 1 2 
                                       f32_3 %334 = OpFNegate %333 
                              Uniform f32_4* %336 = OpAccessChain %16 %335 
                                       f32_4 %337 = OpLoad %336 
                                       f32_3 %338 = OpVectorShuffle %337 %337 0 1 2 
                                       f32_3 %339 = OpFAdd %334 %338 
                                                      OpStore %265 %339 
                                       f32_3 %340 = OpLoad %202 
                                       f32_3 %341 = OpLoad %265 
                                       f32_3 %342 = OpExtInst %1 40 %340 %341 
                                                      OpStore %202 %342 
                                       f32_3 %343 = OpLoad %202 
                                       f32_3 %345 = OpExtInst %1 40 %343 %344 
                                                      OpStore %202 %345 
                                       f32_3 %346 = OpLoad %202 
                                       f32_3 %347 = OpLoad %202 
                                         f32 %348 = OpDot %346 %347 
                                Private f32* %349 = OpAccessChain %202 %29 
                                                      OpStore %349 %348 
                                Private f32* %350 = OpAccessChain %202 %29 
                                         f32 %351 = OpLoad %350 
                                         f32 %352 = OpExtInst %1 31 %351 
                                Private f32* %353 = OpAccessChain %202 %29 
                                                      OpStore %353 %352 
                                Private f32* %354 = OpAccessChain %202 %29 
                                         f32 %355 = OpLoad %354 
                                Uniform f32* %357 = OpAccessChain %16 %356 %200 
                                         f32 %358 = OpLoad %357 
                                         f32 %359 = OpFDiv %355 %358 
                                Private f32* %360 = OpAccessChain %9 %29 
                                                      OpStore %360 %359 
                                Private f32* %361 = OpAccessChain %9 %29 
                                         f32 %362 = OpLoad %361 
                                         f32 %363 = OpFNegate %362 
                                         f32 %364 = OpFAdd %363 %71 
                                Private f32* %365 = OpAccessChain %9 %29 
                                                      OpStore %365 %364 
                                Private f32* %366 = OpAccessChain %9 %29 
                                         f32 %367 = OpLoad %366 
                                         f32 %368 = OpExtInst %1 43 %367 %169 %71 
                                Private f32* %369 = OpAccessChain %9 %29 
                                                      OpStore %369 %368 
                                Private f32* %370 = OpAccessChain %9 %29 
                                         f32 %371 = OpLoad %370 
                                 Output f32* %373 = OpAccessChain %318 %200 
                                                      OpStore %373 %371 
                                                      OpReturn
                                                      OpFunctionEnd
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
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
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_ProbePosition;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _CameraGBufferTexture0;
UNITY_LOCATION(2) uniform mediump sampler2D _CameraGBufferTexture1;
UNITY_LOCATION(3) uniform mediump sampler2D _CameraGBufferTexture2;
UNITY_LOCATION(4) uniform mediump samplerCube unity_SpecCube0;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec2 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat18;
mediump float u_xlat16_18;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat18 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat18 = _ZBufferParams.x * u_xlat18 + _ZBufferParams.y;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat16_3.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_3.xyz = vec3(u_xlat16_18) * u_xlat16_3.xyz;
    u_xlat16_4.x = dot(u_xlat2.xyz, u_xlat16_3.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat16_4.xyz = u_xlat16_3.xyz * (-u_xlat16_4.xxx) + u_xlat2.xyz;
    u_xlat18 = dot(u_xlat16_3.xyz, (-u_xlat2.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat16_22 = (-u_xlat18) + 1.0;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
    u_xlat16_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat16_18 = texture(_CameraGBufferTexture0, u_xlat1.xy).w;
    u_xlat16_1 = (-u_xlat16_2.w) + 1.0;
    u_xlat16_5.x = (-u_xlat16_1) * 0.699999988 + 1.70000005;
    u_xlat16_5.x = u_xlat16_1 * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_5.x * 6.0;
    u_xlat16_3 = textureLod(unity_SpecCube0, u_xlat16_4.xyz, u_xlat16_5.x);
    u_xlat16_4.x = u_xlat16_3.w + -1.0;
    u_xlat16_4.x = unity_SpecCube0_HDR.w * u_xlat16_4.x + 1.0;
    u_xlat16_4.x = u_xlat16_4.x * unity_SpecCube0_HDR.x;
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xxx;
    u_xlat16_4.xyz = vec3(u_xlat16_18) * u_xlat16_4.xyz;
    u_xlat16_18 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_5.x = u_xlat16_1 * u_xlat16_18;
    u_xlat16_5.x = (-u_xlat16_5.x) * 0.280000001 + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xxx;
    u_xlat16_5.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_5.x = max(u_xlat16_2.z, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_5.x = u_xlat16_2.w + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = (-u_xlat16_2.xyz) + u_xlat16_5.xxx;
    u_xlat16_5.xyz = vec3(u_xlat16_22) * u_xlat16_5.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz + (-unity_SpecCube0_BoxMax.xyz);
    u_xlat16_5.xyz = (-u_xlat0.xyz) + unity_SpecCube0_BoxMin.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, u_xlat16_5.xyz);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_4.x = sqrt(u_xlat16_4.x);
    u_xlat0.x = u_xlat16_4.x / unity_SpecCube1_ProbePosition.w;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat0.x;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
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
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_ProbePosition;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _CameraGBufferTexture0;
UNITY_LOCATION(2) uniform mediump sampler2D _CameraGBufferTexture1;
UNITY_LOCATION(3) uniform mediump sampler2D _CameraGBufferTexture2;
UNITY_LOCATION(4) uniform mediump samplerCube unity_SpecCube0;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec2 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat18;
mediump float u_xlat16_18;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat18 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat18 = _ZBufferParams.x * u_xlat18 + _ZBufferParams.y;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat16_3.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_18 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat16_18 = inversesqrt(u_xlat16_18);
    u_xlat16_3.xyz = vec3(u_xlat16_18) * u_xlat16_3.xyz;
    u_xlat16_4.x = dot(u_xlat2.xyz, u_xlat16_3.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat16_4.xyz = u_xlat16_3.xyz * (-u_xlat16_4.xxx) + u_xlat2.xyz;
    u_xlat18 = dot(u_xlat16_3.xyz, (-u_xlat2.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat16_22 = (-u_xlat18) + 1.0;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
    u_xlat16_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat16_18 = texture(_CameraGBufferTexture0, u_xlat1.xy).w;
    u_xlat16_1 = (-u_xlat16_2.w) + 1.0;
    u_xlat16_5.x = (-u_xlat16_1) * 0.699999988 + 1.70000005;
    u_xlat16_5.x = u_xlat16_1 * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_5.x * 6.0;
    u_xlat16_3 = textureLod(unity_SpecCube0, u_xlat16_4.xyz, u_xlat16_5.x);
    u_xlat16_4.x = u_xlat16_3.w + -1.0;
    u_xlat16_4.x = unity_SpecCube0_HDR.w * u_xlat16_4.x + 1.0;
    u_xlat16_4.x = u_xlat16_4.x * unity_SpecCube0_HDR.x;
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xxx;
    u_xlat16_4.xyz = vec3(u_xlat16_18) * u_xlat16_4.xyz;
    u_xlat16_18 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_5.x = u_xlat16_1 * u_xlat16_18;
    u_xlat16_5.x = (-u_xlat16_5.x) * 0.280000001 + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xxx;
    u_xlat16_5.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_5.x = max(u_xlat16_2.z, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_5.x = u_xlat16_2.w + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = (-u_xlat16_2.xyz) + u_xlat16_5.xxx;
    u_xlat16_5.xyz = vec3(u_xlat16_22) * u_xlat16_5.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz + (-unity_SpecCube0_BoxMax.xyz);
    u_xlat16_5.xyz = (-u_xlat0.xyz) + unity_SpecCube0_BoxMin.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, u_xlat16_5.xyz);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_4.x = sqrt(u_xlat16_4.x);
    u_xlat0.x = u_xlat16_4.x / unity_SpecCube1_ProbePosition.w;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat0.x;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 192
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %102 %169 %175 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
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
                                                      OpDecorate vs_TEXCOORD0 Location 102 
                                                      OpDecorate %169 Location 169 
                                                      OpDecorate vs_TEXCOORD1 Location 175 
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
                                              %19 = OpTypeStruct %7 %16 %17 %18 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32;}* %21 = OpVariable Uniform 
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
                                              %84 = OpTypePointer Private %6 
                                          u32 %87 = OpConstant 0 
                                              %88 = OpTypePointer Uniform %6 
                               Private f32_4* %93 = OpVariable Private 
                                              %94 = OpTypeVector %6 3 
                                          f32 %97 = OpConstant 3.674022E-40 
                                        f32_3 %98 = OpConstantComposite %97 %97 %97 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                             %103 = OpTypeVector %6 2 
                                         f32 %158 = OpConstant 3.674022E-40 
                                         f32 %159 = OpConstant 3.674022E-40 
                                       f32_3 %160 = OpConstantComposite %158 %158 %159 
                                             %168 = OpTypePointer Input %94 
                                Input f32_3* %169 = OpVariable Input 
                                             %174 = OpTypePointer Output %94 
                       Output f32_3* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %176 = OpConstant 4 
                                             %186 = OpTypePointer Output %6 
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
                                 Private f32* %85 = OpAccessChain %49 %76 
                                          f32 %86 = OpLoad %85 
                                 Uniform f32* %89 = OpAccessChain %21 %28 %87 
                                          f32 %90 = OpLoad %89 
                                          f32 %91 = OpFMul %86 %90 
                                 Private f32* %92 = OpAccessChain %49 %76 
                                                      OpStore %92 %91 
                                        f32_4 %95 = OpLoad %49 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 3 1 
                                        f32_3 %99 = OpFMul %96 %98 
                                       f32_4 %100 = OpLoad %93 
                                       f32_4 %101 = OpVectorShuffle %100 %99 4 1 5 6 
                                                      OpStore %93 %101 
                                       f32_4 %104 = OpLoad %49 
                                       f32_2 %105 = OpVectorShuffle %104 %104 2 3 
                                       f32_4 %106 = OpLoad vs_TEXCOORD0 
                                       f32_4 %107 = OpVectorShuffle %106 %105 0 1 4 5 
                                                      OpStore vs_TEXCOORD0 %107 
                                       f32_4 %108 = OpLoad %93 
                                       f32_2 %109 = OpVectorShuffle %108 %108 2 2 
                                       f32_4 %110 = OpLoad %93 
                                       f32_2 %111 = OpVectorShuffle %110 %110 0 3 
                                       f32_2 %112 = OpFAdd %109 %111 
                                       f32_4 %113 = OpLoad vs_TEXCOORD0 
                                       f32_4 %114 = OpVectorShuffle %113 %112 4 5 2 3 
                                                      OpStore vs_TEXCOORD0 %114 
                                       f32_4 %115 = OpLoad %9 
                                       f32_3 %116 = OpVectorShuffle %115 %115 1 1 1 
                              Uniform f32_4* %117 = OpAccessChain %21 %36 %23 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                       f32_3 %120 = OpFMul %116 %119 
                                       f32_4 %121 = OpLoad %49 
                                       f32_4 %122 = OpVectorShuffle %121 %120 4 5 6 3 
                                                      OpStore %49 %122 
                              Uniform f32_4* %123 = OpAccessChain %21 %36 %28 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                       f32_4 %126 = OpLoad %9 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 0 0 
                                       f32_3 %128 = OpFMul %125 %127 
                                       f32_4 %129 = OpLoad %49 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                       f32_3 %131 = OpFAdd %128 %130 
                                       f32_4 %132 = OpLoad %49 
                                       f32_4 %133 = OpVectorShuffle %132 %131 4 5 6 3 
                                                      OpStore %49 %133 
                              Uniform f32_4* %134 = OpAccessChain %21 %36 %36 
                                       f32_4 %135 = OpLoad %134 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                       f32_4 %137 = OpLoad %9 
                                       f32_3 %138 = OpVectorShuffle %137 %137 2 2 2 
                                       f32_3 %139 = OpFMul %136 %138 
                                       f32_4 %140 = OpLoad %49 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
                                       f32_3 %142 = OpFAdd %139 %141 
                                       f32_4 %143 = OpLoad %9 
                                       f32_4 %144 = OpVectorShuffle %143 %142 4 5 6 3 
                                                      OpStore %9 %144 
                              Uniform f32_4* %145 = OpAccessChain %21 %36 %45 
                                       f32_4 %146 = OpLoad %145 
                                       f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                       f32_4 %148 = OpLoad %9 
                                       f32_3 %149 = OpVectorShuffle %148 %148 3 3 3 
                                       f32_3 %150 = OpFMul %147 %149 
                                       f32_4 %151 = OpLoad %9 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                                       f32_3 %153 = OpFAdd %150 %152 
                                       f32_4 %154 = OpLoad %9 
                                       f32_4 %155 = OpVectorShuffle %154 %153 4 5 6 3 
                                                      OpStore %9 %155 
                                       f32_4 %156 = OpLoad %9 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                                       f32_3 %161 = OpFMul %157 %160 
                                       f32_4 %162 = OpLoad %49 
                                       f32_4 %163 = OpVectorShuffle %162 %161 4 5 6 3 
                                                      OpStore %49 %163 
                                       f32_4 %164 = OpLoad %9 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                                       f32_3 %166 = OpFNegate %165 
                                       f32_3 %167 = OpFMul %166 %160 
                                       f32_3 %170 = OpLoad %169 
                                       f32_3 %171 = OpFAdd %167 %170 
                                       f32_4 %172 = OpLoad %9 
                                       f32_4 %173 = OpVectorShuffle %172 %171 4 5 6 3 
                                                      OpStore %9 %173 
                                Uniform f32* %177 = OpAccessChain %21 %176 
                                         f32 %178 = OpLoad %177 
                                       f32_3 %179 = OpCompositeConstruct %178 %178 %178 
                                       f32_4 %180 = OpLoad %9 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                                       f32_3 %182 = OpFMul %179 %181 
                                       f32_4 %183 = OpLoad %49 
                                       f32_3 %184 = OpVectorShuffle %183 %183 0 1 2 
                                       f32_3 %185 = OpFAdd %182 %184 
                                                      OpStore vs_TEXCOORD1 %185 
                                 Output f32* %187 = OpAccessChain %80 %28 %76 
                                         f32 %188 = OpLoad %187 
                                         f32 %189 = OpFNegate %188 
                                 Output f32* %190 = OpAccessChain %80 %28 %76 
                                                      OpStore %190 %189 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 403
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %24 %42 %346 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpMemberDecorate %14 0 Offset 14 
                                                      OpMemberDecorate %14 1 Offset 14 
                                                      OpMemberDecorate %14 2 Offset 14 
                                                      OpMemberDecorate %14 3 Offset 14 
                                                      OpMemberDecorate %14 4 Offset 14 
                                                      OpMemberDecorate %14 5 Offset 14 
                                                      OpMemberDecorate %14 6 RelaxedPrecision 
                                                      OpMemberDecorate %14 6 Offset 14 
                                                      OpMemberDecorate %14 7 Offset 14 
                                                      OpDecorate %14 Block 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate vs_TEXCOORD1 Location 24 
                                                      OpDecorate vs_TEXCOORD0 Location 42 
                                                      OpDecorate %51 DescriptorSet 51 
                                                      OpDecorate %51 Binding 51 
                                                      OpDecorate %55 DescriptorSet 55 
                                                      OpDecorate %55 Binding 55 
                                                      OpDecorate %137 RelaxedPrecision 
                                                      OpDecorate %138 RelaxedPrecision 
                                                      OpDecorate %138 DescriptorSet 138 
                                                      OpDecorate %138 Binding 138 
                                                      OpDecorate %139 RelaxedPrecision 
                                                      OpDecorate %140 RelaxedPrecision 
                                                      OpDecorate %140 DescriptorSet 140 
                                                      OpDecorate %140 Binding 140 
                                                      OpDecorate %141 RelaxedPrecision 
                                                      OpDecorate %145 RelaxedPrecision 
                                                      OpDecorate %148 RelaxedPrecision 
                                                      OpDecorate %149 RelaxedPrecision 
                                                      OpDecorate %150 RelaxedPrecision 
                                                      OpDecorate %153 RelaxedPrecision 
                                                      OpDecorate %156 RelaxedPrecision 
                                                      OpDecorate %157 RelaxedPrecision 
                                                      OpDecorate %158 RelaxedPrecision 
                                                      OpDecorate %159 RelaxedPrecision 
                                                      OpDecorate %160 RelaxedPrecision 
                                                      OpDecorate %161 RelaxedPrecision 
                                                      OpDecorate %162 RelaxedPrecision 
                                                      OpDecorate %163 RelaxedPrecision 
                                                      OpDecorate %164 RelaxedPrecision 
                                                      OpDecorate %165 RelaxedPrecision 
                                                      OpDecorate %166 RelaxedPrecision 
                                                      OpDecorate %167 RelaxedPrecision 
                                                      OpDecorate %169 RelaxedPrecision 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %176 RelaxedPrecision 
                                                      OpDecorate %178 RelaxedPrecision 
                                                      OpDecorate %179 RelaxedPrecision 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %181 RelaxedPrecision 
                                                      OpDecorate %182 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %203 DescriptorSet 203 
                                                      OpDecorate %203 Binding 203 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %205 DescriptorSet 205 
                                                      OpDecorate %205 Binding 205 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %211 DescriptorSet 211 
                                                      OpDecorate %211 Binding 211 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %213 DescriptorSet 213 
                                                      OpDecorate %213 Binding 213 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %245 DescriptorSet 245 
                                                      OpDecorate %245 Binding 245 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %247 DescriptorSet 247 
                                                      OpDecorate %247 Binding 247 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %277 RelaxedPrecision 
                                                      OpDecorate %278 RelaxedPrecision 
                                                      OpDecorate %279 RelaxedPrecision 
                                                      OpDecorate %280 RelaxedPrecision 
                                                      OpDecorate %281 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %284 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %291 RelaxedPrecision 
                                                      OpDecorate %293 RelaxedPrecision 
                                                      OpDecorate %294 RelaxedPrecision 
                                                      OpDecorate %296 RelaxedPrecision 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %298 RelaxedPrecision 
                                                      OpDecorate %299 RelaxedPrecision 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %307 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate %313 RelaxedPrecision 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %315 RelaxedPrecision 
                                                      OpDecorate %318 RelaxedPrecision 
                                                      OpDecorate %319 RelaxedPrecision 
                                                      OpDecorate %320 RelaxedPrecision 
                                                      OpDecorate %323 RelaxedPrecision 
                                                      OpDecorate %325 RelaxedPrecision 
                                                      OpDecorate %326 RelaxedPrecision 
                                                      OpDecorate %329 RelaxedPrecision 
                                                      OpDecorate %330 RelaxedPrecision 
                                                      OpDecorate %332 RelaxedPrecision 
                                                      OpDecorate %333 RelaxedPrecision 
                                                      OpDecorate %334 RelaxedPrecision 
                                                      OpDecorate %335 RelaxedPrecision 
                                                      OpDecorate %336 RelaxedPrecision 
                                                      OpDecorate %337 RelaxedPrecision 
                                                      OpDecorate %338 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %340 RelaxedPrecision 
                                                      OpDecorate %341 RelaxedPrecision 
                                                      OpDecorate %342 RelaxedPrecision 
                                                      OpDecorate %343 RelaxedPrecision 
                                                      OpDecorate %344 RelaxedPrecision 
                                                      OpDecorate %346 RelaxedPrecision 
                                                      OpDecorate %346 Location 346 
                                                      OpDecorate %347 RelaxedPrecision 
                                                      OpDecorate %348 RelaxedPrecision 
                                                      OpDecorate %349 RelaxedPrecision 
                                                      OpDecorate %368 RelaxedPrecision 
                                                      OpDecorate %369 RelaxedPrecision 
                                                      OpDecorate %370 RelaxedPrecision 
                                                      OpDecorate %371 RelaxedPrecision 
                                                      OpDecorate %373 RelaxedPrecision 
                                                      OpDecorate %374 RelaxedPrecision 
                                                      OpDecorate %375 RelaxedPrecision 
                                                      OpDecorate %376 RelaxedPrecision 
                                                      OpDecorate %379 RelaxedPrecision 
                                                      OpDecorate %380 RelaxedPrecision 
                                                      OpDecorate %383 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypeInt 32 0 
                                          u32 %12 = OpConstant 4 
                                              %13 = OpTypeArray %7 %12 
                                              %14 = OpTypeStruct %10 %7 %7 %13 %7 %7 %7 %7 
                                              %15 = OpTypePointer Uniform %14 
Uniform struct {f32_3; f32_4; f32_4; f32_4[4]; f32_4; f32_4; f32_4; f32_4;}* %16 = OpVariable Uniform 
                                              %17 = OpTypeInt 32 1 
                                          i32 %18 = OpConstant 1 
                                          u32 %19 = OpConstant 2 
                                              %20 = OpTypePointer Uniform %6 
                                              %23 = OpTypePointer Input %10 
                        Input f32_3* vs_TEXCOORD1 = OpVariable Input 
                                              %25 = OpTypePointer Input %6 
                                          u32 %29 = OpConstant 0 
                                              %30 = OpTypePointer Private %6 
                                              %38 = OpTypeVector %6 2 
                                              %39 = OpTypePointer Private %38 
                               Private f32_2* %40 = OpVariable Private 
                                              %41 = OpTypePointer Input %7 
                        Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                 Private f32* %48 = OpVariable Private 
                                              %49 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %50 = OpTypePointer UniformConstant %49 
         UniformConstant read_only Texture2D* %51 = OpVariable UniformConstant 
                                              %53 = OpTypeSampler 
                                              %54 = OpTypePointer UniformConstant %53 
                     UniformConstant sampler* %55 = OpVariable UniformConstant 
                                              %57 = OpTypeSampledImage %49 
                                          i32 %62 = OpConstant 2 
                                          u32 %67 = OpConstant 1 
                                          f32 %71 = OpConstant 3.674022E-40 
                                              %81 = OpTypePointer Private %10 
                               Private f32_3* %82 = OpVariable Private 
                                          i32 %85 = OpConstant 3 
                                              %86 = OpTypePointer Uniform %7 
                                          i32 %91 = OpConstant 0 
                                             %123 = OpTypePointer Uniform %10 
                              Private f32_4* %137 = OpVariable Private 
        UniformConstant read_only Texture2D* %138 = OpVariable UniformConstant 
                    UniformConstant sampler* %140 = OpVariable UniformConstant 
                              Private f32_3* %148 = OpVariable Private 
                                         f32 %151 = OpConstant 3.674022E-40 
                                       f32_3 %152 = OpConstantComposite %151 %151 %151 
                                         f32 %154 = OpConstant 3.674022E-40 
                                       f32_3 %155 = OpConstantComposite %154 %154 %154 
                                Private f32* %157 = OpVariable Private 
                              Private f32_3* %167 = OpVariable Private 
                                         f32 %190 = OpConstant 3.674022E-40 
                                Private f32* %192 = OpVariable Private 
                              Private f32_4* %202 = OpVariable Private 
        UniformConstant read_only Texture2D* %203 = OpVariable UniformConstant 
                    UniformConstant sampler* %205 = OpVariable UniformConstant 
                                Private f32* %210 = OpVariable Private 
        UniformConstant read_only Texture2D* %211 = OpVariable UniformConstant 
                    UniformConstant sampler* %213 = OpVariable UniformConstant 
                                         u32 %218 = OpConstant 3 
                                Private f32* %220 = OpVariable Private 
                              Private f32_3* %225 = OpVariable Private 
                                         f32 %228 = OpConstant 3.674022E-40 
                                         f32 %230 = OpConstant 3.674022E-40 
                                         f32 %240 = OpConstant 3.674022E-40 
                                             %243 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                             %244 = OpTypePointer UniformConstant %243 
      UniformConstant read_only TextureCube* %245 = OpVariable UniformConstant 
                    UniformConstant sampler* %247 = OpVariable UniformConstant 
                                             %249 = OpTypeSampledImage %243 
                                         i32 %259 = OpConstant 6 
                                         f32 %292 = OpConstant 3.674022E-40 
                                             %345 = OpTypePointer Output %7 
                               Output f32_4* %346 = OpVariable Output 
                                         i32 %354 = OpConstant 4 
                                         i32 %363 = OpConstant 5 
                                       f32_3 %372 = OpConstantComposite %190 %190 %190 
                                         i32 %384 = OpConstant 7 
                                             %400 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %21 = OpAccessChain %16 %18 %19 
                                          f32 %22 = OpLoad %21 
                                   Input f32* %26 = OpAccessChain vs_TEXCOORD1 %19 
                                          f32 %27 = OpLoad %26 
                                          f32 %28 = OpFDiv %22 %27 
                                 Private f32* %31 = OpAccessChain %9 %29 
                                                      OpStore %31 %28 
                                        f32_4 %32 = OpLoad %9 
                                        f32_3 %33 = OpVectorShuffle %32 %32 0 0 0 
                                        f32_3 %34 = OpLoad vs_TEXCOORD1 
                                        f32_3 %35 = OpFMul %33 %34 
                                        f32_4 %36 = OpLoad %9 
                                        f32_4 %37 = OpVectorShuffle %36 %35 4 5 6 3 
                                                      OpStore %9 %37 
                                        f32_4 %43 = OpLoad vs_TEXCOORD0 
                                        f32_2 %44 = OpVectorShuffle %43 %43 0 1 
                                        f32_4 %45 = OpLoad vs_TEXCOORD0 
                                        f32_2 %46 = OpVectorShuffle %45 %45 3 3 
                                        f32_2 %47 = OpFDiv %44 %46 
                                                      OpStore %40 %47 
                          read_only Texture2D %52 = OpLoad %51 
                                      sampler %56 = OpLoad %55 
                   read_only Texture2DSampled %58 = OpSampledImage %52 %56 
                                        f32_2 %59 = OpLoad %40 
                                        f32_4 %60 = OpImageSampleImplicitLod %58 %59 
                                          f32 %61 = OpCompositeExtract %60 0 
                                                      OpStore %48 %61 
                                 Uniform f32* %63 = OpAccessChain %16 %62 %29 
                                          f32 %64 = OpLoad %63 
                                          f32 %65 = OpLoad %48 
                                          f32 %66 = OpFMul %64 %65 
                                 Uniform f32* %68 = OpAccessChain %16 %62 %67 
                                          f32 %69 = OpLoad %68 
                                          f32 %70 = OpFAdd %66 %69 
                                                      OpStore %48 %70 
                                          f32 %72 = OpLoad %48 
                                          f32 %73 = OpFDiv %71 %72 
                                                      OpStore %48 %73 
                                          f32 %74 = OpLoad %48 
                                        f32_3 %75 = OpCompositeConstruct %74 %74 %74 
                                        f32_4 %76 = OpLoad %9 
                                        f32_3 %77 = OpVectorShuffle %76 %76 0 1 2 
                                        f32_3 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpVectorShuffle %79 %78 4 5 6 3 
                                                      OpStore %9 %80 
                                        f32_4 %83 = OpLoad %9 
                                        f32_3 %84 = OpVectorShuffle %83 %83 1 1 1 
                               Uniform f32_4* %87 = OpAccessChain %16 %85 %18 
                                        f32_4 %88 = OpLoad %87 
                                        f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                        f32_3 %90 = OpFMul %84 %89 
                                                      OpStore %82 %90 
                               Uniform f32_4* %92 = OpAccessChain %16 %85 %91 
                                        f32_4 %93 = OpLoad %92 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                        f32_4 %95 = OpLoad %9 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 0 0 
                                        f32_3 %97 = OpFMul %94 %96 
                                        f32_3 %98 = OpLoad %82 
                                        f32_3 %99 = OpFAdd %97 %98 
                                       f32_4 %100 = OpLoad %9 
                                       f32_4 %101 = OpVectorShuffle %100 %99 4 5 2 6 
                                                      OpStore %9 %101 
                              Uniform f32_4* %102 = OpAccessChain %16 %85 %62 
                                       f32_4 %103 = OpLoad %102 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                       f32_4 %105 = OpLoad %9 
                                       f32_3 %106 = OpVectorShuffle %105 %105 2 2 2 
                                       f32_3 %107 = OpFMul %104 %106 
                                       f32_4 %108 = OpLoad %9 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 3 
                                       f32_3 %110 = OpFAdd %107 %109 
                                       f32_4 %111 = OpLoad %9 
                                       f32_4 %112 = OpVectorShuffle %111 %110 4 5 6 3 
                                                      OpStore %9 %112 
                                       f32_4 %113 = OpLoad %9 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                              Uniform f32_4* %115 = OpAccessChain %16 %85 %85 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_3 %118 = OpFAdd %114 %117 
                                       f32_4 %119 = OpLoad %9 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 6 3 
                                                      OpStore %9 %120 
                                       f32_4 %121 = OpLoad %9 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                              Uniform f32_3* %124 = OpAccessChain %16 %91 
                                       f32_3 %125 = OpLoad %124 
                                       f32_3 %126 = OpFNegate %125 
                                       f32_3 %127 = OpFAdd %122 %126 
                                                      OpStore %82 %127 
                                       f32_3 %128 = OpLoad %82 
                                       f32_3 %129 = OpLoad %82 
                                         f32 %130 = OpDot %128 %129 
                                                      OpStore %48 %130 
                                         f32 %131 = OpLoad %48 
                                         f32 %132 = OpExtInst %1 32 %131 
                                                      OpStore %48 %132 
                                         f32 %133 = OpLoad %48 
                                       f32_3 %134 = OpCompositeConstruct %133 %133 %133 
                                       f32_3 %135 = OpLoad %82 
                                       f32_3 %136 = OpFMul %134 %135 
                                                      OpStore %82 %136 
                         read_only Texture2D %139 = OpLoad %138 
                                     sampler %141 = OpLoad %140 
                  read_only Texture2DSampled %142 = OpSampledImage %139 %141 
                                       f32_2 %143 = OpLoad %40 
                                       f32_4 %144 = OpImageSampleImplicitLod %142 %143 
                                       f32_3 %145 = OpVectorShuffle %144 %144 0 1 2 
                                       f32_4 %146 = OpLoad %137 
                                       f32_4 %147 = OpVectorShuffle %146 %145 4 5 6 3 
                                                      OpStore %137 %147 
                                       f32_4 %149 = OpLoad %137 
                                       f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
                                       f32_3 %153 = OpFMul %150 %152 
                                       f32_3 %156 = OpFAdd %153 %155 
                                                      OpStore %148 %156 
                                       f32_3 %158 = OpLoad %148 
                                       f32_3 %159 = OpLoad %148 
                                         f32 %160 = OpDot %158 %159 
                                                      OpStore %157 %160 
                                         f32 %161 = OpLoad %157 
                                         f32 %162 = OpExtInst %1 32 %161 
                                                      OpStore %157 %162 
                                         f32 %163 = OpLoad %157 
                                       f32_3 %164 = OpCompositeConstruct %163 %163 %163 
                                       f32_3 %165 = OpLoad %148 
                                       f32_3 %166 = OpFMul %164 %165 
                                                      OpStore %148 %166 
                                       f32_3 %168 = OpLoad %82 
                                       f32_3 %169 = OpLoad %148 
                                         f32 %170 = OpDot %168 %169 
                                Private f32* %171 = OpAccessChain %167 %29 
                                                      OpStore %171 %170 
                                Private f32* %172 = OpAccessChain %167 %29 
                                         f32 %173 = OpLoad %172 
                                Private f32* %174 = OpAccessChain %167 %29 
                                         f32 %175 = OpLoad %174 
                                         f32 %176 = OpFAdd %173 %175 
                                Private f32* %177 = OpAccessChain %167 %29 
                                                      OpStore %177 %176 
                                       f32_3 %178 = OpLoad %148 
                                       f32_3 %179 = OpLoad %167 
                                       f32_3 %180 = OpVectorShuffle %179 %179 0 0 0 
                                       f32_3 %181 = OpFNegate %180 
                                       f32_3 %182 = OpFMul %178 %181 
                                       f32_3 %183 = OpLoad %82 
                                       f32_3 %184 = OpFAdd %182 %183 
                                                      OpStore %167 %184 
                                       f32_3 %185 = OpLoad %148 
                                       f32_3 %186 = OpLoad %82 
                                       f32_3 %187 = OpFNegate %186 
                                         f32 %188 = OpDot %185 %187 
                                                      OpStore %48 %188 
                                         f32 %189 = OpLoad %48 
                                         f32 %191 = OpExtInst %1 43 %189 %190 %71 
                                                      OpStore %48 %191 
                                         f32 %193 = OpLoad %48 
                                         f32 %194 = OpFNegate %193 
                                         f32 %195 = OpFAdd %194 %71 
                                                      OpStore %192 %195 
                                         f32 %196 = OpLoad %192 
                                         f32 %197 = OpLoad %192 
                                         f32 %198 = OpFMul %196 %197 
                                                      OpStore %192 %198 
                                         f32 %199 = OpLoad %192 
                                         f32 %200 = OpLoad %192 
                                         f32 %201 = OpFMul %199 %200 
                                                      OpStore %192 %201 
                         read_only Texture2D %204 = OpLoad %203 
                                     sampler %206 = OpLoad %205 
                  read_only Texture2DSampled %207 = OpSampledImage %204 %206 
                                       f32_2 %208 = OpLoad %40 
                                       f32_4 %209 = OpImageSampleImplicitLod %207 %208 
                                                      OpStore %202 %209 
                         read_only Texture2D %212 = OpLoad %211 
                                     sampler %214 = OpLoad %213 
                  read_only Texture2DSampled %215 = OpSampledImage %212 %214 
                                       f32_2 %216 = OpLoad %40 
                                       f32_4 %217 = OpImageSampleImplicitLod %215 %216 
                                         f32 %219 = OpCompositeExtract %217 3 
                                                      OpStore %210 %219 
                                Private f32* %221 = OpAccessChain %202 %218 
                                         f32 %222 = OpLoad %221 
                                         f32 %223 = OpFNegate %222 
                                         f32 %224 = OpFAdd %223 %71 
                                                      OpStore %220 %224 
                                         f32 %226 = OpLoad %220 
                                         f32 %227 = OpFNegate %226 
                                         f32 %229 = OpFMul %227 %228 
                                         f32 %231 = OpFAdd %229 %230 
                                Private f32* %232 = OpAccessChain %225 %29 
                                                      OpStore %232 %231 
                                         f32 %233 = OpLoad %220 
                                Private f32* %234 = OpAccessChain %225 %29 
                                         f32 %235 = OpLoad %234 
                                         f32 %236 = OpFMul %233 %235 
                                Private f32* %237 = OpAccessChain %225 %29 
                                                      OpStore %237 %236 
                                Private f32* %238 = OpAccessChain %225 %29 
                                         f32 %239 = OpLoad %238 
                                         f32 %241 = OpFMul %239 %240 
                                Private f32* %242 = OpAccessChain %225 %29 
                                                      OpStore %242 %241 
                       read_only TextureCube %246 = OpLoad %245 
                                     sampler %248 = OpLoad %247 
                read_only TextureCubeSampled %250 = OpSampledImage %246 %248 
                                       f32_3 %251 = OpLoad %167 
                                Private f32* %252 = OpAccessChain %225 %29 
                                         f32 %253 = OpLoad %252 
                                       f32_4 %254 = OpImageSampleExplicitLod %250 %251 Lod %7 
                                                      OpStore %137 %254 
                                Private f32* %255 = OpAccessChain %137 %218 
                                         f32 %256 = OpLoad %255 
                                         f32 %257 = OpFAdd %256 %154 
                                Private f32* %258 = OpAccessChain %167 %29 
                                                      OpStore %258 %257 
                                Uniform f32* %260 = OpAccessChain %16 %259 %218 
                                         f32 %261 = OpLoad %260 
                                Private f32* %262 = OpAccessChain %167 %29 
                                         f32 %263 = OpLoad %262 
                                         f32 %264 = OpFMul %261 %263 
                                         f32 %265 = OpFAdd %264 %71 
                                Private f32* %266 = OpAccessChain %167 %29 
                                                      OpStore %266 %265 
                                Private f32* %267 = OpAccessChain %167 %29 
                                         f32 %268 = OpLoad %267 
                                Uniform f32* %269 = OpAccessChain %16 %259 %29 
                                         f32 %270 = OpLoad %269 
                                         f32 %271 = OpFMul %268 %270 
                                Private f32* %272 = OpAccessChain %167 %29 
                                                      OpStore %272 %271 
                                       f32_4 %273 = OpLoad %137 
                                       f32_3 %274 = OpVectorShuffle %273 %273 0 1 2 
                                       f32_3 %275 = OpLoad %167 
                                       f32_3 %276 = OpVectorShuffle %275 %275 0 0 0 
                                       f32_3 %277 = OpFMul %274 %276 
                                                      OpStore %167 %277 
                                         f32 %278 = OpLoad %210 
                                       f32_3 %279 = OpCompositeConstruct %278 %278 %278 
                                       f32_3 %280 = OpLoad %167 
                                       f32_3 %281 = OpFMul %279 %280 
                                                      OpStore %167 %281 
                                         f32 %282 = OpLoad %220 
                                         f32 %283 = OpLoad %220 
                                         f32 %284 = OpFMul %282 %283 
                                                      OpStore %157 %284 
                                         f32 %285 = OpLoad %220 
                                         f32 %286 = OpLoad %157 
                                         f32 %287 = OpFMul %285 %286 
                                Private f32* %288 = OpAccessChain %225 %29 
                                                      OpStore %288 %287 
                                Private f32* %289 = OpAccessChain %225 %29 
                                         f32 %290 = OpLoad %289 
                                         f32 %291 = OpFNegate %290 
                                         f32 %293 = OpFMul %291 %292 
                                         f32 %294 = OpFAdd %293 %71 
                                Private f32* %295 = OpAccessChain %225 %29 
                                                      OpStore %295 %294 
                                       f32_3 %296 = OpLoad %167 
                                       f32_3 %297 = OpLoad %225 
                                       f32_3 %298 = OpVectorShuffle %297 %297 0 0 0 
                                       f32_3 %299 = OpFMul %296 %298 
                                                      OpStore %167 %299 
                                Private f32* %300 = OpAccessChain %202 %67 
                                         f32 %301 = OpLoad %300 
                                Private f32* %302 = OpAccessChain %202 %29 
                                         f32 %303 = OpLoad %302 
                                         f32 %304 = OpExtInst %1 40 %301 %303 
                                Private f32* %305 = OpAccessChain %225 %29 
                                                      OpStore %305 %304 
                                Private f32* %306 = OpAccessChain %202 %19 
                                         f32 %307 = OpLoad %306 
                                Private f32* %308 = OpAccessChain %225 %29 
                                         f32 %309 = OpLoad %308 
                                         f32 %310 = OpExtInst %1 40 %307 %309 
                                Private f32* %311 = OpAccessChain %225 %29 
                                                      OpStore %311 %310 
                                Private f32* %312 = OpAccessChain %225 %29 
                                         f32 %313 = OpLoad %312 
                                         f32 %314 = OpFNegate %313 
                                         f32 %315 = OpFAdd %314 %71 
                                Private f32* %316 = OpAccessChain %225 %29 
                                                      OpStore %316 %315 
                                Private f32* %317 = OpAccessChain %225 %29 
                                         f32 %318 = OpLoad %317 
                                         f32 %319 = OpFNegate %318 
                                         f32 %320 = OpFAdd %319 %71 
                                Private f32* %321 = OpAccessChain %225 %29 
                                                      OpStore %321 %320 
                                Private f32* %322 = OpAccessChain %202 %218 
                                         f32 %323 = OpLoad %322 
                                Private f32* %324 = OpAccessChain %225 %29 
                                         f32 %325 = OpLoad %324 
                                         f32 %326 = OpFAdd %323 %325 
                                Private f32* %327 = OpAccessChain %225 %29 
                                                      OpStore %327 %326 
                                Private f32* %328 = OpAccessChain %225 %29 
                                         f32 %329 = OpLoad %328 
                                         f32 %330 = OpExtInst %1 43 %329 %190 %71 
                                Private f32* %331 = OpAccessChain %225 %29 
                                                      OpStore %331 %330 
                                       f32_4 %332 = OpLoad %202 
                                       f32_3 %333 = OpVectorShuffle %332 %332 0 1 2 
                                       f32_3 %334 = OpFNegate %333 
                                       f32_3 %335 = OpLoad %225 
                                       f32_3 %336 = OpVectorShuffle %335 %335 0 0 0 
                                       f32_3 %337 = OpFAdd %334 %336 
                                                      OpStore %225 %337 
                                         f32 %338 = OpLoad %192 
                                       f32_3 %339 = OpCompositeConstruct %338 %338 %338 
                                       f32_3 %340 = OpLoad %225 
                                       f32_3 %341 = OpFMul %339 %340 
                                       f32_4 %342 = OpLoad %202 
                                       f32_3 %343 = OpVectorShuffle %342 %342 0 1 2 
                                       f32_3 %344 = OpFAdd %341 %343 
                                                      OpStore %225 %344 
                                       f32_3 %347 = OpLoad %167 
                                       f32_3 %348 = OpLoad %225 
                                       f32_3 %349 = OpFMul %347 %348 
                                       f32_4 %350 = OpLoad %346 
                                       f32_4 %351 = OpVectorShuffle %350 %349 4 5 6 3 
                                                      OpStore %346 %351 
                                       f32_4 %352 = OpLoad %9 
                                       f32_3 %353 = OpVectorShuffle %352 %352 0 1 2 
                              Uniform f32_4* %355 = OpAccessChain %16 %354 
                                       f32_4 %356 = OpLoad %355 
                                       f32_3 %357 = OpVectorShuffle %356 %356 0 1 2 
                                       f32_3 %358 = OpFNegate %357 
                                       f32_3 %359 = OpFAdd %353 %358 
                                                      OpStore %167 %359 
                                       f32_4 %360 = OpLoad %9 
                                       f32_3 %361 = OpVectorShuffle %360 %360 0 1 2 
                                       f32_3 %362 = OpFNegate %361 
                              Uniform f32_4* %364 = OpAccessChain %16 %363 
                                       f32_4 %365 = OpLoad %364 
                                       f32_3 %366 = OpVectorShuffle %365 %365 0 1 2 
                                       f32_3 %367 = OpFAdd %362 %366 
                                                      OpStore %225 %367 
                                       f32_3 %368 = OpLoad %167 
                                       f32_3 %369 = OpLoad %225 
                                       f32_3 %370 = OpExtInst %1 40 %368 %369 
                                                      OpStore %167 %370 
                                       f32_3 %371 = OpLoad %167 
                                       f32_3 %373 = OpExtInst %1 40 %371 %372 
                                                      OpStore %167 %373 
                                       f32_3 %374 = OpLoad %167 
                                       f32_3 %375 = OpLoad %167 
                                         f32 %376 = OpDot %374 %375 
                                Private f32* %377 = OpAccessChain %167 %29 
                                                      OpStore %377 %376 
                                Private f32* %378 = OpAccessChain %167 %29 
                                         f32 %379 = OpLoad %378 
                                         f32 %380 = OpExtInst %1 31 %379 
                                Private f32* %381 = OpAccessChain %167 %29 
                                                      OpStore %381 %380 
                                Private f32* %382 = OpAccessChain %167 %29 
                                         f32 %383 = OpLoad %382 
                                Uniform f32* %385 = OpAccessChain %16 %384 %218 
                                         f32 %386 = OpLoad %385 
                                         f32 %387 = OpFDiv %383 %386 
                                Private f32* %388 = OpAccessChain %9 %29 
                                                      OpStore %388 %387 
                                Private f32* %389 = OpAccessChain %9 %29 
                                         f32 %390 = OpLoad %389 
                                         f32 %391 = OpFNegate %390 
                                         f32 %392 = OpFAdd %391 %71 
                                Private f32* %393 = OpAccessChain %9 %29 
                                                      OpStore %393 %392 
                                Private f32* %394 = OpAccessChain %9 %29 
                                         f32 %395 = OpLoad %394 
                                         f32 %396 = OpExtInst %1 43 %395 %190 %71 
                                Private f32* %397 = OpAccessChain %9 %29 
                                                      OpStore %397 %396 
                                Private f32* %398 = OpAccessChain %9 %29 
                                         f32 %399 = OpLoad %398 
                                 Output f32* %401 = OpAccessChain %346 %218 
                                                      OpStore %401 %399 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 192
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %102 %169 %175 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
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
                                                      OpDecorate vs_TEXCOORD0 Location 102 
                                                      OpDecorate %169 Location 169 
                                                      OpDecorate vs_TEXCOORD1 Location 175 
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
                                              %19 = OpTypeStruct %7 %16 %17 %18 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32;}* %21 = OpVariable Uniform 
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
                                              %84 = OpTypePointer Private %6 
                                          u32 %87 = OpConstant 0 
                                              %88 = OpTypePointer Uniform %6 
                               Private f32_4* %93 = OpVariable Private 
                                              %94 = OpTypeVector %6 3 
                                          f32 %97 = OpConstant 3.674022E-40 
                                        f32_3 %98 = OpConstantComposite %97 %97 %97 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                             %103 = OpTypeVector %6 2 
                                         f32 %158 = OpConstant 3.674022E-40 
                                         f32 %159 = OpConstant 3.674022E-40 
                                       f32_3 %160 = OpConstantComposite %158 %158 %159 
                                             %168 = OpTypePointer Input %94 
                                Input f32_3* %169 = OpVariable Input 
                                             %174 = OpTypePointer Output %94 
                       Output f32_3* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %176 = OpConstant 4 
                                             %186 = OpTypePointer Output %6 
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
                                 Private f32* %85 = OpAccessChain %49 %76 
                                          f32 %86 = OpLoad %85 
                                 Uniform f32* %89 = OpAccessChain %21 %28 %87 
                                          f32 %90 = OpLoad %89 
                                          f32 %91 = OpFMul %86 %90 
                                 Private f32* %92 = OpAccessChain %49 %76 
                                                      OpStore %92 %91 
                                        f32_4 %95 = OpLoad %49 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 3 1 
                                        f32_3 %99 = OpFMul %96 %98 
                                       f32_4 %100 = OpLoad %93 
                                       f32_4 %101 = OpVectorShuffle %100 %99 4 1 5 6 
                                                      OpStore %93 %101 
                                       f32_4 %104 = OpLoad %49 
                                       f32_2 %105 = OpVectorShuffle %104 %104 2 3 
                                       f32_4 %106 = OpLoad vs_TEXCOORD0 
                                       f32_4 %107 = OpVectorShuffle %106 %105 0 1 4 5 
                                                      OpStore vs_TEXCOORD0 %107 
                                       f32_4 %108 = OpLoad %93 
                                       f32_2 %109 = OpVectorShuffle %108 %108 2 2 
                                       f32_4 %110 = OpLoad %93 
                                       f32_2 %111 = OpVectorShuffle %110 %110 0 3 
                                       f32_2 %112 = OpFAdd %109 %111 
                                       f32_4 %113 = OpLoad vs_TEXCOORD0 
                                       f32_4 %114 = OpVectorShuffle %113 %112 4 5 2 3 
                                                      OpStore vs_TEXCOORD0 %114 
                                       f32_4 %115 = OpLoad %9 
                                       f32_3 %116 = OpVectorShuffle %115 %115 1 1 1 
                              Uniform f32_4* %117 = OpAccessChain %21 %36 %23 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                       f32_3 %120 = OpFMul %116 %119 
                                       f32_4 %121 = OpLoad %49 
                                       f32_4 %122 = OpVectorShuffle %121 %120 4 5 6 3 
                                                      OpStore %49 %122 
                              Uniform f32_4* %123 = OpAccessChain %21 %36 %28 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                       f32_4 %126 = OpLoad %9 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 0 0 
                                       f32_3 %128 = OpFMul %125 %127 
                                       f32_4 %129 = OpLoad %49 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                       f32_3 %131 = OpFAdd %128 %130 
                                       f32_4 %132 = OpLoad %49 
                                       f32_4 %133 = OpVectorShuffle %132 %131 4 5 6 3 
                                                      OpStore %49 %133 
                              Uniform f32_4* %134 = OpAccessChain %21 %36 %36 
                                       f32_4 %135 = OpLoad %134 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                       f32_4 %137 = OpLoad %9 
                                       f32_3 %138 = OpVectorShuffle %137 %137 2 2 2 
                                       f32_3 %139 = OpFMul %136 %138 
                                       f32_4 %140 = OpLoad %49 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
                                       f32_3 %142 = OpFAdd %139 %141 
                                       f32_4 %143 = OpLoad %9 
                                       f32_4 %144 = OpVectorShuffle %143 %142 4 5 6 3 
                                                      OpStore %9 %144 
                              Uniform f32_4* %145 = OpAccessChain %21 %36 %45 
                                       f32_4 %146 = OpLoad %145 
                                       f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                       f32_4 %148 = OpLoad %9 
                                       f32_3 %149 = OpVectorShuffle %148 %148 3 3 3 
                                       f32_3 %150 = OpFMul %147 %149 
                                       f32_4 %151 = OpLoad %9 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                                       f32_3 %153 = OpFAdd %150 %152 
                                       f32_4 %154 = OpLoad %9 
                                       f32_4 %155 = OpVectorShuffle %154 %153 4 5 6 3 
                                                      OpStore %9 %155 
                                       f32_4 %156 = OpLoad %9 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                                       f32_3 %161 = OpFMul %157 %160 
                                       f32_4 %162 = OpLoad %49 
                                       f32_4 %163 = OpVectorShuffle %162 %161 4 5 6 3 
                                                      OpStore %49 %163 
                                       f32_4 %164 = OpLoad %9 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                                       f32_3 %166 = OpFNegate %165 
                                       f32_3 %167 = OpFMul %166 %160 
                                       f32_3 %170 = OpLoad %169 
                                       f32_3 %171 = OpFAdd %167 %170 
                                       f32_4 %172 = OpLoad %9 
                                       f32_4 %173 = OpVectorShuffle %172 %171 4 5 6 3 
                                                      OpStore %9 %173 
                                Uniform f32* %177 = OpAccessChain %21 %176 
                                         f32 %178 = OpLoad %177 
                                       f32_3 %179 = OpCompositeConstruct %178 %178 %178 
                                       f32_4 %180 = OpLoad %9 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                                       f32_3 %182 = OpFMul %179 %181 
                                       f32_4 %183 = OpLoad %49 
                                       f32_3 %184 = OpVectorShuffle %183 %183 0 1 2 
                                       f32_3 %185 = OpFAdd %182 %184 
                                                      OpStore vs_TEXCOORD1 %185 
                                 Output f32* %187 = OpAccessChain %80 %28 %76 
                                         f32 %188 = OpLoad %187 
                                         f32 %189 = OpFNegate %188 
                                 Output f32* %190 = OpAccessChain %80 %28 %76 
                                                      OpStore %190 %189 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 403
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %24 %42 %346 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpMemberDecorate %14 0 Offset 14 
                                                      OpMemberDecorate %14 1 Offset 14 
                                                      OpMemberDecorate %14 2 Offset 14 
                                                      OpMemberDecorate %14 3 Offset 14 
                                                      OpMemberDecorate %14 4 Offset 14 
                                                      OpMemberDecorate %14 5 Offset 14 
                                                      OpMemberDecorate %14 6 RelaxedPrecision 
                                                      OpMemberDecorate %14 6 Offset 14 
                                                      OpMemberDecorate %14 7 Offset 14 
                                                      OpDecorate %14 Block 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate vs_TEXCOORD1 Location 24 
                                                      OpDecorate vs_TEXCOORD0 Location 42 
                                                      OpDecorate %51 DescriptorSet 51 
                                                      OpDecorate %51 Binding 51 
                                                      OpDecorate %55 DescriptorSet 55 
                                                      OpDecorate %55 Binding 55 
                                                      OpDecorate %137 RelaxedPrecision 
                                                      OpDecorate %138 RelaxedPrecision 
                                                      OpDecorate %138 DescriptorSet 138 
                                                      OpDecorate %138 Binding 138 
                                                      OpDecorate %139 RelaxedPrecision 
                                                      OpDecorate %140 RelaxedPrecision 
                                                      OpDecorate %140 DescriptorSet 140 
                                                      OpDecorate %140 Binding 140 
                                                      OpDecorate %141 RelaxedPrecision 
                                                      OpDecorate %145 RelaxedPrecision 
                                                      OpDecorate %148 RelaxedPrecision 
                                                      OpDecorate %149 RelaxedPrecision 
                                                      OpDecorate %150 RelaxedPrecision 
                                                      OpDecorate %153 RelaxedPrecision 
                                                      OpDecorate %156 RelaxedPrecision 
                                                      OpDecorate %157 RelaxedPrecision 
                                                      OpDecorate %158 RelaxedPrecision 
                                                      OpDecorate %159 RelaxedPrecision 
                                                      OpDecorate %160 RelaxedPrecision 
                                                      OpDecorate %161 RelaxedPrecision 
                                                      OpDecorate %162 RelaxedPrecision 
                                                      OpDecorate %163 RelaxedPrecision 
                                                      OpDecorate %164 RelaxedPrecision 
                                                      OpDecorate %165 RelaxedPrecision 
                                                      OpDecorate %166 RelaxedPrecision 
                                                      OpDecorate %167 RelaxedPrecision 
                                                      OpDecorate %169 RelaxedPrecision 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %176 RelaxedPrecision 
                                                      OpDecorate %178 RelaxedPrecision 
                                                      OpDecorate %179 RelaxedPrecision 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %181 RelaxedPrecision 
                                                      OpDecorate %182 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %203 DescriptorSet 203 
                                                      OpDecorate %203 Binding 203 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %205 DescriptorSet 205 
                                                      OpDecorate %205 Binding 205 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %211 DescriptorSet 211 
                                                      OpDecorate %211 Binding 211 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %213 DescriptorSet 213 
                                                      OpDecorate %213 Binding 213 
                                                      OpDecorate %214 RelaxedPrecision 
                                                      OpDecorate %219 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %223 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %226 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %229 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %233 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %245 DescriptorSet 245 
                                                      OpDecorate %245 Binding 245 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %247 DescriptorSet 247 
                                                      OpDecorate %247 Binding 247 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %253 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %256 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %268 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %277 RelaxedPrecision 
                                                      OpDecorate %278 RelaxedPrecision 
                                                      OpDecorate %279 RelaxedPrecision 
                                                      OpDecorate %280 RelaxedPrecision 
                                                      OpDecorate %281 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %284 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %291 RelaxedPrecision 
                                                      OpDecorate %293 RelaxedPrecision 
                                                      OpDecorate %294 RelaxedPrecision 
                                                      OpDecorate %296 RelaxedPrecision 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %298 RelaxedPrecision 
                                                      OpDecorate %299 RelaxedPrecision 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %304 RelaxedPrecision 
                                                      OpDecorate %307 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate %313 RelaxedPrecision 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %315 RelaxedPrecision 
                                                      OpDecorate %318 RelaxedPrecision 
                                                      OpDecorate %319 RelaxedPrecision 
                                                      OpDecorate %320 RelaxedPrecision 
                                                      OpDecorate %323 RelaxedPrecision 
                                                      OpDecorate %325 RelaxedPrecision 
                                                      OpDecorate %326 RelaxedPrecision 
                                                      OpDecorate %329 RelaxedPrecision 
                                                      OpDecorate %330 RelaxedPrecision 
                                                      OpDecorate %332 RelaxedPrecision 
                                                      OpDecorate %333 RelaxedPrecision 
                                                      OpDecorate %334 RelaxedPrecision 
                                                      OpDecorate %335 RelaxedPrecision 
                                                      OpDecorate %336 RelaxedPrecision 
                                                      OpDecorate %337 RelaxedPrecision 
                                                      OpDecorate %338 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %340 RelaxedPrecision 
                                                      OpDecorate %341 RelaxedPrecision 
                                                      OpDecorate %342 RelaxedPrecision 
                                                      OpDecorate %343 RelaxedPrecision 
                                                      OpDecorate %344 RelaxedPrecision 
                                                      OpDecorate %346 RelaxedPrecision 
                                                      OpDecorate %346 Location 346 
                                                      OpDecorate %347 RelaxedPrecision 
                                                      OpDecorate %348 RelaxedPrecision 
                                                      OpDecorate %349 RelaxedPrecision 
                                                      OpDecorate %368 RelaxedPrecision 
                                                      OpDecorate %369 RelaxedPrecision 
                                                      OpDecorate %370 RelaxedPrecision 
                                                      OpDecorate %371 RelaxedPrecision 
                                                      OpDecorate %373 RelaxedPrecision 
                                                      OpDecorate %374 RelaxedPrecision 
                                                      OpDecorate %375 RelaxedPrecision 
                                                      OpDecorate %376 RelaxedPrecision 
                                                      OpDecorate %379 RelaxedPrecision 
                                                      OpDecorate %380 RelaxedPrecision 
                                                      OpDecorate %383 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypeInt 32 0 
                                          u32 %12 = OpConstant 4 
                                              %13 = OpTypeArray %7 %12 
                                              %14 = OpTypeStruct %10 %7 %7 %13 %7 %7 %7 %7 
                                              %15 = OpTypePointer Uniform %14 
Uniform struct {f32_3; f32_4; f32_4; f32_4[4]; f32_4; f32_4; f32_4; f32_4;}* %16 = OpVariable Uniform 
                                              %17 = OpTypeInt 32 1 
                                          i32 %18 = OpConstant 1 
                                          u32 %19 = OpConstant 2 
                                              %20 = OpTypePointer Uniform %6 
                                              %23 = OpTypePointer Input %10 
                        Input f32_3* vs_TEXCOORD1 = OpVariable Input 
                                              %25 = OpTypePointer Input %6 
                                          u32 %29 = OpConstant 0 
                                              %30 = OpTypePointer Private %6 
                                              %38 = OpTypeVector %6 2 
                                              %39 = OpTypePointer Private %38 
                               Private f32_2* %40 = OpVariable Private 
                                              %41 = OpTypePointer Input %7 
                        Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                 Private f32* %48 = OpVariable Private 
                                              %49 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %50 = OpTypePointer UniformConstant %49 
         UniformConstant read_only Texture2D* %51 = OpVariable UniformConstant 
                                              %53 = OpTypeSampler 
                                              %54 = OpTypePointer UniformConstant %53 
                     UniformConstant sampler* %55 = OpVariable UniformConstant 
                                              %57 = OpTypeSampledImage %49 
                                          i32 %62 = OpConstant 2 
                                          u32 %67 = OpConstant 1 
                                          f32 %71 = OpConstant 3.674022E-40 
                                              %81 = OpTypePointer Private %10 
                               Private f32_3* %82 = OpVariable Private 
                                          i32 %85 = OpConstant 3 
                                              %86 = OpTypePointer Uniform %7 
                                          i32 %91 = OpConstant 0 
                                             %123 = OpTypePointer Uniform %10 
                              Private f32_4* %137 = OpVariable Private 
        UniformConstant read_only Texture2D* %138 = OpVariable UniformConstant 
                    UniformConstant sampler* %140 = OpVariable UniformConstant 
                              Private f32_3* %148 = OpVariable Private 
                                         f32 %151 = OpConstant 3.674022E-40 
                                       f32_3 %152 = OpConstantComposite %151 %151 %151 
                                         f32 %154 = OpConstant 3.674022E-40 
                                       f32_3 %155 = OpConstantComposite %154 %154 %154 
                                Private f32* %157 = OpVariable Private 
                              Private f32_3* %167 = OpVariable Private 
                                         f32 %190 = OpConstant 3.674022E-40 
                                Private f32* %192 = OpVariable Private 
                              Private f32_4* %202 = OpVariable Private 
        UniformConstant read_only Texture2D* %203 = OpVariable UniformConstant 
                    UniformConstant sampler* %205 = OpVariable UniformConstant 
                                Private f32* %210 = OpVariable Private 
        UniformConstant read_only Texture2D* %211 = OpVariable UniformConstant 
                    UniformConstant sampler* %213 = OpVariable UniformConstant 
                                         u32 %218 = OpConstant 3 
                                Private f32* %220 = OpVariable Private 
                              Private f32_3* %225 = OpVariable Private 
                                         f32 %228 = OpConstant 3.674022E-40 
                                         f32 %230 = OpConstant 3.674022E-40 
                                         f32 %240 = OpConstant 3.674022E-40 
                                             %243 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                             %244 = OpTypePointer UniformConstant %243 
      UniformConstant read_only TextureCube* %245 = OpVariable UniformConstant 
                    UniformConstant sampler* %247 = OpVariable UniformConstant 
                                             %249 = OpTypeSampledImage %243 
                                         i32 %259 = OpConstant 6 
                                         f32 %292 = OpConstant 3.674022E-40 
                                             %345 = OpTypePointer Output %7 
                               Output f32_4* %346 = OpVariable Output 
                                         i32 %354 = OpConstant 4 
                                         i32 %363 = OpConstant 5 
                                       f32_3 %372 = OpConstantComposite %190 %190 %190 
                                         i32 %384 = OpConstant 7 
                                             %400 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %21 = OpAccessChain %16 %18 %19 
                                          f32 %22 = OpLoad %21 
                                   Input f32* %26 = OpAccessChain vs_TEXCOORD1 %19 
                                          f32 %27 = OpLoad %26 
                                          f32 %28 = OpFDiv %22 %27 
                                 Private f32* %31 = OpAccessChain %9 %29 
                                                      OpStore %31 %28 
                                        f32_4 %32 = OpLoad %9 
                                        f32_3 %33 = OpVectorShuffle %32 %32 0 0 0 
                                        f32_3 %34 = OpLoad vs_TEXCOORD1 
                                        f32_3 %35 = OpFMul %33 %34 
                                        f32_4 %36 = OpLoad %9 
                                        f32_4 %37 = OpVectorShuffle %36 %35 4 5 6 3 
                                                      OpStore %9 %37 
                                        f32_4 %43 = OpLoad vs_TEXCOORD0 
                                        f32_2 %44 = OpVectorShuffle %43 %43 0 1 
                                        f32_4 %45 = OpLoad vs_TEXCOORD0 
                                        f32_2 %46 = OpVectorShuffle %45 %45 3 3 
                                        f32_2 %47 = OpFDiv %44 %46 
                                                      OpStore %40 %47 
                          read_only Texture2D %52 = OpLoad %51 
                                      sampler %56 = OpLoad %55 
                   read_only Texture2DSampled %58 = OpSampledImage %52 %56 
                                        f32_2 %59 = OpLoad %40 
                                        f32_4 %60 = OpImageSampleImplicitLod %58 %59 
                                          f32 %61 = OpCompositeExtract %60 0 
                                                      OpStore %48 %61 
                                 Uniform f32* %63 = OpAccessChain %16 %62 %29 
                                          f32 %64 = OpLoad %63 
                                          f32 %65 = OpLoad %48 
                                          f32 %66 = OpFMul %64 %65 
                                 Uniform f32* %68 = OpAccessChain %16 %62 %67 
                                          f32 %69 = OpLoad %68 
                                          f32 %70 = OpFAdd %66 %69 
                                                      OpStore %48 %70 
                                          f32 %72 = OpLoad %48 
                                          f32 %73 = OpFDiv %71 %72 
                                                      OpStore %48 %73 
                                          f32 %74 = OpLoad %48 
                                        f32_3 %75 = OpCompositeConstruct %74 %74 %74 
                                        f32_4 %76 = OpLoad %9 
                                        f32_3 %77 = OpVectorShuffle %76 %76 0 1 2 
                                        f32_3 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpVectorShuffle %79 %78 4 5 6 3 
                                                      OpStore %9 %80 
                                        f32_4 %83 = OpLoad %9 
                                        f32_3 %84 = OpVectorShuffle %83 %83 1 1 1 
                               Uniform f32_4* %87 = OpAccessChain %16 %85 %18 
                                        f32_4 %88 = OpLoad %87 
                                        f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                        f32_3 %90 = OpFMul %84 %89 
                                                      OpStore %82 %90 
                               Uniform f32_4* %92 = OpAccessChain %16 %85 %91 
                                        f32_4 %93 = OpLoad %92 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                        f32_4 %95 = OpLoad %9 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 0 0 
                                        f32_3 %97 = OpFMul %94 %96 
                                        f32_3 %98 = OpLoad %82 
                                        f32_3 %99 = OpFAdd %97 %98 
                                       f32_4 %100 = OpLoad %9 
                                       f32_4 %101 = OpVectorShuffle %100 %99 4 5 2 6 
                                                      OpStore %9 %101 
                              Uniform f32_4* %102 = OpAccessChain %16 %85 %62 
                                       f32_4 %103 = OpLoad %102 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                       f32_4 %105 = OpLoad %9 
                                       f32_3 %106 = OpVectorShuffle %105 %105 2 2 2 
                                       f32_3 %107 = OpFMul %104 %106 
                                       f32_4 %108 = OpLoad %9 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 3 
                                       f32_3 %110 = OpFAdd %107 %109 
                                       f32_4 %111 = OpLoad %9 
                                       f32_4 %112 = OpVectorShuffle %111 %110 4 5 6 3 
                                                      OpStore %9 %112 
                                       f32_4 %113 = OpLoad %9 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                              Uniform f32_4* %115 = OpAccessChain %16 %85 %85 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_3 %118 = OpFAdd %114 %117 
                                       f32_4 %119 = OpLoad %9 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 6 3 
                                                      OpStore %9 %120 
                                       f32_4 %121 = OpLoad %9 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                              Uniform f32_3* %124 = OpAccessChain %16 %91 
                                       f32_3 %125 = OpLoad %124 
                                       f32_3 %126 = OpFNegate %125 
                                       f32_3 %127 = OpFAdd %122 %126 
                                                      OpStore %82 %127 
                                       f32_3 %128 = OpLoad %82 
                                       f32_3 %129 = OpLoad %82 
                                         f32 %130 = OpDot %128 %129 
                                                      OpStore %48 %130 
                                         f32 %131 = OpLoad %48 
                                         f32 %132 = OpExtInst %1 32 %131 
                                                      OpStore %48 %132 
                                         f32 %133 = OpLoad %48 
                                       f32_3 %134 = OpCompositeConstruct %133 %133 %133 
                                       f32_3 %135 = OpLoad %82 
                                       f32_3 %136 = OpFMul %134 %135 
                                                      OpStore %82 %136 
                         read_only Texture2D %139 = OpLoad %138 
                                     sampler %141 = OpLoad %140 
                  read_only Texture2DSampled %142 = OpSampledImage %139 %141 
                                       f32_2 %143 = OpLoad %40 
                                       f32_4 %144 = OpImageSampleImplicitLod %142 %143 
                                       f32_3 %145 = OpVectorShuffle %144 %144 0 1 2 
                                       f32_4 %146 = OpLoad %137 
                                       f32_4 %147 = OpVectorShuffle %146 %145 4 5 6 3 
                                                      OpStore %137 %147 
                                       f32_4 %149 = OpLoad %137 
                                       f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
                                       f32_3 %153 = OpFMul %150 %152 
                                       f32_3 %156 = OpFAdd %153 %155 
                                                      OpStore %148 %156 
                                       f32_3 %158 = OpLoad %148 
                                       f32_3 %159 = OpLoad %148 
                                         f32 %160 = OpDot %158 %159 
                                                      OpStore %157 %160 
                                         f32 %161 = OpLoad %157 
                                         f32 %162 = OpExtInst %1 32 %161 
                                                      OpStore %157 %162 
                                         f32 %163 = OpLoad %157 
                                       f32_3 %164 = OpCompositeConstruct %163 %163 %163 
                                       f32_3 %165 = OpLoad %148 
                                       f32_3 %166 = OpFMul %164 %165 
                                                      OpStore %148 %166 
                                       f32_3 %168 = OpLoad %82 
                                       f32_3 %169 = OpLoad %148 
                                         f32 %170 = OpDot %168 %169 
                                Private f32* %171 = OpAccessChain %167 %29 
                                                      OpStore %171 %170 
                                Private f32* %172 = OpAccessChain %167 %29 
                                         f32 %173 = OpLoad %172 
                                Private f32* %174 = OpAccessChain %167 %29 
                                         f32 %175 = OpLoad %174 
                                         f32 %176 = OpFAdd %173 %175 
                                Private f32* %177 = OpAccessChain %167 %29 
                                                      OpStore %177 %176 
                                       f32_3 %178 = OpLoad %148 
                                       f32_3 %179 = OpLoad %167 
                                       f32_3 %180 = OpVectorShuffle %179 %179 0 0 0 
                                       f32_3 %181 = OpFNegate %180 
                                       f32_3 %182 = OpFMul %178 %181 
                                       f32_3 %183 = OpLoad %82 
                                       f32_3 %184 = OpFAdd %182 %183 
                                                      OpStore %167 %184 
                                       f32_3 %185 = OpLoad %148 
                                       f32_3 %186 = OpLoad %82 
                                       f32_3 %187 = OpFNegate %186 
                                         f32 %188 = OpDot %185 %187 
                                                      OpStore %48 %188 
                                         f32 %189 = OpLoad %48 
                                         f32 %191 = OpExtInst %1 43 %189 %190 %71 
                                                      OpStore %48 %191 
                                         f32 %193 = OpLoad %48 
                                         f32 %194 = OpFNegate %193 
                                         f32 %195 = OpFAdd %194 %71 
                                                      OpStore %192 %195 
                                         f32 %196 = OpLoad %192 
                                         f32 %197 = OpLoad %192 
                                         f32 %198 = OpFMul %196 %197 
                                                      OpStore %192 %198 
                                         f32 %199 = OpLoad %192 
                                         f32 %200 = OpLoad %192 
                                         f32 %201 = OpFMul %199 %200 
                                                      OpStore %192 %201 
                         read_only Texture2D %204 = OpLoad %203 
                                     sampler %206 = OpLoad %205 
                  read_only Texture2DSampled %207 = OpSampledImage %204 %206 
                                       f32_2 %208 = OpLoad %40 
                                       f32_4 %209 = OpImageSampleImplicitLod %207 %208 
                                                      OpStore %202 %209 
                         read_only Texture2D %212 = OpLoad %211 
                                     sampler %214 = OpLoad %213 
                  read_only Texture2DSampled %215 = OpSampledImage %212 %214 
                                       f32_2 %216 = OpLoad %40 
                                       f32_4 %217 = OpImageSampleImplicitLod %215 %216 
                                         f32 %219 = OpCompositeExtract %217 3 
                                                      OpStore %210 %219 
                                Private f32* %221 = OpAccessChain %202 %218 
                                         f32 %222 = OpLoad %221 
                                         f32 %223 = OpFNegate %222 
                                         f32 %224 = OpFAdd %223 %71 
                                                      OpStore %220 %224 
                                         f32 %226 = OpLoad %220 
                                         f32 %227 = OpFNegate %226 
                                         f32 %229 = OpFMul %227 %228 
                                         f32 %231 = OpFAdd %229 %230 
                                Private f32* %232 = OpAccessChain %225 %29 
                                                      OpStore %232 %231 
                                         f32 %233 = OpLoad %220 
                                Private f32* %234 = OpAccessChain %225 %29 
                                         f32 %235 = OpLoad %234 
                                         f32 %236 = OpFMul %233 %235 
                                Private f32* %237 = OpAccessChain %225 %29 
                                                      OpStore %237 %236 
                                Private f32* %238 = OpAccessChain %225 %29 
                                         f32 %239 = OpLoad %238 
                                         f32 %241 = OpFMul %239 %240 
                                Private f32* %242 = OpAccessChain %225 %29 
                                                      OpStore %242 %241 
                       read_only TextureCube %246 = OpLoad %245 
                                     sampler %248 = OpLoad %247 
                read_only TextureCubeSampled %250 = OpSampledImage %246 %248 
                                       f32_3 %251 = OpLoad %167 
                                Private f32* %252 = OpAccessChain %225 %29 
                                         f32 %253 = OpLoad %252 
                                       f32_4 %254 = OpImageSampleExplicitLod %250 %251 Lod %7 
                                                      OpStore %137 %254 
                                Private f32* %255 = OpAccessChain %137 %218 
                                         f32 %256 = OpLoad %255 
                                         f32 %257 = OpFAdd %256 %154 
                                Private f32* %258 = OpAccessChain %167 %29 
                                                      OpStore %258 %257 
                                Uniform f32* %260 = OpAccessChain %16 %259 %218 
                                         f32 %261 = OpLoad %260 
                                Private f32* %262 = OpAccessChain %167 %29 
                                         f32 %263 = OpLoad %262 
                                         f32 %264 = OpFMul %261 %263 
                                         f32 %265 = OpFAdd %264 %71 
                                Private f32* %266 = OpAccessChain %167 %29 
                                                      OpStore %266 %265 
                                Private f32* %267 = OpAccessChain %167 %29 
                                         f32 %268 = OpLoad %267 
                                Uniform f32* %269 = OpAccessChain %16 %259 %29 
                                         f32 %270 = OpLoad %269 
                                         f32 %271 = OpFMul %268 %270 
                                Private f32* %272 = OpAccessChain %167 %29 
                                                      OpStore %272 %271 
                                       f32_4 %273 = OpLoad %137 
                                       f32_3 %274 = OpVectorShuffle %273 %273 0 1 2 
                                       f32_3 %275 = OpLoad %167 
                                       f32_3 %276 = OpVectorShuffle %275 %275 0 0 0 
                                       f32_3 %277 = OpFMul %274 %276 
                                                      OpStore %167 %277 
                                         f32 %278 = OpLoad %210 
                                       f32_3 %279 = OpCompositeConstruct %278 %278 %278 
                                       f32_3 %280 = OpLoad %167 
                                       f32_3 %281 = OpFMul %279 %280 
                                                      OpStore %167 %281 
                                         f32 %282 = OpLoad %220 
                                         f32 %283 = OpLoad %220 
                                         f32 %284 = OpFMul %282 %283 
                                                      OpStore %157 %284 
                                         f32 %285 = OpLoad %220 
                                         f32 %286 = OpLoad %157 
                                         f32 %287 = OpFMul %285 %286 
                                Private f32* %288 = OpAccessChain %225 %29 
                                                      OpStore %288 %287 
                                Private f32* %289 = OpAccessChain %225 %29 
                                         f32 %290 = OpLoad %289 
                                         f32 %291 = OpFNegate %290 
                                         f32 %293 = OpFMul %291 %292 
                                         f32 %294 = OpFAdd %293 %71 
                                Private f32* %295 = OpAccessChain %225 %29 
                                                      OpStore %295 %294 
                                       f32_3 %296 = OpLoad %167 
                                       f32_3 %297 = OpLoad %225 
                                       f32_3 %298 = OpVectorShuffle %297 %297 0 0 0 
                                       f32_3 %299 = OpFMul %296 %298 
                                                      OpStore %167 %299 
                                Private f32* %300 = OpAccessChain %202 %67 
                                         f32 %301 = OpLoad %300 
                                Private f32* %302 = OpAccessChain %202 %29 
                                         f32 %303 = OpLoad %302 
                                         f32 %304 = OpExtInst %1 40 %301 %303 
                                Private f32* %305 = OpAccessChain %225 %29 
                                                      OpStore %305 %304 
                                Private f32* %306 = OpAccessChain %202 %19 
                                         f32 %307 = OpLoad %306 
                                Private f32* %308 = OpAccessChain %225 %29 
                                         f32 %309 = OpLoad %308 
                                         f32 %310 = OpExtInst %1 40 %307 %309 
                                Private f32* %311 = OpAccessChain %225 %29 
                                                      OpStore %311 %310 
                                Private f32* %312 = OpAccessChain %225 %29 
                                         f32 %313 = OpLoad %312 
                                         f32 %314 = OpFNegate %313 
                                         f32 %315 = OpFAdd %314 %71 
                                Private f32* %316 = OpAccessChain %225 %29 
                                                      OpStore %316 %315 
                                Private f32* %317 = OpAccessChain %225 %29 
                                         f32 %318 = OpLoad %317 
                                         f32 %319 = OpFNegate %318 
                                         f32 %320 = OpFAdd %319 %71 
                                Private f32* %321 = OpAccessChain %225 %29 
                                                      OpStore %321 %320 
                                Private f32* %322 = OpAccessChain %202 %218 
                                         f32 %323 = OpLoad %322 
                                Private f32* %324 = OpAccessChain %225 %29 
                                         f32 %325 = OpLoad %324 
                                         f32 %326 = OpFAdd %323 %325 
                                Private f32* %327 = OpAccessChain %225 %29 
                                                      OpStore %327 %326 
                                Private f32* %328 = OpAccessChain %225 %29 
                                         f32 %329 = OpLoad %328 
                                         f32 %330 = OpExtInst %1 43 %329 %190 %71 
                                Private f32* %331 = OpAccessChain %225 %29 
                                                      OpStore %331 %330 
                                       f32_4 %332 = OpLoad %202 
                                       f32_3 %333 = OpVectorShuffle %332 %332 0 1 2 
                                       f32_3 %334 = OpFNegate %333 
                                       f32_3 %335 = OpLoad %225 
                                       f32_3 %336 = OpVectorShuffle %335 %335 0 0 0 
                                       f32_3 %337 = OpFAdd %334 %336 
                                                      OpStore %225 %337 
                                         f32 %338 = OpLoad %192 
                                       f32_3 %339 = OpCompositeConstruct %338 %338 %338 
                                       f32_3 %340 = OpLoad %225 
                                       f32_3 %341 = OpFMul %339 %340 
                                       f32_4 %342 = OpLoad %202 
                                       f32_3 %343 = OpVectorShuffle %342 %342 0 1 2 
                                       f32_3 %344 = OpFAdd %341 %343 
                                                      OpStore %225 %344 
                                       f32_3 %347 = OpLoad %167 
                                       f32_3 %348 = OpLoad %225 
                                       f32_3 %349 = OpFMul %347 %348 
                                       f32_4 %350 = OpLoad %346 
                                       f32_4 %351 = OpVectorShuffle %350 %349 4 5 6 3 
                                                      OpStore %346 %351 
                                       f32_4 %352 = OpLoad %9 
                                       f32_3 %353 = OpVectorShuffle %352 %352 0 1 2 
                              Uniform f32_4* %355 = OpAccessChain %16 %354 
                                       f32_4 %356 = OpLoad %355 
                                       f32_3 %357 = OpVectorShuffle %356 %356 0 1 2 
                                       f32_3 %358 = OpFNegate %357 
                                       f32_3 %359 = OpFAdd %353 %358 
                                                      OpStore %167 %359 
                                       f32_4 %360 = OpLoad %9 
                                       f32_3 %361 = OpVectorShuffle %360 %360 0 1 2 
                                       f32_3 %362 = OpFNegate %361 
                              Uniform f32_4* %364 = OpAccessChain %16 %363 
                                       f32_4 %365 = OpLoad %364 
                                       f32_3 %366 = OpVectorShuffle %365 %365 0 1 2 
                                       f32_3 %367 = OpFAdd %362 %366 
                                                      OpStore %225 %367 
                                       f32_3 %368 = OpLoad %167 
                                       f32_3 %369 = OpLoad %225 
                                       f32_3 %370 = OpExtInst %1 40 %368 %369 
                                                      OpStore %167 %370 
                                       f32_3 %371 = OpLoad %167 
                                       f32_3 %373 = OpExtInst %1 40 %371 %372 
                                                      OpStore %167 %373 
                                       f32_3 %374 = OpLoad %167 
                                       f32_3 %375 = OpLoad %167 
                                         f32 %376 = OpDot %374 %375 
                                Private f32* %377 = OpAccessChain %167 %29 
                                                      OpStore %377 %376 
                                Private f32* %378 = OpAccessChain %167 %29 
                                         f32 %379 = OpLoad %378 
                                         f32 %380 = OpExtInst %1 31 %379 
                                Private f32* %381 = OpAccessChain %167 %29 
                                                      OpStore %381 %380 
                                Private f32* %382 = OpAccessChain %167 %29 
                                         f32 %383 = OpLoad %382 
                                Uniform f32* %385 = OpAccessChain %16 %384 %218 
                                         f32 %386 = OpLoad %385 
                                         f32 %387 = OpFDiv %383 %386 
                                Private f32* %388 = OpAccessChain %9 %29 
                                                      OpStore %388 %387 
                                Private f32* %389 = OpAccessChain %9 %29 
                                         f32 %390 = OpLoad %389 
                                         f32 %391 = OpFNegate %390 
                                         f32 %392 = OpFAdd %391 %71 
                                Private f32* %393 = OpAccessChain %9 %29 
                                                      OpStore %393 %392 
                                Private f32* %394 = OpAccessChain %9 %29 
                                         f32 %395 = OpLoad %394 
                                         f32 %396 = OpExtInst %1 43 %395 %190 %71 
                                Private f32* %397 = OpAccessChain %9 %29 
                                                      OpStore %397 %396 
                                Private f32* %398 = OpAccessChain %9 %29 
                                         f32 %399 = OpLoad %398 
                                 Output f32* %401 = OpAccessChain %346 %218 
                                                      OpStore %401 %399 
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
 Pass {
  Blend Zero Zero, Zero Zero
  ZTest Always
  ZWrite Off
  GpuProgramID 113442
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
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
UNITY_LOCATION(0) uniform mediump sampler2D _CameraReflectionsTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
void main()
{
    u_xlat16_0.xyz = texture(_CameraReflectionsTexture, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = exp2((-u_xlat16_0.xyz));
    SV_Target0.w = 0.0;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
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
UNITY_LOCATION(0) uniform mediump sampler2D _CameraReflectionsTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
void main()
{
    u_xlat16_0.xyz = texture(_CameraReflectionsTexture, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = exp2((-u_xlat16_0.xyz));
    SV_Target0.w = 0.0;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
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
UNITY_LOCATION(0) uniform mediump sampler2D _CameraReflectionsTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
void main()
{
    u_xlat16_0.xyz = texture(_CameraReflectionsTexture, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = exp2((-u_xlat16_0.xyz));
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 118
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %101 %106 
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
                                                     OpMemberDecorate %99 0 BuiltIn 99 
                                                     OpMemberDecorate %99 1 BuiltIn 99 
                                                     OpMemberDecorate %99 2 BuiltIn 99 
                                                     OpDecorate %99 Block 
                                                     OpDecorate vs_TEXCOORD0 Location 106 
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
                                             %98 = OpTypeArray %6 %75 
                                             %99 = OpTypeStruct %7 %6 %98 
                                            %100 = OpTypePointer Output %99 
       Output struct {f32_4; f32; f32[1];}* %101 = OpVariable Output 
                                            %103 = OpTypePointer Output %7 
                                            %105 = OpTypePointer Output %91 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %112 = OpTypePointer Output %6 
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
                                      f32_4 %102 = OpLoad %9 
                              Output f32_4* %104 = OpAccessChain %101 %27 
                                                     OpStore %104 %102 
                                      f32_4 %107 = OpLoad %48 
                                      f32_2 %108 = OpVectorShuffle %107 %107 2 2 
                                      f32_4 %109 = OpLoad %48 
                                      f32_2 %110 = OpVectorShuffle %109 %109 0 3 
                                      f32_2 %111 = OpFAdd %108 %110 
                                                     OpStore vs_TEXCOORD0 %111 
                                Output f32* %113 = OpAccessChain %101 %27 %75 
                                        f32 %114 = OpLoad %113 
                                        f32 %115 = OpFNegate %114 
                                Output f32* %116 = OpAccessChain %101 %27 %75 
                                                     OpStore %116 %115 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 40
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %28 
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
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %28 Location 28 
                                             OpDecorate %29 RelaxedPrecision 
                                             OpDecorate %30 RelaxedPrecision 
                                             OpDecorate %31 RelaxedPrecision 
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
                                     %27 = OpTypePointer Output %24 
                       Output f32_4* %28 = OpVariable Output 
                                 f32 %34 = OpConstant 3.674022E-40 
                                     %35 = OpTypeInt 32 0 
                                 u32 %36 = OpConstant 3 
                                     %37 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
                                             OpStore %9 %26 
                               f32_3 %29 = OpLoad %9 
                               f32_3 %30 = OpFNegate %29 
                               f32_3 %31 = OpExtInst %1 29 %30 
                               f32_4 %32 = OpLoad %28 
                               f32_4 %33 = OpVectorShuffle %32 %31 4 5 6 3 
                                             OpStore %28 %33 
                         Output f32* %38 = OpAccessChain %28 %36 
                                             OpStore %38 %34 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 118
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %101 %106 
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
                                                     OpMemberDecorate %99 0 BuiltIn 99 
                                                     OpMemberDecorate %99 1 BuiltIn 99 
                                                     OpMemberDecorate %99 2 BuiltIn 99 
                                                     OpDecorate %99 Block 
                                                     OpDecorate vs_TEXCOORD0 Location 106 
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
                                             %98 = OpTypeArray %6 %75 
                                             %99 = OpTypeStruct %7 %6 %98 
                                            %100 = OpTypePointer Output %99 
       Output struct {f32_4; f32; f32[1];}* %101 = OpVariable Output 
                                            %103 = OpTypePointer Output %7 
                                            %105 = OpTypePointer Output %91 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %112 = OpTypePointer Output %6 
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
                                      f32_4 %102 = OpLoad %9 
                              Output f32_4* %104 = OpAccessChain %101 %27 
                                                     OpStore %104 %102 
                                      f32_4 %107 = OpLoad %48 
                                      f32_2 %108 = OpVectorShuffle %107 %107 2 2 
                                      f32_4 %109 = OpLoad %48 
                                      f32_2 %110 = OpVectorShuffle %109 %109 0 3 
                                      f32_2 %111 = OpFAdd %108 %110 
                                                     OpStore vs_TEXCOORD0 %111 
                                Output f32* %113 = OpAccessChain %101 %27 %75 
                                        f32 %114 = OpLoad %113 
                                        f32 %115 = OpFNegate %114 
                                Output f32* %116 = OpAccessChain %101 %27 %75 
                                                     OpStore %116 %115 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 40
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %28 
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
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %28 Location 28 
                                             OpDecorate %29 RelaxedPrecision 
                                             OpDecorate %30 RelaxedPrecision 
                                             OpDecorate %31 RelaxedPrecision 
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
                                     %27 = OpTypePointer Output %24 
                       Output f32_4* %28 = OpVariable Output 
                                 f32 %34 = OpConstant 3.674022E-40 
                                     %35 = OpTypeInt 32 0 
                                 u32 %36 = OpConstant 3 
                                     %37 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
                                             OpStore %9 %26 
                               f32_3 %29 = OpLoad %9 
                               f32_3 %30 = OpFNegate %29 
                               f32_3 %31 = OpExtInst %1 29 %30 
                               f32_4 %32 = OpLoad %28 
                               f32_4 %33 = OpVectorShuffle %32 %31 4 5 6 3 
                                             OpStore %28 %33 
                         Output f32* %38 = OpAccessChain %28 %36 
                                             OpStore %38 %34 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 118
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %101 %106 
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
                                                     OpMemberDecorate %99 0 BuiltIn 99 
                                                     OpMemberDecorate %99 1 BuiltIn 99 
                                                     OpMemberDecorate %99 2 BuiltIn 99 
                                                     OpDecorate %99 Block 
                                                     OpDecorate vs_TEXCOORD0 Location 106 
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
                                             %98 = OpTypeArray %6 %75 
                                             %99 = OpTypeStruct %7 %6 %98 
                                            %100 = OpTypePointer Output %99 
       Output struct {f32_4; f32; f32[1];}* %101 = OpVariable Output 
                                            %103 = OpTypePointer Output %7 
                                            %105 = OpTypePointer Output %91 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %112 = OpTypePointer Output %6 
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
                                      f32_4 %102 = OpLoad %9 
                              Output f32_4* %104 = OpAccessChain %101 %27 
                                                     OpStore %104 %102 
                                      f32_4 %107 = OpLoad %48 
                                      f32_2 %108 = OpVectorShuffle %107 %107 2 2 
                                      f32_4 %109 = OpLoad %48 
                                      f32_2 %110 = OpVectorShuffle %109 %109 0 3 
                                      f32_2 %111 = OpFAdd %108 %110 
                                                     OpStore vs_TEXCOORD0 %111 
                                Output f32* %113 = OpAccessChain %101 %27 %75 
                                        f32 %114 = OpLoad %113 
                                        f32 %115 = OpFNegate %114 
                                Output f32* %116 = OpAccessChain %101 %27 %75 
                                                     OpStore %116 %115 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 40
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %28 
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
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %28 Location 28 
                                             OpDecorate %29 RelaxedPrecision 
                                             OpDecorate %30 RelaxedPrecision 
                                             OpDecorate %31 RelaxedPrecision 
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
                                     %27 = OpTypePointer Output %24 
                       Output f32_4* %28 = OpVariable Output 
                                 f32 %34 = OpConstant 3.674022E-40 
                                     %35 = OpTypeInt 32 0 
                                 u32 %36 = OpConstant 3 
                                     %37 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
                                             OpStore %9 %26 
                               f32_3 %29 = OpLoad %9 
                               f32_3 %30 = OpFNegate %29 
                               f32_3 %31 = OpExtInst %1 29 %30 
                               f32_4 %32 = OpLoad %28 
                               f32_4 %33 = OpVectorShuffle %32 %31 4 5 6 3 
                                             OpStore %28 %33 
                         Output f32* %38 = OpAccessChain %28 %36 
                                             OpStore %38 %34 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "UNITY_HDR_ON" }
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
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
UNITY_LOCATION(0) uniform mediump sampler2D _CameraReflectionsTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
void main()
{
    u_xlat16_0.xyz = texture(_CameraReflectionsTexture, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_HDR_ON" }
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
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
UNITY_LOCATION(0) uniform mediump sampler2D _CameraReflectionsTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
void main()
{
    u_xlat16_0.xyz = texture(_CameraReflectionsTexture, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_HDR_ON" }
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
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
UNITY_LOCATION(0) uniform mediump sampler2D _CameraReflectionsTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
void main()
{
    u_xlat16_0.xyz = texture(_CameraReflectionsTexture, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "UNITY_HDR_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 118
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %101 %106 
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
                                                     OpMemberDecorate %99 0 BuiltIn 99 
                                                     OpMemberDecorate %99 1 BuiltIn 99 
                                                     OpMemberDecorate %99 2 BuiltIn 99 
                                                     OpDecorate %99 Block 
                                                     OpDecorate vs_TEXCOORD0 Location 106 
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
                                             %98 = OpTypeArray %6 %75 
                                             %99 = OpTypeStruct %7 %6 %98 
                                            %100 = OpTypePointer Output %99 
       Output struct {f32_4; f32; f32[1];}* %101 = OpVariable Output 
                                            %103 = OpTypePointer Output %7 
                                            %105 = OpTypePointer Output %91 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %112 = OpTypePointer Output %6 
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
                                      f32_4 %102 = OpLoad %9 
                              Output f32_4* %104 = OpAccessChain %101 %27 
                                                     OpStore %104 %102 
                                      f32_4 %107 = OpLoad %48 
                                      f32_2 %108 = OpVectorShuffle %107 %107 2 2 
                                      f32_4 %109 = OpLoad %48 
                                      f32_2 %110 = OpVectorShuffle %109 %109 0 3 
                                      f32_2 %111 = OpFAdd %108 %110 
                                                     OpStore vs_TEXCOORD0 %111 
                                Output f32* %113 = OpAccessChain %101 %27 %75 
                                        f32 %114 = OpLoad %113 
                                        f32 %115 = OpFNegate %114 
                                Output f32* %116 = OpAccessChain %101 %27 %75 
                                                     OpStore %116 %115 
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
                                             OpEntryPoint Fragment %4 "main" %22 %28 
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
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %28 Location 28 
                                             OpDecorate %29 RelaxedPrecision 
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
                                     %27 = OpTypePointer Output %24 
                       Output f32_4* %28 = OpVariable Output 
                                 f32 %32 = OpConstant 3.674022E-40 
                                     %33 = OpTypeInt 32 0 
                                 u32 %34 = OpConstant 3 
                                     %35 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
                                             OpStore %9 %26 
                               f32_3 %29 = OpLoad %9 
                               f32_4 %30 = OpLoad %28 
                               f32_4 %31 = OpVectorShuffle %30 %29 4 5 6 3 
                                             OpStore %28 %31 
                         Output f32* %36 = OpAccessChain %28 %34 
                                             OpStore %36 %32 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "UNITY_HDR_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 118
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %101 %106 
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
                                                     OpMemberDecorate %99 0 BuiltIn 99 
                                                     OpMemberDecorate %99 1 BuiltIn 99 
                                                     OpMemberDecorate %99 2 BuiltIn 99 
                                                     OpDecorate %99 Block 
                                                     OpDecorate vs_TEXCOORD0 Location 106 
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
                                             %98 = OpTypeArray %6 %75 
                                             %99 = OpTypeStruct %7 %6 %98 
                                            %100 = OpTypePointer Output %99 
       Output struct {f32_4; f32; f32[1];}* %101 = OpVariable Output 
                                            %103 = OpTypePointer Output %7 
                                            %105 = OpTypePointer Output %91 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %112 = OpTypePointer Output %6 
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
                                      f32_4 %102 = OpLoad %9 
                              Output f32_4* %104 = OpAccessChain %101 %27 
                                                     OpStore %104 %102 
                                      f32_4 %107 = OpLoad %48 
                                      f32_2 %108 = OpVectorShuffle %107 %107 2 2 
                                      f32_4 %109 = OpLoad %48 
                                      f32_2 %110 = OpVectorShuffle %109 %109 0 3 
                                      f32_2 %111 = OpFAdd %108 %110 
                                                     OpStore vs_TEXCOORD0 %111 
                                Output f32* %113 = OpAccessChain %101 %27 %75 
                                        f32 %114 = OpLoad %113 
                                        f32 %115 = OpFNegate %114 
                                Output f32* %116 = OpAccessChain %101 %27 %75 
                                                     OpStore %116 %115 
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
                                             OpEntryPoint Fragment %4 "main" %22 %28 
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
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %28 Location 28 
                                             OpDecorate %29 RelaxedPrecision 
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
                                     %27 = OpTypePointer Output %24 
                       Output f32_4* %28 = OpVariable Output 
                                 f32 %32 = OpConstant 3.674022E-40 
                                     %33 = OpTypeInt 32 0 
                                 u32 %34 = OpConstant 3 
                                     %35 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
                                             OpStore %9 %26 
                               f32_3 %29 = OpLoad %9 
                               f32_4 %30 = OpLoad %28 
                               f32_4 %31 = OpVectorShuffle %30 %29 4 5 6 3 
                                             OpStore %28 %31 
                         Output f32* %36 = OpAccessChain %28 %34 
                                             OpStore %36 %32 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "UNITY_HDR_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 118
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %101 %106 
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
                                                     OpMemberDecorate %99 0 BuiltIn 99 
                                                     OpMemberDecorate %99 1 BuiltIn 99 
                                                     OpMemberDecorate %99 2 BuiltIn 99 
                                                     OpDecorate %99 Block 
                                                     OpDecorate vs_TEXCOORD0 Location 106 
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
                                             %98 = OpTypeArray %6 %75 
                                             %99 = OpTypeStruct %7 %6 %98 
                                            %100 = OpTypePointer Output %99 
       Output struct {f32_4; f32; f32[1];}* %101 = OpVariable Output 
                                            %103 = OpTypePointer Output %7 
                                            %105 = OpTypePointer Output %91 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %112 = OpTypePointer Output %6 
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
                                      f32_4 %102 = OpLoad %9 
                              Output f32_4* %104 = OpAccessChain %101 %27 
                                                     OpStore %104 %102 
                                      f32_4 %107 = OpLoad %48 
                                      f32_2 %108 = OpVectorShuffle %107 %107 2 2 
                                      f32_4 %109 = OpLoad %48 
                                      f32_2 %110 = OpVectorShuffle %109 %109 0 3 
                                      f32_2 %111 = OpFAdd %108 %110 
                                                     OpStore vs_TEXCOORD0 %111 
                                Output f32* %113 = OpAccessChain %101 %27 %75 
                                        f32 %114 = OpLoad %113 
                                        f32 %115 = OpFNegate %114 
                                Output f32* %116 = OpAccessChain %101 %27 %75 
                                                     OpStore %116 %115 
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
                                             OpEntryPoint Fragment %4 "main" %22 %28 
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
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %28 Location 28 
                                             OpDecorate %29 RelaxedPrecision 
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
                                     %27 = OpTypePointer Output %24 
                       Output f32_4* %28 = OpVariable Output 
                                 f32 %32 = OpConstant 3.674022E-40 
                                     %33 = OpTypeInt 32 0 
                                 u32 %34 = OpConstant 3 
                                     %35 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                               f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
                                             OpStore %9 %26 
                               f32_3 %29 = OpLoad %9 
                               f32_4 %30 = OpLoad %28 
                               f32_4 %31 = OpVectorShuffle %30 %29 4 5 6 3 
                                             OpStore %28 %31 
                         Output f32* %36 = OpAccessChain %28 %34 
                                             OpStore %36 %32 
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
Keywords { "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_HDR_ON" }
""
}
SubProgram "vulkan hw_tier00 " {
Keywords { "UNITY_HDR_ON" }
""
}
SubProgram "vulkan hw_tier01 " {
Keywords { "UNITY_HDR_ON" }
""
}
SubProgram "vulkan hw_tier02 " {
Keywords { "UNITY_HDR_ON" }
""
}
}
}
}
}