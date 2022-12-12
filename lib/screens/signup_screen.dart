import 'package:book_app/layouts/main_layout.dart';
import 'package:book_app/screens/signin_screen.dart';
import 'package:book_app/services/auth_service.dart';
import 'package:book_app/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/my_box.dart';
import '../components/my_button.dart';
import '../helpers/app_sizes.dart';
import '../helpers/change_screen.dart';
import '../helpers/gen_edge_insets.dart';

import '../helpers/validators.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String email = "", username = "", password = "", rePassword = "";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
          colors: [
            Color.fromARGB(255, 179, 163, 243),
            Color.fromARGB(255, 246, 155, 155),
            Color.fromARGB(255, 99, 175, 238),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Đăng ký"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: genEdgeInsets([20, 30, 0]),
            // color: const Color.fromARGB(255, 225, 255, 226),
            height:
                AppSizes.deviceSize(context).height - AppSizes.appBarHeight(),
            child: Column(children: [
              Form(
                key: _formKey,
                child: MyBox(
                  style: MyBoxStyle(
                    padding: [15, 10],
                    margin: [0, 0, 20],
                    backColor: const Color.fromARGB(73, 224, 250, 221),
                    borderRadius: 10,
                    border: [2, "solid", Colors.green],
                  ),
                  child: Column(
                    children: [
                      txtEmail(),
                      txtPassword(),
                      txtRePassword(),
                      Container(
                        padding: genEdgeInsets([20, 0, 0]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Flexible(
                              child: Text("Or you can"),
                            ),
                            MyButton(
                              "Login",
                              style: MyButtonStyle(color: Colors.blue),
                              onPressed: () {
                                ChangeScreen.newScreen(
                                    context, const SignInScreen());
                              },
                            ),
                            const SizedBox(
                              width: 130,
                            ),
                            btnRegister(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget btnRegister() {
    return TextButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.green[300])),
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState?.save();
        }
        User? user =
            await AuthService().signUpWithEmailAndPassword(email, password);
        if (user != null) {
          await UserService().add(
            userId: user.uid,
            name: "",
            email: email,
          );
          // ignore: use_build_context_synchronously
          ChangeScreen.newUniqueScreen(context, const MainLayout());
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const AlertDialog(
                title: Text("Tài khoản đã tồn tại hoặc email không hợp lệ"),
              );
            },
          );
        }
      },
      child: const Icon(
        Icons.arrow_forward_ios_sharp,
        color: Colors.white,
      ),
      // icon: const Icon(Icons.arrow_forward_ios_sharp),
    );
  }

  TextFormField txtEmail() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Email",
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value!.isEmpty || value == "") {
          return "Email is required";
        }
        if (!Validators(value).isValidEmail()) {
          return "Please enter valid email";
        }
        return null;
      },
      onChanged: (value) => {
        setState(() => {email = value})
      },
    );
  }

  TextFormField txtUsername() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Username"),
      validator: (value) {
        if (value!.isEmpty || value == "") {
          return "Username is required";
        }
        if (!Validators(value).isValidUsername()) {
          return "Please enter valid username";
        }
        return null;
      },
      onChanged: (value) => {
        setState(() => {username = value})
      },
    );
  }

  TextFormField txtPassword() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Password"),
      validator: (value) {
        if (value!.isEmpty || value == "") {
          return "Password is required";
        }
        // if (!Validators(value).isValidPassword()) {
        //   return "Please enter valid password";
        // }
        return null;
      },
      onChanged: (value) => {
        setState(() => {password = value})
      },
    );
  }

  TextFormField txtRePassword() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Re-password"),
      validator: (value) {
        if (value!.isEmpty || value.trim() == "") {
          return " is required";
        }
        if (value != password) {
          return "Password does not match";
        }
        // if (!Validators(value).isValidPassword()) {
        //   return "Please enter valid re-password";
        // }
        return null;
      },
      onChanged: (value) => {
        setState(() => {rePassword = value})
      },
    );
  }
}
