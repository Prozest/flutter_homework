import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_homework/component/loading.dart';
import 'package:get/get.dart';

import '../../app/app_routes.dart';
import '../../component/snackbar.dart';

class SignUpCore extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  final formKey = GlobalKey<FormState>();

  Future signup() async{
    showLoadingCircle();

    final isValid = formKey.currentState!.validate();
    if(!isValid) return;

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(), 
        password: passwordController.text.trim());
      hideLoadingIndicator();
      checkLogged();
    } on FirebaseAuthException catch (e) {
      hideLoadingIndicator();
      SnackBarWidget.showSnackBar(e.message);
    }
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