class UserModel {
  String? fullname;
  String? email;
  String? address;
  String? phone;
  String? password;

  UserModel({
    this.fullname,
    this.email,
    this.address,
    this.phone,
    this.password,
  });

  UserModel.fromSnapshot(Map<String, dynamic> document) {
    fullname = document['fullname'] ?? "";
    email = document['email'] ?? "";
    address = document['address'] ?? "";
    phone = document['phone'] ?? "";
    password = document['password'] ?? "";
  }
}
