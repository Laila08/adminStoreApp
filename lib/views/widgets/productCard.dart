import 'package:ecommerce/appRouter.dart';
import 'package:ecommerce/model/categoer.dart';
import 'package:ecommerce/provider/fireStoreProvider.dart';
import 'package:ecommerce/views/screens/NewProduct.dart';
import 'package:ecommerce/views/screens/mainPage.dart';
import 'package:ecommerce/views/screens/updateWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget{
  Category category;
  ProductCard(this.category);
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
                Text(category.name??'errror',style: GoogleFonts.elMessiri (fontSize: 20,fontWeight: FontWeight.bold,color:Color(
                    0xAE16251E))),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        Provider.of<FireStoreProvider>(context,listen: false).categoryNameController.text=category.name??'errrrrrrrrrrrror';
                        AppRouter.NavigateToWidget(UpdateCategory(category));
                      },
                        child: Icon(Icons.edit,size: 20,color: Colors.black38,)),
                    SizedBox(width: 10,),
                    InkWell(
                        onTap: (){
                          try {
                            Provider.of<FireStoreProvider>(context,listen: false).deleteCategory(category);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Loading deletion!'),
                            ));
                          } catch (e) {
                            print(e.toString());
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Error,try agin'),
                            ));
                          }
                        },
                        child: Icon(Icons.remove,size: 20,color: Colors.red,)),
                    SizedBox(width: 10,),
                  ],
                ),
                //SizedBox(height: 20,),
              ],
            ),
          );
        }
      );
  }

}
// import 'package:ecommerce/model/categoer.dart';
// import 'package:ecommerce/model/sliderModel.dart';
// import 'package:ecommerce/provider/fireStoreProvider.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
//
// class ProductCard extends StatelessWidget{
//   Category category;
//   ProductCard(this.category);
//   @override
//   Widget build(BuildContext context) {
//     return
//       Container(child:
//       Column(
//         children: [
//
//           SizedBox(height: 10,),
//
//           Row(children: [
//             SizedBox(width: 30,),
//
//             Spacer(),
//             // IconButton(onPressed: (){
//             //   Provider.of<FireStoreProvider>(context,listen: false).categoryNameController.text=category.name;
//             //   AppRouter.NavigateToWidget(updateCategory(category)
//             // );}, icon: Icon(Icons.edit,color: Colors.grey,)),
//             IconButton(onPressed: (){
//               Provider.of<FireStoreProvider>(context,listen: false).deleteCategory(category);
//             }, icon:Icon(Icons.delete,color: Colors.grey,))
//
//           ],) ,SizedBox(height: 3,),
//           //          Container(height: 200,
//           //      //  width:MediaQuery.of(context).size.width ,
//           //       width: 300,
//           //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
//           //        // child: Image.network(category.imageUrl,fit: BoxFit.fill,),
//           // ),
//
//           //  Container(
//           // width: 360,
//           //  decoration: BoxDecoration(
//           //            borderRadius: BorderRadius.circular(20),
//           //                   ),
//           //                     child: ClipRRect(
//           //                           borderRadius: BorderRadius.circular(20),
//           //                               child: Image.network(category.imageUrl,
//           //                                        fit: BoxFit.cover,
//           //                                                  width: 300,
//           //                                                     height: 200,
//           //                                                        ),         ),       ),
//           Container(
//             child: Center( child:Container(
//               decoration: BoxDecoration(  color: Color.fromARGB(255, 222, 208, 217),
//                   borderRadius: BorderRadius.circular(25)),
//               padding: EdgeInsets.only(top:1,bottom:1,left: 30,right: 30),
//
//               child: Text(category.name??'errrrrrrrrrrrrrrrrrrror',style:GoogleFonts.dynalight(fontSize: 27)
//                 //TextStyle(fontWeight:FontWeight.w600,fontSize: 16 ),
//               ),
//             ),),
//             height: 190.0,
//             width: 360,
//             // width: MediaQuery.of(context).size.width - 100.0,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               color: Color.fromARGB(255, 219, 225, 230),
//               image: DecorationImage(
//                   image: NetworkImage(category.imageUrl??'https://static9.depositphotos.com/1719616/1205/i/600/depositphotos_12057489-stock-photo-sunflower-field.jpg'),
//                   fit: BoxFit.cover
//               ),
//
//             ),
//           ),
//         ],
//       ),
//
//
//       );
//   }
//
// }