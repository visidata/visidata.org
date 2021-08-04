
build:
	npm run build

build-docs:
	npm run build:docs

setup:
	npm install

server: build-docs build
	npm run dev
