class UserModel{

  late String uid;
  late String  phonrNo;
  late String name;
  late String email; 

  UserModel({ required this.uid,required this.phonrNo,required this.email,required this.name,});

  UserModel.fromMap(Map map){
    uid=map['uid'];
   phonrNo=map['phone'];
    name=map['name'];
    email=map['email'];
  }
}