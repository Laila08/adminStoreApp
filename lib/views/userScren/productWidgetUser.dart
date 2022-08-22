import 'package:ecommerce/appRouter.dart';
import 'package:ecommerce/model/categoer.dart';
import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/provider/fireStoreProvider.dart';
import 'package:ecommerce/views/screens/updateProduct.dart';
import 'package:ecommerce/views/screens/updateWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductWidgetUser extends StatelessWidget{
  Product product;
  String catId;
  ProductWidgetUser(this.product,this.catId);
  @override
  Widget build(BuildContext context) {
    return
      Container(
        color: Colors.white,
        margin: EdgeInsetsDirectional.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10,),
            Container(
              height: 190.0,
              width: 360,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 219, 225, 230),
                image: DecorationImage(
                    image: NetworkImage(product.image),
                    fit: BoxFit.cover
                ),
              ),
            ),
            SizedBox(height: 3,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              //SizedBox(width: 180,),
              Text(product.name,style:GoogleFonts.elMessiri(fontSize: 20,color: Colors.teal,),),
            ],) ,
            Text(' - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -',style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold),)
          ],
        ),


      );
  }

}