from locust import HttpLocust, TaskSet

def status(l):
    l.client.get("/status")

class UserBehavior(TaskSet):
    tasks = {status: 1}

class WebsiteUser(HttpLocust):
    task_set = UserBehavior
