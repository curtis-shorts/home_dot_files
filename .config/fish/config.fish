# ~/.config/fish/config.fish

# Supress message
set fish_greeting

# PATH
fish_add_path ~/.local/bin
fish_add_path ~/workspace/cerebras_sdk/sdk_install/cs_sdk
 
# DRAC SSH password (set empty by default)
set -gx DAILY_DRAC_PASSWORD ""
 
# Hostname-specific settings
if string match -q "*kronos*" (hostname)
    fish_add_path /usr/local/cuda-12.6/bin
 
    if test -f ~/.spack/spack/share/spack/setup-env.sh
        # Spack uses bash; source via bass if available, otherwise skip
        # bass source ~/.spack/spack/share/spack/setup-env.sh
    end
 
    if test -f ~/.cargo/env
        # bass source ~/.cargo/env  # uncomment if you install bass
    end
 
    if test -d /opt/tt
        set -gx HF_HOME /scratch/huggingface
        set -gx UV_CACHE_DIR /scratch/uv_cache
    end
end
 
# ls coloring (macOS)
if test (uname) = Darwin
    set -gx LSCOLORS "gxfxcxdxbxegedabagacad"
end

