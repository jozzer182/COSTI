<p align="center">
  <img src="images/coin.png" alt="COSTI Logo" width="120"/>
</p>

<h1 align="center">COSTI</h1>

<p align="center">
  <strong>Project Cost Control System</strong>
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

## 📖 Description

**COSTI** is an enterprise application developed in Flutter for project cost control and management. It enables tracking of budgets, projections, actual costs, and real-time financial analysis.

### 🎯 Main Modules

| Module | Description | Icon |
|--------|-------------|------|
| **Live** | Real-time cost tracking | ![Live](images/live.png) |
| **Projection** | Financial projections and trends | ![Projection](images/proyeccion.png) |
| **Actual** | Actual executed costs recording | ![Actual](images/real.png) |
| **Budget** | Budget management | ![Budget](images/budget.png) |
| **HOVIP** | HOVIP management module | 📊 |
| **FEM** | Maintenance Execution Sheets management | 📋 |

---

## ✨ Features

- 🔐 **Secure authentication** with Firebase Auth
- 📊 **Interactive dashboards** with real-time charts
- 📈 **Trend analysis** and projections
- 👥 **User management** and access profiles
- 📁 **File upload** to Google Drive
- 🌐 **Responsive Web Application**
- 🎨 **Customizable dark/light theme**

---

## 🏗️ Architecture

```
lib/
├── bloc/                    # Business Logic Components (BLoC)
│   ├── main_bloc.dart
│   ├── main_event.dart
│   └── main_state.dart
├── home/                    # Home page
├── login/                   # Authentication
│   ├── model/
│   └── view/
├── live/                    # Live module
│   ├── controller/
│   ├── model/
│   └── view/
├── proyeccion/              # Projection module
│   ├── controller/
│   ├── model/
│   └── view/
├── real/                    # Actual costs module
│   ├── controller/
│   ├── model/
│   └── view/
├── bdg/                     # Budget module
├── hovip_module/            # HOVIP module
│   ├── ejecutores/
│   ├── fem/
│   ├── hovip/
│   ├── proyectos/
│   └── sustitutos/
├── resources/               # Shared resources
│   ├── constants/
│   └── env_config.dart      # Environment variables configuration
└── main.dart                # Entry point
```

---

## 🛠️ Tech Stack

| Technology | Usage |
|------------|-------|
| **Flutter 3.x** | Multi-platform UI framework |
| **Dart** | Programming language |
| **Firebase Auth** | User authentication |
| **Google Apps Script** | Backend/APIs |
| **flutter_bloc** | State management |
| **fl_chart** | Chart visualization |
| **flutter_dotenv** | Environment variables |

---

## 🚀 Installation

### Prerequisites

- Flutter SDK 3.x or higher
- Dart SDK >=2.19.2 <4.0.0
- Firebase account
- Google Apps Script configured

### Installation Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/jozzer182/COSTI.git
   cd COSTI
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure environment variables**
   ```bash
   # Copy the example file
   cp .env.example .env
   
   # Edit .env with your actual credentials
   # (See Configuration section below)
   ```

4. **Run the application**
   ```bash
   flutter run -d chrome
   ```

---

## ⚙️ Configuration

### Environment Variables

Copy `.env.example` to `.env` and configure the following variables:

```env
# Firebase Configuration
FIREBASE_API_KEY=your_api_key
FIREBASE_APP_ID=your_app_id
FIREBASE_MESSAGING_SENDER_ID=your_sender_id
FIREBASE_PROJECT_ID=your_project_id
FIREBASE_AUTH_DOMAIN=your_project.firebaseapp.com
FIREBASE_STORAGE_BUCKET=your_project.appspot.com
FIREBASE_MEASUREMENT_ID=your_measurement_id

# Google Apps Script Endpoints
API_COSTI=https://script.google.com/macros/s/YOUR_SCRIPT_ID/exec
API_HOVIP=https://script.google.com/macros/s/YOUR_SCRIPT_ID/exec
API_FEM=https://script.google.com/macros/s/YOUR_SCRIPT_ID/exec
API_FILE_UPLOAD=https://script.google.com/macros/s/YOUR_SCRIPT_ID/exec
API_USERS=https://script.google.com/macros/s/YOUR_SCRIPT_ID/exec
API_PERFILES=https://script.google.com/macros/s/YOUR_SCRIPT_ID/exec
```

### Firebase Setup

1. Create a project in [Firebase Console](https://console.firebase.google.com/)
2. Enable Authentication with Email/Password
3. Copy the web configuration credentials
4. Add them to the `.env` file

### Google Apps Script

Google Apps Script endpoints must be deployed as Web Apps:
1. Create the necessary scripts in Google Apps Script
2. Deploy as web application
3. Copy the URLs to the `.env` file

---

## 📸 Screenshots

<p align="center">
  <img src="images/CopyPasteFEM2.gif" alt="Demo FEM Module" width="600"/>
</p>

---

## 🔒 Security

This project uses environment variables to protect sensitive credentials:

- ❌ **NEVER** commit the `.env` file
- ✅ Use `.env.example` as a template
- ✅ Firebase credentials are externalized
- ✅ API endpoints are protected

---

## 📝 Useful Scripts

```bash
# Run in debug mode (web)
flutter run -d chrome

# Build for production
flutter build web

# Analyze code
flutter analyze

# Format code
dart format lib/
```

---

## 🤝 Contributing

This is a private/enterprise project. To contribute:

1. Request access from the development team
2. Create a feature branch (`git checkout -b feature/new-feature`)
3. Commit changes (`git commit -m 'Add new feature'`)
4. Push to branch (`git push origin feature/new-feature`)
5. Create Pull Request

---

## 📄 License

This project is proprietary. All rights reserved.

---

## 📬 Contact

**José Zarabanda**

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/zarabandajose/)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/jozzer182)
[![Website](https://img.shields.io/badge/Website-FF7139?style=for-the-badge&logo=firefox&logoColor=white)](https://zarabanda-dev.web.app/)

---

<p align="center">
  Developed with ❤️ using Flutter
</p>
