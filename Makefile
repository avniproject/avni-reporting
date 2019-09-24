deps:
	cd utilities && npm install

test_env: ## Run unit tests
	cd utilities && npm test

generate: ; cd utilities && node index.js ; cd -

random-impl=demo

run_repeatable_migrations_prod:
	ssh -i ~/.ssh/openchs-infra.pem -f -L 15432:serverdb.openchs.org:5432 prod-server-openchs sleep 15; \
		make run_repeatable_migrations_at_port port=15432

run_repeatable_migrations_staging:
	ssh -i ~/.ssh/openchs-infra.pem -f -L 15432:stagingdb.openchs.org:5432 staging-server-openchs sleep 15; \
		make run_repeatable_migrations_at_port port=15432

run_repeatable_migrations_prerelease:
	ssh -i ~/.ssh/openchs-infra.pem -f -L 15432:prerelasedb.openchs.org:5432 prerelease-server-openchs sleep 15; \
		make run_repeatable_migrations_at_port port=15432

run_repeatable_migrations_uat:
	ssh -i ~/.ssh/openchs-infra.pem -f -L 15432:uatdb.openchs.org:5432 uat-server-openchs sleep 15; \
		make run_repeatable_migrations_at_port port=15432 random-impl=$(random-impl)

#setup ssh reverse proxy before doing this
#lbp server should be accessible at port 19999
run_repeatable_migrations_lbp_server:
	ssh -f -L 15432:localhost:5432 admin@localhost -p 19999 sleep 15; \
		make run_repeatable_migrations_at_port port=15432 random-impl=lokbiradari_prakalp

run_repeatable_migrations_at_port:
	@bash ./migrations/R__All.sh $(random-impl) | psql -U openchs -h localhost -p $(port) -d openchs

run_repeatable_migrations_dev:
	make run_repeatable_migrations_at_port port=5432
