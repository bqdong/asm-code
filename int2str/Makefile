# Disable defult suffix rule: https://www.gnu.org/software/make/manual/html_node/Suffix-Rules.html
.SUFFIXES:

remove_suffix = $(subst .s, ,$1)
replace_suffix = $(subst .s,.o,$1)

ASM_FILES := $(wildcard *.s)
OBJS = $(call replace_suffix,$(ASM_FILES))
TARGETS = int2str

ifeq ($(DEBUG),0)
  DEBUG_FLAG =
else
  DEBUG_FLAG = -g
endif

all: $(TARGETS)

int2str: $(OBJS)
	ld $(DEBUG_FLAG) -o $@ $^

# -g: with debug info
%.o: %.s
	as $(DEBUG_FLAG) -O0 $< -o $@

%: %.o
	ld $(DEBUG_FLAG) $< -o $@

.PHONY: clean
clean:
	-rm -f *.out *.o $(ASM_FILES:.s=) $(TARGETS)
