import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemote {
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<String> loginWithEmailPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteImpl implements AuthRemote {
  final SupabaseClient supabaseClient;
  AuthRemoteImpl({required this.supabaseClient});
  @override
  Future<String> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user == null) {
        throw Exception('User is null');
      }
      return response.user!.id;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {'name': name},
      );
      if (response.user == null) {
        throw Exception('User is null');
      }
      return response.user!.id;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
