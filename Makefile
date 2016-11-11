.PHONY: all
all: build

export TOP:=$(realpath $(shell pwd)/$(dir $(firstword $(MAKEFILE_LIST))))
export GOPATH:=$(realpath $(TOP)/../../../..)

-include $(GOPATH)/src/github.com/boyvinall/gomake/gotools.mk
$(GOPATH)/src/github.com/boyvinall/gomake/gotools.mk:
	$(GO) get github.com/boyvinall/gomake

.PHONY: all
build: $(GOPHERJS)
	$(GOPHERJS) build

