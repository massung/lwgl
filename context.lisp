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

(defpackage :opengl-context
  (:use :cl :lw :fli :capi)
  (:export
   #:with-opengl-context

   ;; context methods
   #:opengl-context-pane
   #:opengl-context-prepare
   #:opengl-context-present
   #:opengl-context-release))

(in-package :opengl-context)

(defmacro with-opengl-context ((var context &key (present t)) &body body)
  "Prepare, render, and present to a context."
  `(let ((,var ,context))
     (opengl-context-prepare ,var)
     (unwind-protect
         (progn ,@body)
       (when ,present
         (opengl-context-present ,var)))))

(defclass opengl-context ()
  ((pane :initarg :pane :reader opengl-context-pane))
  (:documentation "Platform-independent class for an OpenGL render context."))

(defgeneric opengl-context-prepare (context)
  (:documentation "Make a context current and prepare to render."))
(defgeneric opengl-context-present (context)
  (:documentation "Finish rendering and swap the back buffer."))
(defgeneric opengl-context-release (context)
  (:documentation "Free memory utilized by the render context."))