
import 'package:delivery_app/components/customeImage.dart';
import 'package:delivery_app/screen/mainscreen/home_screen/widgets/nearestRestaurentSetction.dart';
import 'package:flutter/material.dart';

class ImageTile extends StatelessWidget {
  const ImageTile({
    Key? key,
     this.isOffer=false, this.width=120, this.height=120,
  }) : super(key: key);

  final bool isOffer;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 20
      ),
      width: width,
      height: height,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: CustomeNetworkImage(url:"https://static.onecms.io/wp-content/uploads/sites/44/2021/02/04/watercress-salad-honey-Balsamic-tofu-2000.jpg")
            ),
    
            isOffer?OfferTag():Container()
        ],
      ));
  }
}