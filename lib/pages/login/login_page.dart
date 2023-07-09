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
              onPressed: (){model.login();},
              icon: const Icon(Icons.lock_open, size: 30),
              label: "Login".text.size(20).make(),
            ),
          )
        ],
      ),
    ),
   );
  }
}