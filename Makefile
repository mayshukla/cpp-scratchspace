CXX = g++
CXXFLAGS = -std=c++14 -Wall -g -pthread -fopenmp
SRCDIR = src
SRCEXT = cpp
SOURCES = $(shell find $(SRCDIR) -type f -name *.$(SRCEXT))
TARGETDIR = bin
TARGETS = $(patsubst $(SRCDIR)/%,$(TARGETDIR)/%,$(SOURCES:.$(SRCEXT)=))

all: $(TARGETS)

$(TARGETDIR)/%: $(SRCDIR)/%.$(SRCEXT)
	mkdir -p $(TARGETDIR)
	$(CXX) $(CXXFLAGS) $< -o $@

clean:
	-rm -r $(TARGETDIR)
