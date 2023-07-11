import 'package:flutter/material.dart';
import 'package:flutter_homework/pages/login/login_page.dart';
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
      child: Column(
        children: [
          const SizedBox(height: 200,),
          TextField(
            controller: model.emailController,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(labelText: "Email"),
          ),
          const SizedBox(height: 10,),
          TextField(
            controller: model.passwordController,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(labelText: "Password"),
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
          TextButton(onPressed: (){Get.to(LoginPage());}, child: "Login".text.make())
        ],
      ),
    ),
   );
  }
}