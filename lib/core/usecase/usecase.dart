import 'package:fpdart/fpdart.dart';
import 'package:blog_app/core/erorr/failures.dart';

abstract interface class Usecase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}
