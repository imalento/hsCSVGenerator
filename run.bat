java -Duser.language=en -classpath %homedrive%%homepath%/.m2/repository/xalan/xalan/2.7.2/xalan-2.7.2.jar;%homedrive%%homepath%/.m2/repository/xalan/serializer/2.7.2/serializer-2.7.2.jar;target/classes org.apache.xalan.xslt.Process -IN hsdata/CardDefs.xml -XSL src/main/xsl/toCSV.xsl -OUT cards.csv
