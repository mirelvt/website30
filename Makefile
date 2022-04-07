OBJ = www/static
HTML_SOURCES = $(wildcard content/*.html)
HTML_SOURCES += $(wildcard content/*/*.html)
HTML_OBJS = $(patsubst content/%.html, www/%.html, $(HTML_SOURCES))
CSS_SRCS = $(wildcard layout/*.src.css)
CSS_OBJS =  $(patsubst layout/%.src.css, $(OBJ)/%.min.css, $(CSS_SRCS))

SASS_SRCS = $(wildcard layout/*.scss)
SASS_OBJS =  $(patsubst layout/%.scss, $(OBJ)/%.min.css, $(SASS_SRCS))

JS_SRCS = $(wildcard layout/*.src.js)
JS_OBJS = $(patsubst layout/%.src.js, $(OBJ)/%.min.js, $(JS_SRCS))

ALL_OBJS = $(HTML_OBJS) $(CSS_OBJS) $(JS_OBJS) $(SASS_OBJS)

all: $(ALL_OBJS)

www/%.html: content/%.html
	XML_CATALOG_FILES=DTD/catalog.xml xsltproc -o $@ layout/base.xsl $<

$(OBJ)/%.min.css: layout/%.src.css
	uglifycss --ugly-comments $< --output $@

$(OBJ)/%.min.css: layout/%.scss
	sass --no-source-map --style compressed $< $@


$(OBJ)/%.min.js: layout/%.src.js
	terser --comments -c hoist_vars=true,join_vars=true -m -o $@ $<

run:
	python3 -m http.server -d www 8000

clean:
	rm -f $(HTML_OBJS) $(CSS_OBJS) $(JS_OBJS)

.PHONY: all
