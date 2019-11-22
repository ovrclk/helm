DISTDIR = dist
SRCDIR  = charts
CHARTS  = $(patsubst $(SRCDIR)/%,%,$(wildcard $(SRCDIR)/*))

all: package index

index:
	helm repo index $(PWD)

package: $(patsubst %, package-%, $(CHARTS))

package-%:
	$(eval chart := $(@:package-%=%))
	helm package $(SRCDIR)/$(chart) -d $(DISTDIR)
