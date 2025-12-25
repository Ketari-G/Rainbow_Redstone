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

//include respackopts:config_supplier
//do not remove this comment, ever ^

//below are the DEFAULT values, meaning vanilla will use these if respackopts isn't loaded
//it is not recommended to change these as you will lose the original color values per signal strengh

#ifndef respackopts_loaded
    //signal strengh 0
    #define rainbowRedstone_color_ss0_r 0 //red
    #define rainbowRedstone_color_ss0_g 0 //green
    #define rainbowRedstone_color_ss0_b 0 //blue
    //signal strengh 1
    #define rainbowRedstone_color_ss1_r 71 //red
    #define rainbowRedstone_color_ss1_g 79 //green
    #define rainbowRedstone_color_ss1_b 82 //blue
    //signal strengh 2
    #define rainbowRedstone_color_ss2_r 156 //red
    #define rainbowRedstone_color_ss2_g 157 //green
    #define rainbowRedstone_color_ss2_b 151 //blue
    //signal strengh 3
    #define rainbowRedstone_color_ss3_r 243 //red
    #define rainbowRedstone_color_ss3_g 140 //green
    #define rainbowRedstone_color_ss3_b 170 //blue
    //signal strengh 4
    #define rainbowRedstone_color_ss4_r 198 //red
    #define rainbowRedstone_color_ss4_g 79 //green
    #define rainbowRedstone_color_ss4_b 189 //blue
    //signal strengh 5
    #define rainbowRedstone_color_ss5_r 137 //red
    #define rainbowRedstone_color_ss5_g 50 //green
    #define rainbowRedstone_color_ss5_b 183 //blue
    //signal strengh 6
    #define rainbowRedstone_color_ss6_r 60 //red
    #define rainbowRedstone_color_ss6_g 68 //green
    #define rainbowRedstone_color_ss6_b 169 //blue
    //signal strengh 7
    #define rainbowRedstone_color_ss7_r 58 //red
    #define rainbowRedstone_color_ss7_g 179 //green
    #define rainbowRedstone_color_ss7_b 218 //blue
    //signal strengh 8
    #define rainbowRedstone_color_ss8_r 22 //red
    #define rainbowRedstone_color_ss8_g 156 //green
    #define rainbowRedstone_color_ss8_b 157 //blue
    //signal strengh 9
    #define rainbowRedstone_color_ss9_r 93 //red
    #define rainbowRedstone_color_ss9_g 124 //green
    #define rainbowRedstone_color_ss9_b 21 //blue
    //signal strengh 10
    #define rainbowRedstone_color_ss10_r 128 //red
    #define rainbowRedstone_color_ss10_g 199 //green
    #define rainbowRedstone_color_ss10_b 31 //blue
    //signal strengh 11
    #define rainbowRedstone_color_ss11_r 194 //red
    #define rainbowRedstone_color_ss11_g 213 //green
    #define rainbowRedstone_color_ss11_b 50 //blue
    //signal strengh 12
    #define rainbowRedstone_color_ss12_r 255 //red
    #define rainbowRedstone_color_ss12_g 216 //green
    #define rainbowRedstone_color_ss12_b 61 //blue
    //signal strengh 13
    #define rainbowRedstone_color_ss13_r 249 //red
    #define rainbowRedstone_color_ss13_g 128 //green
    #define rainbowRedstone_color_ss13_b 29 //blue
    //signal strengh 14
    #define rainbowRedstone_color_ss14_r 176 //red
    #define rainbowRedstone_color_ss14_g 46 //green
    #define rainbowRedstone_color_ss14_b 38 //blue
    //signal strengh 15
    #define rainbowRedstone_color_ss15_r 103 //red
    #define rainbowRedstone_color_ss15_g 57 //green
    #define rainbowRedstone_color_ss15_b 23 //blue
#endif

void main() {
    vec4 texColor = texture(Sampler0, texCoord0);
    float alpha = float(texColor.a);
    vec4 custom = ColorModulator;
    
    if (alpha >= 0.595 && alpha <= 0.605) {
        custom = vec4(rainbowRedstone_color_ss0_r/255.0, rainbowRedstone_color_ss0_g/255.0, rainbowRedstone_color_ss0_b/255.0, 1.0); //ss 0
    }
    else if (alpha >= 0.605 && alpha <= 0.615) {
        custom = vec4(rainbowRedstone_color_ss1_r/255.0, rainbowRedstone_color_ss1_g/255.0, rainbowRedstone_color_ss1_b/255.0, 1.0); //ss 1
    }
    else if (alpha >= 0.615 && alpha <= 0.625) {
        custom = vec4(rainbowRedstone_color_ss2_r/255.0, rainbowRedstone_color_ss2_g/255.0, rainbowRedstone_color_ss2_b/255.0, 1.0); //ss 2
    }
    else if (alpha >= 0.625 && alpha <= 0.635) {
        custom = vec4(rainbowRedstone_color_ss3_r/255.0, rainbowRedstone_color_ss3_g/255.0, rainbowRedstone_color_ss3_b/255.0, 1.0); //ss 3
    }
    else if (alpha >= 0.635 && alpha <= 0.645) {
        custom = vec4(rainbowRedstone_color_ss4_r/255.0, rainbowRedstone_color_ss4_g/255.0, rainbowRedstone_color_ss4_b/255.0, 1.0); //ss 4
    }
    else if (alpha >= 0.645 && alpha <= 0.655) {
        custom = vec4(rainbowRedstone_color_ss5_r/255.0, rainbowRedstone_color_ss5_g/255.0, rainbowRedstone_color_ss5_b/255.0, 1.0); //ss 5
    }
    else if (alpha >= 0.655 && alpha <= 0.665) {
        custom = vec4(rainbowRedstone_color_ss6_r/255.0, rainbowRedstone_color_ss6_g/255.0, rainbowRedstone_color_ss6_b/255.0, 1.0); //ss 6
    }
    else if (alpha >= 0.665 && alpha <= 0.675) {
        custom = vec4(rainbowRedstone_color_ss7_r/255.0, rainbowRedstone_color_ss7_g/255.0, rainbowRedstone_color_ss7_b/255.0, 1.0); //ss 7
    }
    else if (alpha >= 0.675 && alpha <= 0.685) {
        custom = vec4(rainbowRedstone_color_ss8_r/255.0, rainbowRedstone_color_ss8_g/255.0, rainbowRedstone_color_ss8_b/255.0, 1.0); //ss 8
    }
    else if (alpha >= 0.685 && alpha <= 0.695) {
        custom = vec4(rainbowRedstone_color_ss9_r/255.0, rainbowRedstone_color_ss9_g/255.0, rainbowRedstone_color_ss9_b/255.0, 1.0); //ss 9
    }
    else if (alpha >= 0.695 && alpha <= 0.705) {
        custom = vec4(rainbowRedstone_color_ss10_r/255.0, rainbowRedstone_color_ss10_g/255.0, rainbowRedstone_color_ss10_b/255.0, 1.0); //ss 10
    }
    else if (alpha >= 0.705 && alpha <= 0.715) {
        custom = vec4(rainbowRedstone_color_ss11_r/255.0, rainbowRedstone_color_ss11_g/255.0, rainbowRedstone_color_ss11_b/255.0, 1.0); //ss 11
    }
    else if (alpha >= 0.715 && alpha <= 0.725) {
        custom = vec4(rainbowRedstone_color_ss12_r/255.0, rainbowRedstone_color_ss12_g/255.0, rainbowRedstone_color_ss12_b/255.0, 1.0); //ss 12
    }
    else if (alpha >= 0.725 && alpha <= 0.735) {
        custom = vec4(rainbowRedstone_color_ss13_r/255.0, rainbowRedstone_color_ss13_g/255.0, rainbowRedstone_color_ss13_b/255.0, 1.0); //ss 13
    }
    else if (alpha >= 0.735 && alpha <= 0.745) {
        custom = vec4(rainbowRedstone_color_ss14_r/255.0, rainbowRedstone_color_ss14_g/255.0, rainbowRedstone_color_ss14_b/255.0, 1.0); //ss 14
    }
    else if (alpha >= 0.745 && alpha <= 0.755) {
        custom = vec4(rainbowRedstone_color_ss15_r/255.0, rainbowRedstone_color_ss15_g/255.0, rainbowRedstone_color_ss15_b/255.0, 1.0); //ss 15
    }
    
    vec4 color = texColor * vertexColor * custom;
    if (color.a < 0.1) { 
        discard;
    }
    
    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}
