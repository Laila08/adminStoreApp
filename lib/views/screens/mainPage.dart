import 'package:ecommerce/appRouter.dart';
import 'package:ecommerce/views/screens/categoriesScreen.dart';
import 'package:ecommerce/views/screens/homescreen.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Container(
              width: double.infinity,
                height: 410,
                child: Image.asset('assets/images/draw.png',fit: BoxFit.cover,)),

          Expanded(child: CategoryScreen()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        onPressed: (){
          AppRouter.NavigateToWidget(HomeScreen());
        },
        child:Icon(Icons.add) ,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

    );
  }
}