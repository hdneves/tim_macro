docker cp "C:\Nova pasta\gcs-connector-hadoop3-latest.jar" pyspark_container:/usr/local/spark/jars/
docker exec -it pyspark_container /bin/bash
ls /usr/local/spark/jars/
docker restart pyspark_container
