# The `:opengl` Package

This is a very simple [OpenGL 2.0](http://www.opengl.org/) FLI wrapper for LispWorks.

All the OpenGL constants and functions use the standard Common Lisp notation. So, for example, `GL_COLOR_BUFFER_BIT` becomes `+gl-color-buffer-bit+`, `glColor4f` becomes `gl-color4f`, and `glEnableClientState` becomes `gl-enable-client-state`.

Additionally, the `gl-float`, `gl-clampf`, `gl-double`, and `gl-clampd` types are wrapped. So any function that takes a `gl-float` (for example) should also accept other numeric Lisp objects.

# The `:opengl-context` Package

For platform independence, there is a root class for rendering: `opengl-context`. There are three methods defined for it:

	;; make this context current for rendering purposes
	(opengl-context-prepare context)
	
	;; flush the command buffer and present the back buffer
	(opengl-context-present context)
	
	;; release any memory associated with this context
	(opengl-context-release context)
	
You should almost never need to call these functions yourself as they are called for you in most cases. However, if you'd like to render directly to an `opengl-context` that you've created, you need to use them. Additionally, there is the `with-opengl-context` macro that does this for you safely.

	with-opengl-context ((context &key present) &body body)
	
The `:present` argument defaults to `nil`. If it is `t`, then when `body` finishes executing `opengl-context-present` will be called.

# The `:opengl-pane` Package

Wrapping the `opengl-context` object is a CAPI pane: `opengl-pane`, a subclass of `output-pane`.

![The opengl-pane in action](https://raw.github.com/massung/lwgl/master/examples/screenshot.png)

The `opengl-pane` class has the following initargs that allow you to override the default behaviors:

**:prepare-callback** *pane*

> This function is called once after the render context for the pane has been successfully created. This is a good place to load textures, and set any global OpenGL values that won't change. The default behavior sets the `gl-clear-color` to black.

**:release-callback** *pane*

> Right before the render context is freed this function is called, giving you an opportunity to free any resources (e.g. textures) or perform any final operations with the context.

**:reshape-callback** *pane width height*

> When the pane is resized, you may want to do things based on the new size (e.g. reload textures with different sizes). There default function is to call `gl-viewport` with the new width and height.

**:render-callback** *pane*

> This is where all your OpenGL render calls will take place. When this function exits all lingering commands will be flushed and the buffers will be swapped. The default behavior is to simple call `gl-clear`.

While the `opengl-pane` subclasses from `output-pane`, it is not recommended that you try and utilize the create, destroy, resize, and display callbacks. The above callbacks are called by `opengl-pane` and ensure that the `opengl-context` for your pane is current (and present when necessary).

If you have need to subclass `opengl-pane` and would like to override/extend the create, destroy, resize, and display callbacks yourself, please - use the generic methods already supplied by `opengl-pane` as they have the correct method-combination already setup as well.

	;; called immediately before the pane is displayed
	(defgeneric create-opengl-pane (pane)
	  (:method-combination progn :most-specific-last))

	;; called immediately before the pane is closed
	(defgeneric destroy-opengl-pane (pane)
	  (:method-combination progn :most-specific-first))

	;; called whenever the pane is resized
	(defgeneric resize-opengl-pane (pane x y w h)
	  (:method-combination progn :most-specific-first))

	;; called when the pane needs to be redrawn
	(defgeneric display-opengl-pane (pane x y w h)
	  (:method-combination progn :most-specific-last)))

# The `:opengl-texture` Package

Once you have an `opengl-pane`, you can use `load-texture` to create `opengl-texture` objects from images.

	(load-texture pane image &key level min-filter mag-filter)

*pane*

> An `opengl-pane` object. The pane's context should be current, meaning that this function should be called from within and `opengl-pane` callback or the body of a `with-opengl-context`.

*image*

> This can be any value accepted by [`load-image`](http://www.lispworks.com/documentation/lw61/CAPRM/html/capiref-592.htm#marker-1019790).

*level*

> This is the mipmap level of the image. The default is 0.

*min-filter*

> This is a texture parameter accepted by the `gl-tex-parameteri` and defaults to `+gl-linear+`.

*mag-filter*

> This is a texture parameter accepted by the `gl-tex-parameteri` and defaults to `+gl-linear+`.

Once loaded, you can access the `opengl-texture` resource for use with `gl-bind-texture`.

	(gl-bind-text +gl-texture-2d+ (opengl-texture tex))

When you are done with the texture, use `free-texture` to release it from memory.

	(free-texture pane texture)

As with `load-texture`, the pane's `opengl-context` object needs to be current. So it should only be called from within the body of a `with-opengl-context` or one of the `opengl-pane` callbacks.