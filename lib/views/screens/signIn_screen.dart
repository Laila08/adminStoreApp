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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/appRouter.dart';
import 'package:ecommerce/provider/authProvider.dart';
import 'package:ecommerce/provider/fireStoreProvider.dart';
import 'package:ecommerce/views/screens/signup.dart';
import 'package:ecommerce/views/widgets/custom_form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
class LoginScreen extends StatelessWidget{
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
                      key: provider.loginKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                           SizedBox(height: 30,),
                           Text("Welcome Back",
                            style: GoogleFonts.amethysta(
                                  fontSize: 30,
                                  fontWeight:FontWeight.bold
                            )
                          ),
                           SizedBox(height: 10,),
                           Text("Sign in with your email and password",
                            style: GoogleFonts.amethysta(
                              color: Colors.grey,
                              fontSize: 13,
                            ),),
                           SizedBox(height: 70,),
                          CustomField(validator:provider.emailValidation,controller:provider.emailController ,icon: FontAwesomeIcons.envelope,textInputType:TextInputType.emailAddress , hint:"Enter your email" ),
                           SizedBox(height: 40,),
                          CustomField(validator:provider.passwordValidation,controller:provider.passwordController ,icon: FontAwesomeIcons.eyeSlash,textInputType:TextInputType.phone , hint:"Enter your password"),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 0, 30, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  child: Text("Forget Password",
                                    style: TextStyle(
                                        color: Colors.deepOrange
                                    ),
                                  ),
                                  onPressed: (){
                                    provider.forgetPassword();
                                  },
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 70,),
                          GestureDetector(
                            child: Container(
                              alignment: Alignment.center,
                              width: 250,
                              decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
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
                                  provider.signIn();
                                }, child:
                                TextButton(onPressed: (){
                                  provider.signIn();
                                },
                                  child:Text('Login',
                                  style: TextStyle(color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),)
                              ),
                            ),
                          ),
                          ),
                          SizedBox(height: 20,),
                          GestureDetector(
                            child: Container(
                              alignment: Alignment.center,
                              width: 250,
                              decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
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
                                  provider.signIn();
                                }, child:
                                TextButton(onPressed: (){
                                 AppRouter.NavigateWithReplacemtnToWidget(SignUpScreen());
                                },
                                  child:Text('Register Now',
                                    style: TextStyle(color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),)
                                ),
                              ),
                            ),
                          )
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