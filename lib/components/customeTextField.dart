
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomeTextFiled extends StatelessWidget {
   CustomeTextFiled({
    Key? key, this.controller, this.hintText, this.prefix
  }) : super(key: key);

  final controller;
  final String? hintText;
  final Widget? prefix;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:double.infinity,
      child: TextField(
        controller: controller,
       
        decoration: InputDecoration(
          filled:true,
          fillColor: Colors.white,
          hintText:hintText,
          prefixIcon:prefix,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.white
            )
          
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.red
            )
          
          )
           ),
      )
      
      );
  }
}