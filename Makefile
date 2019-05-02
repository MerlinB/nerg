public/app.js: output/.tree_built
	purs bundle './output/**/*.js' -m Main --main Main -o $@

output/.tree_built: $(shell find src -name *.purs -type f)
	psc-package build
	touch $@
