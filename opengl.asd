(defpackage :opengl-asd
  (:use :cl :asdf))

(in-package :opengl-asd)

(defsystem :opengl
  :name "opengl"
  :version "1.0"
  :author "Jeffrey Massung"
  :license "Apache 2.0"
  :description "OpenGL 2.0 FLI for LispWorks."
  :serial t
  :components ((:file "opengl")
               (:file "context")
               #+mswindows (:file "win32")
               #+cocoa (:file "cocoa")
               (:file "pane")))
