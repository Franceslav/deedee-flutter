import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

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

  Future<String> getPublicIpAddress() async {
    try {
      final url = Uri.parse('https://api.ipify.org');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return 'Failed to get IP address';
      }
    } catch (e) {
      return 'Failed to get IP address';
    }
  }
}
