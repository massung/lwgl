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

(defconstant +NSOpenGLPFADoubleBuffer+ 5)
(defconstant +NSOpenGLPFAColorSize+ 8)
(defconstant +NSOpenGLPFADepthSize+ 12)
(defconstant +NSOpenGLPFAStencilSize+ 13)
(defconstant +NSOpenGLPFAAccelerated+ 73)
(defconstant +NSOpenGLPFAWindow+ 80)
(defconstant +NSOpenGLPFAPixelBuffer+ 90)

(defmethod initialize-instance :after ((context cocoa-opengl-context) &key pane)
  "Create a new OpenGL context for Mac OS X."
  (with-dynamic-foreign-objects ((attribs :unsigned-int :initial-contents (list +NSOpenGLPFADoubleBuffer+
                                                                                +NSOpenGLPFAWindow+
                                                                                +NSOpenGLPFAAccelerated+
                                                                                +NSOpenGLPFAColorSize+ 32
                                                                                +NSOpenGLPFADepthSize+ 16
                                                                                +NSOpenGLPFAStencilSize+ 8
                                                                                0)))
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
  (let* ((rep (slot-value (opengl-context-pane context) 'capi-internals:representation))
         (view (slot-value rep 'capi-cocoa-library::main-view)))
    (when (objc:null-objc-pointer-p (objc:invoke (cocoa-opengl-context context) "view"))
      (objc:invoke (cocoa-opengl-context context) "setView:" view))
    (objc:invoke (cocoa-opengl-context context) "makeCurrentContext")))

(defmethod opengl-context-present ((context cocoa-opengl-context))
  "Swap the backbuffer and display what was rendered."
  (objc:invoke (cocoa-opengl-context context) "flushBuffer"))

(defmethod opengl-context-release ((context cocoa-opengl-context))
  "Release memory used by this context."
  (objc:release (cocoa-opengl-context context)))