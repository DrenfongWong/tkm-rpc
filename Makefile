PREFIX   ?= $(HOME)/libraries
TESTDIR   = tests
OBJDIR    = obj
COVDIR    = $(OBJDIR)/cov
LIBDIR    = lib
GPR_FILES = gnat/*.gpr

BUILD_OPTS = -p

all: build_tests

build_tests: build_testclient
	@gprbuild $(BUILD_OPTS) -Ptkmrpc_tests

build_clientlib:
	@gprbuild $(BUILD_OPTS) -Ptkmrpc_clientlib

build_testclient: build_clientlib
	@gprbuild $(BUILD_OPTS) -Ptkmrpc_testclient

tests: build_tests
	@$(OBJDIR)/$(TESTDIR)/test_runner

install: install_lib

install_lib: build_clientlib
	install -d $(PREFIX)/lib/gnat
	install -d $(PREFIX)/lib/tkmrpc
	install -d $(PREFIX)/include/tkmrpc/c/tkm
	install -d $(PREFIX)/include/tkmrpc/common
	install -d $(PREFIX)/include/tkmrpc/client
	install -d $(PREFIX)/include/tkmrpc/server
	install -m 644 src/client/* $(PREFIX)/include/tkmrpc/client
	install -m 644 src/server/* $(PREFIX)/include/tkmrpc/server
	install -m 644 specs/ada/common/* $(PREFIX)/include/tkmrpc/common
	install -m 644 specs/ada/client/* $(PREFIX)/include/tkmrpc/client
	install -m 644 specs/ada/server/* $(PREFIX)/include/tkmrpc/server
	install -m 644 specs/c/tkm/*.[ch] $(PREFIX)/include/tkmrpc/c/tkm
	install -m 444 $(LIBDIR)/*.ali $(PREFIX)/lib/tkmrpc
	install -m 644 $(GPR_FILES) $(PREFIX)/lib/gnat
	install -m 444 $(LIBDIR)/libtkmrpc.a $(PREFIX)/lib

cov: build_tests
	@rm -f $(COVDIR)/*.gcda
	@gprbuild $(BUILD_OPTS) -Ptkmrpc_tests.gpr -XBUILD="coverage"
	@$(COVDIR)/test_runner || true
	@lcov -c -d $(COVDIR) -o $(COVDIR)/cov.info
	@lcov -e $(COVDIR)/cov.info "$(PWD)/src/*.adb" -o $(COVDIR)/cov.info
	@genhtml --no-branch-coverage $(COVDIR)/cov.info -o $(COVDIR)

clean:
	@rm -rf $(OBJDIR)

.PHONY: build_clientlib build_testclient build_tests clean cov install \
	install_lib tests
