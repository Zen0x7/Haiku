use namespace app

const perPage = 25

const resource = {
    name = "tasks"
    fields = [
        {
            name = "ID"
            field = "id"
            component = "number"
            primary = true
        }
        {
            name = "Description"
            field = "description"
            component = "text"
        }
    ]
}

app.schemas.set("for", resource.name)

app.schemas.create({
    name = resource.name
    fields = resource.fields
})

app.services.create({
    name = "{resource.name}"
    protocol = "http"
    options = {
        port = 80
        methods = ["GET"]
        path = resource.name
    }
    call() app.schemas.paginate(perPage)
})

app.services.create({
    name = "{resource.name}.store"
    protocol = "http"
    options = {
        port = 80
        methods = ["POST"]
        path = resource.name
    }
    call() app.schemas.insert()
})

app.services.create({
    name = "{resource.name}.update"
    protocol = "http"
    options = {
        port = 80
        methods = ["PUT", "PATCH"]
        path = "{resource.name}/:id"
    }
    call() app.schemas.update()
})

app.services.create({
    name = "{resource.name}.show"
    protocol = "http"
    options = {
        port = 80
        methods = ["GET"]
        path = "{resource.name}/:id"
    }
    call() app.schemas.find()
})

