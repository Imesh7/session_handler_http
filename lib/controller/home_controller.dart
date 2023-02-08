import 'package:flutter/material.dart';
import 'package:session_handling_http/core/services/shared_pref.dart';
import 'dart:convert' as convert;
import '../client/api_client.dart';
import '../client/refresh_token_handler.dart';

class HomeController extends ChangeNotifier {
  bool isLoading = false;

  getHomeData({BuildContext? context}) async {
    isLoading = true;
    try {
      String? accesToken = await SharedPref.getAccessToken();

      var response = await ApiClient.client
          .post(Uri.parse("${ApiClient.localUrl}/dashboard"), headers: {
        "Authorization": accesToken! /* "555" */,
        "Content-Type": "application/json; charset=UTF-8",
      });

      switch (response.statusCode) {
        case 200:
          var jsonResponse =
              convert.jsonDecode(response.body) as Map<String, dynamic>;
          return jsonResponse;

        case 401:
          await RefreshTokenHandler().getRefreshToken();
          return getHomeData();

        default:
          throw Exception(response.reasonPhrase);
      }
    } on Exception catch (e) {
      debugPrint(e.toString());
      showDialog(
          context: context!,
          builder: (BuildContext context) => Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(e.toString()),
                ),
              ));
      rethrow;
    } finally {
      isLoading = false;
    }
  }
}
