-- Rocks.nvim setup
local rocks_config = {
	rocks_path = vim.env.HOME .. "/.local/share/nvim/rocks",
}

vim.g.rocks_nvim = rocks_config

local luarocks_path = {
	vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?.lua"),
	vim.fs.joinpath(rocks_config.rocks_path, "share", "lua", "5.1", "?", "init.lua"),
}
package.path = package.path .. ";" .. table.concat(luarocks_path, ";")

local luarocks_cpath = {
	vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.so"),
	vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.so"),
	-- Remove the dylib and dll paths if you do not need macos or windows support
	vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.dylib"),
	vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.dylib"),
	vim.fs.joinpath(rocks_config.rocks_path, "lib", "lua", "5.1", "?.dll"),
	vim.fs.joinpath(rocks_config.rocks_path, "lib64", "lua", "5.1", "?.dll"),
}
package.cpath = package.cpath .. ";" .. table.concat(luarocks_cpath, ";")

local rocks_path = vim.fs.joinpath(rocks_config.rocks_path, "lib", "luarocks", "rocks-5.1", "rocks.nvim", "*")
vim.opt.rtp:append(rocks_path)
-- End of Rocks.nvim setup

-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"

