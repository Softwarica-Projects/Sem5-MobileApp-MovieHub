import 'package:dartz/dartz.dart';
import 'package:moviehub/core/utility/usecase.dart';
import 'package:moviehub/services/core/preference_service.dart';

class LogoutUseCase implements UsecaseWithoutParams<String> {
  final PreferenceService _preferenceService;

  LogoutUseCase(this._preferenceService);
  @override
  Future<Either<Exception, String>> call() async {
    try {
      await _preferenceService.clearAll();
      return Right("Logged out successfully");
    } catch (ex) {
      return Future.value(Left(Exception(ex.toString())));
    }
  }
}
