
import 'package:flutter/material.dart';

class Constant{
  


static String imgAsset(img)=> 'images/$img';


static void navigatorAsset(BuildContext context, Widget widget){
  Navigator.push(context, MaterialPageRoute(builder: (context)=> widget));
}
static void goBack(BuildContext context){
Navigator.pop(context);
}

static void pushremovenevigation(BuildContext context,Widget widget){
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context)=>widget), (route) => false);
}
}
