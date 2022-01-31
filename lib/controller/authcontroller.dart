
import 'package:awesome_dialog/awesome_dialog.dart';

import 'package:delivery_app/components/dialogBox.dart';
import 'package:delivery_app/controller/db_controller.dart';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';




class AuthController{
  
FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> registerUser(

    BuildContext context,
    String email,
    String password,
    String fullName,
    String phonenumber,
    

  )async {

try{
                             UserCredential uc= await FirebaseAuth.instance.createUserWithEmailAndPassword(
                               email: email, 
                             password: password
                             );
                                if(uc.user!.uid.isNotEmpty)
                              {await RegisterUser().addUser(fullName,email,phonenumber);}
                              
                             DialogBox().dialogBox(context,DialogType.SUCCES,"congradulation");
                               }on FirebaseAuthException catch (e){

                                  if(e.code == 'weak-password'){
                                    print("the password provided is weak");
                                    DialogBox().dialogBox(context,DialogType.WARNING,"the password provided is weak");
                                    
                                  }else if(e.code == 'email-already-in-use'){
                                    print('email already in use');
                                    DialogBox().dialogBox(context,DialogType.WARNING,"email already in use");
                                    
                                  }
                               }catch (e){
                                 print(e);
                               }
                              
  }

  Future<void> loginUser(BuildContext context, String email,String password) async{
                                try {
                                    UserCredential userCredential = await FirebaseAuth.instance.                                  signInWithEmailAndPassword(
                                      email: email,
                                      password: password,
                                    );
                                  //  if(userCredential.user !=null)
                                   // {Constant. pushremovenevigation(context,HomePage());}
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'user-not-found') {
                                      print('No user found for that email.');
                                       DialogBox().dialogBox(
                              context,
                              DialogType.ERROR,
                            "No user found for that email.");
                                    } else if (e.code == 'wrong-password') {
                                      print('Wrong password provided for that user.');
                                       DialogBox().dialogBox(
                              context,
                              DialogType.ERROR,
                            "Wrong password provided for that user.");
                                    }
                                  }
  }
  Future <void> sendPasswordResetEmail(BuildContext context, String email) async {
try{
await auth.sendPasswordResetEmail(email:email);
}on FirebaseAuthException catch(e){

  if(e.code=='invalid-email'){
    DialogBox().dialogBox(
                              context,
                              DialogType.ERROR,
                            "Enter valid email");
  }else{
    DialogBox().dialogBox(
                              context,
                              DialogType.ERROR,
                            e.toString());
  }
}

catch(e){

}
    
  }
}