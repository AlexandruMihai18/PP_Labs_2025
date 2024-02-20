# Introducere in Haskell

## GHC. GHCi

* GHC (comanda `ghc`) - compilare
* GHCi (comanda `ghci`) - interpretare

```
stack exec ghci name.hs
```

* `:r` - reincarcarea definitiilor dupa editarea fisierului (pentru a nu
reinterpreta)
* `:m` + name.module - incarcarea altor module
* `:t` - verificarea tipului unor expresii
* `:q` - quit

* `import name.module` - in main pentru a importa module (ca in python!)