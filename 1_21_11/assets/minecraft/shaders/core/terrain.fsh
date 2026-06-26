#version 330

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:globals.glsl>
#moj_import <minecraft:chunksection.glsl>

uniform sampler2D Sampler0;

in float sphericalVertexDistance;
in float cylindricalVertexDistance;
in vec4 vertexColor;
in vec2 texCoord0;

out vec4 fragColor;

vec4 sampleNearest(sampler2D sampler, vec2 uv, vec2 pixelSize, vec2 du, vec2 dv, vec2 texelScreenSize) {
    // Convert our UV back up to texel coordinates and find out how far over we are from the center of each pixel
    vec2 uvTexelCoords = uv / pixelSize;
    vec2 texelCenter = round(uvTexelCoords) - 0.5f;
    vec2 texelOffset = uvTexelCoords - texelCenter;

    // Move our offset closer to the texel center based on texel size on screen
    texelOffset = (texelOffset - 0.5f) * pixelSize / texelScreenSize + 0.5f;
    texelOffset = clamp(texelOffset, 0.0f, 1.0f);

    uv = (texelCenter + texelOffset) * pixelSize;
    return textureGrad(sampler, uv, du, dv);
}

vec4 sampleNearest(sampler2D source, vec2 uv, vec2 pixelSize) {
    vec2 du = dFdx(uv);
    vec2 dv = dFdy(uv);
    vec2 texelScreenSize = sqrt(du * du + dv * dv);
    return sampleNearest(source, uv, pixelSize, du, dv, texelScreenSize);
}

// Rotated Grid Super-Sampling
vec4 sampleRGSS(sampler2D source, vec2 uv, vec2 pixelSize) {
    vec2 du = dFdx(uv);
    vec2 dv = dFdy(uv);

    vec2 texelScreenSize = sqrt(du * du + dv * dv);
    float maxTexelSize = max(texelScreenSize.x, texelScreenSize.y);

    float minPixelSize = min(pixelSize.x, pixelSize.y);

    float transitionStart = minPixelSize * 1.0;
    float transitionEnd = minPixelSize * 2.0;
    float blendFactor = smoothstep(transitionStart, transitionEnd, maxTexelSize);

    float duLength = length(du);
    float dvLength = length(dv);
    float minDerivative = min(duLength, dvLength);
    float maxDerivative = max(duLength, dvLength);

    float effectiveDerivative = sqrt(minDerivative * maxDerivative);

    float mipLevelExact = max(0.0, log2(effectiveDerivative / minPixelSize));

    float mipLevelLow = floor(mipLevelExact);
    float mipLevelHigh = mipLevelLow + 1.0;
    float mipBlend = fract(mipLevelExact);

    const vec2 offsets[4] = vec2[](
    vec2(0.125, 0.375),
    vec2(-0.125, -0.375),
    vec2(0.375, -0.125),
    vec2(-0.375, 0.125)
    );

    vec4 rgssColorLow = vec4(0.0);
    vec4 rgssColorHigh = vec4(0.0);
    for (int i = 0; i < 4; ++i) {
        vec2 sampleUV = uv + offsets[i] * pixelSize;
        rgssColorLow += textureLod(source, sampleUV, mipLevelLow);
        rgssColorHigh += textureLod(source, sampleUV, mipLevelHigh);
    }
    rgssColorLow *= 0.25;
    rgssColorHigh *= 0.25;

    vec4 rgssColor = mix(rgssColorLow, rgssColorHigh, mipBlend);

    vec4 nearestColor = sampleNearest(source, uv, pixelSize, du, dv, texelScreenSize);

    return mix(nearestColor, rgssColor, blendFactor);
}

//include respackopts:config_supplier
//do not remove this comment ^

#moj_import "default_colors.glsl" //imports default color settings variables

//1.21.11

void main() {
    vec2 texel = floor(texCoord0 * TextureSize) + 0.5;
    vec2 snapped = texel / TextureSize;
    vec4 texColor = textureLod(Sampler0, snapped, 0.0);

    float alpha = float(texColor.a);
    vec4 custom = texColor;
    vec4 base = vec4(1.0, 1.0, 1.0, 1.0);

    float alpha_start = 0.7; //sets texture transparency start value
    //make sure this is actually accurate to the true texture alpha value

    int power = int(round((alpha - alpha_start) * 100.0)); //gets int of every signal strengh

    if (power == 0) {
        custom = vec4(rainbowRedstone_color_ss0_r/255.0, rainbowRedstone_color_ss0_g/255.0, rainbowRedstone_color_ss0_b/255.0, 1.0);
        base.rgb = vec3(0.1406, 0.1406, 0.1406);
    }
    else if (power == 1) {
        custom = vec4(rainbowRedstone_color_ss1_r/255.0, rainbowRedstone_color_ss1_g/255.0, rainbowRedstone_color_ss1_b/255.0, 1.0);
        base.rgb = vec3(0.2784, 0.3098, 0.3216);
    }
    else if (power == 2) {
        custom = vec4(rainbowRedstone_color_ss2_r/255.0, rainbowRedstone_color_ss2_g/255.0, rainbowRedstone_color_ss2_b/255.0, 1.0);
        base.rgb = vec3(0.6118, 0.6157, 0.5922);
    }
    else if (power == 3) {
        custom = vec4(rainbowRedstone_color_ss3_r/255.0, rainbowRedstone_color_ss3_g/255.0, rainbowRedstone_color_ss3_b/255.0, 1.0);
        base.rgb = vec3(0.9529, 0.5490, 0.6667);
    }
    else if (power == 4) {
        custom = vec4(rainbowRedstone_color_ss4_r/255.0, rainbowRedstone_color_ss4_g/255.0, rainbowRedstone_color_ss4_b/255.0, 1.0);
        base.rgb = vec3(0.7765, 0.3098, 0.7412);
    }
    else if (power == 5) {
        custom = vec4(rainbowRedstone_color_ss5_r/255.0, rainbowRedstone_color_ss5_g/255.0, rainbowRedstone_color_ss5_b/255.0, 1.0);
        base.rgb = vec3(0.5373, 0.1961, 0.7176);
    }
    else if (power == 6) {
        custom = vec4(rainbowRedstone_color_ss6_r/255.0, rainbowRedstone_color_ss6_g/255.0, rainbowRedstone_color_ss6_b/255.0, 1.0);
        base.rgb = vec3(0.2353, 0.2667, 0.6627);
    }
    else if (power == 7) {
        custom = vec4(rainbowRedstone_color_ss7_r/255.0, rainbowRedstone_color_ss7_g/255.0, rainbowRedstone_color_ss7_b/255.0, 1.0);
        base.rgb = vec3(0.2275, 0.7020, 0.8549);
    }
    else if (power == 8) {
        custom = vec4(rainbowRedstone_color_ss8_r/255.0, rainbowRedstone_color_ss8_g/255.0, rainbowRedstone_color_ss8_b/255.0, 1.0);
        base.rgb = vec3(0.0863, 0.6118, 0.6157);
    }
    else if (power == 9) {
        custom = vec4(rainbowRedstone_color_ss9_r/255.0, rainbowRedstone_color_ss9_g/255.0, rainbowRedstone_color_ss9_b/255.0, 1.0);
        base.rgb = vec3(0.3647, 0.4863, 0.0824);
    }
    else if (power == 10) {
        custom = vec4(rainbowRedstone_color_ss10_r/255.0, rainbowRedstone_color_ss10_g/255.0, rainbowRedstone_color_ss10_b/255.0, 1.0);
        base.rgb = vec3(0.5020, 0.7804, 0.1216);
    }
    else if (power == 11) {
        custom = vec4(rainbowRedstone_color_ss11_r/255.0, rainbowRedstone_color_ss11_g/255.0, rainbowRedstone_color_ss11_b/255.0, 1.0);
        base.rgb = vec3(0.7608, 0.8353, 0.1961);
    }
    else if (power == 12) {
        custom = vec4(rainbowRedstone_color_ss12_r/255.0, rainbowRedstone_color_ss12_g/255.0, rainbowRedstone_color_ss12_b/255.0, 1.0);
        base.rgb = vec3(1.0000, 0.8471, 0.2392);
    }
    else if (power == 13) {
        custom = vec4(rainbowRedstone_color_ss13_r/255.0, rainbowRedstone_color_ss13_g/255.0, rainbowRedstone_color_ss13_b/255.0, 1.0);
        base.rgb = vec3(0.9765, 0.5020, 0.1137);
    }
    else if (power == 14) {
        custom = vec4(rainbowRedstone_color_ss14_r/255.0, rainbowRedstone_color_ss14_g/255.0, rainbowRedstone_color_ss14_b/255.0, 1.0);
        base.rgb = vec3(0.6902, 0.1804, 0.1490);
    }
    else if (power == 15) {
        custom = vec4(rainbowRedstone_color_ss15_r/255.0, rainbowRedstone_color_ss15_g/255.0, rainbowRedstone_color_ss15_b/255.0, 1.0);
        base.rgb = vec3(0.4039, 0.2235, 0.0902);
    }
    
    vec4 color = (UseRgss == 1 ? sampleRGSS(Sampler0, texCoord0, 1.0f / TextureSize) : sampleNearest(Sampler0, texCoord0, 1.0f / TextureSize)) * vertexColor;
    color = mix(FogColor * vec4(1, 1, 1, color.a), color, ChunkVisibility);

    if (alpha >= (alpha_start - 0.005) && alpha <= (alpha_start + 0.155)) {
        vec4 reverse = texColor / base; //gets original full bright texture + brightness diffs w/o color
        color = reverse * custom; //sets color to custom
        color.a = 1.0;
    }
    
#ifdef ALPHA_CUTOUT
    if (color.a < ALPHA_CUTOUT) {
        discard;
    }
#endif

    fragColor = apply_fog(color, sphericalVertexDistance, cylindricalVertexDistance, FogEnvironmentalStart, FogEnvironmentalEnd, FogRenderDistanceStart, FogRenderDistanceEnd, FogColor);
}