import 'package:http/http.dart' as http;

class ApiClient {
  static const baseUrl = "http://HOSTNAME/api";
  static const localUrl = "http://HOSTNAME";

  static var client = http.Client();
}
