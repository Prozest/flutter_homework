import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'emailverification_core.dart';

class EmailVerificationPage extends StatelessWidget {
 const EmailVerificationPage({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   var model = Get.put<EmailVerificationCore>(EmailVerificationCore());

   return Scaffold(
    body: Center(
      child: "Verification Request Sent".text.make(),
    ),
   );
  }
}