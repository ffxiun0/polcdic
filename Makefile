.SUFFIXES: .txt .conf .dctx .dctxc

TXT2DCTX=./txt2dctx
MAKECAB=makecab

DCTX=polcdic-kaomoji.dctx
DCTXC=$(DCTX:.dctx=.dctxc)

all: $(DCTX)

cab: $(DCTXC)

clean:
	$(RM) $(DCTX)
	$(RM) $(DCTXC)

%.dctx: %.txt %.conf
	$(TXT2DCTX) --config $*.conf < $< > $@ || $(RM) $@

%.dctxc: %.dctx
	$(MAKECAB) $< $@
