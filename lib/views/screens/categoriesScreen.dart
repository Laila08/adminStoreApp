import 'package:ecommerce/appRouter.dart';
import 'package:ecommerce/provider/fireStoreProvider.dart';
import 'package:ecommerce/views/screens/NewProduct.dart';
import 'package:ecommerce/views/screens/productScreen.dart';
import 'package:ecommerce/views/widgets/categoryWidget.dart';
import 'package:ecommerce/views/widgets/productCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Consumer<FireStoreProvider>(
          builder: (context,provider,x) {
            return  provider.categories==null?
            Center(
              child:const CircularProgressIndicator(),
            )
                :
              GridView.builder(
                itemCount: provider.categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder:(context,index){
                  return InkWell(
                      onTap: (){
                        provider.getAllProduct(provider.categories[index].catId!);
                        //AppRouter.NavigateToWidget(NewProduct(provider.categories![index].catId));
                        AppRouter.NavigateToWidget(ProductScreen(provider.categories![index].catId!));

                      },
                      child: ProductCard(provider.categories![index]));
                },
              );
          }
      );
  }
}