ENV["JULIA_EDITOR"] = "nvim"
using Pkg
import REPL
using OhMyREPL
# using TheFix;TheFix.@safeword fix true
using BenchmarkTools
using Term
using Revise

@async begin
    # reinstall keybindings to work around https://github.com/KristofferC/OhMyREPL.jl/issues/166
    sleep(1)
    OhMyREPL.Prompt.insert_keybindings()
end

if isfile("Project.toml") && isfile("Manifest.toml")
    Pkg.activate(".")
end
