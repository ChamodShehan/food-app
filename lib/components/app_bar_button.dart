
import 'package:delivery_app/components/customeImage.dart';
import 'package:delivery_app/utils/appColors.dart';
import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    Key? key, this.name="ic_round-arrow-back-ios", required this.ontap,
  }) : super(key: key);

  final String name;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:ontap ,
      child: Container(
        height: 48,
        width: 48,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          
          color: kwhite,
          borderRadius: BorderRadius.circular(15)
        ),
        
        child: CustomSvg(svgName: name)),
    );
  }
}