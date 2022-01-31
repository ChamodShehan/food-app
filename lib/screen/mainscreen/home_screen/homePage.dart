
import 'package:delivery_app/components/CustomeTitle.dart';
import 'package:delivery_app/components/customeHeader.dart';

import 'package:delivery_app/components/customeTextField.dart';


import 'package:delivery_app/screen/mainscreen/home_screen/widgets/categorySection.dart';
import 'package:delivery_app/screen/mainscreen/home_screen/widgets/chooseLocationSection.dart';
import 'package:delivery_app/screen/mainscreen/home_screen/widgets/nearestRestaurentSetction.dart';

import 'package:flutter/material.dart';



class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final size=MediaQuery.of(context).size;
    return Scaffold(
      body:Column(children :[
        UpperSection(size: size),
        BottumSection(),
       
          
      ])
    );
  }
}

class BottumSection extends StatelessWidget {
  const BottumSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 34,
            ),
             CategarySection(),
             SizedBox(
              height: 20,
            ),
            CustomeTitle(text:  "Nearest Restaurents",),
             SizedBox(
              height: 11,
            ),
            NearestRestaurentSection(),
            SizedBox(
              height: 26,
            ),
            CustomeTitle(text:  "Popular Restaurents",),
             SizedBox(
              height: 11,
            ),
            NearestRestaurentSection()
          ],
        ),
      ),
    );
  }
}




class UpperSection extends StatelessWidget {
  const UpperSection({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomeHeader(
          size:size,
          image:"top.png",
          widget:Padding(
            padding: const EdgeInsets.only(right:30,left:30,top:66),
            child: CustomeTextFiled(
              hintText:"Find your Taste",
              prefix:Icon(Icons.search,color:Colors.grey)
            ),
            
          )
          ),
          ChooseLocationSection()
      ],
    );
  }
}


