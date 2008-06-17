#
# Top-level Makefile.
# Builds all iconsets.
#

ICONSETS = \
	crystal-aim \
	crystal-gadu \
	crystal-icq \
	crystal-msn \
	crystal-roster \
	crystal-service \
	crystal-sms \
	crystal-yahoo
JISPS=$(foreach iconset,$(ICONSETS),$(addsuffix .jisp,$(iconset)))
PREVIEWS=$(foreach iconset,$(ICONSETS),$(addsuffix _preview.png,$(iconset)))
UPLOAD_TARGET=lucy:public_html/psi/crystal

# Default
all: $(JISPS) $(PREVIEWS)

# Cleanup
clean: 
	for iconset in $(ICONSETS); do $(MAKE) -C $$iconset clean; done
	-rm -rf $(JISPS) $(PREVIEWS)

# Recursively build iconsets
.PHONY: $(ICONSETS)
$(ICONSETS): 
	make -C $@	

# Build the jisp
%.jisp: %
	-rm -f $@
	zip -q -r $@ $< -x \*.svn\* -x \*.xvpics\* -x \
		\*/Makefile -x \*.in.\* \*.in

# Create previews
%_preview.png: %
	montage -background none -geometry 16x16 -tile 9 \
		$(filter-out %.in.png %.spinning.png %.dimming.png,$(wildcard $</*.png)) $@


# Ad-hoc upload rule
upload: all
	scp $(JISPS) lucy:public_html/psi/crystal
	scp $(PREVIEWS) $(UPLOAD_TARGET)/previews
