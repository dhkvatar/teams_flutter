// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:teams/app/di/di.dart' as _i14;
import 'package:teams/app/navigation/app_router.dart' as _i3;
import 'package:teams/domain/repositories/auth_repository.dart' as _i4;
import 'package:teams/domain/usecases/authentication/get_user_stream.dart'
    as _i5;
import 'package:teams/domain/usecases/authentication/is_user_logged_in.dart'
    as _i7;
import 'package:teams/domain/usecases/authentication/login_with_email.dart'
    as _i10;
import 'package:teams/domain/usecases/authentication/logout.dart' as _i11;
import 'package:teams/domain/usecases/authentication/register_user.dart'
    as _i12;
import 'package:teams/presentation/blocs/login/login_bloc.dart' as _i8;
import 'package:teams/presentation/blocs/sign_up/sign_up_bloc.dart' as _i13;
import 'package:teams/presentation/flows/home_flow.dart' as _i6;
import 'package:teams/presentation/flows/login_flow.dart' as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final authRepositoryInjection = _$AuthRepositoryInjection();
    gh.lazySingleton<_i3.AppRouter>(() => _i3.AppRouter());
    gh.lazySingleton<_i4.AuthRepository>(
        () => authRepositoryInjection.getAuthRepository());
    gh.lazySingleton<_i5.GetUserStream>(() => _i5.GetUserStream());
    gh.lazySingleton<_i6.HomeFlow>(() => _i6.HomeFlow());
    gh.factory<_i7.IsUserLoggedIn>(() => _i7.IsUserLoggedIn());
    gh.factory<_i8.LoginBloc>(() => _i8.LoginBloc());
    gh.lazySingleton<_i9.LoginFlow>(() => _i9.LoginFlow());
    gh.factory<_i10.LoginWithEmail>(
        () => _i10.LoginWithEmail(gh<_i4.AuthRepository>()));
    gh.lazySingleton<_i11.Logout>(() => _i11.Logout());
    gh.factory<_i12.RegisterUser>(
        () => _i12.RegisterUser(gh<_i4.AuthRepository>()));
    gh.factory<_i13.SignUpBloc>(() => _i13.SignUpBloc());
    return this;
  }
}

class _$AuthRepositoryInjection extends _i14.AuthRepositoryInjection {}
