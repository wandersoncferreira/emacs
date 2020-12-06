cp $PWD/emacs-profiles.el ~/.emacs-profiles.el

emacs --with-profile default --daemon=default;
emacs --with-profile clojure --daemon=clojure;
emacs --with-profile roam --daemon=roam;
emacs --with-profile ledger --daemon=ledger;







