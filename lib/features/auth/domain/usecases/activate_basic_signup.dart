import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:iklin/core/errors/errors.dart';
import 'package:iklin/core/usecase/usecase.dart';
import 'package:iklin/features/auth/domain/repositories/auth_repositories.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ActivateBasicSignupUsecase
    extends UseCase<bool, ActivateBasicSignupParams> {
  ActivateBasicSignupUsecase({
    required this.authRepository,
  });

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, bool>> call(
    ActivateBasicSignupParams params,
  ) =>
      authRepository.activateBasicSignup(email: params.email, otp: params.otp);
}

class ActivateBasicSignupParams extends Equatable {
  const ActivateBasicSignupParams({
    required this.email,
    required this.otp,
  });
  final String email;
  final String otp;

  @override
  List<Object?> get props => [
        email,
        otp,
      ];
}
