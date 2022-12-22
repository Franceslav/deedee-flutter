import 'package:shared_preferences/shared_preferences.dart';

class SharedUtils {
  Future<String?> getPrefsIpAddress() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('ipAddress');
  }

  Future<String?> getPrefsPort() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('port');
  }

  Future saveIpAddress(String ipAddress) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString('ipAddress', ipAddress);
  }

  Future savePort(String port) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString('port', port);
  }

  Future clearAll() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove('ipAddress');
    return await sharedPreferences.remove('port');
  }
}
