import 'package:flutter/material.dart';
import 'package:session_handling_http/client/api_client.dart';
import 'package:session_handling_http/core/services/shared_pref.dart';
import 'dart:convert' as convert;

class RefreshTokenHandler {
   Future getRefreshToken() async {
    String? accesToken = await SharedPref.getAccessToken();

    try {
      var response = await ApiClient.client.post(
          Uri.parse("${ApiClient.localUrl}/refresh_token"),
          headers: {"Authorization": accesToken!});

      if (response.statusCode == 200) {
        var jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;

        SharedPref.setAccessToken(jsonResponse['access_token']);
        SharedPref.setRefreshToken(jsonResponse['refresh_token']);
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
