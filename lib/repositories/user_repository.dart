// lib/repositories/user_repository.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/user.dart';

part 'user_repository.g.dart'; // Required for the generator

class UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // READ (Real-time Stream)
  Stream<List<User>> getUsers() {
    return _firestore.collection('users').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => User.fromFirestore(doc.data(), doc.id))
          .toList();
    });
  }

  // CREATE
  Future<void> addUser(String name) async {
    await _firestore.collection('users').add({'name': name});
  }

  // UPDATE
  Future<void> updateUser(String id, String newName) async {
    await _firestore.collection('users').doc(id).update({'name': newName});
  }

  // DELETE
  Future<void> deleteUser(String id) async {
    await _firestore.collection('users').doc(id).delete();
  }
}

// Generated Provider annotation
@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepository();
}
