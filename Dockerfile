# Dockerfile

FROM jupyter/pyspark-notebook

USER root

# Instalar wget e conectores GCS para Hadoop
RUN apt-get update && apt-get install -y --no-install-recommends wget \
    && wget https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-common/3.2.0/hadoop-common-3.2.0.jar \
    && wget https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-gcs/3.2.0/hadoop-gcs-3.2.0.jar \
    && mv hadoop-common-3.2.0.jar /usr/local/spark/jars/ \
    && mv hadoop-gcs-3.2.0.jar /usr/local/spark/jars/ \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copiando o core-site.xml para o local esperado pelo Hadoop
COPY core-site.xml /usr/local/hadoop/etc/hadoop/core-site.xml

USER jovyan
