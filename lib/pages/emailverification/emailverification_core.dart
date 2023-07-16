import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_homework/component/snackbar.dart';
import 'package:get/get.dart';

import '../../app/app_routes.dart';

class EmailVerificationCore extends GetxController {

  Timer? timer;

  Future sendVerificationRequest() async{
    try{
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      timer = Timer.periodic(
        Duration(seconds: 3), 
        (_) {checkEmailVerified();});
    } catch (e){
      SnackBarWidget.showSnackBar(e.toString());
    }
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();

    if(FirebaseAuth.instance.currentUser!.emailVerified){
      timer?.cancel();
      Get.offAllNamed(Routes.home);
    }
  }

  @override
  void dispose(){
    timer?.cancel();
    super.dispose();
  }

  @override
  void onInit() {
    sendVerificationRequest();
    super.onInit();
  }
}