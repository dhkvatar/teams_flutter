// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:teams/app/di/di.dart' as _i18;
import 'package:teams/app/navigation/app_router.dart' as _i3;
import 'package:teams/data/repositories/fake_chat_repository.dart' as _i7;
import 'package:teams/domain/repositories/auth_repository.dart' as _i4;
import 'package:teams/domain/repositories/chat_repository.dart' as _i6;
import 'package:teams/domain/usecases/authentication/get_user_stream.dart'
    as _i9;
import 'package:teams/domain/usecases/authentication/is_user_logged_in.dart'
    as _i11;
import 'package:teams/domain/usecases/authentication/login_with_email.dart'
    as _i14;
import 'package:teams/domain/usecases/authentication/logout.dart' as _i15;
import 'package:teams/domain/usecases/authentication/register_user.dart'
    as _i16;
import 'package:teams/domain/usecases/chat/get_chats.dart' as _i8;
import 'package:teams/presentation/blocs/chat/chat_bloc.dart' as _i5;
import 'package:teams/presentation/blocs/login/login_bloc.dart' as _i12;
import 'package:teams/presentation/blocs/sign_up/sign_up_bloc.dart' as _i17;
import 'package:teams/presentation/flows/home_flow.dart' as _i10;
import 'package:teams/presentation/flows/login_flow.dart' as _i13;

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
    gh.factory<_i5.ChatBloc>(() => _i5.ChatBloc());
    gh.factory<_i6.ChatRepository>(() => _i7.FakeChatRepository());
    gh.factory<_i8.GetChats>(() => _i8.GetChats(
          authRepository: gh<_i4.AuthRepository>(),
          chatRepository: gh<_i6.ChatRepository>(),
        ));
    gh.lazySingleton<_i9.GetUserStream>(() => _i9.GetUserStream());
    gh.lazySingleton<_i10.HomeFlow>(() => _i10.HomeFlow());
    gh.factory<_i11.IsUserLoggedIn>(() => _i11.IsUserLoggedIn());
    gh.factory<_i12.LoginBloc>(() => _i12.LoginBloc());
    gh.lazySingleton<_i13.LoginFlow>(() => _i13.LoginFlow());
    gh.factory<_i14.LoginWithEmail>(
        () => _i14.LoginWithEmail(gh<_i4.AuthRepository>()));
    gh.lazySingleton<_i15.Logout>(() => _i15.Logout());
    gh.factory<_i16.RegisterUser>(
        () => _i16.RegisterUser(gh<_i4.AuthRepository>()));
    gh.factory<_i17.SignUpBloc>(() => _i17.SignUpBloc());
    return this;
  }
}

class _$AuthRepositoryInjection extends _i18.AuthRepositoryInjection {}
