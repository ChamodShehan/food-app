

import 'package:delivery_app/components/custome_text.dart';
import 'package:delivery_app/components/dialog_helper.dart';
import 'package:delivery_app/components/image_tile.dart';
import 'package:delivery_app/utils/appColors.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kwhite,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            offset: Offset(0,10),
            blurRadius: 20,
            color: Colors.black12
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ImageTile(isOffer: true,width:90,height: 90,),
              SizedBox(width: 5,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                CustomeText(text: "Vegitable Salad",fontSize: 14,),
                CustomeText(text: "In Pizza mania",fontSize: 12, color: kgrey,),
                CustomeText(text: "Price 150.00",fontSize: 14,fontWeight: FontWeight.w500,),
              ],)
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: GestureDetector
            (onTap: (){
              showDialog(context: context, builder: (BuildContext context){
                return DialogHelper(
                  iconName: "shopping-cart 1",
                  btnName: "Check out now",
                  btnOntap: (){},
                  text1: "Sucessfully \n added to cart",
                );
              });
            },
              child: Icon(Icons.add)
              ),
          )
        ],
      ),
    );
  }
}
