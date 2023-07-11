import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_homework/component/loading.dart';
import 'package:get/get.dart';

import '../../app/app_routes.dart';

class HomeCore extends GetxController {
  final user = FirebaseAuth.instance.currentUser!;

  FirebaseAuth auth = FirebaseAuth.instance;

  Future logout() async{
    showLoadingIndicator();
    await auth.signOut();
    hideLoadingIndicator();
    Get.offAllNamed(Routes.main);
  }

  checkLogged() async{
    if(auth.currentUser == null){
      Get.offAllNamed(Routes.main);
    }
  }

  @override
  void onInit() {
    checkLogged();
    super.onInit();
  }
}