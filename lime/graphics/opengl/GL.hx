package lime.graphics.opengl;


import lime.utils.ArrayBuffer;
import lime.utils.ArrayBufferView;
import lime.utils.Float32Array;
import lime.utils.IMemoryRange;
import lime.utils.Int32Array;
import lime.system.System;

#if js
import js.html.webgl.RenderingContext;
#end


@:allow(lime.ui.Window)
class GL {
	
	
	public static inline var DEPTH_BUFFER_BIT = 0x00000100;
	public static inline var STENCIL_BUFFER_BIT = 0x00000400;
	public static inline var COLOR_BUFFER_BIT = 0x00004000;
	
	public static inline var POINTS = 0x0000;
	public static inline var LINES = 0x0001;
	public static inline var LINE_LOOP = 0x0002;
	public static inline var LINE_STRIP = 0x0003;
	public static inline var TRIANGLES = 0x0004;
	public static inline var TRIANGLE_STRIP = 0x0005;
	public static inline var TRIANGLE_FAN = 0x0006;
	
	public static inline var ZERO = 0;
	public static inline var ONE = 1;
	public static inline var SRC_COLOR = 0x0300;
	public static inline var ONE_MINUS_SRC_COLOR = 0x0301;
	public static inline var SRC_ALPHA = 0x0302;
	public static inline var ONE_MINUS_SRC_ALPHA = 0x0303;
	public static inline var DST_ALPHA = 0x0304;
	public static inline var ONE_MINUS_DST_ALPHA = 0x0305;
	
	public static inline var DST_COLOR = 0x0306;
	public static inline var ONE_MINUS_DST_COLOR = 0x0307;
	public static inline var SRC_ALPHA_SATURATE = 0x0308;
	
	public static inline var FUNC_ADD = 0x8006;
	public static inline var BLEND_EQUATION = 0x8009;
	public static inline var BLEND_EQUATION_RGB = 0x8009;
	public static inline var BLEND_EQUATION_ALPHA = 0x883D;
	
	public static inline var FUNC_SUBTRACT = 0x800A;
	public static inline var FUNC_REVERSE_SUBTRACT = 0x800B;
	
	public static inline var BLEND_DST_RGB = 0x80C8;
	public static inline var BLEND_SRC_RGB = 0x80C9;
	public static inline var BLEND_DST_ALPHA = 0x80CA;
	public static inline var BLEND_SRC_ALPHA = 0x80CB;
	public static inline var CONSTANT_COLOR = 0x8001;
	public static inline var ONE_MINUS_CONSTANT_COLOR = 0x8002;
	public static inline var CONSTANT_ALPHA = 0x8003;
	public static inline var ONE_MINUS_CONSTANT_ALPHA = 0x8004;
	public static inline var BLEND_COLOR = 0x8005;
	
	public static inline var ARRAY_BUFFER = 0x8892;
	public static inline var ELEMENT_ARRAY_BUFFER = 0x8893;
	public static inline var ARRAY_BUFFER_BINDING = 0x8894;
	public static inline var ELEMENT_ARRAY_BUFFER_BINDING = 0x8895;
	
	public static inline var STREAM_DRAW = 0x88E0;
	public static inline var STATIC_DRAW = 0x88E4;
	public static inline var DYNAMIC_DRAW = 0x88E8;
	
	public static inline var BUFFER_SIZE = 0x8764;
	public static inline var BUFFER_USAGE = 0x8765;
	
	public static inline var CURRENT_VERTEX_ATTRIB = 0x8626;
	
	public static inline var FRONT = 0x0404;
	public static inline var BACK = 0x0405;
	public static inline var FRONT_AND_BACK = 0x0408;
	
	public static inline var CULL_FACE = 0x0B44;
	public static inline var BLEND = 0x0BE2;
	public static inline var DITHER = 0x0BD0;
	public static inline var STENCIL_TEST = 0x0B90;
	public static inline var DEPTH_TEST = 0x0B71;
	public static inline var SCISSOR_TEST = 0x0C11;
	public static inline var POLYGON_OFFSET_FILL = 0x8037;
	public static inline var SAMPLE_ALPHA_TO_COVERAGE = 0x809E;
	public static inline var SAMPLE_COVERAGE = 0x80A0;
	
	public static inline var NO_ERROR = 0;
	public static inline var INVALID_ENUM = 0x0500;
	public static inline var INVALID_VALUE = 0x0501;
	public static inline var INVALID_OPERATION = 0x0502;
	public static inline var OUT_OF_MEMORY = 0x0505;
	
	public static inline var CW  = 0x0900;
	public static inline var CCW = 0x0901;
	
	public static inline var LINE_WIDTH = 0x0B21;
	public static inline var ALIASED_POINT_SIZE_RANGE = 0x846D;
	public static inline var ALIASED_LINE_WIDTH_RANGE = 0x846E;
	public static inline var CULL_FACE_MODE = 0x0B45;
	public static inline var FRONT_FACE = 0x0B46;
	public static inline var DEPTH_RANGE = 0x0B70;
	public static inline var DEPTH_WRITEMASK = 0x0B72;
	public static inline var DEPTH_CLEAR_VALUE = 0x0B73;
	public static inline var DEPTH_FUNC = 0x0B74;
	public static inline var STENCIL_CLEAR_VALUE = 0x0B91;
	public static inline var STENCIL_FUNC = 0x0B92;
	public static inline var STENCIL_FAIL = 0x0B94;
	public static inline var STENCIL_PASS_DEPTH_FAIL = 0x0B95;
	public static inline var STENCIL_PASS_DEPTH_PASS = 0x0B96;
	public static inline var STENCIL_REF = 0x0B97;
	public static inline var STENCIL_VALUE_MASK = 0x0B93;
	public static inline var STENCIL_WRITEMASK = 0x0B98;
	public static inline var STENCIL_BACK_FUNC = 0x8800;
	public static inline var STENCIL_BACK_FAIL = 0x8801;
	public static inline var STENCIL_BACK_PASS_DEPTH_FAIL = 0x8802;
	public static inline var STENCIL_BACK_PASS_DEPTH_PASS = 0x8803;
	public static inline var STENCIL_BACK_REF = 0x8CA3;
	public static inline var STENCIL_BACK_VALUE_MASK = 0x8CA4;
	public static inline var STENCIL_BACK_WRITEMASK = 0x8CA5;
	public static inline var VIEWPORT = 0x0BA2;
	public static inline var SCISSOR_BOX = 0x0C10;
	
	public static inline var COLOR_CLEAR_VALUE = 0x0C22;
	public static inline var COLOR_WRITEMASK = 0x0C23;
	public static inline var UNPACK_ALIGNMENT = 0x0CF5;
	public static inline var PACK_ALIGNMENT = 0x0D05;
	public static inline var MAX_TEXTURE_SIZE = 0x0D33;
	public static inline var MAX_VIEWPORT_DIMS = 0x0D3A;
	public static inline var SUBPIXEL_BITS = 0x0D50;
	public static inline var RED_BITS = 0x0D52;
	public static inline var GREEN_BITS = 0x0D53;
	public static inline var BLUE_BITS = 0x0D54;
	public static inline var ALPHA_BITS = 0x0D55;
	public static inline var DEPTH_BITS = 0x0D56;
	public static inline var STENCIL_BITS = 0x0D57;
	public static inline var POLYGON_OFFSET_UNITS = 0x2A00;
	
	public static inline var POLYGON_OFFSET_FACTOR = 0x8038;
	public static inline var TEXTURE_BINDING_2D = 0x8069;
	public static inline var SAMPLE_BUFFERS = 0x80A8;
	public static inline var SAMPLES = 0x80A9;
	public static inline var SAMPLE_COVERAGE_VALUE = 0x80AA;
	public static inline var SAMPLE_COVERAGE_INVERT = 0x80AB;
	
	public static inline var COMPRESSED_TEXTURE_FORMATS = 0x86A3;
	
	public static inline var DONT_CARE = 0x1100;
	public static inline var FASTEST = 0x1101;
	public static inline var NICEST = 0x1102;
	
	public static inline var GENERATE_MIPMAP_HINT = 0x8192;
	
	public static inline var BYTE = 0x1400;
	public static inline var UNSIGNED_BYTE = 0x1401;
	public static inline var SHORT = 0x1402;
	public static inline var UNSIGNED_SHORT = 0x1403;
	public static inline var INT = 0x1404;
	public static inline var UNSIGNED_INT = 0x1405;
	public static inline var FLOAT = 0x1406;
	
	public static inline var DEPTH_COMPONENT = 0x1902;
	public static inline var ALPHA = 0x1906;
	public static inline var RGB = 0x1907;
	public static inline var RGBA = 0x1908;
	public static inline var LUMINANCE = 0x1909;
	public static inline var LUMINANCE_ALPHA = 0x190A;
	
	public static inline var UNSIGNED_SHORT_4_4_4_4 = 0x8033;
	public static inline var UNSIGNED_SHORT_5_5_5_1 = 0x8034;
	public static inline var UNSIGNED_SHORT_5_6_5 = 0x8363;
	
	public static inline var FRAGMENT_SHADER = 0x8B30;
	public static inline var VERTEX_SHADER = 0x8B31;
	public static inline var MAX_VERTEX_ATTRIBS = 0x8869;
	public static inline var MAX_VERTEX_UNIFORM_VECTORS = 0x8DFB;
	public static inline var MAX_VARYING_VECTORS = 0x8DFC;
	public static inline var MAX_COMBINED_TEXTURE_IMAGE_UNITS = 0x8B4D;
	public static inline var MAX_VERTEX_TEXTURE_IMAGE_UNITS = 0x8B4C;
	public static inline var MAX_TEXTURE_IMAGE_UNITS = 0x8872;
	public static inline var MAX_FRAGMENT_UNIFORM_VECTORS = 0x8DFD;
	public static inline var SHADER_TYPE = 0x8B4F;
	public static inline var DELETE_STATUS = 0x8B80;
	public static inline var LINK_STATUS = 0x8B82;
	public static inline var VALIDATE_STATUS = 0x8B83;
	public static inline var ATTACHED_SHADERS = 0x8B85;
	public static inline var ACTIVE_UNIFORMS = 0x8B86;
	public static inline var ACTIVE_ATTRIBUTES = 0x8B89;
	public static inline var SHADING_LANGUAGE_VERSION = 0x8B8C;
	public static inline var CURRENT_PROGRAM = 0x8B8D;
	
	public static inline var NEVER = 0x0200;
	public static inline var LESS = 0x0201;
	public static inline var EQUAL = 0x0202;
	public static inline var LEQUAL = 0x0203;
	public static inline var GREATER = 0x0204;
	public static inline var NOTEQUAL = 0x0205;
	public static inline var GEQUAL = 0x0206;
	public static inline var ALWAYS = 0x0207;
	
	public static inline var KEEP = 0x1E00;
	public static inline var REPLACE = 0x1E01;
	public static inline var INCR = 0x1E02;
	public static inline var DECR = 0x1E03;
	public static inline var INVERT = 0x150A;
	public static inline var INCR_WRAP = 0x8507;
	public static inline var DECR_WRAP = 0x8508;
	
	public static inline var VENDOR = 0x1F00;
	public static inline var RENDERER = 0x1F01;
	public static inline var VERSION = 0x1F02;
	
	public static inline var NEAREST = 0x2600;
	public static inline var LINEAR = 0x2601;
	
	public static inline var NEAREST_MIPMAP_NEAREST = 0x2700;
	public static inline var LINEAR_MIPMAP_NEAREST = 0x2701;
	public static inline var NEAREST_MIPMAP_LINEAR = 0x2702;
	public static inline var LINEAR_MIPMAP_LINEAR = 0x2703;
	
	public static inline var TEXTURE_MAG_FILTER = 0x2800;
	public static inline var TEXTURE_MIN_FILTER = 0x2801;
	public static inline var TEXTURE_WRAP_S = 0x2802;
	public static inline var TEXTURE_WRAP_T = 0x2803;
	
	public static inline var TEXTURE_2D = 0x0DE1;
	public static inline var TEXTURE = 0x1702;
	
	public static inline var TEXTURE_CUBE_MAP = 0x8513;
	public static inline var TEXTURE_BINDING_CUBE_MAP = 0x8514;
	public static inline var TEXTURE_CUBE_MAP_POSITIVE_X = 0x8515;
	public static inline var TEXTURE_CUBE_MAP_NEGATIVE_X = 0x8516;
	public static inline var TEXTURE_CUBE_MAP_POSITIVE_Y = 0x8517;
	public static inline var TEXTURE_CUBE_MAP_NEGATIVE_Y = 0x8518;
	public static inline var TEXTURE_CUBE_MAP_POSITIVE_Z = 0x8519;
	public static inline var TEXTURE_CUBE_MAP_NEGATIVE_Z = 0x851A;
	public static inline var MAX_CUBE_MAP_TEXTURE_SIZE = 0x851C;
	
	public static inline var TEXTURE0 = 0x84C0;
	public static inline var TEXTURE1 = 0x84C1;
	public static inline var TEXTURE2 = 0x84C2;
	public static inline var TEXTURE3 = 0x84C3;
	public static inline var TEXTURE4 = 0x84C4;
	public static inline var TEXTURE5 = 0x84C5;
	public static inline var TEXTURE6 = 0x84C6;
	public static inline var TEXTURE7 = 0x84C7;
	public static inline var TEXTURE8 = 0x84C8;
	public static inline var TEXTURE9 = 0x84C9;
	public static inline var TEXTURE10 = 0x84CA;
	public static inline var TEXTURE11 = 0x84CB;
	public static inline var TEXTURE12 = 0x84CC;
	public static inline var TEXTURE13 = 0x84CD;
	public static inline var TEXTURE14 = 0x84CE;
	public static inline var TEXTURE15 = 0x84CF;
	public static inline var TEXTURE16 = 0x84D0;
	public static inline var TEXTURE17 = 0x84D1;
	public static inline var TEXTURE18 = 0x84D2;
	public static inline var TEXTURE19 = 0x84D3;
	public static inline var TEXTURE20 = 0x84D4;
	public static inline var TEXTURE21 = 0x84D5;
	public static inline var TEXTURE22 = 0x84D6;
	public static inline var TEXTURE23 = 0x84D7;
	public static inline var TEXTURE24 = 0x84D8;
	public static inline var TEXTURE25 = 0x84D9;
	public static inline var TEXTURE26 = 0x84DA;
	public static inline var TEXTURE27 = 0x84DB;
	public static inline var TEXTURE28 = 0x84DC;
	public static inline var TEXTURE29 = 0x84DD;
	public static inline var TEXTURE30 = 0x84DE;
	public static inline var TEXTURE31 = 0x84DF;
	public static inline var ACTIVE_TEXTURE = 0x84E0;
	
	public static inline var REPEAT = 0x2901;
	public static inline var CLAMP_TO_EDGE = 0x812F;
	public static inline var MIRRORED_REPEAT = 0x8370;
	
	public static inline var FLOAT_VEC2 = 0x8B50;
	public static inline var FLOAT_VEC3 = 0x8B51;
	public static inline var FLOAT_VEC4 = 0x8B52;
	public static inline var INT_VEC2 = 0x8B53;
	public static inline var INT_VEC3 = 0x8B54;
	public static inline var INT_VEC4 = 0x8B55;
	public static inline var BOOL = 0x8B56;
	public static inline var BOOL_VEC2 = 0x8B57;
	public static inline var BOOL_VEC3 = 0x8B58;
	public static inline var BOOL_VEC4 = 0x8B59;
	public static inline var FLOAT_MAT2 = 0x8B5A;
	public static inline var FLOAT_MAT3 = 0x8B5B;
	public static inline var FLOAT_MAT4 = 0x8B5C;
	public static inline var SAMPLER_2D = 0x8B5E;
	public static inline var SAMPLER_CUBE = 0x8B60;
	
	public static inline var VERTEX_ATTRIB_ARRAY_ENABLED = 0x8622;
	public static inline var VERTEX_ATTRIB_ARRAY_SIZE = 0x8623;
	public static inline var VERTEX_ATTRIB_ARRAY_STRIDE = 0x8624;
	public static inline var VERTEX_ATTRIB_ARRAY_TYPE = 0x8625;
	public static inline var VERTEX_ATTRIB_ARRAY_NORMALIZED = 0x886A;
	public static inline var VERTEX_ATTRIB_ARRAY_POINTER = 0x8645;
	public static inline var VERTEX_ATTRIB_ARRAY_BUFFER_BINDING = 0x889F;
	
	public static inline var VERTEX_PROGRAM_POINT_SIZE = 0x8642;
	public static inline var POINT_SPRITE = 0x8861;
	
	public static inline var COMPILE_STATUS = 0x8B81;
	
	public static inline var LOW_FLOAT = 0x8DF0;
	public static inline var MEDIUM_FLOAT = 0x8DF1;
	public static inline var HIGH_FLOAT = 0x8DF2;
	public static inline var LOW_INT = 0x8DF3;
	public static inline var MEDIUM_INT = 0x8DF4;
	public static inline var HIGH_INT = 0x8DF5;
	
	public static inline var FRAMEBUFFER = 0x8D40;
	public static inline var RENDERBUFFER = 0x8D41;
	
	public static inline var RGBA4 = 0x8056;
	public static inline var RGB5_A1 = 0x8057;
	public static inline var RGB565 = 0x8D62;
	public static inline var DEPTH_COMPONENT16 = 0x81A5;
	public static inline var STENCIL_INDEX = 0x1901;
	public static inline var STENCIL_INDEX8 = 0x8D48;
	public static inline var DEPTH_STENCIL = 0x84F9;
	
	public static inline var RENDERBUFFER_WIDTH = 0x8D42;
	public static inline var RENDERBUFFER_HEIGHT = 0x8D43;
	public static inline var RENDERBUFFER_INTERNAL_FORMAT = 0x8D44;
	public static inline var RENDERBUFFER_RED_SIZE = 0x8D50;
	public static inline var RENDERBUFFER_GREEN_SIZE = 0x8D51;
	public static inline var RENDERBUFFER_BLUE_SIZE = 0x8D52;
	public static inline var RENDERBUFFER_ALPHA_SIZE = 0x8D53;
	public static inline var RENDERBUFFER_DEPTH_SIZE = 0x8D54;
	public static inline var RENDERBUFFER_STENCIL_SIZE = 0x8D55;
	
	public static inline var FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE = 0x8CD0;
	public static inline var FRAMEBUFFER_ATTACHMENT_OBJECT_NAME = 0x8CD1;
	public static inline var FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL = 0x8CD2;
	public static inline var FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE = 0x8CD3;
	
	public static inline var COLOR_ATTACHMENT0 = 0x8CE0;
	public static inline var DEPTH_ATTACHMENT = 0x8D00;
	public static inline var STENCIL_ATTACHMENT = 0x8D20;
	public static inline var DEPTH_STENCIL_ATTACHMENT = 0x821A;
	
	public static inline var NONE = 0;
	
	public static inline var FRAMEBUFFER_COMPLETE = 0x8CD5;
	public static inline var FRAMEBUFFER_INCOMPLETE_ATTACHMENT = 0x8CD6;
	public static inline var FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT = 0x8CD7;
	public static inline var FRAMEBUFFER_INCOMPLETE_DIMENSIONS = 0x8CD9;
	public static inline var FRAMEBUFFER_UNSUPPORTED = 0x8CDD;
	
	public static inline var FRAMEBUFFER_BINDING = 0x8CA6;
	public static inline var RENDERBUFFER_BINDING = 0x8CA7;
	public static inline var MAX_RENDERBUFFER_SIZE = 0x84E8;
	
	public static inline var INVALID_FRAMEBUFFER_OPERATION = 0x0506;
	
	public static inline var UNPACK_FLIP_Y_WEBGL = 0x9240;
	public static inline var UNPACK_PREMULTIPLY_ALPHA_WEBGL = 0x9241;
	public static inline var CONTEXT_LOST_WEBGL = 0x9242;
	public static inline var UNPACK_COLORSPACE_CONVERSION_WEBGL = 0x9243;
	public static inline var BROWSER_DEFAULT_WEBGL = 0x9244;
	
	public static var version (get, null):Int;
	
	#if js
	private static var context:RenderingContext;
	#end
	
	
	public static inline function activeTexture (texture:Int):Void {
		
		#if flash
		#elseif js
		context.activeTexture (texture);
		#else
		lime_gl_active_texture (texture);
		#end
		
	}
	
	
	public static inline function attachShader (program:GLProgram, shader:GLShader):Void {
		
		#if flash
		#elseif js
		context.attachShader (program, shader);
		#else
		program.attach (shader);
		lime_gl_attach_shader (program.id, shader.id);
		#end
		
	}
	
	
	public static inline function bindAttribLocation (program:GLProgram, index:Int, name:String):Void {
		
		#if flash
		#elseif js
		context.bindAttribLocation (program, index, name);
		#else
		lime_gl_bind_attrib_location (program.id, index, name);
		#end
		
	}
	
	
	public static inline function bindBuffer (target:Int, buffer:GLBuffer):Void {
		
		#if flash
		#elseif js
		context.bindBuffer (target, buffer);
		#else
		lime_gl_bind_buffer (target, buffer == null ? 0 : buffer.id);
		#end
		
	}
	
	
	public static inline function bindFramebuffer (target:Int, framebuffer:GLFramebuffer):Void {
		
		#if flash
		#elseif js
		context.bindFramebuffer (target, framebuffer);
		#else
		lime_gl_bind_framebuffer (target, framebuffer == null ? 0 : framebuffer.id);
		#end
		
	}
	
	
	public static inline function bindRenderbuffer (target:Int, renderbuffer:GLRenderbuffer):Void {
		
		#if flash
		#elseif js
		context.bindRenderbuffer (target, renderbuffer);
		#else
		lime_gl_bind_renderbuffer (target, renderbuffer == null ? 0 : renderbuffer.id);
		#end
		
	}
	
	
	public static inline function bindTexture (target:Int, texture:GLTexture):Void {
		
		#if flash
		#elseif js
		context.bindTexture (target, texture);
		#else
		lime_gl_bind_texture(target, texture == null ? 0 : texture.id);
		#end
		
	}
	
	
	public static inline function blendColor (red:Float, green:Float, blue:Float, alpha:Float):Void {
		
		#if flash
		#elseif js
		context.blendColor (red, green, blue, alpha);
		#else
		lime_gl_blend_color (red, green, blue, alpha);
		#end
		
	}
	
	
	public static inline function blendEquation (mode:Int):Void {
		
		#if flash
		#elseif js
		context.blendEquation (mode);
		#else
		lime_gl_blend_equation (mode);
		#end
		
	}
	
	
	public static inline function blendEquationSeparate (modeRGB:Int, modeAlpha:Int):Void {
		
		#if flash
		#elseif js
		context.blendEquationSeparate (modeRGB, modeAlpha);
		#else
		lime_gl_blend_equation_separate (modeRGB, modeAlpha);
		#end
		
	}
	
	
	public static inline function blendFunc (sfactor:Int, dfactor:Int):Void {
		
		#if flash
		#elseif js
		context.blendFunc (sfactor, dfactor);
		#else
		lime_gl_blend_func (sfactor, dfactor);
		#end
		
	}
	
	
	public static inline function blendFuncSeparate (srcRGB:Int, dstRGB:Int, srcAlpha:Int, dstAlpha:Int):Void {
		
		#if flash
		#elseif js
		context.blendFuncSeparate (srcRGB, dstRGB, srcAlpha, dstAlpha);
		#else
		lime_gl_blend_func_separate (srcRGB, dstRGB, srcAlpha, dstAlpha);
		#end
		
	}
	
	
	public static inline function bufferData (target:Int, data:ArrayBufferView, usage:Int):Void {
		
		#if flash
		#elseif js
		context.bufferData (target, data, usage);
		#else
		lime_gl_buffer_data (target, data.getByteBuffer (), data.getStart (), data.getLength (), usage);
		#end
		
	}
	
	
	public static inline function bufferSubData (target:Int, offset:Int, data:ArrayBufferView):Void {
		
		#if flash
		#elseif js
		context.bufferSubData (target, offset, data);
		#else
		lime_gl_buffer_sub_data (target, offset, data.getByteBuffer (), data.getStart (), data.getLength ());
		#end
		
	}
	
	
	public static inline function checkFramebufferStatus (target:Int):Int {
		
		#if flash
		return 0;
		#elseif js
		return context.checkFramebufferStatus (target);
		#else
		return lime_gl_check_framebuffer_status (target);
		#end
		
	}
	
	
	public static inline function clear (mask:Int):Void {
		
		#if flash
		#elseif js
		context.clear (mask);
		#else
		lime_gl_clear (mask);
		#end
		
	}
	
	
	public static inline function clearColor (red:Float, green:Float, blue:Float, alpha:Float):Void {
		
		#if flash
		#elseif js
		context.clearColor (red, green, blue, alpha);
		#else
		lime_gl_clear_color (red, green, blue, alpha);
		#end
		
	}
	
	
	public static inline function clearDepth (depth:Float):Void {
		
		#if flash
		#elseif js
		context.clearDepth (depth);
		#else
		lime_gl_clear_depth (depth);
		#end
		
	}
	
	
	public static inline function clearStencil (s:Int):Void {
		
		#if flash
		#elseif js
		context.clearStencil (s);
		#else
		lime_gl_clear_stencil (s);
		#end
		
	}
	
	
	public static inline function colorMask (red:Bool, green:Bool, blue:Bool, alpha:Bool):Void {
		
		#if flash
		#elseif js
		context.colorMask (red, green, blue, alpha);
		#else
		lime_gl_color_mask (red, green, blue, alpha);
		#end
		
	}
	
	
	public static inline function compileShader (shader:GLShader):Void {
		
		#if flash
		#elseif js
		context.compileShader (shader);
		#else
		lime_gl_compile_shader (shader.id);
		#end
		
	}
	
	
	public static inline function compressedTexImage2D (target:Int, level:Int, internalformat:Int, width:Int, height:Int, border:Int, data:ArrayBufferView):Void {
		
		#if flash
		#elseif js
		context.compressedTexImage2D (target, level, internalformat, width, height, border, data);
		#else
		lime_gl_compressed_tex_image_2d (target, level, internalformat, width, height, border, data == null ? null : data.getByteBuffer (), data == null ? null : data.getStart ());
		#end
		
	}
	
	
	public static inline function compressedTexSubImage2D (target:Int, level:Int, xoffset:Int, yoffset:Int, width:Int, height:Int, format:Int, data:ArrayBufferView):Void {
		
		#if flash
		#elseif js
		context.compressedTexSubImage2D (target, level, xoffset, yoffset, width, height, format, data);
		#else
		lime_gl_compressed_tex_sub_image_2d (target, level, xoffset, yoffset, width, height, format, data == null ? null : data.getByteBuffer (), data == null ? null : data.getStart ());
		#end
		
	}
	
	
	public static inline function copyTexImage2D (target:Int, level:Int, internalformat:Int, x:Int, y:Int, width:Int, height:Int, border:Int):Void {
		
		#if flash
		#elseif js
		context.copyTexImage2D (target, level, internalformat, x, y, width, height, border);
		#else
		lime_gl_copy_tex_image_2d (target, level, internalformat, x, y, width, height, border);
		#end
		
	}
	
	
	public static inline function copyTexSubImage2D (target:Int, level:Int, xoffset:Int, yoffset:Int, x:Int, y:Int, width:Int, height:Int):Void {
		
		#if flash
		#elseif js
		context.copyTexSubImage2D (target, level, xoffset, yoffset, x, y, width, height);
		#else
		lime_gl_copy_tex_sub_image_2d (target, level, xoffset, yoffset, x, y, width, height);
		#end
		
	}
	
	
	public static inline function createBuffer ():GLBuffer {
		
		#if flash
		return null;
		#elseif js
		return context.createBuffer ();
		#else
		return new GLBuffer (version, lime_gl_create_buffer ());
		#end
		
	}
	
	
	public static inline function createFramebuffer ():GLFramebuffer {
		
		#if flash
		return null;
		#elseif js
		return context.createFramebuffer ();
		#else
		return new GLFramebuffer (version, lime_gl_create_framebuffer ());
		#end
		
	}
	
	
	public static inline function createProgram ():GLProgram {
		
		#if flash
		return null;
		#elseif js
		return context.createProgram ();
		#else
		return new GLProgram (version, lime_gl_create_program ());
		#end
		
	}
	
	
	public static inline function createRenderbuffer ():GLRenderbuffer {
		
		#if flash
		return null;
		#elseif js
		return context.createRenderbuffer ();
		#else
		return new GLRenderbuffer (version, lime_gl_create_render_buffer ());
		#end
		
	}
	
	
	public static inline function createShader (type:Int):GLShader {
		
		#if flash
		return null;
		#elseif js
		return context.createShader (type);
		#else
		return new GLShader (version, lime_gl_create_shader (type));
		#end
		
	}
	
	
	public static inline function createTexture ():GLTexture {
		
		#if flash
		return null;
		#elseif js
		return context.createTexture ();
		#else
		return new GLTexture (version, lime_gl_create_texture ());
		#end
		
	}
	
	
	public static inline function cullFace (mode:Int):Void {
		
		#if flash
		#elseif js
		context.cullFace (mode);
		#else
		lime_gl_cull_face (mode);
		#end
		
	}
	
	
	public static inline function deleteBuffer (buffer:GLBuffer):Void {
		
		#if flash
		#elseif js
		context.deleteBuffer (buffer);
		#else
		lime_gl_delete_buffer (buffer.id);
		buffer.invalidate ();
		#end
		
	}
	
	
	public static inline function deleteFramebuffer (framebuffer:GLFramebuffer):Void {
		
		#if flash
		#elseif js
		context.deleteFramebuffer (framebuffer);
		#else
		lime_gl_delete_framebuffer (framebuffer.id);
		framebuffer.invalidate ();
		#end
		
	}
	
	
	public static inline function deleteProgram (program:GLProgram):Void {
		
		#if flash
		#elseif js
		context.deleteProgram (program);
		#else
		lime_gl_delete_program (program.id);
		program.invalidate ();
		#end
		
	}
	
	
	public static inline function deleteRenderbuffer (renderbuffer:GLRenderbuffer):Void {
		
		#if flash
		#elseif js
		context.deleteRenderbuffer (renderbuffer);
		#else
		lime_gl_delete_render_buffer (renderbuffer.id);
		renderbuffer.invalidate ();
		#end
		
	}
	
	
	public static inline function deleteShader (shader:GLShader):Void {
		
		#if flash
		#elseif js
		context.deleteShader (shader);
		#else
		lime_gl_delete_shader (shader.id);
		shader.invalidate ();
		#end
		
	}
	
	
	public static inline function deleteTexture (texture:GLTexture):Void {
		
		#if flash
		#elseif js
		context.deleteTexture (texture);
		#else
		lime_gl_delete_texture (texture.id);
		texture.invalidate ();
		#end
		
	}
	
	
	public static inline function depthFunc (func:Int):Void {
		
		#if flash
		#elseif js
		context.depthFunc (func);
		#else
		lime_gl_depth_func (func);
		#end
		
	}
	
	
	public static inline function depthMask (flag:Bool):Void {
		
		#if flash
		#elseif js
		context.depthMask (flag);
		#else
		lime_gl_depth_mask (flag);
		#end
		
	}
	
	
	public static inline function depthRange (zNear:Float, zFar:Float):Void {
		
		#if flash
		#elseif js
		context.depthRange (zNear, zFar);
		#else
		lime_gl_depth_range (zNear, zFar);
		#end
		
	}
	
	
	public static inline function detachShader (program:GLProgram, shader:GLShader):Void {
		
		#if flash
		#elseif js
		context.detachShader (program, shader);
		#else
		lime_gl_detach_shader (program.id, shader.id);
		#end
		
	}
	
	
	public static inline function disable (cap:Int):Void {
		
		#if flash
		#elseif js
		context.disable (cap);
		#else
		lime_gl_disable (cap);
		#end
		
	}
	
	
	public static inline function disableVertexAttribArray (index:Int):Void {
		
		#if flash
		#elseif js
		context.disableVertexAttribArray (index);
		#else
		lime_gl_disable_vertex_attrib_array (index);
		#end
		
	}
	
	
	public static inline function drawArrays (mode:Int, first:Int, count:Int):Void {
		
		#if flash
		#elseif js
		context.drawArrays (mode, first, count);
		#else
		lime_gl_draw_arrays (mode, first, count);
		#end
		
	}
	
	
	public static inline function drawElements (mode:Int, count:Int, type:Int, offset:Int):Void {
		
		#if flash
		#elseif js
		context.drawElements (mode, count, type, offset);
		#else
		lime_gl_draw_elements (mode, count, type, offset);
		#end
		
	}
	
	
	public static inline function enable (cap:Int):Void {
		
		#if flash
		#elseif js
		context.enable (cap);
		#else
		lime_gl_enable (cap);
		#end
		
	}
	
	
	public static inline function enableVertexAttribArray (index:Int):Void {
		
		#if flash
		#elseif js
		context.enableVertexAttribArray (index);
		#else
		lime_gl_enable_vertex_attrib_array (index);
		#end
		
	}
	
	
	public static inline function finish ():Void {
		
		#if flash
		#elseif js
		context.finish ();
		#else
		lime_gl_finish ();
		#end
		
	}
	
	
	public static inline function flush ():Void {
		
		#if flash
		#elseif js
		context.flush ();
		#else
		lime_gl_flush ();
		#end
		
	}
	
	
	public static inline function framebufferRenderbuffer (target:Int, attachment:Int, renderbuffertarget:Int, renderbuffer:GLRenderbuffer):Void {
		
		#if flash
		#elseif js
		context.framebufferRenderbuffer (target, attachment, renderbuffertarget, renderbuffer);
		#else
		lime_gl_framebuffer_renderbuffer (target, attachment, renderbuffertarget, renderbuffer.id);
		#end
		
	}
	
	
	public static inline function framebufferTexture2D (target:Int, attachment:Int, textarget:Int, texture:GLTexture, level:Int):Void {
		
		#if flash
		#elseif js
		context.framebufferTexture2D (target, attachment, textarget, texture, level);
		#else
		lime_gl_framebuffer_texture2D (target, attachment, textarget, texture.id, level);
		#end
		
	}
	
	
	public static inline function frontFace (mode:Int):Void {
		
		#if flash
		#elseif js
		context.frontFace (mode);
		#else
		lime_gl_front_face (mode);
		#end
		
	}
	
	
	public static inline function generateMipmap (target:Int):Void {
		
		#if flash
		#elseif js
		context.generateMipmap (target);
		#else
		lime_gl_generate_mipmap (target);
		#end
		
	}
	
	
	public static inline function getActiveAttrib (program:GLProgram, index:Int):GLActiveInfo {
		
		#if flash
		return null;
		#elseif js
		return context.getActiveAttrib (program, index);
		#else
		return lime_gl_get_active_attrib (program.id, index);
		#end
		
	}
	
	
	public static inline function getActiveUniform (program:GLProgram, index:Int):GLActiveInfo {
		
		#if flash
		return null;
		#elseif js
		return context.getActiveUniform (program, index);
		#else
		return lime_gl_get_active_uniform (program.id, index);
		#end
		
	}
	
	
	public static inline function getAttachedShaders (program:GLProgram):Array<GLShader> {
		
		#if flash
		return null;
		#elseif js
		return context.getAttachedShaders (program);
		#else
		return program.getShaders ();
		#end
		
	}
	
	
	public static inline function getAttribLocation (program:GLProgram, name:String):Int {
		
		#if flash
		return 0;
		#elseif js
		return context.getAttribLocation (program, name);
		#else
		return lime_gl_get_attrib_location (program.id, name);
		#end
		
	}
	
	
	public static inline function getBufferParameter (target:Int, pname:Int):Int /*Dynamic*/ {
		
		#if flash
		return 0;
		#elseif js
		return context.getBufferParameter (target, pname);
		#else
		return lime_gl_get_buffer_paramerter (target, pname);
		#end
		
	}
	
	
	public static inline function getContextAttributes ():GLContextAttributes {
		
		#if flash
		return null;
		#elseif js
		return context.getContextAttributes ();
		#else
		var base = lime_gl_get_context_attributes ();
		base.premultipliedAlpha = false;
		base.preserveDrawingBuffer = false;
		return base;
		#end
		
	}
	
	
	public static inline function getError ():Int {
		
		#if flash
		return 0;
		#elseif js
		return context.getError ();
		#else
		return lime_gl_get_error ();
		#end
		
	}
	
	
	public static inline function getExtension (name:String):Dynamic {
		
		#if flash
		return null;
		#elseif js
		return context.getExtension (name);
		#else
			//todo?!
		return null;
		// return lime_gl_get_extension(name);
		#end
		
	}
	
	
	public static inline function getFramebufferAttachmentParameter (target:Int, attachment:Int, pname:Int):Int /*Dynamic*/ {
		
		#if flash
		return 0;
		#elseif js
		return context.getFramebufferAttachmentParameter (target, attachment, pname);
		#else
		return lime_gl_get_framebuffer_attachment_parameter (target, attachment, pname);
		#end
		
	}
	
	
	public static inline function getParameter (pname:Int):Dynamic {
		
		#if flash
		return null;
		#elseif js
		return context.getParameter (pname);
		#else
		return lime_gl_get_parameter (pname);
		#end
		
	}
	
	
	public static inline function getProgramInfoLog (program:GLProgram):String {
		
		#if flash
		return null;
		#elseif js
		return context.getProgramInfoLog (program);
		#else
		return lime_gl_get_program_info_log (program.id);
		#end
		
	}
	
	
	public static inline function getProgramParameter (program:GLProgram, pname:Int):Int {
		
		#if flash
		return 0;
		#elseif js
		return context.getProgramParameter (program, pname);
		#else
		return lime_gl_get_program_parameter (program.id, pname);
		#end
		
	}
	
	
	public static inline function getRenderbufferParameter (target:Int, pname:Int):Int /*Dynamic*/ {
		
		#if flash
		return 0;
		#elseif js
		return context.getRenderbufferParameter (target, pname);
		#else
		return lime_gl_get_render_buffer_parameter (target, pname);
		#end
		
	}
	
	
	public static inline function getShaderInfoLog (shader:GLShader):String {
		
		#if flash
		return null;
		#elseif js
		return context.getShaderInfoLog (shader);
		#else
		return lime_gl_get_shader_info_log (shader.id);
		#end
		
	}
	
	
	public static inline function getShaderParameter (shader:GLShader, pname:Int):Int {
		
		#if flash
		return 0;
		#elseif js
		return context.getShaderParameter (shader, pname);
		#else
		return lime_gl_get_shader_parameter (shader.id, pname);
		#end
		
	}
	
	
	public static inline function getShaderPrecisionFormat (shadertype:Int, precisiontype:Int):GLShaderPrecisionFormat {
		
		#if flash
		return null;
		#elseif js
		return context.getShaderPrecisionFormat (shadertype, precisiontype);
		#else
		return lime_gl_get_shader_precision_format (shadertype, precisiontype);
		#end
		
	}
	
	
	public static inline function getShaderSource (shader:GLShader):String {
		
		#if flash
		return null;
		#elseif js
		return context.getShaderSource (shader);
		#else
		return lime_gl_get_shader_source (shader.id);
		#end
		
	}
	
	
	public static inline function getSupportedExtensions ():Array<String> {
		
		#if flash
		return null;
		#elseif js
		return context.getSupportedExtensions ();
		#else
		var result = new Array<String> ();
		lime_gl_get_supported_extensions (result);
		return result;
		#end
		
	}
	
	
	public static inline function getTexParameter (target:Int, pname:Int):Int /*Dynamic*/ {
		
		#if flash
		return 0;
		#elseif js
		return context.getTexParameter (target, pname);
		#else
		return lime_gl_get_tex_parameter (target, pname);
		#end
		
	}
	
	
	public static inline function getUniform (program:GLProgram, location:GLUniformLocation):Dynamic {
		
		#if flash
		return null;
		#elseif js
		return context.getUniform (program, location);
		#else
		return lime_gl_get_uniform (program.id, location);
		#end
		
	}
	
	
	public static inline function getUniformLocation (program:GLProgram, name:String):GLUniformLocation {
		
		#if flash
		return 0;
		#elseif js
		return context.getUniformLocation (program, name);
		#else
		return lime_gl_get_uniform_location (program.id, name);
		#end
		
	}
	
	
	public static inline function getVertexAttrib (index:Int, pname:Int):Int /*Dynamic*/ {
		
		#if flash
		return 0;
		#elseif js
		return context.getVertexAttrib (index, pname);
		#else
		return lime_gl_get_vertex_attrib (index, pname);
		#end
		
	}
	
	
	public static inline function getVertexAttribOffset (index:Int, pname:Int):Int {
		
		#if flash
		return 0;
		#elseif js
		return context.getVertexAttribOffset (index, pname);
		#else
		return lime_gl_get_vertex_attrib_offset (index, pname);
		#end
		
	}
	
	
	public static inline function hint (target:Int, mode:Int):Void {
		
		#if flash
		#elseif js
		context.hint (target, mode);
		#else
		lime_gl_hint (target, mode);
		#end
		
	}
	
	
	public static inline function isBuffer (buffer:GLBuffer):Bool {
		
		#if flash
		return false;
		#elseif js
		return context.isBuffer (buffer);
		#else
		return buffer != null && buffer.id > 0 && lime_gl_is_buffer (buffer.id);
		#end
		
	}
	
	
	// This is non-static
	// public function isContextLost():Bool { return false; }
	
	
	public static inline function isEnabled (cap:Int):Bool {
		
		#if flash
		return false;
		#elseif js
		return context.isEnabled (cap);
		#else
		return lime_gl_is_enabled (cap);
		#end
		
	}
	
	
	public static inline function isFramebuffer (framebuffer:GLFramebuffer):Bool {
		
		#if flash
		return false;
		#elseif js
		return context.isFramebuffer (framebuffer);
		#else
		return framebuffer != null && framebuffer.id > 0 && lime_gl_is_framebuffer (framebuffer.id);
		#end
		
	}
	
	
	public static inline function isProgram (program:GLProgram):Bool {
		
		#if flash
		return false;
		#elseif js
		return context.isProgram (program);
		#else
		return program != null && program.id > 0 && lime_gl_is_program (program.id);
		#end
		
	}
	
	
	public static inline function isRenderbuffer (renderbuffer:GLRenderbuffer):Bool {
		
		#if flash
		return false;
		#elseif js
		return context.isRenderbuffer (renderbuffer);
		#else
		return renderbuffer != null && renderbuffer.id > 0 && lime_gl_is_renderbuffer (renderbuffer.id);
		#end
		
	}
	
	
	public static inline function isShader (shader:GLShader):Bool {
		
		#if flash
		return false;
		#elseif js
		return context.isShader (shader);
		#else
		return shader != null && shader.id > 0 && lime_gl_is_shader (shader.id);
		#end
		
	}
	
	
	public static inline function isTexture (texture:GLTexture):Bool {
		
		#if flash
		return false;
		#elseif js
		return context.isTexture (texture);
		#else
		return texture != null && texture.id > 0 && lime_gl_is_texture (texture.id);
		#end
		
	}
	
	
	public static inline function lineWidth (width:Float):Void {
		
		#if flash
		#elseif js
		context.lineWidth (width);
		#else
		lime_gl_line_width (width);
		#end
		
	}
	
	
	public static inline function linkProgram (program:GLProgram):Void {
		
		#if flash
		#elseif js
		context.linkProgram (program);
		#else
		lime_gl_link_program (program.id);
		#end
		
	}
	
	
	public static inline function pixelStorei (pname:Int, param:Int):Void {
		
		#if flash
		#elseif js
		context.pixelStorei (pname, param);
		#else
		lime_gl_pixel_storei (pname, param);
		#end
		
	}
	
	
	public static inline function polygonOffset (factor:Float, units:Float):Void {
		
		#if flash
		#elseif js
		context.polygonOffset (factor, units);
		#else
		lime_gl_polygon_offset (factor, units);
		#end
		
	}
	
	
	public static inline function readPixels (x:Int, y:Int, width:Int, height:Int, format:Int, type:Int, pixels:ArrayBufferView):Void {
		
		#if flash
		#elseif js
		context.readPixels (x, y, width, height, format, type, pixels);
		#else
		lime_gl_read_pixels (x, y, width, height, format, type, pixels == null ? null : pixels.getByteBuffer (), pixels == null ? null : pixels.getStart ());
		#end
		
	}
	
	
	public static inline function renderbufferStorage (target:Int, internalformat:Int, width:Int, height:Int):Void {
		
		#if flash
		#elseif js
		context.renderbufferStorage (target, internalformat, width, height);
		#else
		lime_gl_renderbuffer_storage (target, internalformat, width, height);
		#end
		
	}
	
	
	public static inline function sampleCoverage (value:Float, invert:Bool):Void {
		
		#if flash
		#elseif js
		context.sampleCoverage (value, invert);
		#else
		lime_gl_sample_coverage (value, invert);
		#end
		
	}
	
	
	public static inline function scissor (x:Int, y:Int, width:Int, height:Int):Void {
		
		#if flash
		#elseif js
		context.scissor (x, y, width, height);
		#else
		lime_gl_scissor (x, y, width, height);
		#end
		
	}
	
	
	public static inline function shaderSource (shader:GLShader, source:String):Void {
		
		#if flash
		#elseif js
		context.shaderSource (shader, source);
		#else
		lime_gl_shader_source (shader.id, source);
		#end
		
	}
	
	
	public static inline function stencilFunc (func:Int, ref:Int, mask:Int):Void {
		
		#if flash
		#elseif js
		context.stencilFunc (func, ref, mask);
		#else
		lime_gl_stencil_func (func, ref, mask);
		#end
		
	}
	
	
	public static inline function stencilFuncSeparate (face:Int, func:Int, ref:Int, mask:Int):Void {
		
		#if flash
		#elseif js
		context.stencilFuncSeparate (face, func, ref, mask);
		#else
		lime_gl_stencil_func_separate (face, func, ref, mask);
		#end
		
	}
	
	
	public static inline function stencilMask (mask:Int):Void {
		
		#if flash
		#elseif js
		context.stencilMask (mask);
		#else
		lime_gl_stencil_mask (mask);
		#end
		
	}
	
	
	public static inline function stencilMaskSeparate (face:Int, mask:Int):Void {
		
		#if flash
		#elseif js
		context.stencilMaskSeparate (face, mask);
		#else
		lime_gl_stencil_mask_separate (face, mask);
		#end
		
	}
	
	
	public static inline function stencilOp (fail:Int, zfail:Int, zpass:Int):Void {
		
		#if flash
		#elseif js
		context.stencilOp (fail, zfail, zpass);
		#else
		lime_gl_stencil_op (fail, zfail, zpass);
		#end
		
	}
	
	
	public static inline function stencilOpSeparate (face:Int, fail:Int, zfail:Int, zpass:Int):Void {
		
		#if flash
		#elseif js
		context.stencilOpSeparate (face, fail, zfail, zpass);
		#else
		lime_gl_stencil_op_separate (face, fail, zfail, zpass);
		#end
		
	}
	
	
	public static inline function texImage2D (target:Int, level:Int, internalformat:Int, width:Int, height:Int, border:Int, format:Int, type:Int, pixels:ArrayBufferView):Void {
		
		#if flash
		#elseif js
		context.texImage2D (target, level, internalformat, width, height, border, format, type, pixels);
		#else
		lime_gl_tex_image_2d (target, level, internalformat, width, height, border, format, type, pixels == null ? null : pixels.getByteBuffer (), pixels == null ? null : pixels.getStart ());
		#end
		
	}
	
	
	public static inline function texParameterf (target:Int, pname:Int, param:Float):Void {
		
		#if flash
		#elseif js
		context.texParameterf (target, pname, param);
		#else
		lime_gl_tex_parameterf (target, pname, param);
		#end
		
	}
	
	
	public static inline function texParameteri (target:Int, pname:Int, param:Int):Void {
		
		#if flash
		#elseif js
		context.texParameteri (target, pname, param);
		#else
		lime_gl_tex_parameteri (target, pname, param);
		#end
		
	}
	
	
	public static inline function texSubImage2D (target:Int, level:Int, xoffset:Int, yoffset:Int, width:Int, height:Int, format:Int, type:Int, pixels:ArrayBufferView):Void {
		
		#if flash
		#elseif js
		context.texSubImage2D (target, level, xoffset, yoffset, width, height, format, type, pixels);
		#else
		lime_gl_tex_sub_image_2d (target, level, xoffset, yoffset, width, height, format, type, pixels == null ? null : pixels.getByteBuffer(), pixels == null ? null : pixels.getStart());
		#end
		
	}
	
	
	public static inline function uniform1f (location:GLUniformLocation, x:Float):Void {
		
		#if flash
		#elseif js
		context.uniform1f (location, x);
		#else
		lime_gl_uniform1f (location, x);
		#end
		
	}
	
	
	public static inline function uniform1fv (location:GLUniformLocation, x:Float32Array):Void {
		
		#if flash
		#elseif js
		context.uniform1fv (location, x);
		#else
		lime_gl_uniform1fv (location, x.getByteBuffer ());
		#end
		
	}
	
	
	public static inline function uniform1i (location:GLUniformLocation, x:Int):Void {
		
		#if flash
		#elseif js
		context.uniform1i (location, x);
		#else
		lime_gl_uniform1i (location, x);
		#end
		
	}
	
	
	public static inline function uniform1iv (location:GLUniformLocation, v:Int32Array):Void {
		
		#if flash
		#elseif js
		context.uniform1iv (location, v);
		#else
		lime_gl_uniform1iv (location, v.getByteBuffer ());
		#end
		
	}
	
	
	public static inline function uniform2f (location:GLUniformLocation, x:Float, y:Float):Void {
		
		#if flash
		#elseif js
		context.uniform2f (location, x, y);
		#else
		lime_gl_uniform2f (location, x, y);
		#end
		
	}
	
	
	public static inline function uniform2fv (location:GLUniformLocation, v:Float32Array):Void {
		
		#if flash
		#elseif js
		context.uniform2fv (location, v);
		#else
		lime_gl_uniform2fv (location, v.getByteBuffer ());
		#end
		
	}
	
	
	public static inline function uniform2i (location:GLUniformLocation, x:Int, y:Int):Void {
		
		#if flash
		#elseif js
		context.uniform2i (location, x, y);
		#else
		lime_gl_uniform2i (location, x, y);
		#end
		
	}
	
	
	public static inline function uniform2iv (location:GLUniformLocation, v:Int32Array):Void {
		
		#if flash
		#elseif js
		context.uniform2iv (location, v);
		#else
		lime_gl_uniform2iv (location, v.getByteBuffer ());
		#end
		
	}
	
	
	public static inline function uniform3f (location:GLUniformLocation, x:Float, y:Float, z:Float):Void {
		
		#if flash
		#elseif js
		context.uniform3f (location, x, y, z);
		#else
		lime_gl_uniform3f (location, x, y, z);
		#end
		
	}
	
	
	public static inline function uniform3fv (location:GLUniformLocation, v:Float32Array):Void {
		
		#if flash
		#elseif js
		context.uniform3fv (location, v);
		#else
		lime_gl_uniform3fv (location, v.getByteBuffer ());
		#end
		
	}
	
	
	public static inline function uniform3i (location:GLUniformLocation, x:Int, y:Int, z:Int):Void {
		
		#if flash
		#elseif js
		context.uniform3i (location, x, y, z);
		#else
		lime_gl_uniform3i (location, x, y, z);
		#end
		
	}
	
	
	public static inline function uniform3iv (location:GLUniformLocation, v:Int32Array):Void {
		
		#if flash
		#elseif js
		context.uniform3iv (location, v);
		#else
		lime_gl_uniform3iv (location, v.getByteBuffer ());
		#end
		
	}
	
	
	public static inline function uniform4f (location:GLUniformLocation, x:Float, y:Float, z:Float, w:Float):Void {
		
		#if flash
		#elseif js
		context.uniform4f (location, x, y, z, w);
		#else
		lime_gl_uniform4f (location, x, y, z, w);
		#end
		
	}
	
	
	public static inline function uniform4fv (location:GLUniformLocation, v:Float32Array):Void {
		
		#if flash
		#elseif js
		context.uniform4fv (location, v);
		#else
		lime_gl_uniform4fv (location, v.getByteBuffer ());
		#end
		
	}
	
	
	public static inline function uniform4i (location:GLUniformLocation, x:Int, y:Int, z:Int, w:Int):Void {
		
		#if flash
		#elseif js
		context.uniform4i (location, x, y, z, w);
		#else
		lime_gl_uniform4i (location, x, y, z, w);
		#end
		
	}
	
	
	public static inline function uniform4iv (location:GLUniformLocation, v:Int32Array):Void {
		
		#if flash
		#elseif js
		context.uniform4iv (location, v);
		#else
		lime_gl_uniform4iv (location, v.getByteBuffer ());
		#end
		
	}
	
	
	public static inline function uniformMatrix2fv (location:GLUniformLocation, transpose:Bool, v:Float32Array):Void {
		
		#if flash
		#elseif js
		context.uniformMatrix2fv (location, transpose, v);
		#else
		lime_gl_uniform_matrix (location, transpose, v.getByteBuffer (), 2);
		#end
		
	}
	
	
	public static inline function uniformMatrix3fv (location:GLUniformLocation, transpose:Bool, v:Float32Array):Void {
		
		#if flash
		#elseif js
		context.uniformMatrix3fv (location, transpose, v);
		#else
		lime_gl_uniform_matrix (location, transpose, v.getByteBuffer (), 3);
		#end
		
	}
	
	
	public static inline function uniformMatrix4fv (location:GLUniformLocation, transpose:Bool, v:Float32Array):Void {
		
		#if flash
		#elseif js
		context.uniformMatrix4fv (location, transpose, v);
		#else
		lime_gl_uniform_matrix (location, transpose, v.getByteBuffer (), 4);
		#end
		
	}
	
	
	/*public static inline function uniformMatrix3D(location:GLUniformLocation, transpose:Bool, matrix:Matrix3D):Void {
		
		lime_gl_uniform_matrix(location, transpose, Float32Array.fromMatrix(matrix).getByteBuffer() , 4);
		
	}*/
	
	
	public static inline function useProgram (program:GLProgram):Void {
		
		#if flash
		#elseif js
		context.useProgram (program);
		#else
		lime_gl_use_program (program == null ? 0 : program.id);
		#end
		
	}
	
	
	public static inline function validateProgram (program:GLProgram):Void {
		
		#if flash
		#elseif js
		context.validateProgram (program);
		#else
		lime_gl_validate_program (program.id);
		#end
		
	}
	
	
	public static inline function vertexAttrib1f (indx:Int, x:Float):Void {
		
		#if flash
		#elseif js
		context.vertexAttrib1f (indx, x);
		#else
		lime_gl_vertex_attrib1f (indx, x);
		#end
		
	}
	
	
	public static inline function vertexAttrib1fv (indx:Int, values:Float32Array):Void {
		
		#if flash
		#elseif js
		context.vertexAttrib1fv (indx, values);
		#else
		lime_gl_vertex_attrib1fv (indx, values.getByteBuffer ());
		#end
		
	}
	
	
	public static inline function vertexAttrib2f (indx:Int, x:Float, y:Float):Void {
		
		#if flash
		#elseif js
		context.vertexAttrib2f (indx, x, y);
		#else
		lime_gl_vertex_attrib2f (indx, x, y);
		#end
		
	}
	
	
	public static inline function vertexAttrib2fv (indx:Int, values:Float32Array):Void {
		
		#if flash
		#elseif js
		context.vertexAttrib2fv (indx, values);
		#else
		lime_gl_vertex_attrib2fv (indx, values.getByteBuffer());
		#end
		
	}
	
	
	public static inline function vertexAttrib3f (indx:Int, x:Float, y:Float, z:Float):Void {
		
		#if flash
		#elseif js
		context.vertexAttrib3f (indx, x, y, z);
		#else
		lime_gl_vertex_attrib3f (indx, x, y, z);
		#end
		
	}
	
	
	public static inline function vertexAttrib3fv (indx:Int, values:Float32Array):Void {
		
		#if flash
		#elseif js
		context.vertexAttrib3fv (indx, values);
		#else
		lime_gl_vertex_attrib3fv (indx, values.getByteBuffer ());
		#end
		
	}
	
	
	public static inline function vertexAttrib4f (indx:Int, x:Float, y:Float, z:Float, w:Float):Void {
		
		#if flash
		#elseif js
		context.vertexAttrib4f (indx, x, y, z, w);
		#else
		lime_gl_vertex_attrib4f (indx, x, y, z, w);
		#end
		
	}
	
	
	public static inline function vertexAttrib4fv (indx:Int, values:Float32Array):Void {
		
		#if flash
		#elseif js
		context.vertexAttrib4fv (indx, values);
		#else
		lime_gl_vertex_attrib4fv (indx, values.getByteBuffer ());
		#end
		
	}
	
	
	public static inline function vertexAttribPointer (indx:Int, size:Int, type:Int, normalized:Bool, stride:Int, offset:Int):Void {
		
		#if flash
		#elseif js
		context.vertexAttribPointer (indx, size, type, normalized, stride, offset);
		#else
		lime_gl_vertex_attrib_pointer (indx, size, type, normalized, stride, offset);
		#end
		
	}
	
	
	public static inline function viewport (x:Int, y:Int, width:Int, height:Int):Void {
		
		#if flash
		#elseif js
		context.viewport (x, y, width, height);
		#else
		lime_gl_viewport (x, y, width, height);
		#end
		
	}
	
	
	private static function get_version ():Int { return 2; }
	
	
	#if (cpp || neko)
	
	private static var lime_gl_active_texture = System.load ("lime", "lime_gl_active_texture", 1);
	private static var lime_gl_attach_shader = System.load ("lime", "lime_gl_attach_shader", 2);
	private static var lime_gl_bind_attrib_location = System.load ("lime", "lime_gl_bind_attrib_location", 3);
	private static var lime_gl_bind_buffer = System.load ("lime", "lime_gl_bind_buffer", 2);
	private static var lime_gl_bind_framebuffer = System.load ("lime", "lime_gl_bind_framebuffer", 2);
	private static var lime_gl_bind_renderbuffer = System.load ("lime", "lime_gl_bind_renderbuffer", 2);
	private static var lime_gl_bind_texture = System.load ("lime", "lime_gl_bind_texture", 2);
	private static var lime_gl_blend_color = System.load ("lime", "lime_gl_blend_color", 4);
	private static var lime_gl_blend_equation = System.load ("lime", "lime_gl_blend_equation", 1);
	private static var lime_gl_blend_equation_separate = System.load ("lime", "lime_gl_blend_equation_separate", 2);
	private static var lime_gl_blend_func = System.load ("lime", "lime_gl_blend_func", 2);
	private static var lime_gl_blend_func_separate = System.load ("lime", "lime_gl_blend_func_separate", 4);
	private static var lime_gl_buffer_data = System.load ("lime", "lime_gl_buffer_data", 5);
	private static var lime_gl_buffer_sub_data = System.load ("lime", "lime_gl_buffer_sub_data", 5);
	private static var lime_gl_check_framebuffer_status = System.load ("lime", "lime_gl_check_framebuffer_status", 1);
	private static var lime_gl_clear = System.load ("lime", "lime_gl_clear", 1);
	private static var lime_gl_clear_color = System.load ("lime", "lime_gl_clear_color", 4);
	private static var lime_gl_clear_depth = System.load ("lime", "lime_gl_clear_depth", 1);
	private static var lime_gl_clear_stencil = System.load ("lime", "lime_gl_clear_stencil", 1);
	private static var lime_gl_color_mask = System.load ("lime", "lime_gl_color_mask", 4);
	private static var lime_gl_compile_shader = System.load ("lime", "lime_gl_compile_shader", 1);
	private static var lime_gl_compressed_tex_image_2d = System.load ("lime", "lime_gl_compressed_tex_image_2d", -1);
	private static var lime_gl_compressed_tex_sub_image_2d = System.load ("lime", "lime_gl_compressed_tex_sub_image_2d", -1);
	private static var lime_gl_copy_tex_image_2d = System.load ("lime", "lime_gl_copy_tex_image_2d", -1);
	private static var lime_gl_copy_tex_sub_image_2d = System.load ("lime", "lime_gl_copy_tex_sub_image_2d", -1);
	private static var lime_gl_create_buffer = System.load ("lime", "lime_gl_create_buffer", 0);
	private static var lime_gl_create_framebuffer = System.load ("lime", "lime_gl_create_framebuffer", 0);
	private static var lime_gl_create_program = System.load ("lime", "lime_gl_create_program", 0);
	private static var lime_gl_create_render_buffer = System.load ("lime", "lime_gl_create_render_buffer", 0);
	private static var lime_gl_create_shader = System.load ("lime", "lime_gl_create_shader", 1);
	private static var lime_gl_create_texture = System.load ("lime", "lime_gl_create_texture", 0);
	private static var lime_gl_cull_face = System.load ("lime", "lime_gl_cull_face", 1);
	private static var lime_gl_delete_buffer = System.load ("lime", "lime_gl_delete_buffer", 1);
	private static var lime_gl_delete_framebuffer = System.load ("lime", "lime_gl_delete_framebuffer", 1);
	private static var lime_gl_delete_program = System.load ("lime", "lime_gl_delete_program", 1);
	private static var lime_gl_delete_render_buffer = System.load ("lime", "lime_gl_delete_render_buffer", 1);
	private static var lime_gl_delete_shader = System.load ("lime", "lime_gl_delete_shader", 1);
	private static var lime_gl_delete_texture = System.load ("lime", "lime_gl_delete_texture", 1);
	private static var lime_gl_depth_func = System.load ("lime", "lime_gl_depth_func", 1);
	private static var lime_gl_depth_mask = System.load ("lime", "lime_gl_depth_mask", 1);
	private static var lime_gl_depth_range = System.load ("lime", "lime_gl_depth_range", 2);
	private static var lime_gl_detach_shader = System.load ("lime", "lime_gl_detach_shader", 2);
	private static var lime_gl_disable = System.load ("lime", "lime_gl_disable", 1);
	private static var lime_gl_disable_vertex_attrib_array = System.load ("lime", "lime_gl_disable_vertex_attrib_array", 1);
	private static var lime_gl_draw_arrays = System.load ("lime", "lime_gl_draw_arrays", 3);
	private static var lime_gl_draw_elements = System.load ("lime", "lime_gl_draw_elements", 4);
	private static var lime_gl_enable = System.load ("lime", "lime_gl_enable", 1);
	private static var lime_gl_enable_vertex_attrib_array = System.load ("lime", "lime_gl_enable_vertex_attrib_array", 1);
	private static var lime_gl_finish = System.load ("lime", "lime_gl_finish", 0);
	private static var lime_gl_flush = System.load ("lime", "lime_gl_flush", 0);
	private static var lime_gl_framebuffer_renderbuffer = System.load ("lime", "lime_gl_framebuffer_renderbuffer", 4);
	private static var lime_gl_framebuffer_texture2D = System.load ("lime", "lime_gl_framebuffer_texture2D", 5);
	private static var lime_gl_front_face = System.load ("lime", "lime_gl_front_face", 1);
	private static var lime_gl_generate_mipmap = System.load ("lime", "lime_gl_generate_mipmap", 1);
	private static var lime_gl_get_active_attrib = System.load ("lime", "lime_gl_get_active_attrib", 2);
	private static var lime_gl_get_active_uniform = System.load ("lime", "lime_gl_get_active_uniform", 2);
	private static var lime_gl_get_attrib_location = System.load ("lime", "lime_gl_get_attrib_location", 2);
	private static var lime_gl_get_buffer_paramerter = System.load ("lime", "lime_gl_get_buffer_paramerter", 2);
	private static var lime_gl_get_context_attributes = System.load ("lime", "lime_gl_get_context_attributes", 0);
	private static var lime_gl_get_error = System.load ("lime", "lime_gl_get_error", 0);
	private static var lime_gl_get_framebuffer_attachment_parameter = System.load ("lime", "lime_gl_get_framebuffer_attachment_parameter", 3);
	private static var lime_gl_get_parameter = System.load ("lime", "lime_gl_get_parameter", 1);
	// static var lime_gl_get_extension = System.load ("lime", "lime_gl_get_extension", 1); 
	private static var lime_gl_get_program_info_log = System.load ("lime", "lime_gl_get_program_info_log", 1);
	private static var lime_gl_get_program_parameter = System.load ("lime", "lime_gl_get_program_parameter", 2);
	private static var lime_gl_get_render_buffer_parameter = System.load ("lime", "lime_gl_get_render_buffer_parameter", 2);
	private static var lime_gl_get_shader_info_log = System.load ("lime", "lime_gl_get_shader_info_log", 1);
	private static var lime_gl_get_shader_parameter = System.load ("lime", "lime_gl_get_shader_parameter", 2);
	private static var lime_gl_get_shader_precision_format = System.load ("lime", "lime_gl_get_shader_precision_format", 2);
	private static var lime_gl_get_shader_source = System.load ("lime", "lime_gl_get_shader_source", 1);
	private static var lime_gl_get_supported_extensions = System.load ("lime", "lime_gl_get_supported_extensions", 1);
	private static var lime_gl_get_tex_parameter = System.load ("lime", "lime_gl_get_tex_parameter", 2);
	private static var lime_gl_get_uniform = System.load ("lime", "lime_gl_get_uniform", 2);
	private static var lime_gl_get_uniform_location = System.load ("lime", "lime_gl_get_uniform_location", 2);
	private static var lime_gl_get_vertex_attrib = System.load ("lime", "lime_gl_get_vertex_attrib", 2);
	private static var lime_gl_get_vertex_attrib_offset = System.load ("lime", "lime_gl_get_vertex_attrib_offset", 2);
	private static var lime_gl_hint = System.load ("lime", "lime_gl_hint", 2);
	private static var lime_gl_is_buffer = System.load ("lime", "lime_gl_is_buffer", 1);
	private static var lime_gl_is_enabled = System.load ("lime", "lime_gl_is_enabled", 1);
	private static var lime_gl_is_framebuffer = System.load ("lime", "lime_gl_is_framebuffer", 1);
	private static var lime_gl_is_program = System.load ("lime", "lime_gl_is_program", 1);
	private static var lime_gl_is_renderbuffer = System.load ("lime", "lime_gl_is_renderbuffer", 1);
	private static var lime_gl_is_shader = System.load ("lime", "lime_gl_is_shader", 1);
	private static var lime_gl_is_texture = System.load ("lime", "lime_gl_is_texture", 1);
	private static var lime_gl_line_width = System.load ("lime", "lime_gl_line_width", 1);
	private static var lime_gl_link_program = System.load ("lime", "lime_gl_link_program", 1);
	private static var lime_gl_pixel_storei = System.load ("lime", "lime_gl_pixel_storei", 2);
	private static var lime_gl_polygon_offset = System.load ("lime", "lime_gl_polygon_offset", 2);
	private static var lime_gl_read_pixels = System.load ("lime", "lime_gl_read_pixels", -1);
	private static var lime_gl_renderbuffer_storage = System.load ("lime", "lime_gl_renderbuffer_storage", 4);
	private static var lime_gl_sample_coverage = System.load ("lime", "lime_gl_sample_coverage", 2);
	private static var lime_gl_scissor = System.load ("lime", "lime_gl_scissor", 4);
	private static var lime_gl_shader_source = System.load ("lime", "lime_gl_shader_source", 2);
	private static var lime_gl_stencil_func = System.load ("lime", "lime_gl_stencil_func", 3);
	private static var lime_gl_stencil_func_separate = System.load ("lime", "lime_gl_stencil_func_separate", 4);
	private static var lime_gl_stencil_mask = System.load ("lime", "lime_gl_stencil_mask", 1);
	private static var lime_gl_stencil_mask_separate = System.load ("lime", "lime_gl_stencil_mask_separate", 2);
	private static var lime_gl_stencil_op = System.load ("lime", "lime_gl_stencil_op", 3);
	private static var lime_gl_stencil_op_separate = System.load ("lime", "lime_gl_stencil_op_separate", 4);
	private static var lime_gl_tex_image_2d = System.load ("lime", "lime_gl_tex_image_2d", -1);
	private static var lime_gl_tex_parameterf = System.load ("lime", "lime_gl_tex_parameterf", 3);
	private static var lime_gl_tex_parameteri = System.load ("lime", "lime_gl_tex_parameteri", 3);
	private static var lime_gl_tex_sub_image_2d = System.load ("lime", "lime_gl_tex_sub_image_2d", -1);
	private static var lime_gl_uniform1f = System.load ("lime", "lime_gl_uniform1f", 2);
	private static var lime_gl_uniform1fv = System.load ("lime", "lime_gl_uniform1fv", 2);
	private static var lime_gl_uniform1i = System.load ("lime", "lime_gl_uniform1i", 2);
	private static var lime_gl_uniform1iv = System.load ("lime", "lime_gl_uniform1iv", 2);
	private static var lime_gl_uniform2f = System.load ("lime", "lime_gl_uniform2f", 3);
	private static var lime_gl_uniform2fv = System.load ("lime", "lime_gl_uniform2fv", 2);
	private static var lime_gl_uniform2i = System.load ("lime", "lime_gl_uniform2i", 3);
	private static var lime_gl_uniform2iv = System.load ("lime", "lime_gl_uniform2iv", 2);
	private static var lime_gl_uniform3f = System.load ("lime", "lime_gl_uniform3f", 4);
	private static var lime_gl_uniform3fv = System.load ("lime", "lime_gl_uniform3fv", 2);
	private static var lime_gl_uniform3i = System.load ("lime", "lime_gl_uniform3i", 4);
	private static var lime_gl_uniform3iv = System.load ("lime", "lime_gl_uniform3iv", 2);
	private static var lime_gl_uniform4f = System.load ("lime", "lime_gl_uniform4f", 5);
	private static var lime_gl_uniform4fv = System.load ("lime", "lime_gl_uniform4fv", 2);
	private static var lime_gl_uniform4i = System.load ("lime", "lime_gl_uniform4i", 5);
	private static var lime_gl_uniform4iv = System.load ("lime", "lime_gl_uniform4iv", 2);
	private static var lime_gl_uniform_matrix = System.load ("lime", "lime_gl_uniform_matrix", 4);
	private static var lime_gl_use_program = System.load ("lime", "lime_gl_use_program", 1);
	private static var lime_gl_validate_program = System.load ("lime", "lime_gl_validate_program", 1);
	private static var lime_gl_version = System.load ("lime", "lime_gl_version", 0);
	private static var lime_gl_vertex_attrib1f = System.load ("lime", "lime_gl_vertex_attrib1f", 2);
	private static var lime_gl_vertex_attrib1fv = System.load ("lime", "lime_gl_vertex_attrib1fv", 2);
	private static var lime_gl_vertex_attrib2f = System.load ("lime", "lime_gl_vertex_attrib2f", 3);
	private static var lime_gl_vertex_attrib2fv = System.load ("lime", "lime_gl_vertex_attrib2fv", 2);
	private static var lime_gl_vertex_attrib3f = System.load ("lime", "lime_gl_vertex_attrib3f", 4);
	private static var lime_gl_vertex_attrib3fv = System.load ("lime", "lime_gl_vertex_attrib3fv", 2);
	private static var lime_gl_vertex_attrib4f = System.load ("lime", "lime_gl_vertex_attrib4f", 5);
	private static var lime_gl_vertex_attrib4fv = System.load ("lime", "lime_gl_vertex_attrib4fv", 2);
	private static var lime_gl_vertex_attrib_pointer = System.load ("lime", "lime_gl_vertex_attrib_pointer", -1);
	private static var lime_gl_viewport = System.load ("lime", "lime_gl_viewport", 4);
	
	#end
	
}