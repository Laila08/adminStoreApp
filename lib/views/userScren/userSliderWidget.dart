import 'package:ecommerce/model/sliderModel.dart';
import 'package:ecommerce/provider/fireStoreProvider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserSliderWidget extends StatelessWidget{
  SliderModel sliderModel;
  UserSliderWidget(this.sliderModel);
  @override
  Widget build(BuildContext context) {
    return
      Container(
        child: Center(
          child:Container(
            width: double.infinity,
          //decoration: BoxDecoration(  color: Color.fromARGB(255, 222, 208, 217), borderRadius: BorderRadius.circular(25)),
            color: Colors.white.withOpacity(0.5),
          padding: EdgeInsets.only(top:1,bottom:1,left: 30,right: 30),

          child: Text(sliderModel.title,style:GoogleFonts.elMessiri (fontSize: 27),textAlign: TextAlign.center,
          ),
        ),
        ),
        height: 190.0,
        width: 360,
        // width: MediaQuery.of(context).size.width - 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(255, 219, 225, 230),
          image: DecorationImage(
              image: NetworkImage(sliderModel.imagesliderUrl),
              fit: BoxFit.cover
          ),

        ),
      );
  }

}