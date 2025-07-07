import 'package:findjob/services/config.dart';
import 'package:http/http.dart' as https;

class AuthHelper {
  static var client = https.Client();
  static Future<bool> signup(model) async {
    try {
      Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
      var url = Uri.https(Config.apiUrl, Config.signupUrl);
      var response = await client.post(
        url,
        headers: requestHeaders,
        body: model,
      );
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
