# seaside-bootstrap-select
Seaside integration (canvas, plugin and options) of Bootstrap-Select (https://github.com/silviomoreto/bootstrap-select) plugin

![Screenshot](/example.gif?raw=true "Example")


# Simple use

To use it, send `tbsSelect` instead of `select` to the HTML canvas.

```smalltalk

  html tbsSelect
    list: Object subclasses
```
# Installation

```smalltalk
Metacello new 
  baseline: 'BootstrapSelect'; 
  repository: 'github://eMaringolo/seaside-bootstrap-select/src';
  load.
```

# More examples

There is a `Bootstrap-Select-Examples` package that autoinitializes a browser application at `/bootstrap-select` in your default Seaside dispatcher (typically `http://localhost:8080/bootstrap-select`).





