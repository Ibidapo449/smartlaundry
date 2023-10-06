import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:iklin/core/errors/errors.dart';
import 'package:iklin/core/usecase/usecase.dart';
import 'package:iklin/features/auth/domain/repositories/auth_repositories.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class BasicSignup extends UseCase<bool, BasicSignupParams> {
  BasicSignup({
    required this.authRepository,
  });

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, bool>> call(
    BasicSignupParams params,
  ) =>
      authRepository.basicSignup(
        email: params.email,
      );
}

class BasicSignupParams extends Equatable {
  const BasicSignupParams({
    required this.email,
  });
  final String email;

  @override
  List<Object?> get props => [
        email,
      ];
}
