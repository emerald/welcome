build:
	./scripts/build.sh

clean:
	rm -f -r vm/$(EMERALDARCH)
	cd $(EMERALDROOT)/EC ; emmake reset ; rm -f bestCP execCP bestCP.bak
	cd $(EMERALDROOT)/ccalls ; emmake clean ; rm -f xsed