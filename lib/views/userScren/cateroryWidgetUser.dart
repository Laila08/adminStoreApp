import 'package:ecommerce/appRouter.dart';
import 'package:ecommerce/model/categoer.dart';
import 'package:ecommerce/provider/fireStoreProvider.dart';
import 'package:ecommerce/views/screens/NewProduct.dart';
import 'package:ecommerce/views/screens/mainPage.dart';
import 'package:ecommerce/views/screens/updateWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CategoryWidgetUser extends StatelessWidget{
  Category category;
  CategoryWidgetUser(this.category);
  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (context,provider,x) {
          return  Container(
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xffe2cce8)
              // color:taskModel.bgColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: CircleAvatar(
                    backgroundImage:NetworkImage(category.imageUrl??'https://static9.depositphotos.com/1719616/1205/i/600/depositphotos_12057489-stock-photo-sunflower-field.jpg',),
                    radius: 50,
                  ),
                ),
                SizedBox(height: 5,),
                Text(category.name??'errrrrrrrrrrrrrrrrrrror',style: GoogleFonts.elMessiri (fontSize: 15,fontWeight: FontWeight.bold,color:Color(
                    0xAE16251E))),
                SizedBox(height: 5,),
                //SizedBox(height: 20,),
              ],
            ),
          );
        }
    );
  }

}