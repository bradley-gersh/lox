java:
	javac jlox/*.java
	jar cfm jlox.jar jlox/manifest.mf jlox/*.class
	$(RM) jlox/*.class

clean:
	$(RM) jlox/*.class
