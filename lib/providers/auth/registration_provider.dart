

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:delivery_app/components/dialogBox.dart';
import 'package:delivery_app/controller/authcontroller.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class RegistrationProvider extends ChangeNotifier{
 bool _isObs=true;
  bool _isLoad=false;
  final _email=TextEditingController();
  final _password=TextEditingController();
  final _name=TextEditingController();
  final _phone=TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

   bool get isObscure =>_isObs;

  bool get isLoad =>_isLoad;

   TextEditingController get emailController =>_email;

  TextEditingController get passwordControl => _password;

   TextEditingController get nameController =>_name;

  TextEditingController get phoneControl => _phone;

  void changeObscure(){
    _isObs=!_isObs;
    notifyListeners();
  }

   bool inputValidation(){
    var isValid = false;

    if(_email.text.isEmpty || _password.text.isEmpty || _name.text.isEmpty || _phone.text.isEmpty){
      isValid =false;
    }else if(!EmailValidator.validate(_email.text)){
      isValid =false;
    }else if(_phone.text.length!=10){
      isValid =false;
    }else{
      isValid =true;
    }

    return isValid;
  }

  Future<void> startRegister(BuildContext context)async {

    try{
       if(inputValidation()){

                              setLoading(true);
                              AuthController().registerUser(context,_email.text,_password.text,_name.text,_phone.text);

                             setLoading();
                             }else{
                                DialogBox().dialogBox(
                             context,
                             DialogType.ERROR,
                           "incorrect information",
                           
                           );
                             }

    }catch(e){
      setLoading();
      Logger().e(e);
    }

  }

  
void setLoading([bool val=false]){
  _isLoad=val;
  notifyListeners();
}
}