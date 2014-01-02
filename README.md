# The OPENGL Package

This is a very simple [OpenGL 2.0](http://www.opengl.org/) FLI wrapper for LispWorks.

# Naming Conventions

All the OpenGL constants are keep their underscore variation, but also have the Common Lisp `+` syntax added. So, for example, `GL_COLOR_BUFFER_BIT` becomes `+GL_COLOR_BUFFER_BIT+`.

All the OpenGL functions are forced to lowercase and replace all camel-casing with `-` characters. A function like `glColor4f` becomes `gl-color4f` and `glEnableClientState` becomes `gl-enable-client-state`.
