install:
	git submodule update --remote --merge
dev:
	hugo server -D
build:
	hugo -D
post:
	hugo new --clock $(date)T00:00:00.00+07:00 content/blog/posts/$(date)-$(name).md
deploy: | build
	surge --project public --domain ngosangns.com