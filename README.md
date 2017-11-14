# pyzmq missing example for locust
Note: locust version of this example (as of date today, 2017-11-15 Australia/Melbourne time) is 0.8.1

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
docker run -it --rm -e ENDPOINT=http://qq.com -e MODE=--master locust-test 
```

you should see a warning (`WARNING: Using pure Python socket RPC implementation instead of zmq`) and an error (`module 'gevent' has no attribute 'queue'`)

```bash
| =>  docker run -it --rm -e ENDPOINT=http://qq.com -e MODE=--master locust-test
/usr/local/lib/python3.6/site-packages/locust/rpc/__init__.py:6: UserWarning: WARNING: Using pure Python socket RPC implementation instead of zmq. If running in distributed mode, this could cause a performance decrease. We recommend you to install the pyzmq python package when running in distributed mode.
  warnings.warn("WARNING: Using pure Python socket RPC implementation instead of zmq. If running in distributed mode, this could cause a performance decrease. We recommend you to install the pyzmq python package when running in distributed mode.")
[2017-11-14 22:55:48,359] f41834333211/INFO/locust.main: Starting web monitor at *:8089
[2017-11-14 22:55:48,360] f41834333211/ERROR/stderr: Traceback (most recent call last):
[2017-11-14 22:55:48,361] f41834333211/ERROR/stderr: File "/usr/local/bin/locust", line 11, in <module>
[2017-11-14 22:55:48,361] f41834333211/ERROR/stderr: 
[2017-11-14 22:55:48,362] f41834333211/ERROR/stderr: sys.exit(main())
[2017-11-14 22:55:48,362] f41834333211/ERROR/stderr: 
[2017-11-14 22:55:48,362] f41834333211/ERROR/stderr: File "/usr/local/lib/python3.6/site-packages/locust/main.py", line 439, in main
[2017-11-14 22:55:48,363] f41834333211/ERROR/stderr: 
[2017-11-14 22:55:48,363] f41834333211/ERROR/stderr: runners.locust_runner = MasterLocustRunner(locust_classes, options)
[2017-11-14 22:55:48,363] f41834333211/ERROR/stderr: 
[2017-11-14 22:55:48,364] f41834333211/ERROR/stderr: File "/usr/local/lib/python3.6/site-packages/locust/runners.py", line 247, in __init__
[2017-11-14 22:55:48,365] f41834333211/ERROR/stderr: 
[2017-11-14 22:55:48,365] f41834333211/ERROR/stderr: self.server = rpc.Server(self.master_bind_host, self.master_bind_port)
[2017-11-14 22:55:48,365] f41834333211/ERROR/stderr: 
[2017-11-14 22:55:48,366] f41834333211/ERROR/stderr: File "/usr/local/lib/python3.6/site-packages/locust/rpc/socketrpc.py", line 74, in __init__
[2017-11-14 22:55:48,367] f41834333211/ERROR/stderr: 
[2017-11-14 22:55:48,367] f41834333211/ERROR/stderr: self.event_queue = gevent.queue.Queue()
[2017-11-14 22:55:48,367] f41834333211/ERROR/stderr: 
[2017-11-14 22:55:48,368] f41834333211/ERROR/stderr: AttributeError
[2017-11-14 22:55:48,368] f41834333211/ERROR/stderr: :
[2017-11-14 22:55:48,368] f41834333211/ERROR/stderr: module 'gevent' has no attribute 'queue'
[2017-11-14 22:55:48,369] f41834333211/ERROR/stderr:
```

## Notes
the Dockerfile didn't have any step to uninstall `pyzmq`, the `pyzmq` warning is actually caused by the Dockerfile step that uninstalled `g++` (https://github.com/Shuliyey/locust-docker/blob/master/Dockerfile#L7), error is caused by the `pyzmq` warning and a missing import in `socketrpc.py` of branch 0.8 (https://github.com/locustio/locust/blob/0.8/locust/rpc/socketrpc.py)` (there's this pull-request https://github.com/locustio/locust/pull/681  addressing the missing import)
