JROOT = java
JLOX = $(JROOT)/jlox/src
JTOOL = $(JROOT)/jlox/tool

generate-ast:
	@javac $(JTOOL)/GenerateAst.java
	@java -cp $(JROOT) jlox.tool.GenerateAst $(JLOX)
	@$(RM) $(JTOOL)/GenerateAst.class

java:
	javac $(JLOX)/*.java
	jar cfm jlox.jar $(JLOX)/manifest.mf $(JLOX)/*.class
	$(RM) $(JLOX)/*.class

clean:
	$(RM) $(JLOX)/*.class
