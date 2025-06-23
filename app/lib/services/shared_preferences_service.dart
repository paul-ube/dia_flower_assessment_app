import 'package:dia_flowers_assessment/app/app.logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked_annotations.dart';

class SharedPreferencesService implements InitializableDependency {
  final log = getLogger('SharedPreferencesService');
  static SharedPreferencesService? _instance;
  static SharedPreferences? _preferences;

  /// The preferred language of the user.
  static const String _languageTag = 'kLanguageTag';

  String get languageTag => _getFromDisk<String>(_languageTag) ?? '';

  set languageTag(String value) => saveToDisk<String>(_languageTag, value);

  dynamic _getFromDisk<T>(String key) {
    if (T == List<String>) {
      var value = _preferences?.getStringList(key);
      return value;
    } else {
      var value = _preferences?.get(key);
      return value;
    }
  }

  void saveToDisk<T>(String key, T content) {
    if (content is String) {
      _preferences?.setString(key, content);
    }

    if (content is bool) {
      _preferences?.setBool(key, content);
    }
    if (content is int) {
      _preferences?.setInt(key, content);
    }
    if (content is double) {
      _preferences?.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences?.setStringList(key, content);
    }
  }

  static Future<SharedPreferencesService> getInstance() async {
    _instance ??= SharedPreferencesService();

    _preferences ??= await SharedPreferences.getInstance();

    return _instance!;
  }

  @override
  Future<void> init() => getInstance();
}
