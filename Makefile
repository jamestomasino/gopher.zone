new:
	@test -n "$(title)" || read -p "Enter a title for your post: " title; \
	export title_slug=`echo $${title:-Untitled} | sed -E -e 's/[^[:alnum:]]/-/g' -e 's/^-+|-+$$//g' | tr -s '-' | tr A-Z a-z`; \
	export post_path=content/posts/$$title_slug.md; \
	echo "Creating $$post_path"; \
	echo "---"                                                  >  $$post_path; \
	echo "date: `date +"%Y-%m-%d %H:%M:%S %z"`"                 >> $$post_path; \
	echo "title: \"$$title\""                                   >> $$post_path; \
	echo "tags: "                                               >> $$post_path; \
	echo "  - meta "                                            >> $$post_path; \
	echo "---"                                                  >> $$post_path; \
	echo " "                                                    >> $$post_path; \
	echo " "                                                    >> $$post_path; \
	echo " "                                                    >> $$post_path; \
	echo " "                                                    >> $$post_path; \
	echo "<!--  vim: set shiftwidth=4 tabstop=4 expandtab: -->" >> $$post_path; \
	vim $$post_path

serve:
	hugo server

build:
	hugo

.PHONY: new_post serve build
