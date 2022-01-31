import 'package:delivery_app/components/CustomeTitle.dart';
import 'package:delivery_app/components/app_bar_button.dart';
import 'package:delivery_app/components/constant.dart';
import 'package:delivery_app/components/customeImage.dart';
import 'package:delivery_app/components/custome_text.dart';
import 'package:delivery_app/components/image_tile.dart';
import 'package:delivery_app/components/product_card.dart';
import 'package:delivery_app/screen/mainscreen/restaurant_menu/restaurent_menu.dart';
import 'package:delivery_app/screen/mainscreen/restaurent_screen/restaurent_category_section.dart';
import 'package:delivery_app/utils/appColors.dart';
import 'package:flutter/material.dart';

class RestaurentDetailsScreen extends StatefulWidget {
  const RestaurentDetailsScreen({ Key? key }) : super(key: key);

  @override
  _RestaurentDetailsScreenState createState() => _RestaurentDetailsScreenState();
}

class _RestaurentDetailsScreenState extends State<RestaurentDetailsScreen> {
  @override
  Widget build(BuildContext context) {
     final size=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UpperSection(size: size),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RestaurentDetailsSection(),
                    SizedBox( height: 23),
                    RestaurantCategarySection(),
                    SizedBox(height: 20,),
                    CustomeTitle(text: "Best Products"),
                    ProductListSection(),
                    GestureDetector(
                      onTap: (){
                       Constant.navigatorAsset(context,RestaurentMenu());
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right:40,bottom: 10,top: 10),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: CustomeText(text: "See our menu",
                          color:korange,fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            
           
                
          ],
        ),
      ),
    );
  }
}

class ProductListSection extends StatelessWidget {
  const ProductListSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:30 ),
      child: SizedBox(
        child: Container(
          height: 300,
          child: ListView.separated(itemBuilder: (context, index) {
            
            return ProductCard();
          }, separatorBuilder: (context, index)=> 
            Divider()
          , itemCount: 3),
        )
      ),
    );
  }
}




class RestCategeriTile extends StatefulWidget {
   RestCategeriTile({
    Key? key, required this.name,
  }) : super(key: key);

  
  final String name;
  @override
  State<RestCategeriTile> createState() => _CategeriTileState();
}

class _CategeriTileState extends State<RestCategeriTile> {
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
              
              height: 35,
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color:isSelected? korange:Colors.white,
                borderRadius: BorderRadius.circular(15)
              ),
              alignment:Alignment.center ,
              child:  CustomeText(
                text:widget.name,
                fontSize: 14,
                 color:isSelected? Colors.white:kgrey,
                )
            ),
          ),
          
         
        ],
      ),
    );
  }
}

class RestaurentDetailsSection extends StatelessWidget {
  const RestaurentDetailsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomeText(text: "Westway",
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                  ),
                   Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   mainAxisSize: MainAxisSize.min,
                   children: [

                     Row(
                      children: [
                        Icon(Icons.star,color: Colors.amber,size: 15,),
                        CustomeText(text: "4.6  • ",fontSize: 15,)
                      ],
                ),
                     Row(
                      children: [
                        Icon(Icons.timer,color: kgrey,size: 15,),
                        CustomeText(text: "15 min ",fontSize: 15,)
                      ],
                ),
                   ],
                 ),
                ],
              ),
              CustomeText(text: "More Info ",fontSize: 14,color: korange,)
            ],
          ),
          SizedBox(
            height: 10,
          ),
          CustomeText(text: "Healthy eating means eating a variety of foods that give you the nutrients you need to maintain your health, feel good, and have energy. ",fontSize: 14,color: kgrey,textAlign: TextAlign.justify,)
        ],
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
    return Container(
      width: size.width,
      height: 300,
      child:Stack(
        children: [
          Container(
            width: size.width,
            height: 320,
            child: ClipRRect(
              borderRadius:BorderRadius.only(
                bottomLeft: Radius.circular(45),
                bottomRight: Radius.circular(45)
              ) 
              ,
              child: Image.asset(
                
                "images/salad.jpg",
                fit: BoxFit.fill,
                ),
            )
              
              ),
      
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 10
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppBarButton(ontap: (){},),
                      Row(
                        children: [
                          AppBarButton(ontap: (){},name: "wpf_like",),
                          SizedBox(
                            width: 10,
                          ),
                          AppBarButton(ontap: (){},name: "feather_share"),
                        ],
                      ),
                    ],
                  ),
                ))
        ],
      )
    );
  }
}
