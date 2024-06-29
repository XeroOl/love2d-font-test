local goodfont = love.graphics.newFont("LiberationSans-Regular.fnt")
local badfont = love.graphics.newFont("LiberationSans-Regular.ttf", 32)
local shader = love.graphics.newShader([[
float median(float r, float g, float b) {
    return max(min(r, g), min(max(r, g), b));
}
vec4 effect( vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords ) {
    vec3 msd = Texel(tex, texture_coords).rgb;
    float sd = median(msd.r, msd.g, msd.b) - 0.5;
    float screen_px = 10.0;
    float opacity = clamp((screen_px * sd) + 0.5, 0.0, 1.0);
    color.a *= opacity;
    return color;
}
]])
function love.draw()
    love.graphics.setShader(shader)
    love.graphics.setFont(goodfont)
    love.graphics.print("th AaBbCc", 20, 20, 0, 5, 5)
    love.graphics.setShader()
    love.graphics.setFont(badfont)
    love.graphics.print("th AaBbCc", 20, 240, 0, 5, 5)
end
