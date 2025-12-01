<p align="center">
  <img src="images/coin.png" alt="COSTI Logo" width="120"/>
</p>

<h1 align="center">COSTI</h1>

<p align="center">
  <strong>Sistema de Control de Costos de Proyectos</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter"/>
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart"/>
  <img src="https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black" alt="Firebase"/>
  <img src="https://img.shields.io/badge/Google_Apps_Script-4285F4?style=for-the-badge&logo=google&logoColor=white" alt="Google Apps Script"/>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/version-2.9-blue" alt="Version"/>
  <img src="https://img.shields.io/badge/platform-Web-green" alt="Platform"/>
  <img src="https://img.shields.io/badge/license-Proprietary-red" alt="License"/>
</p>

---

## 📖 Descripción

**COSTI** es una aplicación empresarial desarrollada en Flutter para el control y gestión de costos de proyectos. Permite el seguimiento de presupuestos, proyecciones, costos reales y análisis financiero en tiempo real.

### 🎯 Módulos Principales

| Módulo | Descripción | Icono |
|--------|-------------|-------|
| **Live** | Seguimiento en tiempo real de costos | ![Live](images/live.png) |
| **Proyección** | Proyecciones financieras y tendencias | ![Proyección](images/proyeccion.png) |
| **Real** | Registro de costos reales ejecutados | ![Real](images/real.png) |
| **Budget** | Gestión de presupuestos | ![Budget](images/budget.png) |
| **HOVIP** | Módulo de gestión HOVIP | 📊 |
| **FEM** | Gestión de Fichas de Ejecución de Mantenimiento | 📋 |

---

## ✨ Características

- 🔐 **Autenticación segura** con Firebase Auth
- 📊 **Dashboards interactivos** con gráficos en tiempo real
- 📈 **Análisis de tendencias** y proyecciones
- 👥 **Gestión de usuarios** y perfiles de acceso
- 📁 **Carga de archivos** a Google Drive
- 🌐 **Aplicación Web** responsive
- 🎨 **Tema oscuro/claro** personalizable

---

## 🏗️ Arquitectura

```
lib/
├── bloc/                    # Business Logic Components (BLoC)
│   ├── main_bloc.dart
│   ├── main_event.dart
│   └── main_state.dart
├── home/                    # Página principal
├── login/                   # Autenticación
│   ├── model/
│   └── view/
├── live/                    # Módulo Live
│   ├── controller/
│   ├── model/
│   └── view/
├── proyeccion/              # Módulo Proyección
│   ├── controller/
│   ├── model/
│   └── view/
├── real/                    # Módulo Real
│   ├── controller/
│   ├── model/
│   └── view/
├── bdg/                     # Módulo Budget
├── hovip_module/            # Módulo HOVIP
│   ├── ejecutores/
│   ├── fem/
│   ├── hovip/
│   ├── proyectos/
│   └── sustitutos/
├── resources/               # Recursos compartidos
│   ├── constants/
│   └── env_config.dart      # Configuración de variables de entorno
└── main.dart                # Punto de entrada
```

---

## 🛠️ Stack Tecnológico

| Tecnología | Uso |
|------------|-----|
| **Flutter 3.x** | Framework UI multiplataforma |
| **Dart** | Lenguaje de programación |
| **Firebase Auth** | Autenticación de usuarios |
| **Google Apps Script** | Backend/APIs |
| **flutter_bloc** | Gestión de estado |
| **fl_chart** | Visualización de gráficos |
| **flutter_dotenv** | Variables de entorno |

---

## 🚀 Instalación

### Prerrequisitos

- Flutter SDK 3.x o superior
- Dart SDK >=2.19.2 <4.0.0
- Cuenta de Firebase
- Google Apps Script configurado

### Pasos de instalación

1. **Clonar el repositorio**
   ```bash
   git clone https://github.com/jozzer182/COSTI.git
   cd COSTI
   ```

2. **Instalar dependencias**
   ```bash
   flutter pub get
   ```

3. **Configurar variables de entorno**
   ```bash
   # Copiar el archivo de ejemplo
   cp .env.example .env
   
   # Editar .env con tus credenciales reales
   # (Ver sección de Configuración abajo)
   ```

4. **Ejecutar la aplicación**
   ```bash
   flutter run -d chrome
   ```

---

## ⚙️ Configuración

### Variables de Entorno

Copia `.env.example` a `.env` y configura las siguientes variables:

```env
# Firebase Configuration
FIREBASE_API_KEY=tu_api_key
FIREBASE_APP_ID=tu_app_id
FIREBASE_MESSAGING_SENDER_ID=tu_sender_id
FIREBASE_PROJECT_ID=tu_project_id
FIREBASE_AUTH_DOMAIN=tu_project.firebaseapp.com
FIREBASE_STORAGE_BUCKET=tu_project.appspot.com
FIREBASE_MEASUREMENT_ID=tu_measurement_id

# Google Apps Script Endpoints
API_COSTI=https://script.google.com/macros/s/TU_SCRIPT_ID/exec
API_HOVIP=https://script.google.com/macros/s/TU_SCRIPT_ID/exec
API_FEM=https://script.google.com/macros/s/TU_SCRIPT_ID/exec
API_FILE_UPLOAD=https://script.google.com/macros/s/TU_SCRIPT_ID/exec
API_USERS=https://script.google.com/macros/s/TU_SCRIPT_ID/exec
API_PERFILES=https://script.google.com/macros/s/TU_SCRIPT_ID/exec
```

### Firebase Setup

1. Crear proyecto en [Firebase Console](https://console.firebase.google.com/)
2. Habilitar Authentication con Email/Password
3. Copiar las credenciales de configuración web
4. Agregarlas al archivo `.env`

### Google Apps Script

Los endpoints de Google Apps Script deben desplegarse como Web Apps:
1. Crear los scripts necesarios en Google Apps Script
2. Desplegar como aplicación web
3. Copiar las URLs al archivo `.env`

---

## 📸 Capturas

<p align="center">
  <img src="images/CopyPasteFEM2.gif" alt="Demo FEM Module" width="600"/>
</p>

---

## 🔒 Seguridad

Este proyecto utiliza variables de entorno para proteger credenciales sensibles:

- ❌ **NUNCA** commitear el archivo `.env`
- ✅ Usar `.env.example` como plantilla
- ✅ Las credenciales de Firebase están externalizadas
- ✅ Los endpoints de API están protegidos

---

## 📝 Scripts útiles

```bash
# Ejecutar en modo debug (web)
flutter run -d chrome

# Construir para producción
flutter build web

# Analizar código
flutter analyze

# Formatear código
dart format lib/
```

---

## 🤝 Contribución

Este es un proyecto privado/empresarial. Para contribuir:

1. Solicitar acceso al equipo de desarrollo
2. Crear una rama feature (`git checkout -b feature/nueva-funcionalidad`)
3. Commit de cambios (`git commit -m 'Agregar nueva funcionalidad'`)
4. Push a la rama (`git push origin feature/nueva-funcionalidad`)
5. Crear Pull Request

---

## 📄 Licencia

Este proyecto es de uso propietario. Todos los derechos reservados.

---

## 👨‍💻 Autor

**José Luis**
- GitHub: [@jozzer182](https://github.com/jozzer182)

---

<p align="center">
  Desarrollado con ❤️ usando Flutter
</p>
