#!/usr/bin/env bash
set -euo pipefail

ROOTFS_DIR="${1:-$HOME/eco-android/container/rootfs}"
MEM_LIMIT="${2:-256M}"

echo "[Eco-Android] Cargando módulos del kernel..."
sudo modprobe zram || true
sudo modprobe binder_linux || true

echo "[Eco-Android] Verificando cgroups v2..."
stat -fc %T /sys/fs/cgroup

echo "[Eco-Android] Iniciando shell aislada con MemoryMax=${MEM_LIMIT}..."
sudo systemd-run --scope -p "MemoryMax=${MEM_LIMIT}" \
  unshare --pid --fork --mount-proc \
  chroot "${ROOTFS_DIR}" /bin/sh -c "echo 'Entorno aislado activo'; ps; exit"
