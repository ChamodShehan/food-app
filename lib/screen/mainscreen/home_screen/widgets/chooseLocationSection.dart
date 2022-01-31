
import 'package:delivery_app/components/customeImage.dart';
import 'package:delivery_app/components/custome_text.dart';
import 'package:flutter/material.dart';

class ChooseLocationSection extends StatelessWidget {
  const ChooseLocationSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 42),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CustomSvg(svgName: 'location',),
              SizedBox(width: 13,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomeText(text: "Home"),
                  CustomeText(text: "242 ST Marks Eve, Finland",fontSize: 14)
                ],
              )
            ],
          ),
          Row(children: [
            CustomSvg(svgName: "ion_options-outline")
          ],)
        ],
      ),
    );
  }
}