
import 'package:ecommerce/views/screens/categoriesScreen.dart';
import 'package:ecommerce/views/screens/firstScreen.dart';
import 'package:ecommerce/views/screens/homescreen.dart';
import 'package:ecommerce/views/screens/mainPage.dart';
import 'package:ecommerce/views/userScren/mainPageScreen.dart';
import 'package:ecommerce/views/widgets/custom_daialog.dart';
import 'package:ecommerce/views/screens/signIn_screen.dart';
import 'package:ecommerce/views/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/appRouter.dart';

class AuthHelper {
  AuthHelper._();

  static AuthHelper authHelper = AuthHelper._();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential?> signIn(String email, String password) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        CustomDialog.showDialogFunction('No user found for that email.');
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<UserCredential?> signUp(String email, String password) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  signOut() async {
    await firebaseAuth.signOut();
    AppRouter.NavigateWithReplacemtnToWidget(LoginScreen());
  }

  forgetPassword(String email) async {
    try {
      CustomDialog.showDialogFunction(
          'Please enter your email to change your password');
      await firebaseAuth.sendPasswordResetEmail(email: email);
    } on Exception catch (e) {
      // TODO
    }
  }

    // checkUser ()async{
    //   User? user = firebaseAuth.currentUser;
    //   if(user==null){
    //     AppRouter.NavigateWithReplacemtnToWidget(SignUpScreen());
    //   }else{
    //     AppRouter.NavigateWithReplacemtnToWidget(LoginScreen());
    //   }
    // }
  checkUser()async{
    User?user=firebaseAuth.currentUser;
    if(user==null){
      AppRouter.NavigateWithReplacemtnToWidget(SignUpScreen());
    }
    else{
      AppRouter.NavigateWithReplacemtnToWidget(LoginScreen());
    }
    // User?user=firebaseAuth.currentUser;
    // if (user == null) {
    //   AppRouter.NavigateToWidget(LoginScreen());
    //   //NavigateTo(router: WelcomeScreen());
    // } else {
    //   if (user.email == 'lailaanouar1808@gmail.com') {
    //     AppRouter.NavigateWithReplacemtnToWidget(FirstScreen());
    //   } else {
    //     AppRouter.NavigateWithReplacemtnToWidget(MainPageUser());
    //   }
    }


  }
