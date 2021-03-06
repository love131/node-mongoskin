MONGOSKIN_REPLICASET = false
NODE_BIN=./node_modules/.bin
MOCHA=$(NODE_BIN)/mocha
COVERALLS=$(NODE_BIN)/coveralls

test:
	@$(MOCHA) -R spec

test-debug:
	@$(MOCHA) -R spec debug

test-replicaset:
	@MONGOSKIN_REPLICASET=true $(MOCHA)

test-cov:
	@$(MOCHA) -R html-cov > coverage.html

coveralls:
	npm run coverage
	cat ./coverage/lcov.info | ./node_modules/.bin/coveralls

test-watch:
	@$(MOCHA) -w -R dot --growl

.PHONY: test-cov test-replicaset test test-debug
