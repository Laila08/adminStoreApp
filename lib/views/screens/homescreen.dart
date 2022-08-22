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

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<FireStoreProvider>(
        builder: (context,provider,x) {
          return Container(
            margin: EdgeInsets.all(20),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // child: ElevatedButton(
                //   onPressed:()async{
                //    // Provider.of<FireStoreProvider>(context,listen: false).insertNewCategory();
                //     XFile? xfile = await    ImagePicker().pickImage(source: ImageSource.gallery);
                //     String url = await StorageHelper.storageHelper.uploadImage(File(xfile!.path));
                //   } ,
                //   child: Text('insert'),
                // ),
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
              TextField(controller: provider.categoryNameController,
              decoration: InputDecoration(
                labelText: 'Category Name',
                icon: Icon(Icons.add_box_outlined,color: Colors.teal,),
              ),),
                SizedBox(height: 30,),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: (){
                        try {
                          Provider.of<FireStoreProvider>(context,listen: false).addNewCategory();
                          AppRouter.NavigateToWidget(MainPage());
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Loading Category!'),
                          ));
                        } catch (e) {
                          print(e.toString());
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Error,try agin'),
                          ));
                        }
                      }, child:Text('Add New Category'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    shadowColor: Colors.tealAccent,
                    textStyle:  GoogleFonts.elMessiri(fontSize: 22),
                    padding: EdgeInsets.symmetric(vertical: 10,),
                  ),),
                ),
                SizedBox(height: 20,),
                Expanded(child: Image.asset('assets/images/draw.png',))
              ],
            ),
          );
        }
      )
    );
  }

}
// import 'package:ecommerce/appRouter.dart';
// import 'package:ecommerce/provider/fireStoreProvider.dart';
// import 'package:ecommerce/views/widgets/custom_form.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// class HomeScreen extends StatelessWidget{
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       // appBar: AppBar(actions: [
//       //   IconButton(onPressed: (){
//
//       //   }, icon: Icon(Icons.logout))
//       // ]),
//         body: Consumer<FireStoreProvider>(
//             builder: (context,provider,x) {
//               return Form(
//                 // key: provider.newCategorykey,
//                 child: Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: Column(
//                     children: [
//                       SizedBox(height: 40,),
//                       Row(children: [
//                         IconButton(onPressed: (){
//                           AppRouter.popRouter();
//                         },
//                             icon: Icon(Icons.arrow_back_ios_new)
//                         ),
//                         Spacer(),
//                         IconButton(onPressed: (){
//                           provider.selectedImage=null;
//                           provider.categoryNameController.clear();
//
//
//                         }, icon: Icon(Icons.restart_alt))
//                       ],
//                       ),
//
//                       //  provider.selectedImage==null?
//                       InkWell(
//                         onTap: (){
//                           provider.selectImage();
//
//                         },
//                         child: provider.selectedImage==null?
//                         CircleAvatar(radius: 50,
//                           backgroundColor: Color.fromARGB(255, 169, 228, 226),)
//                             :
//                         CircleAvatar(backgroundImage: FileImage(provider.selectedImage!),
//                         ),),
//                       SizedBox(height: 20,),
//                       CustomField(
//                           validator: (){},
//                           //obscureText: false,
//                           controller: provider.categoryNameController),
//                       //   TextField(controller: provider.categoryNameController,),
//                       SizedBox(height: 30,),
//                       ElevatedButton(onPressed: (){
//
//                         try {
//                           provider.addNewCategory();
//
//                           ScaffoldMessenger.of(context).showSnackBar(successSnakbar);
//                         } catch (e) {
//                           print(e.toString());
//                           ScaffoldMessenger.of(context).showSnackBar(errorSnack);
//                         }
//
//
//
//
//                       }, child:Text('New Slider') ,
//
//                       ),
//                       // IconButton(onPressed: (){
//                       //   AppRouter.NavigateWithReplacemtnToWidget(CategoryScreen());
//                       // }, icon: Icon(Icons.arrow_forward_ios))
//                     ],
//                   ),
//                 ),
//               );
//             }
//         )
//     );}
//
//   final  successSnakbar =  SnackBar(
//     content: Text('Added sccessfuly!'),
//   );
//   final  errorSnack =  SnackBar(
//     content: Text('Error,try agin'),
//   );
//
// }