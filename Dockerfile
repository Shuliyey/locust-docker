FROM python:alpine

MAINTAINER "base2Services" <itsupport@base2services.com>

RUN apk --update add tzdata g++ make \
  && pip install locustio \
  && apk del make \
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

