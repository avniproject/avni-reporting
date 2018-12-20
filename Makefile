# <makefile>
# Objects: metadata, package, env (code platform), rules
# Actions: clean, build, deploy, test
help:
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
	for help_line in $${help_lines[@]}; do \
	    IFS=$$'#' ; \
	    help_split=($$help_line) ; \
	    help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
	    help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
	    printf "%-30s %s\n" $$help_command $$help_info ; \
	done
# </makefile>


# <env> (Code Environment)
deps:
	cd utilities && npm install

test_env: ## Run unit tests
	cd utilities && npm test
# </env>

run_repeatable_migrations_prod:
	# to be tested
	 ssh -i ~/.ssh/openchs-infra.pem -f -L 17777:serverdb.openchs.org:5432 prod-server-openchs sleep 15; \
	 	psql -U openchs -h localhost -p 17777 -d openchs < ./utilities/views/views.sql

run_repeatable_migrations_dev:
	-psql -U openchs -h localhost -p 5432 -d openchs < ./utilities/views/views.sql
