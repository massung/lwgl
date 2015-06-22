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

(defpackage :opengl-texture
  (:use :cl :fli :opengl :opengl-context :opengl-pane)
  (:export
   #:opengl-texture-handle
   #:opengl-texture-width
   #:opengl-texture-height
   #:opengl-texture-org-width
   #:opengl-texture-org-height

   ;; texture functions
   #:make-texture
   #:load-texture
   #:free-texture
   #:bind-texture))

(in-package :opengl-texture)

(defclass opengl-texture ()
  ((handle     :initarg :handle     :reader opengl-texture-handle)
   (width      :initarg :width      :reader opengl-texture-width)
   (height     :initarg :height     :reader opengl-texture-height)
   (org-width  :initarg :org-width  :reader opengl-texture-org-width)
   (org-height :initarg :org-height :reader opengl-texture-org-height))
  (:documentation "An object representing an OpenGL texture resource for a specific context."))

(defun make-texture (pixel-data width height &key (level 0) (min-filter +gl-linear+) (mag-filter +gl-linear+))
  "Load an image and create an OpenGL texture resource."
  (let ((w (expt 2 (ceiling (log width 2))))
        (h (expt 2 (ceiling (log height 2)))))

    ;; allocate the pixel buffer for the texture and a handle for it
    (with-dynamic-foreign-objects ((buf :unsigned-byte :nelems (* w h 4))
                                   (tex :unsigned-int))

      ;; fill out the pixel data buffer with the callback function
      (dotimes (y height)
        (dotimes (x width)
          (destructuring-bind (r g b &optional (a 255))
              (funcall pixel-data x y)
            (setf (dereference buf :index (+ (* y w 4) (* x 4) 0)) r
                  (dereference buf :index (+ (* y w 4) (* x 4) 1)) g
                  (dereference buf :index (+ (* y w 4) (* x 4) 2)) b
                  (dereference buf :index (+ (* y w 4) (* x 4) 3)) a))))
      
      ;; create the texture resource
      (gl-gen-textures 1 tex)

      ;; bind the texture to what will be created
      (gl-bind-texture +gl-texture-2d+ (dereference tex))

      ;; pixel format options
      (gl-pixel-storei +gl-unpack-alignment+ 1)

      ;; texture parameters
      (gl-tex-parameteri +gl-texture-2d+ +gl-texture-min-filter+ min-filter)
      (gl-tex-parameteri +gl-texture-2d+ +gl-texture-mag-filter+ mag-filter)
          
      ;; copy the pixel data into the texture
      (gl-tex-image2d +gl-texture-2d+ level +gl-rgba+ w h 0 +gl-rgba+ +gl-unsigned-byte+ buf)
      
      ;; create the opengl texture resource
      (make-instance 'opengl-texture
                     :org-width width
                     :org-height height
                     :width w
                     :height h
                     :handle (dereference tex)))))

(defun load-texture (pane image &rest texture-args &key &allow-other-keys)
  "Load an image, then create a texture for it."
  (lw:when-let (image (gp:load-image pane image :editable :with-alpha))
    (let ((access (gp:make-image-access pane image)))
      (gp:image-access-transfer-from-image access)

      ;; pixel data generator function
      (flet ((pixel-data (x y)
               (let ((c (color:unconvert-color pane (gp:image-access-pixel access x y))))
                 (list (truncate (* (color:color-red c) 255))
                       (truncate (* (color:color-green c) 255))
                       (truncate (* (color:color-blue c) 255))
                       (truncate (* (color:color-alpha c) 255))))))

        ;; create the texture
        (let ((w (gp:image-access-width access))
              (h (gp:image-access-height access)))
          (apply #'make-texture #'pixel-data w h texture-args))))))

(defun free-texture (texture)
  "Release the memory used by a texture."
  (with-slots (handle)
      texture
    (with-dynamic-foreign-objects ((tex :unsigned-int :initial-element handle))
      (gl-delete-textures 1 tex))
    (setf texture 0)))

(defun bind-texture (texture)
  "Make this texture the actively bound texture."
  (unless (gl-is-enabled +gl-texture-2d+)
    (gl-enable +gl-texture-2d+))
  (gl-bind-texture +gl-texture-2d+ (opengl-texture-handle texture)))
