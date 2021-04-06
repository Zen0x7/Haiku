const Metric = {
    name = "visits"
    value = 0
}

const Hit {
    name = "hit"
}

documents.create(Metric.name, Metric.value)

const Increase = {
    name = "increase-visitors",
    run() documents.increase(Metrics.name)
}

actions.push(Increase)

metrics.push({
    name = Metric.name
    fetch() {
        documents.get(Metric.name)
        documents.increase(Metrics.name)
    }
})

services.register({
    name = Metric.name
    protocol = "http"
    options = {
        port = 80
        methods = ["GET"]
        path = Metric.name
    }
    call() metrics.fetch(Metric.name)
})

