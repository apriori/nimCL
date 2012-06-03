#******************************************************************************
#  Copyright (c) 2008-2010 The Khronos Group Inc.
# 
#  Permission is hereby granted, free of charge, to any person obtaining a
#  copy of this software and/or associated documentation files (the
#  "Materials"), to deal in the Materials without restriction, including
#  without limitation the rights to use, copy, modify, merge, publish,
#  distribute, sublicense, and/or sell copies of the Materials, and to
#  permit persons to whom the Materials are furnished to do so, subject to
#  the following conditions:
# 
#  The above copyright notice and this permission notice shall be included
#  in all copies or substantial portions of the Materials.
# 
#  THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
#  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
#  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
#  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
#  CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
#  TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
#  MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
# ****************************************************************************
# $Revision: 11985 $ on $Date: 2010-07-15 11:16:06 -0700 (Thu, 15 Jul 2010) $ 

import "CL/cl_platform"
{.push callConv: stdcall.} 


when defined(windows):
  const cldll* = "OpenCL.dll"
elif defined(macosx):
  const cldll* = "libOpenCL.dylib"
elif defined(unix):
  const cldll* = "libOpenCL.so"
   
#****************************************************************************
type 
  TCLObject{.pure, final.} = object
  PCLObject{.pure, final.} = ptr TCLObject
  
  TCLPlatform_id*{.pure, final.} = PCLObject
  TCLDevice_id*{.pure, final.} = PCLObject
  TCLContext*{.pure, final.} = PCLObject
  TCLCommand_queue*{.pure, final.} = PCLObject
  TCLMem*{.pure, final.} = PCLObject
  TCLProgram*{.pure, final.} = PCLObject
  TCLKernel*{.pure, final.} = PCLObject
  TCLEvent*{.pure, final.} = PCLObject
  TCLSampler*{.pure, final.} = PCLObject
  TCLBool*{.pure, final.} = PCLObject
# WARNING!  Unlike TCL types in TCLplatform.h, TCLbool is not guaranteed to be the same size as the bool in kernels. 
type 
  TCLSize_t* = TCLUlong
  TCLBitfield* = TCLUlong
  TCLDevice_type* = TCLbitfield
  TCLPlatform_info* = TCLuint
  TCLDevice_info* = TCLuint
  TCLDevice_fp_config* = TCLbitfield
  TCLDevice_mem_cache_type* = TCLuint
  TCLDevice_local_mem_type* = TCLuint
  TCLDevice_exec_capabilities* = TCLbitfield
  TCLCommand_queue_properties* = TCLbitfield
  TCLContext_properties* = ptr cint
  TCLContext_info* = TCLuint
  TCLCommand_queue_info* = TCLuint
  TCLChannel_order* = TCLuint
  TCLChannel_type* = TCLuint
  TCLMem_flags* = TCLbitfield
  TCLMem_object_type* = TCLuint
  TCLMem_info* = TCLuint
  TCLImage_info* = TCLuint
  TCLBuffer_create_type* = TCLuint
  TCLAddressing_mode* = TCLuint
  TCLFilter_mode* = TCLuint
  TCLSampler_info* = TCLuint
  TCLMap_flags* = TCLbitfield
  TCLProgram_info* = TCLuint
  TCLProgram_build_info* = TCLuint
  TCLBuild_status* = TCLint
  TCLKernel_info* = TCLuint
  TCLKernel_work_group_info* = TCLuint
  TCLEvent_info* = TCLuint
  TCLCommand_type* = TCLuint
  TCLProfiling_info* = TCLuint
  TCLImage_format*{.pure, final.} = object 
  #  image_channel_order*: TCLchannel_order
  #  image_channel_data_type*: TCLchannel_type

  #TCLBuffer_region*{.pure, final.} = object 
  #  origin*: TCLSize_t
  #  size*: TCLSize_t

#****************************************************************************
# Error Codes 
const 
  CL_SUCCESS* = 0
  CL_DEVICE_NOT_FOUND* = - 1
  CL_DEVICE_NOT_AVAILABLE* = - 2
  CL_COMPILER_NOT_AVAILABLE* = - 3
  CL_MEM_OBJECT_ALLOCATION_FAILURE* = - 4
  CL_OUT_OF_RESOURCES* = - 5
  CL_OUT_OF_HOST_MEMORY* = - 6
  CL_PROFILING_INFO_NOT_AVAILABLE* = - 7
  CL_MEM_COPY_OVERLAP* = - 8
  CL_IMAGE_FORMAT_MISMATCH* = - 9
  CL_IMAGE_FORMAT_NOT_SUPPORTED* = - 10
  CL_BUILD_PROGRAM_FAILURE* = - 11
  CL_MAP_FAILURE* = - 12
  CL_MISALIGNED_SUB_BUFFER_OFFSET* = - 13
  CL_EXEC_STATUS_ERROR_FOR_EVENTS_IN_WAIT_LIST* = - 14
  CL_INVALID_VALUE* = - 30
  CL_INVALID_DEVICE_TYPE* = - 31
  CL_INVALID_PLATFORM* = - 32
  CL_INVALID_DEVICE* = - 33
  CL_INVALID_CONTEXT* = - 34
  CL_INVALID_QUEUE_PROPERTIES* = - 35
  CL_INVALID_COMMAND_QUEUE* = - 36
  CL_INVALID_HOST_PTR* = - 37
  CL_INVALID_MEM_OBJECT* = - 38
  CL_INVALID_IMAGE_FORMAT_DESCRIPTOR* = - 39
  CL_INVALID_IMAGE_SIZE* = - 40
  CL_INVALID_SAMPLER* = - 41
  CL_INVALID_BINARY* = - 42
  CL_INVALID_BUILD_OPTIONS* = - 43
  CL_INVALID_PROGRAM* = - 44
  CL_INVALID_PROGRAM_EXECUTABLE* = - 45
  CL_INVALID_KERNEL_NAME* = - 46
  CL_INVALID_KERNEL_DEFINITION* = - 47
  CL_INVALID_KERNEL* = - 48
  CL_INVALID_ARG_INDEX* = - 49
  CL_INVALID_ARG_VALUE* = - 50
  CL_INVALID_ARG_SIZE* = - 51
  CL_INVALID_KERNEL_ARGS* = - 52
  CL_INVALID_WORK_DIMENSION* = - 53
  CL_INVALID_WORK_GROUP_SIZE* = - 54
  CL_INVALID_WORK_ITEM_SIZE* = - 55
  CL_INVALID_GLOBAL_OFFSET* = - 56
  CL_INVALID_EVENT_WAIT_LIST* = - 57
  CL_INVALID_EVENT* = - 58
  CL_INVALID_OPERATION* = - 59
  CL_INVALID_GL_OBJECT* = - 60
  CL_INVALID_BUFFER_SIZE* = - 61
  CL_INVALID_MIP_LEVEL* = - 62
  CL_INVALID_GLOBAL_WORK_SIZE* = - 63
  CL_INVALID_PROPERTY* = - 64
# OpenCL Version 
const 
  CL_VERSION_1_0* = 1
  CL_VERSION_1_1* = 1
# cl_bool 
const 
  CL_FALSE* = 0
  CL_TRUE* = 1
# TCLPlatform_info 
const 
  CL_PLATFORM_PROFILE* = 0x00000900
  CL_PLATFORM_VERSION* = 0x00000901
  CL_PLATFORM_NAME* = 0x00000902
  CL_PLATFORM_VENDOR* = 0x00000903
  CL_PLATFORM_EXTENSIONS* = 0x00000904
# cl_device_type - bitfield 
const 
  CL_DEVICE_TYPE_DEFAULT* = (1 shl 0)
  CL_DEVICE_TYPE_CPU* = (1 shl 1)
  CL_DEVICE_TYPE_GPU* = (1 shl 2)
  CL_DEVICE_TYPE_ACCELERATOR* = (1 shl 3)
  CL_DEVICE_TYPE_ALL* = 0xFFFFFFFF
# cl_device_info 
const 
  CL_DEVICE_TYPE* = 0x00001000
  CL_DEVICE_VENDOR_ID* = 0x00001001
  CL_DEVICE_MAX_COMPUTE_UNITS* = 0x00001002
  CL_DEVICE_MAX_WORK_ITEM_DIMENSIONS* = 0x00001003
  CL_DEVICE_MAX_WORK_GROUP_SIZE* = 0x00001004
  CL_DEVICE_MAX_WORK_ITEM_SIZES* = 0x00001005
  CL_DEVICE_PREFERRED_VECTOR_WIDTH_CHAR* = 0x00001006
  CL_DEVICE_PREFERRED_VECTOR_WIDTH_SHORT* = 0x00001007
  CL_DEVICE_PREFERRED_VECTOR_WIDTH_INT* = 0x00001008
  CL_DEVICE_PREFERRED_VECTOR_WIDTH_LONG* = 0x00001009
  CL_DEVICE_PREFERRED_VECTOR_WIDTH_FLOAT* = 0x0000100A
  CL_DEVICE_PREFERRED_VECTOR_WIDTH_DOUBLE* = 0x0000100B
  CL_DEVICE_MAX_CLOCK_FREQUENCY* = 0x0000100C
  CL_DEVICE_ADDRESS_BITS* = 0x0000100D
  CL_DEVICE_MAX_READ_IMAGE_ARGS* = 0x0000100E
  CL_DEVICE_MAX_WRITE_IMAGE_ARGS* = 0x0000100F
  CL_DEVICE_MAX_MEM_ALLOC_SIZE* = 0x00001010
  CL_DEVICE_IMAGE2D_MAX_WIDTH* = 0x00001011
  CL_DEVICE_IMAGE2D_MAX_HEIGHT* = 0x00001012
  CL_DEVICE_IMAGE3D_MAX_WIDTH* = 0x00001013
  CL_DEVICE_IMAGE3D_MAX_HEIGHT* = 0x00001014
  CL_DEVICE_IMAGE3D_MAX_DEPTH* = 0x00001015
  CL_DEVICE_IMAGE_SUPPORT* = 0x00001016
  CL_DEVICE_MAX_PARAMETER_SIZE* = 0x00001017
  CL_DEVICE_MAX_SAMPLERS* = 0x00001018
  CL_DEVICE_MEM_BASE_ADDR_ALIGN* = 0x00001019
  CL_DEVICE_MIN_DATA_TYPE_ALIGN_SIZE* = 0x0000101A
  CL_DEVICE_SINGLE_FP_CONFIG* = 0x0000101B
  CL_DEVICE_GLOBAL_MEM_CACHE_TYPE* = 0x0000101C
  CL_DEVICE_GLOBAL_MEM_CACHELINE_SIZE* = 0x0000101D
  CL_DEVICE_GLOBAL_MEM_CACHE_SIZE* = 0x0000101E
  CL_DEVICE_GLOBAL_MEM_SIZE* = 0x0000101F
  CL_DEVICE_MAX_CONSTANT_BUFFER_SIZE* = 0x00001020
  CL_DEVICE_MAX_CONSTANT_ARGS* = 0x00001021
  CL_DEVICE_LOCAL_MEM_TYPE* = 0x00001022
  CL_DEVICE_LOCAL_MEM_SIZE* = 0x00001023
  CL_DEVICE_ERROR_CORRECTION_SUPPORT* = 0x00001024
  CL_DEVICE_PROFILING_TIMER_RESOLUTION* = 0x00001025
  CL_DEVICE_ENDIAN_LITTLE* = 0x00001026
  CL_DEVICE_AVAILABLE* = 0x00001027
  CL_DEVICE_COMPILER_AVAILABLE* = 0x00001028
  CL_DEVICE_EXECUTION_CAPABILITIES* = 0x00001029
  CL_DEVICE_QUEUE_PROPERTIES* = 0x0000102A
  CL_DEVICE_NAME* = 0x0000102B
  CL_DEVICE_VENDOR* = 0x0000102C
  CL_DRIVER_VERSION* = 0x0000102D
  CL_DEVICE_PROFILE* = 0x0000102E
  CL_DEVICE_VERSION* = 0x0000102F
  CL_DEVICE_EXTENSIONS* = 0x00001030
  CL_DEVICE_PLATFORM* = 0x00001031
# 0x1032 reserved for CL_DEVICE_DOUBLE_FP_CONFIG 
# 0x1033 reserved for CL_DEVICE_HALF_FP_CONFIG 
const 
  CL_DEVICE_PREFERRED_VECTOR_WIDTH_HALF* = 0x00001034
  CL_DEVICE_HOST_UNIFIED_MEMORY* = 0x00001035
  CL_DEVICE_NATIVE_VECTOR_WIDTH_CHAR* = 0x00001036
  CL_DEVICE_NATIVE_VECTOR_WIDTH_SHORT* = 0x00001037
  CL_DEVICE_NATIVE_VECTOR_WIDTH_INT* = 0x00001038
  CL_DEVICE_NATIVE_VECTOR_WIDTH_LONG* = 0x00001039
  CL_DEVICE_NATIVE_VECTOR_WIDTH_FLOAT* = 0x0000103A
  CL_DEVICE_NATIVE_VECTOR_WIDTH_DOUBLE* = 0x0000103B
  CL_DEVICE_NATIVE_VECTOR_WIDTH_HALF* = 0x0000103C
  CL_DEVICE_OPENCL_C_VERSION* = 0x0000103D
# cl_device_fp_config - bitfield 
const 
  CL_FP_DENORM* = (1 shl 0)
  CL_FP_INF_NAN* = (1 shl 1)
  CL_FP_ROUND_TO_NEAREST* = (1 shl 2)
  CL_FP_ROUND_TO_ZERO* = (1 shl 3)
  CL_FP_ROUND_TO_INF* = (1 shl 4)
  CL_FP_FMA* = (1 shl 5)
  CL_FP_SOFT_FLOAT* = (1 shl 6)
# cl_device_mem_cache_type 
const 
  CL_NONE* = 0x00000000
  CL_READ_ONLY_CACHE* = 0x00000001
  CL_READ_WRITE_CACHE* = 0x00000002
# cl_device_local_mem_type 
const 
  CL_LOCAL* = 0x00000001
  CL_GLOBAL* = 0x00000002
# cl_device_exec_capabilities - bitfield 
const 
  CL_EXEC_KERNEL* = (1 shl 0)
  CL_EXEC_NATIVE_KERNEL* = (1 shl 1)
# TCLCommand_queue_properties - bitfield 
const 
  CL_QUEUE_OUT_OF_ORDER_EXEC_MODE_ENABLE* = (1 shl 0)
  CL_QUEUE_PROFILING_ENABLE* = (1 shl 1)
# TCLContext_info  
const 
  CL_CONTEXT_REFERENCE_COUNT* = 0x00001080
  CL_CONTEXT_DEVICES* = 0x00001081
  CL_CONTEXT_PROPERTIES* = 0x00001082
  CL_CONTEXT_NUM_DEVICES* = 0x00001083
# TCLContext_info + TCLContext_properties 
const 
  TCLContext_PLATFORM* = 0x00001084
# TCLCommand_queue_info 
const 
  CL_QUEUE_CONTEXT* = 0x00001090
  CL_QUEUE_DEVICE* = 0x00001091
  CL_QUEUE_REFERENCE_COUNT* = 0x00001092
  CL_QUEUE_PROPERTIES* = 0x00001093
# TCLMem_flags - bitfield 
const 
  CL_MEM_READ_WRITE* = (1 shl 0)
  CL_MEM_WRITE_ONLY* = (1 shl 1)
  CL_MEM_READ_ONLY* = (1 shl 2)
  CL_MEM_USE_HOST_PTR* = (1 shl 3)
  CL_MEM_ALLOC_HOST_PTR* = (1 shl 4)
  CL_MEM_COPY_HOST_PTR* = (1 shl 5)
# cl_channel_order 
const 
  CL_R* = 0x000010B0
  CL_A* = 0x000010B1
  CL_RG* = 0x000010B2
  CL_RA* = 0x000010B3
  CL_RGB* = 0x000010B4
  CL_RGBA* = 0x000010B5
  CL_BGRA* = 0x000010B6
  CL_ARGB* = 0x000010B7
  TCLIntENSITY* = 0x000010B8
  CL_LUMINANCE* = 0x000010B9
  CL_Rx* = 0x000010BA
  CL_RGx* = 0x000010BB
  CL_RGBx* = 0x000010BC
# cl_channel_type 
const 
  CL_SNORM_INT8* = 0x000010D0
  CL_SNORM_INT16* = 0x000010D1
  CL_UNORM_INT8* = 0x000010D2
  CL_UNORM_INT16* = 0x000010D3
  CL_UNORM_SHORT_565* = 0x000010D4
  CL_UNORM_SHORT_555* = 0x000010D5
  CL_UNORM_INT_101010* = 0x000010D6
  CL_SIGNED_INT8* = 0x000010D7
  CL_SIGNED_INT16* = 0x000010D8
  CL_SIGNED_INT32* = 0x000010D9
  CL_UNSIGNED_INT8* = 0x000010DA
  CL_UNSIGNED_INT16* = 0x000010DB
  CL_UNSIGNED_INT32* = 0x000010DC
  CL_HALF_FLOAT* = 0x000010DD
  CL_FLOAT* = 0x000010DE
# cl_mem_object_type 
const 
  CL_MEM_OBJECT_BUFFER* = 0x000010F0
  CL_MEM_OBJECT_IMAGE2D* = 0x000010F1
  CL_MEM_OBJECT_IMAGE3D* = 0x000010F2
# cl_mem_info 
const 
  CL_MEM_TYPE* = 0x00001100
  CL_MEM_FLAGS* = 0x00001101
  CL_MEM_SIZE* = 0x00001102
  CL_MEM_HOST_PTR* = 0x00001103
  CL_MEM_MAP_COUNT* = 0x00001104
  CL_MEM_REFERENCE_COUNT* = 0x00001105
  CL_MEM_CONTEXT* = 0x00001106
  CL_MEM_ASSOCIATED_MEMOBJECT* = 0x00001107
  CL_MEM_OFFSET* = 0x00001108
# cl_image_info 
const 
  CL_IMAGE_FORMAT* = 0x00001110
  CL_IMAGE_ELEMENT_SIZE* = 0x00001111
  CL_IMAGE_ROW_PITCH* = 0x00001112
  CL_IMAGE_SLICE_PITCH* = 0x00001113
  CL_IMAGE_WIDTH* = 0x00001114
  CL_IMAGE_HEIGHT* = 0x00001115
  CL_IMAGE_DEPTH* = 0x00001116
# cl_addressing_mode 
const 
  CL_ADDRESS_NONE* = 0x00001130
  CL_ADDRESS_CLAMP_TO_EDGE* = 0x00001131
  CL_ADDRESS_CLAMP* = 0x00001132
  CL_ADDRESS_REPEAT* = 0x00001133
  CL_ADDRESS_MIRRORED_REPEAT* = 0x00001134
# cl_filter_mode 
const 
  CL_FILTER_NEAREST* = 0x00001140
  CL_FILTER_LINEAR* = 0x00001141
# cl_sampler_info 
const 
  CL_SAMPLER_REFERENCE_COUNT* = 0x00001150
  CL_SAMPLER_CONTEXT* = 0x00001151
  CL_SAMPLER_NORMALIZED_COORDS* = 0x00001152
  CL_SAMPLER_ADDRESSING_MODE* = 0x00001153
  CL_SAMPLER_FILTER_MODE* = 0x00001154
# cl_map_flags - bitfield 
const 
  CL_MAP_READ* = (1 shl 0)
  CL_MAP_WRITE* = (1 shl 1)
# cl_program_info 
const 
  CL_PROGRAM_REFERENCE_COUNT* = 0x00001160
  CL_PROGRAM_CONTEXT* = 0x00001161
  CL_PROGRAM_NUM_DEVICES* = 0x00001162
  CL_PROGRAM_DEVICES* = 0x00001163
  CL_PROGRAM_SOURCE* = 0x00001164
  CL_PROGRAM_BINARY_SIZES* = 0x00001165
  CL_PROGRAM_BINARIES* = 0x00001166
# cl_program_build_info 
const 
  CL_PROGRAM_BUILD_STATUS* = 0x00001181
  CL_PROGRAM_BUILD_OPTIONS* = 0x00001182
  CL_PROGRAM_BUILD_LOG* = 0x00001183
# cl_build_status 
const 
  CL_BUILD_SUCCESS* = 0
  CL_BUILD_NONE* = - 1
  CL_BUILD_ERROR* = - 2
  CL_BUILD_IN_PROGRESS* = - 3
# cl_kernel_info 
const 
  CL_KERNEL_FUNCTION_NAME* = 0x00001190
  CL_KERNEL_NUM_ARGS* = 0x00001191
  CL_KERNEL_REFERENCE_COUNT* = 0x00001192
  CL_KERNEL_CONTEXT* = 0x00001193
  CL_KERNEL_PROGRAM* = 0x00001194
# cl_kernel_work_group_info 
const 
  CL_KERNEL_WORK_GROUP_SIZE* = 0x000011B0
  CL_KERNEL_COMPILE_WORK_GROUP_SIZE* = 0x000011B1
  CL_KERNEL_LOCAL_MEM_SIZE* = 0x000011B2
  CL_KERNEL_PREFERRED_WORK_GROUP_SIZE_MULTIPLE* = 0x000011B3
  CL_KERNEL_PRIVATE_MEM_SIZE* = 0x000011B4
# cl_event_info  
const 
  CL_EVENT_COMMAND_QUEUE* = 0x000011D0
  CL_EVENT_COMMAND_TYPE* = 0x000011D1
  CL_EVENT_REFERENCE_COUNT* = 0x000011D2
  CL_EVENT_COMMAND_EXECUTION_STATUS* = 0x000011D3
  CL_EVENT_CONTEXT* = 0x000011D4
# cl_command_type 
const 
  CL_COMMAND_NDRANGE_KERNEL* = 0x000011F0
  CL_COMMAND_TASK* = 0x000011F1
  CL_COMMAND_NATIVE_KERNEL* = 0x000011F2
  CL_COMMAND_READ_BUFFER* = 0x000011F3
  CL_COMMAND_WRITE_BUFFER* = 0x000011F4
  CL_COMMAND_COPY_BUFFER* = 0x000011F5
  CL_COMMAND_READ_IMAGE* = 0x000011F6
  CL_COMMAND_WRITE_IMAGE* = 0x000011F7
  CL_COMMAND_COPY_IMAGE* = 0x000011F8
  CL_COMMAND_COPY_IMAGE_TO_BUFFER* = 0x000011F9
  CL_COMMAND_COPY_BUFFER_TO_IMAGE* = 0x000011FA
  CL_COMMAND_MAP_BUFFER* = 0x000011FB
  CL_COMMAND_MAP_IMAGE* = 0x000011FC
  CL_COMMAND_UNMAP_MEM_OBJECT* = 0x000011FD
  CL_COMMAND_MARKER* = 0x000011FE
  CL_COMMAND_ACQUIRE_GL_OBJECTS* = 0x000011FF
  CL_COMMAND_RELEASE_GL_OBJECTS* = 0x00001200
  CL_COMMAND_READ_BUFFER_RECT* = 0x00001201
  CL_COMMAND_WRITE_BUFFER_RECT* = 0x00001202
  CL_COMMAND_COPY_BUFFER_RECT* = 0x00001203
  CL_COMMAND_USER* = 0x00001204
# command execution status 
const 
  CL_COMPLETE* = 0x00000000
  CL_RUNNING* = 0x00000001
  CL_SUBMITTED* = 0x00000002
  CL_QUEUED* = 0x00000003
# cl_buffer_create_type  
const 
  CL_BUFFER_CREATE_TYPE_REGION* = 0x00001220
# cl_profiling_info  
const 
  CL_PROFILING_COMMAND_QUEUED* = 0x00001280
  CL_PROFILING_COMMAND_SUBMIT* = 0x00001281
  CL_PROFILING_COMMAND_START* = 0x00001282
  CL_PROFILING_COMMAND_END* = 0x00001283
#******************************************************************************************************
# Platform API 
proc clGetPlatformIDs*(a2: TCLUint,  # num_entries 
                       a3: ptr TCLPlatform_id,  # platforms 
                       a4: ptr TCLUint): TCLInt {.importc: "clGetPlatformIDs", dynlib: cldll.}
  # num_platforms 
proc clGetPlatformInfo*(a2: TCLPlatform_id,  # platform 
                        a3: TCLPlatform_info,  # param_name 
                        a4: TCLSize_t,  # param_value_size 
                        a5: pointer, 
                        a6: ptr TCLSize_t): TCLInt {.importc: "clGetPlatformInfo", dynlib: cldll.}
  # param_value_size_ret 
# Device APIs 
proc clGetDeviceIDs*(a2: TCLPlatform_id,  # platform 
                     a3: TCLDevice_type,  # device_type 
                     a4: TCLUint,  # num_entries 
                     a5: ptr TCLDevice_id,  # devices 
                     a6: ptr TCLUint): TCLInt {.importc: "clGetDeviceIDs", dynlib: cldll.}
  # num_devices 
proc clGetDeviceInfo*(a2: TCLDevice_id,  # device 
                      a3: TCLDevice_info,  # param_name 
                      a4: TCLSize_t,  # param_value_size 
                      a5: pointer, 
                      a6: ptr TCLSize_t): TCLInt {.importc: "clGetDeviceInfo", dynlib: cldll.}
  # param_value_size_ret 
# Context APIs  
proc clCreateContext*(a2: ptr TCLContext_properties,  # properties 
                      a3: TCLUint,  # num_devices 
                      a4: ptr TCLDevice_id,  # devices 
                      a5: proc (a2: cstring, a3: pointer, a4: TCLSize_t, 
                                a5: pointer),
                      a6: pointer, 
                      a7: ptr TCLInt): TCLContext {.importc: "clCreateContext", dynlib: cldll.}
  # errcode_ret 
proc clCreateContextFromType*(a2: ptr TCLContext_properties,  # properties 
                              a3: TCLDevice_type,  # device_type 
                              a4: proc (a2: cstring, a3: pointer, a4: TCLSize_t, 
                                        a5: pointer),  # pfn_notify
                              a5: pointer, 
                              a6: ptr TCLInt): TCLContext {.importc: "clCreateContextFromType", dynlib: cldll.}
  # errcode_ret 
proc clRetainContext*(a2: TCLContext): TCLInt {.importc: "clRetainContext", dynlib: cldll.}
  # context 
proc clReleaseContext*(a2: TCLContext): TCLInt {.importc: "clReleaseContext", dynlib: cldll.}
  # context 
proc clGetContextInfo*(a2: TCLContext,  # context 
                       a3: TCLContext_info,  # param_name 
                       a4: TCLSize_t,  # param_value_size 
                       a5: pointer, 
                       a6: ptr TCLSize_t): TCLInt {.importc: "clGetContextInfo", dynlib: cldll.}
  # param_value_size_ret 
# Command Queue APIs 
proc clCreateCommandQueue*(a2: TCLContext,  # context 
                           a3: TCLDevice_id,  # device 
                           a4: TCLCommand_queue_properties,  # properties 
                           a5: ptr TCLInt): TCLCommand_queue {.importc: "clCreateCommandQueue", dynlib: cldll.}
  # errcode_ret 
proc clRetainCommandQueue*(a2: TCLCommand_queue): TCLInt {.importc: "clRetainCommandQueue", dynlib: cldll.}
  # command_queue 
proc clReleaseCommandQueue*(a2: TCLCommand_queue): TCLInt {.importc: "clReleaseCommandQueue", dynlib: cldll.}
  # command_queue 
proc clGetCommandQueueInfo*(a2: TCLCommand_queue,  # command_queue 
                            a3: TCLCommand_queue_info,  # param_name 
                            a4: TCLSize_t,  # param_value_size 
                            a5: pointer, 
                            a6: ptr TCLSize_t): TCLInt {.importc: "clGetCommandQueueInfo", dynlib: cldll.}
  # param_value_size_ret 
when defined(CL_USE_OPENCL_1_0_APIS): 
  # 
  #   WARNING:
  #      This API introduces mutable state into the OpenCL implementation. It has been REMOVED
  #   to better facilitate thread safety.  The 1.0 API is not thread safe. It is not tested by the
  #   OpenCL 1.1 conformance test, and consequently may not work or may not work dependably.
  #   It is likely to be non-performant. Use of this API is not advised. Use at your own risk.
  # 
  #   Software developers previously relying on this API are instructed to set the command queue 
  #   properties when creating the queue, instead. 
  # 
  proc clSetCommandQueueProperty*(a2: TCLCommand_queue,  # command_queue 
                                  a3: TCLCommand_queue_properties,  # properties 
                                  a4: cl_bool,  # enable 
                                  a5: ptr TCLCommand_queue_properties): TCLInt {.importc: "clSetCommandQueueProperty", dynlib: cldll.}
    # old_properties 
# Memory Object APIs 
proc clCreateBuffer*(a2: TCLContext,  # context 
                     a3: TCLMem_flags,  # flags 
                     a4: TCLSize_t,  # size 
                     a5: pointer, a6: 
                     ptr TCLInt): TCLMem {.importc: "clCreateBuffer", dynlib: cldll.}
  # errcode_ret 
proc clCreateSubBuffer*(a2: TCLMem,  # buffer 
                        a3: TCLMem_flags,  # flags 
                        a4: TCLBuffer_create_type,  # buffer_create_type 
                        a5: pointer, a6: ptr TCLInt): TCLMem {.importc: "clCreateSubBuffer", dynlib: cldll.}
  # errcode_ret 
proc clCreateImage2D*(a2: TCLContext,  # context 
                      a3: TCLMem_flags,  # flags 
                      a4: ptr TCLImage_format,  # image_format 
                      a5: TCLSize_t,  # image_width 
                      a6: TCLSize_t,  # image_height 
                      a7: TCLSize_t,  # image_row_pitch 
                      a8: pointer, a9: ptr TCLInt): TCLMem {.importc: "clCreateImage2D", dynlib: cldll.}
  # errcode_ret 
proc clCreateImage3D*(a2: TCLContext,  # context 
                      a3: TCLMem_flags,  # flags 
                      a4: ptr TCLImage_format,  # image_format 
                      a5: TCLSize_t,  # image_width 
                      a6: TCLSize_t,  # image_height 
                      a7: TCLSize_t,  # image_depth 
                      a8: TCLSize_t,  # image_row_pitch 
                      a9: TCLSize_t,  # image_slice_pitch 
                      a10: pointer, a11: ptr TCLInt): TCLMem {.importc: "clCreateImage3D", dynlib: cldll.}
  # errcode_ret 
proc clRetainMemObject*(a2: TCLMem): TCLInt {.importc: "clRetainMemObject", dynlib: cldll.}
  # memobj 
proc clReleaseMemObject*(a2: TCLMem): TCLInt {.importc: "clReleaseMemObject", dynlib: cldll.}
  # memobj 
proc clGetSupportedImageFormats*(a2: TCLContext,  # context 
                                 a3: TCLMem_flags,  # flags 
                                 a4: TCLMem_object_type,  # image_type 
                                 a5: TCLUint,  # num_entries 
                                 a6: ptr TCLImage_format,  # image_formats 
                                 a7: ptr TCLUint): TCLInt {.importc: "clGetSupportedImageFormats", dynlib: cldll.}
  # num_image_formats 
proc clGetMemObjectInfo*(a2: TCLMem,  # memobj 
                         a3: TCLMem_info,  # param_name 
                         a4: TCLSize_t,  # param_value_size 
                         a5: pointer, a6: ptr TCLSize_t): TCLInt {.importc: "clGetMemObjectInfo", dynlib: cldll.}
  # param_value_size_ret 
proc clGetImageInfo*(a2: TCLMem,  # image 
                     a3: TCLImage_info,  # param_name 
                     a4: TCLSize_t,  # param_value_size 
                     a5: pointer, a6: ptr TCLSize_t): TCLInt {.importc: "clGetImageInfo", dynlib: cldll.}
  # param_value_size_ret 
proc clSetMemObjectDestructorCallback*(a2: TCLMem,  # memobj 
    a3: proc (a2: TCLMem,   # memobj 
              a3: pointer),  #pfn_notify
    a4: pointer): TCLInt {.importc: "clSetMemObjectDestructorCallback", dynlib: cldll.}
# Sampler APIs  
proc clCreateSampler*(a2: TCLContext,  # context 
                      a3: TCLBool,  # normalized_coords 
                      a4: TCLAddressing_mode,  # addressing_mode 
                      a5: TCLFilter_mode,  # filter_mode 
                      a6: ptr TCLInt): TCLSampler {.importc: "clCreateSampler", dynlib: cldll.}
  # errcode_ret 
proc clRetainSampler*(a2: TCLSampler): TCLInt {.importc: "clRetainSampler", dynlib: cldll.}
  # sampler 
proc clReleaseSampler*(a2: TCLSampler): TCLInt {.importc: "clReleaseSampler", dynlib: cldll.}
  # sampler 
proc clGetSamplerInfo*(a2: TCLSampler,  # sampler 
                       a3: TCLSampler_info,  # param_name 
                       a4: TCLSize_t,  # param_value_size 
                       a5: pointer, a6: ptr TCLSize_t): TCLInt {.importc: "clGetSamplerInfo", dynlib: cldll.}
  # param_value_size_ret 
# Program Object APIs  
proc clCreateProgramWithSource*(a2: TCLContext,  # context 
                                a3: TCLUint,  # count 
                                a4: cstringArray, a5: ptr TCLSize_t,  # lengths 
                                a6: ptr TCLInt): TCLProgram {.importc: "clCreateProgramWithSource", dynlib: cldll.}
  # errcode_ret 
proc clCreateProgramWithBinary*(a2: TCLContext,  # context 
                                a3: TCLUint,  # num_devices 
                                a4: ptr TCLDevice_id,  # device_list 
                                a5: ptr TCLSize_t,  # lengths 
                                a6: ptr ptr cchar,  # binaries 
                                a7: ptr TCLInt,  # binary_status 
                                a8: ptr TCLInt): TCLProgram {.importc: "clCreateProgramWithBinary", dynlib: cldll.}
  # errcode_ret 
proc clRetainProgram*(a2: TCLProgram): TCLInt {.importc: "clRetainProgram", dynlib: cldll.}
  # program 
proc clReleaseProgram*(a2: TCLProgram): TCLInt {.importc: "clReleaseProgram", dynlib: cldll.}
  # program 
proc clBuildProgram*(a2: TCLProgram,  # program 
                     a3: TCLUint,  # num_devices 
                     a4: ptr TCLDevice_id,  # device_list 
                     a5: cstring, 
                     a6: proc (a2: TCLProgram,  # program 
                               a3: pointer),  # pfn_notify 
                     a7: pointer): TCLInt {.importc: "clBuildProgram", dynlib: cldll.}
proc clUnloadCompiler*(): TCLInt {.importc: "clUnloadCompiler", dynlib: cldll.}
proc clGetProgramInfo*(a2: TCLProgram,  # program  
                       a3: TCLProgram_info,  # param_name 
                       a4: TCLSize_t,  # param_value_size 
                       a5: pointer, a6: ptr TCLSize_t): TCLInt {.importc: "clGetProgramInfo", dynlib: cldll.}
  # param_value_size_ret 
proc clGetProgramBuildInfo*(a2: TCLProgram,  # program 
                            a3: TCLDevice_id,  # device 
                            a4: TCLProgram_build_info,  # param_name 
                            a5: TCLSize_t,  # param_value_size 
                            a6: pointer, a7: ptr TCLSize_t): TCLInt {.importc: "clGetProgramBuildInfo", dynlib: cldll.}
  # param_value_size_ret 
# Kernel Object APIs 
proc clCreateKernel*(a2: TCLProgram,  # program 
                     a3: cstring, a4: ptr TCLInt): TCLKernel {.importc: "clCreateKernel", dynlib: cldll.}
  # errcode_ret 
proc clCreateKernelsInProgram*(a2: TCLProgram,  # program 
                               a3: TCLUint,  # num_kernels 
                               a4: ptr TCLKernel,  # kernels 
                               a5: ptr TCLUint): TCLInt {.importc: "clCreateKernelsInProgram", dynlib: cldll.}
  # num_kernels_ret 
proc clRetainKernel*(a2: TCLKernel): TCLInt {.importc: "clRetainKernel", dynlib: cldll.}
  # kernel 
proc clReleaseKernel*(a2: TCLKernel): TCLInt {.importc: "clReleaseKernel", dynlib: cldll.}
  # kernel 
proc clSetKernelArg*(a2: TCLKernel,  # kernel 
                     a3: TCLUint,  # arg_index 
                     a4: TCLSize_t,  # arg_size 
                     a5: pointer): TCLInt {.importc: "clSetKernelArg", dynlib: cldll.}
proc clGetKernelInfo*(a2: TCLKernel,  # kernel 
                      a3: TCLKernel_info,  # param_name 
                      a4: TCLSize_t,  # param_value_size 
                      a5: pointer, a6: ptr TCLSize_t): TCLInt {.importc: "clGetKernelInfo", dynlib: cldll.}
  # param_value_size_ret 
proc clGetKernelWorkGroupInfo*(a2: TCLKernel,  # kernel 
                               a3: TCLDevice_id,  # device 
                               a4: TCLKernel_work_group_info,  # param_name 
                               a5: TCLSize_t,  # param_value_size 
                               a6: pointer, a7: ptr TCLSize_t): TCLInt {.importc: "clGetKernelWorkGroupInfo", dynlib: cldll.}
  # param_value_size_ret 
# Event Object APIs  
proc clWaitForEvents*(a2: TCLUint,  # num_events 
                      a3: ptr TCLKernel): TCLInt {.importc: "clWaitForEvents", dynlib: cldll.}
  # event_list 
proc clGetEventInfo*(a2: TCLEvent,  # event 
                     a3: TCLEvent_info,  # param_name 
                     a4: TCLSize_t,  # param_value_size 
                     a5: pointer, a6: ptr TCLSize_t): TCLInt {.importc: "clGetEventInfo", dynlib: cldll.}
  # param_value_size_ret 
proc clCreateUserEvent*(a2: TCLContext,  # context 
                        a3: ptr TCLInt): TCLEvent {.importc: "clCreateUserEvent", dynlib: cldll.}
  # errcode_ret 
proc clRetainEvent*(a2: TCLEvent): TCLInt {.importc: "clRetainEvent", dynlib: cldll.}
  # event 
proc clReleaseEvent*(a2: TCLEvent): TCLInt {.importc: "clReleaseEvent", dynlib: cldll.}
  # event 
proc clSetUserEventStatus*(a2: TCLEvent,  # event 
                           a3: TCLInt): TCLInt {.importc: "clSetUserEventStatus", dynlib: cldll.}
  # execution_status 
proc clSetEventCallback*(a2: TCLEvent,  # event 
                         a3: TCLInt,  # command_exec_callback_type 
                         a4: proc (a2: TCLEvent, a3: TCLInt, a4: pointer),   # pfn_notify 
                                   a5: pointer): TCLInt {.importc: "clSetEventCallback", dynlib: cldll.}
# Profiling APIs  
proc clGetEventProfilingInfo*(a2: TCLEvent,  # event 
                              a3: TCLProfiling_info,  # param_name 
                              a4: TCLSize_t,  # param_value_size 
                              a5: pointer, a6: ptr TCLSize_t): TCLInt {.importc: "clGetEventProfilingInfo", dynlib: cldll.}
  # param_value_size_ret 
# Flush and Finish APIs 
proc clFlush*(a2: TCLCommand_queue): TCLInt {.importc: "clFlush", dynlib: cldll.}
  # command_queue 
proc clFinish*(a2: TCLCommand_queue): TCLInt {.importc: "clFinish", dynlib: cldll.}
  # command_queue 
# Enqueued Commands APIs 
proc clEnqueueReadBuffer*(a2: TCLCommand_queue,  # command_queue 
                          a3: TCLMem,  # buffer 
                          a4: TCLBool,  # blocking_read 
                          a5: TCLSize_t,  # offset 
                          a6: TCLSize_t,  # cb 
                          a7: pointer, a8: TCLUint,  # num_events_in_wait_list 
                          a9: ptr TCLEvent,  # event_wait_list 
                          a10: ptr TCLEvent): TCLInt {.importc: "clEnqueueReadBuffer", dynlib: cldll.}
  # event 
proc clEnqueueReadBufferRect*(a2: TCLCommand_queue,  # command_queue 
                              a3: TCLMem,  # buffer 
                              a4: TCLBool,  # blocking_read 
                              a5: ptr TCLSize_t,  # buffer_origin 
                              a6: ptr TCLSize_t,  # host_origin 
                              a7: ptr TCLSize_t,  # region 
                              a8: TCLSize_t,  # buffer_row_pitch 
                              a9: TCLSize_t,  # buffer_slice_pitch 
                              a10: TCLSize_t,  # host_row_pitch 
                              a11: TCLSize_t,  # host_slice_pitch 
                              a12: pointer, a13: TCLUint,  # 
                                                           # num_events_in_wait_list 
                              a14: ptr TCLEvent,  # event_wait_list 
                              a15: ptr TCLEvent): TCLInt {.importc: "clEnqueueReadBufferRect", dynlib: cldll.}
  # event 
proc clEnqueueWriteBuffer*(a2: TCLCommand_queue,  # command_queue 
                           a3: TCLMem,  # buffer 
                           a4: TCLBool,  # blocking_write 
                           a5: TCLSize_t,  # offset 
                           a6: TCLSize_t,  # cb 
                           a7: pointer, a8: TCLUint,  # num_events_in_wait_list 
                           a9: ptr TCLEvent,  # event_wait_list 
                           a10: ptr TCLEvent): TCLInt {.importc: "clEnqueueWriteBuffer", dynlib: cldll.}
  # event 
proc clEnqueueWriteBufferRect*(a2: TCLCommand_queue,  # command_queue 
                               a3: TCLMem,  # buffer 
                               a4: TCLBool,  # blocking_write 
                               a5: ptr TCLSize_t,  # buffer_origin 
                               a6: ptr TCLSize_t,  # host_origin 
                               a7: ptr TCLSize_t,  # region 
                               a8: TCLSize_t,  # buffer_row_pitch 
                               a9: TCLSize_t,  # buffer_slice_pitch 
                               a10: TCLSize_t,  # host_row_pitch 
                               a11: TCLSize_t,  # host_slice_pitch 
                               a12: pointer, a13: TCLUint,  # 
                                                            # num_events_in_wait_list 
                               a14: ptr TCLEvent,  # event_wait_list 
                               a15: ptr TCLEvent): TCLInt {.importc: "clEnqueueWriteBufferRect", dynlib: cldll.}
  # event 
proc clEnqueueCopyBuffer*(a2: TCLCommand_queue,  # command_queue 
                          a3: TCLMem,  # src_buffer 
                          a4: TCLMem,  # dst_buffer 
                          a5: TCLSize_t,  # src_offset 
                          a6: TCLSize_t,  # dst_offset 
                          a7: TCLSize_t,  # cb 
                          a8: TCLUint,  # num_events_in_wait_list 
                          a9: ptr TCLEvent,  # event_wait_list 
                          a10: ptr TCLEvent): TCLInt {.importc: "clEnqueueCopyBuffer", dynlib: cldll.}
  # event 
proc clEnqueueCopyBufferRect*(a2: TCLCommand_queue,  # command_queue 
                              a3: TCLMem,  # src_buffer 
                              a4: TCLMem,  # dst_buffer 
                              a5: ptr TCLSize_t,  # src_origin 
                              a6: ptr TCLSize_t,  # dst_origin 
                              a7: ptr TCLSize_t,  # region 
                              a8: TCLSize_t,  # src_row_pitch 
                              a9: TCLSize_t,  # src_slice_pitch 
                              a10: TCLSize_t,  # dst_row_pitch 
                              a11: TCLSize_t,  # dst_slice_pitch 
                              a12: TCLUint,  # num_events_in_wait_list 
                              a13: ptr TCLEvent,  # event_wait_list 
                              a14: ptr TCLEvent): TCLInt {.importc: "clEnqueueCopyBufferRect", dynlib: cldll.}
  # event 
proc clEnqueueReadImage*(a2: TCLCommand_queue,  # command_queue 
                         a3: TCLMem,  # image 
                         a4: TCLBool,  # blocking_read 
                         a5: ptr TCLSize_t,  # origin[3] 
                         a6: ptr TCLSize_t,  # region[3] 
                         a7: TCLSize_t,  # row_pitch 
                         a8: TCLSize_t,  # slice_pitch 
                         a9: pointer, a10: TCLUint,  # num_events_in_wait_list 
                         a11: ptr TCLEvent,  # event_wait_list 
                         a12: ptr TCLEvent): TCLInt {.importc: "clEnqueueReadImage", dynlib: cldll.}
  # event 
proc clEnqueueWriteImage*(a2: TCLCommand_queue,  # command_queue 
                          a3: TCLMem,  # image 
                          a4: TCLBool,  # blocking_write 
                          a5: ptr TCLSize_t,  # origin[3] 
                          a6: ptr TCLSize_t,  # region[3] 
                          a7: TCLSize_t,  # input_row_pitch 
                          a8: TCLSize_t,  # input_slice_pitch 
                          a9: pointer, a10: TCLUint,  # num_events_in_wait_list 
                          a11: ptr TCLEvent,  # event_wait_list 
                          a12: ptr TCLEvent): TCLInt {.importc: "clEnqueueWriteImage", dynlib: cldll.}
  # event 
proc clEnqueueCopyImage*(a2: TCLCommand_queue,  # command_queue 
                         a3: TCLMem,  # src_image 
                         a4: TCLMem,  # dst_image 
                         a5: ptr TCLSize_t,  # src_origin[3] 
                         a6: ptr TCLSize_t,  # dst_origin[3] 
                         a7: ptr TCLSize_t,  # region[3] 
                         a8: TCLUint,  # num_events_in_wait_list 
                         a9: ptr TCLEvent,  # event_wait_list 
                         a10: ptr TCLEvent): TCLInt {.importc: "clEnqueueCopyImage", dynlib: cldll.}
  # event 
proc clEnqueueCopyImageToBuffer*(a2: TCLCommand_queue,  # command_queue 
                                 a3: TCLMem,  # src_image 
                                 a4: TCLMem,  # dst_buffer 
                                 a5: ptr TCLSize_t,  # src_origin[3] 
                                 a6: ptr TCLSize_t,  # region[3] 
                                 a7: TCLSize_t,  # dst_offset 
                                 a8: TCLUint,  # num_events_in_wait_list 
                                 a9: ptr TCLEvent,  # event_wait_list 
                                 a10: ptr TCLEvent): TCLInt {.importc: "clEnqueueCopyImageToBuffer", dynlib: cldll.}
  # event 
proc clEnqueueCopyBufferToImage*(a2: TCLCommand_queue,  # command_queue 
                                 a3: TCLMem,  # src_buffer 
                                 a4: TCLMem,  # dst_image 
                                 a5: TCLSize_t,  # src_offset 
                                 a6: ptr TCLSize_t,  # dst_origin[3] 
                                 a7: ptr TCLSize_t,  # region[3] 
                                 a8: TCLUint,  # num_events_in_wait_list 
                                 a9: ptr TCLEvent,  # event_wait_list 
                                 a10: ptr TCLEvent): TCLInt {.importc: "clEnqueueCopyBufferToImage", dynlib: cldll.}
  # event 
proc clEnqueueMapBuffer*(a2: TCLCommand_queue,  # command_queue 
                         a3: TCLMem,  # buffer 
                         a4: TCLBool,  # blocking_map 
                         a5: TCLMap_flags,  # map_flags 
                         a6: TCLSize_t,  # offset 
                         a7: TCLSize_t,  # cb 
                         a8: TCLUint,  # num_events_in_wait_list 
                         a9: ptr TCLEvent,  # event_wait_list 
                         a10: ptr TCLEvent,  # event 
                         a11: ptr TCLInt): pointer {.importc: "clEnqueueMapBuffer", dynlib: cldll.}
  # errcode_ret 
proc clEnqueueMapImage*(a2: TCLCommand_queue,  # command_queue 
                        a3: TCLMem,  # image 
                        a4: TCLBool,  # blocking_map 
                        a5: TCLMap_flags,  # map_flags 
                        a6: ptr TCLSize_t,  # origin[3] 
                        a7: ptr TCLSize_t,  # region[3] 
                        a8: ptr TCLSize_t,  # image_row_pitch 
                        a9: ptr TCLSize_t,  # image_slice_pitch 
                        a10: TCLUint,  # num_events_in_wait_list 
                        a11: ptr TCLEvent,  # event_wait_list 
                        a12: ptr TCLEvent,  # event 
                        a13: ptr TCLInt): pointer {.importc: "clEnqueueMapImage", dynlib: cldll.}
  # errcode_ret 
proc clEnqueueUnmapMemObject*(a2: TCLCommand_queue,  # command_queue 
                              a3: TCLMem,  # memobj 
                              a4: pointer, a5: TCLUint,  # 
                                                         # num_events_in_wait_list 
                              a6: ptr TCLEvent,  # event_wait_list 
                              a7: ptr TCLEvent): TCLInt {.importc: "clEnqueueUnmapMemObject", dynlib: cldll.}
  # event 
proc clEnqueueNDRangeKernel*(a2: TCLCommand_queue,  # command_queue 
                             a3: TCLKernel,  # kernel 
                             a4: TCLUint,  # work_dim 
                             a5: ptr TCLSize_t,  # global_work_offset 
                             a6: ptr TCLSize_t,  # global_work_size 
                             a7: ptr TCLSize_t,  # local_work_size 
                             a8: TCLUint,  # num_events_in_wait_list 
                             a9: ptr TCLEvent,  # event_wait_list 
                             a10: ptr TCLEvent): TCLInt {.importc: "clEnqueueNDRangeKernel", dynlib: cldll.}
  # event 
proc clEnqueueTask*(a2: TCLCommand_queue,  # command_queue 
                    a3: TCLKernel,  # kernel 
                    a4: TCLUint,  # num_events_in_wait_list 
                    a5: ptr TCLEvent,  # event_wait_list 
                    a6: ptr TCLEvent): TCLInt {.importc: "clEnqueueTask", dynlib: cldll.}
  # event 
#extern  TCLInt 
#clEnqueueNativeKernel(TCLCommand_queue  /* command_queue */,
#					  void (*user_func)(void *), 
#                      void *            /* args */,
#                      TCLSize_t            /* cb_args */, 
#                      TCLUint           /* num_mem_objects */,
#                      const cl_mem *    /* mem_list */,
#                      const void **     /* args_mem_loc */,
#                      TCLUint           /* num_events_in_wait_list */,
#                      const cl_event *  /* event_wait_list */,
#                      cl_event *        /* event */) ;
proc clEnqueueMarker*(a2: TCLCommand_queue,  # command_queue 
                      a3: ptr TCLEvent): TCLInt {.importc: "clEnqueueMarker", dynlib: cldll.}
  # event 
proc clEnqueueWaitForEvents*(a2: TCLCommand_queue,  # command_queue 
                             a3: TCLUint,  # num_events 
                             a4: ptr TCLEvent): TCLInt {.importc: "clEnqueueWaitForEvents", dynlib: cldll.}
  # event_list 
proc clEnqueueBarrier*(a2: TCLCommand_queue): TCLInt {.importc: "clEnqueueBarrier", dynlib: cldll.}
  # command_queue 
# Extension function access
# 
#  Returns the extension function address for the given function name,
#  or NULL if a valid function can not be found.  The client must
#  check to make sure the address is not NULL, before using or 
#  calling the returned function address.
# 
proc clGetExtensionFunctionAddress*(a2: cstring): pointer {.importc: "clGetExtensionFunctionAddress", dynlib: cldll.}