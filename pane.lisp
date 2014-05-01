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
  (:use :cl :gl :capi :fli)
  (:export
   #:opengl-pane
   #:opengl-pane-context))

(in-package :opengl-pane)

(defclass opengl-pane (output-pane)
  ((context :accessor opengl-pane-context :initform nil))
  (:default-initargs
   :create-callback 'create-opengl-pane))

(defmethod create-opengl-pane ((pane opengl-pane))
  "Create the render context."
  (setf (opengl-pane-context pane)
        #+mswindows (opengl-win32:make-opengl-context pane)))

