import 'package:shared_preferences/shared_preferences.dart';

class StorageKey {
  static const prefsKeyFullName = "PREFS_KEY_FULLNAME";
  static const prefsKeyEmail = "PREFS_KEY_EMAIL";
  static const prefsKeyPhone = "PREFS_KEY_PHONE";
  static const prefsKeyUserID = "PREFS_KEY_UID";
  static const prefsKeyWallet = "PREFS_KEY_WALLET";
}

class AppShared {
  static SharedPreferences? share;

  static Future<SharedPreferences?> init() async {
    share ??= await SharedPreferences.getInstance();
    return share;
  }
}

class AppPreferences {
  static AppPreferences? _instance;

  AppPreferences._();

  static AppPreferences get instance => _instance ??= AppPreferences._();

  Future<void> saveFullName(String fullName) async {
    AppShared.share?.setString(StorageKey.prefsKeyFullName, fullName);
  }

  String? getFullName() {
    return AppShared.share?.getString(StorageKey.prefsKeyFullName);
  }

  Future<void> saveEmail(String email) async {
    AppShared.share?.setString(StorageKey.prefsKeyEmail, email);
  }

  String? getEmail() {
    return AppShared.share?.getString(StorageKey.prefsKeyEmail);
  }

  Future<void> savePhone(String phone) async {
    AppShared.share?.setString(StorageKey.prefsKeyPhone, phone);
  }

  String? getPhone() {
    return AppShared.share?.getString(StorageKey.prefsKeyPhone);
  }

  Future<void> saveUserID(String uid) async {
    AppShared.share?.setString(StorageKey.prefsKeyUserID, uid);
  }

  String? getUserID() {
    return AppShared.share?.getString(StorageKey.prefsKeyUserID);
  }

  Future<void> saveWallet(int wallet) async {
    AppShared.share?.setInt(StorageKey.prefsKeyWallet, wallet);
  }

  int? getWallet() {
    return AppShared.share?.getInt(StorageKey.prefsKeyWallet);
  }

  Future<void> logout() async {
    AppShared.share?.remove(StorageKey.prefsKeyFullName);
    AppShared.share?.remove(StorageKey.prefsKeyEmail);
    AppShared.share?.remove(StorageKey.prefsKeyPhone);
    AppShared.share?.remove(StorageKey.prefsKeyUserID);
  }
}
