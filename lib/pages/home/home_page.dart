import 'package:flutter/material.dart';
import 'package:flutter_homework/pages/home/home_core.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
 const HomePage({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   var model = Get.put<HomeCore>(HomeCore());

   return Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: model.user.email!.text.size(20).center.make()
          ),
          const SizedBox(height: 10,),
          ElevatedButton(
            onPressed: (){
              model.logout();
            },
            child: "Logout".text.make()
          )
        ]
      ),
    ),
   );
  }
}