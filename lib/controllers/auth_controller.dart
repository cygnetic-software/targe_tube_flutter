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
    _auth.authStateChanges().listen((User? usr) async {
      print("00000000000000000000000000000000000000000000000000000");
      print("I WAS CALLLLLEDDDDDD");
      print("11111111111111111111111111111111111111111111111111111");
      if (usr == null) {
        print("here i am ");
        user.value = um.User(
            id: "", username: "", email: "", blockedUsers: [], posts: []);
        pageState.value = PageState.login;
      } else {
        final value = await FirebaseFirestore.instance
            .collection('users')
            .doc(usr.uid)
            .get();
        user.value = um.User(
            id: value.id,
            username: value.data()!["name"],
            email: value.data()!["email"],
            blockedUsers: value.data()!["blockedUsers"],
            posts: value.data()!["posts"]);

        pageState.value = PageState.profile;
      }
    });
    super.onInit();
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
        blockedUsers: [],
        posts: [],
      ).obs;

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

  void signOut() async {
    await _auth.signOut();
  }

  void blockUser(String userId) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String currentUserId = user.value.id; // Replace with the current user's ID

    try {
      DocumentReference userRef =
          firestore.collection('users').doc(currentUserId);

      // Fetch the current list of blocked users
      DocumentSnapshot userSnapshot = await userRef.get();
      List<String> blockedUsers =
          List<String>.from(userSnapshot.get('blockedUsers'));

      // Add the blocked user to the list if not already present
      if (!blockedUsers.contains(userId)) {
        blockedUsers.add(userId);
      }

      // Update the 'blockedUsers' field in Firestore
      await userRef.update({'blockedUsers': blockedUsers});

      print('User blocked successfully');
    } catch (e) {
      print('Error blocking user: $e');
    }
  }

  Future<void> unblockUser(String userId) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String currentUserId = user.value.id; // Replace with the current user's ID

    try {
      DocumentReference userRef =
          firestore.collection('users').doc(currentUserId);

      // Fetch the current list of blocked users
      DocumentSnapshot userSnapshot = await userRef.get();
      List<String> blockedUsers =
          List<String>.from(userSnapshot.get('blockedUsers'));

      // Remove the user from the blockedUsers list
      if (blockedUsers.contains(userId)) {
        blockedUsers.remove(userId);
      }

      // Update the 'blockedUsers' field in Firestore
      await userRef.update({'blockedUsers': blockedUsers});

      print('User unblocked successfully');
    } catch (e) {
      print('Error unblocking user: $e');
    }
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
