import 'package:iklin/core/errors/errors.dart';
import 'package:iklin/core/network/network.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

abstract class AuthRemoteDatasource {
  Future<bool> activateBasicSignUp({
    required String email,
    required String otp,
  });
  Future<bool> basicSignup({
    required String email,
  });
  
}

@LazySingleton(as: AuthRemoteDatasource)
class AuthRemoteDataSourceImpl implements AuthRemoteDatasource {
  AuthRemoteDataSourceImpl({
    required this.networkInfo,
    required this.apiRequester,
  });

  final NetworkInfo networkInfo;
  final ApiRequester apiRequester;

  @override
  Future<bool> activateBasicSignUp(
      {required String email, required String otp}) async {
    if (await networkInfo.isConnected) {
      final body = {
        'email': email,
        'otp': otp,
      };
      Logger().d(body);
      final response = await apiRequester.post(
        endpoint: 'users/auth/activate_basic_signup',
        body: body,
      );
      return response.statusCode == 200;
    } else {
      throw NoInternetException();
    }
  }

  @override
  Future<bool> basicSignup({required String email}) async {
    if (await networkInfo.isConnected) {
      final body = {
        "email": email,
      };
      Logger().d(body);
      final response = await apiRequester.post(
        endpoint: 'users/auth/basic_signup',
        body: body,
      );
      return response.statusCode == 201;
    } else {
      throw NoInternetException();
    }
  }
}
