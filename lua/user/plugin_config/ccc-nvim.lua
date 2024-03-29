local status_ok, ccc = pcall(require, "ccc")
if not status_ok then
	return
end

local mapping = ccc.mapping
local input = ccc.input
local output = ccc.output
local picker = ccc.picker

ccc.setup({
	default_color = "#000000",
	bar_char = "█",
	point_char = "◊",
	point_color = "",
	empty_point_bg = true,
	point_color_on_dark = "#ffffff",
	point_color_on_light = "#000000",
	bar_len = 30,
	win_opts = {
		relative = "cursor",
		row = 1,
		col = 1,
		style = "minimal",
		border = "rounded",
	},
	auto_close = true,
	preserve = false,
	save_on_quit = false,
	alpha_show = "auto",
	inputs = {
		input.rgb,
		input.hsl,
		input.cmyk,
	},
	outputs = {
		output.hex,
		output.hex_short,
		output.css_rgb,
		output.css_hsl,
	},
	pickers = {
		picker.hex,
		picker.css_rgb,
		picker.css_hsl,
		picker.css_hwb,
		picker.css_lab,
		picker.css_lch,
		picker.css_oklab,
		picker.css_oklch,
	},
	highlight_mode = "bg",
	output_line = ccc.output_line,
	highlighter = {
		auto_enable = true,
		max_byte = 100 * 1024, -- 100 KB
		filetypes = {},
		excludes = {},
		lsp = true,
	},
	convert = {
		{ picker.hex, output.css_rgb },
		{ picker.css_rgb, output.css_hsl },
		{ picker.css_hsl, output.hex },
	},
	recognize = {
		input = true,
		output = false,
		pattern = {
			[picker.css_rgb] = { input.hsl, output.css_rgb },
			[picker.css_name] = { input.hsl, output.css_rgb },
			[picker.hex] = { input.hsl, output.hex },
			[picker.css_hsl] = { input.hsl, output.css_hsl },
			[picker.css_hwb] = { input.hwb, output.css_hwb },
			[picker.css_lab] = { input.lab, output.css_lab },
			[picker.css_lch] = { input.lch, output.css_lch },
			[picker.css_oklab] = { input.oklab, output.css_oklab },
			[picker.css_oklch] = { input.oklch, output.css_oklch },
		},
	},
	mappings = {
		["q"] = mapping.quit,
		["<CR>"] = mapping.complete,
		["i"] = mapping.toggle_input_mode,
		["o"] = mapping.toggle_output_mode,
		["r"] = mapping.reset_mode,
		["a"] = mapping.toggle_alpha,
		["g"] = mapping.toggle_prev_colors,
		["w"] = mapping.goto_next,
		["b"] = mapping.goto_prev,
		["W"] = mapping.goto_tail,
		["B"] = mapping.goto_head,
		["l"] = mapping.increase1,
		["d"] = mapping.increase5,
		[","] = mapping.increase10,
		["h"] = mapping.decrease1,
		["s"] = mapping.decrease5,
		["m"] = mapping.decrease10,
		["H"] = mapping.set0,
		["M"] = mapping.set50,
		["L"] = mapping.set100,
		["0"] = mapping.set0,
		["1"] = function()
			ccc.set_percent(10)
		end,
		["2"] = function()
			ccc.set_percent(20)
		end,
		["3"] = function()
			ccc.set_percent(30)
		end,
		["4"] = function()
			ccc.set_percent(40)
		end,
		["5"] = mapping.set50,
		["6"] = function()
			ccc.set_percent(60)
		end,
		["7"] = function()
			ccc.set_percent(70)
		end,
		["8"] = function()
			ccc.set_percent(80)
		end,
		["9"] = function()
			ccc.set_percent(90)
		end,
		["<LeftMouse>"] = mapping.click,
		["<ScrollWheelDown>"] = mapping.decrease1,
		["<ScrollWheelUp>"] = mapping.increase1,
	},
})
