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
# $Revision: 11928 $ on $Date: 2010-07-13 09:04:56 -0700 (Tue, 13 Jul 2010) $ 
# cl_ext.h contains OpenCL extensions which don't have external 
# (OpenGL, D3D) dependencies.

import "cl/cl"
import "cl/cl_platform"
{.deadCodeElim:on.}

when defined(macosx): 
  nil
else: 
  # cl_khr_fp64 extension - no extension #define since it has no functions  
  nil
const 
  CL_DEVICE_DOUBLE_FP_CONFIG* = 0x00001032
# cl_khr_fp16 extension - no extension #define since it has no functions  
const 
  CL_DEVICE_HALF_FP_CONFIG* = 0x00001033
# Memory object destruction
# 
#  Apple extension for use to manage externally allocated buffers used with cl_mem objects with CL_MEM_USE_HOST_PTR
# 
#  Registers a user callback function that will be called when the memory object is deleted and its resources 
#  freed. Each call to clSetMemObjectCallbackFn registers the specified user callback function on a callback 
#  stack associated with memobj. The registered user callback functions are called in the reverse order in 
#  which they were registered. The user callback functions are called and then the memory object is deleted 
#  and its resources freed. This provides a mechanism for the application (and libraries) using memobj to be 
#  notified when the memory referenced by host_ptr, specified when the memory object is created and used as 
#  the storage bits for the memory object, can be reused or freed.
# 
#  The application may not call CL api's with the cl_mem object passed to the pfn_notify.
# 
#  Please check for the "cl_APPLE_SetMemObjectDestructor" extension using clGetDeviceInfo(CL_DEVICE_EXTENSIONS)
#  before using.
# 
const 
  cl_APPLE_SetMemObjectDestructor* = 1
#
#TCLint	 clSetMemObjectDestructorAPPLE(cl_mem memobj, 
#                                        void (* pfn_notify)( cl_mem  memobj, void* user_data), 
#                                        void * user_data )             ;  
#
# Context Logging Functions
# 
#  The next three convenience functions are intended to be used as the pfn_notify parameter to clCreateContext().
#  Please check for the "cl_APPLE_ContextLoggingFunctions" extension using clGetDeviceInfo(CL_DEVICE_EXTENSIONS)
#  before using.
# 
#  clLogMessagesToSystemLog fowards on all log messages to the Apple System Logger 
# 
const 
  cl_APPLE_ContextLoggingFunctions* = 1
proc clLogMessagesToSystemLogAPPLE*(a2: cstring, a3: pointer, a4: TCLsize_t,  # cb 
                                    a5: pointer) {.importc: "clLogMessagesToSystemLogAPPLE", dynlib: cldll.}
# clLogMessagesToStdout sends all log messages to the file descriptor stdout 
proc clLogMessagesToStdoutAPPLE*(a2: cstring, a3: pointer, a4: TCLsize_t,  # cb 
                                 a5: pointer) {.importc: "clLogMessagesToStdoutAPPLE", dynlib: cldll.}
# clLogMessagesToStderr sends all log messages to the file descriptor stderr 
proc clLogMessagesToStderrAPPLE*(a2: cstring, a3: pointer, a4: TCLsize_t,  # cb 
                                 a5: pointer) {.importc: "clLogMessagesToStderrAPPLE", dynlib: cldll.}
#*********************** 
# cl_khr_icd extension *                                                  
#**********************
const 
  cl_khr_icd* = 1
# cl_platform_info                                                        
const 
  CL_PLATFORM_ICD_SUFFIX_KHR* = 0x00000920
# Additional Error Codes                                                  
const 
  CL_PLATFORM_NOT_FOUND_KHR* = - 1001
proc clIcdGetPlatformIDsKHR*(a2: TCLuint,  # num_entries 
                             a3: ptr TCLPlatform_id,  # platforms 
                             a4: ptr TCLuint): TCLint {.importc: "clIcdGetPlatformIDsKHR", dynlib: cldll.}
  # num_platforms 
type 
  TCLDevice_partition_property_ext* = TCLulong
  clIcdGetPlatformIDsKHR_fn* = proc (a2: TCLuint,  # num_entries 
                                     a3: ptr TCLPlatform_id,  # platforms 
                                     a4: ptr TCLuint): TCLuint # num_platforms 
#*****************************************
# cl_nv_device_attribute_query extension *
#****************************************
# cl_nv_device_attribute_query extension - no extension #define since it has no functions 
const 
  CL_DEVICE_COMPUTE_CAPABILITY_MAJOR_NV* = 0x00004000
  CL_DEVICE_COMPUTE_CAPABILITY_MINOR_NV* = 0x00004001
  CL_DEVICE_REGISTERS_PER_BLOCK_NV* = 0x00004002
  CL_DEVICE_WARP_SIZE_NV* = 0x00004003
  CL_DEVICE_GPU_OVERLAP_NV* = 0x00004004
  CL_DEVICE_KERNEL_EXEC_TIMEOUT_NV* = 0x00004005
  CL_DEVICE_INTEGRATED_MEMORY_NV* = 0x00004006
#********************************
# cl_amd_device_attribute_query *
#*******************************
const 
  CL_DEVICE_PROFILING_TIMER_OFFSET_AMD* = 0x00004036
when defined(CL_VERSION_1_1): 
  #**********************************
  #     cl_ext_device_fission extension *
  #    *********************************
  const 
    cl_ext_device_fission* = 1
  proc clReleaseDeviceEXT*(a2: TCLDevice_id): TCLint {.importc: "clIcdGetPlatformIDsKHR", dynlib: cldll.}
    #device
  type 
    clReleaseDeviceEXT_fn* = proc (a2: TCLDevice_id): TCLint #device
  proc clRetainDeviceEXT*(a2: TCLDevice_id): TCLint {.importc: "clRetainDeviceEXT", dynlib: cldll.}
    #device
  type 
    clRetainDeviceEXT_fn* = proc (a2: TCLDevice_id): TCLint #device
    cl_device_partition_property_ext* = TCLulong
  proc clCreateSubDevicesEXT*(a2: TCLDevice_id,  #in_device
                              a3: ptr cl_device_partition_property_ext,  # 
                                                                         # properties 
                              a4: TCLuint,  #num_entries
                              a5: ptr TCLDevice_id,  #out_devices
                              a6: ptr TCLuint): TCLint {.importc: "clCreateSubDevicesEXT", dynlib: cldll.}
    #num_devices
  type 
    clCreateSubDevicesEXT_fn* = proc (a2: TCLDevice_id,  #in_device
                                      a3: ptr TCLDevice_partition_property_ext,  # 
                                                                                 # properties 
                                      a4: TCLuint,  #num_entries
                                      a5: ptr TCLDevice_id,  #out_devices
                                      a6: ptr TCLuint): TCLint #num_devices 
  # cl_device_partition_property_ext 
  const 
    CL_DEVICE_PARTITION_EQUALLY_EXT* = 0x00004050
    CL_DEVICE_PARTITION_BY_COUNTS_EXT* = 0x00004051
    CL_DEVICE_PARTITION_BY_NAMES_EXT* = 0x00004052
    CL_DEVICE_PARTITION_BY_AFFINITY_DOMAIN_EXT* = 0x00004053
  # clDeviceGetInfo selectors 
  const 
    CL_DEVICE_PARENT_DEVICE_EXT* = 0x00004054
    CL_DEVICE_PARTITION_TYPES_EXT* = 0x00004055
    CL_DEVICE_AFFINITY_DOMAINS_EXT* = 0x00004056
    CL_DEVICE_REFERENCE_COUNT_EXT* = 0x00004057
    CL_DEVICE_PARTITION_STYLE_EXT* = 0x00004058
  # error codes 
  const 
    CL_DEVICE_PARTITION_FAILED_EXT* = - 1057
    CL_INVALID_PARTITION_COUNT_EXT* = - 1058
    CL_INVALID_PARTITION_NAME_EXT* = - 1059
  # CL_AFFINITY_DOMAINs 
  const 
    CL_AFFINITY_DOMAIN_L1_CACHE_EXT* = 0x00000001
    CL_AFFINITY_DOMAIN_L2_CACHE_EXT* = 0x00000002
    CL_AFFINITY_DOMAIN_L3_CACHE_EXT* = 0x00000003
    CL_AFFINITY_DOMAIN_L4_CACHE_EXT* = 0x00000004
    CL_AFFINITY_DOMAIN_NUMA_EXT* = 0x00000010
    CL_AFFINITY_DOMAIN_NEXT_FISSIONABLE_EXT* = 0x00000100
  # cl_device_partition_property_ext list terminators 
  const 
    CL_PROPERTIES_LIST_END_EXT* = cast[(cl_device_partition_property_ext)](0)
    CL_PARTITION_BY_COUNTS_LIST_END_EXT* = cast[(
        cl_device_partition_property_ext)](0)
  ##define CL_PARTITION_BY_NAMES_LIST_END_EXT          ((cl_device_partition_property_ext) 0 - 1)