import 'package:dartz/dartz.dart';
import 'package:moviehub/core/routes/routes.dart';
import 'package:moviehub/core/utility/usecase.dart';
import 'package:moviehub/main.dart';
import 'package:moviehub/services/core/preference_service.dart';

class ShakeNavigationUseCase implements UsecaseWithoutParams<void> {
  final PreferenceService _preferenceService;

  ShakeNavigationUseCase(this._preferenceService);
  @override
  Future<Either<Exception, void>> call() async {
    try {
      await _preferenceService.clearAll();
      navigatorKey.currentState!.pushNamedAndRemoveUntil(
        Routes.loginPage,
        (route) => false,
      );
      return Right(null);
    } catch (ex) {
      return Left(Exception(ex.toString()));
    }
  }
}
