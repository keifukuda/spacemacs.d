;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------

     ;; ;; intl
     ;; japanese

     ;; emacs
     better-defaults

     ;; os
     osx

     ;; completion
     helm

     ;; chat
     slack

     ;; font
     (unicode-fonts :variables
                    unicode-fonts-force-multi-color-on-mac t)

     ;; lang
     html
     (javascript :variables
                 node-add-modules-path nil)

     (ruby :variables
           ruby-version-manager 'rbenv
           ruby-test-runner 'rspec)

     (typescript :variables
                 typescript-fmt-on-save t)

     restructuredtext
     yaml
     lua
     (emacs-lisp :variables
                 emacs-lisp-hide-namespace-prefix nil)
     markdown
     org
     typescript
     shell-scripts
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)


     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'complete
                      auto-completion-complete-with-key-sequence nil
                      auto-completion-complete-with-key-sequence-delay 0.1
                      auto-completion-private-snippets-directory nil
                      ;; auto-completion-enable-help-tooltip t
                      ;; auto-completion-private-snippets-directory ""
                      auto-completion-enable-snippets-in-popup t)

     ;; framework
     react
     ruby-on-rails

     ;; fun
     emoji

     ;; ;; tags
     ;; gtags

     ;; themes
     colors

     ;; source-control
     git
     (version-control :variables
                      version-control-diff-side 'left
                      version-control-diff-tool 'diff-hl)

     ;; filetree
     neotree

     ;; checkers
     ;; spell-checking
     syntax-checking

     ;; tools
     lsp
     ;; tern
     restclient

     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages
   '(
     helm-ghq
     helm-ls-git
     all-the-icons
     imenus
     symbol-overlay
     embrace

     ;; lsp
     lsp-javascript-typescript
     lsp-javascript-flow
     lsp-vue

     ;; regexp
     visual-regexp-steroids
     pcre2el

     ;; lang
     vue-mode
     gitignore-mode
     prettier-js

     ;; etc
     highlight-thing

     (company-sass
      :location "~/.spacemacs.d/elisp/company-sass")

     (git-complete
      :location (recipe :fetcher github
                        :repo "zk-phi/git-complete"))
     )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; File path pointing to emacs 27.1 executable compiled with support
   ;; for the portable dumper (this is currently the branch pdumper).
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs

   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         (monokai :location (recipe :fetcher github :repo "oneKelvinSmith/monokai-emacs"))
                         ;; (atom-one-dark :location (recipe :fetcher github :repo "jonathanchu/atom-one-dark-theme"))
                         )

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `vim-powerline' and `vanilla'. The first three
   ;; are spaceline themes. `vanilla' is default Emacs mode-line. `custom' is a
   ;; user defined themes, refer to the DOCUMENTATION.org for more info on how
   ;; to create your own spaceline theme. Value can be a symbol or list with\
   ;; additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Menlo" ;; "Source Code Pro"
                               :size 11
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, pressing
   ;; `p' several times cycles through the elements in the `kill-ring'.
   ;; (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%a"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."


  ;; path
  (setq exec-path-from-shell-arguments '("-i"))
  ;; (add-to-list 'exec-path "/usr/local/bin/")
  ;; (setq explicit-shell-file-name "/bin/zsh")
  ;; (setq shell-file-name "zsh")
  ;; (setenv "SHELL" "/usr/local/bin/zsh")

  ;; theme
  (setq dotspacemacs-themes '(monokai))

  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included
in the dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

  ;; theme
  (set-face-attribute 'font-lock-comment-face nil :italic t)
  (set-face-attribute 'font-lock-comment-delimiter-face nil :italic t)
  (set-fontset-font nil 'japanese-jisx0208 (font-spec :family "YuGothic"))

  ;; ;;
  ;; (setq left-fringe-width 5)
  ;; (setq right-fringe-width 5)

  (defadvice helm-buffers-sort-transformer (around ignore activate)
  (setq ad-return-value (ad-get-arg 0)))

  ;; neotree
  (setq neo-smart-open t)
  (setq projectile-switch-project-action 'neotree-projectile-action)
  (setq neo-keymap-style 'concise) ;; https://github.com/jaypei/emacs-neotree/issues/281
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (setq neo-vc-integration '(face char))
  (setq neo-show-hidden-files t)
  (setq neo-hidden-regexp-list '("^\\." "\\.cs\\.meta$" "\\.pyc$" "~$" "^#.*#$" "\\.elc$" "\\.DS_Store$"))
  (setq neo-toggle-window-keep-p t)
  (setq neo-force-change-root t)

  ;; title
  ;; (setq frame-title-format "")
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  ;; (add-to-list 'default-frame-alist '(ns-appearance . 'nil))
  (add-to-list 'default-frame-alist '(ns-appearance . dark))
  ;; https://github.com/d12frosted/homebrew-emacs-plus/issues/55

  ;; exit
  (setq confirm-kill-emacs 'y-or-n-p)

  ;; powerline
  ;; https://github.com/milkypostman/powerline/issues/54
  (setq powerline-image-apple-rgb t)

  ;; modeline
  (spacemacs|diminish highlight-thing-mode "" "h")

  ;; recentf
  (setq recentf-max-saved-items 2000)
  (setq recentf-auto-cleanup 'never)
  (setq recentf-exclude '("/recentf" "COMMIT_EDITMSG" "/.?TAGS" "^/sudo:" "/\\.emacs\\.d" "\\.cache"))

  ;; ;; indent guide
  ;; (setq indent-guide-char "╵")
  ;; (setq indent-guide-delay 0.2)
  ;; (spacemacs/toggle-indent-guide-globally-on)

  ;; helm
  (setq helm-ff-skip-boring-files t)
  (setq helm-boring-file-regexp-list '("\\.git$" "\\.DS_Store$" "\\.cache$"))
  (advice-add 'helm-ff-filter-candidate-one-by-one
              :around (lambda (fcn file)
                        (unless (string-match "\\(?:/\\|\\`\\)\\.\\{1,2\\}\\'" file)
                          (funcall fcn file))))


  ;; helm-swoop
  (setq helm-multi-swoop-edit-save t)

  ;; dumb-jump
  (setq dumb-jump-default-project "~/Developer")
  (setq dumb-jump-selector 'helm)

  ;; visual-regexp-steroids
  ;; (setq vr/engine 'python)
  (setq vr/engine 'pcre2el)

  ;; anzu
  (setq anzu-replace-to-string-separator " → ")

  ;; pcre2el
  (add-hook 'prog-mode-hook 'rxt-mode)

  ;; highlight-thing
  (global-highlight-thing-mode)
  (setq highlight-thing-delay-seconds 0)
  (set-face-attribute 'highlight-thing nil :background "gray30" :inherit nil)

  ;; company
  (global-company-mode)
  (set (make-local-variable 'company-minimum-prefix-length) 1)
  (global-set-key (kbd "TAB") #'company-indent-or-complete-common)
  ;; (setq company-tooltip-maximum-width 80)
  ;; (setq company-tooltip-minimum-width 30)

  ;; company-backends
  (add-to-list 'company-backends 'company-sass)
  (add-to-list 'company-backends 'company-web-jade)


  ;; hook
  (add-hook 'before-save-hook 'delete-trailing-whitespace)

  ;; emacs-lisp
  (add-hook 'emacs-lisp-mode-hook #'flycheck-mode)

  ;; javascript
  (setq js2-basic-offset 2)
  (setq js-indent-level 2)
  (setq indent-tabs-mode nil)
  (setq js-indent-level 2)
  (setq js2-include-browser-externs nil)
  (setq js2-mode-show-parse-errors nil)
  (setq js2-mode-show-strict-warnings nil)
  (setq js2-highlight-external-variables nil)
  (setq js2-include-jslint-globals nil)

  ;; lsp-javascript
  (require 'lsp-javascript-typescript)
  (add-hook 'typescript-mode-hook #'lsp-javascript-typescript-enable) ;; for typescript support
  (add-hook 'js2-mode-hook #'lsp-javascript-typescript-enable) ;; for js2-mode support
  ;; (add-hook 'rjsx-mode #'lsp-javascript-typescript-enable) ;; for rjsx-mode support

  (require 'lsp-typescript)
  ;; (add-hook 'js-mode-hook #'lsp-typescript-enable)
  ;; (add-hook 'js2-mode-hook #'lsp-typescript-enable) ;; for js2-mode support
  (add-hook 'rjsx-mode #'lsp-typescript-enable) ;; for rjsx-mode support

  ;; prettier
  (setq prettier-js-command "prettier")
  (setq prettier-js-args
        '(
          "--semi" "false"
          "--single-quote" "true"))

  (eval-after-load 'js2-mode
    '(progn
       ;; (add-hook 'js2-mode-hook #'add-node-modules-path)
       (add-hook 'js2-mode-hook #'prettier-js-mode)
       ))


  ;; (use-package lsp-vue
  ;;   :after (vue-mode lsp-mode)
  ;;   :hook (
  ;;          (vue-mode . lsp-vue-mmm-enable)
  ;;          (vue-mode . company-mode)
  ;;          )
  ;;   )


  (eval-after-load 'vue-mode
    '(progn
       (require 'lsp-mode)
       (require 'lsp-vue)
       (add-hook 'vue-mode-hook #'company-mode)
       ;; (add-hook 'vue-mode-hook #'smartparens-mode)
       (add-hook 'vue-mode-hook #'lsp-vue-mmm-enable)
       ;; (add-hook 'vue-mode-hook #'lsp-vue-enable)
       (add-hook 'mmm-js-mode-enter-hook #'add-node-modules-path)
       (add-hook 'mmm-js-mode-enter-hook #'prettier-js-mode)
       ))


  (add-hook 'ssass-mode-hook
            (lambda ()
              (set (make-local-variable 'comment-start) "//")
              (set (make-local-variable 'comment-end) "")))

  ;; mmm-mode
  (setq mmm-submode-decoration-level 0)

  (add-hook 'mmm-mode-hook
            (lambda ()
              (emmet-mode 0)
              (electric-indent-local-mode -1)))

  (add-hook 'vue-mode-hook
            (lambda ()
              (emmet-mode 0)
              (electric-indent-local-mode -1)))


  ;; rainbow
  ;; (use-package rainbow-mode
  ;;   :commands rainbow-mode
  ;;   :after (:any vue-mode mmm-mode css-mode sass-mode ssass-mode)
  ;;   )
  (add-hook 'vue-mode-hook #'rainbow-mode)
  (add-hook 'mmm-mode-hook #'rainbow-mode)
  (add-hook 'css-mode-hook #'rainbow-mode)
  (add-hook 'sass-mode-hook #'rainbow-mode)
  (add-hook 'ssass-mode-hook #'rainbow-mode)


  ;; keybind

  ;; backspace
  (global-set-key (kbd "C-h") 'delete-backward-char)
  (define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))

  ;; multi-curosr
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)

  ;; helm
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (global-set-key (kbd "C-;") 'helm-ls-git-ls)
  (global-set-key (kbd "C-:") 'helm-grep-do-git-grep)
  (global-set-key (kbd "C-x C-p") 'helm-ghq)
  (global-set-key (kbd "C-x C-b") 'helm-mini)
  (global-set-key (kbd "C-x C-r") 'helm-recentf)

  ;; replace
  (global-set-key [remap query-replace] 'anzu-query-replace)
  (global-set-key [remap query-replace-regexp] 'vr/query-replace)

  ;; search
  (global-set-key [remap isearch-backward] 'helm-mini)
  (global-set-key (kbd "M-i") 'helm-swoop)
  (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
  (global-set-key [remap isearch-forward-regexp] 'vr/isearch-forward)
  (global-set-key [remap isearch-backward-regexp] 'vr/isearch-backward)

  ;; etc
  (global-set-key (kbd "C-x b") 'ibuffer)
  (global-set-key (kbd "C-x C-d") 'neotree-toggle)

  ;; window
  (global-set-key [C-tab] 'next-multiframe-window)
  (global-set-key [C-S-iso-lefttab] 'previous-multiframe-window)

  ;; symbol-overlay
  ;; (global-set-key (kbd "M-i") 'symbol-overlay-put)
  ;; (global-set-key (kbd "M-n") 'symbol-overlay-switch-forward)
  ;; (global-set-key (kbd "M-p") 'symbol-overlay-switch-backward)

  ;; vue-mode
  (global-set-key [remap spacemacs/emmet-expand] 'indent-for-tab-command)
  (advice-remove #'newline-and-indent #'ad-Advice-newline-and-indent)
  (advice-remove #'yank #'ad-Advice-yank)

  (progn
    (require 'pug-mode)
    (define-key pug-mode-map (kbd "C-j") 'default-indent-new-line)
    (define-key pug-mode-map (kbd "C-m") 'default-indent-new-line))

  (progn
    (require 'sass-mode)
    (define-key sass-mode-map (kbd "C-j") 'newline-and-indent)
    (define-key sass-mode-map (kbd "C-m") 'newline-and-indent))

  (progn
    (require 'vue-mode)
    (define-key vue-mode-map (kbd "C-c C-l") 'vue-mode-reparse))


  (global-set-key (kbd "C-c C-l") 'vue-mode-reparse)

  ;; git-complete
  (require 'git-complete)
  (global-set-key (kbd "C-c C-c") 'git-complete)

  ;; expand-region
  (global-set-key (kbd "C-=") 'er/expand-region)


  ;; embrace
  (global-set-key (kbd "C-'") 'embrace-add)

  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(yasnippet-snippets yaml-mode xterm-color ws-butler winum which-key web-mode web-beautify vue-mode volatile-highlights visual-regexp-steroids vi-tilde-fringe uuidgen use-package unicode-fonts unfill toc-org tide tagedit symon symbol-overlay string-inflection spaceline-all-the-icons smeargle slim-mode slack shell-pop scss-mode sass-mode rvm ruby-tools ruby-test-mode ruby-refactor ruby-hash-syntax rubocop rspec-mode robe rjsx-mode reveal-in-osx-finder restclient-helm restart-emacs rbenv rainbow-mode rainbow-identifiers rainbow-delimiters pug-mode projectile-rails prettier-js popwin persp-mode password-generator paradox overseer osx-trash osx-dictionary orgit org-projectile org-present org-pomodoro org-mime org-download org-bullets org-brain open-junk-file ob-restclient ob-http neotree nameless mwim multi-term move-text monokai-theme minitest markdown-toc magit-svn magit-gitflow macrostep lsp-vue lsp-ui lsp-javascript-typescript lsp-javascript-flow lorem-ipsum livid-mode link-hint launchctl json-navigator json-mode js2-refactor js-doc insert-shebang indent-guide impatient-mode imenus hungry-delete hl-todo highlight-thing highlight-parentheses highlight-numbers highlight-indentation helm-xref helm-themes helm-swoop helm-purpose helm-projectile helm-mode-manager helm-make helm-ls-git helm-gitignore helm-ghq helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ git-complete gh-md fuzzy font-lock+ flycheck-pos-tip flycheck-bashate flx-ido fish-mode fill-column-indicator feature-mode fancy-battery eyebrowse evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help emoji-cheat-sheet-plus emmet-mode embrace elisp-slime-nav editorconfig dumb-jump diminish diff-hl counsel-projectile company-web company-tern company-statistics company-shell company-restclient company-lua company-lsp company-emoji column-enforce-mode color-identifiers-mode clean-aindent-mode chruby centered-cursor-mode bundler browse-at-remote auto-yasnippet auto-highlight-symbol auto-complete-rst auto-compile aggressive-indent ace-window ace-link ace-jump-helm-line ac-ispell)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
