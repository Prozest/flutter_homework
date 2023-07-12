import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_homework/pages/login/login_core.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatelessWidget {
 const LoginPage({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   var model = Get.put<LoginCore>(LoginCore());

   return Scaffold(
    resizeToAvoidBottomInset: false,
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
                onPressed: (){model.login();},
                icon: const Icon(Icons.lock_open, size: 30),
                label: "Login".text.size(20).make(),
              ),
            ),
            const SizedBox(height: 24,),
            TextButton(onPressed: (){model.goToForgotPassword();}, child: "Forgot Password?".text.make()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                "Dont have an account?".text.make(),
                TextButton(onPressed: (){model.goToSignUp();}, child: "Sign Up".text.make())
              ]
            )
          ],
        ),
      ),
    ),
   );
  }
}