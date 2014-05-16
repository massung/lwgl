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

(eval-when (:compile-toplevel :load-toplevel :execute)
  (use-package :capi)
  (use-package :opengl)
  (use-package :opengl-pane)
  (use-package :opengl-texture))

(eval-when (:compile-toplevel :load-toplevel)
  (defparameter *logo-pathname* (merge-pathnames #p"logo.png" *compile-file-pathname*)))

(defclass sample-opengl-pane (opengl-pane)
  ((angle :initform 0)
   (logo  :initform nil)
   (timer :initform nil)
   (time  :initform nil))
  (:default-initargs
   :prepare-callback 'prepare-sample-pane
   :release-callback 'release-sample-pane
   :render-callback 'render-sample-pane))

(defmethod prepare-sample-pane ((pane sample-opengl-pane))
  "Load the Lisp logo into a texture."
  (with-slots (logo timer time)
      pane
    (setf logo (load-texture pane *logo-pathname*)
          timer (mp:make-timer 'spin-sample-pane pane)
          time (get-internal-real-time))

    ;; start up a periodic timer
    (mp:schedule-timer timer 1/60 1/60)))

(defmethod release-sample-pane ((pane sample-opengl-pane))
  "Free the logo texture."
  (with-slots (logo timer)
      pane
    (free-texture pane logo)
    (mp:unschedule-timer timer)))

(defmethod spin-sample-pane ((pane sample-opengl-pane))
  "Spin the logo counter-clockwise."
  (with-slots (angle time)
      pane
    (let ((now (get-internal-real-time)))
      (incf angle (* 180.0 (/ (- now time) internal-time-units-per-second)))
      (setf time now)))
  (post-redisplay pane))

(defmethod render-sample-pane ((pane sample-opengl-pane))
  "Render the logo to the viewport."
  (with-slots (logo angle)
      pane
    (let* ((i (opengl-texture-image logo))
           (w (gp:image-width i))
           (h (gp:image-height i))
           (u (/ w (opengl-texture-width logo)))
           (v (/ h (opengl-texture-height logo)))
           (a (/ w h)))
    (gl-clear-color 0.3 0.1 0.6 0)
    (gl-clear +gl-color-buffer-bit+)
    (gl-enable +gl-texture-2d+)
    (gl-enable +gl-blend+)
    (gl-blend-func +gl-src-alpha+ +gl-one-minus-src-alpha+)
    (gl-matrix-mode +gl-modelview+)
    (gl-load-identity)
    (gl-rotatef angle 0 0 1)
    (gl-bind-texture +gl-texture-2d+ (opengl-texture logo))
    (gl-begin +gl-quads+)
    (gl-tex-coord2f 0 0)
    (gl-vertex2f -0.5 (/ 0.5 a))
    (gl-tex-coord2f u 0)
    (gl-vertex2f 0.5 (/ 0.5 a))
    (gl-tex-coord2f u v)
    (gl-vertex2f 0.5 (/ -0.5 a))
    (gl-tex-coord2f 0 v)
    (gl-vertex2f -0.5 (/ -0.5 a))
    (gl-end))))
