import 'package:ecommerce/appRouter.dart';
import 'package:flutter/material.dart';

class CustomDialog  {
  static showDialogFunction(String content){
    showDialog(context: AppRouter.navKey.currentContext!, builder: (context){return AlertDialog(
      content: Text(content),
      actions: [TextButton(onPressed: (){
        AppRouter.popRouter();
      }, child: Text('ok'))],
    );});
  }
}