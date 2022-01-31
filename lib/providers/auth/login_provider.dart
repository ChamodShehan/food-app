

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:delivery_app/components/dialogBox.dart';
import 'package:delivery_app/controller/authcontroller.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class LoginProvider extends ChangeNotifier{

  final _email=TextEditingController();
  final _password=TextEditingController();

  bool _isObs=true;
  bool _isLoad=false;

  bool get isObscure =>_isObs;

  bool get isLoad =>_isLoad;

  TextEditingController get emailController =>_email;

  TextEditingController get passwordControl => _password;

  void changeObscure(){
    _isObs=!_isObs;
    notifyListeners();
  }

  bool inputValidation(){

  bool isValid=false;
  if(_email.text.isEmpty || _password.text.isEmpty){
    isValid=false;
  }
  else if(!EmailValidator.validate(_email.text)){
      isValid=false;
  }else{
    isValid=true;
  }

  return isValid;
}

Future<void> startLogin( BuildContext context)async {

  try{
       if(inputValidation()){

                          setLoading(true);
                         
                                 AuthController().loginUser(
                                   context,
                                   _email.text,
                                   _password.text);
                         setLoading();
                         }else{
                            DialogBox().dialogBox(
                             context,
                             DialogType.ERROR,
                           "Please entr valid details");
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