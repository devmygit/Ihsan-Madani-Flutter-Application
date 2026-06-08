import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// AppConfig class for managing API keys and configuration
/// Uses secure storage to store sensitive data like API keys
class AppConfig {
  AppConfig._internal();
  static final AppConfig _instance = AppConfig._internal();
  factory AppConfig() => _instance;

  static const FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );

  static const String _apiKeyStorageKey = 'api_key';

  /// Get API key from secure storage
  /// Returns null if key is not set
  static Future<String?> getApiKey() async {
    try {
      final apiKey = await _storage.read(key: _apiKeyStorageKey);
      return apiKey;
    } catch (e) {
      log('Error reading API key from secure storage: $e');
      return null;
    }
  }

  /// Set API key in secure storage
  /// This should be called during app initialization or when API key is received
  static Future<void> setApiKey(String apiKey) async {
    try {
      await _storage.write(key: _apiKeyStorageKey, value: apiKey);
      log('API key stored successfully');
    } catch (e) {
      log('Error storing API key in secure storage: $e');
      rethrow;
    }
  }

  /// Delete API key from secure storage
  /// Useful for logout or key rotation
  static Future<void> deleteApiKey() async {
    try {
      await _storage.delete(key: _apiKeyStorageKey);
      log('API key deleted successfully');
    } catch (e) {
      log('Error deleting API key from secure storage: $e');
      rethrow;
    }
  }

  /// Check if API key exists in secure storage
  static Future<bool> hasApiKey() async {
    try {
      final apiKey = await getApiKey();
      return apiKey != null && apiKey.isNotEmpty;
    } catch (e) {
      log('Error checking API key existence: $e');
      return false;
    }
  }
}
