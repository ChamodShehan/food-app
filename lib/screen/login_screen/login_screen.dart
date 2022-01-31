import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:delivery_app/components/constant.dart';
import 'package:delivery_app/components/customeBotton.dart';
import 'package:delivery_app/components/customeHeader.dart';
import 'package:delivery_app/components/customeTextField.dart';

import 'package:delivery_app/components/dialogBox.dart';
import 'package:delivery_app/controller/authcontroller.dart';
import 'package:delivery_app/providers/auth/login_provider.dart';
import 'package:delivery_app/screen/login_screen/forgot_password.dart';
import 'package:delivery_app/screen/login_screen/register.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
Future <bool> inibackButton() async {
    return false;
  }
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: inibackButton,
      child: Scaffold(
        body: SingleChildScrollView(
          child: FadeInRight(
            child: Container(
                
              
              
                child:Column(
                  children: [
                   
                    CustomeHeader(size: size,image: 'top.png',header: "Login",tagName: 'Access Account',),
                    SizedBox(
                      height:20
                    ),
                    Column(
                      children: [
                        Row(
                            mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 2,
                                primary: Colors.white,
                                padding: EdgeInsets.all(20),
                                shape:RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                                )
                              ),
                              onPressed: (){
    
                              }, 
                              child: Image.asset( Constant.imgAsset('facebook.png'))),
                              SizedBox(width: 10,),
                              ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 2,
                                primary: Colors.white,
                                padding: EdgeInsets.all(20),
                                shape:RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                                )
                              ),
                              onPressed: (){}, 
                              child: Image.asset(Constant.imgAsset('google.png')))
                          ]
                        ),
                        SizedBox(
                      height:15
                    ),
                        Text('or login with email',
                          style:GoogleFonts.poppins(fontSize: 16,
                            fontWeight:FontWeight.w400,
                            color:Colors.black)
                          ),
                
                      Consumer<LoginProvider>(
                        builder: (context, value, child) {
                          return Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal:20
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           Text('Email',
                          style:GoogleFonts.poppins(fontSize: 16,
                            fontWeight:FontWeight.w500,
                            color:Colors.black)
                          ),
                          SizedBox(
                            height:6
                          ),
                          CustomeTextFiled(controller:value.emailController,),
                          SizedBox(
                            height:14
                          ),
                          Text('Password    ',
                          style:GoogleFonts.poppins(fontSize: 16,
                            fontWeight:FontWeight.w500,
                            color:Colors.black)
                          ),
                          
                          SizedBox(
                            height:6
                          ),
                          SizedBox(
                            width:double.infinity,
                            child:TextField(
                             // controller: value.passwordControl,
                              //  obscureText:value.isObscure,
                              decoration:InputDecoration(
                                filled: true,
                                fillColor:Colors.white,
                                suffixIcon: IconButton(onPressed: (){
                                 value.changeObscure();
                                }, icon: Icon(value.isObscure?Icons.visibility:Icons.visibility_off)),
                                 enabledBorder: OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(10),
                                     borderSide: BorderSide(
                                       color: Colors.white
                                     )
                                   
                                   ),
                                   focusedBorder: OutlineInputBorder(
                                     borderRadius: BorderRadius.circular(10),
                                     borderSide: BorderSide(
                                       color: Colors.red
                                     )
                                
                                )
                              )
                            ),
                          ),
                          SizedBox(
                            height:35
                          ),
                          
                          CustomeButton(
                            name: "Sign in",
                            isLoading:value.isLoad,
                            onTap: (){
    
                            value.startLogin(context);
                        
                          },),   
                          
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: RichText(
                                text: TextSpan(
                                  children:
                              
                              [
                                TextSpan(
                                  text:"Don't have an account ?",
                                  style: TextStyle(
                                    fontSize:16,
                                    color: Colors.black
                                  )
                                ),
                                 TextSpan(
                                  text:"Register",
                                 recognizer: TapGestureRecognizer()
                                 ..onTap=(){
                                   Constant.navigatorAsset(context, Register());
                                 },
                                  style: TextStyle(
                                    fontSize:14,
                                    color: Colors.black,
                                    fontWeight:FontWeight.w800
                                  )
                                )
          
          
                              ]
                               ),),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: TextButton(
                                onPressed:(){
                                  Constant.navigatorAsset(context,Forgotpassword());
                                },
                                child:Text("forgot Password" ,style: TextStyle(
                                      fontSize:14,
                                      color: Colors.black,
                                      fontWeight:FontWeight.w800
                                    ))
                              ),
                            )
                        ],),
                      );
                        }
                      
                      
                      )
                
                      ],
                    )
                ],)
            ),
          ),
        ),
      ),
    );
  }


}
