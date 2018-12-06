FROM centos:7

RUN yum update -y && yum install -y java-1.8.0-openjdk

COPY consumer-demo-0.0.1-SNAPSHOT.jar /data/tsf/
COPY run.sh /data/tsf/

# GMT+8 for CentOS
RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo "Asia/Shanghai" > /etc/timezone

# run.sh
CMD ["sh", "-c", "cd /data/tsf; sh run.sh provider-demo-0.0.1-SNAPSHOT.jar /data/tsf"]
