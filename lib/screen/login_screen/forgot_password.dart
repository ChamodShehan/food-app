
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:delivery_app/components/customeBotton.dart';
import 'package:delivery_app/components/customeHeader.dart';
import 'package:delivery_app/components/customeTextField.dart';
import 'package:delivery_app/components/dialogBox.dart';
import 'package:delivery_app/controller/authcontroller.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({ Key? key }) : super(key: key);

  @override
  _ForgotpasswordState createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  final _email=TextEditingController();
  bool isLoad=false;

  @override
   Widget build(BuildContext context) {
     final size=MediaQuery.of(context).size;
        return Scaffold(
            body: SingleChildScrollView(
              child:Column(
                children: [
                  CustomeHeader(size: size,image: 'top.png',header: "Forgot Password",tagName: 'Enter your email address',),
                   Padding(
                     padding: const EdgeInsets.all(20),
                     child: Column(
                       children: [
                         Text('Email',
                              style:GoogleFonts.poppins(fontSize: 16,
                                fontWeight:FontWeight.w500,
                                color:Colors.black)
                              ),
                              SizedBox(
                            height:6
                          ),
                          CustomeTextFiled(controller: _email,),
                         isLoad? Center(child: CircularProgressIndicator()):
                        CustomeButton(name: "Reset Password",onTap: ()async{

                          
                          if(inputValidation()){

                            setState((){
                              isLoad=true;
                          });
                          
                              await AuthController().sendPasswordResetEmail(
                                 context,_email.text
                               )  ;

                          setState((){
                            isLoad=false;
                          });
                          }else{
                             DialogBox().dialogBox(
                              context,
                              DialogType.ERROR,
                            "Please entr valid details");
                          }
                        },),   
                       ],
                     ),
                   ),
                        

                ],
              ),
            )
        );

   }
   
bool inputValidation(){

  bool isValid=false;
  if(_email.text.isEmpty){
    isValid=false;
  }
  else if(!EmailValidator.validate(_email.text)){
      isValid=false;
  }else{
    isValid=true;
  }

  return isValid;
}

}