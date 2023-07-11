import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/app_routes.dart';
import '../../component/loading.dart';

class LoginCore extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  Future login() async{
    showLoadingIndicator();
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(), 
      password: passwordController.text.trim()
    );
    hideLoadingIndicator();
    checkLogged();
  }

  checkLogged() async{
    if(auth.currentUser != null){
      Get.offAllNamed(Routes.home);
    }
  }

  @override
  void onInit() {
    checkLogged();
    super.onInit();
  }
}