
import 'package:delivery_app/components/customeBotton.dart';
import 'package:delivery_app/components/customeHeader.dart';
import 'package:delivery_app/components/customeTextField.dart';

import 'package:delivery_app/controller/authcontroller.dart';
import 'package:delivery_app/providers/auth/registration_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';

import 'package:provider/provider.dart'; 

 

class Register extends StatefulWidget {
  const Register({ Key? key }) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
 
  @override
  Widget build(BuildContext context) {
    
    final size=MediaQuery.of(context).size;
    return Scaffold(

     
      body: FadeInRight(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomeHeader(size: size,image: 'top.png',header: "Register",tagName: 'Create Account',),

                Consumer<RegistrationProvider>(
                  builder: (context, value, child) =>
                   Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text('Name',
                            style:GoogleFonts.poppins(fontSize: 16,
                              fontWeight:FontWeight.w500,
                              color:Colors.black)
                            ),
                            SizedBox(
                              height:6
                            ),
                            CustomeTextFiled(controller: value.nameController,),
                            SizedBox(
                              height:14
                            ),
                            
                         Text('Email',
                            style:GoogleFonts.poppins(fontSize: 16,
                              fontWeight:FontWeight.w500,
                              color:Colors.black)
                            ),
                            SizedBox(
                              height:6
                            ),
                            CustomeTextFiled(controller: value.emailController,),
                            SizedBox(
                              height:14
                            ),
                             Text('Phone Number',
                            style:GoogleFonts.poppins(fontSize: 16,
                              fontWeight:FontWeight.w500,
                              color:Colors.black)
                            ),
                            SizedBox(
                              height:6
                            ),
                            CustomeTextFiled(controller: value.phoneControl,),
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
                                controller: value.passwordControl,
                                  obscureText:value.isObscure,
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
                            value.isLoad? Center(child: CircularProgressIndicator()):
                            CustomeButton(
                              name: "Register",
                              isLoading: value.isLoad,
                              onTap: ()  {
                                value.startRegister(context);
                            
                            },), 
                      ],),
                    )
                   ),
                   
                    
              ],
            ),
          ),
        ),
      ),
    );
  }

 
}
