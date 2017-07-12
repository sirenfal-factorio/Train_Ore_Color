local rgb_scale = 255.0
local cmyk_scale = 100.0

-- color mixing
-- http://stackoverflow.com/a/30079700/1316748

local function rgb_to_cmyk(r,g,b)
	if r == 0 and g == 0 and b == 0 then
		return {
			['c'] = 0,
			['m'] = 0,
			['y'] = 0,
			['k'] = cmyk_scale,
		}
	end

	-- rgb [0,255] -> cmy [0,1]
	c = 1 - r / rgb_scale
	m = 1 - g / rgb_scale
	y = 1 - b / rgb_scale

	-- extract out k [0,1]
	min_cmy = math.min(c, m, y)
	c = (c - min_cmy) 
	m = (m - min_cmy) 
	y = (y - min_cmy) 
	k = min_cmy

	-- rescale to the range [0,cmyk_scale]
	return {
		['c'] = c*cmyk_scale,
		['m'] = m*cmyk_scale,
		['y'] = y*cmyk_scale,
		['k'] = k*cmyk_scale,
	}
end

local function _clamp(v, min, max)
	if(v < min) then
		return min
	elseif(v > max) then
		return max
	else
		return v
	end
end

local function cmyk_to_rgb(c,m,y,k)
	r = rgb_scale*(1.0-(c+k)/cmyk_scale)
	g = rgb_scale*(1.0-(m+k)/cmyk_scale)
	b = rgb_scale*(1.0-(y+k)/cmyk_scale)

	return {
		['r'] = _clamp(math.floor(r), 0, 255),
		['g'] = _clamp(math.floor(g), 0, 255),
		['b'] = _clamp(math.floor(b), 0, 255),
	}
end

function ink_add_for_rgb(colors)
	-- input: list of rgb, opacity (r,g,b,o) colours to be added, o acts as weights (may be nil)
	local C = 0
	local M = 0
	local Y = 0
	local K = 0

	for _, color in pairs(colors) do
		local cmyk = rgb_to_cmyk(color.r, color.g, color.b)
		local o = color.o or 0.5

		C = C + (o*cmyk.c)
		M = M + (o*cmyk.m)
		Y = Y + (o*cmyk.y)
		K = K + (o*cmyk.k)
	end

	return cmyk_to_rgb(C, M, Y, K)
end