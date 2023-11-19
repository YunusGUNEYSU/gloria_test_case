class RegisterModel {
  final String email;
  final String password;
  final String hotelname;

  RegisterModel({required this.email, required this.password, required this.hotelname});
  Map<String,dynamic> toJson()=>{
    "email":email,
    "password":password,
    "hotel_name":hotelname,
  };
}
