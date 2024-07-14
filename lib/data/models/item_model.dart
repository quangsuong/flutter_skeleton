import 'package:floor/floor.dart';

@Entity(tableName: 'item',primaryKeys: ['id'])
class Item {
  final int id;
  final String firstName;
  final String lastName;
  final String email;

  Item({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    };
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
    );
  }
}
