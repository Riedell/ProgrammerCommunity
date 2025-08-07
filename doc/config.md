
# 中间件
- Elasticsearch
  - ..\elasticsearch-6.4.3\config\elasticsearch.yml下修改
    - cluster.name
    - path.data
    - path.logs

- Kafka
  - ..\kafka_2.13-2.6.0\config\zookeeper.properties
    - dataDir
  - ..\kafka_2.13-2.6.0\config\server.properties
    - log.dirs

# 项目
- log [Logback]
  - logback-spring.xml
    - LOG_PATH
  - logback-spring-{xxxxxx}.xml 
    - LOG_PATH


