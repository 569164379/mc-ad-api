from registry.cn-hangzhou.aliyuncs.com/mc-images/mex-mc-bmw:1.1.3
MAINTAINER ranpop



WORKDIR /mc-ad-api

ADD ./start.sh /mc-ad-api
ADD ./mcapi_project/ /mc-ad-api/mcapi_project/
ADD ./JedisPoolConfig.properties /opt/tibco/bw/5.12/lib/
#EXPOSE 8898
#EXPOSE 8094
#EXPOSE 8095

CMD ["sh", "start.sh"]
