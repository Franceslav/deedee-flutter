import 'package:deedee/constants.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(env: [Environment.dev, Environment.prod])
class SharedUtils {
  static const _keyPhotoUploadServiceIpAddress = "key_photo_upload_service_ip_address";
  static const _keyPhotoUploadServicePort = "key_photo_upload_service_port";
  static const _defaultPhotoServiceIpAddress = "127.0.0.1";
  static const _defaultPhotoServicePort = "1234";

  late SharedPreferences _sharedPreferences;

  @PostConstruct()
  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    if (getUploadPhotoServiceIpAddress() == null) {
      saveUploadPhotoServiceIpAddress(_defaultPhotoServiceIpAddress);
    }
    if (getUploadPhotoServicePort() == null) {
      saveUploadPhotoServicePort(_defaultPhotoServicePort);
    }
  }

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
      final url = Uri.parse(IP_DETECTOR_SERVICE_URL);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return 'Failed to get IP address';
      }
    } catch (e) {
      return 'Failed to get IP address';
    }
  }

  Future saveUserPlace(String place) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString('place', place);
  }

  Future<String?> getUserPlace() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('place');
  }

  String? getUploadPhotoServiceIpAddress() =>
      _sharedPreferences.getString(_keyPhotoUploadServiceIpAddress);

  String? getUploadPhotoServicePort() =>
      _sharedPreferences.getString(_keyPhotoUploadServicePort);

  void saveUploadPhotoServiceIpAddress(String photoUploadIpAddress) {
    _sharedPreferences.setString(_keyPhotoUploadServiceIpAddress, photoUploadIpAddress);
  }

  void saveUploadPhotoServicePort(String photoUploadPort) {
    _sharedPreferences.setString(_keyPhotoUploadServicePort, photoUploadPort);
  }
}
