# Diagramas

## Instalar go

Seguir el tutorial de [https://go.dev/doc/install](https://go.dev/doc/install)

## Instalar las librerias

```sh
go install goa.design/model/cmd/mdl
go install goa.design/model/cmd/stz
```

## Compilar

### Compilar en web

```sh
mdl serve diagrams/test -dir gen
```

### Generarlos a svg

```sh
mdl svg diagrams/test -dir gen -all
```

## FAQ

### No me encuentra `mdl`

En mac o linux debería servir esto:

```sh
echo 'export PATH="$PATH:$(go env GOPATH)/bin"' >> ~/.zshrc
```

En windows agregar la carpeta de go al path, se debería poder ver con `go env GOPATH`.
