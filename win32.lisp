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

(defclass win32-opengl-context (opengl-context)
  ((hrc :initform nil :accessor win32-opengl-context))
  (:documentation "Win32 OpenGL render context."))

(define-c-typedef HGLRC :uintptr)
(define-c-typedef HWND :uintptr)
(define-c-typedef HDC :uintptr)
(define-c-typedef BOOL :boolean)

;;; pixel types
(defconstant +pfd-type-rgba+ #x00000000)

;;; layer types
(defconstant +pfd-main-plane+ #x00000000)

;;; pixel format flags
(defconstant +pfd-double-buffer+ #x00000001)
(defconstant +pfd-draw-to-window+ #x00000004)
(defconstant +pfd-support-opengl+ #x00000020)

;;; win32 pixel format
(define-c-struct pixel-format-descriptor
  (nSize :unsigned-short)
  (nVersion :unsigned-short)
  (dwFlags :unsigned-short)
  (iPixelType :unsigned-byte)
  (cColorBits :unsigned-byte) 
  (cRedBits :unsigned-byte) 
  (cRedShift :unsigned-byte) 
  (cGreenBits :unsigned-byte)
  (cGreenShift :unsigned-byte)
  (cBlueBits :unsigned-byte)
  (cBlueShift :unsigned-byte)
  (cAlphaBits :unsigned-byte)
  (cAlphaShift :unsigned-byte)
  (cAccumBits :unsigned-byte)
  (cAccumRedBits :unsigned-byte)
  (cAccumGreenBits :unsigned-byte)
  (cAccumBlueBits :unsigned-byte)
  (cAccumAlphaBits :unsigned-byte)
  (cDepthBits :unsigned-byte)
  (cStencilBits :unsigned-byte)
  (cAuxBuffers :unsigned-byte)
  (iLayerType :unsigned-byte)
  (bReserved :unsigned-byte)
  (dwLayerMask :unsigned-long)
  (dwVisibleMask :unsigned-long)
  (dwDamageMask :unsigned-long))

(define-foreign-function (get-dc "GetDC")
    ((hwnd HWND))
  :result-type HDC)

(define-foreign-function (release-dc "ReleaseDC")
    ((hwnd HWND) (hdc HDC))
  :result-type :int)

(define-foreign-function (choose-pixel-format "ChoosePixelFormat")
    ((hdc HDC) (pfd (:pointer pixel-format-descriptor)))
  :result-type :int)

(define-foreign-function (set-pixel-format "SetPixelFormat") 
    ((hdc HDC) (format :int) (pfd (:pointer pixel-format-descriptor)))
  :result-type :boolean)

(define-foreign-function (wgl-create-Context "wglCreateContext")
    ((hdc HDC))
  :result-type HGLRC)

(define-foreign-function (wgl-make-current "wglMakeCurrent")
    ((hdc HDC) (hglrc HGLRC))
  :result-type :boolean)

(define-foreign-function (wgl-delete-context "wglDeleteContext")
    ((hglrc HGLRC))
  :result-type :boolean)

(define-foreign-function (swap-buffers "SwapBuffers")
    ((hdc HDC))
  :result-type :boolean)

(defmethod initialize-instance :after ((context win32-opengl-context) &key pane)
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
            (foreign-slot-value pfd 'ccolorbits) 32
            (foreign-slot-value pfd 'cdepthbits) 16
            (foreign-slot-value pfd 'cstencilbits) 8
            (foreign-slot-value pfd 'caccumbits) 8)

      ;; set the pixel format for the device
      (let ((format (choose-pixel-format hdc pfd)))
        (when (set-pixel-format hdc format pfd)
          (setf (win32-opengl-context context) (wgl-create-context hdc)))))))

(defmethod opengl-context-prepare ((context win32-opengl-context))
  "Make this pane's context current."
  (when-let (hdc (get-dc (simple-pane-handle (opengl-context-pane context))))
    (unwind-protect
        (wgl-make-current hdc (win32-opengl-context context))
      (release-dc (simple-pane-handle (opengl-context-pane context)) hdc))))

(defmethod opengl-context-present ((context win32-opengl-context))
  "Swap the backbuffer and display what was rendered."
  (when-let (hdc (get-dc (simple-pane-handle (opengl-context-pane context))))
    (unwind-protect
        (swap-buffers hdc)
      (release-dc (simple-pane-handle (opengl-context-pane context)) hdc))))

(defmethod opengl-context-release ((context win32-opengl-context))
  "Free memory used by the context."
  (wgl-delete-context (win32-opengl-context context)))