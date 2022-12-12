import 'dart:convert';

import 'package:flutter/material.dart';
import '../helpers/helper.dart';
import '../helpers/profile.dart';
import '../helpers/token.dart';

import 'package:http/http.dart' as http;

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  String firstName = "";
  String lastName = "";
  String email = "";
  String phone = "";
  String address = "";
  String messError = "";
  final _formkey = GlobalKey<FormState>();
  String? updateFirstName(String? value) {
    firstName = value!;
    if (value.isEmpty == true) {
      setState(() {
        messError = "First name can not be empty";
      });
    }
    return null;
  }

  String? updateLastName(String? value) {
    lastName = value!;
    if (value.isEmpty == true && messError.isEmpty) {
      setState(() {
        messError = "Last name can not be empty";
      });
    }
    return null;
  }

  String? updateEmail(String? value) {
    email = value!;
    if (value.isEmpty == true && messError.isEmpty) {
      setState(() {
        messError = "Email can not be empty";
      });
    }
    return null;
  }

  String? updateAddress(String? value) {
    address = value!;
    if (value.isEmpty == true && messError.isEmpty) {
      setState(() {
        messError = "Address can not be empty";
      });
    }
    return null;
  }

  String? updatePhone(String? value) {
    phone = value!;
    if (value.isEmpty == true && messError.isEmpty) {
      setState(() {
        messError = "Phone can not be empty";
      });
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Profile"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  createTextFormFieldUpdate(
                      'First Name', Profile.firstName, updateFirstName),
                  createTextFormFieldUpdate(
                      'Last Name', Profile.lastName, updateLastName),
                  createTextFormFieldUpdate(
                      'Phone', Profile.phone, updatePhone),
                  createTextFormFieldUpdate(
                      'Email', Profile.email, updateEmail),
                  createTextFormFieldUpdate(
                      'Address', Profile.address, updateAddress),
                  Text(messError),
                  TextButton.icon(
                      onPressed: () {
                        if (_formkey.currentState?.validate() == true) {
                          _formkey.currentState?.save();
                          postUpdatedetail(context);
                        }
                      },
                      icon: const Icon(Icons.app_registration_rounded),
                      label: const Text("Save")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void postUpdatedetail(BuildContext context) {
    // debugPrint('trong phuong thuc debug');
    postUpdateDetail(context);
  }

  Future<void> postUpdateDetail(BuildContext context) async {
    final http.Response response = await http.patch(
      Uri.parse(Helper.linkUpdateProfile),
      headers: <String, String>{
        'Content-Type': 'aplication/json; charset=UTF-8',
        'Authorization': 'Bearer ${Token.value}',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, String>{
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "email": email,
        "address": address,
        "provinceid": '1',
        "provincename": '1',
        "districtid": '1',
        "districtname": '1',
        "wardid": '1',
        "wardname": '1',
        "street": address,
      }),
    );
    debugPrint('.. update detail ..');
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    if (!mounted) return;
    if (response.statusCode == 200) {
      Helper.getProfile(context);
    } else {
      // throw Exception('Khong xac dinh loi trong dang ky');
    }
  }

  TextFormField createTextFormFieldUpdate(
      String label, String content, String? Function(String? value) f) {
    return TextFormField(
      onChanged: f,
      validator: f,
      initialValue: content,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}
