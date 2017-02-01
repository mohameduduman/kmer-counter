SHELL           := /bin/bash
PWD             := $(shell pwd)
CC               = gcc
CXX              = g++
UNAME           := $(shell uname -s)
BLDFLAGS         = -Wall -Wextra -std=c++14
BLDDFLAGS        = -Wall -Wextra -std=c++14 -pendantic
CXXFLAGS         = -D__STDC_CONSTANT_MACROS -D__STDINT_MACROS -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE=1 -O3 -static
INCLUDES         = /usr/include
LIBS             = -lpthread

ifeq ($(UNAME),Darwin)
	CC = clang
	CXX = clang++
	FLAGS += -Weverything
endif

all: kmer-counter

kmer-counter:
	$(CXX) -g $(BLDFLAGS) $(CXXFLAGS) -c kmer-counter.cpp -o kmer-counter.o
	$(CXX) -g $(BLDFLAGS) $(CXXFLAGS) -I$(INCLUDES) kmer-counter.o -o kmer-counter $(LIBS)

clean:
	rm -rf *~
	rm -rf kmer-counter
	rm -rf kmer-counter.o
