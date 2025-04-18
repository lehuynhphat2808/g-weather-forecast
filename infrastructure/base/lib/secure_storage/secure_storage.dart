import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

/// SecureStorage is a wrapper around the flutter_secure_storage package.
/// It provides a simple interface for storing and retrieving sensitive data securely.
@singleton
class SecureStorage {
  late final FlutterSecureStorage? _store;

  @postConstruct
  void init() {
    _store = FlutterSecureStorage(
      aOptions: _getAndroidOptions(),
      iOptions: _getIOSOptions(),
    );
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  IOSOptions _getIOSOptions() => const IOSOptions(
        accountName: "flutter_secure_storage_service",
      );

  /// Check if the secure storage has been initialized
  bool hasInitialized() {
    return _store != null;
  }

  /// Check if the secure storage has an item with the given key
  Future<bool> hasItem(String key) async {
    return await _store!.containsKey(key: key);
  }

  /// Set an item in the secure storage
  Future<void> setItem(String key, String value) async {
    return await _store?.write(key: key, value: value);
  }

  /// Get string item from the secure storage
  Future<String?> getItem(String key) async {
    final hasItem = await _store!.containsKey(key: key);
    if (hasItem) {
      return _store.read(key: key);
    }
    return null;
  }

  /// Delete an item from the secure storage
  Future<void> deleteItem(String key) async {
    return await _store?.delete(key: key);
  }

  Future<void> clear() async {
    await _store?.deleteAll();
  }
}
