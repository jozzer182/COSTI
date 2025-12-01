# 🛠️ Guía de Configuración - COSTI

Esta guía te ayudará a configurar el proyecto COSTI desde cero.

## Tabla de Contenidos

1. [Prerrequisitos](#prerrequisitos)
2. [Configuración de Firebase](#configuración-de-firebase)
3. [Configuración de Google Apps Script](#configuración-de-google-apps-script)
4. [Variables de Entorno](#variables-de-entorno)
5. [Ejecución Local](#ejecución-local)
6. [Despliegue](#despliegue)

---

## Prerrequisitos

### Software Requerido

- **Flutter SDK** 3.x o superior
  ```bash
  flutter --version
  # Flutter 3.x.x • channel stable
  ```

- **Dart SDK** >=2.19.2 <4.0.0
  ```bash
  dart --version
  # Dart SDK version: 3.x.x
  ```

- **Git**
  ```bash
  git --version
  ```

### Cuentas Necesarias

- [ ] Cuenta de Google
- [ ] Acceso a Firebase Console
- [ ] Acceso a Google Apps Script

---

## Configuración de Firebase

### 1. Crear Proyecto Firebase

1. Ve a [Firebase Console](https://console.firebase.google.com/)
2. Click en "Agregar proyecto"
3. Nombre del proyecto: `costii` (o el nombre que prefieras)
4. Habilita Google Analytics (opcional)
5. Click en "Crear proyecto"

### 2. Configurar Authentication

1. En el panel de Firebase, ve a **Authentication**
2. Click en **Comenzar**
3. En la pestaña **Sign-in method**, habilita:
   - ✅ Correo electrónico/Contraseña
4. Guarda los cambios

### 3. Registrar Aplicación Web

1. En la página principal del proyecto, click en el icono **Web** (`</>`)
2. Nickname de la app: `COSTI Web`
3. ❌ No marques "Firebase Hosting" por ahora
4. Click en **Registrar app**
5. **IMPORTANTE**: Copia los valores de configuración:

```javascript
const firebaseConfig = {
  apiKey: "AIza...",           // → FIREBASE_API_KEY
  authDomain: "xxx.firebaseapp.com",  // → FIREBASE_AUTH_DOMAIN
  projectId: "xxx",            // → FIREBASE_PROJECT_ID
  storageBucket: "xxx.appspot.com",   // → FIREBASE_STORAGE_BUCKET
  messagingSenderId: "123...", // → FIREBASE_MESSAGING_SENDER_ID
  appId: "1:123:web:abc...",   // → FIREBASE_APP_ID
  measurementId: "G-XXX"       // → FIREBASE_MEASUREMENT_ID
};
```

---

## Configuración de Google Apps Script

El proyecto utiliza Google Apps Script como backend para varias funcionalidades.

### Scripts Necesarios

| Variable | Función |
|----------|---------|
| `API_COSTI` | API principal de datos COSTI |
| `API_HOVIP` | API del módulo HOVIP |
| `API_FEM` | API de Fichas de Ejecución |
| `API_FILE_UPLOAD` | API para subir archivos a Drive |
| `API_USERS` | API de gestión de usuarios |
| `API_PERFILES` | API de perfiles/permisos |

### Desplegar un Script como Web App

1. Ve a [Google Apps Script](https://script.google.com/)
2. Abre tu script
3. Click en **Implementar** > **Nueva implementación**
4. Tipo: **Aplicación web**
5. Configuración:
   - Ejecutar como: **Yo** (tu cuenta)
   - Quién tiene acceso: **Cualquier persona**
6. Click en **Implementar**
7. Copia la URL del deployment

La URL tendrá este formato:
```
https://script.google.com/macros/s/AKfycb.../exec
```

---

## Variables de Entorno

### 1. Crear archivo .env

```bash
# Desde la raíz del proyecto
cp .env.example .env
```

### 2. Editar .env con tus valores

Abre `.env` en tu editor y completa todos los valores:

```env
# Firebase (de la configuración del paso anterior)
FIREBASE_API_KEY=AIzaSy...
FIREBASE_APP_ID=1:471714...
FIREBASE_MESSAGING_SENDER_ID=4717147...
FIREBASE_PROJECT_ID=costii
FIREBASE_AUTH_DOMAIN=costii.firebaseapp.com
FIREBASE_STORAGE_BUCKET=costii.appspot.com
FIREBASE_MEASUREMENT_ID=G-7VR...

# APIs de Google Apps Script
API_COSTI=https://script.google.com/macros/s/.../exec
API_HOVIP=https://script.google.com/macros/s/.../exec
API_FEM=https://script.google.com/macros/s/.../exec
API_FILE_UPLOAD=https://script.google.com/macros/s/.../exec
API_USERS=https://script.google.com/macros/s/.../exec
API_PERFILES=https://script.google.com/macros/s/.../exec
```

### ⚠️ Importante

- **NUNCA** commitees el archivo `.env`
- El archivo ya está en `.gitignore`
- Cada desarrollador debe crear su propio `.env`

---

## Ejecución Local

### 1. Instalar dependencias

```bash
flutter pub get
```

### 2. Verificar configuración

```bash
flutter doctor
```

### 3. Ejecutar en Chrome

```bash
flutter run -d chrome
```

### 4. Ejecutar en modo debug con DevTools

```bash
flutter run -d chrome --start-paused
```

---

## Despliegue

### Build para Web

```bash
flutter build web --release
```

Los archivos se generarán en `build/web/`

### Despliegue en Firebase Hosting

```bash
# Instalar Firebase CLI
npm install -g firebase-tools

# Login
firebase login

# Inicializar (solo primera vez)
firebase init hosting

# Desplegar
firebase deploy --only hosting
```

---

## Solución de Problemas

### Error: "dotenv" no definido

```bash
flutter clean
flutter pub get
```

### Error: Firebase no inicializado

Verifica que:
1. El archivo `.env` existe
2. Tiene todos los valores de Firebase configurados
3. La app se ejecuta después de `await dotenv.load()`

### Error de CORS con Google Apps Script

Los scripts deben estar desplegados con:
- Acceso: "Cualquier persona"
- El script debe retornar `ContentService.createTextOutput()` con headers CORS

---

## Contacto

Si tienes problemas con la configuración, contacta al equipo de desarrollo.

