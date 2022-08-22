import 'package:ecommerce/appRouter.dart';
import 'package:ecommerce/provider/fireStoreProvider.dart';
import 'package:ecommerce/views/screens/newSlider.dart';
import 'package:ecommerce/views/widgets/sliderWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliderScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  floatingActionButton: home(),
      body: Consumer<FireStoreProvider>(
          builder: (context,provider,x) {

            return
              provider.imagesliderslist==null?
              Center(child: CircularProgressIndicator(),):
              ListView.builder(
                itemCount:  provider.imagesliderslist.length,
                itemBuilder:(context,index){
                  return SliderWidget(provider.imagesliderslist[index]);

                },
              );
          }
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          AppRouter.NavigateToWidget(AddimageSlider());
        },
        label: const Text('Add new slider'),
        backgroundColor: Colors.teal,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}