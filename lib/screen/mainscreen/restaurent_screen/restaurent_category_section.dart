import 'package:delivery_app/components/CustomeTitle.dart';
import 'package:delivery_app/screen/mainscreen/restaurent_screen/restaurent_screen.dart';
import 'package:flutter/material.dart';

class RestaurantCategarySection extends StatelessWidget {
  const RestaurantCategarySection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       
        Container(
      padding: EdgeInsets.only(left: 30),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        child: Row(
          children: [
    RestCategeriTile(name: "All",),
    RestCategeriTile(name: "Pizza"),
    RestCategeriTile(name: "Bevarages"),
    RestCategeriTile(name: "Asian"),
    RestCategeriTile(name: "All"),
    
          ],
        ),    
      ),
    )
      ],
    );
  }
}
