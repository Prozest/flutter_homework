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

  bool isEmailVerified = false;

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

  checkVerified(){
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
  }

  checkLogged() async{
    await Future.delayed(Duration(milliseconds: 300));
    if(auth.currentUser != null){
      checkVerified();
      if(isEmailVerified){
        Get.offAllNamed(Routes.home);
      } else {
        Get.offAllNamed(Routes.emailverification);
      }
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