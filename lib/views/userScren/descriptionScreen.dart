import 'package:ecommerce/appRouter.dart';
import 'package:ecommerce/model/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescProduct extends StatelessWidget{
  Product product;
  String catId;
  DescProduct(this.product,this.catId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsetsDirectional.only(start: 30,top: 20),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios,color: Colors.teal,size: 30,),
            onPressed: (){
              AppRouter.popRouter();
            },
          ),
        ),
         backgroundColor: Colors.white,
          automaticallyImplyLeading:false,
              elevation: 0.0,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsetsDirectional.only(top: 90,),
              child: Center(
                child:Container(
                  width: double.infinity,
                  //decoration: BoxDecoration(  color: Color.fromARGB(255, 222, 208, 217), borderRadius: BorderRadius.circular(25)),
                  padding: EdgeInsets.only(top:1,bottom:1,left: 30,right: 30),

                  child: Text('',),
                ),
              ),
              height: 300.0,
              width: 360,
              // width: MediaQuery.of(context).size.width - 100.0,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.teal.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 10
                    ),
                  ],
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 219, 225, 230),
                image: DecorationImage(
                    image: NetworkImage(product.image),
                    fit: BoxFit.cover
                ),

              ),
            ),
            SizedBox(height: 20,),
            Text('Title :',style: GoogleFonts.elMessiri (fontSize: 15,color:Colors.grey)),
            Text(product.name,style: GoogleFonts.elMessiri (fontSize: 30,fontWeight: FontWeight.bold,color:Colors.black)),
            Row(
              children: [
                Text('Price :',style: GoogleFonts.elMessiri (fontSize: 15,color:Colors.grey)),
                SizedBox(width: 15,),
                Text("\$ ${product.price}",style: GoogleFonts.elMessiri (fontSize: 15,color:Colors.black)),
              ],
            ),
            SizedBox(height: 15,),
            Text('Description :',style: GoogleFonts.elMessiri (fontSize: 15,color:Colors.grey)),
            Expanded(child: Container(child: Text(product.description,style: GoogleFonts.elMessiri (fontSize: 20,fontWeight: FontWeight.bold,color:Colors.black)))),
            SizedBox(height: 20,),
            // ElevatedButton(
            //     onPressed: (){}, child: SizedBox(
            //     width: double.infinity,
            //     child: Text('Add To Cart',textAlign: TextAlign.center,style: GoogleFonts.elMessiri (
            //       fontSize: 25
            //     ),)),
            //   style: ElevatedButton.styleFrom(
            //     primary: Colors.teal,
            //     padding: EdgeInsets.all(15)
            //
            //   ),
            // )

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
      }, label:Padding(
        padding: const EdgeInsets.all(25.0),
        child: Text('Add To Cart',style: GoogleFonts.elMessiri (fontSize: 20),),
      ),
        backgroundColor: Colors.teal,),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

}