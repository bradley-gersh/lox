BUILD = build

JFLAGS = -Werror
JSOURCEROOT = java
JLOX = $(JSOURCEROOT)/jlox/src
JTOOL = $(JSOURCEROOT)/jlox/tool

JBUILDROOT = $(BUILD)/$(JROOT)

generate-ast:
	@mkdir -p $(BUILD)/$(JTOOL)
	javac $(JFLAGS) -d $(JBUILDROOT) $(JTOOL)/GenerateAst.java
	@java -cp $(JBUILDROOT) jlox.tool.GenerateAst $(JLOX)

java: $(JLOX)
	@$(MAKE) generate-ast
	@mkdir -p $(BUILD)/$(JLOX)
	javac $(JFLAGS) -d $(JBUILDROOT) $(JLOX)/*.java
	@jar cmf $(JLOX)/manifest.mf jlox.jar -C $(JBUILDROOT) jlox/src/

clean:
	@$(RM) -r $(BUILD)
