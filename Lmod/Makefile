include ../recurse.mk

LMOD_SYSTEM_DEFAULT_MODULES ?= StdEnv
LMOD_STANDARD_MODULE        ?= $(LMOD_SYSTEM_DEFAULT_MODULES)
LMOD_STANDARD_MODULE        := $(shell echo "$(LMOD_STANDARD_MODULE)" | cut -d : -f 1)
LMOD_PREFIX                 ?= $(HOME)/.local
LMOD_PREFIX                 := $(LMOD_PREFIX:/=)
LMOD_CONFIG_PREFIX          ?= $(LMOD_PREFIX:/=)/lmod/config
LMOD_CONFIG_PREFIX          := $(LMOD_CONFIG_PREFIX:/=)
LMOD_ETC_PREFIX             ?= /etc
LMOD_ETC_PREFIX             := $(LMOD_ETC_PREFIX:/=)


Singularity.Lmod-lmod: Singularity.Lmod-lmod.in
	sed -e "s|@LMOD_PREFIX@|$(LMOD_PREFIX)|g" \
	    -e "s|@LMOD_CONFIG_PREFIX@|$(LMOD_CONFIG_PREFIX)|g" \
	    -e "s|@LMOD_ETC_PREFIX@|$(LMOD_ETC_PREFIX)|g" \
	    -e "s|@LMOD_SYSTEM_DEFAULT_MODULES@|$(LMOD_SYSTEM_DEFAULT_MODULES)|g" \
	    -e "s|@LMOD_STANDARD_MODULE@|$(LMOD_STANDARD_MODULE)|g" \
	       < $< > $@

Lmod-download.sif: Lmod-alpine.sif lpeg-*.patch
Lmod-dev.sif:      Lmod-download.sif
Lmod-lua.sif:      Lmod-download.sif Lmod-dev.sif lua-*.patch
Lmod-lmod.sif:     Lmod-lua.sif      Lmod-alpine.sif config/*

clean:
	rm -f $(IMAGES) Singularity.Lmod-lmod
