.SUFFIXES: .txt .conf .dctx .dctxc

RUBY=ruby
TXT2DCTX=$(RUBY) txt2dctx.rb
MAKECAB=makecab

DIC=polcdic-kaomoji.txt polcdic-ff11emote.txt
DCTX=$(DIC:.txt=.dctx)
DCTXC=$(DCTX:.dctx=.dctxc)

ZIP=polcdic.zip
ZIP_FILES=$(DIC) $(DCTX)

all: $(DCTX)

cab: $(DCTXC)

zip: $(ZIP)

clean:
	$(RM) $(DCTX)
	$(RM) $(DCTXC)
	$(RM) $(ZIP)

%.dctx: %.txt %.conf
	$(TXT2DCTX) -o $@ --config $*.conf $<

%.dctxc: %.dctx
	$(MAKECAB) $< $@

$(ZIP): $(ZIP_FILES)
	zip -9 $@ $(ZIP_FILES)
