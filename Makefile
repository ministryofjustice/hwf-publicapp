.PHONY: test-security-cucumber run-passive-zap-test export-zap-report stop rm clean

SPECS_PATH = ./tests/nightwatch/specs

ifdef spec
	specific_test = -t ${SPECS_PATH}/${spec}.js
endif

ifdef browser
	environment = --env ${browser}
endif

define container-id-for
	$(shell docker ps -f 'label=com.docker.compose.project=$(1)' -f 'label=com.docker.compose.service=$(2)' -q)
endef

clean: stop rm

test-security-cucumber: run-passive-zap-test export-zap-report

export-zap-report:
	# Generate the HTML report
	docker exec $(call container-id-for,test,zap) zap-cli -p 8080 report -f html -o /tmp/test-security-cucumber-result.html
	# Get the report
	docker cp $(call container-id-for,test,zap):/tmp/test-security-cucumber-result.html .
	@echo "Open test-security-cucumber-result.html in your browser"

run-passive-zap-test:
	docker-compose -p test up --build test-security

start-web-app:
	docker-compose -p publicapp up -d --build web

stop: ## Stop all dev and test containers
	docker-compose -p test stop

rm: ## Remove all dev and test containers
	docker-compose -p test rm -f

	./nightwatch -c tests/nightwatch/local.json ${environment} ${specific_test}
test-chrome:
	./nightwatch -c tests/nightwatch/local.json --env chrome ${specific_test}
test-firefox:
	./nightwatch -c tests/nightwatch/local.json --env firefox ${specific_test}
