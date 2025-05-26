# Disable defult suffix rule: https://www.gnu.org/software/make/manual/html_node/Suffix-Rules.html
.SUFFIXES:

remove_suffix = $(subst .s, ,$1)
replace_suffix = $(subst .s,.o,$1)

ASM_FILES := $(wildcard *.s)
OBJS = $(call replace_suffix,$(ASM_FILES))
TARGETS = int2str

all: $(TARGETS)

int2str: $(OBJS)
	ld -g -o $@ $^

# -g: with debug info
%.o: %.s
	as -g -O0 $< -o $@

%: %.o
	ld -g $< -o $@

.PHONY: clean
clean:
	-rm -f *.out *.o $(ASM_FILES:.s=) $(TARGETS)
