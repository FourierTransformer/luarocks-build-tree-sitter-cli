# luarocks-build-tree-sitter-cli
This is a LuaRocks build system that installs the tree-sitter CLI by matching up your OS and CPU architecture to download and install the correct tree-sitter CLI version. It works similarly to the official `npm install` method but allows LuaRocks to download and install the binary directly (no npm or cargo required!)

It is used by https://github.com/FourierTransformer/tree-sitter-cli to support installing the various versions of tree-sitter.
