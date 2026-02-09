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
//do not remove this comment ^

#moj_import "default_colors.glsl" //imports default color settings variables

//1.20.2

void main() {
    vec4 texColor = texture(Sampler0, texCoord0);
    float alpha = float(texColor.a);
    vec4 custom = ColorModulator;
    
    float alpha_start = 0.7; //sets texture transparency start value
    //make sure this is actually accurate to the true texture alpha value

    int power = int(round((alpha - alpha_start) * 100.0)); //gets int of every signal strengh

    if (power == 0) {
        custom = vec4(rainbowRedstone_color_ss0_r/255.0, rainbowRedstone_color_ss0_g/255.0, rainbowRedstone_color_ss0_b/255.0, 1.0);
    }
    else if (power == 1) {
        custom = vec4(rainbowRedstone_color_ss1_r/255.0, rainbowRedstone_color_ss1_g/255.0, rainbowRedstone_color_ss1_b/255.0, 1.0);
    }
    else if (power == 2) {
        custom = vec4(rainbowRedstone_color_ss2_r/255.0, rainbowRedstone_color_ss2_g/255.0, rainbowRedstone_color_ss2_b/255.0, 1.0);
    }
    else if (power == 3) {
        custom = vec4(rainbowRedstone_color_ss3_r/255.0, rainbowRedstone_color_ss3_g/255.0, rainbowRedstone_color_ss3_b/255.0, 1.0);
    }
    else if (power == 4) {
        custom = vec4(rainbowRedstone_color_ss4_r/255.0, rainbowRedstone_color_ss4_g/255.0, rainbowRedstone_color_ss4_b/255.0, 1.0);
    }
    else if (power == 5) {
        custom = vec4(rainbowRedstone_color_ss5_r/255.0, rainbowRedstone_color_ss5_g/255.0, rainbowRedstone_color_ss5_b/255.0, 1.0);
    }
    else if (power == 6) {
        custom = vec4(rainbowRedstone_color_ss6_r/255.0, rainbowRedstone_color_ss6_g/255.0, rainbowRedstone_color_ss6_b/255.0, 1.0);
    }
    else if (power == 7) {
        custom = vec4(rainbowRedstone_color_ss7_r/255.0, rainbowRedstone_color_ss7_g/255.0, rainbowRedstone_color_ss7_b/255.0, 1.0);
    }
    else if (power == 8) {
        custom = vec4(rainbowRedstone_color_ss8_r/255.0, rainbowRedstone_color_ss8_g/255.0, rainbowRedstone_color_ss8_b/255.0, 1.0);
    }
    else if (power == 9) {
        custom = vec4(rainbowRedstone_color_ss9_r/255.0, rainbowRedstone_color_ss9_g/255.0, rainbowRedstone_color_ss9_b/255.0, 1.0);
    }
    else if (power == 10) {
        custom = vec4(rainbowRedstone_color_ss10_r/255.0, rainbowRedstone_color_ss10_g/255.0, rainbowRedstone_color_ss10_b/255.0, 1.0);
    }
    else if (power == 11) {
        custom = vec4(rainbowRedstone_color_ss11_r/255.0, rainbowRedstone_color_ss11_g/255.0, rainbowRedstone_color_ss11_b/255.0, 1.0);
    }
    else if (power == 12) {
        custom = vec4(rainbowRedstone_color_ss12_r/255.0, rainbowRedstone_color_ss12_g/255.0, rainbowRedstone_color_ss12_b/255.0, 1.0);
    }
    else if (power == 13) {
        custom = vec4(rainbowRedstone_color_ss13_r/255.0, rainbowRedstone_color_ss13_g/255.0, rainbowRedstone_color_ss13_b/255.0, 1.0);
    }
    else if (power == 14) {
        custom = vec4(rainbowRedstone_color_ss14_r/255.0, rainbowRedstone_color_ss14_g/255.0, rainbowRedstone_color_ss14_b/255.0, 1.0);
    }
    else if (power == 15) {
        custom = vec4(rainbowRedstone_color_ss15_r/255.0, rainbowRedstone_color_ss15_g/255.0, rainbowRedstone_color_ss15_b/255.0, 1.0);
    }

    vec4 color = texColor * vertexColor * custom;
    if (color.a < 0.1) { 
        discard;
    }
    
    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}
