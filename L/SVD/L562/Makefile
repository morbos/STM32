TARGETS := \
	hash

XMLs := $(patsubst %, %.xml, $(TARGETS))
default: $(TARGETS)
hash:
	~/ruby/txt2svd.rb --base 0x420C0400 --name HASH \
		--interrupt="[\"%s\"]" \
		--interrupt_num="[96]" \
		hash.txt >hash.xml1
	cat hash.xml1 sec_hash.xml1 >hash.xml
