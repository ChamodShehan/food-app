
import 'package:delivery_app/components/custome_text.dart';
import 'package:flutter/material.dart';

class CustomeTitle extends StatelessWidget {
  const CustomeTitle({
    Key? key, required this.text,
  }) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: CustomeText(text: text,fontSize:18,fontWeight: FontWeight.w500,),
    );
  }
}
