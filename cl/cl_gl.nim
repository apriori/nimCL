#*********************************************************************************
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
# ********************************************************************************
# $Revision: 11708 $ on $Date: 2010-06-13 23:36:24 -0700 (Sun, 13 Jun 2010) $ 
#
#  cl_gl.h contains Khronos-approved (KHR) OpenCL extensions which have
#  OpenGL dependencies. The application is responsible for #including
#  OpenGL or OpenGL ES headers before #including cl_gl.h.
# 

import "cl/cl"
import "cl/cl_platform"

{.push callConv: stdcall.} 
{.deadCodeElim:on.}

when not(defined(OPENCL_CL_GL_H)): 
  const 
   OPENCL_CL_GL_H* = true
  when defined(APPLE): 
    nil
  else: 
    type 
      TCLGLObject{.pure, final.} = object
      PCLGLObject{.pure, final.} = ptr TCLGLObject
      TCLGL_object_type* = TCLUint
      TCLGL_texture_info* = TCLUint
      TCLGL_platform_info* = TCLUint
      TCLGLsync* = ptr TCLGLObject
    # cl_gl_object_type 
    const 
      CL_GL_OBJECT_BUFFER* = 0x00002000
      CL_GL_OBJECT_TEXTURE2D* = 0x00002001
      CL_GL_OBJECT_TEXTURE3D* = 0x00002002
      CL_GL_OBJECT_RENDERBUFFER* = 0x00002003
    # cl_gl_texture_info 
    const 
      CL_GL_TEXTURE_TARGET* = 0x00002004
      CL_GL_MIPMAP_LEVEL* = 0x00002005
    proc clCreateFromGLBuffer*(a2: TCLContext,  # context 
                               a3: TCLMem_flags,  # flags 
                               a4: cl_GLuint,  # bufobj 
                               a5: ptr cint): TCLMem {.importc: "clCreateFromGLBuffer", dynlib: cldll.}
      # errcode_ret 
    proc clCreateFromGLTexture2D*(a2: TCLContext,  # context 
                                  a3: TCLMem_flags,  # flags 
                                  a4: cl_GLenum,  # target 
                                  a5: cl_GLint,  # miplevel 
                                  a6: cl_GLuint,  # texture 
                                  a7: ptr TCLInt): TCLMem {.importc: "clCreateFromGLTexture2D", dynlib: cldll.}
      # errcode_ret 
    proc clCreateFromGLTexture3D*(a2: TCLContext,  # context 
                                  a3: TCLMem_flags,  # flags 
                                  a4: cl_GLenum,  # target 
                                  a5: cl_GLint,  # miplevel 
                                  a6: cl_GLuint,  # texture 
                                  a7: ptr TCLInt): TCLMem {.importc: "clCreateFromGLTexture3D", dynlib: cldll.}
      # errcode_ret 
    proc clCreateFromGLRenderbuffer*(a2: TCLContext,  # context 
                                     a3: TCLMem_flags,  # flags 
                                     a4: cl_GLuint,  # renderbuffer 
                                     a5: ptr TCLInt): TCLMem {.importc: "clCreateFromGLRenderbuffer", dynlib: cldll.}
      # errcode_ret 
    proc clGetGLObjectInfo*(a2: TCLMem,  # memobj 
                            a3: ptr TCLGL_object_type,  # gl_object_type 
                            a4: ptr cl_GLuint): TCLInt {.importc: "clGetGLObjectInfo", dynlib: cldll.}
      # gl_object_name 
    proc clGetGLTextureInfo*(a2: TCLMem,  # memobj 
                             a3: TCLGL_texture_info,  # param_name 
                             a4: TCLSize_t,  # param_value_size 
                             a5: pointer, 
                             a6: ptr TCLSize_t): TCLInt {.importc: "clGetGLTextureInfo", dynlib: cldll.}
      # param_value_size_ret 
    proc clEnqueueAcquireGLObjects*(a2: TCLCommand_queue,  # command_queue 
                                    a3: TCLUint,  # num_objects 
                                    a4: ptr TCLMem,  # mem_objects 
                                    a5: TCLUint,  # num_events_in_wait_list 
                                    a6: ptr TCLEvent,  # event_wait_list 
                                    a7: ptr TCLEvent): TCLInt {.importc: "clEnqueueAcquireGLObjects", dynlib: cldll.}
      # event 
    proc clEnqueueReleaseGLObjects*(a2: TCLCommand_queue,  # command_queue 
                                    a3: TCLUint,  # num_objects 
                                    a4: ptr TCLMem,  # mem_objects 
                                    a5: TCLUint,  # num_events_in_wait_list 
                                    a6: ptr TCLEvent,  # event_wait_list 
                                    a7: ptr TCLEvent): TCLInt {.importc: "clEnqueueReleaseGLObjects", dynlib: cldll.}
      # event 
    # cl_khr_gl_sharing extension  
    const 
      cl_khr_gl_sharing* = 1
    type 
      TCLGL_context_info* = TCLUint
    # Additional Error Codes  
    const 
      CL_INVALID_GL_SHAREGROUP_REFERENCE_KHR* = - 1000
    # cl_gl_context_info  
    const 
      CL_CURRENT_DEVICE_FOR_GL_CONTEXT_KHR* = 0x00002006
      CL_DEVICES_FOR_GL_CONTEXT_KHR* = 0x00002007
    # Additional cl_context_properties  
    const 
      CL_GL_CONTEXT_KHR* = 0x00002008
      CL_EGL_DISPLAY_KHR* = 0x00002009
      CL_GLX_DISPLAY_KHR* = 0x0000200A
      CL_WGL_HDC_KHR* = 0x0000200B
      CL_CGL_SHAREGROUP_KHR* = 0x0000200C
    proc clGetGLContextInfoKHR*(a2: ptr TCLContext_properties,  # properties 
                                a3: TCLGL_context_info,  # param_name 
                                a4: int,  # param_value_size 
                                a5: pointer, a6: ptr int): TCLInt {.importc: "clGetGLContextInfoKHR", dynlib: cldll.}
      # param_value_size_ret 
    type 
      clGetGLContextInfoKHR_fn* = proc (properties: ptr TCLContext_properties, 
                                        param_name: TCLGL_context_info, 
                                        param_value_size: int, 
                                        param_value: pointer, 
                                        param_value_size_ret: ptr int): TCLInt
