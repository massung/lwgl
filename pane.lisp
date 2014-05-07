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
  (:use :cl :lw :capi :mp :opengl :opengl-context)
  (:export
   #:opengl-pane
   #:opengl-pane-context
   #:opengl-pane-prepare-callback
   #:opengl-pane-render-callback
   #:opengl-pane-reshape-callback

   ;; generic callback methods
   #:create-opengl-pane
   #:destroy-opengl-pane
   #:resize-opengl-pane
   #:display-opengl-pane

   ;; methods
   #:post-redisplay))

(in-package :opengl-pane)

(defclass opengl-pane (output-pane)
  ((context
    :initform nil
    :accessor opengl-pane-context)
   (prepare-callback
    :initarg :prepare-callback
    :initform 'prepare-opengl-pane
    :accessor opengl-pane-prepare-callback)
   (release-callback
    :initarg :release-callback
    :initform nil
    :accessor opengl-pane-release-callback)
   (render-callback
    :initarg :render-callback
    :initform 'render-opengl-pane
    :accessor opengl-pane-render-callback)
   (reshape-callback
    :initarg :reshape-callback
    :initform 'reshape-opengl-pane
    :accessor opengl-pane-reshape-callback))
  (:default-initargs
   :visible-border nil
   :draw-with-buffer nil
   :create-callback 'create-opengl-pane
   :destroy-callback 'destroy-opengl-pane
   :resize-callback 'resize-opengl-pane
   :display-callback 'display-opengl-pane))

(defgeneric create-opengl-pane (pane)
  (:documentation "Creates the render context and any additional setup.")
  (:method-combination progn :most-specific-last))
(defgeneric destroy-opengl-pane (pane)
  (:documentation "Frees any resources and the render context.")
  (:method-combination progn :most-specific-first))
(defgeneric resize-opengl-pane (pane x y width height)
  (:documentation "Reshapes the render context.")
  (:method-combination progn :most-specific-first))
(defgeneric display-opengl-pane (pane x y width height)
  (:documentation "Prepares, renders, and presents the render context.")
  (:method-combination progn :most-specific-last))

(defmethod create-opengl-pane progn ((pane opengl-pane))
  "Create the render context for this pane."
  (when-let* ((context (setf (opengl-pane-context pane)
                             #+cocoa (make-instance 'opengl-context::cocoa-opengl-context :pane pane)
                             #+mswindows (make-instance 'opengl-context::win32-opengl-context :pane pane)))
              (prepare-callback (opengl-pane-prepare-callback pane)))
    (with-opengl-context (c context :present nil)
      (funcall prepare-callback pane))))

(defmethod destroy-opengl-pane progn ((pane opengl-pane))
  "Free the render context and any timer process."
  (when-let (release-callback (opengl-pane-release-callback pane))
    (with-opengl-context (c (opengl-pane-context pane) :present nil)
      (funcall release-callback pane)))
  (opengl-context-release (opengl-pane-context pane))

  ;; clear the context so that with-opengl-context bodies will fail to execute
  (setf (opengl-pane-context pane) nil))

(defmethod resize-opengl-pane progn ((pane opengl-pane) x y width height)
  "Reshapes the render context."
  (declare (ignore x y))
  (when-let (reshape-callback (opengl-pane-reshape-callback pane))
    (with-opengl-context (c (opengl-pane-context pane) :present nil)
      (funcall reshape-callback pane width height)))
  (post-redisplay pane))

(defmethod display-opengl-pane progn ((pane opengl-pane) x y width height)
  "Prepare, render, and present."
  (declare (ignore x y width height))
  (with-opengl-context (context (opengl-pane-context pane))
    (unwind-protect
        (when-let (render-callback (opengl-pane-render-callback pane))
          (funcall render-callback pane))
      (gl-flush))))

(defmethod reshape-opengl-pane ((pane opengl-pane) width height)
  "Update the viewport size for the render context."
  (gl-viewport 0 0 width height))

(defmethod prepare-opengl-pane ((pane opengl-pane))
  "Set the clear color."
  (gl-clear-color 0 0 0 0))

(defmethod render-opengl-pane ((pane opengl-pane))
  "Clear the render context."
  (gl-clear +gl-color-buffer-bit+))

(defmethod post-redisplay ((pane opengl-pane))
  "Signals that the pane should redraw."
  (apply-in-pane-process pane #'display-opengl-pane pane 0 0 0 0))