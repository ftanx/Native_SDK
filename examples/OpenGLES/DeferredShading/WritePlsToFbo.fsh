#version 310 es
#extension GL_EXT_shader_pixel_local_storage2 : enable

#ifndef GL_EXT_shader_pixel_local_storage2
#extension GL_EXT_shader_pixel_local_storage : require
#endif

layout(rgba8)  __pixel_localEXT FragDataLocal {
	layout(rgba8) highp vec4 albedo;
	layout(rgb10_a2) highp vec4 normal;
	layout(r32f) highp float depth;
	layout(rgba8) highp vec4 color;
} pls;

#ifndef GL_EXT_shader_pixel_local_storage2
layout(location = 0) out lowp vec4 oColorFbo;
#else
layout(location = 0, rgba8) out lowp vec4 oColorFbo;
#endif

void main()
{
	oColorFbo = vec4(pls.color.rgb, 1.0);
}
