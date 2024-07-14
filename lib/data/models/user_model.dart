class UserModel {
  String id;
  String name;
  String email;
  String password;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
