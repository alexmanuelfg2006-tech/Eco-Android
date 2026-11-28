# Evidencias Prácticas - Fase 1
**Proyecto:** Eco-Android

A continuación se presentan las validaciones técnicas del kernel y la gestión de memoria realizadas en el entorno virtual (Debian 13, Kernel 6.12).

## 1. Verificación de Módulos del Kernel
Se verificó la versión del kernel (`6.12.118+deb13-amd64`) y la correcta carga de los módulos esenciales para Android y la optimización de memoria (`binder_linux`, `zram`, `lz4`).

![Validación de Kernel y Módulos](./01_validacion_kernel.png)

## 2. Activación del IPC Binder
Se comprobó la creación del nodo de dispositivo `/dev/binder` (Character Device, Major 10, Minor 262). Este es el canal de comunicación (IPC) fundamental que utilizará Waydroid para comunicar las apps de Android con el kernel de Linux.

![Verificación de Binder](./02_binder_activo.png)

## 3. Prueba de Estrés y Compresión zRAM
Para validar la eficiencia del sistema (enfoque "Thin Client"), se ejecutó una prueba de estrés con `stress-ng` intentando consumir 1.6 GB en un entorno de 1.9 GB. 
Como se observa en la captura, el sistema evitó el colapso gracias a que el `zRAM` comprimió exitosamente **141.7 MB** de datos en tan solo **31.8 MB** reales de memoria, manteniendo el sistema operativo responsivo con apenas 150 MB libres.

![Prueba de Estrés zRAM](./03_prueba_zram.png)
