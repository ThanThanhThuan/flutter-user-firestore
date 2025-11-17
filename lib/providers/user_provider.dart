// lib/providers/user_provider.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/user.dart';
import '../repositories/user_repository.dart';

part 'user_provider.g.dart'; // Required for the generator

@riverpod
Stream<List<User>> usersStream(UsersStreamRef ref) {
  // Watch the repository provider and use its stream method
  final userRepository = ref.watch(userRepositoryProvider);
  return userRepository.getUsers();
}
