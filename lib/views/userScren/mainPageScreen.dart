import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/appRouter.dart';
import 'package:ecommerce/model/sliderModel.dart';
import 'package:ecommerce/provider/authProvider.dart';
import 'package:ecommerce/provider/fireStoreProvider.dart';
import 'package:ecommerce/views/screens/categoriesScreen.dart';
import 'package:ecommerce/views/screens/homescreen.dart';
import 'package:ecommerce/views/userScren/cateroryScreenUser.dart';
import 'package:ecommerce/views/userScren/userSliderWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainPageUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        // leading: IconButton(onPressed: (){
        //   Provider.of<AuthProvider>(context,listen: false).SignOut();
        // }, icon: Icon(Icons.logout,color:Colors.black,)),
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Container(
          margin: EdgeInsetsDirectional.only(top: 25),
            child: Text('LAWHTI',style: GoogleFonts.elMessiri (fontSize: 40,color:Colors.teal,fontWeight: FontWeight.bold))),
      ),
      body: Consumer<FireStoreProvider>(
        builder: (context,provider,x) {
          return Column(
            children: [
              //SizedBox(height: 60,),
              // Row(
              //     children:[
              //       SizedBox(width: 40,),
              //       IconButton(onPressed: (){
              //         Provider.of<AuthProvider>(context,listen: false).SignOut();
              //       }, icon: Icon(Icons.logout,color:Colors.black,))
              //     ]),
              Container(
                margin: EdgeInsetsDirectional.only(top: 20),
                      width: double.infinity,
                      height: 300,
                      child: CarouselSlider.builder  (
                          itemCount: provider.imagesliderslist.length
                          ,  itemBuilder:(context,index,x){
                        return
                          provider.imagesliderslist.isEmpty?
                                Text(''):
                          UserSliderWidget(provider.imagesliderslist[index]);
                          //Image.network('https://static9.depositphotos.com/1719616/1205/i/600/depositphotos_12057489-stock-photo-sunflower-field.jpg');
                          // Image.network(sliderModel.imagesliderUrl,height: 200,);
                          //UserSliderWidget(provider.imagesliderslist[index]);

                      },
                          options: CarouselOptions(autoPlay: true,
                            height: 270,
                            enlargeCenterPage: true,
                            viewportFraction: .9,
                            aspectRatio: 1.0,
                            initialPage: 0,) ),),
              Expanded(child:CategoryScreenUser() ),
            ],
          );
        }
      ),
    );
  }
}