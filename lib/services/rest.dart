import 'package:http/http.dart' as http;

class RestService {

  RestService._();

  static final RestService _instance = RestService._();

  static RestService get instance => _instance;

  onUploadImage(selectedImage) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          "https://a44ae70e-0768-4737-9545-7b3aca98ebf8.mock.pstmn.io/post"),
    );
    Map<String, String> headers = {"Content-type": "multipart/form-data"};
    request.files.add(
      http.MultipartFile(
        'image',
        selectedImage.readAsBytes().asStream(),
        selectedImage.lengthSync(),
        filename: selectedImage.path
            .split('/')
            .last,
      ),
    );
    request.headers.addAll(headers);
    print("request: " + request.toString());
    var res = await request.send();
    http.Response response = await http.Response.fromStream(res);
    print(response.statusCode);
  }
}
