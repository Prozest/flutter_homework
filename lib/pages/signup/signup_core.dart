import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_homework/component/loading.dart';
import 'package:get/get.dart';

import '../../app/app_routes.dart';

class SignUpCore extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  Future signup() async{
    showLoadingCircle();
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(), 
        password: passwordController.text.trim());
      hideLoadingIndicator();
      checkLogged();
    } on FirebaseAuthException catch (e) {
      hideLoadingIndicator();
      print(e);
    }
  }

  checkLogged() async{
    if(auth.currentUser == null){
      Get.offAllNamed(Routes.home);
    }
  }

  @override
  void onInit() {
    checkLogged();
    super.onInit();
  }
}