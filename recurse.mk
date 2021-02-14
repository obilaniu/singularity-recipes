TOPTARGETS  := all clean
SINGULARITY ?= singularity
RECIPES     ?= $(patsubst Singularity.%.in,Singularity.%,$(wildcard Singularity.*))
IMAGES      := $(patsubst Singularity.%,%.sif,$(RECIPES))
SUBDIRS     ?= $(patsubst %/Makefile,%,$(wildcard */Makefile))

all: $(IMAGES)

.PHONY: $(TOPTARGETS) $(SUBDIRS)

$(TOPTARGETS): $(SUBDIRS)

%.sif: Singularity.%
	$(SINGULARITY) build -F $@ $<

$(SUBDIRS):
	$(MAKE) -C $@ $(MAKECMDGOALS)
