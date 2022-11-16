ENV["JULIA_EDITOR"] = "nvim"
using Pkg
# import REPL
# using Term


if isfile("Project.toml") && isfile("Manifest.toml")
    Pkg.activate(".")
end

Base.atreplinit() do repl
    @eval begin
        @async @eval using Revise
        @async @eval using BenchmarkTools
        import OhMyREPL as OMR
        # import Crayons as C
        promptfn() = "(" * splitpath(Base.active_project())[end-1] * ") julia> "
        OMR.input_prompt!(promptfn)
        # OMR.colorscheme!("OneDark")
        # OMR.enable_pass!("RainbowBrackets", false)
        # OMR.Passes.BracketHighlighter.setcrayon!(C.Crayon(foreground=:blue))
        @async begin
            # reinstall keybindings to work around https://github.com/KristofferC/OhMyREPL.jl/issues/166
            sleep(1)
            OMR.Prompt.insert_keybindings()
        end
    end
end

# from https://twitter.com/heyjoshday/status/1555527185028395010/photo/1
macro dev()
    pkg = Symbol(
        replace(
            readline("Project.toml"), "name = \"" => "", '"' => ""
        )
    )
    esc(:(using Pkg; Pkg.activate("."); using Revise, $pkg))
end
