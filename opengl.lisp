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
   #:+GL_2D+
   #:+GL_2_BYTES+
   #:+GL_3D+
   #:+GL_3D_COLOR+
   #:+GL_3D_COLOR_TEXTURE+
   #:+GL_3_BYTES+
   #:+GL_4D_COLOR_TEXTURE+
   #:+GL_4_BYTES+
   #:+GL_ACCUM_ALPHA_BITS+
   #:+GL_ACCUM_BLUE_BITS+
   #:+GL_ACCUM_BUFFER_BIT+
   #:+GL_ACCUM_CLEAR_VALUE+
   #:+GL_ACCUM_GREEN_BITS+
   #:+GL_ACCUM_RED_BITS+
   #:+GL_ACTIVE_ATTRIBUTES+
   #:+GL_ACTIVE_ATTRIBUTE_MAX_LENGTH+
   #:+GL_ACTIVE_TEXTURE+
   #:+GL_ACTIVE_UNIFORMS+
   #:+GL_ACTIVE_UNIFORM_MAX_LENGTH+
   #:+GL_ADD_SIGNED+
   #:+GL_ALIASED_LINE_WIDTH_RANGE+
   #:+GL_ALIASED_POINT_SIZE_RANGE+
   #:+GL_ALL_ATTRIB_BITS+
   #:+GL_ALPHA+
   #:+GL_ALPHA12+
   #:+GL_ALPHA16+
   #:+GL_ALPHA4+
   #:+GL_ALPHA8+
   #:+GL_ALPHA_BIAS+
   #:+GL_ALPHA_BITS+
   #:+GL_ALPHA_SCALE+
   #:+GL_ALPHA_TEST+
   #:+GL_ALPHA_TEST_FUNC+
   #:+GL_ALPHA_TEST_REF+
   #:+GL_AMBIENT+
   #:+GL_AMBIENT_AND_DIFFUSE+
   #:+GL_AND+
   #:+GL_AND_INVERTED+
   #:+GL_AND_REVERSE+
   #:+GL_ARRAY_BUFFER+
   #:+GL_ARRAY_BUFFER_BINDING+
   #:+GL_ATTACHED_SHADERS+
   #:+GL_ATTRIB_STACK_DEPTH+
   #:+GL_AUTO_NORMAL+
   #:+GL_AUX0+
   #:+GL_AUX1+
   #:+GL_AUX2+
   #:+GL_AUX3+
   #:+GL_AUX_BUFFERS+
   #:+GL_BACK+
   #:+GL_BACK_LEFT+
   #:+GL_BACK_RIGHT+
   #:+GL_BGR+
   #:+GL_BGRA+
   #:+GL_BITMAP+
   #:+GL_BITMAP_TOKEN+
   #:+GL_BLEND+
   #:+GL_BLEND_COLOR+
   #:+GL_BLEND_DST+
   #:+GL_BLEND_EQUATION+
   #:+GL_BLEND_EQUATION_ALPHA+
   #:+GL_BLEND_EQUATION_RGB+
   #:+GL_BLEND_SRC+
   #:+GL_BLUE+
   #:+GL_BLUE_BIAS+
   #:+GL_BLUE_BITS+
   #:+GL_BLUE_SCALE+
   #:+GL_BOOL+
   #:+GL_BOOL_VEC2+
   #:+GL_BOOL_VEC3+
   #:+GL_BOOL_VEC4+
   #:+GL_BUFFER_ACCESS+
   #:+GL_BUFFER_MAPPED+
   #:+GL_BUFFER_MAP_POINTER+
   #:+GL_BUFFER_SIZE+
   #:+GL_BUFFER_USAGE+
   #:+GL_BYTE+
   #:+GL_C3F_V3F+
   #:+GL_C4F_N3F_V3F+
   #:+GL_C4UB_V2F+
   #:+GL_C4UB_V3F+
   #:+GL_CCW+
   #:+GL_CLAMP+
   #:+GL_CLAMP_TO_BORDER+
   #:+GL_CLAMP_TO_EDGE+
   #:+GL_CLEAR+
   #:+GL_CLIENT_ACTIVE_TEXTURE+
   #:+GL_CLIENT_ALL_ATTRIB_BITS+
   #:+GL_CLIENT_ATTRIB_STACK_DEPTH+
   #:+GL_CLIENT_PIXEL_STORE_BIT+
   #:+GL_CLIENT_VERTEX_ARRAY_BIT+
   #:+GL_CLIP_PLANE0+
   #:+GL_CLIP_PLANE1+
   #:+GL_CLIP_PLANE2+
   #:+GL_CLIP_PLANE3+
   #:+GL_CLIP_PLANE4+
   #:+GL_CLIP_PLANE5+
   #:+GL_COEFF+
   #:+GL_COLOR+
   #:+GL_COLOR_ARRAY+
   #:+GL_COLOR_ARRAY_BUFFER_BINDING+
   #:+GL_COLOR_ARRAY_POINTER+
   #:+GL_COLOR_ARRAY_SIZE+
   #:+GL_COLOR_ARRAY_STRIDE+
   #:+GL_COLOR_ARRAY_TYPE+
   #:+GL_COLOR_BUFFER_BIT+
   #:+GL_COLOR_CLEAR_VALUE+
   #:+GL_COLOR_INDEX+
   #:+GL_COLOR_INDEXES+
   #:+GL_COLOR_LOGIC_OP+
   #:+GL_COLOR_MATERIAL+
   #:+GL_COLOR_MATERIAL_FACE+
   #:+GL_COLOR_MATERIAL_PARAMETER+
   #:+GL_COLOR_MATRIX+
   #:+GL_COLOR_MATRIX_STACK_DEPTH+
   #:+GL_COLOR_TABLE+
   #:+GL_COLOR_TABLE_ALPHA_SIZE+
   #:+GL_COLOR_TABLE_BIAS+
   #:+GL_COLOR_TABLE_BLUE_SIZE+
   #:+GL_COLOR_TABLE_FORMAT+
   #:+GL_COLOR_TABLE_GREEN_SIZE+
   #:+GL_COLOR_TABLE_INTENSITY_SIZE+
   #:+GL_COLOR_TABLE_LUMINANCE_SIZE+
   #:+GL_COLOR_TABLE_RED_SIZE+
   #:+GL_COLOR_TABLE_SCALE+
   #:+GL_COLOR_TABLE_WIDTH+
   #:+GL_COLOR_WRITEMASK+
   #:+GL_COMBINE+
   #:+GL_COMBINE_ALPHA+
   #:+GL_COMBINE_RGB+
   #:+GL_COMPILE+
   #:+GL_COMPILE_AND_EXECUTE+
   #:+GL_COMPILE_STATUS+
   #:+GL_COMPRESSED_SLUMINANCE+
   #:+GL_COMPRESSED_SLUMINANCE_ALPHA+
   #:+GL_COMPRESSED_SRGB+
   #:+GL_COMPRESSED_SRGB_ALPHA+
   #:+GL_CONSTANT+
   #:+GL_CONSTANT_ALPHA+
   #:+GL_CONSTANT_ATTENUATION+
   #:+GL_CONSTANT_BORDER+
   #:+GL_CONSTANT_COLOR+
   #:+GL_CONVOLUTION_1D+
   #:+GL_CONVOLUTION_2D+
   #:+GL_CONVOLUTION_BORDER_COLOR+
   #:+GL_CONVOLUTION_BORDER_MODE+
   #:+GL_CONVOLUTION_FILTER_BIAS+
   #:+GL_CONVOLUTION_FILTER_SCALE+
   #:+GL_CONVOLUTION_FORMAT+
   #:+GL_CONVOLUTION_HEIGHT+
   #:+GL_CONVOLUTION_WIDTH+
   #:+GL_COORD_REPLACE+
   #:+GL_COPY+
   #:+GL_COPY_INVERTED+
   #:+GL_COPY_PIXEL_TOKEN+
   #:+GL_CULL_FACE+
   #:+GL_CULL_FACE_MODE+
   #:+GL_CURRENT_BIT+
   #:+GL_CURRENT_COLOR+
   #:+GL_CURRENT_FOG_COORD+
   #:+GL_CURRENT_INDEX+
   #:+GL_CURRENT_NORMAL+
   #:+GL_CURRENT_PROGRAM+
   #:+GL_CURRENT_QUERY+
   #:+GL_CURRENT_RASTER_COLOR+
   #:+GL_CURRENT_RASTER_DISTANCE+
   #:+GL_CURRENT_RASTER_INDEX+
   #:+GL_CURRENT_RASTER_POSITION+
   #:+GL_CURRENT_RASTER_POSITION_VALID+
   #:+GL_CURRENT_RASTER_SECONDARY_COLOR+
   #:+GL_CURRENT_RASTER_TEXTURE_COORDS+
   #:+GL_CURRENT_TEXTURE_COORDS+
   #:+GL_CURRENT_VERTEX_ATTRIB+
   #:+GL_CW+
   #:+GL_DECAL+
   #:+GL_DECR+
   #:+GL_DELETE_STATUS+
   #:+GL_DEPTH+
   #:+GL_DEPTH_BIAS+
   #:+GL_DEPTH_BITS+
   #:+GL_DEPTH_BUFFER_BIT+
   #:+GL_DEPTH_CLEAR_VALUE+
   #:+GL_DEPTH_COMPONENT+
   #:+GL_DEPTH_FUNC+
   #:+GL_DEPTH_RANGE+
   #:+GL_DEPTH_SCALE+
   #:+GL_DEPTH_TEST+
   #:+GL_DEPTH_WRITEMASK+
   #:+GL_DIFFUSE+
   #:+GL_DITHER+
   #:+GL_DOMAIN+
   #:+GL_DONT_CARE+
   #:+GL_DOUBLE+
   #:+GL_DOUBLEBUFFER+
   #:+GL_DRAW_BUFFER+
   #:+GL_DRAW_BUFFER0+
   #:+GL_DRAW_BUFFER1+
   #:+GL_DRAW_BUFFER10+
   #:+GL_DRAW_BUFFER11+
   #:+GL_DRAW_BUFFER12+
   #:+GL_DRAW_BUFFER13+
   #:+GL_DRAW_BUFFER14+
   #:+GL_DRAW_BUFFER15+
   #:+GL_DRAW_BUFFER2+
   #:+GL_DRAW_BUFFER3+
   #:+GL_DRAW_BUFFER4+
   #:+GL_DRAW_BUFFER5+
   #:+GL_DRAW_BUFFER6+
   #:+GL_DRAW_BUFFER7+
   #:+GL_DRAW_BUFFER8+
   #:+GL_DRAW_BUFFER9+
   #:+GL_DRAW_PIXEL_TOKEN+
   #:+GL_DST_ALPHA+
   #:+GL_DST_COLOR+
   #:+GL_DYNAMIC_COPY+
   #:+GL_DYNAMIC_DRAW+
   #:+GL_DYNAMIC_READ+
   #:+GL_EDGE_FLAG+
   #:+GL_EDGE_FLAG_ARRAY+
   #:+GL_EDGE_FLAG_ARRAY_BUFFER_BINDING+
   #:+GL_EDGE_FLAG_ARRAY_POINTER+
   #:+GL_EDGE_FLAG_ARRAY_STRIDE+
   #:+GL_ELEMENT_ARRAY_BUFFER+
   #:+GL_ELEMENT_ARRAY_BUFFER_BINDING+
   #:+GL_EMISSION+
   #:+GL_ENABLE_BIT+
   #:+GL_EQUIV+
   #:+GL_EVAL_BIT+
   #:+GL_EXP+
   #:+GL_EXP2+
   #:+GL_EXTENSIONS+
   #:+GL_EYE_LINEAR+
   #:+GL_EYE_PLANE+
   #:+GL_FALSE+
   #:+GL_FASTEST+
   #:+GL_FEEDBACK+
   #:+GL_FEEDBACK_BUFFER_POINTER+
   #:+GL_FEEDBACK_BUFFER_SIZE+
   #:+GL_FEEDBACK_BUFFER_TYPE+
   #:+GL_FILL+
   #:+GL_FLAT+
   #:+GL_FLOAT+
   #:+GL_FLOAT_MAT2+
   #:+GL_FLOAT_MAT2X3+
   #:+GL_FLOAT_MAT2X4+
   #:+GL_FLOAT_MAT3+
   #:+GL_FLOAT_MAT3X2+
   #:+GL_FLOAT_MAT3X4+
   #:+GL_FLOAT_MAT4+
   #:+GL_FLOAT_MAT4X2+
   #:+GL_FLOAT_MAT4X3+
   #:+GL_FLOAT_VEC2+
   #:+GL_FLOAT_VEC3+
   #:+GL_FLOAT_VEC4+
   #:+GL_FOG+
   #:+GL_FOG_BIT+
   #:+GL_FOG_COLOR+
   #:+GL_FOG_COORD+
   #:+GL_FOG_COORD_ARRAY+
   #:+GL_FOG_COORD_ARRAY_BUFFER_BINDING+
   #:+GL_FOG_COORD_ARRAY_POINTER+
   #:+GL_FOG_COORD_ARRAY_STRIDE+
   #:+GL_FOG_COORD_ARRAY_TYPE+
   #:+GL_FOG_COORD_SRC+
   #:+GL_FOG_DENSITY+
   #:+GL_FOG_END+
   #:+GL_FOG_HINT+
   #:+GL_FOG_INDEX+
   #:+GL_FOG_MODE+
   #:+GL_FOG_START+
   #:+GL_FRAGMENT_DEPTH+
   #:+GL_FRAGMENT_SHADER+
   #:+GL_FRAGMENT_SHADER_DERIVATIVE_HINT+
   #:+GL_FRONT+
   #:+GL_FRONT_AND_BACK+
   #:+GL_FRONT_FACE+
   #:+GL_FRONT_LEFT+
   #:+GL_FRONT_RIGHT+
   #:+GL_FUNC_ADD+
   #:+GL_FUNC_REVERSE_SUBTRACT+
   #:+GL_FUNC_SUBTRACT+
   #:+GL_GREEN+
   #:+GL_GREEN_BIAS+
   #:+GL_GREEN_BITS+
   #:+GL_GREEN_SCALE+
   #:+GL_HINT_BIT+
   #:+GL_HISTOGRAM+
   #:+GL_HISTOGRAM_ALPHA_SIZE+
   #:+GL_HISTOGRAM_BLUE_SIZE+
   #:+GL_HISTOGRAM_FORMAT+
   #:+GL_HISTOGRAM_GREEN_SIZE+
   #:+GL_HISTOGRAM_LUMINANCE_SIZE+
   #:+GL_HISTOGRAM_RED_SIZE+
   #:+GL_HISTOGRAM_SINK+
   #:+GL_HISTOGRAM_WIDTH+
   #:+GL_INCR+
   #:+GL_INDEX_ARRAY+
   #:+GL_INDEX_ARRAY_BUFFER_BINDING+
   #:+GL_INDEX_ARRAY_POINTER+
   #:+GL_INDEX_ARRAY_STRIDE+
   #:+GL_INDEX_ARRAY_TYPE+
   #:+GL_INDEX_BITS+
   #:+GL_INDEX_CLEAR_VALUE+
   #:+GL_INDEX_LOGIC_OP+
   #:+GL_INDEX_MODE+
   #:+GL_INDEX_OFFSET+
   #:+GL_INDEX_SHIFT+
   #:+GL_INDEX_WRITEMASK+
   #:+GL_INFO_LOG_LENGTH+
   #:+GL_INT+
   #:+GL_INTENSITY+
   #:+GL_INTENSITY12+
   #:+GL_INTENSITY16+
   #:+GL_INTENSITY4+
   #:+GL_INTENSITY8+
   #:+GL_INTERPOLATE+
   #:+GL_INT_VEC2+
   #:+GL_INT_VEC3+
   #:+GL_INT_VEC4+
   #:+GL_INVALID_ENUM+
   #:+GL_INVALID_OPERATION+
   #:+GL_INVALID_VALUE+
   #:+GL_INVERT+
   #:+GL_KEEP+
   #:+GL_LEFT+
   #:+GL_LIGHT0+
   #:+GL_LIGHT1+
   #:+GL_LIGHT2+
   #:+GL_LIGHT3+
   #:+GL_LIGHT4+
   #:+GL_LIGHT5+
   #:+GL_LIGHT6+
   #:+GL_LIGHT7+
   #:+GL_LIGHTING+
   #:+GL_LIGHTING_BIT+
   #:+GL_LIGHT_MODEL_AMBIENT+
   #:+GL_LIGHT_MODEL_COLOR_CONTROL+
   #:+GL_LIGHT_MODEL_LOCAL_VIEWER+
   #:+GL_LIGHT_MODEL_TWO_SIDE+
   #:+GL_LINE+
   #:+GL_LINEAR+
   #:+GL_LINEAR_ATTENUATION+
   #:+GL_LINEAR_MIPMAP_LINEAR+
   #:+GL_LINEAR_MIPMAP_NEAREST+
   #:+GL_LINES+
   #:+GL_LINE_BIT+
   #:+GL_LINE_LOOP+
   #:+GL_LINE_RESET_TOKEN+
   #:+GL_LINE_SMOOTH+
   #:+GL_LINE_SMOOTH_HINT+
   #:+GL_LINE_STIPPLE+
   #:+GL_LINE_STIPPLE_PATTERN+
   #:+GL_LINE_STIPPLE_REPEAT+
   #:+GL_LINE_STRIP+
   #:+GL_LINE_TOKEN+
   #:+GL_LINE_WIDTH+
   #:+GL_LINE_WIDTH_GRANULARITY+
   #:+GL_LINE_WIDTH_RANGE+
   #:+GL_LINK_STATUS+
   #:+GL_LIST_BASE+
   #:+GL_LIST_BIT+
   #:+GL_LIST_INDEX+
   #:+GL_LIST_MODE+
   #:+GL_LOGIC_OP_MODE+
   #:+GL_LOWER_LEFT+
   #:+GL_LUMINANCE+
   #:+GL_LUMINANCE12+
   #:+GL_LUMINANCE12_ALPHA12+
   #:+GL_LUMINANCE12_ALPHA4+
   #:+GL_LUMINANCE16+
   #:+GL_LUMINANCE16_ALPHA16+
   #:+GL_LUMINANCE4+
   #:+GL_LUMINANCE4_ALPHA4+
   #:+GL_LUMINANCE6_ALPHA2+
   #:+GL_LUMINANCE8+
   #:+GL_LUMINANCE8_ALPHA8+
   #:+GL_LUMINANCE_ALPHA+
   #:+GL_MAP1_COLOR_4+
   #:+GL_MAP1_GRID_DOMAIN+
   #:+GL_MAP1_GRID_SEGMENTS+
   #:+GL_MAP1_INDEX+
   #:+GL_MAP1_NORMAL+
   #:+GL_MAP1_TEXTURE_COORD_1+
   #:+GL_MAP1_TEXTURE_COORD_2+
   #:+GL_MAP1_TEXTURE_COORD_3+
   #:+GL_MAP1_TEXTURE_COORD_4+
   #:+GL_MAP1_VERTEX_3+
   #:+GL_MAP1_VERTEX_4+
   #:+GL_MAP2_COLOR_4+
   #:+GL_MAP2_GRID_DOMAIN+
   #:+GL_MAP2_GRID_SEGMENTS+
   #:+GL_MAP2_INDEX+
   #:+GL_MAP2_NORMAL+
   #:+GL_MAP2_TEXTURE_COORD_1+
   #:+GL_MAP2_TEXTURE_COORD_2+
   #:+GL_MAP2_TEXTURE_COORD_3+
   #:+GL_MAP2_TEXTURE_COORD_4+
   #:+GL_MAP2_VERTEX_3+
   #:+GL_MAP2_VERTEX_4+
   #:+GL_MAP_COLOR+
   #:+GL_MAP_STENCIL+
   #:+GL_MATRIX_MODE+
   #:+GL_MAX+
   #:+GL_MAX_3D_TEXTURE_SIZE+
   #:+GL_MAX_ATTRIB_STACK_DEPTH+
   #:+GL_MAX_CLIENT_ATTRIB_STACK_DEPTH+
   #:+GL_MAX_CLIP_PLANES+
   #:+GL_MAX_COLOR_MATRIX_STACK_DEPTH+
   #:+GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS+
   #:+GL_MAX_CONVOLUTION_HEIGHT+
   #:+GL_MAX_CONVOLUTION_WIDTH+
   #:+GL_MAX_DRAW_BUFFERS+
   #:+GL_MAX_ELEMENTS_INDICES+
   #:+GL_MAX_ELEMENTS_VERTICES+
   #:+GL_MAX_EVAL_ORDER+
   #:+GL_MAX_FRAGMENT_UNIFORM_COMPONENTS+
   #:+GL_MAX_LIGHTS+
   #:+GL_MAX_LIST_NESTING+
   #:+GL_MAX_MODELVIEW_STACK_DEPTH+
   #:+GL_MAX_NAME_STACK_DEPTH+
   #:+GL_MAX_PIXEL_MAP_TABLE+
   #:+GL_MAX_PROJECTION_STACK_DEPTH+
   #:+GL_MAX_TEXTURE_COORDS+
   #:+GL_MAX_TEXTURE_IMAGE_UNITS+
   #:+GL_MAX_TEXTURE_SIZE+
   #:+GL_MAX_TEXTURE_STACK_DEPTH+
   #:+GL_MAX_TEXTURE_UNITS+
   #:+GL_MAX_VARYING_FLOATS+
   #:+GL_MAX_VERTEX_ATTRIBS+
   #:+GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS+
   #:+GL_MAX_VERTEX_UNIFORM_COMPONENTS+
   #:+GL_MAX_VIEWPORT_DIMS+
   #:+GL_MIN+
   #:+GL_MINMAX+
   #:+GL_MINMAX_FORMAT+
   #:+GL_MINMAX_SINK+
   #:+GL_MODELVIEW+
   #:+GL_MODELVIEW_MATRIX+
   #:+GL_MODELVIEW_STACK_DEPTH+
   #:+GL_MODULATE+
   #:+GL_N3F_V3F+
   #:+GL_NAME_STACK_DEPTH+
   #:+GL_NAND+
   #:+GL_NEAREST+
   #:+GL_NEAREST_MIPMAP_LINEAR+
   #:+GL_NEAREST_MIPMAP_NEAREST+
   #:+GL_NICEST+
   #:+GL_NONE+
   #:+GL_NOOP+
   #:+GL_NOR+
   #:+GL_NORMALIZE+
   #:+GL_NORMAL_ARRAY+
   #:+GL_NORMAL_ARRAY_BUFFER_BINDING+
   #:+GL_NORMAL_ARRAY_POINTER+
   #:+GL_NORMAL_ARRAY_STRIDE+
   #:+GL_NORMAL_ARRAY_TYPE+
   #:+GL_NO_ERROR+
   #:+GL_OBJECT_LINEAR+
   #:+GL_OBJECT_PLANE+
   #:+GL_ONE+
   #:+GL_ONE_MINUS_CONSTANT_ALPHA+
   #:+GL_ONE_MINUS_CONSTANT_COLOR+
   #:+GL_ONE_MINUS_DST_ALPHA+
   #:+GL_ONE_MINUS_DST_COLOR+
   #:+GL_ONE_MINUS_SRC_ALPHA+
   #:+GL_ONE_MINUS_SRC_COLOR+
   #:+GL_OR+
   #:+GL_ORDER+
   #:+GL_OR_INVERTED+
   #:+GL_OR_REVERSE+
   #:+GL_OUT_OF_MEMORY+
   #:+GL_PACK_ALIGNMENT+
   #:+GL_PACK_IMAGE_HEIGHT+
   #:+GL_PACK_LSB_FIRST+
   #:+GL_PACK_ROW_LENGTH+
   #:+GL_PACK_SKIP_IMAGES+
   #:+GL_PACK_SKIP_PIXELS+
   #:+GL_PACK_SKIP_ROWS+
   #:+GL_PACK_SWAP_BYTES+
   #:+GL_PASS_THROUGH_TOKEN+
   #:+GL_PERSPECTIVE_CORRECTION_HINT+
   #:+GL_PIXEL_MAP_A_TO_A+
   #:+GL_PIXEL_MAP_A_TO_A_SIZE+
   #:+GL_PIXEL_MAP_B_TO_B+
   #:+GL_PIXEL_MAP_B_TO_B_SIZE+
   #:+GL_PIXEL_MAP_G_TO_G+
   #:+GL_PIXEL_MAP_G_TO_G_SIZE+
   #:+GL_PIXEL_MAP_I_TO_A+
   #:+GL_PIXEL_MAP_I_TO_A_SIZE+
   #:+GL_PIXEL_MAP_I_TO_B+
   #:+GL_PIXEL_MAP_I_TO_B_SIZE+
   #:+GL_PIXEL_MAP_I_TO_G+
   #:+GL_PIXEL_MAP_I_TO_G_SIZE+
   #:+GL_PIXEL_MAP_I_TO_I+
   #:+GL_PIXEL_MAP_I_TO_I_SIZE+
   #:+GL_PIXEL_MAP_I_TO_R+
   #:+GL_PIXEL_MAP_I_TO_R_SIZE+
   #:+GL_PIXEL_MAP_R_TO_R+
   #:+GL_PIXEL_MAP_R_TO_R_SIZE+
   #:+GL_PIXEL_MAP_S_TO_S+
   #:+GL_PIXEL_MAP_S_TO_S_SIZE+
   #:+GL_PIXEL_MODE_BIT+
   #:+GL_PIXEL_PACK_BUFFER+
   #:+GL_PIXEL_PACK_BUFFER_BINDING+
   #:+GL_PIXEL_UNPACK_BUFFER+
   #:+GL_PIXEL_UNPACK_BUFFER_BINDING+
   #:+GL_POINT+
   #:+GL_POINTS+
   #:+GL_POINT_BIT+
   #:+GL_POINT_SIZE+
   #:+GL_POINT_SIZE_GRANULARITY+
   #:+GL_POINT_SIZE_RANGE+
   #:+GL_POINT_SMOOTH+
   #:+GL_POINT_SMOOTH_HINT+
   #:+GL_POINT_SPRITE+
   #:+GL_POINT_SPRITE_COORD_ORIGIN+
   #:+GL_POINT_TOKEN+
   #:+GL_POLYGON+
   #:+GL_POLYGON_BIT+
   #:+GL_POLYGON_MODE+
   #:+GL_POLYGON_OFFSET_FACTOR+
   #:+GL_POLYGON_OFFSET_FILL+
   #:+GL_POLYGON_OFFSET_LINE+
   #:+GL_POLYGON_OFFSET_POINT+
   #:+GL_POLYGON_OFFSET_UNITS+
   #:+GL_POLYGON_SMOOTH+
   #:+GL_POLYGON_SMOOTH_HINT+
   #:+GL_POLYGON_STIPPLE+
   #:+GL_POLYGON_STIPPLE_BIT+
   #:+GL_POLYGON_TOKEN+
   #:+GL_POSITION+
   #:+GL_POST_COLOR_MATRIX_ALPHA_BIAS+
   #:+GL_POST_COLOR_MATRIX_ALPHA_SCALE+
   #:+GL_POST_COLOR_MATRIX_BLUE_BIAS+
   #:+GL_POST_COLOR_MATRIX_BLUE_SCALE+
   #:+GL_POST_COLOR_MATRIX_COLOR_TABLE+
   #:+GL_POST_COLOR_MATRIX_GREEN_BIAS+
   #:+GL_POST_COLOR_MATRIX_GREEN_SCALE+
   #:+GL_POST_COLOR_MATRIX_RED_BIAS+
   #:+GL_POST_COLOR_MATRIX_RED_SCALE+
   #:+GL_POST_CONVOLUTION_ALPHA_BIAS+
   #:+GL_POST_CONVOLUTION_ALPHA_SCALE+
   #:+GL_POST_CONVOLUTION_BLUE_BIAS+
   #:+GL_POST_CONVOLUTION_BLUE_SCALE+
   #:+GL_POST_CONVOLUTION_COLOR_TABLE+
   #:+GL_POST_CONVOLUTION_GREEN_BIAS+
   #:+GL_POST_CONVOLUTION_GREEN_SCALE+
   #:+GL_POST_CONVOLUTION_RED_BIAS+
   #:+GL_POST_CONVOLUTION_RED_SCALE+
   #:+GL_PREVIOUS+
   #:+GL_PRIMARY_COLOR+
   #:+GL_PROJECTION+
   #:+GL_PROJECTION_MATRIX+
   #:+GL_PROJECTION_STACK_DEPTH+
   #:+GL_PROXY_COLOR_TABLE+
   #:+GL_PROXY_HISTOGRAM+
   #:+GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE+
   #:+GL_PROXY_POST_CONVOLUTION_COLOR_TABLE+
   #:+GL_PROXY_TEXTURE_1D+
   #:+GL_PROXY_TEXTURE_2D+
   #:+GL_PROXY_TEXTURE_3D+
   #:+GL_Q+
   #:+GL_QUADRATIC_ATTENUATION+
   #:+GL_QUADS+
   #:+GL_QUAD_STRIP+
   #:+GL_QUERY_COUNTER_BITS+
   #:+GL_QUERY_RESULT+
   #:+GL_QUERY_RESULT_AVAILABLE+
   #:+GL_R+
   #:+GL_R3_G3_B2+
   #:+GL_READ_BUFFER+
   #:+GL_READ_ONLY+
   #:+GL_READ_WRITE+
   #:+GL_RED+
   #:+GL_REDUCE+
   #:+GL_RED_BIAS+
   #:+GL_RED_BITS+
   #:+GL_RED_SCALE+
   #:+GL_RENDER+
   #:+GL_RENDERER+
   #:+GL_RENDER_MODE+
   #:+GL_REPEAT+
   #:+GL_REPLACE+
   #:+GL_REPLICATE_BORDER+
   #:+GL_RESCALE_NORMAL+
   #:+GL_RGB+
   #:+GL_RGB10+
   #:+GL_RGB10_A2+
   #:+GL_RGB12+
   #:+GL_RGB16+
   #:+GL_RGB4+
   #:+GL_RGB5+
   #:+GL_RGB5_A1+
   #:+GL_RGB8+
   #:+GL_RGBA+
   #:+GL_RGBA12+
   #:+GL_RGBA16+
   #:+GL_RGBA2+
   #:+GL_RGBA4+
   #:+GL_RGBA8+
   #:+GL_RGBA_MODE+
   #:+GL_RGB_SCALE+
   #:+GL_RIGHT+
   #:+GL_S+
   #:+GL_SAMPLER_1D+
   #:+GL_SAMPLER_1D_SHADOW+
   #:+GL_SAMPLER_2D+
   #:+GL_SAMPLER_2D_SHADOW+
   #:+GL_SAMPLER_3D+
   #:+GL_SAMPLER_CUBE+
   #:+GL_SAMPLES_PASSED+
   #:+GL_SCISSOR_BIT+
   #:+GL_SCISSOR_BOX+
   #:+GL_SCISSOR_TEST+
   #:+GL_SECONDARY_COLOR_ARRAY_BUFFER_BINDING+
   #:+GL_SELECT+
   #:+GL_SELECTION_BUFFER_POINTER+
   #:+GL_SELECTION_BUFFER_SIZE+
   #:+GL_SEPARABLE_2D+
   #:+GL_SEPARATE_SPECULAR_COLOR+
   #:+GL_SET+
   #:+GL_SHADER_SOURCE_LENGTH+
   #:+GL_SHADER_TYPE+
   #:+GL_SHADE_MODEL+
   #:+GL_SHADING_LANGUAGE_VERSION+
   #:+GL_SHININESS+
   #:+GL_SHORT+
   #:+GL_SINGLE_COLOR+
   #:+GL_SLUMINANCE+
   #:+GL_SLUMINANCE8+
   #:+GL_SLUMINANCE8_ALPHA8+
   #:+GL_SLUMINANCE_ALPHA+
   #:+GL_SMOOTH+
   #:+GL_SMOOTH_LINE_WIDTH_GRANULARITY+
   #:+GL_SMOOTH_LINE_WIDTH_RANGE+
   #:+GL_SMOOTH_POINT_SIZE_GRANULARITY+
   #:+GL_SMOOTH_POINT_SIZE_RANGE+
   #:+GL_SPECULAR+
   #:+GL_SPHERE_MAP+
   #:+GL_SPOT_CUTOFF+
   #:+GL_SPOT_DIRECTION+
   #:+GL_SPOT_EXPONENT+
   #:+GL_SRC0_ALPHA+
   #:+GL_SRC0_RGB+
   #:+GL_SRC1_ALPHA+
   #:+GL_SRC1_RGB+
   #:+GL_SRC2_ALPHA+
   #:+GL_SRC2_RGB+
   #:+GL_SRC_ALPHA+
   #:+GL_SRC_ALPHA_SATURATE+
   #:+GL_SRC_COLOR+
   #:+GL_SRGB+
   #:+GL_SRGB8+
   #:+GL_SRGB8_ALPHA8+
   #:+GL_SRGB_ALPHA+
   #:+GL_STACK_OVERFLOW+
   #:+GL_STACK_UNDERFLOW+
   #:+GL_STATIC_COPY+
   #:+GL_STATIC_DRAW+
   #:+GL_STATIC_READ+
   #:+GL_STENCIL+
   #:+GL_STENCIL_BACK_FAIL+
   #:+GL_STENCIL_BACK_FUNC+
   #:+GL_STENCIL_BACK_PASS_DEPTH_FAIL+
   #:+GL_STENCIL_BACK_PASS_DEPTH_PASS+
   #:+GL_STENCIL_BACK_REF+
   #:+GL_STENCIL_BACK_VALUE_MASK+
   #:+GL_STENCIL_BACK_WRITEMASK+
   #:+GL_STENCIL_BITS+
   #:+GL_STENCIL_BUFFER_BIT+
   #:+GL_STENCIL_CLEAR_VALUE+
   #:+GL_STENCIL_FAIL+
   #:+GL_STENCIL_FUNC+
   #:+GL_STENCIL_INDEX+
   #:+GL_STENCIL_PASS_DEPTH_FAIL+
   #:+GL_STENCIL_PASS_DEPTH_PASS+
   #:+GL_STENCIL_REF+
   #:+GL_STENCIL_TEST+
   #:+GL_STENCIL_VALUE_MASK+
   #:+GL_STENCIL_WRITEMASK+
   #:+GL_STEREO+
   #:+GL_STREAM_COPY+
   #:+GL_STREAM_DRAW+
   #:+GL_STREAM_READ+
   #:+GL_SUBPIXEL_BITS+
   #:+GL_SUBTRACT+
   #:+GL_T+
   #:+GL_T2F_C3F_V3F+
   #:+GL_T2F_C4F_N3F_V3F+
   #:+GL_T2F_C4UB_V3F+
   #:+GL_T2F_N3F_V3F+
   #:+GL_T2F_V3F+
   #:+GL_T4F_C4F_N3F_V4F+
   #:+GL_T4F_V4F+
   #:+GL_TABLE_TOO_LARGE+
   #:+GL_TEXTURE+
   #:+GL_TEXTURE0+
   #:+GL_TEXTURE1+
   #:+GL_TEXTURE10+
   #:+GL_TEXTURE11+
   #:+GL_TEXTURE12+
   #:+GL_TEXTURE13+
   #:+GL_TEXTURE14+
   #:+GL_TEXTURE15+
   #:+GL_TEXTURE16+
   #:+GL_TEXTURE17+
   #:+GL_TEXTURE18+
   #:+GL_TEXTURE19+
   #:+GL_TEXTURE2+
   #:+GL_TEXTURE20+
   #:+GL_TEXTURE21+
   #:+GL_TEXTURE22+
   #:+GL_TEXTURE23+
   #:+GL_TEXTURE24+
   #:+GL_TEXTURE25+
   #:+GL_TEXTURE26+
   #:+GL_TEXTURE27+
   #:+GL_TEXTURE28+
   #:+GL_TEXTURE29+
   #:+GL_TEXTURE3+
   #:+GL_TEXTURE30+
   #:+GL_TEXTURE31+
   #:+GL_TEXTURE4+
   #:+GL_TEXTURE5+
   #:+GL_TEXTURE6+
   #:+GL_TEXTURE7+
   #:+GL_TEXTURE8+
   #:+GL_TEXTURE9+
   #:+GL_TEXTURE_1D+
   #:+GL_TEXTURE_2D+
   #:+GL_TEXTURE_3D+
   #:+GL_TEXTURE_ALPHA_SIZE+
   #:+GL_TEXTURE_BASE_LEVEL+
   #:+GL_TEXTURE_BINDING_1D+
   #:+GL_TEXTURE_BINDING_2D+
   #:+GL_TEXTURE_BINDING_3D+
   #:+GL_TEXTURE_BIT+
   #:+GL_TEXTURE_BLUE_SIZE+
   #:+GL_TEXTURE_BORDER+
   #:+GL_TEXTURE_BORDER_COLOR+
   #:+GL_TEXTURE_COORD_ARRAY+
   #:+GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING+
   #:+GL_TEXTURE_COORD_ARRAY_POINTER+
   #:+GL_TEXTURE_COORD_ARRAY_SIZE+
   #:+GL_TEXTURE_COORD_ARRAY_STRIDE+
   #:+GL_TEXTURE_COORD_ARRAY_TYPE+
   #:+GL_TEXTURE_DEPTH+
   #:+GL_TEXTURE_ENV+
   #:+GL_TEXTURE_ENV_COLOR+
   #:+GL_TEXTURE_ENV_MODE+
   #:+GL_TEXTURE_GEN_MODE+
   #:+GL_TEXTURE_GEN_Q+
   #:+GL_TEXTURE_GEN_R+
   #:+GL_TEXTURE_GEN_S+
   #:+GL_TEXTURE_GEN_T+
   #:+GL_TEXTURE_GREEN_SIZE+
   #:+GL_TEXTURE_HEIGHT+
   #:+GL_TEXTURE_INTENSITY_SIZE+
   #:+GL_TEXTURE_INTERNAL_FORMAT+
   #:+GL_TEXTURE_LUMINANCE_SIZE+
   #:+GL_TEXTURE_MAG_FILTER+
   #:+GL_TEXTURE_MATRIX+
   #:+GL_TEXTURE_MAX_LEVEL+
   #:+GL_TEXTURE_MAX_LOD+
   #:+GL_TEXTURE_MIN_FILTER+
   #:+GL_TEXTURE_MIN_LOD+
   #:+GL_TEXTURE_PRIORITY+
   #:+GL_TEXTURE_RED_SIZE+
   #:+GL_TEXTURE_RESIDENT+
   #:+GL_TEXTURE_STACK_DEPTH+
   #:+GL_TEXTURE_WIDTH+
   #:+GL_TEXTURE_WRAP_R+
   #:+GL_TEXTURE_WRAP_S+
   #:+GL_TEXTURE_WRAP_T+
   #:+GL_TRANSFORM_BIT+
   #:+GL_TRIANGLES+
   #:+GL_TRIANGLE_FAN+
   #:+GL_TRIANGLE_STRIP+
   #:+GL_TRUE+
   #:+GL_UNPACK_ALIGNMENT+
   #:+GL_UNPACK_IMAGE_HEIGHT+
   #:+GL_UNPACK_LSB_FIRST+
   #:+GL_UNPACK_ROW_LENGTH+
   #:+GL_UNPACK_SKIP_IMAGES+
   #:+GL_UNPACK_SKIP_PIXELS+
   #:+GL_UNPACK_SKIP_ROWS+
   #:+GL_UNPACK_SWAP_BYTES+
   #:+GL_UNSIGNED_BYTE+
   #:+GL_UNSIGNED_BYTE_2_3_3_REV+
   #:+GL_UNSIGNED_BYTE_3_3_2+
   #:+GL_UNSIGNED_INT+
   #:+GL_UNSIGNED_INT_10_10_10_2+
   #:+GL_UNSIGNED_INT_2_10_10_10_REV+
   #:+GL_UNSIGNED_INT_8_8_8_8+
   #:+GL_UNSIGNED_INT_8_8_8_8_REV+
   #:+GL_UNSIGNED_SHORT+
   #:+GL_UNSIGNED_SHORT_1_5_5_5_REV+
   #:+GL_UNSIGNED_SHORT_4_4_4_4+
   #:+GL_UNSIGNED_SHORT_4_4_4_4_REV+
   #:+GL_UNSIGNED_SHORT_5_5_5_1+
   #:+GL_UNSIGNED_SHORT_5_6_5+
   #:+GL_UNSIGNED_SHORT_5_6_5_REV+
   #:+GL_UPPER_LEFT+
   #:+GL_V2F+
   #:+GL_V3F+
   #:+GL_VALIDATE_STATUS+
   #:+GL_VENDOR+
   #:+GL_VERSION+
   #:+GL_VERTEX_ARRAY+
   #:+GL_VERTEX_ARRAY_BUFFER_BINDING+
   #:+GL_VERTEX_ARRAY_POINTER+
   #:+GL_VERTEX_ARRAY_SIZE+
   #:+GL_VERTEX_ARRAY_STRIDE+
   #:+GL_VERTEX_ARRAY_TYPE+
   #:+GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING+
   #:+GL_VERTEX_ATTRIB_ARRAY_ENABLED+
   #:+GL_VERTEX_ATTRIB_ARRAY_NORMALIZED+
   #:+GL_VERTEX_ATTRIB_ARRAY_POINTER+
   #:+GL_VERTEX_ATTRIB_ARRAY_SIZE+
   #:+GL_VERTEX_ATTRIB_ARRAY_STRIDE+
   #:+GL_VERTEX_ATTRIB_ARRAY_TYPE+
   #:+GL_VERTEX_PROGRAM_POINT_SIZE+
   #:+GL_VERTEX_PROGRAM_TWO_SIDE+
   #:+GL_VERTEX_SHADER+
   #:+GL_VIEWPORT+
   #:+GL_VIEWPORT_BIT+
   #:+GL_WEIGHT_ARRAY_BUFFER_BINDING+
   #:+GL_WRITE_ONLY+
   #:+GL_XOR+
   #:+GL_ZERO+
   #:+GL_ZOOM_X+
   #:+GL_ZOOM_Y+))

(in-package :opengl)

;;; register the dynamic library
(eval-when (:load-toplevel :execute)
  (let ((dll #+cocoa #p"/System/Library/Frameworks/OpenGL.FrameWork/OpenGL"
             #+windows #p"opengl32.dll"))
    (register-module :gl :real-name dll :connection-style :immediate)))

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
(define-c-typedef gl-float :float)
(define-c-typedef gl-clampf :float)
(define-c-typedef gl-void :void)
(define-c-typedef gl-double :double)
(define-c-typedef gl-clampd :double)
(define-c-typedef gl-char :char)
(define-c-typedef gl-half :unsigned-short)

;;; pointer types
(define-c-typedef gl-intptr (:pointer gl-int))
(define-c-typedef gl-sizeiptr (:pointer gl-sizei))

;;; constants

(defconstant +GL_2D+ #X0600)
(defconstant +GL_2_BYTES+ #X1407)
(defconstant +GL_3D+ #X0601)
(defconstant +GL_3D_COLOR+ #X0602)
(defconstant +GL_3D_COLOR_TEXTURE+ #X0603)
(defconstant +GL_3_BYTES+ #X1408)
(defconstant +GL_4D_COLOR_TEXTURE+ #X0604)
(defconstant +GL_4_BYTES+ #X1409)
(defconstant +GL_ACCUM_ALPHA_BITS+ #X0D5B)
(defconstant +GL_ACCUM_BLUE_BITS+ #X0D5A)
(defconstant +GL_ACCUM_BUFFER_BIT+ #X00000200)
(defconstant +GL_ACCUM_CLEAR_VALUE+ #X0B80)
(defconstant +GL_ACCUM_GREEN_BITS+ #X0D59)
(defconstant +GL_ACCUM_RED_BITS+ #X0D58)
(defconstant +GL_ACTIVE_ATTRIBUTES+ #X8B89)
(defconstant +GL_ACTIVE_ATTRIBUTE_MAX_LENGTH+ #X8B8A)
(defconstant +GL_ACTIVE_TEXTURE+ #X84E0)
(defconstant +GL_ACTIVE_UNIFORMS+ #X8B86)
(defconstant +GL_ACTIVE_UNIFORM_MAX_LENGTH+ #X8B87)
(defconstant +GL_ADD_SIGNED+ #X8574)
(defconstant +GL_ALIASED_LINE_WIDTH_RANGE+ #X846E)
(defconstant +GL_ALIASED_POINT_SIZE_RANGE+ #X846D)
(defconstant +GL_ALL_ATTRIB_BITS+ #X000FFFFF)
(defconstant +GL_ALPHA+ #X1906)
(defconstant +GL_ALPHA12+ #X803D)
(defconstant +GL_ALPHA16+ #X803E)
(defconstant +GL_ALPHA4+ #X803B)
(defconstant +GL_ALPHA8+ #X803C)
(defconstant +GL_ALPHA_BIAS+ #X0D1D)
(defconstant +GL_ALPHA_BITS+ #X0D55)
(defconstant +GL_ALPHA_SCALE+ #X0D1C)
(defconstant +GL_ALPHA_TEST+ #X0BC0)
(defconstant +GL_ALPHA_TEST_FUNC+ #X0BC1)
(defconstant +GL_ALPHA_TEST_REF+ #X0BC2)
(defconstant +GL_AMBIENT+ #X1200)
(defconstant +GL_AMBIENT_AND_DIFFUSE+ #X1602)
(defconstant +GL_AND+ #X1501)
(defconstant +GL_AND_INVERTED+ #X1504)
(defconstant +GL_AND_REVERSE+ #X1502)
(defconstant +GL_ARRAY_BUFFER+ #X8892)
(defconstant +GL_ARRAY_BUFFER_BINDING+ #X8894)
(defconstant +GL_ATTACHED_SHADERS+ #X8B85)
(defconstant +GL_ATTRIB_STACK_DEPTH+ #X0BB0)
(defconstant +GL_AUTO_NORMAL+ #X0D80)
(defconstant +GL_AUX0+ #X0409)
(defconstant +GL_AUX1+ #X040A)
(defconstant +GL_AUX2+ #X040B)
(defconstant +GL_AUX3+ #X040C)
(defconstant +GL_AUX_BUFFERS+ #X0C00)
(defconstant +GL_BACK+ #X0405)
(defconstant +GL_BACK_LEFT+ #X0402)
(defconstant +GL_BACK_RIGHT+ #X0403)
(defconstant +GL_BGR+ #X80E0)
(defconstant +GL_BGRA+ #X80E1)
(defconstant +GL_BITMAP+ #X1A00)
(defconstant +GL_BITMAP_TOKEN+ #X0704)
(defconstant +GL_BLEND+ #X0BE2)
(defconstant +GL_BLEND_COLOR+ #X8005)
(defconstant +GL_BLEND_DST+ #X0BE0)
(defconstant +GL_BLEND_EQUATION+ #X8009)
(defconstant +GL_BLEND_EQUATION_ALPHA+ #X883D)
(defconstant +GL_BLEND_EQUATION_RGB+ #X8009)
(defconstant +GL_BLEND_SRC+ #X0BE1)
(defconstant +GL_BLUE+ #X1905)
(defconstant +GL_BLUE_BIAS+ #X0D1B)
(defconstant +GL_BLUE_BITS+ #X0D54)
(defconstant +GL_BLUE_SCALE+ #X0D1A)
(defconstant +GL_BOOL+ #X8B56)
(defconstant +GL_BOOL_VEC2+ #X8B57)
(defconstant +GL_BOOL_VEC3+ #X8B58)
(defconstant +GL_BOOL_VEC4+ #X8B59)
(defconstant +GL_BUFFER_ACCESS+ #X88BB)
(defconstant +GL_BUFFER_MAPPED+ #X88BC)
(defconstant +GL_BUFFER_MAP_POINTER+ #X88BD)
(defconstant +GL_BUFFER_SIZE+ #X8764)
(defconstant +GL_BUFFER_USAGE+ #X8765)
(defconstant +GL_BYTE+ #X1400)
(defconstant +GL_C3F_V3F+ #X2A24)
(defconstant +GL_C4F_N3F_V3F+ #X2A26)
(defconstant +GL_C4UB_V2F+ #X2A22)
(defconstant +GL_C4UB_V3F+ #X2A23)
(defconstant +GL_CCW+ #X0901)
(defconstant +GL_CLAMP+ #X2900)
(defconstant +GL_CLAMP_TO_BORDER+ #X812D)
(defconstant +GL_CLAMP_TO_EDGE+ #X812F)
(defconstant +GL_CLEAR+ #X1500)
(defconstant +GL_CLIENT_ACTIVE_TEXTURE+ #X84E1)
(defconstant +GL_CLIENT_ALL_ATTRIB_BITS+ #XFFFFFFFF)
(defconstant +GL_CLIENT_ATTRIB_STACK_DEPTH+ #X0BB1)
(defconstant +GL_CLIENT_PIXEL_STORE_BIT+ #X00000001)
(defconstant +GL_CLIENT_VERTEX_ARRAY_BIT+ #X00000002)
(defconstant +GL_CLIP_PLANE0+ #X3000)
(defconstant +GL_CLIP_PLANE1+ #X3001)
(defconstant +GL_CLIP_PLANE2+ #X3002)
(defconstant +GL_CLIP_PLANE3+ #X3003)
(defconstant +GL_CLIP_PLANE4+ #X3004)
(defconstant +GL_CLIP_PLANE5+ #X3005)
(defconstant +GL_COEFF+ #X0A00)
(defconstant +GL_COLOR+ #X1800)
(defconstant +GL_COLOR_ARRAY+ #X8076)
(defconstant +GL_COLOR_ARRAY_BUFFER_BINDING+ #X8898)
(defconstant +GL_COLOR_ARRAY_POINTER+ #X8090)
(defconstant +GL_COLOR_ARRAY_SIZE+ #X8081)
(defconstant +GL_COLOR_ARRAY_STRIDE+ #X8083)
(defconstant +GL_COLOR_ARRAY_TYPE+ #X8082)
(defconstant +GL_COLOR_BUFFER_BIT+ #X00004000)
(defconstant +GL_COLOR_CLEAR_VALUE+ #X0C22)
(defconstant +GL_COLOR_INDEX+ #X1900)
(defconstant +GL_COLOR_INDEXES+ #X1603)
(defconstant +GL_COLOR_LOGIC_OP+ #X0BF2)
(defconstant +GL_COLOR_MATERIAL+ #X0B57)
(defconstant +GL_COLOR_MATERIAL_FACE+ #X0B55)
(defconstant +GL_COLOR_MATERIAL_PARAMETER+ #X0B56)
(defconstant +GL_COLOR_MATRIX+ #X80B1)
(defconstant +GL_COLOR_MATRIX_STACK_DEPTH+ #X80B2)
(defconstant +GL_COLOR_TABLE+ #X80D0)
(defconstant +GL_COLOR_TABLE_ALPHA_SIZE+ #X80DD)
(defconstant +GL_COLOR_TABLE_BIAS+ #X80D7)
(defconstant +GL_COLOR_TABLE_BLUE_SIZE+ #X80DC)
(defconstant +GL_COLOR_TABLE_FORMAT+ #X80D8)
(defconstant +GL_COLOR_TABLE_GREEN_SIZE+ #X80DB)
(defconstant +GL_COLOR_TABLE_INTENSITY_SIZE+ #X80DF)
(defconstant +GL_COLOR_TABLE_LUMINANCE_SIZE+ #X80DE)
(defconstant +GL_COLOR_TABLE_RED_SIZE+ #X80DA)
(defconstant +GL_COLOR_TABLE_SCALE+ #X80D6)
(defconstant +GL_COLOR_TABLE_WIDTH+ #X80D9)
(defconstant +GL_COLOR_WRITEMASK+ #X0C23)
(defconstant +GL_COMBINE+ #X8570)
(defconstant +GL_COMBINE_ALPHA+ #X8572)
(defconstant +GL_COMBINE_RGB+ #X8571)
(defconstant +GL_COMPILE+ #X1300)
(defconstant +GL_COMPILE_AND_EXECUTE+ #X1301)
(defconstant +GL_COMPILE_STATUS+ #X8B81)
(defconstant +GL_COMPRESSED_SLUMINANCE+ #X8C4A)
(defconstant +GL_COMPRESSED_SLUMINANCE_ALPHA+ #X8C4B)
(defconstant +GL_COMPRESSED_SRGB+ #X8C48)
(defconstant +GL_COMPRESSED_SRGB_ALPHA+ #X8C49)
(defconstant +GL_CONSTANT+ #X8576)
(defconstant +GL_CONSTANT_ALPHA+ #X8003)
(defconstant +GL_CONSTANT_ATTENUATION+ #X1207)
(defconstant +GL_CONSTANT_BORDER+ #X8151)
(defconstant +GL_CONSTANT_COLOR+ #X8001)
(defconstant +GL_CONVOLUTION_1D+ #X8010)
(defconstant +GL_CONVOLUTION_2D+ #X8011)
(defconstant +GL_CONVOLUTION_BORDER_COLOR+ #X8154)
(defconstant +GL_CONVOLUTION_BORDER_MODE+ #X8013)
(defconstant +GL_CONVOLUTION_FILTER_BIAS+ #X8015)
(defconstant +GL_CONVOLUTION_FILTER_SCALE+ #X8014)
(defconstant +GL_CONVOLUTION_FORMAT+ #X8017)
(defconstant +GL_CONVOLUTION_HEIGHT+ #X8019)
(defconstant +GL_CONVOLUTION_WIDTH+ #X8018)
(defconstant +GL_COORD_REPLACE+ #X8862)
(defconstant +GL_COPY+ #X1503)
(defconstant +GL_COPY_INVERTED+ #X150C)
(defconstant +GL_COPY_PIXEL_TOKEN+ #X0706)
(defconstant +GL_CULL_FACE+ #X0B44)
(defconstant +GL_CULL_FACE_MODE+ #X0B45)
(defconstant +GL_CURRENT_BIT+ #X00000001)
(defconstant +GL_CURRENT_COLOR+ #X0B00)
(defconstant +GL_CURRENT_FOG_COORD+ #X8453)
(defconstant +GL_CURRENT_INDEX+ #X0B01)
(defconstant +GL_CURRENT_NORMAL+ #X0B02)
(defconstant +GL_CURRENT_PROGRAM+ #X8B8D)
(defconstant +GL_CURRENT_QUERY+ #X8865)
(defconstant +GL_CURRENT_RASTER_COLOR+ #X0B04)
(defconstant +GL_CURRENT_RASTER_DISTANCE+ #X0B09)
(defconstant +GL_CURRENT_RASTER_INDEX+ #X0B05)
(defconstant +GL_CURRENT_RASTER_POSITION+ #X0B07)
(defconstant +GL_CURRENT_RASTER_POSITION_VALID+ #X0B08)
(defconstant +GL_CURRENT_RASTER_SECONDARY_COLOR+ #X845F)
(defconstant +GL_CURRENT_RASTER_TEXTURE_COORDS+ #X0B06)
(defconstant +GL_CURRENT_TEXTURE_COORDS+ #X0B03)
(defconstant +GL_CURRENT_VERTEX_ATTRIB+ #X8626)
(defconstant +GL_CW+ #X0900)
(defconstant +GL_DECAL+ #X2101)
(defconstant +GL_DECR+ #X1E03)
(defconstant +GL_DELETE_STATUS+ #X8B80)
(defconstant +GL_DEPTH+ #X1801)
(defconstant +GL_DEPTH_BIAS+ #X0D1F)
(defconstant +GL_DEPTH_BITS+ #X0D56)
(defconstant +GL_DEPTH_BUFFER_BIT+ #X00000100)
(defconstant +GL_DEPTH_CLEAR_VALUE+ #X0B73)
(defconstant +GL_DEPTH_COMPONENT+ #X1902)
(defconstant +GL_DEPTH_FUNC+ #X0B74)
(defconstant +GL_DEPTH_RANGE+ #X0B70)
(defconstant +GL_DEPTH_SCALE+ #X0D1E)
(defconstant +GL_DEPTH_TEST+ #X0B71)
(defconstant +GL_DEPTH_WRITEMASK+ #X0B72)
(defconstant +GL_DIFFUSE+ #X1201)
(defconstant +GL_DITHER+ #X0BD0)
(defconstant +GL_DOMAIN+ #X0A02)
(defconstant +GL_DONT_CARE+ #X1100)
(defconstant +GL_DOUBLE+ #X140A)
(defconstant +GL_DOUBLEBUFFER+ #X0C32)
(defconstant +GL_DRAW_BUFFER+ #X0C01)
(defconstant +GL_DRAW_BUFFER0+ #X8825)
(defconstant +GL_DRAW_BUFFER1+ #X8826)
(defconstant +GL_DRAW_BUFFER10+ #X882F)
(defconstant +GL_DRAW_BUFFER11+ #X8830)
(defconstant +GL_DRAW_BUFFER12+ #X8831)
(defconstant +GL_DRAW_BUFFER13+ #X8832)
(defconstant +GL_DRAW_BUFFER14+ #X8833)
(defconstant +GL_DRAW_BUFFER15+ #X8834)
(defconstant +GL_DRAW_BUFFER2+ #X8827)
(defconstant +GL_DRAW_BUFFER3+ #X8828)
(defconstant +GL_DRAW_BUFFER4+ #X8829)
(defconstant +GL_DRAW_BUFFER5+ #X882A)
(defconstant +GL_DRAW_BUFFER6+ #X882B)
(defconstant +GL_DRAW_BUFFER7+ #X882C)
(defconstant +GL_DRAW_BUFFER8+ #X882D)
(defconstant +GL_DRAW_BUFFER9+ #X882E)
(defconstant +GL_DRAW_PIXEL_TOKEN+ #X0705)
(defconstant +GL_DST_ALPHA+ #X0304)
(defconstant +GL_DST_COLOR+ #X0306)
(defconstant +GL_DYNAMIC_COPY+ #X88EA)
(defconstant +GL_DYNAMIC_DRAW+ #X88E8)
(defconstant +GL_DYNAMIC_READ+ #X88E9)
(defconstant +GL_EDGE_FLAG+ #X0B43)
(defconstant +GL_EDGE_FLAG_ARRAY+ #X8079)
(defconstant +GL_EDGE_FLAG_ARRAY_BUFFER_BINDING+ #X889B)
(defconstant +GL_EDGE_FLAG_ARRAY_POINTER+ #X8093)
(defconstant +GL_EDGE_FLAG_ARRAY_STRIDE+ #X808C)
(defconstant +GL_ELEMENT_ARRAY_BUFFER+ #X8893)
(defconstant +GL_ELEMENT_ARRAY_BUFFER_BINDING+ #X8895)
(defconstant +GL_EMISSION+ #X1600)
(defconstant +GL_ENABLE_BIT+ #X00002000)
(defconstant +GL_EQUIV+ #X1509)
(defconstant +GL_EVAL_BIT+ #X00010000)
(defconstant +GL_EXP+ #X0800)
(defconstant +GL_EXP2+ #X0801)
(defconstant +GL_EXTENSIONS+ #X1F03)
(defconstant +GL_EYE_LINEAR+ #X2400)
(defconstant +GL_EYE_PLANE+ #X2502)
(defconstant +GL_FALSE+ 0)
(defconstant +GL_FASTEST+ #X1101)
(defconstant +GL_FEEDBACK+ #X1C01)
(defconstant +GL_FEEDBACK_BUFFER_POINTER+ #X0DF0)
(defconstant +GL_FEEDBACK_BUFFER_SIZE+ #X0DF1)
(defconstant +GL_FEEDBACK_BUFFER_TYPE+ #X0DF2)
(defconstant +GL_FILL+ #X1B02)
(defconstant +GL_FLAT+ #X1D00)
(defconstant +GL_FLOAT+ #X1406)
(defconstant +GL_FLOAT_MAT2+ #X8B5A)
(defconstant +GL_FLOAT_MAT2X3+ #X8B65)
(defconstant +GL_FLOAT_MAT2X4+ #X8B66)
(defconstant +GL_FLOAT_MAT3+ #X8B5B)
(defconstant +GL_FLOAT_MAT3X2+ #X8B67)
(defconstant +GL_FLOAT_MAT3X4+ #X8B68)
(defconstant +GL_FLOAT_MAT4+ #X8B5C)
(defconstant +GL_FLOAT_MAT4X2+ #X8B69)
(defconstant +GL_FLOAT_MAT4X3+ #X8B6A)
(defconstant +GL_FLOAT_VEC2+ #X8B50)
(defconstant +GL_FLOAT_VEC3+ #X8B51)
(defconstant +GL_FLOAT_VEC4+ #X8B52)
(defconstant +GL_FOG+ #X0B60)
(defconstant +GL_FOG_BIT+ #X00000080)
(defconstant +GL_FOG_COLOR+ #X0B66)
(defconstant +GL_FOG_COORD+ #X8451)
(defconstant +GL_FOG_COORD_ARRAY+ #X8457)
(defconstant +GL_FOG_COORD_ARRAY_BUFFER_BINDING+ #X889D)
(defconstant +GL_FOG_COORD_ARRAY_POINTER+ #X8456)
(defconstant +GL_FOG_COORD_ARRAY_STRIDE+ #X8455)
(defconstant +GL_FOG_COORD_ARRAY_TYPE+ #X8454)
(defconstant +GL_FOG_COORD_SRC+ #X8450)
(defconstant +GL_FOG_DENSITY+ #X0B62)
(defconstant +GL_FOG_END+ #X0B64)
(defconstant +GL_FOG_HINT+ #X0C54)
(defconstant +GL_FOG_INDEX+ #X0B61)
(defconstant +GL_FOG_MODE+ #X0B65)
(defconstant +GL_FOG_START+ #X0B63)
(defconstant +GL_FRAGMENT_DEPTH+ #X8452)
(defconstant +GL_FRAGMENT_SHADER+ #X8B30)
(defconstant +GL_FRAGMENT_SHADER_DERIVATIVE_HINT+ #X8B8B)
(defconstant +GL_FRONT+ #X0404)
(defconstant +GL_FRONT_AND_BACK+ #X0408)
(defconstant +GL_FRONT_FACE+ #X0B46)
(defconstant +GL_FRONT_LEFT+ #X0400)
(defconstant +GL_FRONT_RIGHT+ #X0401)
(defconstant +GL_FUNC_ADD+ #X8006)
(defconstant +GL_FUNC_REVERSE_SUBTRACT+ #X800B)
(defconstant +GL_FUNC_SUBTRACT+ #X800A)
(defconstant +GL_GREEN+ #X1904)
(defconstant +GL_GREEN_BIAS+ #X0D19)
(defconstant +GL_GREEN_BITS+ #X0D53)
(defconstant +GL_GREEN_SCALE+ #X0D18)
(defconstant +GL_HINT_BIT+ #X00008000)
(defconstant +GL_HISTOGRAM+ #X8024)
(defconstant +GL_HISTOGRAM_ALPHA_SIZE+ #X802B)
(defconstant +GL_HISTOGRAM_BLUE_SIZE+ #X802A)
(defconstant +GL_HISTOGRAM_FORMAT+ #X8027)
(defconstant +GL_HISTOGRAM_GREEN_SIZE+ #X8029)
(defconstant +GL_HISTOGRAM_LUMINANCE_SIZE+ #X802C)
(defconstant +GL_HISTOGRAM_RED_SIZE+ #X8028)
(defconstant +GL_HISTOGRAM_SINK+ #X802D)
(defconstant +GL_HISTOGRAM_WIDTH+ #X8026)
(defconstant +GL_INCR+ #X1E02)
(defconstant +GL_INDEX_ARRAY+ #X8077)
(defconstant +GL_INDEX_ARRAY_BUFFER_BINDING+ #X8899)
(defconstant +GL_INDEX_ARRAY_POINTER+ #X8091)
(defconstant +GL_INDEX_ARRAY_STRIDE+ #X8086)
(defconstant +GL_INDEX_ARRAY_TYPE+ #X8085)
(defconstant +GL_INDEX_BITS+ #X0D51)
(defconstant +GL_INDEX_CLEAR_VALUE+ #X0C20)
(defconstant +GL_INDEX_LOGIC_OP+ #X0BF1)
(defconstant +GL_INDEX_MODE+ #X0C30)
(defconstant +GL_INDEX_OFFSET+ #X0D13)
(defconstant +GL_INDEX_SHIFT+ #X0D12)
(defconstant +GL_INDEX_WRITEMASK+ #X0C21)
(defconstant +GL_INFO_LOG_LENGTH+ #X8B84)
(defconstant +GL_INT+ #X1404)
(defconstant +GL_INTENSITY+ #X8049)
(defconstant +GL_INTENSITY12+ #X804C)
(defconstant +GL_INTENSITY16+ #X804D)
(defconstant +GL_INTENSITY4+ #X804A)
(defconstant +GL_INTENSITY8+ #X804B)
(defconstant +GL_INTERPOLATE+ #X8575)
(defconstant +GL_INT_VEC2+ #X8B53)
(defconstant +GL_INT_VEC3+ #X8B54)
(defconstant +GL_INT_VEC4+ #X8B55)
(defconstant +GL_INVALID_ENUM+ #X0500)
(defconstant +GL_INVALID_OPERATION+ #X0502)
(defconstant +GL_INVALID_VALUE+ #X0501)
(defconstant +GL_INVERT+ #X150A)
(defconstant +GL_KEEP+ #X1E00)
(defconstant +GL_LEFT+ #X0406)
(defconstant +GL_LIGHT0+ #X4000)
(defconstant +GL_LIGHT1+ #X4001)
(defconstant +GL_LIGHT2+ #X4002)
(defconstant +GL_LIGHT3+ #X4003)
(defconstant +GL_LIGHT4+ #X4004)
(defconstant +GL_LIGHT5+ #X4005)
(defconstant +GL_LIGHT6+ #X4006)
(defconstant +GL_LIGHT7+ #X4007)
(defconstant +GL_LIGHTING+ #X0B50)
(defconstant +GL_LIGHTING_BIT+ #X00000040)
(defconstant +GL_LIGHT_MODEL_AMBIENT+ #X0B53)
(defconstant +GL_LIGHT_MODEL_COLOR_CONTROL+ #X81F8)
(defconstant +GL_LIGHT_MODEL_LOCAL_VIEWER+ #X0B51)
(defconstant +GL_LIGHT_MODEL_TWO_SIDE+ #X0B52)
(defconstant +GL_LINE+ #X1B01)
(defconstant +GL_LINEAR+ #X2601)
(defconstant +GL_LINEAR_ATTENUATION+ #X1208)
(defconstant +GL_LINEAR_MIPMAP_LINEAR+ #X2703)
(defconstant +GL_LINEAR_MIPMAP_NEAREST+ #X2701)
(defconstant +GL_LINES+ #X0001)
(defconstant +GL_LINE_BIT+ #X00000004)
(defconstant +GL_LINE_LOOP+ #X0002)
(defconstant +GL_LINE_RESET_TOKEN+ #X0707)
(defconstant +GL_LINE_SMOOTH+ #X0B20)
(defconstant +GL_LINE_SMOOTH_HINT+ #X0C52)
(defconstant +GL_LINE_STIPPLE+ #X0B24)
(defconstant +GL_LINE_STIPPLE_PATTERN+ #X0B25)
(defconstant +GL_LINE_STIPPLE_REPEAT+ #X0B26)
(defconstant +GL_LINE_STRIP+ #X0003)
(defconstant +GL_LINE_TOKEN+ #X0702)
(defconstant +GL_LINE_WIDTH+ #X0B21)
(defconstant +GL_LINE_WIDTH_GRANULARITY+ #X0B23)
(defconstant +GL_LINE_WIDTH_RANGE+ #X0B22)
(defconstant +GL_LINK_STATUS+ #X8B82)
(defconstant +GL_LIST_BASE+ #X0B32)
(defconstant +GL_LIST_BIT+ #X00020000)
(defconstant +GL_LIST_INDEX+ #X0B33)
(defconstant +GL_LIST_MODE+ #X0B30)
(defconstant +GL_LOGIC_OP_MODE+ #X0BF0)
(defconstant +GL_LOWER_LEFT+ #X8CA1)
(defconstant +GL_LUMINANCE+ #X1909)
(defconstant +GL_LUMINANCE12+ #X8041)
(defconstant +GL_LUMINANCE12_ALPHA12+ #X8047)
(defconstant +GL_LUMINANCE12_ALPHA4+ #X8046)
(defconstant +GL_LUMINANCE16+ #X8042)
(defconstant +GL_LUMINANCE16_ALPHA16+ #X8048)
(defconstant +GL_LUMINANCE4+ #X803F)
(defconstant +GL_LUMINANCE4_ALPHA4+ #X8043)
(defconstant +GL_LUMINANCE6_ALPHA2+ #X8044)
(defconstant +GL_LUMINANCE8+ #X8040)
(defconstant +GL_LUMINANCE8_ALPHA8+ #X8045)
(defconstant +GL_LUMINANCE_ALPHA+ #X190A)
(defconstant +GL_MAP1_COLOR_4+ #X0D90)
(defconstant +GL_MAP1_GRID_DOMAIN+ #X0DD0)
(defconstant +GL_MAP1_GRID_SEGMENTS+ #X0DD1)
(defconstant +GL_MAP1_INDEX+ #X0D91)
(defconstant +GL_MAP1_NORMAL+ #X0D92)
(defconstant +GL_MAP1_TEXTURE_COORD_1+ #X0D93)
(defconstant +GL_MAP1_TEXTURE_COORD_2+ #X0D94)
(defconstant +GL_MAP1_TEXTURE_COORD_3+ #X0D95)
(defconstant +GL_MAP1_TEXTURE_COORD_4+ #X0D96)
(defconstant +GL_MAP1_VERTEX_3+ #X0D97)
(defconstant +GL_MAP1_VERTEX_4+ #X0D98)
(defconstant +GL_MAP2_COLOR_4+ #X0DB0)
(defconstant +GL_MAP2_GRID_DOMAIN+ #X0DD2)
(defconstant +GL_MAP2_GRID_SEGMENTS+ #X0DD3)
(defconstant +GL_MAP2_INDEX+ #X0DB1)
(defconstant +GL_MAP2_NORMAL+ #X0DB2)
(defconstant +GL_MAP2_TEXTURE_COORD_1+ #X0DB3)
(defconstant +GL_MAP2_TEXTURE_COORD_2+ #X0DB4)
(defconstant +GL_MAP2_TEXTURE_COORD_3+ #X0DB5)
(defconstant +GL_MAP2_TEXTURE_COORD_4+ #X0DB6)
(defconstant +GL_MAP2_VERTEX_3+ #X0DB7)
(defconstant +GL_MAP2_VERTEX_4+ #X0DB8)
(defconstant +GL_MAP_COLOR+ #X0D10)
(defconstant +GL_MAP_STENCIL+ #X0D11)
(defconstant +GL_MATRIX_MODE+ #X0BA0)
(defconstant +GL_MAX+ #X8008)
(defconstant +GL_MAX_3D_TEXTURE_SIZE+ #X8073)
(defconstant +GL_MAX_ATTRIB_STACK_DEPTH+ #X0D35)
(defconstant +GL_MAX_CLIENT_ATTRIB_STACK_DEPTH+ #X0D3B)
(defconstant +GL_MAX_CLIP_PLANES+ #X0D32)
(defconstant +GL_MAX_COLOR_MATRIX_STACK_DEPTH+ #X80B3)
(defconstant +GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS+ #X8B4D)
(defconstant +GL_MAX_CONVOLUTION_HEIGHT+ #X801B)
(defconstant +GL_MAX_CONVOLUTION_WIDTH+ #X801A)
(defconstant +GL_MAX_DRAW_BUFFERS+ #X8824)
(defconstant +GL_MAX_ELEMENTS_INDICES+ #X80E9)
(defconstant +GL_MAX_ELEMENTS_VERTICES+ #X80E8)
(defconstant +GL_MAX_EVAL_ORDER+ #X0D30)
(defconstant +GL_MAX_FRAGMENT_UNIFORM_COMPONENTS+ #X8B49)
(defconstant +GL_MAX_LIGHTS+ #X0D31)
(defconstant +GL_MAX_LIST_NESTING+ #X0B31)
(defconstant +GL_MAX_MODELVIEW_STACK_DEPTH+ #X0D36)
(defconstant +GL_MAX_NAME_STACK_DEPTH+ #X0D37)
(defconstant +GL_MAX_PIXEL_MAP_TABLE+ #X0D34)
(defconstant +GL_MAX_PROJECTION_STACK_DEPTH+ #X0D38)
(defconstant +GL_MAX_TEXTURE_COORDS+ #X8871)
(defconstant +GL_MAX_TEXTURE_IMAGE_UNITS+ #X8872)
(defconstant +GL_MAX_TEXTURE_SIZE+ #X0D33)
(defconstant +GL_MAX_TEXTURE_STACK_DEPTH+ #X0D39)
(defconstant +GL_MAX_TEXTURE_UNITS+ #X84E2)
(defconstant +GL_MAX_VARYING_FLOATS+ #X8B4B)
(defconstant +GL_MAX_VERTEX_ATTRIBS+ #X8869)
(defconstant +GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS+ #X8B4C)
(defconstant +GL_MAX_VERTEX_UNIFORM_COMPONENTS+ #X8B4A)
(defconstant +GL_MAX_VIEWPORT_DIMS+ #X0D3A)
(defconstant +GL_MIN+ #X8007)
(defconstant +GL_MINMAX+ #X802E)
(defconstant +GL_MINMAX_FORMAT+ #X802F)
(defconstant +GL_MINMAX_SINK+ #X8030)
(defconstant +GL_MODELVIEW+ #X1700)
(defconstant +GL_MODELVIEW_MATRIX+ #X0BA6)
(defconstant +GL_MODELVIEW_STACK_DEPTH+ #X0BA3)
(defconstant +GL_MODULATE+ #X2100)
(defconstant +GL_N3F_V3F+ #X2A25)
(defconstant +GL_NAME_STACK_DEPTH+ #X0D70)
(defconstant +GL_NAND+ #X150E)
(defconstant +GL_NEAREST+ #X2600)
(defconstant +GL_NEAREST_MIPMAP_LINEAR+ #X2702)
(defconstant +GL_NEAREST_MIPMAP_NEAREST+ #X2700)
(defconstant +GL_NICEST+ #X1102)
(defconstant +GL_NONE+ 0)
(defconstant +GL_NOOP+ #X1505)
(defconstant +GL_NOR+ #X1508)
(defconstant +GL_NORMALIZE+ #X0BA1)
(defconstant +GL_NORMAL_ARRAY+ #X8075)
(defconstant +GL_NORMAL_ARRAY_BUFFER_BINDING+ #X8897)
(defconstant +GL_NORMAL_ARRAY_POINTER+ #X808F)
(defconstant +GL_NORMAL_ARRAY_STRIDE+ #X807F)
(defconstant +GL_NORMAL_ARRAY_TYPE+ #X807E)
(defconstant +GL_NO_ERROR+ 0)
(defconstant +GL_OBJECT_LINEAR+ #X2401)
(defconstant +GL_OBJECT_PLANE+ #X2501)
(defconstant +GL_ONE+ 1)
(defconstant +GL_ONE_MINUS_CONSTANT_ALPHA+ #X8004)
(defconstant +GL_ONE_MINUS_CONSTANT_COLOR+ #X8002)
(defconstant +GL_ONE_MINUS_DST_ALPHA+ #X0305)
(defconstant +GL_ONE_MINUS_DST_COLOR+ #X0307)
(defconstant +GL_ONE_MINUS_SRC_ALPHA+ #X0303)
(defconstant +GL_ONE_MINUS_SRC_COLOR+ #X0301)
(defconstant +GL_OR+ #X1507)
(defconstant +GL_ORDER+ #X0A01)
(defconstant +GL_OR_INVERTED+ #X150D)
(defconstant +GL_OR_REVERSE+ #X150B)
(defconstant +GL_OUT_OF_MEMORY+ #X0505)
(defconstant +GL_PACK_ALIGNMENT+ #X0D05)
(defconstant +GL_PACK_IMAGE_HEIGHT+ #X806C)
(defconstant +GL_PACK_LSB_FIRST+ #X0D01)
(defconstant +GL_PACK_ROW_LENGTH+ #X0D02)
(defconstant +GL_PACK_SKIP_IMAGES+ #X806B)
(defconstant +GL_PACK_SKIP_PIXELS+ #X0D04)
(defconstant +GL_PACK_SKIP_ROWS+ #X0D03)
(defconstant +GL_PACK_SWAP_BYTES+ #X0D00)
(defconstant +GL_PASS_THROUGH_TOKEN+ #X0700)
(defconstant +GL_PERSPECTIVE_CORRECTION_HINT+ #X0C50)
(defconstant +GL_PIXEL_MAP_A_TO_A+ #X0C79)
(defconstant +GL_PIXEL_MAP_A_TO_A_SIZE+ #X0CB9)
(defconstant +GL_PIXEL_MAP_B_TO_B+ #X0C78)
(defconstant +GL_PIXEL_MAP_B_TO_B_SIZE+ #X0CB8)
(defconstant +GL_PIXEL_MAP_G_TO_G+ #X0C77)
(defconstant +GL_PIXEL_MAP_G_TO_G_SIZE+ #X0CB7)
(defconstant +GL_PIXEL_MAP_I_TO_A+ #X0C75)
(defconstant +GL_PIXEL_MAP_I_TO_A_SIZE+ #X0CB5)
(defconstant +GL_PIXEL_MAP_I_TO_B+ #X0C74)
(defconstant +GL_PIXEL_MAP_I_TO_B_SIZE+ #X0CB4)
(defconstant +GL_PIXEL_MAP_I_TO_G+ #X0C73)
(defconstant +GL_PIXEL_MAP_I_TO_G_SIZE+ #X0CB3)
(defconstant +GL_PIXEL_MAP_I_TO_I+ #X0C70)
(defconstant +GL_PIXEL_MAP_I_TO_I_SIZE+ #X0CB0)
(defconstant +GL_PIXEL_MAP_I_TO_R+ #X0C72)
(defconstant +GL_PIXEL_MAP_I_TO_R_SIZE+ #X0CB2)
(defconstant +GL_PIXEL_MAP_R_TO_R+ #X0C76)
(defconstant +GL_PIXEL_MAP_R_TO_R_SIZE+ #X0CB6)
(defconstant +GL_PIXEL_MAP_S_TO_S+ #X0C71)
(defconstant +GL_PIXEL_MAP_S_TO_S_SIZE+ #X0CB1)
(defconstant +GL_PIXEL_MODE_BIT+ #X00000020)
(defconstant +GL_PIXEL_PACK_BUFFER+ #X88EB)
(defconstant +GL_PIXEL_PACK_BUFFER_BINDING+ #X88ED)
(defconstant +GL_PIXEL_UNPACK_BUFFER+ #X88EC)
(defconstant +GL_PIXEL_UNPACK_BUFFER_BINDING+ #X88EF)
(defconstant +GL_POINT+ #X1B00)
(defconstant +GL_POINTS+ #X0000)
(defconstant +GL_POINT_BIT+ #X00000002)
(defconstant +GL_POINT_SIZE+ #X0B11)
(defconstant +GL_POINT_SIZE_GRANULARITY+ #X0B13)
(defconstant +GL_POINT_SIZE_RANGE+ #X0B12)
(defconstant +GL_POINT_SMOOTH+ #X0B10)
(defconstant +GL_POINT_SMOOTH_HINT+ #X0C51)
(defconstant +GL_POINT_SPRITE+ #X8861)
(defconstant +GL_POINT_SPRITE_COORD_ORIGIN+ #X8CA0)
(defconstant +GL_POINT_TOKEN+ #X0701)
(defconstant +GL_POLYGON+ #X0009)
(defconstant +GL_POLYGON_BIT+ #X00000008)
(defconstant +GL_POLYGON_MODE+ #X0B40)
(defconstant +GL_POLYGON_OFFSET_FACTOR+ #X8038)
(defconstant +GL_POLYGON_OFFSET_FILL+ #X8037)
(defconstant +GL_POLYGON_OFFSET_LINE+ #X2A02)
(defconstant +GL_POLYGON_OFFSET_POINT+ #X2A01)
(defconstant +GL_POLYGON_OFFSET_UNITS+ #X2A00)
(defconstant +GL_POLYGON_SMOOTH+ #X0B41)
(defconstant +GL_POLYGON_SMOOTH_HINT+ #X0C53)
(defconstant +GL_POLYGON_STIPPLE+ #X0B42)
(defconstant +GL_POLYGON_STIPPLE_BIT+ #X00000010)
(defconstant +GL_POLYGON_TOKEN+ #X0703)
(defconstant +GL_POSITION+ #X1203)
(defconstant +GL_POST_COLOR_MATRIX_ALPHA_BIAS+ #X80BB)
(defconstant +GL_POST_COLOR_MATRIX_ALPHA_SCALE+ #X80B7)
(defconstant +GL_POST_COLOR_MATRIX_BLUE_BIAS+ #X80BA)
(defconstant +GL_POST_COLOR_MATRIX_BLUE_SCALE+ #X80B6)
(defconstant +GL_POST_COLOR_MATRIX_COLOR_TABLE+ #X80D2)
(defconstant +GL_POST_COLOR_MATRIX_GREEN_BIAS+ #X80B9)
(defconstant +GL_POST_COLOR_MATRIX_GREEN_SCALE+ #X80B5)
(defconstant +GL_POST_COLOR_MATRIX_RED_BIAS+ #X80B8)
(defconstant +GL_POST_COLOR_MATRIX_RED_SCALE+ #X80B4)
(defconstant +GL_POST_CONVOLUTION_ALPHA_BIAS+ #X8023)
(defconstant +GL_POST_CONVOLUTION_ALPHA_SCALE+ #X801F)
(defconstant +GL_POST_CONVOLUTION_BLUE_BIAS+ #X8022)
(defconstant +GL_POST_CONVOLUTION_BLUE_SCALE+ #X801E)
(defconstant +GL_POST_CONVOLUTION_COLOR_TABLE+ #X80D1)
(defconstant +GL_POST_CONVOLUTION_GREEN_BIAS+ #X8021)
(defconstant +GL_POST_CONVOLUTION_GREEN_SCALE+ #X801D)
(defconstant +GL_POST_CONVOLUTION_RED_BIAS+ #X8020)
(defconstant +GL_POST_CONVOLUTION_RED_SCALE+ #X801C)
(defconstant +GL_PREVIOUS+ #X8578)
(defconstant +GL_PRIMARY_COLOR+ #X8577)
(defconstant +GL_PROJECTION+ #X1701)
(defconstant +GL_PROJECTION_MATRIX+ #X0BA7)
(defconstant +GL_PROJECTION_STACK_DEPTH+ #X0BA4)
(defconstant +GL_PROXY_COLOR_TABLE+ #X80D3)
(defconstant +GL_PROXY_HISTOGRAM+ #X8025)
(defconstant +GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE+ #X80D5)
(defconstant +GL_PROXY_POST_CONVOLUTION_COLOR_TABLE+ #X80D4)
(defconstant +GL_PROXY_TEXTURE_1D+ #X8063)
(defconstant +GL_PROXY_TEXTURE_2D+ #X8064)
(defconstant +GL_PROXY_TEXTURE_3D+ #X8070)
(defconstant +GL_Q+ #X2003)
(defconstant +GL_QUADRATIC_ATTENUATION+ #X1209)
(defconstant +GL_QUADS+ #X0007)
(defconstant +GL_QUAD_STRIP+ #X0008)
(defconstant +GL_QUERY_COUNTER_BITS+ #X8864)
(defconstant +GL_QUERY_RESULT+ #X8866)
(defconstant +GL_QUERY_RESULT_AVAILABLE+ #X8867)
(defconstant +GL_R+ #X2002)
(defconstant +GL_R3_G3_B2+ #X2A10)
(defconstant +GL_READ_BUFFER+ #X0C02)
(defconstant +GL_READ_ONLY+ #X88B8)
(defconstant +GL_READ_WRITE+ #X88BA)
(defconstant +GL_RED+ #X1903)
(defconstant +GL_REDUCE+ #X8016)
(defconstant +GL_RED_BIAS+ #X0D15)
(defconstant +GL_RED_BITS+ #X0D52)
(defconstant +GL_RED_SCALE+ #X0D14)
(defconstant +GL_RENDER+ #X1C00)
(defconstant +GL_RENDERER+ #X1F01)
(defconstant +GL_RENDER_MODE+ #X0C40)
(defconstant +GL_REPEAT+ #X2901)
(defconstant +GL_REPLACE+ #X1E01)
(defconstant +GL_REPLICATE_BORDER+ #X8153)
(defconstant +GL_RESCALE_NORMAL+ #X803A)
(defconstant +GL_RGB+ #X1907)
(defconstant +GL_RGB10+ #X8052)
(defconstant +GL_RGB10_A2+ #X8059)
(defconstant +GL_RGB12+ #X8053)
(defconstant +GL_RGB16+ #X8054)
(defconstant +GL_RGB4+ #X804F)
(defconstant +GL_RGB5+ #X8050)
(defconstant +GL_RGB5_A1+ #X8057)
(defconstant +GL_RGB8+ #X8051)
(defconstant +GL_RGBA+ #X1908)
(defconstant +GL_RGBA12+ #X805A)
(defconstant +GL_RGBA16+ #X805B)
(defconstant +GL_RGBA2+ #X8055)
(defconstant +GL_RGBA4+ #X8056)
(defconstant +GL_RGBA8+ #X8058)
(defconstant +GL_RGBA_MODE+ #X0C31)
(defconstant +GL_RGB_SCALE+ #X8573)
(defconstant +GL_RIGHT+ #X0407)
(defconstant +GL_S+ #X2000)
(defconstant +GL_SAMPLER_1D+ #X8B5D)
(defconstant +GL_SAMPLER_1D_SHADOW+ #X8B61)
(defconstant +GL_SAMPLER_2D+ #X8B5E)
(defconstant +GL_SAMPLER_2D_SHADOW+ #X8B62)
(defconstant +GL_SAMPLER_3D+ #X8B5F)
(defconstant +GL_SAMPLER_CUBE+ #X8B60)
(defconstant +GL_SAMPLES_PASSED+ #X8914)
(defconstant +GL_SCISSOR_BIT+ #X00080000)
(defconstant +GL_SCISSOR_BOX+ #X0C10)
(defconstant +GL_SCISSOR_TEST+ #X0C11)
(defconstant +GL_SECONDARY_COLOR_ARRAY_BUFFER_BINDING+ #X889C)
(defconstant +GL_SELECT+ #X1C02)
(defconstant +GL_SELECTION_BUFFER_POINTER+ #X0DF3)
(defconstant +GL_SELECTION_BUFFER_SIZE+ #X0DF4)
(defconstant +GL_SEPARABLE_2D+ #X8012)
(defconstant +GL_SEPARATE_SPECULAR_COLOR+ #X81FA)
(defconstant +GL_SET+ #X150F)
(defconstant +GL_SHADER_SOURCE_LENGTH+ #X8B88)
(defconstant +GL_SHADER_TYPE+ #X8B4F)
(defconstant +GL_SHADE_MODEL+ #X0B54)
(defconstant +GL_SHADING_LANGUAGE_VERSION+ #X8B8C)
(defconstant +GL_SHININESS+ #X1601)
(defconstant +GL_SHORT+ #X1402)
(defconstant +GL_SINGLE_COLOR+ #X81F9)
(defconstant +GL_SLUMINANCE+ #X8C46)
(defconstant +GL_SLUMINANCE8+ #X8C47)
(defconstant +GL_SLUMINANCE8_ALPHA8+ #X8C45)
(defconstant +GL_SLUMINANCE_ALPHA+ #X8C44)
(defconstant +GL_SMOOTH+ #X1D01)
(defconstant +GL_SMOOTH_LINE_WIDTH_GRANULARITY+ #X0B23)
(defconstant +GL_SMOOTH_LINE_WIDTH_RANGE+ #X0B22)
(defconstant +GL_SMOOTH_POINT_SIZE_GRANULARITY+ #X0B13)
(defconstant +GL_SMOOTH_POINT_SIZE_RANGE+ #X0B12)
(defconstant +GL_SPECULAR+ #X1202)
(defconstant +GL_SPHERE_MAP+ #X2402)
(defconstant +GL_SPOT_CUTOFF+ #X1206)
(defconstant +GL_SPOT_DIRECTION+ #X1204)
(defconstant +GL_SPOT_EXPONENT+ #X1205)
(defconstant +GL_SRC0_ALPHA+ #X8588)
(defconstant +GL_SRC0_RGB+ #X8580)
(defconstant +GL_SRC1_ALPHA+ #X8589)
(defconstant +GL_SRC1_RGB+ #X8581)
(defconstant +GL_SRC2_ALPHA+ #X858A)
(defconstant +GL_SRC2_RGB+ #X8582)
(defconstant +GL_SRC_ALPHA+ #X0302)
(defconstant +GL_SRC_ALPHA_SATURATE+ #X0308)
(defconstant +GL_SRC_COLOR+ #X0300)
(defconstant +GL_SRGB+ #X8C40)
(defconstant +GL_SRGB8+ #X8C41)
(defconstant +GL_SRGB8_ALPHA8+ #X8C43)
(defconstant +GL_SRGB_ALPHA+ #X8C42)
(defconstant +GL_STACK_OVERFLOW+ #X0503)
(defconstant +GL_STACK_UNDERFLOW+ #X0504)
(defconstant +GL_STATIC_COPY+ #X88E6)
(defconstant +GL_STATIC_DRAW+ #X88E4)
(defconstant +GL_STATIC_READ+ #X88E5)
(defconstant +GL_STENCIL+ #X1802)
(defconstant +GL_STENCIL_BACK_FAIL+ #X8801)
(defconstant +GL_STENCIL_BACK_FUNC+ #X8800)
(defconstant +GL_STENCIL_BACK_PASS_DEPTH_FAIL+ #X8802)
(defconstant +GL_STENCIL_BACK_PASS_DEPTH_PASS+ #X8803)
(defconstant +GL_STENCIL_BACK_REF+ #X8CA3)
(defconstant +GL_STENCIL_BACK_VALUE_MASK+ #X8CA4)
(defconstant +GL_STENCIL_BACK_WRITEMASK+ #X8CA5)
(defconstant +GL_STENCIL_BITS+ #X0D57)
(defconstant +GL_STENCIL_BUFFER_BIT+ #X00000400)
(defconstant +GL_STENCIL_CLEAR_VALUE+ #X0B91)
(defconstant +GL_STENCIL_FAIL+ #X0B94)
(defconstant +GL_STENCIL_FUNC+ #X0B92)
(defconstant +GL_STENCIL_INDEX+ #X1901)
(defconstant +GL_STENCIL_PASS_DEPTH_FAIL+ #X0B95)
(defconstant +GL_STENCIL_PASS_DEPTH_PASS+ #X0B96)
(defconstant +GL_STENCIL_REF+ #X0B97)
(defconstant +GL_STENCIL_TEST+ #X0B90)
(defconstant +GL_STENCIL_VALUE_MASK+ #X0B93)
(defconstant +GL_STENCIL_WRITEMASK+ #X0B98)
(defconstant +GL_STEREO+ #X0C33)
(defconstant +GL_STREAM_COPY+ #X88E2)
(defconstant +GL_STREAM_DRAW+ #X88E0)
(defconstant +GL_STREAM_READ+ #X88E1)
(defconstant +GL_SUBPIXEL_BITS+ #X0D50)
(defconstant +GL_SUBTRACT+ #X84E7)
(defconstant +GL_T+ #X2001)
(defconstant +GL_T2F_C3F_V3F+ #X2A2A)
(defconstant +GL_T2F_C4F_N3F_V3F+ #X2A2C)
(defconstant +GL_T2F_C4UB_V3F+ #X2A29)
(defconstant +GL_T2F_N3F_V3F+ #X2A2B)
(defconstant +GL_T2F_V3F+ #X2A27)
(defconstant +GL_T4F_C4F_N3F_V4F+ #X2A2D)
(defconstant +GL_T4F_V4F+ #X2A28)
(defconstant +GL_TABLE_TOO_LARGE+ #X8031)
(defconstant +GL_TEXTURE+ #X1702)
(defconstant +GL_TEXTURE0+ #X84C0)
(defconstant +GL_TEXTURE1+ #X84C1)
(defconstant +GL_TEXTURE10+ #X84CA)
(defconstant +GL_TEXTURE11+ #X84CB)
(defconstant +GL_TEXTURE12+ #X84CC)
(defconstant +GL_TEXTURE13+ #X84CD)
(defconstant +GL_TEXTURE14+ #X84CE)
(defconstant +GL_TEXTURE15+ #X84CF)
(defconstant +GL_TEXTURE16+ #X84D0)
(defconstant +GL_TEXTURE17+ #X84D1)
(defconstant +GL_TEXTURE18+ #X84D2)
(defconstant +GL_TEXTURE19+ #X84D3)
(defconstant +GL_TEXTURE2+ #X84C2)
(defconstant +GL_TEXTURE20+ #X84D4)
(defconstant +GL_TEXTURE21+ #X84D5)
(defconstant +GL_TEXTURE22+ #X84D6)
(defconstant +GL_TEXTURE23+ #X84D7)
(defconstant +GL_TEXTURE24+ #X84D8)
(defconstant +GL_TEXTURE25+ #X84D9)
(defconstant +GL_TEXTURE26+ #X84DA)
(defconstant +GL_TEXTURE27+ #X84DB)
(defconstant +GL_TEXTURE28+ #X84DC)
(defconstant +GL_TEXTURE29+ #X84DD)
(defconstant +GL_TEXTURE3+ #X84C3)
(defconstant +GL_TEXTURE30+ #X84DE)
(defconstant +GL_TEXTURE31+ #X84DF)
(defconstant +GL_TEXTURE4+ #X84C4)
(defconstant +GL_TEXTURE5+ #X84C5)
(defconstant +GL_TEXTURE6+ #X84C6)
(defconstant +GL_TEXTURE7+ #X84C7)
(defconstant +GL_TEXTURE8+ #X84C8)
(defconstant +GL_TEXTURE9+ #X84C9)
(defconstant +GL_TEXTURE_1D+ #X0DE0)
(defconstant +GL_TEXTURE_2D+ #X0DE1)
(defconstant +GL_TEXTURE_3D+ #X806F)
(defconstant +GL_TEXTURE_ALPHA_SIZE+ #X805F)
(defconstant +GL_TEXTURE_BASE_LEVEL+ #X813C)
(defconstant +GL_TEXTURE_BINDING_1D+ #X8068)
(defconstant +GL_TEXTURE_BINDING_2D+ #X8069)
(defconstant +GL_TEXTURE_BINDING_3D+ #X806A)
(defconstant +GL_TEXTURE_BIT+ #X00040000)
(defconstant +GL_TEXTURE_BLUE_SIZE+ #X805E)
(defconstant +GL_TEXTURE_BORDER+ #X1005)
(defconstant +GL_TEXTURE_BORDER_COLOR+ #X1004)
(defconstant +GL_TEXTURE_COORD_ARRAY+ #X8078)
(defconstant +GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING+ #X889A)
(defconstant +GL_TEXTURE_COORD_ARRAY_POINTER+ #X8092)
(defconstant +GL_TEXTURE_COORD_ARRAY_SIZE+ #X8088)
(defconstant +GL_TEXTURE_COORD_ARRAY_STRIDE+ #X808A)
(defconstant +GL_TEXTURE_COORD_ARRAY_TYPE+ #X8089)
(defconstant +GL_TEXTURE_DEPTH+ #X8071)
(defconstant +GL_TEXTURE_ENV+ #X2300)
(defconstant +GL_TEXTURE_ENV_COLOR+ #X2201)
(defconstant +GL_TEXTURE_ENV_MODE+ #X2200)
(defconstant +GL_TEXTURE_GEN_MODE+ #X2500)
(defconstant +GL_TEXTURE_GEN_Q+ #X0C63)
(defconstant +GL_TEXTURE_GEN_R+ #X0C62)
(defconstant +GL_TEXTURE_GEN_S+ #X0C60)
(defconstant +GL_TEXTURE_GEN_T+ #X0C61)
(defconstant +GL_TEXTURE_GREEN_SIZE+ #X805D)
(defconstant +GL_TEXTURE_HEIGHT+ #X1001)
(defconstant +GL_TEXTURE_INTENSITY_SIZE+ #X8061)
(defconstant +GL_TEXTURE_INTERNAL_FORMAT+ #X1003)
(defconstant +GL_TEXTURE_LUMINANCE_SIZE+ #X8060)
(defconstant +GL_TEXTURE_MAG_FILTER+ #X2800)
(defconstant +GL_TEXTURE_MATRIX+ #X0BA8)
(defconstant +GL_TEXTURE_MAX_LEVEL+ #X813D)
(defconstant +GL_TEXTURE_MAX_LOD+ #X813B)
(defconstant +GL_TEXTURE_MIN_FILTER+ #X2801)
(defconstant +GL_TEXTURE_MIN_LOD+ #X813A)
(defconstant +GL_TEXTURE_PRIORITY+ #X8066)
(defconstant +GL_TEXTURE_RED_SIZE+ #X805C)
(defconstant +GL_TEXTURE_RESIDENT+ #X8067)
(defconstant +GL_TEXTURE_STACK_DEPTH+ #X0BA5)
(defconstant +GL_TEXTURE_WIDTH+ #X1000)
(defconstant +GL_TEXTURE_WRAP_R+ #X8072)
(defconstant +GL_TEXTURE_WRAP_S+ #X2802)
(defconstant +GL_TEXTURE_WRAP_T+ #X2803)
(defconstant +GL_TRANSFORM_BIT+ #X00001000)
(defconstant +GL_TRIANGLES+ #X0004)
(defconstant +GL_TRIANGLE_FAN+ #X0006)
(defconstant +GL_TRIANGLE_STRIP+ #X0005)
(defconstant +GL_TRUE+ 1)
(defconstant +GL_UNPACK_ALIGNMENT+ #X0CF5)
(defconstant +GL_UNPACK_IMAGE_HEIGHT+ #X806E)
(defconstant +GL_UNPACK_LSB_FIRST+ #X0CF1)
(defconstant +GL_UNPACK_ROW_LENGTH+ #X0CF2)
(defconstant +GL_UNPACK_SKIP_IMAGES+ #X806D)
(defconstant +GL_UNPACK_SKIP_PIXELS+ #X0CF4)
(defconstant +GL_UNPACK_SKIP_ROWS+ #X0CF3)
(defconstant +GL_UNPACK_SWAP_BYTES+ #X0CF0)
(defconstant +GL_UNSIGNED_BYTE+ #X1401)
(defconstant +GL_UNSIGNED_BYTE_2_3_3_REV+ #X8362)
(defconstant +GL_UNSIGNED_BYTE_3_3_2+ #X8032)
(defconstant +GL_UNSIGNED_INT+ #X1405)
(defconstant +GL_UNSIGNED_INT_10_10_10_2+ #X8036)
(defconstant +GL_UNSIGNED_INT_2_10_10_10_REV+ #X8368)
(defconstant +GL_UNSIGNED_INT_8_8_8_8+ #X8035)
(defconstant +GL_UNSIGNED_INT_8_8_8_8_REV+ #X8367)
(defconstant +GL_UNSIGNED_SHORT+ #X1403)
(defconstant +GL_UNSIGNED_SHORT_1_5_5_5_REV+ #X8366)
(defconstant +GL_UNSIGNED_SHORT_4_4_4_4+ #X8033)
(defconstant +GL_UNSIGNED_SHORT_4_4_4_4_REV+ #X8365)
(defconstant +GL_UNSIGNED_SHORT_5_5_5_1+ #X8034)
(defconstant +GL_UNSIGNED_SHORT_5_6_5+ #X8363)
(defconstant +GL_UNSIGNED_SHORT_5_6_5_REV+ #X8364)
(defconstant +GL_UPPER_LEFT+ #X8CA2)
(defconstant +GL_V2F+ #X2A20)
(defconstant +GL_V3F+ #X2A21)
(defconstant +GL_VALIDATE_STATUS+ #X8B83)
(defconstant +GL_VENDOR+ #X1F00)
(defconstant +GL_VERSION+ #X1F02)
(defconstant +GL_VERTEX_ARRAY+ #X8074)
(defconstant +GL_VERTEX_ARRAY_BUFFER_BINDING+ #X8896)
(defconstant +GL_VERTEX_ARRAY_POINTER+ #X808E)
(defconstant +GL_VERTEX_ARRAY_SIZE+ #X807A)
(defconstant +GL_VERTEX_ARRAY_STRIDE+ #X807C)
(defconstant +GL_VERTEX_ARRAY_TYPE+ #X807B)
(defconstant +GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING+ #X889F)
(defconstant +GL_VERTEX_ATTRIB_ARRAY_ENABLED+ #X8622)
(defconstant +GL_VERTEX_ATTRIB_ARRAY_NORMALIZED+ #X886A)
(defconstant +GL_VERTEX_ATTRIB_ARRAY_POINTER+ #X8645)
(defconstant +GL_VERTEX_ATTRIB_ARRAY_SIZE+ #X8623)
(defconstant +GL_VERTEX_ATTRIB_ARRAY_STRIDE+ #X8624)
(defconstant +GL_VERTEX_ATTRIB_ARRAY_TYPE+ #X8625)
(defconstant +GL_VERTEX_PROGRAM_POINT_SIZE+ #X8642)
(defconstant +GL_VERTEX_PROGRAM_TWO_SIDE+ #X8643)
(defconstant +GL_VERTEX_SHADER+ #X8B31)
(defconstant +GL_VIEWPORT+ #X0BA2)
(defconstant +GL_VIEWPORT_BIT+ #X00000800)
(defconstant +GL_WEIGHT_ARRAY_BUFFER_BINDING+ #X889E)
(defconstant +GL_WRITE_ONLY+ #X88B9)
(defconstant +GL_XOR+ #X1506)
(defconstant +GL_ZERO+ 0)
(defconstant +GL_ZOOM_X+ #X0D16)
(defconstant +GL_ZOOM_Y+ #X0D17)

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

