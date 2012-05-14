TESTDIR = tests
OBJDIR  = obj
COVDIR  = $(OBJDIR)/cov

GMAKE_OPTS = -p

all: build_tests

build_tests_c:
	$(MAKE) -C $(TESTDIR)/c

build_tests: build_tests_c
	@gnatmake $(GMAKE_OPTS) -Ptkmrpc_tests

tests: build_tests
	@$(OBJDIR)/$(TESTDIR)/test_runner

cov: build_tests
	@rm -f $(COVDIR)/*.gcda
	@gnatmake $(GMAKE_OPTS) -Ptkmrpc_tests.gpr -XBUILD="coverage"
	@$(COVDIR)/test_runner || true
	@lcov -c -d $(COVDIR) -o $(COVDIR)/cov.info
	@lcov -e $(COVDIR)/cov.info "$(PWD)/src/*.adb" -o $(COVDIR)/cov.info
	@genhtml --no-branch-coverage $(COVDIR)/cov.info -o $(COVDIR)

clean:
	@rm -rf $(OBJDIR)
	$(MAKE) -C $(TESTDIR)/c clean

.PHONY: build_tests build_tests_c clean cov tests
