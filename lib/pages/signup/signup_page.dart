import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_homework/app/app_routes.dart';
import 'package:flutter_homework/pages/signup/signup_core.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpPage extends StatelessWidget {
 const SignUpPage({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   var model = Get.put<SignUpCore>(SignUpCore());

   return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: model.formKey,
        child: Column(
          children: [
            const SizedBox(height: 200,),
            TextFormField(
              controller: model.emailController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: "Email"),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (email) => email != null && !EmailValidator.validate(email) ? "Enter a proper email" : null,
            ),
            const SizedBox(height: 10,),
            TextFormField(
              controller: model.passwordController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(labelText: "Password"),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (password) => password != null && password.length < 6 ? "Password must be atleast 6 characters" : null,
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: (){model.signup();},
                icon: const Icon(Icons.lock_open, size: 30),
                label: "SignUp".text.size(20).make(),
              ),
            ),
            const SizedBox(height: 24,),
            TextButton(onPressed: (){Get.offAllNamed(Routes.main);}, child: "Login".text.make())
          ],
        ),
      ),
    ),
   );
  }
}