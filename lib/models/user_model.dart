// class AccountModel {
//   static String id = "";
//   static String name = "";
//   static String pw = "";
//   static String role = "";
//   AccountModel();
//   factory AccountModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['account_name'];
//     pw = json['password'];
//     role = json['role'] ?? "";

//     return AccountModel();
//   }
// }

class UserModel {
  String id;
  String name, email;

  UserModel({
    this.id = '',
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toJson() => {"id": id, "name": name, "email": email};
  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
      );
}
