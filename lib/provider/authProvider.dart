import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

const api_url = 'https://oht0ajzg56.execute-api.eu-west-1.amazonaws.com';
const loginUrl = api_url + '/v_1/user/login';
const profileUrl = api_url + '/customer-map-auth/profile';
const refreshTokenUrl = api_url + '/user/refresh-token';
const translationsUrl = api_url + '/dictionary/translations';

class AuthProvider {
  Object _user = {};

  static Login() async {
    SharedPreferences cookies = await SharedPreferences.getInstance();
    final res = await http.Client().post(Uri.https(api_url, loginUrl), body: {
      "email": "santaigo@emser.se",
      "password": "emser2021"
    }, headers: {
      'Content-Type': 'application/json',
    });
    await cookies.setString('user', jsonEncode(res));

    return res;
  }

  RefreshToken() async => {};
}
