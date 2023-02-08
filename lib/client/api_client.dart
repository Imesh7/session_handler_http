import 'package:http/http.dart' as http;

class ApiClient {
  static const baseUrl = "http://185.239.208.29:8000/api";
  static const localUrl = "http://192.168.1.18:3001";

  static var client = http.Client();
}
