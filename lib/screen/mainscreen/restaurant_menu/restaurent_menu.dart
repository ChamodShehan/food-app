import 'package:delivery_app/components/CustomeTitle.dart';
import 'package:delivery_app/components/app_bar_button.dart';
import 'package:delivery_app/components/constant.dart';
import 'package:delivery_app/components/customeImage.dart';
import 'package:delivery_app/components/custome_text.dart';
import 'package:delivery_app/components/product_card.dart';
import 'package:delivery_app/screen/mainscreen/restaurent_screen/restaurent_category_section.dart';
import 'package:delivery_app/utils/appColors.dart';
import 'package:flutter/material.dart';

class RestaurentMenu extends StatefulWidget {
  const RestaurentMenu({ Key? key }) : super(key: key);

  @override
  _RestaurentMenuState createState() => _RestaurentMenuState();
}

class _RestaurentMenuState extends State<RestaurentMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start ,
          children: [
            UpperSection(),
            
            RestaurantCategarySection(),
            SizedBox(
              height: 18,
            ),
            CustomeTitle(text: "Best Seller"),
            ProductLIst(),
            FooterSection()
          ],
        ),
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 73,
      color: Colors.green,
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomeText(text: "3 Items",color: kwhite,fontSize: 14,fontWeight: FontWeight.w400,),
             Row(
               children: [
                 CustomeText(text: "view card",color: kwhite,fontSize: 24,fontWeight: FontWeight.w600,),
                  SizedBox(
               width: 14,
             ),
                  Container(
               width: 80,
               height:40,
               decoration: BoxDecoration(
                 color:Colors.white24,
                 borderRadius: BorderRadius.circular(12)

               ),
               child: Center(child: CustomeText(text: "20.49 \$",fontSize: 16,fontWeight: FontWeight.w600,color: kwhite,)),
             )
               ],
             ),
            //  SizedBox(
            //    width: 14,
            //  ),
            
          ],
        ),
      ),
    );
  }
}

class ProductLIst extends StatelessWidget {
  const ProductLIst({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView.separated(
      itemBuilder:(context,index){
        return ProductCard();
      },
       separatorBuilder: (context,index)=> Divider(),
        itemCount: 6)
        );
  }
}

class UpperSection extends StatelessWidget {
  const UpperSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppBarButton(ontap: (){
          Constant.goBack(context);
        },),
        Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomeText(text: "Westway",fontSize: 18,fontWeight:FontWeight.w400 ,color: kgrey,),
            CustomeText(text: "Home",fontSize: 20,fontWeight:FontWeight.w500 ,color: kblack,),  
            
          ],
        ),

       CustomSvg(svgName: "ion_options-outline")
    ],);
  }
}