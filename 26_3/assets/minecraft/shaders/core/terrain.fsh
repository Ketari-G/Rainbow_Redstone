#version 330
#extension GL_ARB_separate_shader_objects : require

#include <minecraft:fog.glsl>
#include <minecraft:globals.glsl>
#include <minecraft:texture_sampling.glsl>
#include <minecraft:oit.glsl>
#include <minecraft:terrainglobals.glsl>
#ifndef MULTIDRAW_TERRAIN
    #include <minecraft:chunksection.glsl>
#endif

uniform sampler2D Sampler0;
#ifdef IMPROVED_FOG
uniform sampler2D SkySampler;
uniform sampler2D CloudsSampler;
uniform sampler2D CloudsDepthSampler;
#endif

layout(location = 0) in float sphericalVertexDistance;
layout(location = 1) in float cylindricalVertexDistance;
layout(location = 2) in vec4 vertexColor;
layout(location = 3) in vec2 texCoord0;
layout(location = 4) in float chunkVisibility;

#ifndef OIT_ALPHA_ONLY
layout(location = 0) out vec4 fragColor;
#endif

const float ENVIRONMENTAL_BACKGROUND_BLEND_START = 0.9;

#ifdef IMPROVED_FOG
vec3 sampleBackgroundColor(ivec2 pixelCoords) {
    vec3 skyColor = texelFetch(SkySampler, pixelCoords, 0).rgb;
    vec4 cloudColor = texelFetch(CloudsSampler, pixelCoords, 0);
    float cloudDepth = texelFetch(CloudsDepthSampler, pixelCoords, 0).r;
    float cloudsBehind = step(cloudDepth, gl_FragCoord.z);
    return mix(skyColor, cloudColor.rgb / (cloudColor.a > 0.0 ? cloudColor.a : 1.0), cloudColor.a * cloudsBehind);
}
#endif

#ifndef OIT_ALPHA_ONLY
vec4 calculateFinalColor(vec4 color) {
    float environmentalValue = linear_fog_value(sphericalVertexDistance, FogEnvironmentalStart, FogEnvironmentalEnd);
    float renderDistanceValue = linear_fog_value(cylindricalVertexDistance, FogRenderDistanceStart, FogRenderDistanceEnd);

    float environmentalBackgroundValue = smoothstep(ENVIRONMENTAL_BACKGROUND_BLEND_START, 1.0, environmentalValue);

    float fogValue = max(environmentalValue, renderDistanceValue);

    float backgroundFogValue = max(environmentalBackgroundValue, renderDistanceValue);

    if (backgroundFogValue > 0.0 || chunkVisibility < 1.0) {
        #ifdef IMPROVED_FOG
        vec3 backgroundColor = sampleBackgroundColor(ivec2(gl_FragCoord.xy));
        vec3 targetColor = mix(FogColor.rgb, backgroundColor, backgroundFogValue);
        #else
        vec3 backgroundColor = FogColor.rgb;
        vec3 targetColor = backgroundColor;
        #endif
        vec3 foggedColor = mix(color.rgb, targetColor, fogValue);
        vec3 foggedFadedColor = mix(backgroundColor, foggedColor, chunkVisibility);
        color = vec4(foggedFadedColor, color.a);
    } else {
        color.rgb = mix(color.rgb, FogColor.rgb, fogValue);
    }
    #ifdef OIT_ACCUMULATE
    color = sampleColorForAccumulation(color);
    #endif

    return color;
}
#endif

//include respackopts:config_supplier
//do not remove this comment ^

#include <default_colors.glsl> //imports default color settings variables

//26.3

void main() {
    vec2 texel = floor(texCoord0 * TextureSize) + 0.5;
    vec2 snapped = texel / TextureSize;
    vec4 texColor = textureLod(Sampler0, snapped, 0.0);

    float alpha = float(texColor.a);
    vec4 custom = texColor;
    vec4 base = vec4(1.0, 1.0, 1.0, 1.0);

    int r_opacity = 99; //sets redstone dust texture transparency value
    //make sure this is actually accurate to the true texture alpha value

    int n_opacity = 98; //sets numbers texture transparency value
    //make sure this is actually accurate to the true texture alpha value
    
    if (round(alpha * 100) == r_opacity) {
        int red = int(round(texColor.r * 255)); //gets red color value from texture

        if (red == 31 || red == 33 || red == 36) { //signal strengh 0
            custom = vec4(rainbowRedstone_rColor_ss0_r/255.0, rainbowRedstone_rColor_ss0_g/255.0, rainbowRedstone_rColor_ss0_b/255.0, 1.0);
            base.rgb = vec3(0.1406, 0.1406, 0.1406);
        }
        else if (red == 60 || red == 64 || red == 70) { //signal strengh 1
            custom = vec4(rainbowRedstone_rColor_ss1_r/255.0, rainbowRedstone_rColor_ss1_g/255.0, rainbowRedstone_rColor_ss1_b/255.0, 1.0);
            base.rgb = vec3(0.2784, 0.3098, 0.3216);
        }
        else if (red == 131 || red == 142 || red == 153) { //signal strengh 2
            custom = vec4(rainbowRedstone_rColor_ss2_r/255.0, rainbowRedstone_rColor_ss2_g/255.0, rainbowRedstone_rColor_ss2_b/255.0, 1.0);
            base.rgb = vec3(0.6118, 0.6157, 0.5922);
        }
        else if (red == 204 || red == 221 || red == 239) { //signal strengh 3
            custom = vec4(rainbowRedstone_rColor_ss3_r/255.0, rainbowRedstone_rColor_ss3_g/255.0, rainbowRedstone_rColor_ss3_b/255.0, 1.0);
            base.rgb = vec3(0.9529, 0.5490, 0.6667);
        }
        else if (red == 166 || red == 180 || red == 194) { //signal strengh 4
            custom = vec4(rainbowRedstone_rColor_ss4_r/255.0, rainbowRedstone_rColor_ss4_g/255.0, rainbowRedstone_rColor_ss4_b/255.0, 1.0);
            base.rgb = vec3(0.7765, 0.3098, 0.7412);
        }
        else if (red == 115 || red == 125 || red == 135) { //signal strengh 5
            custom = vec4(rainbowRedstone_rColor_ss5_r/255.0, rainbowRedstone_rColor_ss5_g/255.0, rainbowRedstone_rColor_ss5_b/255.0, 1.0);
            base.rgb = vec3(0.5373, 0.1961, 0.7176);
        }
        else if (red == 50 || red == 55 || red == 59) { //signal strengh 6
            custom = vec4(rainbowRedstone_rColor_ss6_r/255.0, rainbowRedstone_rColor_ss6_g/255.0, rainbowRedstone_rColor_ss6_b/255.0, 1.0);
            base.rgb = vec3(0.2353, 0.2667, 0.6627);
        }
        else if (red == 49 || red == 53 || red == 57) { //signal strengh 7
            custom = vec4(rainbowRedstone_rColor_ss7_r/255.0, rainbowRedstone_rColor_ss7_g/255.0, rainbowRedstone_rColor_ss7_b/255.0, 1.0);
            base.rgb = vec3(0.2275, 0.7020, 0.8549);
        }
        else if (red == 18 || red == 20 || red == 22) { //signal strengh 8
            custom = vec4(rainbowRedstone_rColor_ss8_r/255.0, rainbowRedstone_rColor_ss8_g/255.0, rainbowRedstone_rColor_ss8_b/255.0, 1.0);
            base.rgb = vec3(0.0863, 0.6118, 0.6157);
        }
        else if (red == 78 || red == 84 || red == 91) { //signal strengh 9
            custom = vec4(rainbowRedstone_rColor_ss9_r/255.0, rainbowRedstone_rColor_ss9_g/255.0, rainbowRedstone_rColor_ss9_b/255.0, 1.0);
            base.rgb = vec3(0.3647, 0.4863, 0.0824);
        }
        else if (red == 107 || red == 116 || red == 126) { //signal strengh 10
            custom = vec4(rainbowRedstone_rColor_ss10_r/255.0, rainbowRedstone_rColor_ss10_g/255.0, rainbowRedstone_rColor_ss10_b/255.0, 1.0);
            base.rgb = vec3(0.5020, 0.7804, 0.1216);
        }
        else if (red == 163 || red == 176 || red == 191) { //signal strengh 11
            custom = vec4(rainbowRedstone_rColor_ss11_r/255.0, rainbowRedstone_rColor_ss11_g/255.0, rainbowRedstone_rColor_ss11_b/255.0, 1.0);
            base.rgb = vec3(0.7608, 0.8353, 0.1961);
        }
        else if (red == 214 || red == 232 || red == 251) { //signal strengh 12
            custom = vec4(rainbowRedstone_rColor_ss12_r/255.0, rainbowRedstone_rColor_ss12_g/255.0, rainbowRedstone_rColor_ss12_b/255.0, 1.0);
            base.rgb = vec3(1.0000, 0.8471, 0.2392);
        }
        else if (red == 209 || red == 227 || red == 245) { //signal strengh 13
            custom = vec4(rainbowRedstone_rColor_ss13_r/255.0, rainbowRedstone_rColor_ss13_g/255.0, rainbowRedstone_rColor_ss13_b/255.0, 1.0);
            base.rgb = vec3(0.9765, 0.5020, 0.1137);
        }
        else if (red == 148 || red == 160 || red == 173) { //signal strengh 14
            custom = vec4(rainbowRedstone_rColor_ss14_r/255.0, rainbowRedstone_rColor_ss14_g/255.0, rainbowRedstone_rColor_ss14_b/255.0, 1.0);
            base.rgb = vec3(0.6902, 0.1804, 0.1490);
        }
        else if (red == 87 || red == 94 || red == 101) { //signal strengh 15
            custom = vec4(rainbowRedstone_rColor_ss15_r/255.0, rainbowRedstone_rColor_ss15_g/255.0, rainbowRedstone_rColor_ss15_b/255.0, 1.0);
            base.rgb = vec3(0.4039, 0.2235, 0.0902);
        }
    }
    else if (round(alpha * 100) == n_opacity) {
        custom = vec4(rainbowRedstone_nColor_r/255.0, rainbowRedstone_nColor_g/255.0, rainbowRedstone_nColor_b/255.0, 1.0);
    }

    vec4 color = (UseRgss == 1 ? sampleRGSS(Sampler0, texCoord0, 1.0f / TextureSize) : sampleNearest(Sampler0, texCoord0, 1.0f / TextureSize)) * vertexColor;

    if (round(alpha * 100) == r_opacity) {
        vec4 reverse = texColor / base; //gets original full bright texture + brightness diffs w/o color
        color = reverse * custom; //sets color to custom
        color.a = 1.0;
    }
    else if (round(alpha * 100) == n_opacity) {
        color = custom;
    }

    #ifdef ALPHA_CUTOUT
    if (color.a < ALPHA_CUTOUT) {
        discard;
    }
    #endif

    #ifdef OIT_ALPHA_ONLY
    executeAlphaOnlyPhase(gl_FragCoord.z, color.a);
    #else
    fragColor = calculateFinalColor(color);
    #endif
}