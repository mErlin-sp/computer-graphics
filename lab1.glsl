// Task 1
void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    // input: pixel coordinates
    vec2 p = (- iResolution.xy + 2.0 * fragCoord) / iResolution.y;
    // angle of each pixel to the center of the screen
    float a = atan(p.y, p.x); // modified distance metric
    float r = pow(pow(p.x * p.x, 4.0) + pow(p.y * p.y, 4.0), 1.0 / 8.0);
    // index texture by (animated inverse) radius and angle
    vec2 uv = vec2(1.0 / r + 0.2 * iTime, a);

    // pattern: cosines
    float f = cos(12.0 * uv.x) * cos(6.0 * uv.y);
    // color fetch: palette
    vec3 col = 0.5 + 0.5 * sin(3.1416 * f + vec3(0.0, 0.5, 1.0));
    // lighting: darken at the center
    col = col * r;
    // output: pixel color
    fragColor = vec4(col, 1.0);
}

// Task 2
void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    // sets the pixels color
    fragColor = vec4(abs(sin(iTime * 0.3)), abs(sin(iTime * 0.5)), abs(sin(iTime * 0.7)), 1.0);
}

// Task 3
void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    vec2 xy = fragCoord.xy;
    xy.x = xy.x / iResolution.x;
    xy.y = xy.y / iResolution.y;
    vec4 solidRed = vec4(0, 0.0, 0.0, 1.0);
    solidRed.r = xy.x + xy.y;
    fragColor = solidRed;
}

// Task 4
void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    // Make the fragCoordinate within the range of 0 and 1
    vec2 xy = fragCoord.xy / iResolution.xy;

    // Return the color of the texture in Channel0
    vec4 texColor = texture(iChannel0, xy);

    // Initialize the variables
    vec4 white = vec4(1, 1, 1, 1);
    vec4 black = vec4(0, 0, 0, 1);

    // Average the color out
    float average = texColor.r + texColor.g + texColor.b / 3.0;

    // Check if it's closer to white or black
    if (average <= 0.5) {
        texColor = black;
    } else {
        texColor = white;
    }

    // sets the pixels color
    fragColor = texColor;
}

// Task 5
void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    // Make the fragCoordinate within the range of 0 and 1
    vec2 xy = fragCoord.xy / iResolution.xy;

    // Return the color of the texture in Channel0
    vec4 texColor = texture(iChannel0, xy);

    // Initialize the variables
    vec3 white = vec3(1, 1, 1);
    vec3 black = vec3(0, 0, 0);

    // Average the color out
    float average = texColor.r + texColor.g + texColor.b / 3.0;

    // Check if it's closer to white or black
    vec3 newColor;
    if (average <= 0.9) {
        newColor = black;
    } else {
        newColor = white;
    }

    // sets the pixels color
    fragColor = vec4(mix(texColor.rgb, newColor.rgb, abs(sin(iTime * 0.5))), 1.0);
}

