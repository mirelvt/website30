OBJ = www/static
HTML_SOURCES = $(wildcard content/*.html)
HTML_SOURCES += $(wildcard content/*/*.html)
HTML_OBJS = $(patsubst content/%.html, www/%.html, $(HTML_SOURCES))
CSS_SRCS = $(wildcard layout/*.src.css)
CSS_OBJS =  $(patsubst layout/%.src.css, $(OBJ)/%.min.css, $(CSS_SRCS))

ALL_OBJS = $(HTML_OBJS) $(CSS_OBJS)

all: $(ALL_OBJS)

www/%.html: content/%.html
	XML_CATALOG_FILES=DTD/catalog.xml xsltproc -o $@ layout/base.xsl $<

$(OBJ)/%.min.css: layout/%.src.css
	uglifycss --ugly-comments $< --output $@

clean:
	rm -f $(HTML_OBJS) $(CSS_OBJS)

.PHONY: all
