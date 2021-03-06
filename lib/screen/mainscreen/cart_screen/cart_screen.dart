import 'package:delivery_app/components/app_bar_button.dart';
import 'package:delivery_app/components/constant.dart';
import 'package:delivery_app/components/customeImage.dart';
import 'package:delivery_app/components/custome_text.dart';
import 'package:delivery_app/components/product_card.dart';
import 'package:delivery_app/screen/mainscreen/cart_screen/cart_item.dart';
import 'package:delivery_app/utils/appColors.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({ Key? key }) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
  final size=MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            UpperSection(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30 ),
              child: Container(
                height: 111,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: korange,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Stack(children: [
                  Positioned(
                    top: 23,
                    left:23,
                    child: Icon(Icons.location_on_outlined,color: kwhite,)
                    ),
                    Positioned(
                      top:23,
                      left:54,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomeText(text: "Deliever to:",fontSize: 14,fontWeight: FontWeight.w400,color: kwhite,),
                           CustomeText(text: "242 ST Marks Eve,\n Finland ",fontSize: 14,fontWeight: FontWeight.w400,color: kwhite,),
                        ],
                      ),
                    ),
                      Positioned(
                    top: 52,
                    right:17,
                    child: Icon(Icons.keyboard_arrow_down,color: kwhite,)
                    ),
                ],),
                ),
            ),
            Expanded(child: ListView.separated(
              itemBuilder: (context,index){
                return CartItem();
              }, 
              separatorBuilder: (context,index){
                return Divider();
              },
               itemCount: 3)),
            
            FooterSection(size: size)
          ],
        ),
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Constant.imgAsset("cart-footer.png"),
          width: size.width,
          fit: BoxFit.fitWidth,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextField(
                      decoration: InputDecoration(
                        hintText: "PROMO CODE",
                        fillColor: kwhite,
                        filled: true,
                        suffixIcon: Icon(Icons.add),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)
                        )
                      ),
                    ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 111,right: 30,left: 30),
            child: Column(
              children: [
                CartAmountRow(text: "Item total",price: "\$ 20.49",)  ,
                SizedBox(
                  height: 10,
                ),
                CartAmountRow(text: "Discount",price: "- \$10",) , 
                 SizedBox(
                  height: 10,
                ),
                CartAmountRow(text: "Tax",price: "\$2",) ,
                 Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             CustomeText(text:"total",fontSize: 16,fontWeight: FontWeight.w600,),
             CustomeText(text: "\$12.49",fontSize: 20,fontWeight: FontWeight.w600,)
      ],
    ),SizedBox(
      height: 25,
    ),
   Container(
     width: double.infinity,
     height: 60,
     decoration: BoxDecoration(
       color: kwhite,
       borderRadius: BorderRadius.circular(15)
       
       ),
       child: Center(child: CustomeText(text: "Continue",fontSize: 17,fontWeight: FontWeight.w600,))
   )             

              ],
            ),
          )
      ],
    );
  }
}

class CartAmountRow extends StatelessWidget {
  const CartAmountRow({
    Key? key, required this.text, required this.price,
  }) : super(key: key);

  final String text;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomeText(text: text,fontSize: 14,fontWeight: FontWeight.w400,),
        CustomeText(text: price,fontSize: 14,fontWeight: FontWeight.w400,)
      ],
    );
  }
}

class CartItems extends StatelessWidget {
  const CartItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(color: Colors.blue,));
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
        CustomeText(text: "Cart",fontSize: 20,fontWeight:FontWeight.w500 ,color: kblack,),  

       CustomSvg(svgName: "ion_options-outline")
    ],);
  }
}