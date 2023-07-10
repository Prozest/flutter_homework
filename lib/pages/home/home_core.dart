import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeCore extends GetxController {
  final user = FirebaseAuth.instance.currentUser!;

  void logout(){
    FirebaseAuth.instance.signOut();
  }
}