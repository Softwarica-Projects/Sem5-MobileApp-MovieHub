import 'package:hive_flutter/hive_flutter.dart';
import 'package:moviehub/feature/auth/data/data_source/local_datasource/auth_local_datasource.dart';
import 'package:moviehub/feature/auth/data/data_source/remote_datasource/auth_remote_datasource.dart';
import 'package:moviehub/feature/auth/data/repository/local_repository/auth_local_repository.dart';
import 'package:moviehub/feature/auth/data/repository/remote_repository/auth_remote_repository.dart';
import 'package:moviehub/feature/auth/domain/repository/auth_repository.dart';
import 'package:moviehub/feature/auth/domain/use_case/login_usecase.dart';
import 'package:moviehub/feature/auth/domain/use_case/register_usecase.dart';
import 'package:moviehub/feature/auth/presentation/view_model/login/login_view_model.dart';
import 'package:moviehub/feature/auth/presentation/view_model/signup/signup_view_model.dart';
import 'package:moviehub/services/auth/auth_service.dart';
import 'package:moviehub/services/core/http_service.dart';
import 'package:moviehub/services/core/preference_service.dart';
import 'package:get_it/get_it.dart';
import 'package:moviehub/services/general/general_service.dart';
import 'package:moviehub/services/movie/movie_service.dart';

final locator = GetIt.instance;

setupDependencies() async {
  ///[Core]
  locator.registerSingletonAsync<PreferenceService>(
    () => PreferenceService.getInstance(),
  );

  final preferenceService = await locator.getAsync<PreferenceService>();
  locator.registerSingleton<HttpService>(
    HttpService(preferenceService),
  );

  ///[Data Source]
  _dataSource();

  ///[Repository]
  _repository();

  ///[Services]
  _services();

  ///[Use Cases]
  _useCase();

  ///[View Mode]
  _viewModel();
}

_dataSource() {
  locator.registerSingleton<AuthLocalDatasource>(
    AuthLocalDatasource(Hive),
  );
  locator.registerSingleton<AuthRemoteDatasource>(
    AuthRemoteDatasource(locator<HttpService>()),
  );
}

_services() {
  final httpService = locator<HttpService>();
  locator.registerSingleton<AuthService>(AuthService(httpService));
  locator.registerSingleton<GeneralService>(GeneralService(httpService));
  locator.registerSingleton<MovieService>(MovieService(httpService));
}

_repository() {
  locator.registerFactory<IAuthRepository>(
    () => AuthLocalRepository(locator<AuthLocalDatasource>()),
  );
  // locator.registerFactory<IAuthRepository>(
  //   () => AuthRemoteRepository(locator<AuthRemoteDatasource>()),
  // );
}

_useCase() {
  locator.registerFactory(() => LoginUsecase(
        locator<PreferenceService>(),
        locator<IAuthRepository>(),
      ));
  locator.registerFactory(() => RegisterUsecase(
        authRepository: locator<IAuthRepository>(),
      ));
}

_viewModel() {
  locator.registerFactory(() => LoginViewModel(locator<LoginUsecase>()));
  locator.registerFactory(() => SignupViewModel(locator<RegisterUsecase>()));
}
