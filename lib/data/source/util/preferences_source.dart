import "package:aroma_mobile/data/model/error_model.dart";
import "package:shared_preferences/shared_preferences.dart";

typedef PreferencesAction<T> = Future<T> Function(SharedPreferencesAsync preferences);

abstract class PreferencesSource {
  final SharedPreferencesAsync _preferences;

  PreferencesSource({required SharedPreferencesAsync? preferences})
    : _preferences = preferences ?? SharedPreferencesAsync(); // coverage:ignore-line

  Future<T> getItem<T>(String key, ErrorCode errorCode, PreferencesAction<T> getter) async {
    try {
      return await getter(_preferences);
    } catch (e) {
      throw ErrorModel(errorCode, message: "$key saving error: $e");
    }
  }

  Future<void> saveItem(String key, ErrorCode errorCode, PreferencesAction<void> saver) async {
    try {
      await saver(_preferences);
    } catch (e) {
      throw ErrorModel(errorCode, message: "$key saving error: $e");
    }
  }
}
