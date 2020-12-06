mv $PWD/emacs-profiles.el ~/.emacs-profiles.el

emacs --with-profile default --daemon=default;
emacs --with-profile clojure --daemon=clojure;

# GUI instances
alias emacs="emacsclient -c -s default"
alias "emacs-default"="emacsclient -c -s default &"
alias "emacs-clojure"="emacsclient -c -s clojure &"

# terminal instances
alias et="emacsclient -t -s default"
alias "et-clojure"="emacsclient -t -s clojure"
alias "et-default"="emacsclient -t -s default"




