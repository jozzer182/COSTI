import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Configuration class to access environment variables
/// All sensitive credentials should be stored in .env file
class EnvConfig {
  // ========================================
  // Firebase Configuration
  // ========================================
  static String get firebaseApiKey => dotenv.env['FIREBASE_API_KEY'] ?? '';
  static String get firebaseAppId => dotenv.env['FIREBASE_APP_ID'] ?? '';
  static String get firebaseMessagingSenderId =>
      dotenv.env['FIREBASE_MESSAGING_SENDER_ID'] ?? '';
  static String get firebaseProjectId =>
      dotenv.env['FIREBASE_PROJECT_ID'] ?? '';
  static String get firebaseAuthDomain =>
      dotenv.env['FIREBASE_AUTH_DOMAIN'] ?? '';
  static String get firebaseStorageBucket =>
      dotenv.env['FIREBASE_STORAGE_BUCKET'] ?? '';
  static String get firebaseMeasurementId =>
      dotenv.env['FIREBASE_MEASUREMENT_ID'] ?? '';

  // ========================================
  // Google Apps Script API Endpoints
  // ========================================
  
  /// Main COSTI API endpoint
  static String get apiCosti => dotenv.env['API_COSTI'] ?? '';
  
  /// HOVIP module API endpoint
  static String get apiHovip => dotenv.env['API_HOVIP'] ?? '';
  
  /// FEM module API endpoint
  static String get apiFem => dotenv.env['API_FEM'] ?? '';
  
  /// File upload to Drive API endpoint
  static String get apiFileUpload => dotenv.env['API_FILE_UPLOAD'] ?? '';
  
  /// Users management API endpoint
  static String get apiUsers => dotenv.env['API_USERS'] ?? '';
  
  /// Profiles management API endpoint
  static String get apiPerfiles => dotenv.env['API_PERFILES'] ?? '';
}

