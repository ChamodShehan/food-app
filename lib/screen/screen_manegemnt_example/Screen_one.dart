import 'package:delivery_app/components/custome_text.dart';
import 'package:delivery_app/providers/counter_provider.dart';
import 'package:delivery_app/screen/screen_manegemnt_example/screen_two.dart';
import 'package:delivery_app/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({ Key? key }) : super(key: key);

  @override
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {

  int count=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          
          child: Consumer<CounterProvider>( builder: (context, value, child) =>  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (){
                    value.increaseCount();
                  },
                child:CustomeText(text: "+",color: kwhite,)
                ),
                CustomeText(text: value.getCount().toString(),fontSize: 50, fontWeight: FontWeight.w600,),
                 ElevatedButton(
                  onPressed: (){
          
                   value.dereaseCount();
              
                  },
                child:CustomeText(text: "-",color: kwhite,)
                ),
                 ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScreenTwo(count:count ,)));
                  },
                child:CustomeText(text: "Go to second",color: kwhite,)
                ),
              ],
            ) ,
            
          ),
        ),
      ),
    );
  }
}