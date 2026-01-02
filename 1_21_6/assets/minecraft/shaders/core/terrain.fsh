#version 150

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>

uniform sampler2D Sampler0;

in float sphericalVertexDistance;
in float cylindricalVertexDistance;
in vec4 vertexColor;
in vec2 texCoord0;

out vec4 fragColor;

//include respackopts:config_supplier
//do not remove this comment ^

#moj_import "default_colors.glsl" //imports default color settings variables

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
    
    vec4 color = texture(Sampler0, texCoord0) * vertexColor * custom;
    
#ifdef ALPHA_CUTOUT
    if (color.a < ALPHA_CUTOUT) {
        discard;
    }
#endif
    
    fragColor = apply_fog(color, sphericalVertexDistance, cylindricalVertexDistance, FogEnvironmentalStart, FogEnvironmentalEnd, FogRenderDistanceStart, FogRenderDistanceEnd, FogColor);
}