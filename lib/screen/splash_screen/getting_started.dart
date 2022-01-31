import 'package:carousel_slider/carousel_slider.dart';
import 'package:delivery_app/components/constant.dart';
import 'package:delivery_app/screen/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class GettingStarted extends StatefulWidget {

  
  const GettingStarted({ Key? key }) : super(key: key);

  @override
  _GettingStartedState createState() => _GettingStartedState();
}

class _GettingStartedState extends State<GettingStarted> {
CarouselController carouselController = CarouselController();

    int _current=0;
    List<Widget> list=[
      Body(img:"popcorn.png" ,text1:"Choose A Tasty Dish" ,text2:"Order anything you want from your\n Favorite restaurant." ,),
      Body(img:"money.png" ,text1:"Easy Payment" ,text2:"Payment made easy through debit\n card, credit card  & more ways to pay for your food" ,),
      Body(img:"restaurant.png" ,text1:"Enjoy the Taste!" ,text2: "Healthy eating means eating a variety\n of foods that give you the nutrients you\n need to maintain your health.",)];
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    
    return Scaffold(
      body: Container(
        width:size.width,
        height:size.height,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            CarouselSlider(
              carouselController:carouselController,
     options: CarouselOptions(
       
    height: 400.0,
       onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
  
  
  items: list.map((i) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          child:i
        );
      },
      
    );
  }).toList(),
  
),Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: list.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => carouselController.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == entry.key ?Colors.black:Colors.grey),
              ),
            );
          }).toList(),
        ),
      
            BottumSection(size: size,ontab1: () => carouselController.nextPage(),)
          ],
        )
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key, required this.img, required this.text1, required this.text2,
  }) : super(key: key);
  final String img;
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
     
      child: Column(
        children: [
          Image.asset(Constant.imgAsset(img)),
           SizedBox(
            height: 37,
          ),
          Text(text1),
          SizedBox(height: 8,),
          Text(text2)
        ],
      )
    );
  }
}

class BottumSection extends StatelessWidget {
  const BottumSection({
    Key? key,
    required this.size,
     required this.ontab1,
     
  }) : super(key: key);

  final Size size;
  final Function() ontab1;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Image.asset(Constant.imgAsset('Bottom.png'),
          width:size.width,
           fit:BoxFit.fitWidth),
           Positioned(
             bottom:39,
             right:43,
             child: Row(children:[
               ElevatedButton(
                 onPressed:ontab1, child: 
                 Text('Next',
                 style: TextStyle(color: Colors.black),
                 
                 ),
                 style:ElevatedButton.styleFrom(
           
                   
                   
                   primary: Colors.white,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(20 )
                   )
                 )
                 ),
               TextButton(onPressed:(){ Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));}, child: Text('Skip'))
             ]),
           )

        ],
      ),
    );
  }
}