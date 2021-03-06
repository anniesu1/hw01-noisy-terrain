#version 300 es
precision highp float;

uniform vec2 u_PlanePos; // Our location in the virtual world displayed by the plane
uniform highp int u_SceneSelection; 

in vec3 fs_Pos;
in vec4 fs_Nor;
in vec4 fs_Col;

in float fs_Sine;
in float fs_Height;
in float fs_Slope;

out vec4 out_Col; // This is the final output color that you will see on your
                  // screen for the pixel that is currently being processed.

// Mountain palette
const vec3 mountain[5] = vec3[](vec3(54, 94, 122) / 255.0,
                                vec3(131, 172, 195) / 255.0,
                                vec3(190, 193, 198) / 255.0,
                                vec3(216, 213, 208) / 255.0,
                                vec3(239, 240, 241) / 255.0);

const vec3 duskyMountain[5] = vec3[](vec3(223, 196, 182) / 255.0,
                                vec3(233, 122, 144) / 255.0,
                                vec3(128, 71, 102) / 255.0,
                                vec3(54, 94, 122) / 255.0,
                                vec3(249, 250, 252) / 255.0);
vec3 getMountainColor() {
    if (fs_Pos[2] < 4.0) {
        return mountain[4];
    }
    else if (fs_Pos[2] < 8.0) {
        return mix(mountain[4], mountain[3], (fs_Pos[2] - 4.0) / 4.0);
    }
    else if (fs_Pos[2] < 11.0) {
        return mix(mountain[3], mountain[2], (fs_Pos[2] - 8.0) / 3.0);
    }
    else if (fs_Pos[2] < 14.0) {
        return mix(mountain[2], mountain[1], (fs_Pos[2] - 11.0) / 3.0);
    }
    else if (fs_Pos[2] < 17.0) {
        return mix(mountain[1], mountain[0], (fs_Pos[2] - 14.0) / 3.0);
    }
    return mountain[0];
}

vec3 getIslandColor() {
    if (fs_Height < 4.0) {
        return mountain[0];
    }
    else if (fs_Height < 8.0) {
        return mix(duskyMountain[0], duskyMountain[1], (fs_Height - 4.0) / 4.0);
    }
    else if (fs_Height < 11.0) {
        return mix(duskyMountain[1], duskyMountain[2], (fs_Height - 8.0) / 3.0);
    }
    else if (fs_Height < 14.0) {
        return mix(duskyMountain[2], duskyMountain[3], (fs_Height - 11.0) / 3.0);
    }
    return mix(duskyMountain[3], duskyMountain[4], (fs_Height - 14.0) / 3.0);
}

void main() {
    float t = clamp(smoothstep(40.0, 50.0, length(fs_Pos)), 0.0, 1.0); // Distance fog

    vec3 customColor;
    if (u_SceneSelection == 0) {
        customColor = getMountainColor();
    }
    else if (u_SceneSelection == 1) {
        customColor = getIslandColor();
    }
    else {
        // TODO: fix
        //customColor = vec3(fs_Col);
        customColor = getIslandColor();
    }

    // Mix in order to create fog effect
    out_Col = vec4(mix(customColor, vec3(164.0 / 255.0, 233.0 / 255.0, 1.0), t), 1.0);

    // Old provided color 
    // out_Col = vec4(mix(vec3(0.5 * (fs_Sine + 1.0)), vec3(164.0 / 255.0, 233.0 / 255.0, 1.0), t), 1.0);

    // ----------------------TESTING AREA--------------------------------
    // if (abs(fs_Slope) < 0.1) {
    //     out_Col = vec4(mix(customColor, vec3(164.0 / 255.0, 233.0 / 255.0, 1.0), t), 1.0);
    //     //out_Col = vec4(162.0 / 255.0, 130.0 / 255.0, 114.0 / 255.0, 1.0);
    // }
    // else {
    //     out_Col = vec4(mountain[1], 1.0);
    // }

    // Coloring based on normal, inspired from CIS-461 PROBLEM: looks really grey
    vec3 normalColor = (vec3(fs_Nor) + vec3(1.0, 1.0, 1.0)) * 0.5;
    //out_Col = vec4(mix(normalColor, vec3(164.0 / 255.0, 233.0 / 255.0, 1.0), t), 1.0);
}
