import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_homework/component/snackbar.dart';
import 'package:get/get.dart';

class EmailVerificationCore extends GetxController {


  Future sendVerificationRequest() async{
    try{
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
    } catch (e){
      SnackBarWidget.showSnackBar(e.toString());
    }
  }

  @override
  void onInit() {
    sendVerificationRequest();
    super.onInit();
  }
}