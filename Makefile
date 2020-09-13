include ../Makefile

# DOCKER_BUILD_CONTEXT=../
GCC_VER ?= gcc4
DOCKER_RUN_ARGS = --tmpfs /build:rw,exec,nosuid,mode=755,size=20G --mount type=tmpfs,target=/tmp/ -v $(CURDIR)/output:/output -e gcc_ver=$(GCC_VER)

pre-test: clean
	$(shell mkdir -p $(CURDIR)/output)
	$(shell chmod 777 $(CURDIR)/output)

test: TEST_ARGS=test

clean:
	$(shell rm -rf $(CURDIR)/output/*)