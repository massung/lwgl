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

(defpackage :opengl-glut-pane
  (:use :cl :lw :mp :capi :opengl :opengl-context :opengl-pane)
  (:export
   #:glut-pane
   #:glut-pane-timer-delay
   #:glut-pane-timer-callback
   #:glut-pane-keyboard-callback
   #:glut-pane-mouse-callback
   #:glut-pane-motion-callback))

(in-package :opengl-glut-pane)

(defclass glut-pane (opengl-pane)
  ((keyboard-callback :initform nil :initarg :keyboard-callback :accessor glut-pane-keyboard-callback)
   (mouse-callback    :initform nil :initarg :mouse-callback    :accessor glut-pane-mouse-callback)
   (motion-callback   :initform nil :initarg :motion-callback   :accessor glut-pane-motion-callback)
   (timer-callback    :initform nil :initarg :timer-callback    :accessor glut-pane-timer-callback)
   (timer-delay       :initform nil :initarg :timer-delay       :reader   glut-pane-timer-delay)
   (timer-last        :initform nil)
   (timer             :initform nil))
  (:default-initargs
   :input-model '(((:motion)            glut-pane-motion)
                  ((:button-1 :press)   glut-pane-button-1-press)
                  ((:button-2 :press)   glut-pane-button-2-press)
                  ((:button-3 :press)   glut-pane-button-3-press)
                  ((:button-1 :release) glut-pane-button-1-release)
                  ((:button-2 :release) glut-pane-button-2-release)
                  ((:button-3 :release) glut-pane-button-3-release)
                  ((:key :press)        glut-pane-key-press)
                  ((:key :release)      glut-pane-key-release))))

(defmethod create-opengl-pane progn ((pane glut-pane))
  "Create the timer if there is one to be created."
  (with-slots (timer timer-delay timer-last)
      pane
    (setf timer-last (get-internal-real-time)
          timer (make-timer 'glut-pane-timer pane))

    ;; if there's a delay then start the timer
    (when timer-delay
      (schedule-timer-relative timer timer-delay timer-delay))))

(defmethod destroy-opengl-pane progn ((pane glut-pane))
  "Stop the periodic timer."
  (unschedule-timer (slot-value pane 'timer)))

(defmethod (setf glut-pane-timer-delay) (delay (pane glut-pane))
  "Change the rate at which the timer is called."
  (with-slots (timer timer-last)
      pane
    (if (sys:atomic-exchange (slot-value pane 'timer-delay) delay)
        (if (null delay)
            (unschedule-timer timer)
          (schedule-timer-relative timer nil delay))
      (when delay
        (setf timer-last (get-internal-real-time))
        (schedule-timer-relative timer delay delay)))))

(defmethod glut-pane-timer ((pane glut-pane))
  "Periodically call the timer-callback."
  (with-slots (timer-last timer-callback)
      pane
    (let ((now (get-internal-real-time)))
      (when timer-callback
        (funcall timer-callback pane (/ (- now timer-last) internal-time-units-per-second)))
      (setf timer-last now))))

(defmethod glut-pane-motion ((pane glut-pane) x y)
  "Called whenever the mouse moves."
  (when-let (motion-callback (glut-pane-motion-callback pane))
    (funcall motion-callback pane x y)))

(defmethod glut-pane-button-1-press ((pane glut-pane) x y)
  "Called whenever the left mouse button is pressed."
  (when-let (mouse-callback (glut-pane-mouse-callback pane))
    (funcall mouse-callback pane :left t x y)))

(defmethod glut-pane-button-2-press ((pane glut-pane) x y)
  "Called whenever the left mouse button is pressed."
  (when-let (mouse-callback (glut-pane-mouse-callback pane))
    (funcall mouse-callback pane :middle t x y)))

(defmethod glut-pane-button-3-press ((pane glut-pane) x y)
  "Called whenever the left mouse button is pressed."
  (when-let (mouse-callback (glut-pane-mouse-callback pane))
    (funcall mouse-callback pane :right t x y)))

(defmethod glut-pane-button-1-release ((pane glut-pane) x y)
  "Called whenever the left mouse button is released."
  (when-let (mouse-callback (glut-pane-mouse-callback pane))
    (funcall mouse-callback pane :left nil x y)))

(defmethod glut-pane-button-2-release ((pane glut-pane) x y)
  "Called whenever the left mouse button is released."
  (when-let (mouse-callback (glut-pane-mouse-callback pane))
    (funcall mouse-callback pane :middle nil x y)))

(defmethod glut-pane-button-3-release ((pane glut-pane) x y)
  "Called whenever the left mouse button is released."
  (when-let (mouse-callback (glut-pane-mouse-callback pane))
    (funcall mouse-callback pane :right nil x y)))

(defmethod glut-pane-key-press ((pane glut-pane) x y gspec)
  "Called whenevera key is pressed."
  (when-let (keyboard-callback (glut-pane-keyboard-callback pane))
    (funcall keyboard-callback pane gspec t x y)))

(defmethod glut-pane-key-release ((pane glut-pane) x y gspec)
  "Called whenever a key is released."
  (when-let (keyboard-callback (glut-pane-keyboard-callback pane))
    (funcall keyboard-callback pane gspec nil x y)))


