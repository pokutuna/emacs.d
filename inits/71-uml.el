
(el-get-bundle plantuml-mode)

(use-package plantuml-mode
  :interpreter "planuml"
  :mode (("\\.puml$" . plantuml-mode)
         ("\\.plantuml$" . plantuml-mode))
  )
