import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_homework/component/snackbar.dart';
import 'package:get/get.dart';

import '../../app/app_routes.dart';
import '../../component/loading.dart';

class LoginCore extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  FirebaseAuth auth = FirebaseAuth.instance;

  Future login() async{
    if(!formKey.currentState!.validate()) return;

    showLoadingIndicator();
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(), 
        password: passwordController.text.trim()
      );
    } on FirebaseAuthException catch (e){
      SnackBarWidget.showSnackBar(e.message);
    }
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

  void goToSignUp(){
    Get.offAllNamed(Routes.signup);
  }

  void goToForgotPassword(){
    Get.offAllNamed(Routes.forgotpassword);
  }
}