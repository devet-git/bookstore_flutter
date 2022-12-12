import 'dart:convert';
import 'package:flutter/material.dart';
import 'change_screen.dart';

import '../screens/welcome_screen.dart';
import 'package:http/http.dart' as http;
import 'profile.dart';
import 'token.dart';

class Helper {
  static String linkRegister = "https://chocaycanh.club/public/api/register";
  static String linkLogin = "https://chocaycanh.club/public/api/login";
  static String linkProfile = "https://chocaycanh.club/public/api/me";
  static String linkUpdateProfile =
      "https://chocaycanh.club/public/api/me/details";
  static String linkUploadavatar =
      "https://chocaycanh.club/public/api/me/avatar";
  static String token = "";
  static Widget createBottomNaviItem(
      String title, IconData icon, Function() press) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: press,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }

  static Future<void> postSignup(
      BuildContext context, String username, String mail, String pass) async {
    final http.Response response = await http.post(
      Uri.parse(linkRegister),
      headers: <String, String>{
        'Content-Type': 'aplication/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "username": username,
        "email": mail,
        "password": pass,
        "password_confirmation": pass,
        "tos": 'true',
      }),
    );
    debugPrint('trong phuong thuc dang nhap');
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    if (response.statusCode == 201) {
      // ignore: use_build_context_synchronously
      ChangeScreen.nextScreen(context, const WelcomeScreen());
    } else {
      // throw Exception('Khong xac dinh loi trong dang ky');
    }
  }

  static Future<void> getProfile(BuildContext context) async {
    final http.Response response = await http.get(
      Uri.parse(linkProfile),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${Token.value}',
        'Accept': 'application/json',
      },
    );
    debugPrint('.. get profile ..');
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      Profile.fromJson(body["data"]);
      // ignore: use_build_context_synchronously
      // ChangeScreen.newUniqueScreen(context, const MyAccountScreen2());
    } else {
      // throw Exception('Khong xac dinh loi trong dang ky');
    }
  }
}
