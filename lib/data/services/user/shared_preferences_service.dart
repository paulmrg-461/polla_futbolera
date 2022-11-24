import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static late SharedPreferences _preferences;
  static String _token = '';
  static String _apiWorldCupToken = '';

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static String get token => _preferences.getString('token') ?? _token;

  static set token(String token) {
    _token = token;
    _preferences.setString('token', token);
  }

  static String get apiWorldCupToken =>
      _preferences.getString('apiWorldCupToken') ?? _apiWorldCupToken;

  static set apiWorldCupToken(String apiWorldCupToken) {
    _apiWorldCupToken = apiWorldCupToken;
    _preferences.setString('apiWorldCupToken', apiWorldCupToken);
  }
}
