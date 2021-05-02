EMC=emc
ENV=test_env
BIN=nodeup catcher thrower non_conforming_thrower unwelcome_thrower

all: clean $(BIN)

%:%.m
	@(echo "load $(ENV)" && echo $^) | $(EMC)

clean:
	rm -f *.x *.oid *.idb *.opd *.ats *.oid $(ENV)
