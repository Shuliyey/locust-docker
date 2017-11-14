# pyzmq missing example for locust

## Overview
This repo is to address locust's below issue

* https://github.com/locustio/locust/issues/302
* https://github.com/locustio/locust/issues/680
* https://github.com/locustio/locust/pull/681

## How to reproduce

```bash
docker build -t locust-test .
docker run -it --rm -e ENDPOINT=http://qq.com locust-test 
```
