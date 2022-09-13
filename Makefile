install:
	git submodule update --remote --merge
dev:
	hugo server -D
build:
	hugo -D
post:
	hugo new content/blog/posts/$(name).md