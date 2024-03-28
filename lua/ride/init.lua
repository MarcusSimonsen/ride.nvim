local settings = require('ride.settings')
local ride_heading = require('ride.heading')
local ride_table = require('ride.table')

local M = {}

M.setup = function(opts)
    settings._update_settings(opts)
    settings._create_commands()
    settings._set_default_keymaps()
end

M.increase_heading = function()
    ride_heading._increase_heading_level()
end

M.decrease_heading = function()
    ride_heading._decrease_heading_level()
end

M.make_table = function()
    local input = vim.fn.input("<Columns> <Rows>: ")
    local dimensions = ride_table._parse_input(input)
    ride_table._make_table(dimensions.cols, dimensions.rows)
end

return M
