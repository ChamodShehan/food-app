
import 'package:delivery_app/components/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomeHeader extends StatelessWidget {
  const CustomeHeader({
    Key? key,
    required this.size,  this.header,  this.tagName, required this.image, this.widget,
  }) : super(key: key);

  final Size size;
  final String? header;
  final String? tagName;
  final String image;
  final Widget? widget;


  @override
  Widget build(BuildContext context) {
    return Stack(
          children: [
           
            Image.asset(Constant.imgAsset(image),
              fit: BoxFit.fitWidth,
              width:size.width,
            ),
            
            widget==null?
            Center(child: 
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
    
              SizedBox(
              height:80
            ),
              Text(header!,
              style:GoogleFonts.poppins(
                fontSize: 20,
                fontWeight:FontWeight.w600,
                color:Colors.black
              )
              ),
              Text(tagName??"",
              style:GoogleFonts.poppins(fontSize: 16,
                fontWeight:FontWeight.w400,
                color:Colors.black)
              )
            ],),):widget!
          ],
        );
  }
}