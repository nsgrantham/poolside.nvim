---@diagnostic disable: undefined-global
vim.opt.background = 'dark'
vim.g.colors_name = 'poolside'

package.loaded['lush_theme.poolside'] = nil

require('lush')(require('lush_theme.poolside'))
