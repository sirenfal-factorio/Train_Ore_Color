require('util')
require('colorblend')
-- for k,v in pairs(ink_add_for_rgb({
--    {['r'] = 255, ['g'] = 100, ['b'] = 0},
--    {['r'] = 0, ['g'] = 0, ['b'] = 255},
-- })) do
--     print(tostring(k) .. ': ' .. tostring(v))
-- end

colors = {
	-- angels
	[{'angels-ore1'}] = { -- sapphirite
		['r'] = 90,
		['g'] = 102,
		['b'] = 141,
		['a'] = 1.0,
	},
	[{'angels-ore2'}] = { -- jivolite
		['r'] = 131,
		['g'] = 129,
		['b'] = 23,
		['a'] = 1.0,
	},
	[{'angels-ore3'}] = { -- stiratite
		['r'] = 61,
		['g'] = 96,
		['b'] = 111,
		['a'] = 1.0,
	},
	[{'angels-ore4'}] = { -- crotinnium
		['r'] = 211,
		['g'] = 211,
		['b'] = 211,
		['a'] = 1.0,
	},
	[{'angels-ore5'}] = { -- rubyte
		['r'] = 82,
		['g'] = 18,
		['b'] = 18,
		['a'] = 1.0,
	},
	[{'angels-ore6'}] = { -- bobmonium
		['r'] = 105,
		['g'] = 68,
		['b'] = 36,
		['a'] = 1.0,
	},

	-- dark matter replicators
	[{'tenemut'}] = {
		['r'] = 137,
		['g'] = 89,
		['b'] = 131,
		['a'] = 1.0,
	},

	-- uranium power
	[{'uraninite'}] = {
		['r'] = 83,
		['g'] = 137,
		['b'] = 46,
		['a'] = 1.0,
	},
	[{'fluorite'}] = {
		['r'] = 179,
		['g'] = 144,
		['b'] = 146,
		['a'] = 1.0,
	},

	-- nucular
	[{'uranium-ore'}] = {
		['r'] = 230,
		['g'] = 233,
		['b'] = 90,
		['a'] = 1.0,
	},

	-- bobsores
	[{'bauxite-ore'}] = { -- aluminum ore
		['r'] = 145,
		['g'] = 129,
		['b'] = 60,
		['a'] = 1.0,
	},
	[{'cobalt-ore', 'cobalt-plate'}] = {
		['r'] = 51,
		['g'] = 98,
		['b'] = 146,
		['a'] = 1.0,
	},
	[{'diamond-ore'}] = {
		['r'] = 173,
		['g'] = 172,
		['b'] = 145,
		['a'] = 1.0,
	},
	[{'emerald-ore'}] = {
		['r'] = 133,
		['g'] = 166,
		['b'] = 159,
		['a'] = 1.0,
	},
	[{'amethyst-ore'}] = {
		['r'] = 185,
		['g'] = 131,
		['b'] = 194,
		['a'] = 1.0,
	},
	[{'ruby-ore'}] = {
		['r'] = 195,
		['g'] = 76,
		['b'] = 117,
		['a'] = 1.0,
	},
	[{'sapphire-ore'}] = {
		['r'] = 98,
		['g'] = 93,
		['b'] = 164,
		['a'] = 1.0,
	},
	[{'topaz-ore'}] = {
		['r'] = 151,
		['g'] = 71,
		['b'] = 52,
		['a'] = 1.0,
	},
	[{'gold-ore', 'gold-plate'}] = {
		['r'] = 250,
		['g'] = 171,
		['b'] = 45,
		['a'] = 1.0,
	},
	[{'lead-ore'}] = {
		['r'] = 72,
		['g'] = 73,
		['b'] = 84,
		['a'] = 1.0,
	},
	[{'nickel-ore'}] = {
		['r'] = 107,
		['g'] = 154,
		['b'] = 141,
		['a'] = 1.0,
	},
	[{'quartz'}] = { -- identical to crotinnium
		['r'] = 211,
		['g'] = 211,
		['b'] = 211,
		['a'] = 1.0,
	},
	[{'rutile-ore'}] = {
		['r'] = 61,
		['g'] = 47,
		['b'] = 57,
		['a'] = 1.0,
	},
	[{'silver-ore', 'silver-plate'}] = {
		['r'] = 194,
		['g'] = 203,
		['b'] = 211,
		['a'] = 1.0,
	},
	[{'sulfur'}] = {
		['r'] = 166,
		['g'] = 142,
		['b'] = 27,
		['a'] = 1.0,
	},
	[{'tin-ore', 'tin-plate'}] = {
		['r'] = 169,
		['g'] = 169,
		['b'] = 169,
		['a'] = 1.0,
	},
	[{'tungsten-ore', 'tungsten-plate'}] = {
		['r'] = 126,
		['g'] = 82,
		['b'] = 43,
		['a'] = 1.0,
	},
	[{'zinc-ore', 'zinc-plate'}] = {
		['r'] = 42,
		['g'] = 108,
		['b'] = 103,
		['a'] = 1.0,
	},
	[{'aluminium-plate'}] = {
		['r'] = 219,
		['g'] = 219,
		['b'] = 219,
		['a'] = 1.0,
	},
	[{'titanium-plate'}] = {
		['r'] = 240,
		['g'] = 240,
		['b'] = 240,
		['a'] = 1.0,
	},
	[{'copper-tungsten-alloy'}] = {
		['r'] = 154,
		['g'] = 50,
		['b'] = 36,
		['a'] = 1.0,
	},
	[{'bronze-alloy'}] = {
		['r'] = 174,
		['g'] = 141,
		['b'] = 105,
		['a'] = 1.0,
	},
	[{'brass-alloy'}] = {
		['r'] = 193,
		['g'] = 191,
		['b'] = 130,
		['a'] = 1.0,
	},
	[{'tungsten-carbide'}] = {
		['r'] = 198,
		['g'] = 199,
		['b'] = 194,
		['a'] = 1.0,
	},
	[{'gunmetal-alloy'}] = {
		['r'] = 182,
		['g'] = 144,
		['b'] = 70,
		['a'] = 1.0,
	},
	[{'electrum-alloy'}] = {
		['r'] = 167,
		['g'] = 158,
		['b'] = 114,
		['a'] = 1.0,
	},
	[{'invar-alloy'}] = {
		['r'] = 167,
		['g'] = 156,
		['b'] = 138,
		['a'] = 1.0,
	},
	[{'nitinol-alloy'}] = {
		['r'] = 160,
		['g'] = 162,
		['b'] = 161,
		['a'] = 1.0,
	},
	[{'lead-plate'}] = {
		['r'] = 134,
		['g'] = 176,
		['b'] = 222,
		['a'] = 1.0,
	},
	[{'cobalt-steel-alloy'}] = {
		['r'] = 139,
		['g'] = 161,
		['b'] = 185,
		['a'] = 1.0,
	},

	-- vanilla
	[{'coal'}] = {
		['r'] = 40,
		['g'] = 40,
		['b'] = 40,
		['a'] = 1.0,
	},
	[{'stone'}] = {
		['r'] = 114,
		['g'] = 108,
		['b'] = 81,
		['a'] = 1.0,
	},
	[{'steel-plate'}] = {
		['r'] = 182,
		['g'] = 185,
		['b'] = 169,
		['a'] = 1.0,
	},
	[{'iron-ore', 'iron-plate'}] = {
		['r'] = 127,
		['g'] = 150,
		['b'] = 150,
		['a'] = 1.0,
	},
	[{'copper-ore', 'copper-plate'}] = {
		['r'] = 242,
		['g'] = 122,
		['b'] = 51,
		['a'] = 1.0,
	},
	[{'raw-wood', 'wood'}] = {
		['r'] = 159,
		['g'] = 134,
		['b'] = 92,
		['a'] = 1.0,
	},
}

-- sanity check
for keys, color in pairs(colors) do
	if(color['r'] == nil or color['g'] == nil or color['b'] == nil) then
		error('Must set rgb on all colors: ' .. serpent.block(keys))
	end

	if(color['r'] < 0 or color['r'] > 255 or color['g'] < 0 or color['g'] > 255 or color['b'] < 0 or color['b'] > 255) then
		error('Colors must be 0 to 255: ' .. serpent.block(keys))
	end

	if(color['a'] ~= nil and color['a'] < 0 or color['a'] > 1) then
		error('Alpha/opacity must be 0.0 to 1.0: ' .. serpent.block(keys))
	end
end

processed = false

local function process_colors()
	local process = {}

	-- purge any keys that don't exist because of mods that aren't loaded
	-- replace key arrays with key->true sets for O(1) lookups
	for keys, color in pairs(colors) do
		local hit = {}
		local n = 0

		for _, key in pairs(keys) do
			if(game.item_prototypes[key] ~= nil) then
				n = n + 1
				hit[key] = true
			end
		end

		if(n > 0) then
			process[hit] = color
		end
	end

	colors = process
	processed = true
end

script.on_event(defines.events.on_train_changed_state, function(event)
	-- this is done here because we don't want to save the color array in the savegame, we just want to
	-- process it at startup after all mods have been loaded; for some reason there isn't a reliable
	-- hook for this: game isn't available/safe during on_load, but on_init isn't called for existing games
	--
	-- reeeeeeeeeeeeee
	if(not processed) then
		process_colors()
	end

	local train = event.train
	if(train.state == defines.train_state.on_the_path and not train.manual_mode and #train.cargo_wagons > 0) then
		local total = 0
		local hit = 0
		calc = {}

		for name, count in pairs(train.get_contents()) do
			for key, color in pairs(colors) do
				if(key[name] ~= nil) then

					if(calc[key] ~= nil) then
						calc[key] = calc[key] + count
					else
						hit = hit + 1
						calc[key] = count
					end

					total = total + count
				end
			end
		end
		-- for _, cargo in pairs(train.cargo_wagons) do
		-- 	game.print(#(cargo.get_inventory(defines.inventory.chest)))
		-- end

		if(hit < 1) then
			return
		elseif(hit == 1) then
			-- lua is stupid...
			local asdf = nil

			for k,v in pairs(calc) do
				asdf = k
				break
			end

			if(asdf == nil) then
				error('Train_Ore_Color: nil color selection')
			end

			color = colors[asdf]
		else
			color_mix = {}

			for key, count in pairs(calc) do
				r = table.deepcopy(colors[key])
				if(colors[key]['a'] ~= nil) then
					r['o'] = colors[key]['a'] * (count / total)
				else
					r['o'] = 0.498 * (count / total) -- 0.498 is vanilla alpha
				end
				table.insert(color_mix, r)
			end

			color = ink_add_for_rgb(color_mix)
		end

		final_color = {
			['r'] = color.r / 255,
			['g'] = color.g / 255,
			['b'] = color.b / 255,
			['a'] = color.o, --0.498, -- vanilla UI uses this alpha
		}

		for _, locomotive in pairs(train.locomotives['front_movers']) do
			locomotive.color = final_color
		end

		for _, locomotive in pairs(train.locomotives['back_movers']) do
			locomotive.color = final_color
		end
	end
end)