import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'storage_service.dart';

class SecureStorageService implements IStorageService {
  static final SecureStorageService _instance =
      SecureStorageService._internal();

  factory SecureStorageService() => _instance;

  SecureStorageService._internal();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  @override
  Future<void> write(String key, String value) async {
    try {
      await _storage.write(
        key: key,
        value: value,
        aOptions: _getAndroidOptions(),
      );
    } catch (e) {
      debugPrint("Error writing to secure storage: $e");
      rethrow;
    }
  }

  @override
  Future<String?> read(String key) async {
    try {
      return await _storage.read(key: key, aOptions: _getAndroidOptions());
    } catch (e) {
      debugPrint("Error reading from secure storage: $e");
      return null;
    }
  }

  @override
  Future<void> delete(String key) async {
    try {
      await _storage.delete(key: key, aOptions: _getAndroidOptions());
    } catch (e) {
      debugPrint("Error deleting from secure storage: $e");
      rethrow;
    }
  }

  @override
  Future<void> clear() async {
    try {
      await _storage.deleteAll(aOptions: _getAndroidOptions());
    } catch (e) {
      debugPrint("Error clearing secure storage: $e");
      rethrow;
    }
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
}
