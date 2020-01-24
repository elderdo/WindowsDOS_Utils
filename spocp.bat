SET LIB=D:\eclipse-spoworkspace\dlaspo\lib
SET BUILD=D:\eclipse-spoworkspace\dlaspo\build\classes
SET JDBCUTIL=%BUILD%\com\mcasolutions\util\JdbcUtil.class
SET JDBCUTILSRC=D:\eclipse-spoworkspace\dlaspo\src\com\mcasolutions\util\JdbcUtil.java
SET STRUTILSRC=D:\eclipse-spoworkspace\dlaspo\src\com\mcasolutions\util\StringUtil.java
SET OJDBC=ojdbc6.jar
SET COMMONS=apache-commons-lang.jar
SET DLAJAR=dla.jar
SET SERVLET=javax.servlet-api-3.0.1.jar
SET JSPJAR=javax.servlet.jsp.jar
SET LOG4J=log4j-1.2.14.jar
SET TAGLIB=taglibs-standard-impl-1.2.5.jar
SET LOGGING=commons-logging-1.2.jar
SET CLASSPATH=%LIB%\%DLAJAR%
SET CLASSPATH=%LIB%\%SERVLET%;%CLASSPATH%
SET CLASSPATH=%LIB%\%JSPJAR%;%CLASSPATH%
SET CLASSPATH=%LIB%\%LOG4J%;%CLASSPATH%
SET CLASSPATH=%LIB%\%TAGLIB%;%CLASSPATH%
SET CLASSPATH=%LIB%\%LOGGING%;%CLASSPATH%
SET CLASSPATH=%JDBCUTIL%;%CLASSPATH%
SET CLASSPATH=%LIB%\%COMMONS%;%CLASSPATH%
SET CLASSPATH=%LIB%\%OJDBC%;%CLASSPATH%
SET ENCRYPTDIR=D:\eclipse-spoworkspace\mesanetherlandsspo\ImportedClasses\com\mcasolutions\util\encryption

SET CLASSPATH=%ENCRYPTDIR%\PasswordEncrypter.class;%CLASSPATH%
SET UTILS=D:\eclipse-spoworkspace\dlaspo\build\classes\com\mcasolutions\util
SET CLASSPATH=%UTILS%\PreparedSqlBuilder.class;%CLASSPATH%