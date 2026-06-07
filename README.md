# ArchPersonal - Arch Linux + i3 + Polybar + Picom

Repositorio personal de configuración para mi entorno **Arch Linux ligero**, pensado para una PC modesta pero usable, rápida y con estética limpia tipo Dracula/purple.

> Este repo es para respaldar y restaurar mi entorno gráfico personal. No debería contener contraseñas, llaves SSH, tokens, cookies, historiales privados ni archivos personales.

## Setup principal

| Área | Configuración |
|---|---|
| Sistema | Arch Linux |
| Window Manager | i3wm |
| Barra | Polybar tipo isla superior |
| Compositor | Picom |
| Terminal | Alacritty / Kitty |
| Shell | Zsh + Starship |
| Lanzador | Rofi / dmenu |
| Tema visual | Dracula / purple / minimalista |
| Fuente | JetBrainsMono Nerd Font |

## Monitores

Configuración personal usada en i3/xrandr:

| Monitor | Posición | Resolución | Frecuencia |
|---|---:|---:|---:|
| Principal | Derecha | 1920x1080 | 200Hz |
| Secundario | Izquierda | 1366x768 | 60Hz |

> En mi Arch actual el monitor principal suele ser `DP-1`. El secundario puede aparecer como `DVI-I-1` o `DVI-D-1`, así que antes de aplicar scripts de pantalla conviene revisar con `xrandr`.

## Estructura del repo

```text
.
├── config/
│   ├── i3/
│   ├── polybar/
│   ├── picom/
│   ├── rofi/
│   ├── alacritty/
│   ├── kitty/
│   ├── fastfetch/
│   └── starship.toml
├── home/
│   ├── .zshrc
│   ├── .xinitrc
│   ├── .Xresources
│   └── .screenlayout/
├── scripts/
│   ├── backup-dotfiles.sh
│   ├── install-dotfiles.sh
│   └── arch-packages.txt
└── README.md
```

## Respaldar mi configuración actual

Desde mi Arch Linux:

```bash
git clone https://github.com/caxitsecurity/ArchPersonal-Ligero-PCPotato-I3-Polybar-Picom.-.git
cd ArchPersonal-Ligero-PCPotato-I3-Polybar-Picom.-
chmod +x scripts/backup-dotfiles.sh
./scripts/backup-dotfiles.sh

git status
git add .
git commit -m "sync: actualizar dotfiles Arch i3"
git push
```

## Restaurar en una instalación nueva

```bash
git clone https://github.com/caxitsecurity/ArchPersonal-Ligero-PCPotato-I3-Polybar-Picom.-.git
cd ArchPersonal-Ligero-PCPotato-I3-Polybar-Picom.-
chmod +x scripts/install-dotfiles.sh
./scripts/install-dotfiles.sh
```

Después reiniciar i3:

```bash
Mod+Shift+R
```

O cerrar sesión y volver a entrar.

## Instalar paquetes base

```bash
sudo pacman -S --needed - < scripts/arch-packages.txt
```

Si algún paquete cambia de nombre o no existe en los repos oficiales, instalarlo manualmente o buscarlo en AUR con `yay`.

## Seguridad antes de subir cambios

Antes de hacer `git add .`, revisar siempre:

```bash
git status
git diff --cached
```

No subir:

- llaves SSH o GPG;
- archivos `.env`;
- tokens de GitHub, Discord, APIs, etc.;
- bases de datos de KeePass;
- historiales de shell;
- documentos personales;
- capturas con datos privados.

## Notas personales

Este setup representa mi entorno de aprendizaje y trabajo para Linux, programación, redes, homelab y ciberseguridad. La idea es tener una base rápida, estética y reproducible para volver a levantar mi Arch sin perder tiempo configurando todo desde cero.
