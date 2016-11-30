.PHONY: all
all: jsbuild

export TOP:=$(realpath $(shell pwd)/$(dir $(firstword $(MAKEFILE_LIST))))
export GOPATH:=$(realpath $(TOP)/../../../..)

-include $(GOPATH)/src/gopkg.in/make.v1/batteries.mk
$(GOPATH)/src/gopkg.in/make.v1/batteries.mk:
	$(GO) get gopkg.in/make.v1/gomake

.PHONY: jsbuild
jsbuild: $(GOPHERJS) vendor/.gopherjs
	$(GOPHERJS) build

# gopherjs has a problem when it itself is vendored
# so here, we use glide to pull down a copy of all dependencies, ensure they're
# copied into GOPATH, then remove the vendored copy
# - yeah, it's kind of a hack - hopefully better once gopherjs/gopherjs#415 is fixed
vendor/.gopherjs: vendor
	rm -rf vendor/github.com/gopherjs/gopherjs
	touch $@
