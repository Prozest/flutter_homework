import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import 'forgotpassword_core.dart';

class ForgotPasswordPage extends StatelessWidget {
 const ForgotPasswordPage({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   var model = Get.put<ForgotPasswordCore>(ForgotPasswordCore());

   return Scaffold(
    appBar: AppBar(
      title: "Reset Password".text.make(),
    ),
    body: Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: model.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            "Send a request to your email\nto reset your password".text.center.size(20).make(),
            TextFormField(
              controller: model.emailController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: "Email"),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (email) => email != null && !EmailValidator.validate(email) ? "Enter a proper email" : null,
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: (){model.sendPasswordReset();}, 
                child: "Reset Password".text.size(16).make()
              ),
            )
          ],
        ),
      ),
    ),
   );
  }
}