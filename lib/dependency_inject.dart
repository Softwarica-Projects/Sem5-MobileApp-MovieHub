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
  final httpService = locator<HttpService>();

  ///[Services]
  locator.registerSingleton<AuthService>(AuthService(httpService));
  locator.registerSingleton<GeneralService>(GeneralService(httpService));
  locator.registerSingleton<MovieService>(MovieService(httpService));
}
