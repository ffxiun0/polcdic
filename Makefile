.SUFFIXES: .txt .conf .dctx .dctxc

TXT2DCTX=./txt2dctx
MAKECAB=makecab

DCTX=polcdic-kaomoji.dctx polcdic-ff11emote.dctx
DCTXC=$(DCTX:.dctx=.dctxc)

all: $(DCTX)

cab: $(DCTXC)

clean:
	$(RM) $(DCTX)
	$(RM) $(DCTXC)

%.dctx: %.txt %.conf
	$(TXT2DCTX) -o $@ --config $*.conf $<

%.dctxc: %.dctx
	$(MAKECAB) $< $@
