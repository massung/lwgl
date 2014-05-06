;;;; OpenGL FLI for LispWorks
;;;;
;;;; Copyright (c) 2013 by Jeffrey Massung
;;;;
;;;; This file is provided to you under the Apache License,
;;;; Version 2.0 (the "License"); you may not use this file
;;;; except in compliance with the License.  You may obtain
;;;; a copy of the License at
;;;;
;;;;    http://www.apache.org/licenses/LICENSE-2.0
;;;;
;;;; Unless required by applicable law or agreed to in writing,
;;;; software distributed under the License is distributed on an
;;;; "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
;;;; KIND, either express or implied.  See the License for the
;;;; specific language governing permissions and limitations
;;;; under the License.
;;;;

(in-package :opengl-context)

(defclass cocoa-opengl-context (opengl-context)
  ((obj :initform nil :accessor cocoa-opengl-context))
  (:documentation "MacOS X Cocoa OpenGL render context."))

(defconstant +NSOpenGLPFAAllRenderers+          1)
(defconstant +NSOpenGLPFATripleBuffer+          3)
(defconstant +NSOpenGLPFADoubleBuffer+          5)
(defconstant +NSOpenGLPFAStereo+                6)
(defconstant +NSOpenGLPFAAuxBuffers+            7)
(defconstant +NSOpenGLPFAColorSize+             8)
(defconstant +NSOpenGLPFAAlphaSize+             11)
(defconstant +NSOpenGLPFADepthSize+             12)
(defconstant +NSOpenGLPFAStencilSize+           13)
(defconstant +NSOpenGLPFAAccumSize+             14)
(defconstant +NSOpenGLPFAMinimumPolicy+         51)
(defconstant +NSOpenGLPFAMaximumPolicy+         52)
(defconstant +NSOpenGLPFAOffScreen+             53)
(defconstant +NSOpenGLPFAFullScreen+            54)
(defconstant +NSOpenGLPFASampleBuffers+         55)
(defconstant +NSOpenGLPFASamples+               56)
(defconstant +NSOpenGLPFAAuxDepthStencil+       57)
(defconstant +NSOpenGLPFAColorFloat+            58)
(defconstant +NSOpenGLPFAMultisample+           59)
(defconstant +NSOpenGLPFASupersample+           60)
(defconstant +NSOpenGLPFASampleAlpha+           61)
(defconstant +NSOpenGLPFARendererID+            70)
(defconstant +NSOpenGLPFASingleRenderer+        71)
(defconstant +NSOpenGLPFANoRecovery+            72)
(defconstant +NSOpenGLPFAAccelerated+           73)
(defconstant +NSOpenGLPFAClosestPolicy+         74)
(defconstant +NSOpenGLPFARobust+                75)
(defconstant +NSOpenGLPFABackingStore+          76)
(defconstant +NSOpenGLPFAMPSafe+                78)
(defconstant +NSOpenGLPFAWindow+                80)
(defconstant +NSOpenGLPFAMultiScreen+           81)
(defconstant +NSOpenGLPFACompliant+             83)
(defconstant +NSOpenGLPFAScreenMask+            84)
(defconstant +NSOpenGLPFAPixelBuffer+           90)
(defconstant +NSOpenGLPFARemotePixelBuffer+     91)
(defconstant +NSOpenGLPFAAllowOfflineRenderers+ 96)
(defconstant +NSOpenGLPFAAcceleratedCompute+    97)
(defconstant +NSOpenGLPFAOpenGLProfile+         99)
(defconstant +NSOpenGLPFAVirtualScreenCount+    128)

(defparameter *default-format-attribs*
  (list +NSOpenGLPFADoubleBuffer+
        +NSOpenGLPFAWindow+
        +NSOpenGLPFAAccelerated+
        +NSOpenGLPFAColorSize+ 32
        +NSOpenGLPFADepthSize+ 16
        +NSOpenGLPFAStencilSize+ 8
        +NSOpenGLPFAAccumSize+ 8
        0)
  "The default list of NSOpenGLPixelFormat attributes.")

(defmethod initialize-instance :after ((context cocoa-opengl-context) &key pane)
  "Create a new OpenGL context for Mac OS X."
  (with-dynamic-foreign-objects ((attribs :unsigned-int :initial-contents *default-format-attribs*))
    (let* ((format (objc:invoke (objc:invoke "NSOpenGLPixelFormat" "alloc") "initWithAttributes:" attribs))
           (nsobj (objc:invoke (objc:invoke "NSOpenGLContext" "alloc") "initWithFormat:shareContext:" format nil))
           (rep (slot-value pane 'capi-internals:representation))
           (view (slot-value rep 'capi-cocoa-library::main-view)))
      (setf (cocoa-opengl-context context) nsobj)

      ;; setup the context
      (objc:invoke nsobj "setView:" view)
      (objc:invoke nsobj "update")

      ;; the pixel format object is no longer needed
      (objc:release format))))

(defmethod opengl-context-prepare ((context cocoa-opengl-context))
  "Make this pane's context current."
  (when (objc:null-objc-pointer-p (objc:invoke (cocoa-opengl-context context) "view"))
    (let ((rep (slot-value (opengl-context-pane context) 'capi-internals:representation)))
      (objc:invoke (cocoa-opengl-context context) "setView:" (slot-value rep 'capi-cocoa-library::main-view))))
  (objc:invoke (cocoa-opengl-context context) "update")
  (objc:invoke (cocoa-opengl-context context) "makeCurrentContext"))

(defmethod opengl-context-present ((context cocoa-opengl-context))
  "Swap the backbuffer and display what was rendered."
  (objc:invoke (cocoa-opengl-context context) "flushBuffer"))

(defmethod opengl-context-release ((context cocoa-opengl-context))
  "Release memory used by this context."
  (objc:release (cocoa-opengl-context context)))