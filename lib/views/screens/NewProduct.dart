import 'dart:io';
import 'dart:math';
import 'package:ecommerce/appRouter.dart';
import 'package:ecommerce/data/firestore_helper.dart';
import 'package:ecommerce/data/storageHelper.dart';
import 'package:ecommerce/provider/fireStoreProvider.dart';
import 'package:ecommerce/views/screens/mainPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class NewProduct extends StatelessWidget{
  String catId ;
  NewProduct(this.catId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
        body: Consumer<FireStoreProvider>(
            builder: (context,provider,x) {
              return Container(
                margin: EdgeInsets.all(20),
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 100,),
                      provider.selectedImage==null?
                      InkWell(
                          onTap: (){
                            provider.selectImage();
                          },
                          child: CircleAvatar(radius: 80,backgroundColor: Colors.teal,child: Icon(Icons.add,color: Colors.white,),)):
                      CircleAvatar(
                          backgroundImage: FileImage(provider.selectedImage!),
                          radius: 80
                      ),
                      SizedBox(height: 20,),
                      TextField(controller: provider.ProductNameController,
                        decoration: InputDecoration(
                          labelText: 'Product Name',
                          icon: Icon(Icons.add_box_outlined,color: Colors.teal,),
                        ),),
                      SizedBox(height: 10,),
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: provider.ProductQuantityController,
                        decoration: InputDecoration(
                          labelText: 'Product Quantity',
                          icon: Icon(Icons.add_box_outlined,color: Colors.teal,),
                        ),),
                      SizedBox(height: 10,),
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: provider.ProductPriceController,
                        decoration: InputDecoration(
                          labelText: 'Product Price',
                          icon: Icon(Icons.add_box_outlined,color: Colors.teal,),
                        ),),
                      SizedBox(height: 10,),
                      TextField(controller: provider.ProductDescController,
                        decoration: InputDecoration(
                          labelText: 'Description',
                          icon: Icon(Icons.add_box_outlined,color: Colors.teal,),
                        ),),
                      SizedBox(height: 30,),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: (){
                            try {
                              Provider.of<FireStoreProvider>(context,listen: false).addNewProduct(catId);
                              AppRouter.popRouter();
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Loading product!'),
                              ));
                            } catch (e) {
                              print(e.toString());
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Error,try agin'),
                              ));
                            }

                          }, child:Text('Add New Product'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.teal,
                            shadowColor: Colors.tealAccent,
                            textStyle:  GoogleFonts.elMessiri(fontSize: 22),
                            padding: EdgeInsets.symmetric(vertical: 10,),
                          ),),
                      ),
                      //SizedBox(height: 20,),
                      //Expanded(child: Image.asset('assets/images/draw.png',))
                    ],
                  ),
                ),
              );
            }
        )
    );
  }

}