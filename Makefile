TESTDIR = tests
OBJDIR  = obj

GMAKE_OPTS = -p

all: build_tests

build_tests_c:
	$(MAKE) -C $(TESTDIR)/c

build_tests: build_tests_c
	@gnatmake $(GMAKE_OPTS) -Ptkmrpc_tests

tests: build_tests
	@$(OBJDIR)/$(TESTDIR)/test_runner

clean:
	@rm -rf $(OBJDIR)
	$(MAKE) -C $(TESTDIR)/c clean

.PHONY: build_tests build_tests_c clean tests
