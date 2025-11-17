// lib/models/user.dart
class User {
  final String id;
  final String name;

  User({required this.id, required this.name});

  // Factory constructor for creating a User from a Firestore DocumentSnapshot
  factory User.fromFirestore(Map<String, dynamic> data, String id) {
    return User(id: id, name: data['name'] ?? '');
  }

  // Convert User object to a Map for Firestore
  Map<String, dynamic> toFirestore() {
    return {'name': name};
  }
}
