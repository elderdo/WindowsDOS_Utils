JFLAGS = -g
JC = javac
.SUFFIXES: .java .class
.java.class:
	$(JC) $(JFLAGS) $*.java

CLASSES = \
        DBConnection.java

TestDBConnection.class: TestDBConnection.java $(CLASSES)

TestDBConnection.jar: TestDBConnection.class $(CLASSES)
	jar uf TestDBConnection.jar TestDBConnection.class $(CLASSES)

default: classes

classes: $(CLASSES:.java=.class)

clean:
	$(RM) *.class
