local cfg = require("luarocks.core.cfg")
local fetch = require("luarocks.fetch")
local fs_lua = require("luarocks.fs")
local util = require("luarocks.util")

local tree_sitter_cli = {}

local cpu_arch = {
   ["linux"] = {
      ["x86_64"] = "x64",
      ["x86"] = "x86", -- untested, hopefully works!
      ["aarch64"] = "arm64" -- untested, hopefully works!
   },
   ["macos"] = {
      ["x86_64"] = "x64",
      ["aarch64"] = "arm64",
   },
   ["windows"] = {
      ["x86_64"] = "x64",
      ["x86"] = "x86", -- untested, hopefully works!
      ["aarch64"] = "arm64" -- untested, hopefully works!
   }
}

function tree_sitter_cli.run(rockspec, no_install)
   local ok, err
   
   local version = rockspec.build.tree_sitter_version
   if not version then return false, "Must specify build.tree_sitter_version in rockspec" end

   local filename = {"tree", "sitter"}
   local arch, platform

   if cfg.is_platform("windows") then
      platform = "windows"
   elseif cfg.is_platform("linux") then
      platform = "linux"
   elseif cfg.is_platform("macosx") then
      platform = "macos"
   end

   if not platform then
      return false, "tree-sitter-cli doesn't support your platform: " .. platform
   end

   arch = cpu_arch[platform] and cpu_arch[platform][cfg.target_cpu]
   if not arch then
      return false, "tree-sitter-cli doesn't support " .. cfg.target_cpu .. " on " .. platform
   end
   table.insert(filename, platform)
   table.insert(filename, arch)

   local filename = table.concat(filename, "-")

   local url = string.format("https://github.com/tree-sitter/tree-sitter/releases/download/v%s/%s.gz", version, filename)
   util.printout("Downloading " .. url)
   filename, err = fetch.fetch_url(url)
   if not filename then return filename, err end

   util.printout("Extracting " .. filename)
   ok, err = fs_lua.gunzip(filename, "tree-sitter")
   if not ok then return ok, err end

   return true
end

return tree_sitter_cli
