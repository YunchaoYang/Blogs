# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line.
SPHINXOPTS    =
SPHINXBUILD   = sphinx-build
SPHINXPROJ    = 
SOURCEDIR     = docs
BUILDDIR      = build

# PDFBUILDDIR   = /tmp
# PDF           = ./NekIBM_doc.pdf

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

%: Makefile	
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

gh-pages:
	# git checkout -t origin/gh-pages
	rm -rf build _sources _static
	# git checkout $(BRANCH) source/ Makefile
	# git reset HEAD
	make html
	cp -rf build/html/* ./docs/
	# rm -rf source/ Makefile build/
	# touch .nojekyll
	git add -A
	git commit -m "Generated gh-pages for `git log -1 --pretty=short --abbrev-commit $(BRANCH) --`" && git push --force origin master

HTMLDIR     = html

ablog-build:
	ablog build -T -s $(SOURCEDIR) -w $(HTMLDIR)

ablog-serve:
	cd docs; ablog serve 

ablog-clean: $(SOURCEDIR)
	ablog clean