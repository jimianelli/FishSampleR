EXEC = sam
ARGS = -nox -io
DIST = ../../src/

ifdef ComSpec
    RM=del /F /Q
else
    RM=rm -rf
endif

all: both

$(EXEC): $(DIST)$(EXEC).tpl
	ln -sf $(DIST)$(EXEC) $@

$(DIST)$(EXEC).tpl:
	$(MAKE) --directory=../../src

run: $(EXEC)
	./$(EXEC) $(ARGS)

both: $(EXEC)
	./$(EXEC) $(ARGS)
