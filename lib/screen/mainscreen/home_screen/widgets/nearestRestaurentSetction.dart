
import 'package:delivery_app/components/constant.dart';
import 'package:delivery_app/components/customeImage.dart';
import 'package:delivery_app/components/custome_text.dart';
import 'package:delivery_app/components/image_tile.dart';
import 'package:delivery_app/screen/mainscreen/restaurent_screen/restaurent_screen.dart';
import 'package:delivery_app/utils/appColors.dart';
import 'package:flutter/material.dart';

class NearestRestaurentSection extends StatelessWidget {
  const NearestRestaurentSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        child: Row(
          children: [
            RestaurentTile(isOffer: true,),
            RestaurentTile(),
            RestaurentTile(),
            RestaurentTile(),
          ],
        ),
      ),
    );
  }
}

class RestaurentTile extends StatelessWidget {
  const RestaurentTile({
    Key? key, this.isOffer=false,
  }) : super(key: key);

 final bool isOffer;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Constant.navigatorAsset(context, RestaurentDetailsScreen());
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageTile(isOffer: isOffer),
            SizedBox(height: 5,),
            CustomeText(text: "Westway",fontSize: 16,),
            Row(
              children: [
                Row(
                  children: [
                    Icon(Icons.star,color: Colors.amber,size: 15,),
                    CustomeText(text: "4.6  • ",fontSize: 12,)
                  ],
                ),
                 Row(
                  children: [
                    Icon(Icons.timer,color: kgrey,size: 15,),
                    CustomeText(text: "15 min ",fontSize: 12,)
                  ],
                ),
              ],
            )
        ],
      ),
    );
  }
}


class OfferTag extends StatelessWidget {
  const OfferTag({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        width: 79,
        height: 28,
        decoration: BoxDecoration(
          color: korange,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
            topRight: Radius.circular(15)
          )
          ),
        child: Center(
          child: CustomeText(text: "50% OFF",fontSize: 13,fontWeight: FontWeight.w700,
          color: kwhite,
          ),
        ),
      ),
    );
  }
}