require('util')
require('colorblend')
-- for k,v in pairs(ink_add_for_rgb({
--    {['r'] = 255, ['g'] = 100, ['b'] = 0},
--    {['r'] = 0, ['g'] = 0, ['b'] = 255},
-- })) do
--     print(tostring(k) .. ': ' .. tostring(v))
-- end

colors = {
	[{['coal']=true}] = {
		['r'] = 0,
		['g'] = 0,
		['b'] = 0,
	},
	[{['steel-plate']=true}] = {
		['r'] = 255,
		['g'] = 255,
		['b'] = 255,
	},
	[{['iron-ore']=true, ['iron-plate']=true}] = {
		['r'] = 0,
		['g'] = 50,
		['b'] = 200,
	},
	[{['copper-ore']=true, ['copper-plate']=true}] = {
		['r'] = 255,
		['g'] = 50,
		['b'] = 0,
	},
	[{['raw-wood']=true, ['wood']=true}] = {
		['r'] = 116,
		['g'] = 37,
		['b'] = 0,
	},
}

script.on_event(defines.events.on_train_changed_state, function(event)
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
				r['o'] = count / total
				table.insert(color_mix, r)
			end

			color = ink_add_for_rgb(color_mix)
		end

		final_color = {
			['r'] = color.r / 255,
			['g'] = color.g / 255,
			['b'] = color.b / 255,
			['a'] = 0.498, -- vanilla UI uses this alpha
		}

		for _, locomotive in pairs(train.locomotives['front_movers']) do
			locomotive.color = final_color
		end

		for _, locomotive in pairs(train.locomotives['back_movers']) do
			locomotive.color = final_color
		end
	end
end)