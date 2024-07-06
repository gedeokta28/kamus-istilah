import 'package:kamus_istilah/utility/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Session {
  set setLoggedIn(bool value);
  set setId(String value);
  set setFullname(String value);
  set setUsername(String value);

  bool get isLoggedIn;
  String get sessionId;
  String get sessionFullname;
  String get sessionUsername;
  Future<void> clearSession();
}

class SessionHelper implements Session {
  final SharedPreferences pref;

  SessionHelper({required this.pref});

  @override
  set setLoggedIn(bool value) {
    pref.setBool(strIsLoggedIn, value);
  }

  @override
  set setId(String value) {
    pref.setString(strId, value);
  }

  @override
  set setFullname(String value) {
    pref.setString(strFullName, value);
  }

  @override
  set setUsername(String value) {
    pref.setString(strUsername, value);
  }

  @override
  bool get isLoggedIn => pref.getBool(strIsLoggedIn) ?? false;

  @override
  String get sessionId => pref.getString(strId) ?? '';

  @override
  String get sessionFullname => pref.getString(strFullName) ?? '';

  @override
  String get sessionUsername => pref.getString(strUsername) ?? '';

  @override
  Future<void> clearSession() async {
    await pref.clear();
  }
}
