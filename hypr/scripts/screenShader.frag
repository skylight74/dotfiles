//
// Example blue light filter shader.
// 

precision mediump float;
varying vec2 v_texcoord;
uniform sampler2D tex;

void main() {

    vec4 pixColor = texture2D(tex, v_texcoord);

    pixColor[2] *= 0.65;
    pixColor[0] *=0.80;
    pixColor[1] *=0.80;
    gl_FragColor = pixColor;
}
