EMC=emc
ENV=test_env
BIN=block catcher thrower nonconforming_throw unwelcome_throw attached \
	catchers monitor_throw monitor_catchers throwers

all: clean $(BIN)

%:%.m
	@(echo "load $(ENV)" && echo $^) | $(EMC)

clean:
	rm -f *.x *.oid *.idb *.opd *.ats *.oid $(ENV)
