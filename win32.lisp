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

(defpackage :opengl-win32
  (:use :cl :fli :opengl-context)
  (:export
   #:make-opengl-context
   #:present-opengl-context))

(in-package :opengl-win32)

(define-c-typedef HANDLE :unsigned-long)
(define-c-typedef HDC :unsigned-long)
(define-c-typedef BOOL :boolean)
(define-c-typedef WORD :unsigned-short)
(define-c-typedef DWORD :unsigned-long)

(defun make-opengl-context (pane &key (color-bits 24) (depth-bits 16))
  "Use the HDC of an output-pane to create an OpenGL context."
  (let* ((rep (gp:port-representation pane))
         (hdc (slot-value rep 'capi-win32-lib::hdc)))
    (with-dynamic-foreign-objects ((pfd pixel-format-descriptor))

      ;; setup the pixel format descriptor
      (setf (foreign-slot-value pfd 'nsize) (size-of 'pixel-format-descriptor)
            (foreign-slot-value pfd 'nversion) 1
            (foreign-slot-value pfd 'ipixeltype) 0
            (foreign-slot-value pfd 'ilayertype) 0
            (foreign-slot-value pfd 'dwflags) 37
            (foreign-slot-value pfd 'ccolorbits) color-bits
            (foreign-slot-value pfd 'cdepthbits) depth-bits)

      ;; set the pixel format for the device
      (let ((format (choose-pixel-format hdc pfd)))
        (when (set-pixel-format hdc format pfd)
          (make-instance 'win32-opengl-context :hglrc (wgl-create-context hdc)))))))

(defun present-opengl-context (pane)
  "Swap the backbuffer and display what was rendered."
  (let* ((rep (gp:port-representation pane))
         (hdc (slot-value rep 'capi-win32-lib::hdc)))
    (swap-buffers hdc)))

(defclass win32-opengl-context (opengl-context::opengl-context)
  ((hglrc :initarg :hglrc :reader win32-opengl-context-hglrc))
  (:documentation "Win32 OpenGL render context handle."))

(defmethod opengl-context:prepare-context ((context win32-opengl-context) pane)
  "Make this context the current render context."
  (let ((hrc (win32-opengl-context-hglrc context)))
    (when hrc
      (let* ((rep (gp:port-representation pane))
             (hdc (slot-value rep 'capi-win32-lib::hdc)))
        (wgl-make-current hdc hrc)))))

;;; pixel types
(defconstant +PFD_TYPE_RGBA+ #x00000000)

;;; layer types
(defconstant +PFD_MAIN_PLANE+ #x00000000)

;;; pixel format flags
(defconstant +PFD_DOUBLE_BUFFER+ #x00000001)
(defconstant +PFD_DRAW_TO_WINDOW+ #x00000004)
(defconstant +PFD_SUPPORT_OPENGL+ #x00000020)

;;; win32 pixel format
(define-c-struct pixel-format-descriptor
  (nSize WORD)
  (nVersion WORD)
  (dwFlags WORD)
  (iPixelType BYTE)
  (cColorBits BYTE) 
  (cRedBits BYTE) 
  (cRedShift BYTE) 
  (cGreenBits BYTE) 
  (cGreenShift BYTE) 
  (cBlueBits BYTE) 
  (cBlueShift BYTE) 
  (cAlphaBits BYTE) 
  (cAlphaShift BYTE) 
  (cAccumBits BYTE) 
  (cAccumRedBits BYTE) 
  (cAccumGreenBits BYTE) 
  (cAccumBlueBits BYTE) 
  (cAccumAlphaBits BYTE) 
  (cDepthBits BYTE) 
  (cStencilBits BYTE) 
  (cAuxBuffers BYTE) 
  (iLayerType BYTE) 
  (bReserved BYTE) 
  (dwLayerMask DWORD) 
  (dwVisibleMask DWORD) 
  (dwDamageMask DWORD))

(define-foreign-function (choose-pixel-format "ChoosePixelFormat")
    ((hdc HDC) (pfd (:pointer pixel-format-descriptor)))
  :result-type :int)

(define-foreign-function (set-pixel-format "SetPixelFormat") 
    ((hdc HDC) (format :int) (pfd (:pointer pixel-format-descriptor)))
  :result-type BOOL)

(define-foreign-function (wgl-Create-Context "wglCreateContext")
    ((hdc HDC))
  :result-type HANDLE)

(define-foreign-function (wgl-make-current "wglMakeCurrent")
    ((hdc HDC) (hglrc HANDLE))
  :result-type BOOL)

(define-foreign-function (wgl-delete-context "wglDeleteContext")
    ((hglrc HANDLE))
  :result-type BOOL)

(define-foreign-function (swap-buffers "SwapBuffers")
    ((hdc HDC))
  :result-type BOOL)