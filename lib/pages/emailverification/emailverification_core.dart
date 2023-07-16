import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_homework/component/snackbar.dart';
import 'package:get/get.dart';

import '../../app/app_routes.dart';
import '../../component/loading.dart';

class EmailVerificationCore extends GetxController {

  Timer? timer;

  FirebaseAuth auth = FirebaseAuth.instance;

  Future sendVerificationRequest() async{
    try{
      final user = auth.currentUser!;
      await user.sendEmailVerification();

      timer = Timer.periodic(
        Duration(seconds: 3), 
        (_) {checkEmailVerified();});
        
    } catch (e){
      SnackBarWidget.showSnackBar(e.toString());
    }
  }

  Future checkEmailVerified() async {
    await auth.currentUser!.reload();

    if(auth.currentUser!.emailVerified){
      timer?.cancel();
      Get.offAllNamed(Routes.home);
    }
  }

  Future logout() async{
    showLoadingIndicator();

    await auth.signOut();
    timer?.cancel();

    hideLoadingIndicator();
    Get.offAllNamed(Routes.main);
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