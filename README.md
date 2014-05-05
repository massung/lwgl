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

	(with-opengl-context (c (get-my-context))
	  (gl-clear +gl-color-buffer-bit+))

# The `:opengl-pane` Package

Wrapping the `opengl-context` object is a CAPI pane: `opengl-pane`. Creating one will automatically create an `opengl-context` for the correct platform and attach it to the pane.

When creating the pane, the two initargs to be aware of are the `:render-callback` and `:prepare-callback`. If supplied, each takes the pane as the only parameter.

There are default callbacks defined that will set the viewport size and clear color (in prepare) and clear the back buffer (in render). If you do not want the default behaviors, but also do not wish to supply a callback of your own, pass `nil`.

	CL-USER > (defun triangle (pane)
	            (gl-clear +gl-color-buffer-bit+)
	            (gl-begin +gl-triangles+)
                (gl-color3f 1 0 0)
                (gl-vertex3f -0.6 -0.75 0.5)
                (gl-color3f 0 1 0)
                (gl-vertex3f 0.6 -0.75 0)
                (gl-color3f 0 0 1)
                (gl-vertex3f 0 0.75 0)
                (gl-end))

	CL-USER > (contain (make-instance 'opengl-pane :render-callback 'triangle))
	#<OPENGL-PANE  2309B23F>
	
**WARNING!** The `opengl-pane` class subclasses `output-pane`. The `:create-callback`, `:destroy-callback` and `:display-callback` members of `output-pane` are all used by `opengl-pane`. If you need to override them, then in your callback be sure and call the appropriate `opengl-pane` method as well...

	;; creates the opengl-context for the pane
	opengl-pane::create-opengl-pane
	
	;; releases the opengl-context for the pane
	opengl-pane::destroy-opengl-pane
	
	;; prepares the context, calls render functions, and **presents**
	opengl-pane::display-opengl-pane
	
