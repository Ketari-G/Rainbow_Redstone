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

#moj_import "default_colors.glsl" //imports default color settings variables

void main() {
    vec4 texColor = texture(Sampler0, texCoord0);
    float alpha = float(texColor.a);
    vec4 custom = ColorModulator;
    vec4 base = vec4(1.0, 1.0, 1.0, 1.0);

    if (alpha >= 0.595 && alpha <= 0.605) {
        custom = vec4(rainbowRedstone_color_ss0_r/255.0, rainbowRedstone_color_ss0_g/255.0, rainbowRedstone_color_ss0_b/255.0, 1.0); //ss 0
        base.rgb = vec3(0.0, 0.0, 0.0);
    }
    else if (alpha >= 0.605 && alpha <= 0.615) {
        custom = vec4(rainbowRedstone_color_ss1_r/255.0, rainbowRedstone_color_ss1_g/255.0, rainbowRedstone_color_ss1_b/255.0, 1.0); //ss 1
        base.rgb = vec3(0.2784, 0.3098, 0.3216);
    }
    else if (alpha >= 0.615 && alpha <= 0.625) {
        custom = vec4(rainbowRedstone_color_ss2_r/255.0, rainbowRedstone_color_ss2_g/255.0, rainbowRedstone_color_ss2_b/255.0, 1.0); //ss 2
        base.rgb = vec3(0.6118, 0.6157, 0.5922);
    }
    else if (alpha >= 0.625 && alpha <= 0.635) {
        custom = vec4(rainbowRedstone_color_ss3_r/255.0, rainbowRedstone_color_ss3_g/255.0, rainbowRedstone_color_ss3_b/255.0, 1.0); //ss 3
        base.rgb = vec3(0.9529, 0.5490, 0.6667);
    }
    else if (alpha >= 0.635 && alpha <= 0.645) {
        custom = vec4(rainbowRedstone_color_ss4_r/255.0, rainbowRedstone_color_ss4_g/255.0, rainbowRedstone_color_ss4_b/255.0, 1.0); //ss 4
        base.rgb = vec3(0.7765, 0.3098, 0.7412);
    }
    else if (alpha >= 0.645 && alpha <= 0.655) {
        custom = vec4(rainbowRedstone_color_ss5_r/255.0, rainbowRedstone_color_ss5_g/255.0, rainbowRedstone_color_ss5_b/255.0, 1.0); //ss 5
        base.rgb = vec3(0.5373, 0.1961, 0.7176);
    }
    else if (alpha >= 0.655 && alpha <= 0.665) {
        custom = vec4(rainbowRedstone_color_ss6_r/255.0, rainbowRedstone_color_ss6_g/255.0, rainbowRedstone_color_ss6_b/255.0, 1.0); //ss 6
        base.rgb = vec3(0.2353, 0.2667, 0.6627);
    }
    else if (alpha >= 0.665 && alpha <= 0.675) {
        custom = vec4(rainbowRedstone_color_ss7_r/255.0, rainbowRedstone_color_ss7_g/255.0, rainbowRedstone_color_ss7_b/255.0, 1.0); //ss 7
        base.rgb = vec3(0.2275, 0.7020, 0.8549);
    }
    else if (alpha >= 0.675 && alpha <= 0.685) {
        custom = vec4(rainbowRedstone_color_ss8_r/255.0, rainbowRedstone_color_ss8_g/255.0, rainbowRedstone_color_ss8_b/255.0, 1.0); //ss 8
        base.rgb = vec3(0.0863, 0.6118, 0.6157);
    }
    else if (alpha >= 0.685 && alpha <= 0.695) {
        custom = vec4(rainbowRedstone_color_ss9_r/255.0, rainbowRedstone_color_ss9_g/255.0, rainbowRedstone_color_ss9_b/255.0, 1.0); //ss 9
        base.rgb = vec3(0.3647, 0.4863, 0.0824);
    }
    else if (alpha >= 0.695 && alpha <= 0.705) {
        custom = vec4(rainbowRedstone_color_ss10_r/255.0, rainbowRedstone_color_ss10_g/255.0, rainbowRedstone_color_ss10_b/255.0, 1.0); //ss 10
        base.rgb = vec3(0.5020, 0.7804, 0.1216);
    }
    else if (alpha >= 0.705 && alpha <= 0.715) {
        custom = vec4(rainbowRedstone_color_ss11_r/255.0, rainbowRedstone_color_ss11_g/255.0, rainbowRedstone_color_ss11_b/255.0, 1.0); //ss 11
        base.rgb = vec3(0.7608, 0.8353, 0.1961);
    }
    else if (alpha >= 0.715 && alpha <= 0.725) {
        custom = vec4(rainbowRedstone_color_ss12_r/255.0, rainbowRedstone_color_ss12_g/255.0, rainbowRedstone_color_ss12_b/255.0, 1.0); //ss 12
        base.rgb = vec3(1.0000, 0.8471, 0.2392);
    }
    else if (alpha >= 0.725 && alpha <= 0.735) {
        custom = vec4(rainbowRedstone_color_ss13_r/255.0, rainbowRedstone_color_ss13_g/255.0, rainbowRedstone_color_ss13_b/255.0, 1.0); //ss 13
        base.rgb = vec3(0.9765, 0.5020, 0.1137);
    }
    else if (alpha >= 0.735 && alpha <= 0.745) {
        custom = vec4(rainbowRedstone_color_ss14_r/255.0, rainbowRedstone_color_ss14_g/255.0, rainbowRedstone_color_ss14_b/255.0, 1.0); //ss 14
        base.rgb = vec3(0.6902, 0.1804, 0.1490);
    }
    else if (alpha >= 0.745 && alpha <= 0.755) {
        custom = vec4(rainbowRedstone_color_ss15_r/255.0, rainbowRedstone_color_ss15_g/255.0, rainbowRedstone_color_ss15_b/255.0, 1.0); //ss 15
        base.rgb = vec3(0.4039, 0.2235, 0.0902);
    }
    
    vec4 color = texColor * vertexColor * custom;

    if (alpha >= 0.605 && alpha <= 0.755) {
        vec4 reverse = texColor / base; //gets original full bright texture + brightness diffs w/o color
        color = reverse * custom; //sets color to custom in accordance with
    }
    else if (alpha >= 0.595 && alpha <= 0.605) {
        color = custom; 
        //handles 0, but a lil stupidly cuz it won't have texture, just color. 
        //no way to fix <1.20.2 or w/o rpo mod, unless I remove 1.13-1.16 compat feature entirely
    }

    if (color.a < 0.1) { 
        discard;
    }
    
    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}
