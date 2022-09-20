install:
	git clone https://github.com/adityatelange/hugo-PaperMod themes/PaperMod --depth=1
dev:
	hugo server -D
build:
	hugo -D
post:
	hugo new --clock $(date)T00:00:00.00+07:00 content/blog/posts/$(date)-$(name).md
deploy: | build
	surge --project public --domain ngosangns.com
deployg: | build
	firebase deploy