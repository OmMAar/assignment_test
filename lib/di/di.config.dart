// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import '../helpers/hlp_shared_preference.dart' as _i12;
import '../managers/http/mgr_app_http_manager.dart' as _i7;
import '../managers/managers.dart' as _i6;
import '../modules/authentication/data/service/auth_data_authentication_local_service.dart'
    as _i4;
import '../modules/authentication/data/service/auth_data_authentication_remote_service.dart'
    as _i9;
import '../modules/authentication/data/service/auth_data_authentication_service.dart'
    as _i3;
import '../modules/authentication/domain/repo/auth_dom_authentication_repo.dart'
    as _i11;
import '../modules/authentication/domain/repo/auth_dom_authentication_repo_i.dart'
    as _i10;
import 'injector_module.dart' as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final serviceModule = _$ServiceModule();
  gh.factory<_i3.AuthService>(() => _i4.AuthLocalService(),
      instanceName: 'local');
  gh.lazySingleton<_i5.Dio>(() => serviceModule.dio);
  gh.singleton<_i6.HttpManager>(_i7.AppHttpManager());
  await gh.factoryAsync<_i8.SharedPreferences>(() => serviceModule.prefs,
      preResolve: true);
  gh.factory<_i3.AuthService>(
      () => _i9.AppRemoteService(get<_i6.HttpManager>()),
      instanceName: 'remote');
  gh.factory<_i10.IAuthRepo>(() => _i11.AuthRepo(
      get<_i3.AuthService>(instanceName: 'remote'),
      get<_i3.AuthService>(instanceName: 'local')));
  gh.lazySingleton<_i12.SharedPreferenceHelper>(
      () => _i12.SharedPreferenceHelper(get<_i8.SharedPreferences>()));
  return get;
}

class _$ServiceModule extends _i13.ServiceModule {}
