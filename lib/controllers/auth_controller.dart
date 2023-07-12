import 'package:aneen/controllers/setting_controller.dart';
import 'package:aneen/global/user.dart';
import 'package:aneen/model/user_model.dart' as um;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum PageState { login, register, profile }

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var pageState = PageState.profile.obs;
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    authListener();
  }

  void authListener() {
    _auth.authStateChanges().listen((User? usr) async {
      if (usr == null) {
        pageState.value = PageState.login;
      } else {
        final value = await FirebaseFirestore.instance
            .collection('users')
            .doc(usr.uid)
            .get();
        user.value = um.User(
            id: usr.uid,
            username: usr.displayName.toString(),
            email: usr.email.toString(),
            blockedUsers: value.data()!["blockedUsers"],
            posts: value.data()!["posts"]);

        pageState.value = PageState.profile;
      }
    });
  }

  String? emailValidater(String? value) {
    if (value!.isEmpty) {
      return "Field cannot be empty";
    } else if (!value.isEmail) {
      return "Invalid Email";
    }
  }

  String? loginPasswordValidater(String? value) {
    if (value!.isEmpty) {
      return "Field cannot be empty";
    }
  }

  String? signupDisplayNameValidater(String? value) {
    if (value!.isEmpty) {
      return "Field cannot be empty";
    }
    if (value!.length < 3) {
      return "Name too short. Must be atleast 3 characters";
    }
  }

  String? signupPasswordValidater(String? value) {
    if (value!.isEmpty) {
      return "Field cannot be empty.";
    } else if (value.length < 8) {
      return "Password too short. Must be atleast 8 characters";
    }
  }

  String? signupConfirmPasswordValidater(String? value) {
    if (value!.isEmpty) {
      return "Field cannot be empty.";
    } else if (value != passwordController.text) {
      return "Passwords must match.";
    }
  }

  Future<void> signIn(String email, String password) async {
    // pageState.value = PageState.profile;

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.snackbar("Login Success", "Congratulations",
          backgroundColor: Colors.green[200],
          margin: EdgeInsets.all(10),
          borderRadius: 1);
      pageState.value = PageState.profile;
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Login Error", e.message.toString(),
          backgroundColor: Colors.red[500],
          colorText: Colors.white,
          margin: EdgeInsets.all(10),
          borderRadius: 1);
    } catch (e) {
      Get.snackbar("Internal Server Error", e.toString(),
          backgroundColor: Colors.red[500],
          colorText: Colors.white,
          margin: EdgeInsets.all(10),
          borderRadius: 1);
    }
    emailController.text = "";
    passwordController.text = "";
  }

  Future<void> signUp(String name, String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Updating the username
      await userCredential.user!.updateDisplayName(name);

      // Creating user in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'name': name,
        'email': email,
        'posts': [], // Initializing empty list for posts
        'blockedUsers': [] // Initializing empty list for blocked users
      });

      // Updating local user model
      user = um.User(
        id: userCredential.user!.uid,
        username: name,
        email: email,
      ).obs;

      pageState.value = PageState.profile;
      Get.snackbar("SignUp Success", "Welcome Back",
          backgroundColor: Colors.green[200],
          margin: EdgeInsets.all(10),
          borderRadius: 1);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("SignUp Error", e.message.toString(),
          backgroundColor: Colors.red[500],
          colorText: Colors.white,
          margin: EdgeInsets.all(10),
          borderRadius: 1);
    } catch (e) {
      Get.snackbar("Internal Server Error", e.toString(),
          backgroundColor: Colors.red[500],
          colorText: Colors.white,
          margin: EdgeInsets.all(10),
          borderRadius: 1);
    }
    emailController.text = "";
    passwordController.text = "";
    nameController.text = "";
    confirmPasswordController.text = "";
  }

  void signOut() {
    _auth.signOut();
    pageState.value = PageState.login;
  }

  void goToLogin() {
    pageState.value = PageState.login;
  }

  void goToRegister() {
    pageState.value = PageState.register;
  }

  void goToProfile() {
    pageState.value = PageState.profile;
  }
}
