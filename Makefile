.SUFFIXES: .txt .conf .dctx .dctxc

DIC=polcdic-kaomoji.txt polcdic-ff11emote.txt
DCTX=$(DIC:.txt=.dctx)
DCTXC=$(DCTX:.dctx=.dctxc)

DIST_ZIP=polcdic.zip

RUBY=ruby
TXT2DCTX=$(RUBY) txt2dctx.rb
GCAB=gcab
ZIP=zip -9

all: $(DCTX)

cab: $(DCTXC)

dist: $(DIST_ZIP)

clean:
	$(RM) $(DCTX) $(DCTXC) $(DIST_ZIP)

%.dctx: %.txt %.conf
	$(TXT2DCTX) -o $@ --config $*.conf $<

%.dctxc: %.dctx
	$(GCAB) -cz $@ $<

$(DIST_ZIP): $(DIC) $(DCTX)
	$(ZIP) $@ $^
