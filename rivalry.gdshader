shader_type spatial;

uniform vec4 left_eye_tint : source_color = vec4(1.0, 0.0, 0.0, 1.0);
uniform vec4 right_eye_tint : source_color = vec4(0.0, 0.0, 1.0, 1.0);

void vertex() {

}


void fragment() {
    if (VIEW_INDEX == VIEW_MONO_LEFT) {
        ALBEDO = left_eye_tint.rgb;
    } else {
        ALBEDO = right_eye_tint.rgb;
    }
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
