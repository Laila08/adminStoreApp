import 'package:ecommerce/appRouter.dart';
import 'package:ecommerce/provider/fireStoreProvider.dart';
import 'package:ecommerce/views/screens/NewProduct.dart';
import 'package:ecommerce/views/widgets/categoryWidget.dart';
import 'package:ecommerce/views/widgets/productCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  String catId;
  ProductScreen(this.catId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: InkWell(
          onTap: (){
            AppRouter.popRouter();
          },
          child: Container(
              margin: EdgeInsetsDirectional.only(start:25 ),
              child: Icon(Icons.arrow_back_ios,color: Colors.teal,size: 25,)),
        ),
      ),
      body: Consumer<FireStoreProvider>(
          builder: (context, provider, x) {
            return provider.products.isEmpty ?
            Center(
              child: const CircularProgressIndicator(),
            )
                :
            ListView.builder(
              itemCount: provider.products!.length,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                    },
                    child: ProductWidget(provider.products![index],catId));
              },
            );
          }
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
        AppRouter.NavigateToWidget(NewProduct(catId));
      }, label:Text('Add New Product'),
        backgroundColor: Colors.teal,),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
}