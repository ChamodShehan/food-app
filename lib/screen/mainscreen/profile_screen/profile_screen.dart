

import 'package:delivery_app/components/customeBotton.dart';
import 'package:delivery_app/components/custome_text.dart';
import 'package:delivery_app/providers/auth/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({ Key? key }) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomeText(text: "profile screen"),
          Consumer<UserProvider>(
            builder: (context, value, child) => 
             Column(children: [
               CustomeText(text: value.userModel.name),
            ],),
          ),
          CustomeButton(name: "Logout", onTap:
          () {
             Provider.of<UserProvider>(context,listen: false).Logout(context);
          },
          
           
           )
        ],
      )),
    );
  }
}