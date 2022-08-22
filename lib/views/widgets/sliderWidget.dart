import 'package:ecommerce/model/sliderModel.dart';
import 'package:ecommerce/provider/fireStoreProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SliderWidget extends StatelessWidget{
  SliderModel sliderModel;
  SliderWidget(this.sliderModel);
  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
        children: [
          SizedBox(height: 25,),
          Container(
            height: 190.0,
            width: 360,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 219, 225, 230),
              image: DecorationImage(
                  image: NetworkImage(sliderModel.imagesliderUrl),
                  fit: BoxFit.cover
              ),
            ),
          ),
          Row(children: [
            Text(sliderModel.title,style:GoogleFonts.elMessiri(fontSize: 25,color: Colors.teal)),
            Spacer(),
            IconButton(onPressed: (){
              Provider.of<FireStoreProvider>(context,listen: false).deleteSlider(sliderModel);
            }, icon:Icon(Icons.delete,color: Colors.red,)),
          ],) ,
          Text('- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -',style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold,),),
        ],
      ),


      );
  }

}