import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginCore extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future login() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(), 
      password: passwordController.text.trim()
    );
  }
}