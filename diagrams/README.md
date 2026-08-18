# Diagramas

## Si no sirve MDL

En mac o linux debería servir esto:

```sh
echo 'export PATH="$PATH:$(go env GOPATH)/bin"' >> ~/.zshrc
```

En windows agregar la carpeta de go al path, se debería poder ver con `go env GOPATH`.

## Compilar en web

```sh
mdl serve diagramas/model -dir gen
```

## Generarlos a svg

```sh
mdl svg diagramas/test -dir gen -all
```
