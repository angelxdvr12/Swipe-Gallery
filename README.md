Markdown
# 📸 Galería Swipe App - Proyecto 1er Departamental

Una aplicación móvil desarrollada en **Flutter** que permite visualizar las fotografías almacenadas localmente en el dispositivo. Incluye una cuadrícula de miniaturas, visualización a pantalla completa, navegación por gestos (swipe) y capacidad de hacer zoom (pinch-to-zoom).

## ✨ Características

* **Manejo de Permisos:** Solicitud nativa de permisos de almacenamiento en tiempo de ejecución (compatible con Android 14+).
* **Galería en Cuadrícula (Grid):** Renderizado optimizado de miniaturas con bordes redondeados.
* **Manejo de Estados:** Interfaz reactiva (Cargando, Sin fotos, Permisos denegados).
* **Visor a Pantalla Completa:** Navegación fluida entre imágenes mediante *Swipe* (`PageView`).
* **Zoom Interactivo:** Acercamiento y alejamiento (*Pinch-to-zoom*) nativo con `InteractiveViewer`.
* **Indicador de Paginación:** Seguimiento de la imagen actual vs. el total de imágenes (Ej. 3 / 20).

---

## 🛠️ Requisitos Previos

Para compilar y ejecutar este proyecto, necesitas instalar **Flutter** y **Android Studio**.

### 1. Instalar Flutter SDK
1. Ve a la [documentación oficial de Flutter](https://docs.flutter.dev/get-started/install).
2. Descarga el SDK para tu sistema operativo (Windows, macOS o Linux).
3. Extrae el archivo y añade la ruta de la carpeta `bin` a las variables de entorno de tu sistema.
4. Ejecuta `flutter doctor` en tu terminal para verificar la instalación.

### 2. Instalar Android Studio
1. Descarga e instala [Android Studio](https://developer.android.com/studio).
2. Durante la instalación, incluye el **Android SDK**, **Android SDK Command-line Tools** y el **Android Emulator**.
3. En Android Studio, ve a **Plugins** e instala los de `Flutter` y `Dart`.

### 3. Configurar el Emulador
1. Abre el **Device Manager** en Android Studio.
2. Crea un dispositivo virtual (AVD).
3. **Recomendación:** Utiliza una imagen del sistema con **API 33 o API 34** para garantizar la mayor estabilidad durante las pruebas.

---

## 🚀 Instalación y Ejecución
Sigue estos pasos en tu terminal para correr la aplicación:

1. Clonar el repositorio
git clone https://github.com/angelxdvr12/galeria_swipe_app.git
cd galeria_swipe_app


2. Descargar dependencias
Instala las librerías necesarias (photo_manager, etc.):
flutter pub get

3. Ejecutar la aplicación
Asegúrate de tener un emulador abierto o un dispositivo físico conectado.
flutter run

⚠️ Nota sobre el Motor Gráfico (Emuladores API 35+):
Si el emulador cierra la app de forma inesperada al conceder los permisos de la galería, ejecuta la aplicación desactivando el motor gráfico experimental (Impeller) con este comando:
flutter run --no-enable-impeller

📱 Uso y Pruebas
1. Al abrir la app, acepta los permisos de almacenamiento.
2. Si el emulador no tiene fotos:
-Minimiza la app y abre la Cámara nativa de Android.
-Toma 3 o 4 fotos de prueba en la habitación virtual.
-Regresa a la terminal y presiona Shift + R (Hot Restart) para recargar la galería con las nuevas imágenes.
