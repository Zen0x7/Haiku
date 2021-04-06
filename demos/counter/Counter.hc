use namespace app

const name = "visits"
const action = "increase"
const value = 0

app.documents.create(name, value)

app.actions.create({
    name = action
    run() app.documents.increase(name)
})

app.metrics.create({
    ...name
    fetch() {
        app.actions.run(touch)
        return documents.get(name)
    }
})

app.services.create({
    ...name
    protocol = "http"
    options = {
        port = 80
        methods = ["GET"]
        path = name
    }
    call() app.metrics.fetch(name)
})

