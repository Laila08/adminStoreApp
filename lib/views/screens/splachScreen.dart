import 'package:ecommerce/provider/authProvider.dart';
import 'package:ecommerce/data/authHelper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class SplachScreen extends StatelessWidget{
  navigateFun(BuildContext context)async{
    await Future.delayed(Duration(seconds: 2));
    Provider.of<AuthProvider>(context,listen: false).checkUser();
  }
  @override
  Widget build(BuildContext context) {
    navigateFun(context);
   return Scaffold(
     backgroundColor: Colors.white,
     body: Center(child: Image.asset('assets/images/lawhate.jpeg'),),
   );
  }
}