rockspec_format = "3.0"

package = "luarocks-build-tree-sitter-cli"
version = "scm-1"

description = {
    summary = "A LuaRocks build backend to install the tree-sitter CLI",
    detailed = "luarocks-build-treesitter-cli is a LuaRocks build.type that allows installing tree-sitter CLI binaries via LuaRocks directly. It works similarly to the npm install option for tree-sitter, but uses LuaRocks instead.",
    homepage = "https://github.com/FourierTransformer/luarocks-build-treesitter-cli",
    issues_url = "https://github.com/FourierTransformer/luarocks-build-treesitter-cli/issues",
    license = "MIT"
}

supported_platforms = {"linux", "maxosx", "windows"}

dependencies = {
    "lua >= 5.1"
}

source = {
    url = "git+https://github.com/FourierTransformer/luarocks-build-tree-sitter-cli"
}
