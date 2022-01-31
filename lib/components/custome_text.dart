import 'package:delivery_app/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomeText extends StatelessWidget {
  const CustomeText({
    Key? key, required this.text, this.fontSize=15, this.color=primaryTextColor, this.fontWeight, this.textAlign,
    
  }) : super(key: key);


final String text;
final double fontSize;
final Color color;
final FontWeight? fontWeight;
final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(text,
    textAlign: textAlign
    ,
                        style:GoogleFonts.poppins(fontSize: fontSize,
                          fontWeight:fontWeight,
                          color:color)
                        );
  }
}