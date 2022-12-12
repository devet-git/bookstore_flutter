class Profile {
  static int id = 0;
  static String username = "";
  static String email = "";
  static String firstName = "";
  static String lastName = "";
  static String phone = "";
  static String avatar = "";
  static String address = "";
  static int roleId = 0;
  Profile();
  factory Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    firstName = json['first_name'] ?? "";
    lastName = json['last_name'];
    phone = json['phone'];
    avatar = json['avatar'];
    address = json['address'];
    roleId = json['role_id'];
    return Profile();
  }
}
