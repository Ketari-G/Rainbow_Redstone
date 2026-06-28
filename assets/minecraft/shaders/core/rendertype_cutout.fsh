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

//technically, there should be a rpo config include line here, however it has been removed on purpose
//if not removed, it breaks color customization in versions 1.17 - 1.19.4 due to rpo not having folders / them not working

#moj_import "default_colors.glsl" //imports default color settings variables

//1.17 - 1.20.1

void main() {
    vec4 texColor = texture(Sampler0, texCoord0);
    float alpha = float(texColor.a);
    vec4 custom = ColorModulator;
    vec4 base = vec4(1.0, 1.0, 1.0, 1.0);

    int opacity = 99; //sets redstone dust texture transparency value
    //make sure this is actually accurate to the true texture alpha value

    int red = int(round(texColor.r * 100)); //gets red color value from texture
    
    if (round(alpha * 100) == opacity) {
        if (red == 12 || red == 13 || red == 14) { //signal strengh 0
            custom = vec4(rainbowRedstone_color_ss0_r/255.0, rainbowRedstone_color_ss0_g/255.0, rainbowRedstone_color_ss0_b/255.0, 1.0);
            base.rgb = vec3(0.1406, 0.1406, 0.1406);
        }
        else if (red == 12 || red == 13 || red == 14) { //signal strengh 1
            custom = vec4(rainbowRedstone_color_ss1_r/255.0, rainbowRedstone_color_ss1_g/255.0, rainbowRedstone_color_ss1_b/255.0, 1.0);
            base.rgb = vec3(0.2784, 0.3098, 0.3216);
        }
        else if (red == 12 || red == 13 || red == 14) { //signal strengh 2
            custom = vec4(rainbowRedstone_color_ss2_r/255.0, rainbowRedstone_color_ss2_g/255.0, rainbowRedstone_color_ss2_b/255.0, 1.0);
            base.rgb = vec3(0.6118, 0.6157, 0.5922);
        }
        else if (red == 12 || red == 13 || red == 14) { //signal strengh 3
            custom = vec4(rainbowRedstone_color_ss3_r/255.0, rainbowRedstone_color_ss3_g/255.0, rainbowRedstone_color_ss3_b/255.0, 1.0);
            base.rgb = vec3(0.9529, 0.5490, 0.6667);
        }
        else if (red == 12 || red == 13 || red == 14) { //signal strengh 4
            custom = vec4(rainbowRedstone_color_ss4_r/255.0, rainbowRedstone_color_ss4_g/255.0, rainbowRedstone_color_ss4_b/255.0, 1.0);
            base.rgb = vec3(0.7765, 0.3098, 0.7412);
        }
        else if (red == 12 || red == 13 || red == 14) { //signal strengh 5
            custom = vec4(rainbowRedstone_color_ss5_r/255.0, rainbowRedstone_color_ss5_g/255.0, rainbowRedstone_color_ss5_b/255.0, 1.0);
            base.rgb = vec3(0.5373, 0.1961, 0.7176);
        }
        else if (red == 12 || red == 13 || red == 14) { //signal strengh 6
            custom = vec4(rainbowRedstone_color_ss6_r/255.0, rainbowRedstone_color_ss6_g/255.0, rainbowRedstone_color_ss6_b/255.0, 1.0);
            base.rgb = vec3(0.2353, 0.2667, 0.6627);
        }
        else if (red == 12 || red == 13 || red == 14) { //signal strengh 7
            custom = vec4(rainbowRedstone_color_ss7_r/255.0, rainbowRedstone_color_ss7_g/255.0, rainbowRedstone_color_ss7_b/255.0, 1.0);
            base.rgb = vec3(0.2275, 0.7020, 0.8549);
        }
        else if (red == 12 || red == 13 || red == 14) { //signal strengh 8
            custom = vec4(rainbowRedstone_color_ss8_r/255.0, rainbowRedstone_color_ss8_g/255.0, rainbowRedstone_color_ss8_b/255.0, 1.0);
            base.rgb = vec3(0.0863, 0.6118, 0.6157);
        }
        else if (red == 12 || red == 13 || red == 14) { //signal strengh 9
            custom = vec4(rainbowRedstone_color_ss9_r/255.0, rainbowRedstone_color_ss9_g/255.0, rainbowRedstone_color_ss9_b/255.0, 1.0);
            base.rgb = vec3(0.3647, 0.4863, 0.0824);
        }
        else if (red == 12 || red == 13 || red == 14) { //signal strengh 10
            custom = vec4(rainbowRedstone_color_ss10_r/255.0, rainbowRedstone_color_ss10_g/255.0, rainbowRedstone_color_ss10_b/255.0, 1.0);
            base.rgb = vec3(0.5020, 0.7804, 0.1216);
        }
        else if (red == 12 || red == 13 || red == 14) { //signal strengh 11
            custom = vec4(rainbowRedstone_color_ss11_r/255.0, rainbowRedstone_color_ss11_g/255.0, rainbowRedstone_color_ss11_b/255.0, 1.0);
            base.rgb = vec3(0.7608, 0.8353, 0.1961);
        }
        else if (red == 12 || red == 13 || red == 14) { //signal strengh 12
            custom = vec4(rainbowRedstone_color_ss12_r/255.0, rainbowRedstone_color_ss12_g/255.0, rainbowRedstone_color_ss12_b/255.0, 1.0);
            base.rgb = vec3(1.0000, 0.8471, 0.2392);
        }
        else if (red == 12 || red == 13 || red == 14) { //signal strengh 13
            custom = vec4(rainbowRedstone_color_ss13_r/255.0, rainbowRedstone_color_ss13_g/255.0, rainbowRedstone_color_ss13_b/255.0, 1.0);
            base.rgb = vec3(0.9765, 0.5020, 0.1137);
        }
        else if (red == 12 || red == 13 || red == 14) { //signal strengh 14
            custom = vec4(rainbowRedstone_color_ss14_r/255.0, rainbowRedstone_color_ss14_g/255.0, rainbowRedstone_color_ss14_b/255.0, 1.0);
            base.rgb = vec3(0.6902, 0.1804, 0.1490);
        }
        else if (red == 12 || red == 13 || red == 14) { //signal strengh 15
            custom = vec4(rainbowRedstone_color_ss15_r/255.0, rainbowRedstone_color_ss15_g/255.0, rainbowRedstone_color_ss15_b/255.0, 1.0);
            base.rgb = vec3(0.4039, 0.2235, 0.0902);
        }
    }
    
    vec4 color = texColor * vertexColor * custom;

    if (round(alpha * 100) == opacity) {
        vec4 reverse = texColor / base; //gets original full bright texture + brightness diffs w/o color
        color = reverse * custom; //sets color to custom
    }

    if (color.a < 0.1) { 
        discard;
    }
    
    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}
