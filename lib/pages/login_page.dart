import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aneen/controllers/auth_controller.dart';
import 'package:aneen/pages/register_page.dart';
import 'package:aneen/utils/vertical_spacer.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final authController = Get.find<AuthController>();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: Colors.transparent,
                          width: 2.0,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                          'assets/images/aneenLogo.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    VerticalSpacer(28),
                    Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                    VerticalSpacer(28),
                    TextFormField(
                      validator: authController.emailValidater,
                      controller: authController.emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                    VerticalSpacer(16),
                    TextFormField(
                      validator: authController.loginPasswordValidater,
                      controller: authController.passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                    VerticalSpacer(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("By logging in, you accept our"),
                        TextButton(
                            onPressed: () {
                              print("pressed");
                            },
                            child: Text("Terms of Use"))
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          authController.signIn(
                              authController.emailController.text,
                              authController.passwordController.text);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    VerticalSpacer(16),
                    Column(
                      children: [
                        Text("Don't have an account yet?"),
                        TextButton(
                            onPressed: () {
                              authController.goToRegister();
                            },
                            child: Text("Register Now"))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
