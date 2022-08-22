class AppUser{
  String? email;
  String? userNmae;
  String? phone;
  String? password;
  String? id;
  AppUser({required this.email,required this.userNmae,required this.phone,this.id,this.password});
  AppUser.fromMap(Map<String, dynamic> map){
    email=map['email'];
    userNmae=map['userNmae'];
    phone=map['phone'];
  }
  Map<String,dynamic> toMap(){
    return {
      'email':email,
      'userName':userNmae,
      'phone':phone,
  };
}

}