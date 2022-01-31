import 'package:animate_do/animate_do.dart';
import 'package:delivery_app/components/customeImage.dart';
import 'package:delivery_app/components/custome_text.dart';
import 'package:delivery_app/screen/mainscreen/cart_screen/cart_screen.dart';
import 'package:delivery_app/screen/mainscreen/home_screen/homePage.dart';
import 'package:delivery_app/screen/mainscreen/profile_screen/profile_screen.dart';
import 'package:delivery_app/screen/splash_screen/search_screen.dart';
import 'package:delivery_app/utils/appColors.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _currentIndex=0;
  List <Widget> _screen=[
    HomePage(),
    SearchScreen(),
    CartScreen(),
    ProfileScreen()

  ];
  
  Future <bool> inibackButton() async {
    return await showDialog(
      context: context,
     builder:(context) =>
    ElasticIn(
      child: AlertDialog(
        title: CustomeText(text: "exit app",),
      content: CustomeText(text: 'Do you really want to exit?',),
      actions: [
    
        ElevatedButton(onPressed: (){
          Navigator.of(context).pop();
        }, child: CustomeText(text: 'No',)),
         ElevatedButton(onPressed: (){
          Navigator.of(context).pop(true);
        }, child: CustomeText(text: 'Yes',))
      ],
      
      ),
    ) ,
     )??false;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:inibackButton ,
      child: Scaffold(
        body:_screen.elementAt(_currentIndex),
        bottomNavigationBar: Container(
          height: 90,
          color: kwhite,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottumNavTile(icon: "home",isSelected: _currentIndex==0,ontap: (){
                setState(() {
                  _currentIndex=0;
                });
              },),
              BottumNavTile(icon: "search",isSelected: _currentIndex==1,
              ontap: (){
                setState(() {
                  _currentIndex=1;
                });
                },),
              BottumNavTile(icon: "card",isSelected: _currentIndex==2,
              ontap: (){
                setState(() {
                  _currentIndex=2;
                });
              },),
              BottumNavTile(icon: "profile",isSelected: _currentIndex==3,ontap: (){
                setState(() {
                  _currentIndex=3;
                });
              },),
            ],
          ),
        ),
      ),
    );
  }
}

class BottumNavTile extends StatelessWidget {
  const BottumNavTile({
    Key? key, required this.icon, required this.isSelected, required this.ontap,
  }) : super(key: key);
  final String icon;
  final bool isSelected;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 50,
        width: 50,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: isSelected?Colors.amber:kwhite,
          borderRadius: BorderRadius.circular(15)
        ),
        child: CustomSvg(svgName: icon,
        color:isSelected?kwhite:kgrey ,
        ))
      );
  }
}