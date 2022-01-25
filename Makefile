jlox: jlox/*.java
	java jlox/*
	javac jlox/*.java
	jar cf jlox.jar jlox/*.class
	$(RM) jlox/*.class

clean:
	$(RM) jlox/*.class
