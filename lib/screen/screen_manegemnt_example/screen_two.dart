import 'package:delivery_app/components/custome_text.dart';
import 'package:delivery_app/providers/counter_provider.dart';
import 'package:delivery_app/screen/screen_manegemnt_example/Screen_one.dart';
import 'package:delivery_app/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenTwo extends StatefulWidget {
   ScreenTwo({ Key? key, required this.count } ) : super(key: key);

   int count;

  @override
  _ScreenTwoState createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {

  
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    widget.count++;
                  });
                },
              child:CustomeText(text: "+",color: kwhite,)
              ),
              CustomeText(text:Provider.of<CounterProvider>(context,listen: false).getCount().toString() ,fontSize: 50, fontWeight: FontWeight.w600,),
               ElevatedButton(
                onPressed: (){
                   setState(() {
                    widget.count--;
                  });
                },
              child:CustomeText(text: "-",color: kwhite,)
              ),
               ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScreenOne()));
                },
              child:CustomeText(text: "Go to one",color: kwhite,)
              ),
            ],
          ),
        ),
      ),
    );
  }
}