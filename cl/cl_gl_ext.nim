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
# cl_gl_ext.h contains vendor (non-KHR) OpenCL extensions which have           
# OpenGL dependencies.                                                         

import "cl/cl"
import "cl/cl_gl"
import "cl/cl_platform"
{.deadCodeElim:on.}

#
#  For each extension, follow this template
#  /* cl_VEN_extname extension  
# #define cl_VEN_extname 1
#  ... define new types, if any
#  ... define new tokens, if any
#  ... define new APIs, if any
# 
#   If you need GLtypes here, mirror them with a cl_GLtype, rather than including a GL header
#   This allows us to avoid having to decide whether to include GL headers or GLES here.
# 
# 
#   cl_khr_gl_event  extension
#   See section 9.9 in the OpenCL 1.1 spec for more information
# 
const 
  CL_COMMAND_GL_FENCE_SYNC_OBJECT_KHR* = 0x0000200D
proc clCreateEventFromGLsyncKHR*(a2: TCLContext,  # context 
                                 a3: TCLGLsync,  # cl_GLsync 
                                 a4: ptr TCLInt): TCLEvent {.importc: "clCreateEventFromGLsyncKHR", dynlib: cldll.}
  # errcode_ret 
