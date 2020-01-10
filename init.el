(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			   ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar my/packages '(
		      ;; --- Auto-completion ---
		      company
		      ;; --- Better Editor ---
		      hungry-delete
		      swiper
		      counsel
		      smartparens
		      ;; --- Major Mode ---
		      js2-mode
		      ;; --- Minor Mode ---
		      exec-path-from-shell
		      ;; --- Themes ---
		      monokai-theme
		      ;; solarized-theme
		      smex
		      ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
  (loop for pkg in my/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (my/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg my/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))(package-initialize) ;;告诉emacs到哪里查找插件



(tool-bar-mode -1) ;;关闭工具栏功能
(scroll-bar-mode -1) ;;关闭el滚动条功能
(electric-indent-mode -1) ;;关闭自动缩进功能
(global-linum-mode t) ;;开启行号给功能
(setq inhibit-splash-screen t) ;;关闭开始画面

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el")
  )

(global-set-key (kbd "<f2>") 'open-my-init-file) ;;按下f2按键打开我的emacs的配置文件

(global-company-mode t)

(recentf-mode t) ;;打开最近的文件

(setq-default cursor-type 'bar) ;;改变光标样式

(require 'org);;引入文件 org

(setq org-src-fontift-natively t) ;;org文件里的代码高亮

(require 'recentf) ;;引入文件 recentf

(recentf-mode 1) 

(setq recentf-max-menu-items 25) ;;显示当前打开的列表最多有25个

(global-set-key "\C-x\ \C-r" 'recentf-open-files) ;;打开当前文件

(delete-selection-mode t) ;; 开启块代码替换的mode

(setq initial-frame-alist (quote((fullscreen . maximized)))) ;;打开emacs就是软件全屏

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode) ;;给emacs开启括号结构匹配

(global-hl-line-mode t) ;;给文件夹光标所在行进行高亮

(load-theme 'monokai t) ;;emacs开启时加载主题;

(require 'hungry-delete)
(global-hungry-delete-mode)   ;;一次行删除多余的空格



(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)


(require 'smartparens-config)
;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)

;;config js2-mode for js files

(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))  ;;所有的类型是javascript文件的话用js2-mode打开

(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-f") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)


(setq org-agenda-files '("~/org"))
(global-set-key (kbd "C-c a" ) 'org-agenda)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.08)
 '(company-minimum-prefix-length 1)
 '(package-selected-packages (quote (company))))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-external-variable ((t (:foreground "gray")))))
(put 'upcase-region 'disabled nil)