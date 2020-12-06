mv $PWD/emacs-profiles.el ~/.emacs-profiles.el

emacs --with-profile default --daemon=default;
emacs --with-profile clojure --daemon=clojure;

alias eclj="emacsclient -c -s clojure &"
alias etclj="emacsclient -t -s clojure"

alias emacs="emacsclient -c -s default"
alias et="emacsclient -t -s default"


