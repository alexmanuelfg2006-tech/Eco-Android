# Eco-Android

Entorno contenedorizado mínimo para Android sobre **Debian 13 (Trixie)** con kernel `6.12.118` en arranque UEFI.

## Integrantes
- Richard Rodríguez
- Alexander Ferreira
- Kennyarlys Linares

## Verificaciones iniciales (Debian 13)
- Firmware UEFI activo y particionado GPT/UEFI (`sda1` EFI, `sda2` ext4, `sda3` swap).
- `cgroups v2` (`cgroup2fs`) habilitado.
- Módulos `zram` (`lz4`, `lz4hc`) y `binder_linux` cargados.
- Estructura base en `container/rootfs/`, `scripts/init_container.sh` y `docs/avance_inicio.txt`.
## Documentación y Evidencias
- [Evidencias Prácticas Fase 1 (Binder y zRAM)](./docs/evidencias_fase1/Hito1_Validaciones.md.md)
