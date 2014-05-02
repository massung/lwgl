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

(defpackage :opengl-pane
  (:use :cl :gl :capi)
  (:export
   #:opengl-pane
   #:opengl-pane-context))

(in-package :opengl-pane)

(defclass opengl-pane (output-pane)
  ((render-callback :initform 'render-opengl-pane :accessor opengl-pane-render-callback :initarg :render-callback)
   (context         :initform nil                 :accessor opengl-pane-context))
  (:default-initargs
   :draw-with-buffer t
   :drawing-mode :compatible
   :create-callback 'create-opengl-pane
   :destroy-callback 'destroy-opengl-pane
   :display-callback 'display-opengl-pane))

(defmethod create-opengl-pane ((pane opengl-pane))
  "Create the render context."
  (setf (opengl-pane-context pane) #+mswindows (opengl-win32:make-opengl-context pane)))

(defmethod destroy-opengl-pane ((pane opengl-pane))
  "Free the render context."
  #+mswindows (opengl-win32::wgl-delete-context (opengl-pane-context pane)))

(defmethod display-opengl-pane ((pane opengl-pane) &rest bounds)
  "Prepare, render, and present."
  (declare (ignore bounds))
  (when (opengl-pane-prepare pane)
    (unwind-protect
        (lw:when-let (render-callback (opengl-pane-render-callback pane))
          (funcall render-callback pane)
          (gl-flush))
      (opengl-pane-present pane))))

(defmethod render-opengl-pane ((pane opengl-pane))
  "Clear the render context."
  (gl-clear +gl_color_buffer_bit+))

(defmethod opengl-pane-prepare ((pane opengl-pane))
  "Make this pane's context current."
  (let ((ctx (opengl-pane-context pane)))
    #+mswindows (lw:when-let (hdc (opengl-win32::get-dc (simple-pane-handle pane)))
                  (unwind-protect
                      (opengl-win32::wgl-make-current hdc ctx)
                    (opengl-win32::release-dc (simple-pane-handle pane) hdc)))))

(defmethod opengl-pane-present ((pane opengl-pane))
  "Swap the backbuffer and display what was rendered."
  #+mswindows (lw:when-let (hdc (opengl-win32::get-dc (simple-pane-handle pane)))
                (unwind-protect
                    (opengl-win32::swap-buffers hdc)
                  (opengl-win32::release-dc (simple-pane-handle pane) hdc))))
