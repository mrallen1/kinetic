
PREFIX:=../
DEST:=$(PREFIX)$(PROJECT)

REBAR=rebar3

.PHONY: all doc clean test dialyzer

all:
	@$(REBAR) get-deps compile

edoc:
	@$(REBAR) doc

test:
	@rm -rf _build/test
	@$(REBAR) eunit

clean:
	@$(REBAR) clean

dialyzer:
	@$(REBAR) analyze

xref:
	@$(REBAR) xref

