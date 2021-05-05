
SUBDIRS = \
			3rd_party_emissary \
			emissary_object \
			merge_with \
			move_welcoming_process \
			node_discovery \
			welcome_expression
all:
	for d in $(SUBDIRS) ; do \
		(cd $$d ; make) ; \
	done

clean:
	for d in $(SUBDIRS) ; do \
		(cd $$d ; make clean) ; \
	done