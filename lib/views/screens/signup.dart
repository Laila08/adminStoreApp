// import 'package:ecommerce/data/authHelper.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
//
// class SignInScreen extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           onPressed: (){AuthHelper.authHelper.signUp('laila@gmail.com', 'password');},
//           child: Text('Test'),
//         ),
//       ),
//     );
//   }
//
// }
import 'package:ecommerce/provider/authProvider.dart';
import 'package:ecommerce/views/widgets/custom_form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
class SignUpScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration:  BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.purpleAccent,
                    Colors.amber,
                    Colors.blue,
                  ]
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              Consumer<AuthProvider>(
                  builder: (context,provider,x) {
                    return Container(
                      margin: EdgeInsetsDirectional.only(top: 100),
                      width: 325,
                      height: 700,
                      decoration:  BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Form(
                        key: provider.signupKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 30,),
                            Text("Register Account",
                                style: GoogleFonts.amethysta(
                                    fontSize: 30,
                                    fontWeight:FontWeight.bold
                                )
                            ),
                            SizedBox(height: 10,),
                            Text("Complete your details ",
                              style: GoogleFonts.amethysta(
                                color: Colors.grey,
                                fontSize: 13,
                              ),),
                            SizedBox(height: 70,),
                            CustomField(validator:provider.emailValidation,controller:provider.emailController ,icon: FontAwesomeIcons.envelope,textInputType:TextInputType.emailAddress , hint:"Enter your email" ),
                            SizedBox(height: 40,),
                            CustomField(validator:provider.passwordValidation,controller:provider.passwordController ,icon: FontAwesomeIcons.eyeSlash,textInputType:TextInputType.phone , hint:"Enter your password"),
                            SizedBox(height: 40,),
                            CustomField(validator:provider.nullValidation,controller:provider.userNameController ,textInputType:TextInputType.text , hint:"Enter user name"),
                            SizedBox(height: 40,),
                            CustomField(validator:provider.nullValidation,controller:provider.phoneController ,textInputType:TextInputType.phone , hint:"Enter phone"),
                            SizedBox(height: 40,),
                            GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                width: 250,
                                decoration:  BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(50)),
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Color(0xFF8A2387),
                                          Color(0xFFE94057),
                                          Color(0xFFF27121),
                                        ])
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: TextButton(onPressed: (){
                                    provider.signUp();
                                  }, child:
                                  TextButton(onPressed: (){
                                    provider.signUp();
                                  },
                                    child:Text('Continue',
                                      style: GoogleFonts.amethysta(color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),)
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    );
                  }
              )
            ],
          ),
        ),
      ),
    );
  }

}