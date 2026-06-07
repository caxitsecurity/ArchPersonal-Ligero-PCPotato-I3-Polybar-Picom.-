# Seguridad del repositorio

Este repositorio es personal para mi Arch Linux

## No subir nunca

- Llaves SSH privadas o públicas.
- Tokens de GitHub, Discord, APIs o servicios externos.
- Archivos `.env`.
- Bases de datos KeePass (`.kdbx`).
- Historiales de shell como `.zsh_history` o `.bash_history`.
- Cookies, sesiones de navegador o perfiles completos.
- Capturas de pantalla con datos personales.
- Documentos personales, certificados, cédulas o información bancaria.

## Antes de hacer push

Ejecutar:

```bash
git status
git diff
git diff --cached
```

Si aparece algo privado, sacarlo del stage:

```bash
git restore --staged ruta/del/archivo
```

Y si ya fue copiado al repo local, eliminarlo del repositorio:

```bash
git rm --cached ruta/del/archivo
```

## Recomendación

Usar este repo como respaldo de configuración, no como respaldo completo del computador.
