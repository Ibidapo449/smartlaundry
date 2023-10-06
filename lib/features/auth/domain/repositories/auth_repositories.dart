import 'package:dartz/dartz.dart';
import 'package:iklin/core/errors/errors.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> activateBasicSignup({
    required String email,
    required String otp,
  });
  Future<Either<Failure, bool>> basicSignup({
    required String email,
  });
}
