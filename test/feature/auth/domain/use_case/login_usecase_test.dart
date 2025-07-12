import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moviehub/feature/auth/domain/entity/auth_response_entity.dart';
import 'package:moviehub/feature/auth/domain/entity/login_entity.dart';
import 'package:moviehub/feature/auth/domain/repository/auth_repository.dart';
import 'package:moviehub/feature/auth/domain/use_case/login_usecase.dart';
import 'package:moviehub/services/core/preference_service.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

class MockPreferenceService extends Mock implements PreferenceService {}

class FakeLoginEntity extends Fake implements LoginEntity {}

void main() {
  late LoginUsecase loginUsecase;
  late MockAuthRepository mockAuthRepository;
  late MockPreferenceService mockPreferenceService;

  setUpAll(() {
    registerFallbackValue(FakeLoginEntity());
  });

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    mockPreferenceService = MockPreferenceService();
    loginUsecase = LoginUsecase(mockPreferenceService, mockAuthRepository);
  });

  final testLoginEntity = LoginEntity(
    email: 'test@example.com',
    password: 'Rishan@123',
  );

  final testAuthResponse = AuthResponseEntity(
    token: 'test_token',
    id: '1',
    email: 'test@example.com',
    name: 'Test User',
  );

  group('LoginUsecase', () {
    test('should return AuthResponseEntity and save credentials when login is successful', () async {
      when(() => mockAuthRepository.loginUser(any())).thenAnswer((_) async => testAuthResponse);

      final result = await loginUsecase.call(testLoginEntity);

      expect(result, equals(Right(testAuthResponse)));
      verify(() => mockAuthRepository.loginUser(testLoginEntity)).called(1);
    });

    test('should return Exception when repository throws an Exception', () async {
      final exception = Exception('Invalid credentials');
      when(() => mockAuthRepository.loginUser(any())).thenThrow(exception);

      final result = await loginUsecase.call(testLoginEntity);

      expect(result.isLeft(), true);
      result.fold(
        (error) => expect(error, equals(exception)),
        (response) => fail('Should return an exception'),
      );
      verify(() => mockAuthRepository.loginUser(testLoginEntity)).called(1);
    });

    test('should return Exception when repository throws a generic error', () async {
      const errorMessage = 'Network timeout';
      when(() => mockAuthRepository.loginUser(any())).thenThrow(errorMessage);

      final result = await loginUsecase.call(testLoginEntity);

      expect(result.isLeft(), true);
      result.fold(
        (exception) => expect(exception.toString(), contains(errorMessage)),
        (response) => fail('Should return an exception'),
      );
      verify(() => mockAuthRepository.loginUser(testLoginEntity)).called(1);
    });
  });
}
