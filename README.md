# Haiku

## 

## Syntax

### Classes and objects

```haiku
use number

class Trick {
  public name
  constructor name
  do() {
    using output("This trick is called {name} and have {rate}% of success").with({
      name = this.name
      rate = number.random(75, 100)
    })
  }
}

trick = new Trick("*Lean*")
trick.do // "This trick is called *Lean* and have 100% of success"
```

### Class-free objects

#### App.haiku

```haiku
output("We have {connectedUsers} users connected!").with({
  connectedUsers = db("devices").where("connected", true).count()
})
```

#### Addons/DB.ha

```haiku
export {
    invoke(name) builder(mysql).table(name)
}
```

#### Config/Addons.hc

```haiku
path = "./Addons" 
core = Builder MySQL Output
addons = DB
```
