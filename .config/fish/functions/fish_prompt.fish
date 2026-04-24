# ~/.config/fish/functions/fish_prompt.fish

function fish_prompt
    set -l time (date "+%T")
    #set -l hist $history[1] # Faster than history | count
    set -l hist (history | count)
    set -l host (hostname)

    # Define variable names consistently so they work outside the if-block
    if test -n "$SSH_CONNECTION"
        # Remote colors
        set c_time e17ee1
        set c_user 5ceff1
        set c_pwd  fdfdfd
        set c_hist ac97f1
    else
        # Local colors
        set c_time 56c971
        set c_user ffd500
        set c_pwd  56c971
        set c_hist e17ee1
    end

    set -l display_pwd (prompt_pwd --full-length-dirs=3 --dir-length=5)

    # Print the prompt using the consistent variable names
    echo -n (set_color --bold $c_time)"[$time] "
    echo -n (set_color $c_user)"$USER@$host: "
    echo -n (set_color $c_pwd)$display_pwd
    echo ""
    echo -n (set_color $c_hist)"($hist) "(set_color ffffff)"--> "(set_color normal)
end


