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
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: "Verification Request Sent".text.size(20).make(),
        ),
        SizedBox(height: 10,),
        ElevatedButton(onPressed: (){model.sendVerificationRequest();}, child: "Send Another Request".text.size(16).make())
      ],
    ),
   );
  }
}