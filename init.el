(package-initialize)

(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'init-packages)

(setq ring-bell-function 'ignore)

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


(recentf-mode t) ;;打开最近的文件

(setq-default cursor-type 'bar) ;;改变光标样式

(setq make-backup-files nil)
(setq auto-save-default nil)

(require 'org);;引入文件 org
(global-set-key (kbd "C-+") 'text-scale-increase) ;;ctrl加上+可以让文本字体变大
(global-set-key (kbd "C--") 'text-scale-decrease) ;;ctrl加上-可以让文本字体变小
(global-set-key (kbd "C-0") 'text-scale-adjust) ;;字体变成普通情况

(setq org-src-fontift-natively t) ;;org文件里的代码高亮

(require 'recentf) ;;引入文件 recentf

(recentf-mode 1) 

(setq recentf-max-menu-items 25) ;;显示当前打开的列表最多有25个

(global-set-key "\C-x\ \C-r" 'recentf-open-files) ;;打开当前文件

(delete-selection-mode t) ;; 开启块代码替换的mode

(setq initial-frame-alist (quote((fullscreen . maximized)))) ;;打开emacs就是软件全屏

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode) ;;给emacs开启括号结构匹配

(global-hl-line-mode t) ;;给文件夹光标所在行进行高亮





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

(abbrev-mode t);;;添加快捷键的模块
(define-abbrev-table 'global-abbrev-table '(
					    ("gst" "(global-set-key (kbd \"\") )") ;;;输入gst,然后按下空格键,就会补全一些东西
					    ))


(require 'smartparens-config)(require 'smartparens-config)

;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)


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
 ;; custom-set-faces was added by qqq
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-external-variable ((t (:foreground "gray")))))
(put 'upcase-region 'disabled nil)
