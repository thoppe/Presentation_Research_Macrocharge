title  = "Protein Macrocharges"
author = "Travis Hoppe"
target = "macrocharge.md"

python_exec    = python
easy_pres_exec = ~/hg-repos/personal/markdown_latex_easypres/easy_pres.py

# May need to run twice on first pull to copy styles
args = --html_title $(title) --html_author $(author) 
all:
	$(python_exec) $(easy_pres_exec) $(target) --output index.html $(args)

edit:
	emacs $(target) &

commit:
	@-make push

check:
	aspell -c -H $(target)

push:
	make
	git status
	git add index.html Makefile
	git add $(target)
	git add css
	git add images
	git add *.md
	git commit -a
	git push

build_reveal_js:
	git submodule add https://github.com/hakimel/reveal.js.git reveal.js
	git submodule init 
	git submodule update

pull:
	git pull
view:
	chromium-browser index.html
clean:
	rm -rvf css js index.html