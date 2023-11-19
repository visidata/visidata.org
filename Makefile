#!/usr/bin/make
TAILWIND_ARGS := -i styles/tailwind.css -c styles/tailwind.config.js -o _site/css/style.css
VIRTUALENV := venv/bin/activate

# Default target
.PHONY: all
all: build

# Dependencies
.PHONY: install pip
install: pip node_modules visidata
venv: requirements.txt
	@echo "[make] Creating virtual environment in venv"
	python3 -m venv venv
pip:
	@echo "[make] Installing Python dependencies"
	@if [ -f $(VIRTUALENV) ]; then \
		. $(VIRTUALENV) && pip install -r requirements.txt; \
	else \
		python3 -m pip install -r requirements.txt; \
	fi
node_modules: package.json package-lock.json
	@echo "[make] Installing node dependencies"
	npm install
visidata:
	@echo "[make] Cloning VisiData for docs"
	git clone https://github.com/saulpw/visidata.git
	cd visidata && git checkout stable

# Targets
.PHONY: build dev debug docs docker-image docker-run
build: docs
	@echo "[make] Building site"
	npx @11ty/eleventy --quiet
	@echo "[make] Building CSS"
	npx tailwindcss ${TAILWIND_ARGS} --minify
dev: docs
	npx @11ty/eleventy --serve --incremental --quiet & \
	npx tailwindcss ${TAILWIND_ARGS} -w
debug: docs
	DEBUG=Eleventy*	npx @11ty/eleventy --serve & \
	npx tailwindcss ${TAILWIND_ARGS} -w
docs: site/docs/*.html _site/docs/api
site/docs/*.html:
	@echo "[make] Building docs"
	cd visidata && git checkout stable && git pull && cd ..
	./mkdocs.sh
	rm -rf site/docs/*.html-rest.md
_site/docs/api:
	@echo "[make] Building API docs"
	cd visidata && git checkout stable && git pull && cd ..
	@if [ -f $(VIRTUALENV) ]; then \
	. $(VIRTUALENV) && sphinx-build -b html visidata/docs/api _site/docs/api; \
	else \
	sphinx-build -b html visidata/docs/api _site/docs/api; \
	fi

docker-image:
	docker build -t visidata.org .
docker-run:
	docker run -p 8080:8080 -it visidata.org

# Clean
.PHONY: clean clean-pip clean-npm clean-vd clean-docs clean-build
clean: clean-pip clean-npm clean-vd clean-docs clean-build
clean-pip:
	rm -rf venv
clean-npm:
	rm -rf node_modules
clean-vd:
	rm -rf visidata
clean-docs:
	rm -rf site/docs/*.html site/docs/*.md site/docs/api _site/docs
clean-build:
	rm -rf _site
