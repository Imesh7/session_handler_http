import 'package:flutter/material.dart';
import '../client/api_client.dart';
import 'dart:convert';
import '../core/services/shared_pref.dart';
import '../view/home.dart';

class LoginController extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  login(BuildContext context) async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      try {
        isLoading = true;
        notifyListeners();

        Map bodydata = {
          "customer_email": emailController.text,
          "customer_password": passwordController.text
        };

        var response = await ApiClient.client.post(
            Uri.parse("${ApiClient.baseUrl}/customer-login"),
            headers: {"Content-Type": "application/json; charset=UTF-8"},
            body: json.encode(bodydata));

        if (response.statusCode == 200) {
          var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

          if (jsonResponse['status'] == "Success") {
            await SharedPref.setAccessToken(jsonResponse['token']);
            await SharedPref.setAccessToken(jsonResponse['refreshToken']);
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const Home()));
          }
        }
      } catch (e) {
        debugPrint(e.toString());
        rethrow;
      } finally {
        isLoading = false;
        notifyListeners();
      }
    }
  }
}
