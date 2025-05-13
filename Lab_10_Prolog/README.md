# Introducere in Prolog

## SWI-PROLOG

* Incarcare fisier

```
swipl name.pl
```

* Incarcare modificari

```
?- make.
```

* Activare suport diacritice

```
?- set_prolog_flag(encoding,utf8).
```

* Observare flow executie

```
?- trace.
?- notrace. % remove trace
?- nodebug. % remove debug
```

* Iesire din consola
```
?- halt.
```