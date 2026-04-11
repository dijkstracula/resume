PANDOC   ?= pandoc
CSS      := resume.css
SRC      := resume.md
HTML_OUT := resume.html
PDF_OUT  := resume.pdf

PANDOC_HTML_FLAGS := \
	--standalone \
	--embed-resources \
	--css=$(CSS) \
	--metadata title="Nathan Taylor — Resume" \
	--from=markdown \
	--to=html5

PANDOC_PDF_FLAGS := \
	--standalone \
	--css=$(CSS) \
	--pdf-engine=weasyprint \
	--from=markdown \
	--to=html5

.PHONY: all html pdf clean

all: html pdf

html: $(HTML_OUT)

pdf: $(PDF_OUT)

$(HTML_OUT): $(SRC) $(CSS)
	$(PANDOC) $(PANDOC_HTML_FLAGS) -o $@ $<

$(PDF_OUT): $(SRC) $(CSS)
	$(PANDOC) $(PANDOC_PDF_FLAGS) -o $@ $<

clean:
	rm -f $(HTML_OUT) $(PDF_OUT)
