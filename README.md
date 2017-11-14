# pyzmq missing example for locust

## Overview
This repo is to address locust's below issue

* https://github.com/locustio/locust/issues/302
* https://github.com/locustio/locust/issues/680
* https://github.com/locustio/locust/pull/681

## How to reproduce

```bash
# clone
git clone https://github.com/Shuliyey/locust-docker.git
cd locust-docker
# build/test
docker build -t locust-test .
docker run -it --rm -e ENDPOINT=http://qq.com locust-test 
```
