import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moviehub/feature/auth/domain/entity/auth_response_entity.dart';
import 'package:moviehub/feature/auth/domain/entity/login_entity.dart';
import 'package:moviehub/feature/auth/domain/use_case/login_usecase.dart';
import 'package:moviehub/feature/auth/presentation/view_model/login/login_view_model.dart';

class MockLoginUsecase extends Mock implements LoginUsecase {}

class FakeLoginEntity extends Fake implements LoginEntity {}

void main() {
  late LoginViewModel loginViewModel;
  late MockLoginUsecase mockLoginUsecase;

  setUpAll(() {
    registerFallbackValue(FakeLoginEntity());
  });

  setUp(() {
    mockLoginUsecase = MockLoginUsecase();
    loginViewModel = LoginViewModel(mockLoginUsecase);
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

  group('LoginViewModel', () {
    test('initial state should be LoginInitial', () {
      expect(loginViewModel.state, isA<LoginInitial>());
    });

    blocTest<LoginViewModel, LoginState>(
      'should emit [LoginLoading, LoginSuccess] when LoginRequested is successful',
      build: () {
        when(() => mockLoginUsecase.call(any())).thenAnswer((_) async => Right(testAuthResponse));
        return loginViewModel;
      },
      act: (bloc) => bloc.add(LoginRequested(testLoginEntity)),
      expect: () => [
        isA<LoginLoading>(),
        isA<LoginSuccess>(),
      ],
      verify: (_) {
        verify(() => mockLoginUsecase.call(testLoginEntity)).called(1);
      },
    );

    blocTest<LoginViewModel, LoginState>(
      'should emit [LoginLoading, LoginError] when LoginRequested fails with network error',
      build: () {
        when(() => mockLoginUsecase.call(any())).thenAnswer((_) async => Left(Exception('Network error')));
        return loginViewModel;
      },
      act: (bloc) => bloc.add(LoginRequested(testLoginEntity)),
      expect: () => [
        isA<LoginLoading>(),
        isA<LoginError>(),
      ],
      verify: (_) {
        verify(() => mockLoginUsecase.call(testLoginEntity)).called(1);
      },
    );

    blocTest<LoginViewModel, LoginState>(
      'should emit [LoginLoading, LoginError] when LoginRequested fails with invalid credentials',
      build: () {
        when(() => mockLoginUsecase.call(any())).thenAnswer((_) async => Left(Exception('Invalid credentials')));
        return loginViewModel;
      },
      act: (bloc) => bloc.add(LoginRequested(testLoginEntity)),
      expect: () => [
        isA<LoginLoading>(),
        isA<LoginError>(),
      ],
      verify: (_) {
        verify(() => mockLoginUsecase.call(testLoginEntity)).called(1);
      },
    );
  });
}
