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

(defpackage :opengl
  (:use :cl :lw :fli)
  (:nicknames :gl)
  (:export
   #:gl-accum
   #:gl-active-texture
   #:gl-alpha-func
   #:gl-are-textures-resident
   #:gl-array-element
   #:gl-attach-shader
   #:gl-begin
   #:gl-begin-query
   #:gl-bind-attrib-location
   #:gl-bind-buffer
   #:gl-bind-texture
   #:gl-bitmap
   #:gl-blend-color
   #:gl-blend-equation
   #:gl-blend-equation-separate
   #:gl-blend-func
   #:gl-blend-func-separate
   #:gl-buffer-data
   #:gl-buffer-sub-data
   #:gl-call-list
   #:gl-call-lists
   #:gl-clear
   #:gl-clear-accum
   #:gl-clear-color
   #:gl-clear-depth
   #:gl-clear-index
   #:gl-clear-stencil
   #:gl-client-active-texture
   #:gl-clip-plane
   #:gl-color-mask
   #:gl-color-material
   #:gl-color-pointer
   #:gl-color-sub-table
   #:gl-color-table
   #:gl-color-table-parameterfv
   #:gl-color-table-parameteriv
   #:gl-color3b
   #:gl-color3bv
   #:gl-color3d
   #:gl-color3dv
   #:gl-color3f
   #:gl-color3fv
   #:gl-color3i
   #:gl-color3iv
   #:gl-color3s
   #:gl-color3sv
   #:gl-color3ub
   #:gl-color3ubv
   #:gl-color3ui
   #:gl-color3uiv
   #:gl-color3us
   #:gl-color3usv
   #:gl-color4b
   #:gl-color4bv
   #:gl-color4d
   #:gl-color4dv
   #:gl-color4f
   #:gl-color4fv
   #:gl-color4i
   #:gl-color4iv
   #:gl-color4s
   #:gl-color4sv
   #:gl-color4ub
   #:gl-color4ubv
   #:gl-color4ui
   #:gl-color4uiv
   #:gl-color4us
   #:gl-color4usv
   #:gl-compile-shader
   #:gl-compressed-tex-image1-D
   #:gl-compressed-tex-image2-D
   #:gl-compressed-tex-image3-D
   #:gl-compressed-tex-sub-image1-D
   #:gl-compressed-tex-sub-image2-D
   #:gl-compressed-tex-sub-image3-D
   #:gl-convolution-filter1-D
   #:gl-convolution-filter2-D
   #:gl-convolution-parameterf
   #:gl-convolution-parameterfv
   #:gl-convolution-parameteri
   #:gl-convolution-parameteriv
   #:gl-copy-color-sub-table
   #:gl-copy-color-table
   #:gl-copy-convolution-filter1-D
   #:gl-copy-convolution-filter2-D
   #:gl-copy-pixels
   #:gl-copy-tex-image1-D
   #:gl-copy-tex-image2-D
   #:gl-copy-tex-sub-image1-D
   #:gl-copy-tex-sub-image2-D
   #:gl-copy-tex-sub-image3-D
   #:gl-create-program
   #:gl-create-shader
   #:gl-cull-face
   #:gl-delete-buffers
   #:gl-delete-lists
   #:gl-delete-program
   #:gl-delete-queries
   #:gl-delete-shader
   #:gl-delete-textures
   #:gl-depth-func
   #:gl-depth-mask
   #:gl-depth-range
   #:gl-detach-shader
   #:gl-disable
   #:gl-disable-client-state
   #:gl-disable-vertex-attrib-array
   #:gl-draw-arrays
   #:gl-draw-buffer
   #:gl-draw-buffers
   #:gl-draw-elements
   #:gl-draw-pixels
   #:gl-draw-range-elements
   #:gl-edge-flag
   #:gl-edge-flag-pointer
   #:gl-edge-flagv
   #:gl-enable
   #:gl-enable-client-state
   #:gl-enable-vertex-attrib-array
   #:gl-end
   #:gl-end-list
   #:gl-end-query
   #:gl-eval-coord1d
   #:gl-eval-coord1dv
   #:gl-eval-coord1f
   #:gl-eval-coord1fv
   #:gl-eval-coord2d
   #:gl-eval-coord2dv
   #:gl-eval-coord2f
   #:gl-eval-coord2fv
   #:gl-eval-mesh1
   #:gl-eval-mesh2
   #:gl-eval-point1
   #:gl-eval-point2
   #:gl-feedback-buffer
   #:gl-finish
   #:gl-flush
   #:gl-fog-coord-pointer
   #:gl-fog-coordd
   #:gl-fog-coorddv
   #:gl-fog-coordf
   #:gl-fog-coordfv
   #:gl-fogf
   #:gl-fogfv
   #:gl-fogi
   #:gl-fogiv
   #:gl-front-face
   #:gl-frustum
   #:gl-gen-buffers
   #:gl-gen-lists
   #:gl-gen-queries
   #:gl-gen-textures
   #:gl-get-active-attrib
   #:gl-get-active-uniform
   #:gl-get-attached-shaders
   #:gl-get-attrib-location
   #:gl-get-booleanv
   #:gl-get-buffer-parameteriv
   #:gl-get-buffer-pointerv
   #:gl-get-buffer-sub-data
   #:gl-get-clip-plane
   #:gl-get-color-table
   #:gl-get-color-table-parameterfv
   #:gl-get-color-table-parameteriv
   #:gl-get-compressed-tex-image
   #:gl-get-convolution-filter
   #:gl-get-convolution-parameterfv
   #:gl-get-convolution-parameteriv
   #:gl-get-doublev
   #:gl-get-error
   #:gl-get-floatv
   #:gl-get-histogram
   #:gl-get-histogram-parameterfv
   #:gl-get-histogram-parameteriv
   #:gl-get-integerv
   #:gl-get-lightfv
   #:gl-get-lightiv
   #:gl-get-mapdv
   #:gl-get-mapfv
   #:gl-get-mapiv
   #:gl-get-materialfv
   #:gl-get-materialiv
   #:gl-get-minmax
   #:gl-get-minmax-parameterfv
   #:gl-get-minmax-parameteriv
   #:gl-get-pixel-mapfv
   #:gl-get-pixel-mapuiv
   #:gl-get-pixel-mapusv
   #:gl-get-pointerv
   #:gl-get-polygon-stipple
   #:gl-get-program-info-log
   #:gl-get-programiv
   #:gl-get-query-objectiv
   #:gl-get-query-objectuiv
   #:gl-get-queryiv
   #:gl-get-separable-filter
   #:gl-get-shader-info-log
   #:gl-get-shader-source
   #:gl-get-shaderiv
   #:gl-get-string
   #:gl-get-tex-envfv
   #:gl-get-tex-enviv
   #:gl-get-tex-gendv
   #:gl-get-tex-genfv
   #:gl-get-tex-geniv
   #:gl-get-tex-image
   #:gl-get-tex-level-parameterfv
   #:gl-get-tex-level-parameteriv
   #:gl-get-tex-parameterfv
   #:gl-get-tex-parameteriv
   #:gl-get-uniform-location
   #:gl-get-uniformfv
   #:gl-get-uniformiv
   #:gl-get-vertex-attrib-pointerv
   #:gl-get-vertex-attribdv
   #:gl-get-vertex-attribfv
   #:gl-get-vertex-attribiv
   #:gl-hint
   #:gl-histogram
   #:gl-index-mask
   #:gl-index-pointer
   #:gl-indexd
   #:gl-indexdv
   #:gl-indexf
   #:gl-indexfv
   #:gl-indexi
   #:gl-indexiv
   #:gl-indexs
   #:gl-indexsv
   #:gl-indexub
   #:gl-indexubv
   #:gl-init-names
   #:gl-interleaved-arrays
   #:gl-is-buffer
   #:gl-is-enabled
   #:gl-is-list
   #:gl-is-program
   #:gl-is-query
   #:gl-is-shader
   #:gl-is-texture
   #:gl-light-modelf
   #:gl-light-modelfv
   #:gl-light-modeli
   #:gl-light-modeliv
   #:gl-lightf
   #:gl-lightfv
   #:gl-lighti
   #:gl-lightiv
   #:gl-line-stipple
   #:gl-line-width
   #:gl-link-program
   #:gl-list-base
   #:gl-load-identity
   #:gl-load-matrixd
   #:gl-load-matrixf
   #:gl-load-name
   #:gl-load-transpose-matrixd
   #:gl-load-transpose-matrixf
   #:gl-logic-op
   #:gl-map-buffer
   #:gl-map-grid1d
   #:gl-map-grid1f
   #:gl-map-grid2d
   #:gl-map-grid2f
   #:gl-map1d
   #:gl-map1f
   #:gl-map2d
   #:gl-map2f
   #:gl-materialf
   #:gl-materialfv
   #:gl-materiali
   #:gl-materialiv
   #:gl-matrix-mode
   #:gl-minmax
   #:gl-mult-matrixd
   #:gl-mult-matrixf
   #:gl-mult-transpose-matrixd
   #:gl-mult-transpose-matrixf
   #:gl-multi-draw-arrays
   #:gl-multi-draw-elements
   #:gl-multi-tex-coord1d
   #:gl-multi-tex-coord1dv
   #:gl-multi-tex-coord1f
   #:gl-multi-tex-coord1fv
   #:gl-multi-tex-coord1i
   #:gl-multi-tex-coord1iv
   #:gl-multi-tex-coord1s
   #:gl-multi-tex-coord1sv
   #:gl-multi-tex-coord2d
   #:gl-multi-tex-coord2dv
   #:gl-multi-tex-coord2f
   #:gl-multi-tex-coord2fv
   #:gl-multi-tex-coord2i
   #:gl-multi-tex-coord2iv
   #:gl-multi-tex-coord2s
   #:gl-multi-tex-coord2sv
   #:gl-multi-tex-coord3d
   #:gl-multi-tex-coord3dv
   #:gl-multi-tex-coord3f
   #:gl-multi-tex-coord3fv
   #:gl-multi-tex-coord3i
   #:gl-multi-tex-coord3iv
   #:gl-multi-tex-coord3s
   #:gl-multi-tex-coord3sv
   #:gl-multi-tex-coord4d
   #:gl-multi-tex-coord4dv
   #:gl-multi-tex-coord4f
   #:gl-multi-tex-coord4fv
   #:gl-multi-tex-coord4i
   #:gl-multi-tex-coord4iv
   #:gl-multi-tex-coord4s
   #:gl-multi-tex-coord4sv
   #:gl-new-list
   #:gl-normal-pointer
   #:gl-normal3b
   #:gl-normal3bv
   #:gl-normal3d
   #:gl-normal3dv
   #:gl-normal3f
   #:gl-normal3fv
   #:gl-normal3i
   #:gl-normal3iv
   #:gl-normal3s
   #:gl-normal3sv
   #:gl-ortho
   #:gl-pass-through
   #:gl-pixel-mapfv
   #:gl-pixel-mapuiv
   #:gl-pixel-mapusv
   #:gl-pixel-storef
   #:gl-pixel-storei
   #:gl-pixel-transferf
   #:gl-pixel-transferi
   #:gl-pixel-zoom
   #:gl-point-parameterf
   #:gl-point-parameterfv
   #:gl-point-parameteri
   #:gl-point-parameteriv
   #:gl-point-size
   #:gl-polygon-mode
   #:gl-polygon-offset
   #:gl-polygon-stipple
   #:gl-pop-attrib
   #:gl-pop-client-attrib
   #:gl-pop-matrix
   #:gl-pop-name
   #:gl-prioritize-textures
   #:gl-push-attrib
   #:gl-push-client-attrib
   #:gl-push-matrix
   #:gl-push-name
   #:gl-raster-pos2d
   #:gl-raster-pos2dv
   #:gl-raster-pos2f
   #:gl-raster-pos2fv
   #:gl-raster-pos2i
   #:gl-raster-pos2iv
   #:gl-raster-pos2s
   #:gl-raster-pos2sv
   #:gl-raster-pos3d
   #:gl-raster-pos3dv
   #:gl-raster-pos3f
   #:gl-raster-pos3fv
   #:gl-raster-pos3i
   #:gl-raster-pos3iv
   #:gl-raster-pos3s
   #:gl-raster-pos3sv
   #:gl-raster-pos4d
   #:gl-raster-pos4dv
   #:gl-raster-pos4f
   #:gl-raster-pos4fv
   #:gl-raster-pos4i
   #:gl-raster-pos4iv
   #:gl-raster-pos4s
   #:gl-raster-pos4sv
   #:gl-read-buffer
   #:gl-read-pixels
   #:gl-rectd
   #:gl-rectdv
   #:gl-rectf
   #:gl-rectfv
   #:gl-recti
   #:gl-rectiv
   #:gl-rects
   #:gl-rectsv
   #:gl-render-mode
   #:gl-reset-histogram
   #:gl-reset-minmax
   #:gl-rotated
   #:gl-rotatef
   #:gl-sample-coverage
   #:gl-scaled
   #:gl-scalef
   #:gl-scissor
   #:gl-secondary-color-pointer
   #:gl-secondary-color3b
   #:gl-secondary-color3bv
   #:gl-secondary-color3d
   #:gl-secondary-color3dv
   #:gl-secondary-color3f
   #:gl-secondary-color3fv
   #:gl-secondary-color3i
   #:gl-secondary-color3iv
   #:gl-secondary-color3s
   #:gl-secondary-color3sv
   #:gl-secondary-color3ub
   #:gl-secondary-color3ubv
   #:gl-secondary-color3ui
   #:gl-secondary-color3uiv
   #:gl-secondary-color3us
   #:gl-secondary-color3usv
   #:gl-select-buffer
   #:gl-separable-filter2-D
   #:gl-shade-model
   #:gl-shader-source
   #:gl-stencil-func
   #:gl-stencil-func-separate
   #:gl-stencil-mask
   #:gl-stencil-mask-separate
   #:gl-stencil-op
   #:gl-stencil-op-separate
   #:gl-tex-coord-pointer
   #:gl-tex-coord1d
   #:gl-tex-coord1dv
   #:gl-tex-coord1f
   #:gl-tex-coord1fv
   #:gl-tex-coord1i
   #:gl-tex-coord1iv
   #:gl-tex-coord1s
   #:gl-tex-coord1sv
   #:gl-tex-coord2d
   #:gl-tex-coord2dv
   #:gl-tex-coord2f
   #:gl-tex-coord2fv
   #:gl-tex-coord2i
   #:gl-tex-coord2iv
   #:gl-tex-coord2s
   #:gl-tex-coord2sv
   #:gl-tex-coord3d
   #:gl-tex-coord3dv
   #:gl-tex-coord3f
   #:gl-tex-coord3fv
   #:gl-tex-coord3i
   #:gl-tex-coord3iv
   #:gl-tex-coord3s
   #:gl-tex-coord3sv
   #:gl-tex-coord4d
   #:gl-tex-coord4dv
   #:gl-tex-coord4f
   #:gl-tex-coord4fv
   #:gl-tex-coord4i
   #:gl-tex-coord4iv
   #:gl-tex-coord4s
   #:gl-tex-coord4sv
   #:gl-tex-envf
   #:gl-tex-envfv
   #:gl-tex-envi
   #:gl-tex-enviv
   #:gl-tex-gend
   #:gl-tex-gendv
   #:gl-tex-genf
   #:gl-tex-genfv
   #:gl-tex-geni
   #:gl-tex-geniv
   #:gl-tex-image1-D
   #:gl-tex-image2-D
   #:gl-tex-image3-D
   #:gl-tex-parameterf
   #:gl-tex-parameterfv
   #:gl-tex-parameteri
   #:gl-tex-parameteriv
   #:gl-tex-sub-image1-D
   #:gl-tex-sub-image2-D
   #:gl-tex-sub-image3-D
   #:gl-translated
   #:gl-translatef
   #:gl-uniform-matrix2fv
   #:gl-uniform-matrix2x3fv
   #:gl-uniform-matrix2x4fv
   #:gl-uniform-matrix3fv
   #:gl-uniform-matrix3x2fv
   #:gl-uniform-matrix3x4fv
   #:gl-uniform-matrix4fv
   #:gl-uniform-matrix4x2fv
   #:gl-uniform-matrix4x3fv
   #:gl-uniform1f
   #:gl-uniform1fv
   #:gl-uniform1i
   #:gl-uniform1iv
   #:gl-uniform2f
   #:gl-uniform2fv
   #:gl-uniform2i
   #:gl-uniform2iv
   #:gl-uniform3f
   #:gl-uniform3fv
   #:gl-uniform3i
   #:gl-uniform3iv
   #:gl-uniform4f
   #:gl-uniform4fv
   #:gl-uniform4i
   #:gl-uniform4iv
   #:gl-unmap-buffer
   #:gl-use-program
   #:gl-validate-program
   #:gl-vertex-attrib-pointer
   #:gl-vertex-attrib1d
   #:gl-vertex-attrib1dv
   #:gl-vertex-attrib1f
   #:gl-vertex-attrib1fv
   #:gl-vertex-attrib1s
   #:gl-vertex-attrib1sv
   #:gl-vertex-attrib2d
   #:gl-vertex-attrib2dv
   #:gl-vertex-attrib2f
   #:gl-vertex-attrib2fv
   #:gl-vertex-attrib2s
   #:gl-vertex-attrib2sv
   #:gl-vertex-attrib3d
   #:gl-vertex-attrib3dv
   #:gl-vertex-attrib3f
   #:gl-vertex-attrib3fv
   #:gl-vertex-attrib3s
   #:gl-vertex-attrib3sv
   #:gl-vertex-attrib4-nbv
   #:gl-vertex-attrib4-niv
   #:gl-vertex-attrib4-nsv
   #:gl-vertex-attrib4-nub
   #:gl-vertex-attrib4-nubv
   #:gl-vertex-attrib4-nuiv
   #:gl-vertex-attrib4-nusv
   #:gl-vertex-attrib4bv
   #:gl-vertex-attrib4d
   #:gl-vertex-attrib4dv
   #:gl-vertex-attrib4f
   #:gl-vertex-attrib4fv
   #:gl-vertex-attrib4iv
   #:gl-vertex-attrib4s
   #:gl-vertex-attrib4sv
   #:gl-vertex-attrib4ubv
   #:gl-vertex-attrib4uiv
   #:gl-vertex-attrib4usv
   #:gl-vertex-pointer
   #:gl-vertex2d
   #:gl-vertex2dv
   #:gl-vertex2f
   #:gl-vertex2fv
   #:gl-vertex2i
   #:gl-vertex2iv
   #:gl-vertex2s
   #:gl-vertex2sv
   #:gl-vertex3d
   #:gl-vertex3dv
   #:gl-vertex3f
   #:gl-vertex3fv
   #:gl-vertex3i
   #:gl-vertex3iv
   #:gl-vertex3s
   #:gl-vertex3sv
   #:gl-vertex4d
   #:gl-vertex4dv
   #:gl-vertex4f
   #:gl-vertex4fv
   #:gl-vertex4i
   #:gl-vertex4iv
   #:gl-vertex4s
   #:gl-vertex4sv
   #:gl-viewport
   #:gl-window-pos2d
   #:gl-window-pos2dv
   #:gl-window-pos2f
   #:gl-window-pos2fv
   #:gl-window-pos2i
   #:gl-window-pos2iv
   #:gl-window-pos2s
   #:gl-window-pos2sv
   #:gl-window-pos3d
   #:gl-window-pos3dv
   #:gl-window-pos3f
   #:gl-window-pos3fv
   #:gl-window-pos3i
   #:gl-window-pos3iv
   #:gl-window-pos3s
   #:gl-window-pos3sv

   ;; constants
   #:+gl-2d+
   #:+gl-2-bytes+
   #:+gl-3d+
   #:+gl-3d-color+
   #:+gl-3d-color-texture+
   #:+gl-3-bytes+
   #:+gl-4d-color-texture+
   #:+gl-4-bytes+
   #:+gl-accum-alpha-bits+
   #:+gl-accum-blue-bits+
   #:+gl-accum-buffer-bit+
   #:+gl-accum-clear-value+
   #:+gl-accum-green-bits+
   #:+gl-accum-red-bits+
   #:+gl-active-attributes+
   #:+gl-active-attribute-max-length+
   #:+gl-active-texture+
   #:+gl-active-uniforms+
   #:+gl-active-uniform-max-length+
   #:+gl-add-signed+
   #:+gl-aliased-line-width-range+
   #:+gl-aliased-point-size-range+
   #:+gl-all-attrib-bits+
   #:+gl-alpha+
   #:+gl-alpha12+
   #:+gl-alpha16+
   #:+gl-alpha4+
   #:+gl-alpha8+
   #:+gl-alpha-bias+
   #:+gl-alpha-bits+
   #:+gl-alpha-scale+
   #:+gl-alpha-test+
   #:+gl-alpha-test-func+
   #:+gl-alpha-test-ref+
   #:+gl-ambient+
   #:+gl-ambient-and-diffuse+
   #:+gl-and+
   #:+gl-and-inverted+
   #:+gl-and-reverse+
   #:+gl-array-buffer+
   #:+gl-array-buffer-binding+
   #:+gl-attached-shaders+
   #:+gl-attrib-stack-depth+
   #:+gl-auto-normal+
   #:+gl-aux0+
   #:+gl-aux1+
   #:+gl-aux2+
   #:+gl-aux3+
   #:+gl-aux-buffers+
   #:+gl-back+
   #:+gl-back-left+
   #:+gl-back-right+
   #:+gl-bgr+
   #:+gl-bgra+
   #:+gl-bitmap+
   #:+gl-bitmap-token+
   #:+gl-blend+
   #:+gl-blend-color+
   #:+gl-blend-dst+
   #:+gl-blend-equation+
   #:+gl-blend-equation-alpha+
   #:+gl-blend-equation-rgb+
   #:+gl-blend-src+
   #:+gl-blue+
   #:+gl-blue-bias+
   #:+gl-blue-bits+
   #:+gl-blue-scale+
   #:+gl-bool+
   #:+gl-bool-vec2+
   #:+gl-bool-vec3+
   #:+gl-bool-vec4+
   #:+gl-buffer-access+
   #:+gl-buffer-mapped+
   #:+gl-buffer-map-pointer+
   #:+gl-buffer-size+
   #:+gl-buffer-usage+
   #:+gl-byte+
   #:+gl-c3f-v3f+
   #:+gl-c4f-n3f-v3f+
   #:+gl-c4ub-v2f+
   #:+gl-c4ub-v3f+
   #:+gl-ccw+
   #:+gl-clamp+
   #:+gl-clamp-to-border+
   #:+gl-clamp-to-edge+
   #:+gl-clear+
   #:+gl-client-active-texture+
   #:+gl-client-all-attrib-bits+
   #:+gl-client-attrib-stack-depth+
   #:+gl-client-pixel-store-bit+
   #:+gl-client-vertex-array-bit+
   #:+gl-clip-plane0+
   #:+gl-clip-plane1+
   #:+gl-clip-plane2+
   #:+gl-clip-plane3+
   #:+gl-clip-plane4+
   #:+gl-clip-plane5+
   #:+gl-coeff+
   #:+gl-color+
   #:+gl-color-array+
   #:+gl-color-array-buffer-binding+
   #:+gl-color-array-pointer+
   #:+gl-color-array-size+
   #:+gl-color-array-stride+
   #:+gl-color-array-type+
   #:+gl-color-buffer-bit+
   #:+gl-color-clear-value+
   #:+gl-color-index+
   #:+gl-color-indexes+
   #:+gl-color-logic-op+
   #:+gl-color-material+
   #:+gl-color-material-face+
   #:+gl-color-material-parameter+
   #:+gl-color-matrix+
   #:+gl-color-matrix-stack-depth+
   #:+gl-color-table+
   #:+gl-color-table-alpha-size+
   #:+gl-color-table-bias+
   #:+gl-color-table-blue-size+
   #:+gl-color-table-format+
   #:+gl-color-table-green-size+
   #:+gl-color-table-intensity-size+
   #:+gl-color-table-luminance-size+
   #:+gl-color-table-red-size+
   #:+gl-color-table-scale+
   #:+gl-color-table-width+
   #:+gl-color-writemask+
   #:+gl-combine+
   #:+gl-combine-alpha+
   #:+gl-combine-rgb+
   #:+gl-compile+
   #:+gl-compile-and-execute+
   #:+gl-compile-status+
   #:+gl-compressed-sluminance+
   #:+gl-compressed-sluminance-alpha+
   #:+gl-compressed-srgb+
   #:+gl-compressed-srgb-alpha+
   #:+gl-constant+
   #:+gl-constant-alpha+
   #:+gl-constant-attenuation+
   #:+gl-constant-border+
   #:+gl-constant-color+
   #:+gl-convolution-1d+
   #:+gl-convolution-2d+
   #:+gl-convolution-border-color+
   #:+gl-convolution-border-mode+
   #:+gl-convolution-filter-bias+
   #:+gl-convolution-filter-scale+
   #:+gl-convolution-format+
   #:+gl-convolution-height+
   #:+gl-convolution-width+
   #:+gl-coord-replace+
   #:+gl-copy+
   #:+gl-copy-inverted+
   #:+gl-copy-pixel-token+
   #:+gl-cull-face+
   #:+gl-cull-face-mode+
   #:+gl-current-bit+
   #:+gl-current-color+
   #:+gl-current-fog-coord+
   #:+gl-current-index+
   #:+gl-current-normal+
   #:+gl-current-program+
   #:+gl-current-query+
   #:+gl-current-raster-color+
   #:+gl-current-raster-distance+
   #:+gl-current-raster-index+
   #:+gl-current-raster-position+
   #:+gl-current-raster-position-valid+
   #:+gl-current-raster-secondary-color+
   #:+gl-current-raster-texture-coords+
   #:+gl-current-texture-coords+
   #:+gl-current-vertex-attrib+
   #:+gl-cw+
   #:+gl-decal+
   #:+gl-decr+
   #:+gl-delete-status+
   #:+gl-depth+
   #:+gl-depth-bias+
   #:+gl-depth-bits+
   #:+gl-depth-buffer-bit+
   #:+gl-depth-clear-value+
   #:+gl-depth-component+
   #:+gl-depth-func+
   #:+gl-depth-range+
   #:+gl-depth-scale+
   #:+gl-depth-test+
   #:+gl-depth-writemask+
   #:+gl-diffuse+
   #:+gl-dither+
   #:+gl-domain+
   #:+gl-dont-care+
   #:+gl-double+
   #:+gl-doublebuffer+
   #:+gl-draw-buffer+
   #:+gl-draw-buffer0+
   #:+gl-draw-buffer1+
   #:+gl-draw-buffer10+
   #:+gl-draw-buffer11+
   #:+gl-draw-buffer12+
   #:+gl-draw-buffer13+
   #:+gl-draw-buffer14+
   #:+gl-draw-buffer15+
   #:+gl-draw-buffer2+
   #:+gl-draw-buffer3+
   #:+gl-draw-buffer4+
   #:+gl-draw-buffer5+
   #:+gl-draw-buffer6+
   #:+gl-draw-buffer7+
   #:+gl-draw-buffer8+
   #:+gl-draw-buffer9+
   #:+gl-draw-pixel-token+
   #:+gl-dst-alpha+
   #:+gl-dst-color+
   #:+gl-dynamic-copy+
   #:+gl-dynamic-draw+
   #:+gl-dynamic-read+
   #:+gl-edge-flag+
   #:+gl-edge-flag-array+
   #:+gl-edge-flag-array-buffer-binding+
   #:+gl-edge-flag-array-pointer+
   #:+gl-edge-flag-array-stride+
   #:+gl-element-array-buffer+
   #:+gl-element-array-buffer-binding+
   #:+gl-emission+
   #:+gl-enable-bit+
   #:+gl-equiv+
   #:+gl-eval-bit+
   #:+gl-exp+
   #:+gl-exp2+
   #:+gl-extensions+
   #:+gl-eye-linear+
   #:+gl-eye-plane+
   #:+gl-false+
   #:+gl-fastest+
   #:+gl-feedback+
   #:+gl-feedback-buffer-pointer+
   #:+gl-feedback-buffer-size+
   #:+gl-feedback-buffer-type+
   #:+gl-fill+
   #:+gl-flat+
   #:+gl-float+
   #:+gl-float-mat2+
   #:+gl-float-mat2x3+
   #:+gl-float-mat2x4+
   #:+gl-float-mat3+
   #:+gl-float-mat3x2+
   #:+gl-float-mat3x4+
   #:+gl-float-mat4+
   #:+gl-float-mat4x2+
   #:+gl-float-mat4x3+
   #:+gl-float-vec2+
   #:+gl-float-vec3+
   #:+gl-float-vec4+
   #:+gl-fog+
   #:+gl-fog-bit+
   #:+gl-fog-color+
   #:+gl-fog-coord+
   #:+gl-fog-coord-array+
   #:+gl-fog-coord-array-buffer-binding+
   #:+gl-fog-coord-array-pointer+
   #:+gl-fog-coord-array-stride+
   #:+gl-fog-coord-array-type+
   #:+gl-fog-coord-src+
   #:+gl-fog-density+
   #:+gl-fog-end+
   #:+gl-fog-hint+
   #:+gl-fog-index+
   #:+gl-fog-mode+
   #:+gl-fog-start+
   #:+gl-fragment-depth+
   #:+gl-fragment-shader+
   #:+gl-fragment-shader-derivative-hint+
   #:+gl-front+
   #:+gl-front-and-back+
   #:+gl-front-face+
   #:+gl-front-left+
   #:+gl-front-right+
   #:+gl-func-add+
   #:+gl-func-reverse-subtract+
   #:+gl-func-subtract+
   #:+gl-green+
   #:+gl-green-bias+
   #:+gl-green-bits+
   #:+gl-green-scale+
   #:+gl-hint-bit+
   #:+gl-histogram+
   #:+gl-histogram-alpha-size+
   #:+gl-histogram-blue-size+
   #:+gl-histogram-format+
   #:+gl-histogram-green-size+
   #:+gl-histogram-luminance-size+
   #:+gl-histogram-red-size+
   #:+gl-histogram-sink+
   #:+gl-histogram-width+
   #:+gl-incr+
   #:+gl-index-array+
   #:+gl-index-array-buffer-binding+
   #:+gl-index-array-pointer+
   #:+gl-index-array-stride+
   #:+gl-index-array-type+
   #:+gl-index-bits+
   #:+gl-index-clear-value+
   #:+gl-index-logic-op+
   #:+gl-index-mode+
   #:+gl-index-offset+
   #:+gl-index-shift+
   #:+gl-index-writemask+
   #:+gl-info-log-length+
   #:+gl-int+
   #:+gl-intensity+
   #:+gl-intensity12+
   #:+gl-intensity16+
   #:+gl-intensity4+
   #:+gl-intensity8+
   #:+gl-interpolate+
   #:+gl-int-vec2+
   #:+gl-int-vec3+
   #:+gl-int-vec4+
   #:+gl-invalid-enum+
   #:+gl-invalid-operation+
   #:+gl-invalid-value+
   #:+gl-invert+
   #:+gl-keep+
   #:+gl-left+
   #:+gl-light0+
   #:+gl-light1+
   #:+gl-light2+
   #:+gl-light3+
   #:+gl-light4+
   #:+gl-light5+
   #:+gl-light6+
   #:+gl-light7+
   #:+gl-lighting+
   #:+gl-lighting-bit+
   #:+gl-light-model-ambient+
   #:+gl-light-model-color-control+
   #:+gl-light-model-local-viewer+
   #:+gl-light-model-two-side+
   #:+gl-line+
   #:+gl-linear+
   #:+gl-linear-attenuation+
   #:+gl-linear-mipmap-linear+
   #:+gl-linear-mipmap-nearest+
   #:+gl-lines+
   #:+gl-line-bit+
   #:+gl-line-loop+
   #:+gl-line-reset-token+
   #:+gl-line-smooth+
   #:+gl-line-smooth-hint+
   #:+gl-line-stipple+
   #:+gl-line-stipple-pattern+
   #:+gl-line-stipple-repeat+
   #:+gl-line-strip+
   #:+gl-line-token+
   #:+gl-line-width+
   #:+gl-line-width-granularity+
   #:+gl-line-width-range+
   #:+gl-link-status+
   #:+gl-list-base+
   #:+gl-list-bit+
   #:+gl-list-index+
   #:+gl-list-mode+
   #:+gl-logic-op-mode+
   #:+gl-lower-left+
   #:+gl-luminance+
   #:+gl-luminance12+
   #:+gl-luminance12-alpha12+
   #:+gl-luminance12-alpha4+
   #:+gl-luminance16+
   #:+gl-luminance16-alpha16+
   #:+gl-luminance4+
   #:+gl-luminance4-alpha4+
   #:+gl-luminance6-alpha2+
   #:+gl-luminance8+
   #:+gl-luminance8-alpha8+
   #:+gl-luminance-alpha+
   #:+gl-map1-color-4+
   #:+gl-map1-grid-domain+
   #:+gl-map1-grid-segments+
   #:+gl-map1-index+
   #:+gl-map1-normal+
   #:+gl-map1-texture-coord-1+
   #:+gl-map1-texture-coord-2+
   #:+gl-map1-texture-coord-3+
   #:+gl-map1-texture-coord-4+
   #:+gl-map1-vertex-3+
   #:+gl-map1-vertex-4+
   #:+gl-map2-color-4+
   #:+gl-map2-grid-domain+
   #:+gl-map2-grid-segments+
   #:+gl-map2-index+
   #:+gl-map2-normal+
   #:+gl-map2-texture-coord-1+
   #:+gl-map2-texture-coord-2+
   #:+gl-map2-texture-coord-3+
   #:+gl-map2-texture-coord-4+
   #:+gl-map2-vertex-3+
   #:+gl-map2-vertex-4+
   #:+gl-map-color+
   #:+gl-map-stencil+
   #:+gl-matrix-mode+
   #:+gl-max+
   #:+gl-max-3d-texture-size+
   #:+gl-max-attrib-stack-depth+
   #:+gl-max-client-attrib-stack-depth+
   #:+gl-max-clip-planes+
   #:+gl-max-color-matrix-stack-depth+
   #:+gl-max-combined-texture-image-units+
   #:+gl-max-convolution-height+
   #:+gl-max-convolution-width+
   #:+gl-max-draw-buffers+
   #:+gl-max-elements-indices+
   #:+gl-max-elements-vertices+
   #:+gl-max-eval-order+
   #:+gl-max-fragment-uniform-components+
   #:+gl-max-lights+
   #:+gl-max-list-nesting+
   #:+gl-max-modelview-stack-depth+
   #:+gl-max-name-stack-depth+
   #:+gl-max-pixel-map-table+
   #:+gl-max-projection-stack-depth+
   #:+gl-max-texture-coords+
   #:+gl-max-texture-image-units+
   #:+gl-max-texture-size+
   #:+gl-max-texture-stack-depth+
   #:+gl-max-texture-units+
   #:+gl-max-varying-floats+
   #:+gl-max-vertex-attribs+
   #:+gl-max-vertex-texture-image-units+
   #:+gl-max-vertex-uniform-components+
   #:+gl-max-viewport-dims+
   #:+gl-min+
   #:+gl-minmax+
   #:+gl-minmax-format+
   #:+gl-minmax-sink+
   #:+gl-modelview+
   #:+gl-modelview-matrix+
   #:+gl-modelview-stack-depth+
   #:+gl-modulate+
   #:+gl-n3f-v3f+
   #:+gl-name-stack-depth+
   #:+gl-nand+
   #:+gl-nearest+
   #:+gl-nearest-mipmap-linear+
   #:+gl-nearest-mipmap-nearest+
   #:+gl-nicest+
   #:+gl-none+
   #:+gl-noop+
   #:+gl-nor+
   #:+gl-normalize+
   #:+gl-normal-array+
   #:+gl-normal-array-buffer-binding+
   #:+gl-normal-array-pointer+
   #:+gl-normal-array-stride+
   #:+gl-normal-array-type+
   #:+gl-no-error+
   #:+gl-object-linear+
   #:+gl-object-plane+
   #:+gl-one+
   #:+gl-one-minus-constant-alpha+
   #:+gl-one-minus-constant-color+
   #:+gl-one-minus-dst-alpha+
   #:+gl-one-minus-dst-color+
   #:+gl-one-minus-src-alpha+
   #:+gl-one-minus-src-color+
   #:+gl-or+
   #:+gl-order+
   #:+gl-or-inverted+
   #:+gl-or-reverse+
   #:+gl-out-of-memory+
   #:+gl-pack-alignment+
   #:+gl-pack-image-height+
   #:+gl-pack-lsb-first+
   #:+gl-pack-row-length+
   #:+gl-pack-skip-images+
   #:+gl-pack-skip-pixels+
   #:+gl-pack-skip-rows+
   #:+gl-pack-swap-bytes+
   #:+gl-pass-through-token+
   #:+gl-perspective-correction-hint+
   #:+gl-pixel-map-a-to-a+
   #:+gl-pixel-map-a-to-a-size+
   #:+gl-pixel-map-b-to-b+
   #:+gl-pixel-map-b-to-b-size+
   #:+gl-pixel-map-g-to-g+
   #:+gl-pixel-map-g-to-g-size+
   #:+gl-pixel-map-i-to-a+
   #:+gl-pixel-map-i-to-a-size+
   #:+gl-pixel-map-i-to-b+
   #:+gl-pixel-map-i-to-b-size+
   #:+gl-pixel-map-i-to-g+
   #:+gl-pixel-map-i-to-g-size+
   #:+gl-pixel-map-i-to-i+
   #:+gl-pixel-map-i-to-i-size+
   #:+gl-pixel-map-i-to-r+
   #:+gl-pixel-map-i-to-r-size+
   #:+gl-pixel-map-r-to-r+
   #:+gl-pixel-map-r-to-r-size+
   #:+gl-pixel-map-s-to-s+
   #:+gl-pixel-map-s-to-s-size+
   #:+gl-pixel-mode-bit+
   #:+gl-pixel-pack-buffer+
   #:+gl-pixel-pack-buffer-binding+
   #:+gl-pixel-unpack-buffer+
   #:+gl-pixel-unpack-buffer-binding+
   #:+gl-point+
   #:+gl-points+
   #:+gl-point-bit+
   #:+gl-point-size+
   #:+gl-point-size-granularity+
   #:+gl-point-size-range+
   #:+gl-point-smooth+
   #:+gl-point-smooth-hint+
   #:+gl-point-sprite+
   #:+gl-point-sprite-coord-origin+
   #:+gl-point-token+
   #:+gl-polygon+
   #:+gl-polygon-bit+
   #:+gl-polygon-mode+
   #:+gl-polygon-offset-factor+
   #:+gl-polygon-offset-fill+
   #:+gl-polygon-offset-line+
   #:+gl-polygon-offset-point+
   #:+gl-polygon-offset-units+
   #:+gl-polygon-smooth+
   #:+gl-polygon-smooth-hint+
   #:+gl-polygon-stipple+
   #:+gl-polygon-stipple-bit+
   #:+gl-polygon-token+
   #:+gl-position+
   #:+gl-post-color-matrix-alpha-bias+
   #:+gl-post-color-matrix-alpha-scale+
   #:+gl-post-color-matrix-blue-bias+
   #:+gl-post-color-matrix-blue-scale+
   #:+gl-post-color-matrix-color-table+
   #:+gl-post-color-matrix-green-bias+
   #:+gl-post-color-matrix-green-scale+
   #:+gl-post-color-matrix-red-bias+
   #:+gl-post-color-matrix-red-scale+
   #:+gl-post-convolution-alpha-bias+
   #:+gl-post-convolution-alpha-scale+
   #:+gl-post-convolution-blue-bias+
   #:+gl-post-convolution-blue-scale+
   #:+gl-post-convolution-color-table+
   #:+gl-post-convolution-green-bias+
   #:+gl-post-convolution-green-scale+
   #:+gl-post-convolution-red-bias+
   #:+gl-post-convolution-red-scale+
   #:+gl-previous+
   #:+gl-primary-color+
   #:+gl-projection+
   #:+gl-projection-matrix+
   #:+gl-projection-stack-depth+
   #:+gl-proxy-color-table+
   #:+gl-proxy-histogram+
   #:+gl-proxy-post-color-matrix-color-table+
   #:+gl-proxy-post-convolution-color-table+
   #:+gl-proxy-texture-1d+
   #:+gl-proxy-texture-2d+
   #:+gl-proxy-texture-3d+
   #:+gl-q+
   #:+gl-quadratic-attenuation+
   #:+gl-quads+
   #:+gl-quad-strip+
   #:+gl-query-counter-bits+
   #:+gl-query-result+
   #:+gl-query-result-available+
   #:+gl-r+
   #:+gl-r3-g3-b2+
   #:+gl-read-buffer+
   #:+gl-read-only+
   #:+gl-read-write+
   #:+gl-red+
   #:+gl-reduce+
   #:+gl-red-bias+
   #:+gl-red-bits+
   #:+gl-red-scale+
   #:+gl-render+
   #:+gl-renderer+
   #:+gl-render-mode+
   #:+gl-repeat+
   #:+gl-replace+
   #:+gl-replicate-border+
   #:+gl-rescale-normal+
   #:+gl-rgb+
   #:+gl-rgb10+
   #:+gl-rgb10-a2+
   #:+gl-rgb12+
   #:+gl-rgb16+
   #:+gl-rgb4+
   #:+gl-rgb5+
   #:+gl-rgb5-a1+
   #:+gl-rgb8+
   #:+gl-rgba+
   #:+gl-rgba12+
   #:+gl-rgba16+
   #:+gl-rgba2+
   #:+gl-rgba4+
   #:+gl-rgba8+
   #:+gl-rgba-mode+
   #:+gl-rgb-scale+
   #:+gl-right+
   #:+gl-s+
   #:+gl-sampler-1d+
   #:+gl-sampler-1d-shadow+
   #:+gl-sampler-2d+
   #:+gl-sampler-2d-shadow+
   #:+gl-sampler-3d+
   #:+gl-sampler-cube+
   #:+gl-samples-passed+
   #:+gl-scissor-bit+
   #:+gl-scissor-box+
   #:+gl-scissor-test+
   #:+gl-secondary-color-array-buffer-binding+
   #:+gl-select+
   #:+gl-selection-buffer-pointer+
   #:+gl-selection-buffer-size+
   #:+gl-separable-2d+
   #:+gl-separate-specular-color+
   #:+gl-set+
   #:+gl-shader-source-length+
   #:+gl-shader-type+
   #:+gl-shade-model+
   #:+gl-shading-language-version+
   #:+gl-shininess+
   #:+gl-short+
   #:+gl-single-color+
   #:+gl-sluminance+
   #:+gl-sluminance8+
   #:+gl-sluminance8-alpha8+
   #:+gl-sluminance-alpha+
   #:+gl-smooth+
   #:+gl-smooth-line-width-granularity+
   #:+gl-smooth-line-width-range+
   #:+gl-smooth-point-size-granularity+
   #:+gl-smooth-point-size-range+
   #:+gl-specular+
   #:+gl-sphere-map+
   #:+gl-spot-cutoff+
   #:+gl-spot-direction+
   #:+gl-spot-exponent+
   #:+gl-src0-alpha+
   #:+gl-src0-rgb+
   #:+gl-src1-alpha+
   #:+gl-src1-rgb+
   #:+gl-src2-alpha+
   #:+gl-src2-rgb+
   #:+gl-src-alpha+
   #:+gl-src-alpha-saturate+
   #:+gl-src-color+
   #:+gl-srgb+
   #:+gl-srgb8+
   #:+gl-srgb8-alpha8+
   #:+gl-srgb-alpha+
   #:+gl-stack-overflow+
   #:+gl-stack-underflow+
   #:+gl-static-copy+
   #:+gl-static-draw+
   #:+gl-static-read+
   #:+gl-stencil+
   #:+gl-stencil-back-fail+
   #:+gl-stencil-back-func+
   #:+gl-stencil-back-pass-depth-fail+
   #:+gl-stencil-back-pass-depth-pass+
   #:+gl-stencil-back-ref+
   #:+gl-stencil-back-value-mask+
   #:+gl-stencil-back-writemask+
   #:+gl-stencil-bits+
   #:+gl-stencil-buffer-bit+
   #:+gl-stencil-clear-value+
   #:+gl-stencil-fail+
   #:+gl-stencil-func+
   #:+gl-stencil-index+
   #:+gl-stencil-pass-depth-fail+
   #:+gl-stencil-pass-depth-pass+
   #:+gl-stencil-ref+
   #:+gl-stencil-test+
   #:+gl-stencil-value-mask+
   #:+gl-stencil-writemask+
   #:+gl-stereo+
   #:+gl-stream-copy+
   #:+gl-stream-draw+
   #:+gl-stream-read+
   #:+gl-subpixel-bits+
   #:+gl-subtract+
   #:+gl-t+
   #:+gl-t2f-c3f-v3f+
   #:+gl-t2f-c4f-n3f-v3f+
   #:+gl-t2f-c4ub-v3f+
   #:+gl-t2f-n3f-v3f+
   #:+gl-t2f-v3f+
   #:+gl-t4f-c4f-n3f-v4f+
   #:+gl-t4f-v4f+
   #:+gl-table-too-large+
   #:+gl-texture+
   #:+gl-texture0+
   #:+gl-texture1+
   #:+gl-texture10+
   #:+gl-texture11+
   #:+gl-texture12+
   #:+gl-texture13+
   #:+gl-texture14+
   #:+gl-texture15+
   #:+gl-texture16+
   #:+gl-texture17+
   #:+gl-texture18+
   #:+gl-texture19+
   #:+gl-texture2+
   #:+gl-texture20+
   #:+gl-texture21+
   #:+gl-texture22+
   #:+gl-texture23+
   #:+gl-texture24+
   #:+gl-texture25+
   #:+gl-texture26+
   #:+gl-texture27+
   #:+gl-texture28+
   #:+gl-texture29+
   #:+gl-texture3+
   #:+gl-texture30+
   #:+gl-texture31+
   #:+gl-texture4+
   #:+gl-texture5+
   #:+gl-texture6+
   #:+gl-texture7+
   #:+gl-texture8+
   #:+gl-texture9+
   #:+gl-texture-1d+
   #:+gl-texture-2d+
   #:+gl-texture-3d+
   #:+gl-texture-alpha-size+
   #:+gl-texture-base-level+
   #:+gl-texture-binding-1d+
   #:+gl-texture-binding-2d+
   #:+gl-texture-binding-3d+
   #:+gl-texture-bit+
   #:+gl-texture-blue-size+
   #:+gl-texture-border+
   #:+gl-texture-border-color+
   #:+gl-texture-coord-array+
   #:+gl-texture-coord-array-buffer-binding+
   #:+gl-texture-coord-array-pointer+
   #:+gl-texture-coord-array-size+
   #:+gl-texture-coord-array-stride+
   #:+gl-texture-coord-array-type+
   #:+gl-texture-depth+
   #:+gl-texture-env+
   #:+gl-texture-env-color+
   #:+gl-texture-env-mode+
   #:+gl-texture-gen-mode+
   #:+gl-texture-gen-q+
   #:+gl-texture-gen-r+
   #:+gl-texture-gen-s+
   #:+gl-texture-gen-t+
   #:+gl-texture-green-size+
   #:+gl-texture-height+
   #:+gl-texture-intensity-size+
   #:+gl-texture-internal-format+
   #:+gl-texture-luminance-size+
   #:+gl-texture-mag-filter+
   #:+gl-texture-matrix+
   #:+gl-texture-max-level+
   #:+gl-texture-max-lod+
   #:+gl-texture-min-filter+
   #:+gl-texture-min-lod+
   #:+gl-texture-priority+
   #:+gl-texture-red-size+
   #:+gl-texture-resident+
   #:+gl-texture-stack-depth+
   #:+gl-texture-width+
   #:+gl-texture-wrap-r+
   #:+gl-texture-wrap-s+
   #:+gl-texture-wrap-t+
   #:+gl-transform-bit+
   #:+gl-triangles+
   #:+gl-triangle-fan+
   #:+gl-triangle-strip+
   #:+gl-true+
   #:+gl-unpack-alignment+
   #:+gl-unpack-image-height+
   #:+gl-unpack-lsb-first+
   #:+gl-unpack-row-length+
   #:+gl-unpack-skip-images+
   #:+gl-unpack-skip-pixels+
   #:+gl-unpack-skip-rows+
   #:+gl-unpack-swap-bytes+
   #:+gl-unsigned-byte+
   #:+gl-unsigned-byte-2-3-3-rev+
   #:+gl-unsigned-byte-3-3-2+
   #:+gl-unsigned-int+
   #:+gl-unsigned-int-10-10-10-2+
   #:+gl-unsigned-int-2-10-10-10-rev+
   #:+gl-unsigned-int-8-8-8-8+
   #:+gl-unsigned-int-8-8-8-8-rev+
   #:+gl-unsigned-short+
   #:+gl-unsigned-short-1-5-5-5-rev+
   #:+gl-unsigned-short-4-4-4-4+
   #:+gl-unsigned-short-4-4-4-4-rev+
   #:+gl-unsigned-short-5-5-5-1+
   #:+gl-unsigned-short-5-6-5+
   #:+gl-unsigned-short-5-6-5-rev+
   #:+gl-upper-left+
   #:+gl-v2f+
   #:+gl-v3f+
   #:+gl-validate-status+
   #:+gl-vendor+
   #:+gl-version+
   #:+gl-vertex-array+
   #:+gl-vertex-array-buffer-binding+
   #:+gl-vertex-array-pointer+
   #:+gl-vertex-array-size+
   #:+gl-vertex-array-stride+
   #:+gl-vertex-array-type+
   #:+gl-vertex-attrib-array-buffer-binding+
   #:+gl-vertex-attrib-array-enabled+
   #:+gl-vertex-attrib-array-normalized+
   #:+gl-vertex-attrib-array-pointer+
   #:+gl-vertex-attrib-array-size+
   #:+gl-vertex-attrib-array-stride+
   #:+gl-vertex-attrib-array-type+
   #:+gl-vertex-program-point-size+
   #:+gl-vertex-program-two-side+
   #:+gl-vertex-shader+
   #:+gl-viewport+
   #:+gl-viewport-bit+
   #:+gl-weight-array-buffer-binding+
   #:+gl-write-only+
   #:+gl-xor+
   #:+gl-zero+
   #:+gl-zoom-x+
   #:+gl-zoom-y+))

(in-package :opengl)

;;; register the dynamic library
(eval-when (:load-toplevel :execute)
  (let ((dll #+darwin #p"/System/Library/Frameworks/OpenGL.FrameWork/OpenGL"
             #+mswindows #p"c:/Windows/System32/opengl32.dll"))
    (register-module :gl :real-name dll :connection-style :immediate)))

(defun double (n)
  "Coerce a value to a double-float."
  (coerce n 'double-float))

;;; plain old data
(define-c-typedef gl-enum :unsigned-int)
(define-c-typedef gl-boolean :boolean)
(define-c-typedef gl-bitfield :unsigned-int)
(define-c-typedef gl-byte :byte)
(define-c-typedef gl-short :short)
(define-c-typedef gl-int :int)
(define-c-typedef gl-sizei :int)
(define-c-typedef gl-ubyte :unsigned-byte)
(define-c-typedef gl-ushort :unsigned-short)
(define-c-typedef gl-uint :unsigned-int)
(define-c-typedef gl-float (:wrapper :float :lisp-to-foreign float))
(define-c-typedef gl-clampf (:wrapper :float :lisp-to-foreign float))
(define-c-typedef gl-void :void)
(define-c-typedef gl-double (:wrapper :double :lisp-to-foreign double))
(define-c-typedef gl-clampd (:wrapper :double :lisp-to-foreign double))
(define-c-typedef gl-char :char)
(define-c-typedef gl-half :unsigned-short)

;;; pointer types
(define-c-typedef gl-intptr (:pointer gl-int))
(define-c-typedef gl-sizeiptr (:pointer gl-sizei))

;;; constants
(defconstant +gl-2d+ #x0600)
(defconstant +gl-2-bytes+ #x1407)
(defconstant +gl-3d+ #x0601)
(defconstant +gl-3d-color+ #x0602)
(defconstant +gl-3d-color-texture+ #x0603)
(defconstant +gl-3-bytes+ #x1408)
(defconstant +gl-4d-color-texture+ #x0604)
(defconstant +gl-4-bytes+ #x1409)
(defconstant +gl-accum-alpha-bits+ #x0d5b)
(defconstant +gl-accum-blue-bits+ #x0d5a)
(defconstant +gl-accum-buffer-bit+ #x00000200)
(defconstant +gl-accum-clear-value+ #x0b80)
(defconstant +gl-accum-green-bits+ #x0d59)
(defconstant +gl-accum-red-bits+ #x0d58)
(defconstant +gl-active-attributes+ #x8b89)
(defconstant +gl-active-attribute-max-length+ #x8b8a)
(defconstant +gl-active-texture+ #x84e0)
(defconstant +gl-active-uniforms+ #x8b86)
(defconstant +gl-active-uniform-max-length+ #x8b87)
(defconstant +gl-add-signed+ #x8574)
(defconstant +gl-aliased-line-width-range+ #x846e)
(defconstant +gl-aliased-point-size-range+ #x846d)
(defconstant +gl-all-attrib-bits+ #x000fffff)
(defconstant +gl-alpha+ #x1906)
(defconstant +gl-alpha12+ #x803d)
(defconstant +gl-alpha16+ #x803e)
(defconstant +gl-alpha4+ #x803b)
(defconstant +gl-alpha8+ #x803c)
(defconstant +gl-alpha-bias+ #x0d1d)
(defconstant +gl-alpha-bits+ #x0d55)
(defconstant +gl-alpha-scale+ #x0d1c)
(defconstant +gl-alpha-test+ #x0bc0)
(defconstant +gl-alpha-test-func+ #x0bc1)
(defconstant +gl-alpha-test-ref+ #x0bc2)
(defconstant +gl-ambient+ #x1200)
(defconstant +gl-ambient-and-diffuse+ #x1602)
(defconstant +gl-and+ #x1501)
(defconstant +gl-and-inverted+ #x1504)
(defconstant +gl-and-reverse+ #x1502)
(defconstant +gl-array-buffer+ #x8892)
(defconstant +gl-array-buffer-binding+ #x8894)
(defconstant +gl-attached-shaders+ #x8b85)
(defconstant +gl-attrib-stack-depth+ #x0bb0)
(defconstant +gl-auto-normal+ #x0d80)
(defconstant +gl-aux0+ #x0409)
(defconstant +gl-aux1+ #x040a)
(defconstant +gl-aux2+ #x040b)
(defconstant +gl-aux3+ #x040c)
(defconstant +gl-aux-buffers+ #x0c00)
(defconstant +gl-back+ #x0405)
(defconstant +gl-back-left+ #x0402)
(defconstant +gl-back-right+ #x0403)
(defconstant +gl-bgr+ #x80e0)
(defconstant +gl-bgra+ #x80e1)
(defconstant +gl-bitmap+ #x1a00)
(defconstant +gl-bitmap-token+ #x0704)
(defconstant +gl-blend+ #x0be2)
(defconstant +gl-blend-color+ #x8005)
(defconstant +gl-blend-dst+ #x0be0)
(defconstant +gl-blend-equation+ #x8009)
(defconstant +gl-blend-equation-alpha+ #x883d)
(defconstant +gl-blend-equation-rgb+ #x8009)
(defconstant +gl-blend-src+ #x0be1)
(defconstant +gl-blue+ #x1905)
(defconstant +gl-blue-bias+ #x0d1b)
(defconstant +gl-blue-bits+ #x0d54)
(defconstant +gl-blue-scale+ #x0d1a)
(defconstant +gl-bool+ #x8b56)
(defconstant +gl-bool-vec2+ #x8b57)
(defconstant +gl-bool-vec3+ #x8b58)
(defconstant +gl-bool-vec4+ #x8b59)
(defconstant +gl-buffer-access+ #x88bb)
(defconstant +gl-buffer-mapped+ #x88bc)
(defconstant +gl-buffer-map-pointer+ #x88bd)
(defconstant +gl-buffer-size+ #x8764)
(defconstant +gl-buffer-usage+ #x8765)
(defconstant +gl-byte+ #x1400)
(defconstant +gl-c3f-v3f+ #x2a24)
(defconstant +gl-c4f-n3f-v3f+ #x2a26)
(defconstant +gl-c4ub-v2f+ #x2a22)
(defconstant +gl-c4ub-v3f+ #x2a23)
(defconstant +gl-ccw+ #x0901)
(defconstant +gl-clamp+ #x2900)
(defconstant +gl-clamp-to-border+ #x812d)
(defconstant +gl-clamp-to-edge+ #x812f)
(defconstant +gl-clear+ #x1500)
(defconstant +gl-client-active-texture+ #x84e1)
(defconstant +gl-client-all-attrib-bits+ #xffffffff)
(defconstant +gl-client-attrib-stack-depth+ #x0bb1)
(defconstant +gl-client-pixel-store-bit+ #x00000001)
(defconstant +gl-client-vertex-array-bit+ #x00000002)
(defconstant +gl-clip-plane0+ #x3000)
(defconstant +gl-clip-plane1+ #x3001)
(defconstant +gl-clip-plane2+ #x3002)
(defconstant +gl-clip-plane3+ #x3003)
(defconstant +gl-clip-plane4+ #x3004)
(defconstant +gl-clip-plane5+ #x3005)
(defconstant +gl-coeff+ #x0a00)
(defconstant +gl-color+ #x1800)
(defconstant +gl-color-array+ #x8076)
(defconstant +gl-color-array-buffer-binding+ #x8898)
(defconstant +gl-color-array-pointer+ #x8090)
(defconstant +gl-color-array-size+ #x8081)
(defconstant +gl-color-array-stride+ #x8083)
(defconstant +gl-color-array-type+ #x8082)
(defconstant +gl-color-buffer-bit+ #x00004000)
(defconstant +gl-color-clear-value+ #x0c22)
(defconstant +gl-color-index+ #x1900)
(defconstant +gl-color-indexes+ #x1603)
(defconstant +gl-color-logic-op+ #x0bf2)
(defconstant +gl-color-material+ #x0b57)
(defconstant +gl-color-material-face+ #x0b55)
(defconstant +gl-color-material-parameter+ #x0b56)
(defconstant +gl-color-matrix+ #x80b1)
(defconstant +gl-color-matrix-stack-depth+ #x80b2)
(defconstant +gl-color-table+ #x80d0)
(defconstant +gl-color-table-alpha-size+ #x80dd)
(defconstant +gl-color-table-bias+ #x80d7)
(defconstant +gl-color-table-blue-size+ #x80dc)
(defconstant +gl-color-table-format+ #x80d8)
(defconstant +gl-color-table-green-size+ #x80db)
(defconstant +gl-color-table-intensity-size+ #x80df)
(defconstant +gl-color-table-luminance-size+ #x80de)
(defconstant +gl-color-table-red-size+ #x80da)
(defconstant +gl-color-table-scale+ #x80d6)
(defconstant +gl-color-table-width+ #x80d9)
(defconstant +gl-color-writemask+ #x0c23)
(defconstant +gl-combine+ #x8570)
(defconstant +gl-combine-alpha+ #x8572)
(defconstant +gl-combine-rgb+ #x8571)
(defconstant +gl-compile+ #x1300)
(defconstant +gl-compile-and-execute+ #x1301)
(defconstant +gl-compile-status+ #x8b81)
(defconstant +gl-compressed-sluminance+ #x8c4a)
(defconstant +gl-compressed-sluminance-alpha+ #x8c4b)
(defconstant +gl-compressed-srgb+ #x8c48)
(defconstant +gl-compressed-srgb-alpha+ #x8c49)
(defconstant +gl-constant+ #x8576)
(defconstant +gl-constant-alpha+ #x8003)
(defconstant +gl-constant-attenuation+ #x1207)
(defconstant +gl-constant-border+ #x8151)
(defconstant +gl-constant-color+ #x8001)
(defconstant +gl-convolution-1d+ #x8010)
(defconstant +gl-convolution-2d+ #x8011)
(defconstant +gl-convolution-border-color+ #x8154)
(defconstant +gl-convolution-border-mode+ #x8013)
(defconstant +gl-convolution-filter-bias+ #x8015)
(defconstant +gl-convolution-filter-scale+ #x8014)
(defconstant +gl-convolution-format+ #x8017)
(defconstant +gl-convolution-height+ #x8019)
(defconstant +gl-convolution-width+ #x8018)
(defconstant +gl-coord-replace+ #x8862)
(defconstant +gl-copy+ #x1503)
(defconstant +gl-copy-inverted+ #x150c)
(defconstant +gl-copy-pixel-token+ #x0706)
(defconstant +gl-cull-face+ #x0b44)
(defconstant +gl-cull-face-mode+ #x0b45)
(defconstant +gl-current-bit+ #x00000001)
(defconstant +gl-current-color+ #x0b00)
(defconstant +gl-current-fog-coord+ #x8453)
(defconstant +gl-current-index+ #x0b01)
(defconstant +gl-current-normal+ #x0b02)
(defconstant +gl-current-program+ #x8b8d)
(defconstant +gl-current-query+ #x8865)
(defconstant +gl-current-raster-color+ #x0b04)
(defconstant +gl-current-raster-distance+ #x0b09)
(defconstant +gl-current-raster-index+ #x0b05)
(defconstant +gl-current-raster-position+ #x0b07)
(defconstant +gl-current-raster-position-valid+ #x0b08)
(defconstant +gl-current-raster-secondary-color+ #x845f)
(defconstant +gl-current-raster-texture-coords+ #x0b06)
(defconstant +gl-current-texture-coords+ #x0b03)
(defconstant +gl-current-vertex-attrib+ #x8626)
(defconstant +gl-cw+ #x0900)
(defconstant +gl-decal+ #x2101)
(defconstant +gl-decr+ #x1e03)
(defconstant +gl-delete-status+ #x8b80)
(defconstant +gl-depth+ #x1801)
(defconstant +gl-depth-bias+ #x0d1f)
(defconstant +gl-depth-bits+ #x0d56)
(defconstant +gl-depth-buffer-bit+ #x00000100)
(defconstant +gl-depth-clear-value+ #x0b73)
(defconstant +gl-depth-component+ #x1902)
(defconstant +gl-depth-func+ #x0b74)
(defconstant +gl-depth-range+ #x0b70)
(defconstant +gl-depth-scale+ #x0d1e)
(defconstant +gl-depth-test+ #x0b71)
(defconstant +gl-depth-writemask+ #x0b72)
(defconstant +gl-diffuse+ #x1201)
(defconstant +gl-dither+ #x0bd0)
(defconstant +gl-domain+ #x0a02)
(defconstant +gl-dont-care+ #x1100)
(defconstant +gl-double+ #x140a)
(defconstant +gl-doublebuffer+ #x0c32)
(defconstant +gl-draw-buffer+ #x0c01)
(defconstant +gl-draw-buffer0+ #x8825)
(defconstant +gl-draw-buffer1+ #x8826)
(defconstant +gl-draw-buffer10+ #x882f)
(defconstant +gl-draw-buffer11+ #x8830)
(defconstant +gl-draw-buffer12+ #x8831)
(defconstant +gl-draw-buffer13+ #x8832)
(defconstant +gl-draw-buffer14+ #x8833)
(defconstant +gl-draw-buffer15+ #x8834)
(defconstant +gl-draw-buffer2+ #x8827)
(defconstant +gl-draw-buffer3+ #x8828)
(defconstant +gl-draw-buffer4+ #x8829)
(defconstant +gl-draw-buffer5+ #x882a)
(defconstant +gl-draw-buffer6+ #x882b)
(defconstant +gl-draw-buffer7+ #x882c)
(defconstant +gl-draw-buffer8+ #x882d)
(defconstant +gl-draw-buffer9+ #x882e)
(defconstant +gl-draw-pixel-token+ #x0705)
(defconstant +gl-dst-alpha+ #x0304)
(defconstant +gl-dst-color+ #x0306)
(defconstant +gl-dynamic-copy+ #x88ea)
(defconstant +gl-dynamic-draw+ #x88e8)
(defconstant +gl-dynamic-read+ #x88e9)
(defconstant +gl-edge-flag+ #x0b43)
(defconstant +gl-edge-flag-array+ #x8079)
(defconstant +gl-edge-flag-array-buffer-binding+ #x889b)
(defconstant +gl-edge-flag-array-pointer+ #x8093)
(defconstant +gl-edge-flag-array-stride+ #x808c)
(defconstant +gl-element-array-buffer+ #x8893)
(defconstant +gl-element-array-buffer-binding+ #x8895)
(defconstant +gl-emission+ #x1600)
(defconstant +gl-enable-bit+ #x00002000)
(defconstant +gl-equiv+ #x1509)
(defconstant +gl-eval-bit+ #x00010000)
(defconstant +gl-exp+ #x0800)
(defconstant +gl-exp2+ #x0801)
(defconstant +gl-extensions+ #x1f03)
(defconstant +gl-eye-linear+ #x2400)
(defconstant +gl-eye-plane+ #x2502)
(defconstant +gl-false+ 0)
(defconstant +gl-fastest+ #x1101)
(defconstant +gl-feedback+ #x1c01)
(defconstant +gl-feedback-buffer-pointer+ #x0df0)
(defconstant +gl-feedback-buffer-size+ #x0df1)
(defconstant +gl-feedback-buffer-type+ #x0df2)
(defconstant +gl-fill+ #x1b02)
(defconstant +gl-flat+ #x1d00)
(defconstant +gl-float+ #x1406)
(defconstant +gl-float-mat2+ #x8b5a)
(defconstant +gl-float-mat2x3+ #x8b65)
(defconstant +gl-float-mat2x4+ #x8b66)
(defconstant +gl-float-mat3+ #x8b5b)
(defconstant +gl-float-mat3x2+ #x8b67)
(defconstant +gl-float-mat3x4+ #x8b68)
(defconstant +gl-float-mat4+ #x8b5c)
(defconstant +gl-float-mat4x2+ #x8b69)
(defconstant +gl-float-mat4x3+ #x8b6a)
(defconstant +gl-float-vec2+ #x8b50)
(defconstant +gl-float-vec3+ #x8b51)
(defconstant +gl-float-vec4+ #x8b52)
(defconstant +gl-fog+ #x0b60)
(defconstant +gl-fog-bit+ #x00000080)
(defconstant +gl-fog-color+ #x0b66)
(defconstant +gl-fog-coord+ #x8451)
(defconstant +gl-fog-coord-array+ #x8457)
(defconstant +gl-fog-coord-array-buffer-binding+ #x889d)
(defconstant +gl-fog-coord-array-pointer+ #x8456)
(defconstant +gl-fog-coord-array-stride+ #x8455)
(defconstant +gl-fog-coord-array-type+ #x8454)
(defconstant +gl-fog-coord-src+ #x8450)
(defconstant +gl-fog-density+ #x0b62)
(defconstant +gl-fog-end+ #x0b64)
(defconstant +gl-fog-hint+ #x0c54)
(defconstant +gl-fog-index+ #x0b61)
(defconstant +gl-fog-mode+ #x0b65)
(defconstant +gl-fog-start+ #x0b63)
(defconstant +gl-fragment-depth+ #x8452)
(defconstant +gl-fragment-shader+ #x8b30)
(defconstant +gl-fragment-shader-derivative-hint+ #x8b8b)
(defconstant +gl-front+ #x0404)
(defconstant +gl-front-and-back+ #x0408)
(defconstant +gl-front-face+ #x0b46)
(defconstant +gl-front-left+ #x0400)
(defconstant +gl-front-right+ #x0401)
(defconstant +gl-func-add+ #x8006)
(defconstant +gl-func-reverse-subtract+ #x800b)
(defconstant +gl-func-subtract+ #x800a)
(defconstant +gl-green+ #x1904)
(defconstant +gl-green-bias+ #x0d19)
(defconstant +gl-green-bits+ #x0d53)
(defconstant +gl-green-scale+ #x0d18)
(defconstant +gl-hint-bit+ #x00008000)
(defconstant +gl-histogram+ #x8024)
(defconstant +gl-histogram-alpha-size+ #x802b)
(defconstant +gl-histogram-blue-size+ #x802a)
(defconstant +gl-histogram-format+ #x8027)
(defconstant +gl-histogram-green-size+ #x8029)
(defconstant +gl-histogram-luminance-size+ #x802c)
(defconstant +gl-histogram-red-size+ #x8028)
(defconstant +gl-histogram-sink+ #x802d)
(defconstant +gl-histogram-width+ #x8026)
(defconstant +gl-incr+ #x1e02)
(defconstant +gl-index-array+ #x8077)
(defconstant +gl-index-array-buffer-binding+ #x8899)
(defconstant +gl-index-array-pointer+ #x8091)
(defconstant +gl-index-array-stride+ #x8086)
(defconstant +gl-index-array-type+ #x8085)
(defconstant +gl-index-bits+ #x0d51)
(defconstant +gl-index-clear-value+ #x0c20)
(defconstant +gl-index-logic-op+ #x0bf1)
(defconstant +gl-index-mode+ #x0c30)
(defconstant +gl-index-offset+ #x0d13)
(defconstant +gl-index-shift+ #x0d12)
(defconstant +gl-index-writemask+ #x0c21)
(defconstant +gl-info-log-length+ #x8b84)
(defconstant +gl-int+ #x1404)
(defconstant +gl-intensity+ #x8049)
(defconstant +gl-intensity12+ #x804c)
(defconstant +gl-intensity16+ #x804d)
(defconstant +gl-intensity4+ #x804a)
(defconstant +gl-intensity8+ #x804b)
(defconstant +gl-interpolate+ #x8575)
(defconstant +gl-int-vec2+ #x8b53)
(defconstant +gl-int-vec3+ #x8b54)
(defconstant +gl-int-vec4+ #x8b55)
(defconstant +gl-invalid-enum+ #x0500)
(defconstant +gl-invalid-operation+ #x0502)
(defconstant +gl-invalid-value+ #x0501)
(defconstant +gl-invert+ #x150a)
(defconstant +gl-keep+ #x1e00)
(defconstant +gl-left+ #x0406)
(defconstant +gl-light0+ #x4000)
(defconstant +gl-light1+ #x4001)
(defconstant +gl-light2+ #x4002)
(defconstant +gl-light3+ #x4003)
(defconstant +gl-light4+ #x4004)
(defconstant +gl-light5+ #x4005)
(defconstant +gl-light6+ #x4006)
(defconstant +gl-light7+ #x4007)
(defconstant +gl-lighting+ #x0b50)
(defconstant +gl-lighting-bit+ #x00000040)
(defconstant +gl-light-model-ambient+ #x0b53)
(defconstant +gl-light-model-color-control+ #x81f8)
(defconstant +gl-light-model-local-viewer+ #x0b51)
(defconstant +gl-light-model-two-side+ #x0b52)
(defconstant +gl-line+ #x1b01)
(defconstant +gl-linear+ #x2601)
(defconstant +gl-linear-attenuation+ #x1208)
(defconstant +gl-linear-mipmap-linear+ #x2703)
(defconstant +gl-linear-mipmap-nearest+ #x2701)
(defconstant +gl-lines+ #x0001)
(defconstant +gl-line-bit+ #x00000004)
(defconstant +gl-line-loop+ #x0002)
(defconstant +gl-line-reset-token+ #x0707)
(defconstant +gl-line-smooth+ #x0b20)
(defconstant +gl-line-smooth-hint+ #x0c52)
(defconstant +gl-line-stipple+ #x0b24)
(defconstant +gl-line-stipple-pattern+ #x0b25)
(defconstant +gl-line-stipple-repeat+ #x0b26)
(defconstant +gl-line-strip+ #x0003)
(defconstant +gl-line-token+ #x0702)
(defconstant +gl-line-width+ #x0b21)
(defconstant +gl-line-width-granularity+ #x0b23)
(defconstant +gl-line-width-range+ #x0b22)
(defconstant +gl-link-status+ #x8b82)
(defconstant +gl-list-base+ #x0b32)
(defconstant +gl-list-bit+ #x00020000)
(defconstant +gl-list-index+ #x0b33)
(defconstant +gl-list-mode+ #x0b30)
(defconstant +gl-logic-op-mode+ #x0bf0)
(defconstant +gl-lower-left+ #x8ca1)
(defconstant +gl-luminance+ #x1909)
(defconstant +gl-luminance12+ #x8041)
(defconstant +gl-luminance12-alpha12+ #x8047)
(defconstant +gl-luminance12-alpha4+ #x8046)
(defconstant +gl-luminance16+ #x8042)
(defconstant +gl-luminance16-alpha16+ #x8048)
(defconstant +gl-luminance4+ #x803f)
(defconstant +gl-luminance4-alpha4+ #x8043)
(defconstant +gl-luminance6-alpha2+ #x8044)
(defconstant +gl-luminance8+ #x8040)
(defconstant +gl-luminance8-alpha8+ #x8045)
(defconstant +gl-luminance-alpha+ #x190a)
(defconstant +gl-map1-color-4+ #x0d90)
(defconstant +gl-map1-grid-domain+ #x0dd0)
(defconstant +gl-map1-grid-segments+ #x0dd1)
(defconstant +gl-map1-index+ #x0d91)
(defconstant +gl-map1-normal+ #x0d92)
(defconstant +gl-map1-texture-coord-1+ #x0d93)
(defconstant +gl-map1-texture-coord-2+ #x0d94)
(defconstant +gl-map1-texture-coord-3+ #x0d95)
(defconstant +gl-map1-texture-coord-4+ #x0d96)
(defconstant +gl-map1-vertex-3+ #x0d97)
(defconstant +gl-map1-vertex-4+ #x0d98)
(defconstant +gl-map2-color-4+ #x0db0)
(defconstant +gl-map2-grid-domain+ #x0dd2)
(defconstant +gl-map2-grid-segments+ #x0dd3)
(defconstant +gl-map2-index+ #x0db1)
(defconstant +gl-map2-normal+ #x0db2)
(defconstant +gl-map2-texture-coord-1+ #x0db3)
(defconstant +gl-map2-texture-coord-2+ #x0db4)
(defconstant +gl-map2-texture-coord-3+ #x0db5)
(defconstant +gl-map2-texture-coord-4+ #x0db6)
(defconstant +gl-map2-vertex-3+ #x0db7)
(defconstant +gl-map2-vertex-4+ #x0db8)
(defconstant +gl-map-color+ #x0d10)
(defconstant +gl-map-stencil+ #x0d11)
(defconstant +gl-matrix-mode+ #x0ba0)
(defconstant +gl-max+ #x8008)
(defconstant +gl-max-3d-texture-size+ #x8073)
(defconstant +gl-max-attrib-stack-depth+ #x0d35)
(defconstant +gl-max-client-attrib-stack-depth+ #x0d3b)
(defconstant +gl-max-clip-planes+ #x0d32)
(defconstant +gl-max-color-matrix-stack-depth+ #x80b3)
(defconstant +gl-max-combined-texture-image-units+ #x8b4d)
(defconstant +gl-max-convolution-height+ #x801b)
(defconstant +gl-max-convolution-width+ #x801a)
(defconstant +gl-max-draw-buffers+ #x8824)
(defconstant +gl-max-elements-indices+ #x80e9)
(defconstant +gl-max-elements-vertices+ #x80e8)
(defconstant +gl-max-eval-order+ #x0d30)
(defconstant +gl-max-fragment-uniform-components+ #x8b49)
(defconstant +gl-max-lights+ #x0d31)
(defconstant +gl-max-list-nesting+ #x0b31)
(defconstant +gl-max-modelview-stack-depth+ #x0d36)
(defconstant +gl-max-name-stack-depth+ #x0d37)
(defconstant +gl-max-pixel-map-table+ #x0d34)
(defconstant +gl-max-projection-stack-depth+ #x0d38)
(defconstant +gl-max-texture-coords+ #x8871)
(defconstant +gl-max-texture-image-units+ #x8872)
(defconstant +gl-max-texture-size+ #x0d33)
(defconstant +gl-max-texture-stack-depth+ #x0d39)
(defconstant +gl-max-texture-units+ #x84e2)
(defconstant +gl-max-varying-floats+ #x8b4b)
(defconstant +gl-max-vertex-attribs+ #x8869)
(defconstant +gl-max-vertex-texture-image-units+ #x8b4c)
(defconstant +gl-max-vertex-uniform-components+ #x8b4a)
(defconstant +gl-max-viewport-dims+ #x0d3a)
(defconstant +gl-min+ #x8007)
(defconstant +gl-minmax+ #x802e)
(defconstant +gl-minmax-format+ #x802f)
(defconstant +gl-minmax-sink+ #x8030)
(defconstant +gl-modelview+ #x1700)
(defconstant +gl-modelview-matrix+ #x0ba6)
(defconstant +gl-modelview-stack-depth+ #x0ba3)
(defconstant +gl-modulate+ #x2100)
(defconstant +gl-n3f-v3f+ #x2a25)
(defconstant +gl-name-stack-depth+ #x0d70)
(defconstant +gl-nand+ #x150e)
(defconstant +gl-nearest+ #x2600)
(defconstant +gl-nearest-mipmap-linear+ #x2702)
(defconstant +gl-nearest-mipmap-nearest+ #x2700)
(defconstant +gl-nicest+ #x1102)
(defconstant +gl-none+ 0)
(defconstant +gl-noop+ #x1505)
(defconstant +gl-nor+ #x1508)
(defconstant +gl-normalize+ #x0ba1)
(defconstant +gl-normal-array+ #x8075)
(defconstant +gl-normal-array-buffer-binding+ #x8897)
(defconstant +gl-normal-array-pointer+ #x808f)
(defconstant +gl-normal-array-stride+ #x807f)
(defconstant +gl-normal-array-type+ #x807e)
(defconstant +gl-no-error+ 0)
(defconstant +gl-object-linear+ #x2401)
(defconstant +gl-object-plane+ #x2501)
(defconstant +gl-one+ 1)
(defconstant +gl-one-minus-constant-alpha+ #x8004)
(defconstant +gl-one-minus-constant-color+ #x8002)
(defconstant +gl-one-minus-dst-alpha+ #x0305)
(defconstant +gl-one-minus-dst-color+ #x0307)
(defconstant +gl-one-minus-src-alpha+ #x0303)
(defconstant +gl-one-minus-src-color+ #x0301)
(defconstant +gl-or+ #x1507)
(defconstant +gl-order+ #x0a01)
(defconstant +gl-or-inverted+ #x150d)
(defconstant +gl-or-reverse+ #x150b)
(defconstant +gl-out-of-memory+ #x0505)
(defconstant +gl-pack-alignment+ #x0d05)
(defconstant +gl-pack-image-height+ #x806c)
(defconstant +gl-pack-lsb-first+ #x0d01)
(defconstant +gl-pack-row-length+ #x0d02)
(defconstant +gl-pack-skip-images+ #x806b)
(defconstant +gl-pack-skip-pixels+ #x0d04)
(defconstant +gl-pack-skip-rows+ #x0d03)
(defconstant +gl-pack-swap-bytes+ #x0d00)
(defconstant +gl-pass-through-token+ #x0700)
(defconstant +gl-perspective-correction-hint+ #x0c50)
(defconstant +gl-pixel-map-a-to-a+ #x0c79)
(defconstant +gl-pixel-map-a-to-a-size+ #x0cb9)
(defconstant +gl-pixel-map-b-to-b+ #x0c78)
(defconstant +gl-pixel-map-b-to-b-size+ #x0cb8)
(defconstant +gl-pixel-map-g-to-g+ #x0c77)
(defconstant +gl-pixel-map-g-to-g-size+ #x0cb7)
(defconstant +gl-pixel-map-i-to-a+ #x0c75)
(defconstant +gl-pixel-map-i-to-a-size+ #x0cb5)
(defconstant +gl-pixel-map-i-to-b+ #x0c74)
(defconstant +gl-pixel-map-i-to-b-size+ #x0cb4)
(defconstant +gl-pixel-map-i-to-g+ #x0c73)
(defconstant +gl-pixel-map-i-to-g-size+ #x0cb3)
(defconstant +gl-pixel-map-i-to-i+ #x0c70)
(defconstant +gl-pixel-map-i-to-i-size+ #x0cb0)
(defconstant +gl-pixel-map-i-to-r+ #x0c72)
(defconstant +gl-pixel-map-i-to-r-size+ #x0cb2)
(defconstant +gl-pixel-map-r-to-r+ #x0c76)
(defconstant +gl-pixel-map-r-to-r-size+ #x0cb6)
(defconstant +gl-pixel-map-s-to-s+ #x0c71)
(defconstant +gl-pixel-map-s-to-s-size+ #x0cb1)
(defconstant +gl-pixel-mode-bit+ #x00000020)
(defconstant +gl-pixel-pack-buffer+ #x88eb)
(defconstant +gl-pixel-pack-buffer-binding+ #x88ed)
(defconstant +gl-pixel-unpack-buffer+ #x88ec)
(defconstant +gl-pixel-unpack-buffer-binding+ #x88ef)
(defconstant +gl-point+ #x1b00)
(defconstant +gl-points+ #x0000)
(defconstant +gl-point-bit+ #x00000002)
(defconstant +gl-point-size+ #x0b11)
(defconstant +gl-point-size-granularity+ #x0b13)
(defconstant +gl-point-size-range+ #x0b12)
(defconstant +gl-point-smooth+ #x0b10)
(defconstant +gl-point-smooth-hint+ #x0c51)
(defconstant +gl-point-sprite+ #x8861)
(defconstant +gl-point-sprite-coord-origin+ #x8ca0)
(defconstant +gl-point-token+ #x0701)
(defconstant +gl-polygon+ #x0009)
(defconstant +gl-polygon-bit+ #x00000008)
(defconstant +gl-polygon-mode+ #x0b40)
(defconstant +gl-polygon-offset-factor+ #x8038)
(defconstant +gl-polygon-offset-fill+ #x8037)
(defconstant +gl-polygon-offset-line+ #x2a02)
(defconstant +gl-polygon-offset-point+ #x2a01)
(defconstant +gl-polygon-offset-units+ #x2a00)
(defconstant +gl-polygon-smooth+ #x0b41)
(defconstant +gl-polygon-smooth-hint+ #x0c53)
(defconstant +gl-polygon-stipple+ #x0b42)
(defconstant +gl-polygon-stipple-bit+ #x00000010)
(defconstant +gl-polygon-token+ #x0703)
(defconstant +gl-position+ #x1203)
(defconstant +gl-post-color-matrix-alpha-bias+ #x80bb)
(defconstant +gl-post-color-matrix-alpha-scale+ #x80b7)
(defconstant +gl-post-color-matrix-blue-bias+ #x80ba)
(defconstant +gl-post-color-matrix-blue-scale+ #x80b6)
(defconstant +gl-post-color-matrix-color-table+ #x80d2)
(defconstant +gl-post-color-matrix-green-bias+ #x80b9)
(defconstant +gl-post-color-matrix-green-scale+ #x80b5)
(defconstant +gl-post-color-matrix-red-bias+ #x80b8)
(defconstant +gl-post-color-matrix-red-scale+ #x80b4)
(defconstant +gl-post-convolution-alpha-bias+ #x8023)
(defconstant +gl-post-convolution-alpha-scale+ #x801f)
(defconstant +gl-post-convolution-blue-bias+ #x8022)
(defconstant +gl-post-convolution-blue-scale+ #x801e)
(defconstant +gl-post-convolution-color-table+ #x80d1)
(defconstant +gl-post-convolution-green-bias+ #x8021)
(defconstant +gl-post-convolution-green-scale+ #x801d)
(defconstant +gl-post-convolution-red-bias+ #x8020)
(defconstant +gl-post-convolution-red-scale+ #x801c)
(defconstant +gl-previous+ #x8578)
(defconstant +gl-primary-color+ #x8577)
(defconstant +gl-projection+ #x1701)
(defconstant +gl-projection-matrix+ #x0ba7)
(defconstant +gl-projection-stack-depth+ #x0ba4)
(defconstant +gl-proxy-color-table+ #x80d3)
(defconstant +gl-proxy-histogram+ #x8025)
(defconstant +gl-proxy-post-color-matrix-color-table+ #x80d5)
(defconstant +gl-proxy-post-convolution-color-table+ #x80d4)
(defconstant +gl-proxy-texture-1d+ #x8063)
(defconstant +gl-proxy-texture-2d+ #x8064)
(defconstant +gl-proxy-texture-3d+ #x8070)
(defconstant +gl-q+ #x2003)
(defconstant +gl-quadratic-attenuation+ #x1209)
(defconstant +gl-quads+ #x0007)
(defconstant +gl-quad-strip+ #x0008)
(defconstant +gl-query-counter-bits+ #x8864)
(defconstant +gl-query-result+ #x8866)
(defconstant +gl-query-result-available+ #x8867)
(defconstant +gl-r+ #x2002)
(defconstant +gl-r3-g3-b2+ #x2a10)
(defconstant +gl-read-buffer+ #x0c02)
(defconstant +gl-read-only+ #x88b8)
(defconstant +gl-read-write+ #x88ba)
(defconstant +gl-red+ #x1903)
(defconstant +gl-reduce+ #x8016)
(defconstant +gl-red-bias+ #x0d15)
(defconstant +gl-red-bits+ #x0d52)
(defconstant +gl-red-scale+ #x0d14)
(defconstant +gl-render+ #x1c00)
(defconstant +gl-renderer+ #x1f01)
(defconstant +gl-render-mode+ #x0c40)
(defconstant +gl-repeat+ #x2901)
(defconstant +gl-replace+ #x1e01)
(defconstant +gl-replicate-border+ #x8153)
(defconstant +gl-rescale-normal+ #x803a)
(defconstant +gl-rgb+ #x1907)
(defconstant +gl-rgb10+ #x8052)
(defconstant +gl-rgb10-a2+ #x8059)
(defconstant +gl-rgb12+ #x8053)
(defconstant +gl-rgb16+ #x8054)
(defconstant +gl-rgb4+ #x804f)
(defconstant +gl-rgb5+ #x8050)
(defconstant +gl-rgb5-a1+ #x8057)
(defconstant +gl-rgb8+ #x8051)
(defconstant +gl-rgba+ #x1908)
(defconstant +gl-rgba12+ #x805a)
(defconstant +gl-rgba16+ #x805b)
(defconstant +gl-rgba2+ #x8055)
(defconstant +gl-rgba4+ #x8056)
(defconstant +gl-rgba8+ #x8058)
(defconstant +gl-rgba-mode+ #x0c31)
(defconstant +gl-rgb-scale+ #x8573)
(defconstant +gl-right+ #x0407)
(defconstant +gl-s+ #x2000)
(defconstant +gl-sampler-1d+ #x8b5d)
(defconstant +gl-sampler-1d-shadow+ #x8b61)
(defconstant +gl-sampler-2d+ #x8b5e)
(defconstant +gl-sampler-2d-shadow+ #x8b62)
(defconstant +gl-sampler-3d+ #x8b5f)
(defconstant +gl-sampler-cube+ #x8b60)
(defconstant +gl-samples-passed+ #x8914)
(defconstant +gl-scissor-bit+ #x00080000)
(defconstant +gl-scissor-box+ #x0c10)
(defconstant +gl-scissor-test+ #x0c11)
(defconstant +gl-secondary-color-array-buffer-binding+ #x889c)
(defconstant +gl-select+ #x1c02)
(defconstant +gl-selection-buffer-pointer+ #x0df3)
(defconstant +gl-selection-buffer-size+ #x0df4)
(defconstant +gl-separable-2d+ #x8012)
(defconstant +gl-separate-specular-color+ #x81fa)
(defconstant +gl-set+ #x150f)
(defconstant +gl-shader-source-length+ #x8b88)
(defconstant +gl-shader-type+ #x8b4f)
(defconstant +gl-shade-model+ #x0b54)
(defconstant +gl-shading-language-version+ #x8b8c)
(defconstant +gl-shininess+ #x1601)
(defconstant +gl-short+ #x1402)
(defconstant +gl-single-color+ #x81f9)
(defconstant +gl-sluminance+ #x8c46)
(defconstant +gl-sluminance8+ #x8c47)
(defconstant +gl-sluminance8-alpha8+ #x8c45)
(defconstant +gl-sluminance-alpha+ #x8c44)
(defconstant +gl-smooth+ #x1d01)
(defconstant +gl-smooth-line-width-granularity+ #x0b23)
(defconstant +gl-smooth-line-width-range+ #x0b22)
(defconstant +gl-smooth-point-size-granularity+ #x0b13)
(defconstant +gl-smooth-point-size-range+ #x0b12)
(defconstant +gl-specular+ #x1202)
(defconstant +gl-sphere-map+ #x2402)
(defconstant +gl-spot-cutoff+ #x1206)
(defconstant +gl-spot-direction+ #x1204)
(defconstant +gl-spot-exponent+ #x1205)
(defconstant +gl-src0-alpha+ #x8588)
(defconstant +gl-src0-rgb+ #x8580)
(defconstant +gl-src1-alpha+ #x8589)
(defconstant +gl-src1-rgb+ #x8581)
(defconstant +gl-src2-alpha+ #x858a)
(defconstant +gl-src2-rgb+ #x8582)
(defconstant +gl-src-alpha+ #x0302)
(defconstant +gl-src-alpha-saturate+ #x0308)
(defconstant +gl-src-color+ #x0300)
(defconstant +gl-srgb+ #x8c40)
(defconstant +gl-srgb8+ #x8c41)
(defconstant +gl-srgb8-alpha8+ #x8c43)
(defconstant +gl-srgb-alpha+ #x8c42)
(defconstant +gl-stack-overflow+ #x0503)
(defconstant +gl-stack-underflow+ #x0504)
(defconstant +gl-static-copy+ #x88e6)
(defconstant +gl-static-draw+ #x88e4)
(defconstant +gl-static-read+ #x88e5)
(defconstant +gl-stencil+ #x1802)
(defconstant +gl-stencil-back-fail+ #x8801)
(defconstant +gl-stencil-back-func+ #x8800)
(defconstant +gl-stencil-back-pass-depth-fail+ #x8802)
(defconstant +gl-stencil-back-pass-depth-pass+ #x8803)
(defconstant +gl-stencil-back-ref+ #x8ca3)
(defconstant +gl-stencil-back-value-mask+ #x8ca4)
(defconstant +gl-stencil-back-writemask+ #x8ca5)
(defconstant +gl-stencil-bits+ #x0d57)
(defconstant +gl-stencil-buffer-bit+ #x00000400)
(defconstant +gl-stencil-clear-value+ #x0b91)
(defconstant +gl-stencil-fail+ #x0b94)
(defconstant +gl-stencil-func+ #x0b92)
(defconstant +gl-stencil-index+ #x1901)
(defconstant +gl-stencil-pass-depth-fail+ #x0b95)
(defconstant +gl-stencil-pass-depth-pass+ #x0b96)
(defconstant +gl-stencil-ref+ #x0b97)
(defconstant +gl-stencil-test+ #x0b90)
(defconstant +gl-stencil-value-mask+ #x0b93)
(defconstant +gl-stencil-writemask+ #x0b98)
(defconstant +gl-stereo+ #x0c33)
(defconstant +gl-stream-copy+ #x88e2)
(defconstant +gl-stream-draw+ #x88e0)
(defconstant +gl-stream-read+ #x88e1)
(defconstant +gl-subpixel-bits+ #x0d50)
(defconstant +gl-subtract+ #x84e7)
(defconstant +gl-t+ #x2001)
(defconstant +gl-t2f-c3f-v3f+ #x2a2a)
(defconstant +gl-t2f-c4f-n3f-v3f+ #x2a2c)
(defconstant +gl-t2f-c4ub-v3f+ #x2a29)
(defconstant +gl-t2f-n3f-v3f+ #x2a2b)
(defconstant +gl-t2f-v3f+ #x2a27)
(defconstant +gl-t4f-c4f-n3f-v4f+ #x2a2d)
(defconstant +gl-t4f-v4f+ #x2a28)
(defconstant +gl-table-too-large+ #x8031)
(defconstant +gl-texture+ #x1702)
(defconstant +gl-texture0+ #x84c0)
(defconstant +gl-texture1+ #x84c1)
(defconstant +gl-texture10+ #x84ca)
(defconstant +gl-texture11+ #x84cb)
(defconstant +gl-texture12+ #x84cc)
(defconstant +gl-texture13+ #x84cd)
(defconstant +gl-texture14+ #x84ce)
(defconstant +gl-texture15+ #x84cf)
(defconstant +gl-texture16+ #x84d0)
(defconstant +gl-texture17+ #x84d1)
(defconstant +gl-texture18+ #x84d2)
(defconstant +gl-texture19+ #x84d3)
(defconstant +gl-texture2+ #x84c2)
(defconstant +gl-texture20+ #x84d4)
(defconstant +gl-texture21+ #x84d5)
(defconstant +gl-texture22+ #x84d6)
(defconstant +gl-texture23+ #x84d7)
(defconstant +gl-texture24+ #x84d8)
(defconstant +gl-texture25+ #x84d9)
(defconstant +gl-texture26+ #x84da)
(defconstant +gl-texture27+ #x84db)
(defconstant +gl-texture28+ #x84dc)
(defconstant +gl-texture29+ #x84dd)
(defconstant +gl-texture3+ #x84c3)
(defconstant +gl-texture30+ #x84de)
(defconstant +gl-texture31+ #x84df)
(defconstant +gl-texture4+ #x84c4)
(defconstant +gl-texture5+ #x84c5)
(defconstant +gl-texture6+ #x84c6)
(defconstant +gl-texture7+ #x84c7)
(defconstant +gl-texture8+ #x84c8)
(defconstant +gl-texture9+ #x84c9)
(defconstant +gl-texture-1d+ #x0de0)
(defconstant +gl-texture-2d+ #x0de1)
(defconstant +gl-texture-3d+ #x806f)
(defconstant +gl-texture-alpha-size+ #x805f)
(defconstant +gl-texture-base-level+ #x813c)
(defconstant +gl-texture-binding-1d+ #x8068)
(defconstant +gl-texture-binding-2d+ #x8069)
(defconstant +gl-texture-binding-3d+ #x806a)
(defconstant +gl-texture-bit+ #x00040000)
(defconstant +gl-texture-blue-size+ #x805e)
(defconstant +gl-texture-border+ #x1005)
(defconstant +gl-texture-border-color+ #x1004)
(defconstant +gl-texture-coord-array+ #x8078)
(defconstant +gl-texture-coord-array-buffer-binding+ #x889a)
(defconstant +gl-texture-coord-array-pointer+ #x8092)
(defconstant +gl-texture-coord-array-size+ #x8088)
(defconstant +gl-texture-coord-array-stride+ #x808a)
(defconstant +gl-texture-coord-array-type+ #x8089)
(defconstant +gl-texture-depth+ #x8071)
(defconstant +gl-texture-env+ #x2300)
(defconstant +gl-texture-env-color+ #x2201)
(defconstant +gl-texture-env-mode+ #x2200)
(defconstant +gl-texture-gen-mode+ #x2500)
(defconstant +gl-texture-gen-q+ #x0c63)
(defconstant +gl-texture-gen-r+ #x0c62)
(defconstant +gl-texture-gen-s+ #x0c60)
(defconstant +gl-texture-gen-t+ #x0c61)
(defconstant +gl-texture-green-size+ #x805d)
(defconstant +gl-texture-height+ #x1001)
(defconstant +gl-texture-intensity-size+ #x8061)
(defconstant +gl-texture-internal-format+ #x1003)
(defconstant +gl-texture-luminance-size+ #x8060)
(defconstant +gl-texture-mag-filter+ #x2800)
(defconstant +gl-texture-matrix+ #x0ba8)
(defconstant +gl-texture-max-level+ #x813d)
(defconstant +gl-texture-max-lod+ #x813b)
(defconstant +gl-texture-min-filter+ #x2801)
(defconstant +gl-texture-min-lod+ #x813a)
(defconstant +gl-texture-priority+ #x8066)
(defconstant +gl-texture-red-size+ #x805c)
(defconstant +gl-texture-resident+ #x8067)
(defconstant +gl-texture-stack-depth+ #x0ba5)
(defconstant +gl-texture-width+ #x1000)
(defconstant +gl-texture-wrap-r+ #x8072)
(defconstant +gl-texture-wrap-s+ #x2802)
(defconstant +gl-texture-wrap-t+ #x2803)
(defconstant +gl-transform-bit+ #x00001000)
(defconstant +gl-triangles+ #x0004)
(defconstant +gl-triangle-fan+ #x0006)
(defconstant +gl-triangle-strip+ #x0005)
(defconstant +gl-true+ 1)
(defconstant +gl-unpack-alignment+ #x0cf5)
(defconstant +gl-unpack-image-height+ #x806e)
(defconstant +gl-unpack-lsb-first+ #x0cf1)
(defconstant +gl-unpack-row-length+ #x0cf2)
(defconstant +gl-unpack-skip-images+ #x806d)
(defconstant +gl-unpack-skip-pixels+ #x0cf4)
(defconstant +gl-unpack-skip-rows+ #x0cf3)
(defconstant +gl-unpack-swap-bytes+ #x0cf0)
(defconstant +gl-unsigned-byte+ #x1401)
(defconstant +gl-unsigned-byte-2-3-3-rev+ #x8362)
(defconstant +gl-unsigned-byte-3-3-2+ #x8032)
(defconstant +gl-unsigned-int+ #x1405)
(defconstant +gl-unsigned-int-10-10-10-2+ #x8036)
(defconstant +gl-unsigned-int-2-10-10-10-rev+ #x8368)
(defconstant +gl-unsigned-int-8-8-8-8+ #x8035)
(defconstant +gl-unsigned-int-8-8-8-8-rev+ #x8367)
(defconstant +gl-unsigned-short+ #x1403)
(defconstant +gl-unsigned-short-1-5-5-5-rev+ #x8366)
(defconstant +gl-unsigned-short-4-4-4-4+ #x8033)
(defconstant +gl-unsigned-short-4-4-4-4-rev+ #x8365)
(defconstant +gl-unsigned-short-5-5-5-1+ #x8034)
(defconstant +gl-unsigned-short-5-6-5+ #x8363)
(defconstant +gl-unsigned-short-5-6-5-rev+ #x8364)
(defconstant +gl-upper-left+ #x8ca2)
(defconstant +gl-v2f+ #x2a20)
(defconstant +gl-v3f+ #x2a21)
(defconstant +gl-validate-status+ #x8b83)
(defconstant +gl-vendor+ #x1f00)
(defconstant +gl-version+ #x1f02)
(defconstant +gl-vertex-array+ #x8074)
(defconstant +gl-vertex-array-buffer-binding+ #x8896)
(defconstant +gl-vertex-array-pointer+ #x808e)
(defconstant +gl-vertex-array-size+ #x807a)
(defconstant +gl-vertex-array-stride+ #x807c)
(defconstant +gl-vertex-array-type+ #x807b)
(defconstant +gl-vertex-attrib-array-buffer-binding+ #x889f)
(defconstant +gl-vertex-attrib-array-enabled+ #x8622)
(defconstant +gl-vertex-attrib-array-normalized+ #x886a)
(defconstant +gl-vertex-attrib-array-pointer+ #x8645)
(defconstant +gl-vertex-attrib-array-size+ #x8623)
(defconstant +gl-vertex-attrib-array-stride+ #x8624)
(defconstant +gl-vertex-attrib-array-type+ #x8625)
(defconstant +gl-vertex-program-point-size+ #x8642)
(defconstant +gl-vertex-program-two-side+ #x8643)
(defconstant +gl-vertex-shader+ #x8b31)
(defconstant +gl-viewport+ #x0ba2)
(defconstant +gl-viewport-bit+ #x00000800)
(defconstant +gl-weight-array-buffer-binding+ #x889e)
(defconstant +gl-write-only+ #x88b9)
(defconstant +gl-xor+ #x1506)
(defconstant +gl-zero+ 0)
(defconstant +gl-zoom-x+ #x0d16)
(defconstant +gl-zoom-y+ #x0d17)

;;; functions
(define-foreign-function (gl-accum "glAccum")
    ((op gl-enum)
     (value gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-alpha-func "glAlphaFunc")
    ((func gl-enum)
     (ref gl-clampf))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-are-textures-resident "glAreTexturesResident")
    ((n gl-sizei)
     (textures (:pointer gl-uint))
     (residences (:pointer gl-boolean)))
  :result-type gl-boolean
  :module :gl)

(define-foreign-function (gl-array-element "glArrayElement")
    ((i gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-begin "glBegin")
    ((mode gl-enum))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-bind-texture "glBindTexture")
    ((target gl-enum)
     (texture gl-uint))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-bitmap "glBitmap")
    ((width gl-sizei)
     (height gl-sizei)
     (xorig gl-float)
     (yorig gl-float)
     (xmove gl-float)
     (ymove gl-float)
     (bitmap (:pointer gl-ubyte)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-blend-color "glBlendColor")
    ((red gl-clampf)
     (green gl-clampf)
     (blue gl-clampf)
     (alpha gl-clampf))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-blend-equation "glBlendEquation")
    ((mode gl-enum))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-blend-equation-separate "glBlendEquationSeparate")
    ((modeRGB gl-enum)
     (modeAlpha gl-enum))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-blend-func "glBlendFunc")
    ((sfactor gl-enum)
     (dfactor gl-enum))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-call-list "glCallList")
    ((list gl-uint))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-call-lists "glCallLists")
    ((n gl-sizei)
     (type gl-enum)
     (lists (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-clear "glClear")
    ((mask gl-bitfield))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-clear-accum "glClearAccum")
    ((red gl-float)
     (green gl-float)
     (blue gl-float)
     (alpha gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-clear-color "glClearColor")
    ((red gl-clampf)
     (green gl-clampf)
     (blue gl-clampf)
     (alpha gl-clampf))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-clear-depth "glClearDepth")
    ((depth gl-clampd))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-clear-index "glClearIndex")
    ((c gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-clear-stencil "glClearStencil")
    ((s gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-clip-plane "glClipPlane")
    ((plane gl-enum)
     (equation (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color3b "glColor3b")
    ((red gl-byte)
     (green gl-byte)
     (blue gl-byte))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color3bv "glColor3bv")
    ((v (:pointer gl-byte)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color3d "glColor3d")
    ((red gl-double)
     (green gl-double)
     (blue gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color3dv "glColor3dv")
    ((v (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color3f "glColor3f")
    ((red gl-float)
     (green gl-float)
     (blue gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color3fv "glColor3fv")
    ((v (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color3i "glColor3i")
    ((red gl-int)
     (green gl-int)
     (blue gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color3iv "glColor3iv")
    ((v (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color3s "glColor3s")
    ((red gl-short)
     (green gl-short)
     (blue gl-short))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color3sv "glColor3sv")
    ((v (:pointer gl-short)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color3ub "glColor3ub")
    ((red gl-ubyte)
     (green gl-ubyte)
     (blue gl-ubyte))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color3ubv "glColor3ubv")
    ((v (:pointer gl-ubyte)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color3ui "glColor3ui")
    ((red gl-uint)
     (green gl-uint)
     (blue gl-uint))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color3uiv "glColor3uiv")
    ((v (:pointer gl-uint)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color3us "glColor3us")
    ((red gl-ushort)
     (green gl-ushort)
     (blue gl-ushort))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color3usv "glColor3usv")
    ((v (:pointer gl-ushort)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color4b "glColor4b")
    ((red gl-byte)
     (green gl-byte)
     (blue gl-byte)
     (alpha gl-byte))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color4bv "glColor4bv")
    ((v (:pointer gl-byte)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color4d "glColor4d")
    ((red gl-double)
     (green gl-double)
     (blue gl-double)
     (alpha gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color4dv "glColor4dv")
    ((v (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color4f "glColor4f")
    ((red gl-float)
     (green gl-float)
     (blue gl-float)
     (alpha gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color4fv "glColor4fv")
    ((v (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color4i "glColor4i")
    ((red gl-int)
     (green gl-int)
     (blue gl-int)
     (alpha gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color4iv "glColor4iv")
    ((v (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color4s "glColor4s")
    ((red gl-short)
     (green gl-short)
     (blue gl-short)
     (alpha gl-short))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color4sv "glColor4sv")
    ((v (:pointer gl-short)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color4ub "glColor4ub")
    ((red gl-ubyte)
     (green gl-ubyte)
     (blue gl-ubyte)
     (alpha gl-ubyte))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color4ubv "glColor4ubv")
    ((v (:pointer gl-ubyte)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color4ui "glColor4ui")
    ((red gl-uint)
     (green gl-uint)
     (blue gl-uint)
     (alpha gl-uint))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color4uiv "glColor4uiv")
    ((v (:pointer gl-uint)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color4us "glColor4us")
    ((red gl-ushort)
     (green gl-ushort)
     (blue gl-ushort)
     (alpha gl-ushort))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color4usv "glColor4usv")
    ((v (:pointer gl-ushort)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color-mask "glColorMask")
    ((red gl-boolean)
     (green gl-boolean)
     (blue gl-boolean)
     (alpha gl-boolean))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color-material "glColorMaterial")
    ((face gl-enum)
     (mode gl-enum))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color-pointer "glColorPointer")
    ((size gl-int)
     (type gl-enum)
     (stride gl-sizei)
     (pointer (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color-sub-table "glColorSubTable")
    ((target gl-enum)
     (start gl-sizei)
     (count gl-sizei)
     (format gl-enum)
     (type gl-enum)
     (data (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color-table "glColorTable")
    ((target gl-enum)
     (internalformat gl-enum)
     (width gl-sizei)
     (format gl-enum)
     (type gl-enum)
     (table (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color-table-parameterfv "glColorTableParameterfv")
    ((target gl-enum)
     (pname gl-enum)
     (params (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-color-table-parameteriv "glColorTableParameteriv")
    ((target gl-enum)
     (pname gl-enum)
     (params (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-convolution-filter1-D "glConvolutionFilter1D")
    ((target gl-enum)
     (internalformat gl-enum)
     (width gl-sizei)
     (format gl-enum)
     (type gl-enum)
     (image (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-convolution-filter2-D "glConvolutionFilter2D")
    ((target gl-enum)
     (internalformat gl-enum)
     (width gl-sizei)
     (height gl-sizei)
     (format gl-enum)
     (type gl-enum)
     (image (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-convolution-parameterf "glConvolutionParameterf")
    ((target gl-enum)
     (pname gl-enum)
     (params gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-convolution-parameterfv "glConvolutionParameterfv")
    ((target gl-enum)
     (pname gl-enum)
     (params (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-convolution-parameteri "glConvolutionParameteri")
    ((target gl-enum)
     (pname gl-enum)
     (params gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-convolution-parameteriv "glConvolutionParameteriv")
    ((target gl-enum)
     (pname gl-enum)
     (params (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-copy-color-sub-table "glCopyColorSubTable")
    ((target gl-enum)
     (start gl-sizei)
     (x gl-int)
     (y gl-int)
     (width gl-sizei))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-copy-color-table "glCopyColorTable")
    ((target gl-enum)
     (internalformat gl-enum)
     (x gl-int)
     (y gl-int)
     (width gl-sizei))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-copy-convolution-filter1-D "glCopyConvolutionFilter1D")
    ((target gl-enum)
     (internalformat gl-enum)
     (x gl-int)
     (y gl-int)
     (width gl-sizei))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-copy-convolution-filter2-D "glCopyConvolutionFilter2D")
    ((target gl-enum)
     (internalformat gl-enum)
     (x gl-int)
     (y gl-int)
     (width gl-sizei)
     (height gl-sizei))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-copy-pixels "glCopyPixels")
    ((x gl-int)
     (y gl-int)
     (width gl-sizei)
     (height gl-sizei)
     (type gl-enum))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-copy-tex-image1-D "glCopyTexImage1D")
    ((target gl-enum)
     (level gl-int)
     (internalformat gl-enum)
     (x gl-int)
     (y gl-int)
     (width gl-sizei)
     (border gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-copy-tex-image2-D "glCopyTexImage2D")
    ((target gl-enum)
     (level gl-int)
     (internalformat gl-enum)
     (x gl-int)
     (y gl-int)
     (width gl-sizei)
     (height gl-sizei)
     (border gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-copy-tex-sub-image1-D "glCopyTexSubImage1D")
    ((target gl-enum)
     (level gl-int)
     (xoffset gl-int)
     (x gl-int)
     (y gl-int)
     (width gl-sizei))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-copy-tex-sub-image2-D "glCopyTexSubImage2D")
    ((target gl-enum)
     (level gl-int)
     (xoffset gl-int)
     (yoffset gl-int)
     (x gl-int)
     (y gl-int)
     (width gl-sizei)
     (height gl-sizei))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-copy-tex-sub-image3-D "glCopyTexSubImage3D")
    ((target gl-enum)
     (level gl-int)
     (xoffset gl-int)
     (yoffset gl-int)
     (zoffset gl-int)
     (x gl-int)
     (y gl-int)
     (width gl-sizei)
     (height gl-sizei))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-cull-face "glCullFace")
    ((mode gl-enum))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-delete-lists "glDeleteLists")
    ((list gl-uint)
     (range gl-sizei))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-delete-textures "glDeleteTextures")
    ((n gl-sizei)
     (textures (:pointer gl-uint)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-depth-func "glDepthFunc")
    ((func gl-enum))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-depth-mask "glDepthMask")
    ((flag gl-boolean))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-depth-range "glDepthRange")
    ((zNear gl-clampd)
     (zFar gl-clampd))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-disable "glDisable")
    ((cap gl-enum))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-disable-client-state "glDisableClientState")
    ((array gl-enum))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-draw-arrays "glDrawArrays")
    ((mode gl-enum)
     (first gl-int)
     (count gl-sizei))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-draw-buffer "glDrawBuffer")
    ((mode gl-enum))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-draw-elements "glDrawElements")
    ((mode gl-enum)
     (count gl-sizei)
     (type gl-enum)
     (indices (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-draw-pixels "glDrawPixels")
    ((width gl-sizei)
     (height gl-sizei)
     (format gl-enum)
     (type gl-enum)
     (pixels (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-draw-range-elements "glDrawRangeElements")
    ((mode gl-enum)
     (start gl-uint)
     (end gl-uint)
     (count gl-sizei)
     (type gl-enum)
     (indices (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-edge-flag "glEdgeFlag")
    ((flag gl-boolean))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-edge-flag-pointer "glEdgeFlagPointer")
    ((stride gl-sizei)
     (pointer (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-edge-flagv "glEdgeFlagv")
    ((flag (:pointer gl-boolean)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-enable "glEnable")
    ((cap gl-enum))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-enable-client-state "glEnableClientState")
    ((array gl-enum))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-end "glEnd")
    ()
  :result-type :void
  :module :gl)

(define-foreign-function (gl-end-list "glEndList")
    ()
  :result-type :void
  :module :gl)

(define-foreign-function (gl-eval-coord1d "glEvalCoord1d")
    ((u gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-eval-coord1dv "glEvalCoord1dv")
    ((u (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-eval-coord1f "glEvalCoord1f")
    ((u gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-eval-coord1fv "glEvalCoord1fv")
    ((u (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-eval-coord2d "glEvalCoord2d")
    ((u gl-double)
     (v gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-eval-coord2dv "glEvalCoord2dv")
    ((u (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-eval-coord2f "glEvalCoord2f")
    ((u gl-float)
     (v gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-eval-coord2fv "glEvalCoord2fv")
    ((u (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-eval-mesh1 "glEvalMesh1")
    ((mode gl-enum)
     (i1 gl-int)
     (i2 gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-eval-mesh2 "glEvalMesh2")
    ((mode gl-enum)
     (i1 gl-int)
     (i2 gl-int)
     (j1 gl-int)
     (j2 gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-eval-point1 "glEvalPoint1")
    ((i gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-eval-point2 "glEvalPoint2")
    ((i gl-int)
     (j gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-feedback-buffer "glFeedbackBuffer")
    ((size gl-sizei)
     (type gl-enum)
     (buffer (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-finish "glFinish")
    ()
  :result-type :void
  :module :gl)

(define-foreign-function (gl-flush "glFlush")
    ()
  :result-type :void
  :module :gl)

(define-foreign-function (gl-fogf "glFogf")
    ((pname gl-enum)
     (param gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-fogfv "glFogfv")
    ((pname gl-enum)
     (params (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-fogi "glFogi")
    ((pname gl-enum)
     (param gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-fogiv "glFogiv")
    ((pname gl-enum)
     (params (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-front-face "glFrontFace")
    ((mode gl-enum))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-frustum "glFrustum")
    ((left gl-double)
     (right gl-double)
     (bottom gl-double)
     (top gl-double)
     (zNear gl-double)
     (zFar gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-gen-lists "glGenLists")
    ((range gl-sizei))
  :result-type gl-uint
  :module :gl)

(define-foreign-function (gl-gen-textures "glGenTextures")
    ((n gl-sizei)
     (textures (:pointer gl-uint)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-booleanv "glGetBooleanv")
    ((pname gl-enum)
     (params (:pointer gl-boolean)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-clip-plane "glGetClipPlane")
    ((plane gl-enum)
     (equation (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-color-table "glGetColorTable")
    ((target gl-enum)
     (format gl-enum)
     (type gl-enum)
     (table (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-color-table-parameterfv "glGetColorTableParameterfv")
    ((target gl-enum)
     (pname gl-enum)
     (params (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-color-table-parameteriv "glGetColorTableParameteriv")
    ((target gl-enum)
     (pname gl-enum)
     (params (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-convolution-filter "glGetConvolutionFilter")
    ((target gl-enum)
     (format gl-enum)
     (type gl-enum)
     (image (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-convolution-parameterfv "glGetConvolutionParameterfv")
    ((target gl-enum)
     (pname gl-enum)
     (params (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-convolution-parameteriv "glGetConvolutionParameteriv")
    ((target gl-enum)
     (pname gl-enum)
     (params (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-doublev "glGetDoublev")
    ((pname gl-enum)
     (params (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-error "glGetError")
    ()
  :result-type gl-enum
  :module :gl)

(define-foreign-function (gl-get-floatv "glGetFloatv")
    ((pname gl-enum)
     (params (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-histogram "glGetHistogram")
    ((target gl-enum)
     (reset gl-boolean)
     (format gl-enum)
     (type gl-enum)
     (values (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-histogram-parameterfv "glGetHistogramParameterfv")
    ((target gl-enum)
     (pname gl-enum)
     (params (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-histogram-parameteriv "glGetHistogramParameteriv")
    ((target gl-enum)
     (pname gl-enum)
     (params (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-integerv "glGetIntegerv")
    ((pname gl-enum)
     (params (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-lightfv "glGetLightfv")
    ((light gl-enum)
     (pname gl-enum)
     (params (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-lightiv "glGetLightiv")
    ((light gl-enum)
     (pname gl-enum)
     (params (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-mapdv "glGetMapdv")
    ((target gl-enum)
     (query gl-enum)
     (v (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-mapfv "glGetMapfv")
    ((target gl-enum)
     (query gl-enum)
     (v (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-mapiv "glGetMapiv")
    ((target gl-enum)
     (query gl-enum)
     (v (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-materialfv "glGetMaterialfv")
    ((face gl-enum)
     (pname gl-enum)
     (params (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-materialiv "glGetMaterialiv")
    ((face gl-enum)
     (pname gl-enum)
     (params (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-minmax "glGetMinmax")
    ((target gl-enum)
     (reset gl-boolean)
     (format gl-enum)
     (type gl-enum)
     (values (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-minmax-parameterfv "glGetMinmaxParameterfv")
    ((target gl-enum)
     (pname gl-enum)
     (params (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-minmax-parameteriv "glGetMinmaxParameteriv")
    ((target gl-enum)
     (pname gl-enum)
     (params (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-pixel-mapfv "glGetPixelMapfv")
    ((map gl-enum)
     (values (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-pixel-mapuiv "glGetPixelMapuiv")
    ((map gl-enum)
     (values (:pointer gl-uint)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-pixel-mapusv "glGetPixelMapusv")
    ((map gl-enum)
     (values (:pointer gl-ushort)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-pointerv "glGetPointerv")
    ((pname gl-enum)
     (params (:pointer (:pointer gl-void))))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-polygon-stipple "glGetPolygonStipple")
    ((mask (:pointer gl-ubyte)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-separable-filter "glGetSeparableFilter")
    ((target gl-enum)
     (format gl-enum)
     (type gl-enum)
     (row (:pointer gl-void))
     (column (:pointer gl-void))
     (span (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-string "glGetString")
    ((name gl-enum))
  :result-type (:pointer gl-ubyte)
  :module :gl)

(define-foreign-function (gl-get-tex-envfv "glGetTexEnvfv")
    ((target gl-enum)
     (pname gl-enum)
     (params (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-tex-enviv "glGetTexEnviv")
    ((target gl-enum)
     (pname gl-enum)
     (params (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-tex-gendv "glGetTexGendv")
    ((coord gl-enum)
     (pname gl-enum)
     (params (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-tex-genfv "glGetTexGenfv")
    ((coord gl-enum)
     (pname gl-enum)
     (params (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-tex-geniv "glGetTexGeniv")
    ((coord gl-enum)
     (pname gl-enum)
     (params (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-tex-image "glGetTexImage")
    ((target gl-enum)
     (level gl-int)
     (format gl-enum)
     (type gl-enum)
     (pixels (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-tex-level-parameterfv "glGetTexLevelParameterfv")
    ((target gl-enum)
     (level gl-int)
     (pname gl-enum)
     (params (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-tex-level-parameteriv "glGetTexLevelParameteriv")
    ((target gl-enum)
     (level gl-int)
     (pname gl-enum)
     (params (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-tex-parameterfv "glGetTexParameterfv")
    ((target gl-enum)
     (pname gl-enum)
     (params (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-tex-parameteriv "glGetTexParameteriv")
    ((target gl-enum)
     (pname gl-enum)
     (params (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-hint "glHint")
    ((target gl-enum)
     (mode gl-enum))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-histogram "glHistogram")
    ((target gl-enum)
     (width gl-sizei)
     (internalformat gl-enum)
     (sink gl-boolean))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-index-mask "glIndexMask")
    ((mask gl-uint))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-index-pointer "glIndexPointer")
    ((type gl-enum)
     (stride gl-sizei)
     (pointer (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-indexd "glIndexd")
    ((c gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-indexdv "glIndexdv")
    ((c (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-indexf "glIndexf")
    ((c gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-indexfv "glIndexfv")
    ((c (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-indexi "glIndexi")
    ((c gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-indexiv "glIndexiv")
    ((c (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-indexs "glIndexs")
    ((c gl-short))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-indexsv "glIndexsv")
    ((c (:pointer gl-short)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-indexub "glIndexub")
    ((c gl-ubyte))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-indexubv "glIndexubv")
    ((c (:pointer gl-ubyte)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-init-names "glInitNames")
    ()
  :result-type :void
  :module :gl)

(define-foreign-function (gl-interleaved-arrays "glInterleavedArrays")
    ((format gl-enum)
     (stride gl-sizei)
     (pointer (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-is-enabled "glIsEnabled")
    ((cap gl-enum))
  :result-type gl-boolean
  :module :gl)

(define-foreign-function (gl-is-list "glIsList")
    ((list gl-uint))
  :result-type gl-boolean
  :module :gl)

(define-foreign-function (gl-is-texture "glIsTexture")
    ((texture gl-uint))
  :result-type gl-boolean
  :module :gl)

(define-foreign-function (gl-light-modelf "glLightModelf")
    ((pname gl-enum)
     (param gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-light-modelfv "glLightModelfv")
    ((pname gl-enum)
     (params (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-light-modeli "glLightModeli")
    ((pname gl-enum)
     (param gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-light-modeliv "glLightModeliv")
    ((pname gl-enum)
     (params (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-lightf "glLightf")
    ((light gl-enum)
     (pname gl-enum)
     (param gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-lightfv "glLightfv")
    ((light gl-enum)
     (pname gl-enum)
     (params (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-lighti "glLighti")
    ((light gl-enum)
     (pname gl-enum)
     (param gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-lightiv "glLightiv")
    ((light gl-enum)
     (pname gl-enum)
     (params (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-line-stipple "glLineStipple")
    ((factor gl-int)
     (pattern gl-ushort))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-line-width "glLineWidth")
    ((width gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-list-base "glListBase")
    ((base gl-uint))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-load-identity "glLoadIdentity")
    ()
  :result-type :void
  :module :gl)

(define-foreign-function (gl-load-matrixd "glLoadMatrixd")
    ((m (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-load-matrixf "glLoadMatrixf")
    ((m (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-load-name "glLoadName")
    ((name gl-uint))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-logic-op "glLogicOp")
    ((opcode gl-enum))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-map1d "glMap1d")
    ((target gl-enum)
     (u1 gl-double)
     (u2 gl-double)
     (stride gl-int)
     (order gl-int)
     (points (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-map1f "glMap1f")
    ((target gl-enum)
     (u1 gl-float)
     (u2 gl-float)
     (stride gl-int)
     (order gl-int)
     (points (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-map2d "glMap2d")
    ((target gl-enum)
     (u1 gl-double)
     (u2 gl-double)
     (ustride gl-int)
     (uorder gl-int)
     (v1 gl-double)
     (v2 gl-double)
     (vstride gl-int)
     (vorder gl-int)
     (points (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-map2f "glMap2f")
    ((target gl-enum)
     (u1 gl-float)
     (u2 gl-float)
     (ustride gl-int)
     (uorder gl-int)
     (v1 gl-float)
     (v2 gl-float)
     (vstride gl-int)
     (vorder gl-int)
     (points (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-map-grid1d "glMapGrid1d")
    ((un gl-int)
     (u1 gl-double)
     (u2 gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-map-grid1f "glMapGrid1f")
    ((un gl-int)
     (u1 gl-float)
     (u2 gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-map-grid2d "glMapGrid2d")
    ((un gl-int)
     (u1 gl-double)
     (u2 gl-double)
     (vn gl-int)
     (v1 gl-double)
     (v2 gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-map-grid2f "glMapGrid2f")
    ((un gl-int)
     (u1 gl-float)
     (u2 gl-float)
     (vn gl-int)
     (v1 gl-float)
     (v2 gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-materialf "glMaterialf")
    ((face gl-enum)
     (pname gl-enum)
     (param gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-materialfv "glMaterialfv")
    ((face gl-enum)
     (pname gl-enum)
     (params (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-materiali "glMateriali")
    ((face gl-enum)
     (pname gl-enum)
     (param gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-materialiv "glMaterialiv")
    ((face gl-enum)
     (pname gl-enum)
     (params (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-matrix-mode "glMatrixMode")
    ((mode gl-enum))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-minmax "glMinmax")
    ((target gl-enum)
     (internalformat gl-enum)
     (sink gl-boolean))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-mult-matrixd "glMultMatrixd")
    ((m (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-mult-matrixf "glMultMatrixf")
    ((m (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-new-list "glNewList")
    ((list gl-uint)
     (mode gl-enum))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-normal3b "glNormal3b")
    ((nx gl-byte)
     (ny gl-byte)
     (nz gl-byte))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-normal3bv "glNormal3bv")
    ((v (:pointer gl-byte)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-normal3d "glNormal3d")
    ((nx gl-double)
     (ny gl-double)
     (nz gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-normal3dv "glNormal3dv")
    ((v (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-normal3f "glNormal3f")
    ((nx gl-float)
     (ny gl-float)
     (nz gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-normal3fv "glNormal3fv")
    ((v (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-normal3i "glNormal3i")
    ((nx gl-int)
     (ny gl-int)
     (nz gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-normal3iv "glNormal3iv")
    ((v (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-normal3s "glNormal3s")
    ((nx gl-short)
     (ny gl-short)
     (nz gl-short))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-normal3sv "glNormal3sv")
    ((v (:pointer gl-short)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-normal-pointer "glNormalPointer")
    ((type gl-enum)
     (stride gl-sizei)
     (pointer (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-ortho "glOrtho")
    ((left gl-double)
     (right gl-double)
     (bottom gl-double)
     (top gl-double)
     (zNear gl-double)
     (zFar gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-pass-through "glPassThrough")
    ((token gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-pixel-mapfv "glPixelMapfv")
    ((map gl-enum)
     (mapsize gl-int)
     (values (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-pixel-mapuiv "glPixelMapuiv")
    ((map gl-enum)
     (mapsize gl-int)
     (values (:pointer gl-uint)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-pixel-mapusv "glPixelMapusv")
    ((map gl-enum)
     (mapsize gl-int)
     (values (:pointer gl-ushort)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-pixel-storef "glPixelStoref")
    ((pname gl-enum)
     (param gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-pixel-storei "glPixelStorei")
    ((pname gl-enum)
     (param gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-pixel-transferf "glPixelTransferf")
    ((pname gl-enum)
     (param gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-pixel-transferi "glPixelTransferi")
    ((pname gl-enum)
     (param gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-pixel-zoom "glPixelZoom")
    ((xfactor gl-float)
     (yfactor gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-point-size "glPointSize")
    ((size gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-polygon-mode "glPolygonMode")
    ((face gl-enum)
     (mode gl-enum))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-polygon-offset "glPolygonOffset")
    ((factor gl-float)
     (units gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-polygon-stipple "glPolygonStipple")
    ((mask (:pointer gl-ubyte)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-pop-attrib "glPopAttrib")
    ()
  :result-type :void
  :module :gl)

(define-foreign-function (gl-pop-client-attrib "glPopClientAttrib")
    ()
  :result-type :void
  :module :gl)

(define-foreign-function (gl-pop-matrix "glPopMatrix")
    ()
  :result-type :void
  :module :gl)

(define-foreign-function (gl-pop-name "glPopName")
    ()
  :result-type :void
  :module :gl)

(define-foreign-function (gl-prioritize-textures "glPrioritizeTextures")
    ((n gl-sizei)
     (textures (:pointer gl-uint))
     (priorities (:pointer gl-clampf)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-push-attrib "glPushAttrib")
    ((mask gl-bitfield))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-push-client-attrib "glPushClientAttrib")
    ((mask gl-bitfield))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-push-matrix "glPushMatrix")
    ()
  :result-type :void
  :module :gl)

(define-foreign-function (gl-push-name "glPushName")
    ((name gl-uint))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-raster-pos2d "glRasterPos2d")
    ((x gl-double)
     (y gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-raster-pos2dv "glRasterPos2dv")
    ((v (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-raster-pos2f "glRasterPos2f")
    ((x gl-float)
     (y gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-raster-pos2fv "glRasterPos2fv")
    ((v (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-raster-pos2i "glRasterPos2i")
    ((x gl-int)
     (y gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-raster-pos2iv "glRasterPos2iv")
    ((v (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-raster-pos2s "glRasterPos2s")
    ((x gl-short)
     (y gl-short))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-raster-pos2sv "glRasterPos2sv")
    ((v (:pointer gl-short)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-raster-pos3d "glRasterPos3d")
    ((x gl-double)
     (y gl-double)
     (z gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-raster-pos3dv "glRasterPos3dv")
    ((v (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-raster-pos3f "glRasterPos3f")
    ((x gl-float)
     (y gl-float)
     (z gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-raster-pos3fv "glRasterPos3fv")
    ((v (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-raster-pos3i "glRasterPos3i")
    ((x gl-int)
     (y gl-int)
     (z gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-raster-pos3iv "glRasterPos3iv")
    ((v (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-raster-pos3s "glRasterPos3s")
    ((x gl-short)
     (y gl-short)
     (z gl-short))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-raster-pos3sv "glRasterPos3sv")
    ((v (:pointer gl-short)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-raster-pos4d "glRasterPos4d")
    ((x gl-double)
     (y gl-double)
     (z gl-double)
     (w gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-raster-pos4dv "glRasterPos4dv")
    ((v (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-raster-pos4f "glRasterPos4f")
    ((x gl-float)
     (y gl-float)
     (z gl-float)
     (w gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-raster-pos4fv "glRasterPos4fv")
    ((v (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-raster-pos4i "glRasterPos4i")
    ((x gl-int)
     (y gl-int)
     (z gl-int)
     (w gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-raster-pos4iv "glRasterPos4iv")
    ((v (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-raster-pos4s "glRasterPos4s")
    ((x gl-short)
     (y gl-short)
     (z gl-short)
     (w gl-short))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-raster-pos4sv "glRasterPos4sv")
    ((v (:pointer gl-short)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-read-buffer "glReadBuffer")
    ((mode gl-enum))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-read-pixels "glReadPixels")
    ((x gl-int)
     (y gl-int)
     (width gl-sizei)
     (height gl-sizei)
     (format gl-enum)
     (type gl-enum)
     (pixels (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-rectd "glRectd")
    ((x1 gl-double)
     (y1 gl-double)
     (x2 gl-double)
     (y2 gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-rectdv "glRectdv")
    ((v1 (:pointer gl-double))
     (v2 (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-rectf "glRectf")
    ((x1 gl-float)
     (y1 gl-float)
     (x2 gl-float)
     (y2 gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-rectfv "glRectfv")
    ((v1 (:pointer gl-float))
     (v2 (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-recti "glRecti")
    ((x1 gl-int)
     (y1 gl-int)
     (x2 gl-int)
     (y2 gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-rectiv "glRectiv")
    ((v1 (:pointer gl-int))
     (v2 (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-rects "glRects")
    ((x1 gl-short)
     (y1 gl-short)
     (x2 gl-short)
     (y2 gl-short))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-rectsv "glRectsv")
    ((v1 (:pointer gl-short))
     (v2 (:pointer gl-short)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-render-mode "glRenderMode")
    ((mode gl-enum))
  :result-type gl-int
  :module :gl)

(define-foreign-function (gl-reset-histogram "glResetHistogram")
    ((target gl-enum))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-reset-minmax "glResetMinmax")
    ((target gl-enum))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-rotated "glRotated")
    ((angle gl-double)
     (x gl-double)
     (y gl-double)
     (z gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-rotatef "glRotatef")
    ((angle gl-float)
     (x gl-float)
     (y gl-float)
     (z gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-scaled "glScaled")
    ((x gl-double)
     (y gl-double)
     (z gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-scalef "glScalef")
    ((x gl-float)
     (y gl-float)
     (z gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-scissor "glScissor")
    ((x gl-int)
     (y gl-int)
     (width gl-sizei)
     (height gl-sizei))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-select-buffer "glSelectBuffer")
    ((size gl-sizei)
     (buffer (:pointer gl-uint)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-separable-filter2-D "glSeparableFilter2D")
    ((target gl-enum)
     (internalformat gl-enum)
     (width gl-sizei)
     (height gl-sizei)
     (format gl-enum)
     (type gl-enum)
     (row (:pointer gl-void))
     (column (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-shade-model "glShadeModel")
    ((mode gl-enum))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-stencil-func "glStencilFunc")
    ((func gl-enum)
     (ref gl-int)
     (mask gl-uint))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-stencil-mask "glStencilMask")
    ((mask gl-uint))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-stencil-op "glStencilOp")
    ((fail gl-enum)
     (zfail gl-enum)
     (zpass gl-enum))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-coord1d "glTexCoord1d")
    ((s gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-coord1dv "glTexCoord1dv")
    ((v (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-coord1f "glTexCoord1f")
    ((s gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-coord1fv "glTexCoord1fv")
    ((v (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-coord1i "glTexCoord1i")
    ((s gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-coord1iv "glTexCoord1iv")
    ((v (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-coord1s "glTexCoord1s")
    ((s gl-short))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-coord1sv "glTexCoord1sv")
    ((v (:pointer gl-short)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-coord2d "glTexCoord2d")
    ((s gl-double)
     (g gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-coord2dv "glTexCoord2dv")
    ((v (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-coord2f "glTexCoord2f")
    ((s gl-float)
     (g gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-coord2fv "glTexCoord2fv")
    ((v (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-coord2i "glTexCoord2i")
    ((s gl-int)
     (g gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-coord2iv "glTexCoord2iv")
    ((v (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-coord2s "glTexCoord2s")
    ((s gl-short)
     (g gl-short))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-coord2sv "glTexCoord2sv")
    ((v (:pointer gl-short)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-coord3d "glTexCoord3d")
    ((s gl-double)
     (g gl-double)
     (r gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-coord3dv "glTexCoord3dv")
    ((v (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-coord3f "glTexCoord3f")
    ((s gl-float)
     (g gl-float)
     (r gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-coord3fv "glTexCoord3fv")
    ((v (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-coord3i "glTexCoord3i")
    ((s gl-int)
     (g gl-int)
     (r gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-coord3iv "glTexCoord3iv")
    ((v (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-coord3s "glTexCoord3s")
    ((s gl-short)
     (g gl-short)
     (r gl-short))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-coord3sv "glTexCoord3sv")
    ((v (:pointer gl-short)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-coord4d "glTexCoord4d")
    ((s gl-double)
     (g gl-double)
     (r gl-double)
     (q gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-coord4dv "glTexCoord4dv")
    ((v (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-coord4f "glTexCoord4f")
    ((s gl-float)
     (g gl-float)
     (r gl-float)
     (q gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-coord4fv "glTexCoord4fv")
    ((v (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-coord4i "glTexCoord4i")
    ((s gl-int)
     (g gl-int)
     (r gl-int)
     (q gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-coord4iv "glTexCoord4iv")
    ((v (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-coord4s "glTexCoord4s")
    ((s gl-short)
     (g gl-short)
     (r gl-short)
     (q gl-short))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-coord4sv "glTexCoord4sv")
    ((v (:pointer gl-short)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-coord-pointer "glTexCoordPointer")
    ((size gl-int)
     (type gl-enum)
     (stride gl-sizei)
     (pointer (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-envf "glTexEnvf")
    ((target gl-enum)
     (pname gl-enum)
     (param gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-envfv "glTexEnvfv")
    ((target gl-enum)
     (pname gl-enum)
     (params (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-envi "glTexEnvi")
    ((target gl-enum)
     (pname gl-enum)
     (param gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-enviv "glTexEnviv")
    ((target gl-enum)
     (pname gl-enum)
     (params (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-gend "glTexGend")
    ((coord gl-enum)
     (pname gl-enum)
     (param gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-gendv "glTexGendv")
    ((coord gl-enum)
     (pname gl-enum)
     (params (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-genf "glTexGenf")
    ((coord gl-enum)
     (pname gl-enum)
     (param gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-genfv "glTexGenfv")
    ((coord gl-enum)
     (pname gl-enum)
     (params (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-geni "glTexGeni")
    ((coord gl-enum)
     (pname gl-enum)
     (param gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-geniv "glTexGeniv")
    ((coord gl-enum)
     (pname gl-enum)
     (params (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-image1-D "glTexImage1D")
    ((target gl-enum)
     (level gl-int)
     (internalformat gl-int)
     (width gl-sizei)
     (border gl-int)
     (format gl-enum)
     (type gl-enum)
     (pixels (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-image2-D "glTexImage2D")
    ((target gl-enum)
     (level gl-int)
     (internalformat gl-int)
     (width gl-sizei)
     (height gl-sizei)
     (border gl-int)
     (format gl-enum)
     (type gl-enum)
     (pixels (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-image3-D "glTexImage3D")
    ((target gl-enum)
     (level gl-int)
     (internalformat gl-int)
     (width gl-sizei)
     (height gl-sizei)
     (depth gl-sizei)
     (border gl-int)
     (format gl-enum)
     (type gl-enum)
     (pixels (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-parameterf "glTexParameterf")
    ((target gl-enum)
     (pname gl-enum)
     (param gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-parameterfv "glTexParameterfv")
    ((target gl-enum)
     (pname gl-enum)
     (params (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-parameteri "glTexParameteri")
    ((target gl-enum)
     (pname gl-enum)
     (param gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-parameteriv "glTexParameteriv")
    ((target gl-enum)
     (pname gl-enum)
     (params (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-sub-image1-D "glTexSubImage1D")
    ((target gl-enum)
     (level gl-int)
     (xoffset gl-int)
     (width gl-sizei)
     (format gl-enum)
     (type gl-enum)
     (pixels (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-sub-image2-D "glTexSubImage2D")
    ((target gl-enum)
     (level gl-int)
     (xoffset gl-int)
     (yoffset gl-int)
     (width gl-sizei)
     (height gl-sizei)
     (format gl-enum)
     (type gl-enum)
     (pixels (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-tex-sub-image3-D "glTexSubImage3D")
    ((target gl-enum)
     (level gl-int)
     (xoffset gl-int)
     (yoffset gl-int)
     (zoffset gl-int)
     (width gl-sizei)
     (height gl-sizei)
     (depth gl-sizei)
     (format gl-enum)
     (type gl-enum)
     (pixels (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-translated "glTranslated")
    ((x gl-double)
     (y gl-double)
     (z gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-translatef "glTranslatef")
    ((x gl-float)
     (y gl-float)
     (z gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex2d "glVertex2d")
    ((x gl-double)
     (y gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex2dv "glVertex2dv")
    ((v (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex2f "glVertex2f")
    ((x gl-float)
     (y gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex2fv "glVertex2fv")
    ((v (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex2i "glVertex2i")
    ((x gl-int)
     (y gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex2iv "glVertex2iv")
    ((v (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex2s "glVertex2s")
    ((x gl-short)
     (y gl-short))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex2sv "glVertex2sv")
    ((v (:pointer gl-short)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex3d "glVertex3d")
    ((x gl-double)
     (y gl-double)
     (z gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex3dv "glVertex3dv")
    ((v (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex3f "glVertex3f")
    ((x gl-float)
     (y gl-float)
     (z gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex3fv "glVertex3fv")
    ((v (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex3i "glVertex3i")
    ((x gl-int)
     (y gl-int)
     (z gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex3iv "glVertex3iv")
    ((v (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex3s "glVertex3s")
    ((x gl-short)
     (y gl-short)
     (z gl-short))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex3sv "glVertex3sv")
    ((v (:pointer gl-short)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex4d "glVertex4d")
    ((x gl-double)
     (y gl-double)
     (z gl-double)
     (w gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex4dv "glVertex4dv")
    ((v (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex4f "glVertex4f")
    ((x gl-float)
     (y gl-float)
     (z gl-float)
     (w gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex4fv "glVertex4fv")
    ((v (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex4i "glVertex4i")
    ((x gl-int)
     (y gl-int)
     (z gl-int)
     (w gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex4iv "glVertex4iv")
    ((v (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex4s "glVertex4s")
    ((x gl-short)
     (y gl-short)
     (z gl-short)
     (w gl-short))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex4sv "glVertex4sv")
    ((v (:pointer gl-short)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-pointer "glVertexPointer")
    ((size gl-int)
     (type gl-enum)
     (stride gl-sizei)
     (pointer (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-viewport "glViewport")
    ((x gl-int)
     (y gl-int)
     (width gl-sizei)
     (height gl-sizei))

  :result-type :void
  :module :gl)

(define-foreign-function (gl-sample-coverage "glSampleCoverage")
    ((value gl-clampf)
     (invert gl-boolean))

  :result-type :void
  :module :gl)

(define-foreign-function (gl-load-transpose-matrixf "glLoadTransposeMatrixf")
    ((m (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-load-transpose-matrixd "glLoadTransposeMatrixd")
    ((m (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-mult-transpose-matrixf "glMultTransposeMatrixf")
    ((m (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-mult-transpose-matrixd "glMultTransposeMatrixd")
    ((m (:pointer gl-double)))

  :result-type :void
  :module :gl)

(define-foreign-function (gl-compressed-tex-image3-D "glCompressedTexImage3D")
    ((target gl-enum)
     (level gl-int)
     (internalformat gl-enum)
     (width gl-sizei)
     (height gl-sizei)
     (depth gl-sizei)
     (border gl-int)
     (imageSize gl-sizei)
     (data (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-compressed-tex-image2-D "glCompressedTexImage2D")
    ((target gl-enum)
     (level gl-int)
     (internalformat gl-enum)
     (width gl-sizei)
     (height gl-sizei)
     (border gl-int)
     (imageSize gl-sizei)
     (data (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-compressed-tex-image1-D "glCompressedTexImage1D")
    ((target gl-enum)
     (level gl-int)
     (internalformat gl-enum)
     (width gl-sizei)
     (border gl-int)
     (imageSize gl-sizei)
     (data (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-compressed-tex-sub-image3-D "glCompressedTexSubImage3D")
    ((target gl-enum)
     (level gl-int)
     (xoffset gl-int)
     (yoffset gl-int)
     (zoffset gl-int)
     (width gl-sizei)
     (height gl-sizei)
     (depth gl-sizei)
     (format gl-enum)
     (imageSize gl-sizei)
     (data (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-compressed-tex-sub-image2-D "glCompressedTexSubImage2D")
    ((target gl-enum)
     (level gl-int)
     (xoffset gl-int)
     (yoffset gl-int)
     (width gl-sizei)
     (height gl-sizei)
     (format gl-enum)
     (imageSize gl-sizei)
     (data (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-compressed-tex-sub-image1-D "glCompressedTexSubImage1D")
    ((target gl-enum)
     (level gl-int)
     (xoffset gl-int)
     (width gl-sizei)
     (format gl-enum)
     (imageSize gl-sizei)
     (data (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-compressed-tex-image "glGetCompressedTexImage")
    ((target gl-enum)
     (lod gl-int)
     (img (:pointer gl-void)))

  :result-type :void
  :module :gl)

(define-foreign-function (gl-active-texture "glActiveTexture")
    ((texture gl-enum))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-client-active-texture "glClientActiveTexture")
    ((texture gl-enum))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-multi-tex-coord1d "glMultiTexCoord1d")
    ((target gl-enum)
     (s gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-multi-tex-coord1dv "glMultiTexCoord1dv")
    ((target gl-enum)
     (v (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-multi-tex-coord1f "glMultiTexCoord1f")
    ((target gl-enum)
     (s gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-multi-tex-coord1fv "glMultiTexCoord1fv")
    ((target gl-enum)
     (v (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-multi-tex-coord1i "glMultiTexCoord1i")
    ((target gl-enum)
     (s gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-multi-tex-coord1iv "glMultiTexCoord1iv")
    ((target gl-enum)
     (v (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-multi-tex-coord1s "glMultiTexCoord1s")
    ((target gl-enum)
     (s gl-short))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-multi-tex-coord1sv "glMultiTexCoord1sv")
    ((target gl-enum)
     (v (:pointer gl-short)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-multi-tex-coord2d "glMultiTexCoord2d")
    ((target gl-enum)
     (s gl-double)
     (g gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-multi-tex-coord2dv "glMultiTexCoord2dv")
    ((target gl-enum)
     (v (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-multi-tex-coord2f "glMultiTexCoord2f")
    ((target gl-enum)
     (s gl-float)
     (g gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-multi-tex-coord2fv "glMultiTexCoord2fv")
    ((target gl-enum)
     (v (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-multi-tex-coord2i "glMultiTexCoord2i")
    ((target gl-enum)
     (s gl-int)
     (g gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-multi-tex-coord2iv "glMultiTexCoord2iv")
    ((target gl-enum)
     (v (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-multi-tex-coord2s "glMultiTexCoord2s")
    ((target gl-enum)
     (s gl-short)
     (g gl-short))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-multi-tex-coord2sv "glMultiTexCoord2sv")
    ((target gl-enum)
     (v (:pointer gl-short)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-multi-tex-coord3d "glMultiTexCoord3d")
    ((target gl-enum)
     (s gl-double)
     (g gl-double)
     (r gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-multi-tex-coord3dv "glMultiTexCoord3dv")
    ((target gl-enum)
     (v (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-multi-tex-coord3f "glMultiTexCoord3f")
    ((target gl-enum)
     (s gl-float)
     (g gl-float)
     (r gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-multi-tex-coord3fv "glMultiTexCoord3fv")
    ((target gl-enum)
     (v (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-multi-tex-coord3i "glMultiTexCoord3i")
    ((target gl-enum)
     (s gl-int)
     (g gl-int)
     (r gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-multi-tex-coord3iv "glMultiTexCoord3iv")
    ((target gl-enum)
     (v (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-multi-tex-coord3s "glMultiTexCoord3s")
    ((target gl-enum)
     (s gl-short)
     (g gl-short)
     (r gl-short))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-multi-tex-coord3sv "glMultiTexCoord3sv")
    ((target gl-enum)
     (v (:pointer gl-short)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-multi-tex-coord4d "glMultiTexCoord4d")
    ((target gl-enum)
     (s gl-double)
     (g gl-double)
     (r gl-double)
     (q gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-multi-tex-coord4dv "glMultiTexCoord4dv")
    ((target gl-enum)
     (v (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-multi-tex-coord4f "glMultiTexCoord4f")
    ((target gl-enum)
     (s gl-float)
     (g gl-float)
     (r gl-float)
     (q gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-multi-tex-coord4fv "glMultiTexCoord4fv")
    ((target gl-enum)
     (v (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-multi-tex-coord4i "glMultiTexCoord4i")
    ((target gl-enum)
     (s gl-int)
     (g gl-int)
     (r gl-int)
     (q gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-multi-tex-coord4iv "glMultiTexCoord4iv")
    ((target gl-enum)
     (v (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-multi-tex-coord4s "glMultiTexCoord4s")
    ((target gl-enum)
     (s gl-short)
     (g gl-short)
     (r gl-short)
     (q gl-short))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-multi-tex-coord4sv "glMultiTexCoord4sv")
    ((target gl-enum)
     (v (:pointer gl-short)))

  :result-type :void
  :module :gl)

(define-foreign-function (gl-fog-coordf "glFogCoordf")
    ((coord gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-fog-coordfv "glFogCoordfv")
    ((coord (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-fog-coordd "glFogCoordd")
    ((coord gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-fog-coorddv "glFogCoorddv")
    ((coord (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-fog-coord-pointer "glFogCoordPointer")
    ((type gl-enum)
     (stride gl-sizei)
     (pointer (:pointer gl-void)))

  :result-type :void
  :module :gl)

(define-foreign-function (gl-secondary-color3b "glSecondaryColor3b")
    ((red gl-byte)
     (green gl-byte)
     (blue gl-byte))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-secondary-color3bv "glSecondaryColor3bv")
    ((v (:pointer gl-byte)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-secondary-color3d "glSecondaryColor3d")
    ((red gl-double)
     (green gl-double)
     (blue gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-secondary-color3dv "glSecondaryColor3dv")
    ((v (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-secondary-color3f "glSecondaryColor3f")
    ((red gl-float)
     (green gl-float)
     (blue gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-secondary-color3fv "glSecondaryColor3fv")
    ((v (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-secondary-color3i "glSecondaryColor3i")
    ((red gl-int)
     (green gl-int)
     (blue gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-secondary-color3iv "glSecondaryColor3iv")
    ((v (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-secondary-color3s "glSecondaryColor3s")
    ((red gl-short)
     (green gl-short)
     (blue gl-short))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-secondary-color3sv "glSecondaryColor3sv")
    ((v (:pointer gl-short)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-secondary-color3ub "glSecondaryColor3ub")
    ((red gl-ubyte)
     (green gl-ubyte)
     (blue gl-ubyte))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-secondary-color3ubv "glSecondaryColor3ubv")
    ((v (:pointer gl-ubyte)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-secondary-color3ui "glSecondaryColor3ui")
    ((red gl-uint)
     (green gl-uint)
     (blue gl-uint))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-secondary-color3uiv "glSecondaryColor3uiv")
    ((v (:pointer gl-uint)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-secondary-color3us "glSecondaryColor3us")
    ((red gl-ushort)
     (green gl-ushort)
     (blue gl-ushort))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-secondary-color3usv "glSecondaryColor3usv")
    ((v (:pointer gl-ushort)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-secondary-color-pointer "glSecondaryColorPointer")
    ((size gl-int)
     (type gl-enum)
     (stride gl-sizei)
     (pointer (:pointer gl-void)))

  :result-type :void
  :module :gl)

(define-foreign-function (gl-point-parameterf "glPointParameterf")
    ((pname gl-enum)
     (param gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-point-parameterfv "glPointParameterfv")
    ((pname gl-enum)
     (params (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-point-parameteri "glPointParameteri")
    ((pname gl-enum)
     (param gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-point-parameteriv "glPointParameteriv")
    ((pname gl-enum)
     (params (:pointer gl-int)))

  :result-type :void
  :module :gl)

(define-foreign-function (gl-blend-func-separate "glBlendFuncSeparate")
    ((srcRGB gl-enum)
     (dstRGB gl-enum)
     (srcAlpha gl-enum)
     (dstAlpha gl-enum))

  :result-type :void
  :module :gl)

(define-foreign-function (gl-multi-draw-arrays "glMultiDrawArrays")
    ((mode gl-enum)
     (first (:pointer gl-int))
     (count (:pointer gl-sizei))
     (primcount gl-sizei))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-multi-draw-elements "glMultiDrawElements")
    ((mode gl-enum)
     (count (:pointer gl-sizei))
     (type gl-enum)
     (indices (:pointer (:pointer gl-void)))
     (primcount gl-sizei))

  :result-type :void
  :module :gl)

(define-foreign-function (gl-window-pos2d "glWindowPos2d")
    ((x gl-double)
     (y gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-window-pos2dv "glWindowPos2dv")
    ((v (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-window-pos2f "glWindowPos2f")
    ((x gl-float)
     (y gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-window-pos2fv "glWindowPos2fv")
    ((v (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-window-pos2i "glWindowPos2i")
    ((x gl-int)
     (y gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-window-pos2iv "glWindowPos2iv")
    ((v (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-window-pos2s "glWindowPos2s")
    ((x gl-short)
     (y gl-short))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-window-pos2sv "glWindowPos2sv")
    ((v (:pointer gl-short)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-window-pos3d "glWindowPos3d")
    ((x gl-double)
     (y gl-double)
     (z gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-window-pos3dv "glWindowPos3dv")
    ((v (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-window-pos3f "glWindowPos3f")
    ((x gl-float)
     (y gl-float)
     (z gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-window-pos3fv "glWindowPos3fv")
    ((v (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-window-pos3i "glWindowPos3i")
    ((x gl-int)
     (y gl-int)
     (z gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-window-pos3iv "glWindowPos3iv")
    ((v (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-window-pos3s "glWindowPos3s")
    ((x gl-short)
     (y gl-short)
     (z gl-short))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-window-pos3sv "glWindowPos3sv")
    ((v (:pointer gl-short)))

  :result-type :void
  :module :gl)

(define-foreign-function (gl-gen-queries "glGenQueries")
    ((n gl-sizei)
     (ids (:pointer gl-uint)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-delete-queries "glDeleteQueries")
    ((n gl-sizei)
     (ids (:pointer gl-uint)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-is-query "glIsQuery")
    ((id gl-uint))
  :result-type gl-boolean
  :module :gl)

(define-foreign-function (gl-begin-query "glBeginQuery")
    ((target gl-enum)
     (id gl-uint))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-end-query "glEndQuery")
    ((target gl-enum))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-queryiv "glGetQueryiv")
    ((target gl-enum)
     (pname gl-enum)
     (params (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-query-objectiv "glGetQueryObjectiv")
    ((id gl-uint)
     (pname gl-enum)
     (params (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-query-objectuiv "glGetQueryObjectuiv")
    ((id gl-uint)
     (pname gl-enum)
     (params (:pointer gl-uint)))

  :result-type :void
  :module :gl)

(define-foreign-function (gl-bind-buffer "glBindBuffer")
    ((target gl-enum)
     (buffer gl-uint))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-delete-buffers "glDeleteBuffers")
    ((n gl-sizei)
     (buffers (:pointer gl-uint)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-gen-buffers "glGenBuffers")
    ((n gl-sizei)
     (buffers (:pointer gl-uint)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-is-buffer "glIsBuffer")
    ((buffer gl-uint))
  :result-type gl-boolean
  :module :gl)

(define-foreign-function (gl-buffer-data "glBufferData")
    ((target gl-enum)
     (size gl-sizeiptr)
     (data (:pointer gl-void))
     (usage gl-enum))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-buffer-sub-data "glBufferSubData")
    ((target gl-enum)
     (offset gl-intptr)
     (size gl-sizeiptr)
     (data (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-buffer-sub-data "glGetBufferSubData")
    ((target gl-enum)
     (offset gl-intptr)
     (size gl-sizeiptr)
     (data (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-map-buffer "glMapBuffer")
    ((target gl-enum)
     (access gl-enum))
  :result-type (:pointer gl-void)
  :module :gl)

(define-foreign-function (gl-unmap-buffer "glUnmapBuffer")
    ((target gl-enum))
  :result-type gl-boolean
  :module :gl)

(define-foreign-function (gl-get-buffer-parameteriv "glGetBufferParameteriv")
    ((target gl-enum)
     (pname gl-enum)
     (params (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-buffer-pointerv "glGetBufferPointerv")
    ((target gl-enum)
     (pname gl-enum)
     (params (:pointer (:pointer gl-void))))

  :result-type :void
  :module :gl)

(define-foreign-function (gl-draw-buffers "glDrawBuffers")
    ((n gl-sizei)
     (bufs (:pointer gl-enum)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib1d "glVertexAttrib1d")
    ((index gl-uint)
     (x gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib1dv "glVertexAttrib1dv")
    ((index gl-uint)
     (v (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib1f "glVertexAttrib1f")
    ((index gl-uint)
     (x gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib1fv "glVertexAttrib1fv")
    ((index gl-uint)
     (v (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib1s "glVertexAttrib1s")
    ((index gl-uint)
     (x gl-short))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib1sv "glVertexAttrib1sv")
    ((index gl-uint)
     (v (:pointer gl-short)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib2d "glVertexAttrib2d")
    ((index gl-uint)
     (x gl-double)
     (y gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib2dv "glVertexAttrib2dv")
    ((index gl-uint)
     (v (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib2f "glVertexAttrib2f")
    ((index gl-uint)
     (x gl-float)
     (y gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib2fv "glVertexAttrib2fv")
    ((index gl-uint)
     (v (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib2s "glVertexAttrib2s")
    ((index gl-uint)
     (x gl-short)
     (y gl-short))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib2sv "glVertexAttrib2sv")
    ((index gl-uint)
     (v (:pointer gl-short)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib3d "glVertexAttrib3d")
    ((index gl-uint)
     (x gl-double)
     (y gl-double)
     (z gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib3dv "glVertexAttrib3dv")
    ((index gl-uint)
     (v (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib3f "glVertexAttrib3f")
    ((index gl-uint)
     (x gl-float)
     (y gl-float)
     (z gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib3fv "glVertexAttrib3fv")
    ((index gl-uint)
     (v (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib3s "glVertexAttrib3s")
    ((index gl-uint)
     (x gl-short)
     (y gl-short)
     (z gl-short))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib3sv "glVertexAttrib3sv")
    ((index gl-uint)
     (v (:pointer gl-short)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib4-nbv "glVertexAttrib4Nbv")
    ((index gl-uint)
     (v (:pointer gl-byte)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib4-niv "glVertexAttrib4Niv")
    ((index gl-uint)
     (v (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib4-nsv "glVertexAttrib4Nsv")
    ((index gl-uint)
     (v (:pointer gl-short)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib4-nub "glVertexAttrib4Nub")
    ((index gl-uint)
     (x gl-ubyte)
     (y gl-ubyte)
     (z gl-ubyte)
     (w gl-ubyte))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib4-nubv "glVertexAttrib4Nubv")
    ((index gl-uint)
     (v (:pointer gl-ubyte)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib4-nuiv "glVertexAttrib4Nuiv")
    ((index gl-uint)
     (v (:pointer gl-uint)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib4-nusv "glVertexAttrib4Nusv")
    ((index gl-uint)
     (v (:pointer gl-ushort)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib4bv "glVertexAttrib4bv")
    ((index gl-uint)
     (v (:pointer gl-byte)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib4d "glVertexAttrib4d")
    ((index gl-uint)
     (x gl-double)
     (y gl-double)
     (z gl-double)
     (w gl-double))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib4dv "glVertexAttrib4dv")
    ((index gl-uint)
     (v (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib4f "glVertexAttrib4f")
    ((index gl-uint)
     (x gl-float)
     (y gl-float)
     (z gl-float)
     (w gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib4fv "glVertexAttrib4fv")
    ((index gl-uint)
     (v (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib4iv "glVertexAttrib4iv")
    ((index gl-uint)
     (v (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib4s "glVertexAttrib4s")
    ((index gl-uint)
     (x gl-short)
     (y gl-short)
     (z gl-short)
     (w gl-short))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib4sv "glVertexAttrib4sv")
    ((index gl-uint)
     (v (:pointer gl-short)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib4ubv "glVertexAttrib4ubv")
    ((index gl-uint)
     (v (:pointer gl-ubyte)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib4uiv "glVertexAttrib4uiv")
    ((index gl-uint)
     (v (:pointer gl-uint)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib4usv "glVertexAttrib4usv")
    ((index gl-uint)
     (v (:pointer gl-ushort)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-vertex-attrib-pointer "glVertexAttribPointer")
    ((index gl-uint)
     (size gl-int)
     (type gl-enum)
     (normalized gl-boolean)
     (stride gl-sizei)
     (pointer (:pointer gl-void)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-enable-vertex-attrib-array "glEnableVertexAttribArray")
    ((index gl-uint))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-disable-vertex-attrib-array "glDisableVertexAttribArray")
    ((index gl-uint))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-vertex-attribdv "glGetVertexAttribdv")
    ((index gl-uint)
     (pname gl-enum)
     (params (:pointer gl-double)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-vertex-attribfv "glGetVertexAttribfv")
    ((index gl-uint)
     (pname gl-enum)
     (params (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-vertex-attribiv "glGetVertexAttribiv")
    ((index gl-uint)
     (pname gl-enum)
     (params (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-vertex-attrib-pointerv "glGetVertexAttribPointerv")
    ((index gl-uint)
     (pname gl-enum)
     (pointer (:pointer (:pointer gl-void))))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-delete-shader "glDeleteShader")
    ((shader gl-uint))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-detach-shader "glDetachShader")
    ((program gl-uint)
     (shader gl-uint))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-create-shader "glCreateShader")
    ((type gl-enum))
  :result-type gl-uint
  :module :gl)

(define-foreign-function (gl-shader-source "glShaderSource")
    ((shader gl-uint)
     (count gl-sizei)
     (string (:pointer (:pointer gl-char)))
     (length (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-compile-shader "glCompileShader")
    ((shader gl-uint))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-create-program "glCreateProgram")
    ()
  :result-type gl-uint
  :module :gl)

(define-foreign-function (gl-attach-shader "glAttachShader")
    ((program gl-uint)
     (shader gl-uint))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-link-program "glLinkProgram")
    ((program gl-uint))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-use-program "glUseProgram")
    ((program gl-uint))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-delete-program "glDeleteProgram")
    ((program gl-uint))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-validate-program "glValidateProgram")
    ((program gl-uint))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-uniform1f "glUniform1f")
    ((location gl-int)
     (v0 gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-uniform2f "glUniform2f")
    ((location gl-int)
     (v0 gl-float)
     (v1 gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-uniform3f "glUniform3f")
    ((location gl-int)
     (v0 gl-float)
     (v1 gl-float)
     (v2 gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-uniform4f "glUniform4f")
    ((location gl-int)
     (v0 gl-float)
     (v1 gl-float)
     (v2 gl-float)
     (v3 gl-float))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-uniform1i "glUniform1i")
    ((location gl-int)
     (v0 gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-uniform2i "glUniform2i")
    ((location gl-int)
     (v0 gl-int)
     (v1 gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-uniform3i "glUniform3i")
    ((location gl-int)
     (v0 gl-int)
     (v1 gl-int)
     (v2 gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-uniform4i "glUniform4i")
    ((location gl-int)
     (v0 gl-int)
     (v1 gl-int)
     (v2 gl-int)
     (v3 gl-int))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-uniform1fv "glUniform1fv")
    ((location gl-int)
     (count gl-sizei)
     (value (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-uniform2fv "glUniform2fv")
    ((location gl-int)
     (count gl-sizei)
     (value (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-uniform3fv "glUniform3fv")
    ((location gl-int)
     (count gl-sizei)
     (value (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-uniform4fv "glUniform4fv")
    ((location gl-int)
     (count gl-sizei)
     (value (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-uniform1iv "glUniform1iv")
    ((location gl-int)
     (count gl-sizei)
     (value (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-uniform2iv "glUniform2iv")
    ((location gl-int)
     (count gl-sizei)
     (value (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-uniform3iv "glUniform3iv")
    ((location gl-int)
     (count gl-sizei)
     (value (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-uniform4iv "glUniform4iv")
    ((location gl-int)
     (count gl-sizei)
     (value (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-uniform-matrix2fv "glUniformMatrix2fv")
    ((location gl-int)
     (count gl-sizei)
     (transpose gl-boolean)
     (value (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-uniform-matrix3fv "glUniformMatrix3fv")
    ((location gl-int)
     (count gl-sizei)
     (transpose gl-boolean)
     (value (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-uniform-matrix4fv "glUniformMatrix4fv")
    ((location gl-int)
     (count gl-sizei)
     (transpose gl-boolean)
     (value (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-is-shader "glIsShader")
    ((shader gl-uint))
  :result-type gl-boolean
  :module :gl)

(define-foreign-function (gl-is-program "glIsProgram")
    ((program gl-uint))
  :result-type gl-boolean
  :module :gl)

(define-foreign-function (gl-get-shaderiv "glGetShaderiv")
    ((shader gl-uint)
     (pname gl-enum)
     (params (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-programiv "glGetProgramiv")
    ((program gl-uint)
     (pname gl-enum)
     (params (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-attached-shaders "glGetAttachedShaders")
    ((program gl-uint)
     (maxCount gl-sizei)
     (count (:pointer gl-sizei))
     (shaders (:pointer gl-uint)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-shader-info-log "glGetShaderInfoLog")
    ((shader gl-uint)
     (bufSize gl-sizei)
     (length (:pointer gl-sizei))
     (infoLog (:pointer gl-char)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-program-info-log "glGetProgramInfoLog")
    ((program gl-uint)
     (bufSize gl-sizei)
     (length (:pointer gl-sizei))
     (infoLog (:pointer gl-char)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-uniform-location "glGetUniformLocation")
    ((program gl-uint)
     (name (:pointer gl-char)))
  :result-type gl-int
  :module :gl)

(define-foreign-function (gl-get-active-uniform "glGetActiveUniform")
    ((program gl-uint)
     (index gl-uint)
     (bufSize gl-sizei)
     (length (:pointer gl-sizei))
     (size (:pointer gl-int))
     (type (:pointer gl-enum))
     (name (:pointer gl-char)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-uniformfv "glGetUniformfv")
    ((program gl-uint)
     (location gl-int)
     (params (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-uniformiv "glGetUniformiv")
    ((program gl-uint)
     (location gl-int)
     (params (:pointer gl-int)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-shader-source "glGetShaderSource")
    ((shader gl-uint)
     (bufSize gl-sizei)
     (length (:pointer gl-sizei))
     (source (:pointer gl-char)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-bind-attrib-location "glBindAttribLocation")
    ((program gl-uint)
     (index gl-uint)
     (name (:pointer gl-char)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-active-attrib "glGetActiveAttrib")
    ((program gl-uint)
     (index gl-uint)
     (bufSize gl-sizei)
     (length (:pointer gl-sizei))
     (size (:pointer gl-int))
     (type (:pointer gl-enum))
     (name (:pointer gl-char)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-get-attrib-location "glGetAttribLocation")
    ((program gl-uint)
     (name (:pointer gl-char)))
  :result-type gl-int
  :module :gl)

(define-foreign-function (gl-stencil-func-separate "glStencilFuncSeparate")
    ((face gl-enum)
     (func gl-enum)
     (ref gl-int)
     (mask gl-uint))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-stencil-op-separate "glStencilOpSeparate")
    ((face gl-enum)
     (fail gl-enum)
     (zfail gl-enum)
     (zpass gl-enum))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-stencil-mask-separate "glStencilMaskSeparate")
    ((face gl-enum)
     (mask gl-uint))

  :result-type :void
  :module :gl)

(define-foreign-function (gl-uniform-matrix2x3fv "glUniformMatrix2x3fv")
    ((location gl-int)
     (count gl-sizei)
     (transpose gl-boolean)
     (value (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-uniform-matrix3x2fv "glUniformMatrix3x2fv")
    ((location gl-int)
     (count gl-sizei)
     (transpose gl-boolean)
     (value (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-uniform-matrix2x4fv "glUniformMatrix2x4fv")
    ((location gl-int)
     (count gl-sizei)
     (transpose gl-boolean)
     (value (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-uniform-matrix4x2fv "glUniformMatrix4x2fv")
    ((location gl-int)
     (count gl-sizei)
     (transpose gl-boolean)
     (value (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-uniform-matrix3x4fv "glUniformMatrix3x4fv")
    ((location gl-int)
     (count gl-sizei)
     (transpose gl-boolean)
     (value (:pointer gl-float)))
  :result-type :void
  :module :gl)

(define-foreign-function (gl-uniform-matrix4x3fv "glUniformMatrix4x3fv")
    ((location gl-int)
     (count gl-sizei)
     (transpose gl-boolean)
     (value (:pointer gl-float)))
  :result-type :void
  :module :gl)

