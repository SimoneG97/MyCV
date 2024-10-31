.PHONY: build watch format

INPUT_FILE ?= ./assets/resume.yaml
OUTPUT_FILE ?= ./assets/resume.pdf
OUTPUT_IMAGE ?= ./assets/resume.png

build:
	typst compile --input filename=$(INPUT_FILE) --font-path ./assets/fonts resume.typ $(OUTPUT_FILE)
watch:
	find . -name '*.typ' -o -name '*.yaml' | entr -r make build INPUT_FILE=$(INPUT_FILE)
png:
	make build && magick convert -background white -alpha remove -alpha off -density 300 -depth 8 -quality 85  $(OUTPUT_FILE)[0] $(OUTPUT_IMAGE)

format:
	typstyle -i *.typ
