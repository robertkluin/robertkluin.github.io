
HUGO = hugo
THEME = purehugo

all: drafts

ready:
	$(HUGO) --theme=$(THEME)

publish: ready
	git add -A public
	git commit -m "Update public site content"
	git push origin content
	git subtree push --prefix=public git@github.com:robertkluin/robertkluin.github.io.git master

drafts:
	$(HUGO) --theme=$(THEME) --buildDrafts

write:
	$(HUGO) --theme=$(THEME) --buildDrafts --watch

.PHONY: all ready publish drafts write
