#version 150

#moj_import <fog.glsl>

uniform sampler2D Sampler0;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

in float vertexDistance;
in vec4 vertexColor;
in vec2 texCoord0;

out vec4 fragColor;

void main() {
    vec4 texColor = texture(Sampler0, texCoord0);
    float alpha = float(texColor.a);
    vec4 custom = ColorModulator;
    
    if (alpha >= 0.595 && alpha <= 0.605) {
        custom = vec4(0.0, 0.0, 0.0, 1.0); //ss 0
    }
    if (alpha >= 0.605 && alpha <= 0.615) {
        custom = vec4(0.2784, 0.3098, 0.3216, 1.0); //ss 1
    }
    if (alpha >= 0.615 && alpha <= 0.625) {
        custom = vec4(0.6118, 0.6157, 0.5922, 1.0); //ss 2
    }
    if (alpha >= 0.625 && alpha <= 0.635) {
        custom = vec4(0.9529, 0.5490, 0.6667, 1.0); //ss 3
    }
    if (alpha >= 0.635 && alpha <= 0.645) {
        custom = vec4(0.7765, 0.3098, 0.7412, 1.0); //ss 4
    }
    if (alpha >= 0.645 && alpha <= 0.655) {
        custom = vec4(0.5373, 0.1961, 0.7176, 1.0); //ss 5
    }
    if (alpha >= 0.655 && alpha <= 0.665) {
        custom = vec4(0.2353, 0.2667, 0.6627, 1.0); //ss 6
    }
    if (alpha >= 0.665 && alpha <= 0.675) {
        custom = vec4(0.2275, 0.7020, 0.8549, 1.0); //ss 7
    }
    if (alpha >= 0.675 && alpha <= 0.685) {
        custom = vec4(0.0863, 0.6118, 0.6157, 1.0); //ss 8
    }
    if (alpha >= 0.685 && alpha <= 0.695) {
        custom = vec4(0.3647, 0.4863, 0.0824, 1.0); //ss 9
    }
    if (alpha >= 0.695 && alpha <= 0.705) {
        custom = vec4(0.5020, 0.7804, 0.1216, 1.0); //ss 10
    }
    if (alpha >= 0.705 && alpha <= 0.715) {
        custom = vec4(0.7608, 0.8353, 0.1961, 1.0); //ss 11
    }
    if (alpha >= 0.715 && alpha <= 0.725) {
        custom = vec4(1.0000, 0.8471, 0.2392, 1.0); //ss 12
    }
    if (alpha >= 0.725 && alpha <= 0.735) {
        custom = vec4(0.9765, 0.5020, 0.1137, 1.0); //ss 13
    }
    if (alpha >= 0.735 && alpha <= 0.745) {
        custom = vec4(0.6902, 0.1804, 0.1490, 1.0); //ss 14
    }
    if (alpha >= 0.745 && alpha <= 0.755) {
        custom = vec4(0.4039, 0.2235, 0.0902, 1.0); //ss 15
    }
    
    vec4 color = texColor * vertexColor * custom;
    if (color.a < 0.1) { 
        discard;
    }
    
    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}
