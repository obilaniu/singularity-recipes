include ../recurse.mk

all: micromamba

Singularity.alpine-bareuser: alpine-edge.sif
Singularity.alpine-user:     alpine-bareuser.sif
Singularity.alpine-lto:      alpine-user.sif aports.patch
Singularity.lto-deps:        alpine-lto.sif  aports.patch
Singularity.micromamba:      lto-deps.sif

micromamba: micromamba.sif
	singularity build --sandbox sandbox micromamba.sif
	@cp sandbox/usr/bin/micromamba .
	@rm -Rf sandbox
	zip -9 - aports.patch Singularity* >> micromamba

clean:
	rm -f $(IMAGES) micromamba
