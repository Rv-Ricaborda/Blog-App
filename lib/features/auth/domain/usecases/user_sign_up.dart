import 'package:blog_app/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:blog_app/core/erorr/failures.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repository.dart';

class UserSignUp implements Usecase<String, UserSignUpParams> {
  final AuthRepository authRepository;
  const UserSignUp({required this.authRepository});
  @override
  Future<Either<Failure, String>> call(UserSignUpParams params) async {
    return await authRepository.singupWithEmailPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignUpParams {
  final String email;
  final String password;
  final String name;

  UserSignUpParams({
    required this.email,
    required this.password,
    required this.name,
  });
}
