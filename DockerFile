#FROM python:2.7.18
#RUN pip install swift-bench


#FROM python:3.9.16
#RUN pip install swift-bench

#FROM ubuntu:22.04
#RUN apt-get install swift-bench

FROM python:3.9.16
#-alpine3.17
RUN mkdir /tempo
WORKDIR /tempo
RUN wget "https://github.com/openstack/swift-bench/archive/refs/heads/master.zip" -O temp.zip
RUN unzip temp.zip
WORKDIR /tempo/swift-bench-master
RUN pip install -r requirements.txt
RUN pip install python-keystoneclient
RUN python setup.py install
WORKDIR /
RUN rm -rf /tempo
##ENTRYPOINT ["swift-bench", "/etc/swift/swiftbench.conf"]