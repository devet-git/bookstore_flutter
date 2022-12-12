// ignore_for_file: use_build_context_synchronously

import 'package:book_app/layouts/main_layout.dart';
import 'package:book_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../components/my_button.dart';
import '../helpers/change_screen.dart';
import '../helpers/gen_edge_insets.dart';
import 'signup_screen.dart';
import '../helpers/validators.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String email = "", password = "";
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
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: appBar(context),
        body: body(context),
      ),
    );
  }

  Transform body(BuildContext context) {
    return Transform.translate(
      offset: Offset(
          0.0, MediaQuery.of(context).viewInsets.bottom == 0 ? 100 : -10),
      child: Container(
        padding: genEdgeInsets([10, 25]),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: genEdgeInsets([0, 0, 20]),
                    child: txtEmail(),
                  ),
                  txtPassword(),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Don't have an account?"),
                Expanded(
                  child: MyButton(
                    "Resgister",
                    style: MyButtonStyle(color: Colors.white),
                    onPressed: () {
                      ChangeScreen.newScreen(context, const SignUpScreen());
                    },
                  ),
                ),
                const SizedBox(width: 50),
                btnLogin(),
              ],
            )
          ],
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      title: const Text("Đăng nhập"),
      actions: [
        IconButton(
          onPressed: () =>
              ChangeScreen.newUniqueScreen(context, const MainLayout()),
          icon: const Icon(Icons.home_outlined),
        )
      ],
    );
  }

  Widget btnLogin() {
    return ClipOval(
      child: Material(
        color: Colors.blue, // Button color
        child: InkWell(
          splashColor: Colors.red, // Splash color
          onTap: () async {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState?.save();
            }
            User? user = await AuthService().signInWithEmailPw(email, password);
            if (user != null) {
              ChangeScreen.newUniqueScreen(context, const MainLayout());
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Account is not exist")));
            }
          },
          child: const SizedBox(
            width: 56,
            height: 56,
            child: Icon(Icons.arrow_forward),
          ),
        ),
      ),
    );
  }

  TextFormField txtEmail() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Email",
        labelStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty || value.trim() == "") {
          return "Email is required";
        }
        if (!Validators(value).isValidEmail()) {
          return "Email is invalid";
        }
        return null;
      },
      onChanged: (value) => {
        email = value,
        setState(() => {email = value})
      },
    );
  }

  TextFormField txtPassword() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Password",
        labelStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      obscureText: true,
      validator: ((value) {
        if (value!.isEmpty || value.trim() == "") {
          return "Password is required";
        }
        return null;
        // if (!Validators(value).isValidPassword()) {
        //   return "Please enter correct password";
        // }
      }),
      onChanged: (value) {
        password = value;
        setState(() => password = value);
      },
    );
  }
}
