// ignore_for_file: constant_identifier_names

class LogLabel{
  const LogLabel._();

  static const PERMISSION = "PERMISSION";
  static const NETWORK = "NETWORK";

  static const DATABASE = "DATABASE";
  static const AUTHENTICATION = "AUTHENTICATION";
  static const UI = "UI";
  static const ERROR = "ERROR";
  static const DEBUG = "DEBUG";
  static const ANALYTICS = "ANALYTICS";
  static const PERFORMANCE = "PERFORMANCE";
  static const STORAGE = "STORAGE";
  static const LOCATION = "LOCATION";
  static const SECURITY = "SECURITY";
}

class PermissionMessage {
  static const CAMERA_FAILED = "Failed to ask camera permission";
  static const CAMERA_SUCCESS = "Camera permission granted";

  static const LOCATION_FAILED = "Failed to ask location permission";
  static const LOCATION_SUCCESS = "Location permission granted";

  static const MICROPHONE_FAILED = "Failed to ask microphone permission";
  static const MICROPHONE_SUCCESS = "Microphone permission granted";

  static const STORAGE_FAILED = "Failed to ask storage permission";
  static const STORAGE_SUCCESS = "Storage permission granted";

  static const CONTACTS_FAILED = "Failed to ask contacts permission";
  static const CONTACTS_SUCCESS = "Contacts permission granted";

  static const NOTIFICATIONS_FAILED = "Failed to ask notifications permission";
  static const NOTIFICATIONS_SUCCESS = "Notifications permission granted";

  static const BLUETOOTH_FAILED = "Failed to ask Bluetooth permission";
  static const BLUETOOTH_SUCCESS = "Bluetooth permission granted";
}
