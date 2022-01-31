import 'package:delivery_app/components/constant.dart';
import 'package:delivery_app/providers/auth/user_provider.dart';
import 'package:delivery_app/screen/splash_screen/getting_started.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    
    super.initState();
    Future.delayed(const  Duration(seconds: 5),(){
      
      Provider.of<UserProvider>(context,listen:false).initializeUser(context);
    //  Constant.navigatorAsset(context, GettingStarted());
    } );
  }
  @override
  Widget build(BuildContext context) {

    final size=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(

        width: size.width,
        child:Column(
          mainAxisAlignment:MainAxisAlignment.center,
          
          children: [
            
          Image.asset(Constant.imgAsset('FOOD.png')),
          const SizedBox(
            height:8
          ),
          const Text('No waiting for food',
          style:TextStyle(
            fontSize: 16,
            color:Color(0xff838383)
          )
          )
        ],)
      ),
    );
  }
}