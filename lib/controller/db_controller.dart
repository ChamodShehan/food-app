import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/models/user_models.dart';
import 'package:logger/logger.dart';

class RegisterUser{

  CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser(
      String fullName,
      String email,
      String phonenumber,
     
    ) {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            'email': email,
            'name': fullName, // John Doe
            'phonenumber':phonenumber,
            
             // Stokes and Sons
             // 42
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

   
    
}

class  DatabaseController {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
  Future <UserModel?>getUserData(String id)async {

      try{
         DocumentSnapshot snpshot=await users.doc(id).get();
         Logger().i(snpshot.data());
         UserModel usermodel=UserModel.fromMap(snpshot.data() as Map<String,dynamic>);
         return usermodel;
      }catch(e){
        Logger().e(e);
      }
    
    }
}