import 'package:ecommerce/appRouter.dart';
import 'package:ecommerce/provider/authProvider.dart';
import 'package:ecommerce/data/authHelper.dart';
import 'package:ecommerce/provider/fireStoreProvider.dart';
import 'package:ecommerce/views/screens/categoriesScreen.dart';
import 'package:ecommerce/views/screens/firstScreen.dart';
import 'package:ecommerce/views/screens/mainPage.dart';
import 'package:ecommerce/views/screens/signIn_screen.dart';
import 'package:ecommerce/views/screens/sliderScreen.dart';
import 'package:ecommerce/views/screens/splachScreen.dart';
import 'package:ecommerce/views/userScren/mainPageScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent)
    );
    return MultiProvider(providers:[
    ChangeNotifierProvider<AuthProvider>(
    create: (context){return AuthProvider();}),
    ChangeNotifierProvider<FireStoreProvider>(
    create: (context){return FireStoreProvider();})
      ],
      child: MaterialApp(
        navigatorKey: AppRouter.navKey,
        debugShowCheckedModeBanner: false,
        home: SplachScreen(),
      ),
    );
  }
}
