class UserModel{
  String? uId;
  String? email;
  String? name;
   UserModel({this.uId ="",this.email, this.name});
   
  UserModel.fromJson(Map<String, dynamic> json) : this(
   uId: json["id"],
   email: json["email"],
   name: json["name"]
  );

  Map<String, dynamic> toJson()=>{
    "id":uId,
    "email": email,
    "name": name
  };
}