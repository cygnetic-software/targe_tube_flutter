import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aneen/controllers/auth_controller.dart';
import 'package:aneen/utils/vertical_spacer.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final authController = Get.find<AuthController>();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
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
                  "Register",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                ),
                VerticalSpacer(28),
                TextFormField(
                  validator: authController.signupDisplayNameValidater,
                  controller: authController.nameController,
                  decoration: InputDecoration(
                    hintText: 'Name',
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
                  validator: authController.signupPasswordValidater,
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
                TextFormField(
                  validator: authController.signupConfirmPasswordValidater,
                  controller: authController.confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
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
                    Checkbox(
                      value: false,
                      onChanged: (bool? value) {},
                    ),
                    Text("I have read and agree to the"),
                    TextButton(
                        onPressed: () {
                          print("pressed");
                        },
                        child: Text("Terms of Use"))
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      authController.signUp(
                          authController.nameController.text,
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
                    'Register',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                VerticalSpacer(16),
                Column(
                  children: [
                    Text("Already have an account?"),
                    TextButton(
                        onPressed: () {
                          authController.goToLogin();
                        },
                        child: Text("Login Now"))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
