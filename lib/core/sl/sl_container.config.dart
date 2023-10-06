// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:device_info_plus/device_info_plus.dart' as _i5;
import 'package:dio/dio.dart' as _i7;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:iklin/core/device_infos/app_version.dart' as _i3;
import 'package:iklin/core/device_infos/device_information.dart' as _i6;
import 'package:iklin/core/network/api_requester.dart' as _i11;
import 'package:iklin/core/network/network.dart' as _i13;
import 'package:iklin/core/network/network_info.dart' as _i10;
import 'package:iklin/features/auth/data/datasources/auth_remote_datasource.dart'
    as _i12;
import 'package:iklin/features/auth/data/repositories/auth_repository_impl.dart'
    as _i15;
import 'package:iklin/features/auth/domain/repositories/auth_repositories.dart'
    as _i14;
import 'package:iklin/features/auth/domain/usecases/activate_basic_signup.dart'
    as _i17;
import 'package:iklin/features/auth/domain/usecases/basic_signup_usecase.dart'
    as _i16;
import 'package:iklin/features/auth/presentation/change_notifier/auth_notifier.dart'
    as _i18;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i9;
import 'package:package_info_plus/package_info_plus.dart' as _i4;

import 'register_module.dart' as _i19;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AppVersion>(
      () => _i3.AppVersion(packageInfo: gh<_i4.PackageInfo>()));
  gh.factory<_i5.DeviceInfoPlugin>(() => registerModule.deviceInfoPlugin);
  gh.lazySingleton<_i6.DeviceInformation>(() =>
      _i6.DeviceInformation(deviceInfoPlugin: gh<_i5.DeviceInfoPlugin>()));
  gh.factory<_i7.Dio>(() => registerModule.dio);
  gh.factory<_i8.FlutterSecureStorage>(
      () => registerModule.flutterSecureStorage);
  gh.factory<_i9.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.lazySingleton<_i10.NetworkInfo>(
      () => _i10.NetworkInfoImpl(gh<_i9.InternetConnectionChecker>()));
  gh.lazySingleton<_i11.ApiRequester>(
      () => _i11.ApiRequester(dio: gh<_i7.Dio>()));
  gh.lazySingleton<_i12.AuthRemoteDatasource>(
      () => _i12.AuthRemoteDataSourceImpl(
            networkInfo: gh<_i13.NetworkInfo>(),
            apiRequester: gh<_i13.ApiRequester>(),
          ));
  gh.lazySingleton<_i14.AuthRepository>(() => _i15.AuthRespositoryImpl(
      remoteDatasource: gh<_i12.AuthRemoteDatasource>()));
  gh.lazySingleton<_i16.BasicSignup>(
      () => _i16.BasicSignup(authRepository: gh<_i14.AuthRepository>()));
  gh.lazySingleton<_i17.ActivateBasicSignupUsecase>(() =>
      _i17.ActivateBasicSignupUsecase(
          authRepository: gh<_i14.AuthRepository>()));
  gh.lazySingleton<_i18.AuthNotifier>(() => _i18.AuthNotifier(
        activateBasicSignupUsecase: gh<_i17.ActivateBasicSignupUsecase>(),
        basicSignupUsecase: gh<_i16.BasicSignup>(),
      ));
  return getIt;
}

class _$RegisterModule extends _i19.RegisterModule {}
