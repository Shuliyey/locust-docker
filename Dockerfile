FROM python:alpine

MAINTAINER "叶泽宇" <shuliyey@gmail.com>

RUN apk --update add tzdata g++ make \
  && pip install locustio \
  && apk del g++ make \
  && rm -rf /var/cache/apk/* /root/__pycache__

ADD locustfile.py /root/
ADD run.sh /root/

ENV MODE ""
ENV ENDPOINT ""

WORKDIR /root

# PORTS
EXPOSE 5557
EXPOSE 8089

CMD ["./run.sh"]

