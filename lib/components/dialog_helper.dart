import 'package:animate_do/animate_do.dart';
import 'package:delivery_app/components/customeBotton.dart';
import 'package:delivery_app/components/customeImage.dart';
import 'package:delivery_app/components/custome_text.dart';
import 'package:delivery_app/utils/appColors.dart';
import 'package:flutter/material.dart';

class DialogHelper extends StatelessWidget {
  const DialogHelper({
    Key? key, required this.iconName, required this.text1, required this.btnName, required this.btnOntap,
  }) : super(key: key);

final String iconName;
final String text1;
final String btnName;
final Function() btnOntap;
  @override
  Widget build(BuildContext context) {
    return ElasticIn(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior:Clip.none,
            children: [
              Container(
                height: 279,
                width: 250,
                decoration: BoxDecoration(
                  color: kwhite,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomSvg(svgName: iconName, ),
                    CustomeText(text: text1,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.center,
                    color: kgreen,
                    ),
                  ],
                )
              ),
    
              Positioned(
                bottom: -20,
                child: CustomeButton(name:btnName,onTap: btnOntap,width: 172,))
            ],
          ),
        ],
      ),
    );
  }
}