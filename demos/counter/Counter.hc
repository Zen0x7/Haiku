class Counter {
    name = "visits"
    public value = 0
    increment() this.value += 1
}

metrics.push({
    name = Counter.name
    fetch() Counter.value
})

services.register({
    name = Counter.name
    protocol = "http"
    options = {
        port = 80
        methods = ["GET"]
        path = Counter.name
    }
    call() metrics.fetch(Counter.name)
})

