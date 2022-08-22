import 'package:ecommerce/appRouter.dart';
import 'package:ecommerce/model/categoer.dart';
import 'package:ecommerce/model/product.dart';
import 'package:ecommerce/provider/fireStoreProvider.dart';
import 'package:ecommerce/views/screens/updateProduct.dart';
import 'package:ecommerce/views/screens/updateWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatelessWidget{
  Product product;
  String catId;
  ProductWidget(this.product,this.catId);
  @override
  Widget build(BuildContext context) {
    return
      Container(
        color: Colors.white,
        margin: EdgeInsetsDirectional.only(top: 20),
        child: Column(
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
          Row(children: [
            SizedBox(width: 30,),
            Text(product.name,style:GoogleFonts.elMessiri(fontSize: 20,color: Colors.teal)),
            Spacer(),
            IconButton(onPressed: (){
              Provider.of<FireStoreProvider>(context,listen: false).ProductNameController.text=product.name;
              Provider.of<FireStoreProvider>(context,listen: false).ProductQuantityController.text=(product.quantity).toString();
              Provider.of<FireStoreProvider>(context,listen: false).ProductPriceController.text=(product.price).toString();
              Provider.of<FireStoreProvider>(context,listen: false).ProductDescController.text=product.description;
              AppRouter.NavigateToWidget(UpdateProduct(product,catId));
            },
                icon: Icon(Icons.edit,color: Colors.green,)),
            IconButton(onPressed: (){
              try {
                Provider.of<FireStoreProvider>(context,listen: false).deleteProduct(product, catId);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Loading deletion!'),
                ));
              } catch (e) {
                print(e.toString());
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Error,try agin'),
                ));
              }
            }, icon:Icon(Icons.delete,color: Colors.red,)),
            SizedBox(width: 15,),

          ],) ,
          Text(' - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -',style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold),)
        ],
      ),


      );
  }

}