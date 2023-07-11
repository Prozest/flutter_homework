import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_homework/component/loading.dart';
import 'package:get/get.dart';

import '../../component/snackbar.dart';

class ForgotPasswordCore extends GetxController {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future sendPasswordReset() async{
    if(!formKey.currentState!.validate()) return;

    showLoadingIndicator();

    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
      SnackBarWidget.showSnackBar("Password reset request send");
    } on FirebaseAuthException catch (e){
      SnackBarWidget.showSnackBar(e.message);
    }

    hideLoadingIndicator();
  }
}