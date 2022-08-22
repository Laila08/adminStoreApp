// import 'package:ecommerce/appRouter.dart';
// import 'package:ecommerce/provider/fireStoreProvider.dart';
// import 'package:ecommerce/views/widgets/custom_form.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class AddimageSlider extends StatelessWidget{
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//         body: Consumer<FireStoreProvider>(
//         builder: (context,provider,x) {
//       return Padding(
//       padding: const EdgeInsets.all(20),
//     child: Column(
//     children: [
//     SizedBox(height: 40,),
//     Row(children: [
//     IconButton(onPressed: (){
//     AppRouter.popRouter();
//     },
//     icon: Icon(Icons.arrow_back_ios_new)
//     ),
//     Spacer(),
//     IconButton(onPressed: (){
//     provider.selectedImage=null;
//     provider.sliderNameController.clear();
//     }, icon: Icon(Icons.restart_alt))
//     ],
//     ),
//     //  provider.selectedImage==null?
//     InkWell(
//     onTap: (){
//     provider.selectImage();
//
//     },
//     child: provider.selectedImage==null?
//     CircleAvatar(radius: 50,
//     backgroundColor: Color.fromARGB(255, 169, 228, 226),)
//     :
//     CircleAvatar(backgroundImage: FileImage(provider.selectedImage!),
//     ),),
//       SizedBox(height: 20,),
//       CustomField(
//       validator: (){},
//       //obscureText: false,
//       controller: provider.sliderNameController),
//       //   TextField(controller: provider.categoryNameController,),
//       SizedBox(height: 30,),
//       ElevatedButton(
//       onPressed: (){
//         try {
//       provider.addNewSlider();
//       ScaffoldMessenger.of(context).showSnackBar(successSnakbar);
//         } catch (e) {
//       print(e.toString());
//       ScaffoldMessenger.of(context).showSnackBar(errorSnack);
//         }
//       }, child:Text('New Slider') ,
//
//       ),
//       // IconButton(onPressed: (){
//       //   AppRouter.NavigateWithReplacemtnToWidget(CategoryScreen());
//       // }, icon: Icon(Icons.arrow_forward_ios))
//     ],
//     ),
//       );
//         }
//         )
//     );}
//
//   final  successSnakbar =
//   SnackBar(
//     content: Text('Added sccessfuly!'),
//   );
//   final  errorSnack =  SnackBar(
//     content: Text('Error,try agin'),
//   );

// }
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

class AddimageSlider extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: (){AppRouter.popRouter();},
            child: Container(
                margin: EdgeInsetsDirectional.only(start: 30),
                child: Icon(Icons.arrow_back_ios,color: Colors.teal,size: 35,)),
          ),
        ),
        body: Consumer<FireStoreProvider>(
            builder: (context,provider,x) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
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
                          child: CircleAvatar(radius: 90,backgroundColor: Colors.teal,child: Icon(Icons.add,color: Colors.white,),)):
                      CircleAvatar(
                          backgroundImage: FileImage(provider.selectedImage!),
                          radius: 80
                      ),
                      SizedBox(height: 20,),
                      TextField(controller: provider.sliderNameController,
                        decoration: InputDecoration(
                          labelText: 'Image Title',
                          icon: Icon(Icons.add_box_outlined,color: Colors.teal,),
                        ),),
                      SizedBox(height: 30,),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: (){
                            try {
                              Provider.of<FireStoreProvider>(context,listen: false).addNewSlider();
                              AppRouter.popRouter();
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Loading slider!'),
                              ));
                            } catch (e) {
                              print(e.toString());
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Error,try agin'),
                              ));
                            }

                          }, child:Text('Add '),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.teal,
                            shadowColor: Colors.tealAccent,
                            textStyle:  GoogleFonts.elMessiri(fontSize: 22),
                            padding: EdgeInsets.symmetric(vertical: 10,),
                          ),),
                      ),
                      // SizedBox(
                      //   width: 300,
                      //   height: 300,
                      //   child: Image.asset('assets/images/draw.png'),
                      // )
                    ],
                  ),
                ),
              );
            }
        )
    );
  }

}