


import 'package:delivery_app/providers/auth/registration_provider.dart';
import 'package:delivery_app/providers/auth/user_provider.dart';
import 'package:delivery_app/providers/counter_provider.dart';
import 'package:delivery_app/providers/auth/login_provider.dart';
import 'package:delivery_app/screen/login_screen/login_screen.dart';
import 'package:delivery_app/screen/login_screen/register.dart';
import 'package:delivery_app/screen/mainscreen/main_Screen.dart';
import 'package:delivery_app/screen/mainscreen/profile_screen/profile_screen.dart';
import 'package:delivery_app/screen/splash_screen/splash_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider(),),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create:(context) =>  RegistrationProvider ()),
        ChangeNotifierProvider(create:(context) =>  UserProvider ())
      ],
      child: MyApp(),
    )  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Delivery App',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen (),

       builder: (context, widget) => ResponsiveWrapper.builder(
          widget,
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(480, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background: Container(color: Color(0xFFF5F5F5))),
    );
  }
}
