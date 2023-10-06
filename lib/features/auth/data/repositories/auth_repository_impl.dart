import 'package:dio/dio.dart';
import 'package:iklin/core/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:iklin/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:iklin/features/auth/domain/repositories/auth_repositories.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@LazySingleton(as: AuthRepository)
class AuthRespositoryImpl implements AuthRepository {
  AuthRespositoryImpl({
    required this.remoteDatasource,
  });

  final AuthRemoteDatasource remoteDatasource;

  @override
  Future<Either<Failure, bool>> activateBasicSignup({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await remoteDatasource.activateBasicSignUp(
        email: email,
        otp: otp,
      );
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e.response?.data);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          return Left(
            ServerFailure(
              message: (e.response!.data as Map<String, dynamic>)['error'] ??
                  (e.response!.data as Map<String, dynamic>)['message'] ??
                  'Service unavailable, please try again!',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      Logger().d(e);
      Logger().d(StackTrace.current);
      return Left(
        UnknownFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> basicSignup({required String email}) async {
    try {
      final response = await remoteDatasource.basicSignup(
        email: email,
      );
      return Right(response);
    } catch (e) {
      // Logger().e(e);
      if (e is NoInternetException) {
        return Left(NoInternetFailure());
      }
      if (e is DioError) {
        Logger().d(e.error);
        if (e.type == DioErrorType.connectionTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          return Left(
            TimoutFailure(),
          );
        }
        Logger().e(e.response?.data);
        if (e.response?.data != null && e.response?.data != '') {
          Logger().d(e.response!.data);
          return Left(
            ServerFailure(
              message: (e.response!.data as Map<String, dynamic>)['error'] ??
                  (e.response!.data as Map<String, dynamic>)['message'] ??
                  'Service unavailable, please try again!',
            ),
          );
        } else {
          return const Left(
            ServerFailure(
              message: 'Server error, please try again',
            ),
          );
        }
      }
      return Left(
        UnknownFailure(),
      );
    }
  }
}
