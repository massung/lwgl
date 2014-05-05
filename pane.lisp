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
  (:use :cl :capi :opengl)
  (:export
   #:opengl-pane
   #:opengl-pane-context

   ;; callbacks
   #:create-opengl-pane
   #:destroy-opengl-pane
   #:prepare-opengl-pane
   #:render-opengl-pane

   ;; utilities
   #:load-texture))

(in-package :opengl-pane)

(defclass opengl-pane (output-pane)
  ((render-callback
    :initarg :render-callback
    :initform 'render-opengl-pane
    :accessor opengl-pane-render-callback)
   (prepare-callback
    :initarg :prepare-callback
    :initform 'prepare-opengl-pane
    :accessor opengl-pane-prepare-callback)
   (context
    :initform nil
    :accessor opengl-pane-context))
  (:default-initargs
   :visible-border nil
   :create-callback 'create-opengl-pane
   :destroy-callback 'destroy-opengl-pane
   :display-callback 'display-opengl-pane))

(defmethod create-opengl-pane ((pane opengl-pane))
  "Create the render context."
  (setf (opengl-pane-context pane)
        #+cocoa (make-instance 'opengl-context::cocoa-opengl-context :pane pane)
        #+mswindows (make-instance 'opengl-context::win32-opengl-context :pane pane)))

(defmethod destroy-opengl-pane ((pane opengl-pane))
  "Free the render context."
  (opengl-context:opengl-context-release (opengl-pane-context pane)))

(defmethod display-opengl-pane ((pane opengl-pane) &rest bounds)
  "Prepare, render, and present."
  (declare (ignore bounds))
  (opengl-context:with-opengl-context (context (opengl-pane-context pane))
    (unwind-protect
        (progn
          (lw:when-let (prepare-callback (opengl-pane-prepare-callback pane))
            (funcall prepare-callback pane))
          (lw:when-let (render-callback (opengl-pane-render-callback pane))
            (funcall render-callback pane)))
      (gl-flush))))

(defmethod prepare-opengl-pane ((pane opengl-pane))
  "Set the clear color."
  (let ((w (gp:port-width pane))
        (h (gp:port-height pane)))
    (gl-clear-color 0 0 0 0)
    (gl-viewport 0 0 w h)))

(defmethod render-opengl-pane ((pane opengl-pane))
  "Clear the render context."
  (gl-clear +gl-color-buffer-bit+))
