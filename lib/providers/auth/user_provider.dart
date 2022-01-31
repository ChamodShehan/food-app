
import 'package:delivery_app/components/constant.dart';
import 'package:delivery_app/controller/db_controller.dart';
import 'package:delivery_app/models/user_models.dart';
import 'package:delivery_app/screen/login_screen/login_screen.dart';
import 'package:delivery_app/screen/mainscreen/main_Screen.dart';
import 'package:delivery_app/screen/splash_screen/getting_started.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class UserProvider extends ChangeNotifier{

  DatabaseController _databaseController=DatabaseController();

  late UserModel _usermodel;
  UserModel get userModel => _usermodel;

void initializeUser(BuildContext context){
  FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) async {
    if (user == null) {
      print('User is currently signed out!');
     Constant. navigatorAsset(context,  GettingStarted());
    } else {
     print('User is signed in!');
   // await fetchSingleuser(user.uid);
     // Constant.navigatorAsset(context,  MainScreen());
    }
  });
}

Future<void> Logout( BuildContext context)async {

  await FirebaseAuth.instance.signOut();
Constant. navigatorAsset(context,  LoginScreen());
}

Future<void> fetchSingleuser(String id)async {
_usermodel= (await _databaseController.getUserData(id))!;
notifyListeners();
}
}