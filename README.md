# seaside-bootstrap-select
[Seaside](https://github.com/SeasideSt/Seaside) integration (canvas, plugin and options) for the [Bootstrap-Select plugin](https://github.com/snapappointments/bootstrap-select)
_to be used with [Bootstrap 4](https://github.com/astares/Seaside-Bootstrap4)_.

For [Bootstrap 3 integration](https://github.com/astares/Seaside-Bootstrap) please check the [Bootstrap 3](https://github.com/eMaringolo/seaside-bootstrap-select/tree/bootstrap3)

# Simple use

To use it, send `tbsSelect` instead of `select` to the HTML canvas.

```smalltalk

  html sbsSelect
    list: Object subclasses
```

![Screenshot](/example.gif?raw=true "Example")

# Installation

```smalltalk
Metacello new 
  baseline: 'BootstrapSelect'; 
  repository: 'github://eMaringolo/seaside-bootstrap-select:bootstrap4/src';
  load.
```

# More examples

There is a `Bootstrap-Select-Examples` package that autoinitializes a browser application at `/bootstrap-select` in your default Seaside dispatcher (typically `http://localhost:8080/bootstrap-select`).





