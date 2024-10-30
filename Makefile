.PHONY: build watch

# Target to run the build script
build:
	./build.sh

# Target to watch resume.typ and re-run build
watch:
	find . -name '*.typ' | entr -r make build

format:
	typstyle -i *.typ
