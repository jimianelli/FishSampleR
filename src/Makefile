
ifdef ComSpec
    RM=del /F /Q
    COPY=copy
else
    RM=rm -rf
    COPY=cp
endif

all: sam

sam: sam.tpl 
	@admb -g sam.tpl 

clean:
	@$(RM) sam.cpp
	@$(RM) sam.htp
	@$(RM) sam.obj
