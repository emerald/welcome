EMC=emc
ENV=test_env
BIN=nodeup invalid_merge merge concurrent_merge kilroy

all: clean $(BIN)

%:%.m
	@(echo "load $(ENV)" && echo $^) | $(EMC)

clean:
	rm -f *.x *.oid *.idb *.opd *.ats *.oid $(ENV)
