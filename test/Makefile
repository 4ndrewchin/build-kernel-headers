PWD=$(shell pwd)
obj-m += mymod.o
ARCH=x86
KDIR ?= $(PWD)/../headers/
#KDIR ?= $(PWD)/../linux/
EXTRA_CFLAGS := -DDEBUG -m32

all:
	make --debug -C $(KDIR) ARCH=$(ARCH) M=$(PWD) modules
clean:
	make -C $(KDIR) M=$(PWD) clean
