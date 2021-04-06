const Metric = {
    name = "visits"
    value = 0
}

const Increase = {
    name = "increase-visitors",
    run() documents.increase(Metric.name)
}

documents.create(Metric.name, Metric.value)
actions.push(Increase)

metrics.push({
    name = Metric.name
    fetch() {
        // When metrics was fetched
        documents.get(Metric.name)
        // A new visitor will be counted
        actions.run(Increase.name)
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

