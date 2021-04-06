# Add-ons 

# Implementations for

## Terms

```
|--------------------|
|      Structure     |
|--------------------|
| module = Math      |
| method = abs       |
| ...parameters = 10 |
|--------------------|
```

## Basic

```haiku
use {module}

{module}.{method}(...parameters)
```

## Advanced

```haiku
using {module}.{method}(...parameters) #

using Math.abs(10) === 10
```

## Available modules

## Build your own add-ons 

### Export

Create haiku file with `export` structure, for example: `Version.hc`.

```haiku
# Project/Version.hc
export {
  version = "1.0.0"
  get() this.version
}
```

### Usage

Register add-on in `Add-ons.hc` file and use in `App.hc`.

```haiku
# Project/Add-ons.hc
add-ons = Version

# Project/App.hc
using output(Version.get())
```