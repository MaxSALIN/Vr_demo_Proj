shader_type spatial;
render_mode depth_test_disabled, skip_vertex_transform, unshaded, cull_disabled;

// Modify VERTEX.xy using the projection matrix to correctly center the effect.
void vertex() {
        vec2 vert_pos = VERTEX.xy;

        if (length(vert_pos) < 0.99) {
                vec4 offset = PROJECTION_MATRIX * vec4(0.0, 0.0, 1.0, 1.0);
                vert_pos += (offset.xy / offset.w);
        }

        POSITION = vec4(vert_pos, 1.0, 1.0);
}

void fragment() {
        ALBEDO = vec3(0.0);
        ALPHA = dot(UV * 2.0 - 1.0, UV * 2.0 - 1.0) * 2.0;
}