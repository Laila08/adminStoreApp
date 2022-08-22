import 'package:ecommerce/appRouter.dart';
import 'package:ecommerce/provider/authProvider.dart';
import 'package:ecommerce/views/screens/mainPage.dart';
import 'package:ecommerce/views/screens/sliderScreen.dart';
import 'package:ecommerce/views/userScren/mainPageScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FirstScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(height: 60,),
            // Row(
            //     children:[
            //       SizedBox(width: 40,),
            //   IconButton(onPressed: (){
            //     Provider.of<AuthProvider>(context,listen: false).SignOut();
            //   }, icon: Icon(Icons.logout,color:Colors.black,))
            // ]),
            InkWell(
              onTap: (){
                AppRouter.NavigateToWidget(MainPage());
              },
              child: Container(
                margin: EdgeInsetsDirectional.only(top: 90,start: 70,end: 70,),
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffe2cce8),
                ),
                child: Text('Categories',style: GoogleFonts.elMessiri (fontSize: 30,color:Colors.black38.withOpacity(0.6),fontWeight: FontWeight.bold),textAlign: TextAlign.center),
              ),
            ),
            SizedBox(height: 30,),
            InkWell(
              onTap: (){
                AppRouter.NavigateToWidget(SliderScreen());
              },
              child: Container(
                margin: EdgeInsetsDirectional.only(top: 10,start: 70,end: 70,bottom: 20),
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffe2cce8),
                ),
                child: Text('Sliders',style: GoogleFonts.elMessiri (fontSize: 30,color:Colors.black38.withOpacity(0.6),fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              ),
            ),
            SizedBox(height: 30,),
            InkWell(
              onTap: (){
                AppRouter.NavigateToWidget(MainPageUser());
              },
              child: Container(
                margin: EdgeInsetsDirectional.only(start: 70,end: 70,bottom: 20),
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffe2cce8),
                ),
                child: Text('Show as user',style: GoogleFonts.elMessiri (fontSize: 30,color:Colors.black38.withOpacity(0.6),fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/ww.jpeg',),
            fit: BoxFit.cover
          )
        ),
      ),
    );
  }

}