TOPTARGETS  := all clean
SINGULARITY ?= singularity
RECIPES     ?= $(filter-out %.in,$(wildcard Singularity.*))
IMAGES      := $(patsubst Singularity.%,%.sif,$(RECIPES))
SUBDIRS     ?= $(patsubst %/Makefile,%,$(wildcard */Makefile))

all: $(IMAGES)

.PHONY: $(TOPTARGETS) $(SUBDIRS)

$(TOPTARGETS): $(SUBDIRS)

%.sif: Singularity.%
	$(SINGULARITY) build -F $@ $<

$(SUBDIRS):
	$(MAKE) -C $@ $(MAKECMDGOALS)
