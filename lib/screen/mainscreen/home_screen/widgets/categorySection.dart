
import 'package:delivery_app/components/customeImage.dart';
import 'package:delivery_app/components/custome_text.dart';
import 'package:delivery_app/utils/appColors.dart';
import 'package:flutter/material.dart';

class CategarySection extends StatelessWidget {
  const CategarySection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        child: Row(
          children: [
            CategeriTile(svgName: "ion_fast-food-outline",name: "All",),
            CategeriTile(svgName: "ion_pizza-outline",name: "Pizza"),
            CategeriTile(svgName: "bx_bx-drink",name: "Bevarages"),
            CategeriTile(svgName: "fe_rice-cracker",name: "Asian"),
            CategeriTile(svgName: "ion_fast-food-outline",name: "All"),
            
          ],
        ),    
      ),
    );
  }
}

class CategeriTile extends StatefulWidget {
   CategeriTile({
    Key? key, required this.svgName, required this.name,
  }) : super(key: key);

  final String svgName;
  final String name;
  @override
  State<CategeriTile> createState() => _CategeriTileState();
}

class _CategeriTileState extends State<CategeriTile> {
  Color color=Colors.white;
  bool isSelected=false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              setState((){
                isSelected=!isSelected;
              });
              
            },
            child: Container(
              padding: EdgeInsets.all(17),
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                color:isSelected? korange:Colors.white,
                borderRadius: BorderRadius.circular(15)
              ),
              child: CustomSvg(svgName:widget.svgName,color: isSelected?kwhite:kgrey),
            ),
          ),
           SizedBox(
        height: 4,
      ),
          CustomeText(text:widget.name,fontSize: 14,)
        ],
      ),
    );
  }
}