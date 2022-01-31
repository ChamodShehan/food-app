
import 'package:delivery_app/components/custome_loader.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomeButton extends StatelessWidget {
  const CustomeButton({
    Key? key, required this.name, required this.onTap, this.height=60, this.width=double.infinity, this.isLoading=false,
  }) : super(key: key);

  final String name;
  final Function() onTap;
  final double height;
  final double width;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width:width,
        decoration:BoxDecoration(
          color: Color(0xffFFD200),
          borderRadius: BorderRadius.circular(15)
        ),
        child:Center(
          child:isLoading?CustomLoader(): Text(name,
            style:GoogleFonts.poppins(fontSize: 18,
          fontWeight:FontWeight.w600,
          color:Colors.black)
            ),
        )
      ),
    );
  }
}
