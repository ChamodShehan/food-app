import 'package:delivery_app/components/custome_text.dart';
import 'package:delivery_app/components/image_tile.dart';
import 'package:delivery_app/utils/appColors.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({ Key? key }) : super(key: key);

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
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             ImageTile(isOffer: false,width:90,height: 90,),
            SizedBox(width: 5,),
            Column(
              children: [
                CustomeText(text: "Burder with Some",fontSize: 14,fontWeight: FontWeight.w400,),
                Container(
                  width: 100,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Color(0xffF8F8FA),
                    borderRadius: BorderRadius.circular(12)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.add),iconSize: 10),
                        CustomeText(text: "1",fontSize: 12,fontWeight: FontWeight.w500,),
                        IconButton(onPressed: (){}, icon: Icon(Icons.remove),iconSize: 10,),
                      ],
                    ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                 IconButton(onPressed: (){}, icon: Icon(Icons.close),iconSize: 15,),
                 CustomeText(text: "152",fontSize: 15,fontWeight: FontWeight.w500,)
              ],
            )
          ],
        ),
      ),
    );
  }
}