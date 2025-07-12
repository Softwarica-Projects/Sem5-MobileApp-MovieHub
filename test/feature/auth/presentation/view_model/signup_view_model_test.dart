import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moviehub/feature/auth/domain/entity/auth_response_entity.dart';
import 'package:moviehub/feature/auth/domain/entity/signup_entity.dart';
import 'package:moviehub/feature/auth/domain/use_case/register_usecase.dart';
import 'package:moviehub/feature/auth/presentation/view_model/signup/signup_view_model.dart';

class MockRegisterUsecase extends Mock implements RegisterUsecase {}

class FakeSignupEntity extends Fake implements SignupEntity {}

void main() {
  late SignupViewModel signupViewModel;
  late MockRegisterUsecase mockRegisterUsecase;

  setUpAll(() {
    registerFallbackValue(FakeSignupEntity());
  });

  setUp(() {
    mockRegisterUsecase = MockRegisterUsecase();
    signupViewModel = SignupViewModel(mockRegisterUsecase);
  });

  final testSignupEntity = SignupEntity(
    name: 'Rishan Shrestha',
    email: 'rishan@gmail.com',
    password: 'Rishan@123',
  );

  final testAuthResponse = AuthResponseEntity(
    token: 'test_token',
    id: '1',
    email: 'rishan@gmail.com',
    name: 'Rishan Shrestha',
  );

  group('SignupViewModel', () {
    test('initial state should be SignupInitial', () {
      expect(signupViewModel.state, isA<SignupInitial>());
    });

    blocTest<SignupViewModel, SignupState>(
      'should emit [SignupLoading, SignupSuccess] when SignupRequested is successful',
      build: () {
        when(() => mockRegisterUsecase.call(any())).thenAnswer((_) async => Right(testAuthResponse));
        return signupViewModel;
      },
      act: (bloc) => bloc.add(SignupRequested(testSignupEntity)),
      expect: () => [
        isA<SignupLoading>(),
        isA<SignupSuccess>(),
      ],
      verify: (_) {
        verify(() => mockRegisterUsecase.call(testSignupEntity)).called(1);
      },
    );

    blocTest<SignupViewModel, SignupState>(
      'should emit [SignupLoading, SignupError] when SignupRequested fails with validation error',
      build: () {
        when(() => mockRegisterUsecase.call(any())).thenAnswer((_) async => Left(Exception('Email already exists')));
        return signupViewModel;
      },
      act: (bloc) => bloc.add(SignupRequested(testSignupEntity)),
      expect: () => [
        isA<SignupLoading>(),
        isA<SignupError>(),
      ],
      verify: (_) {
        verify(() => mockRegisterUsecase.call(testSignupEntity)).called(1);
      },
    );

    blocTest<SignupViewModel, SignupState>(
      'should emit [SignupLoading, SignupError] when SignupRequested fails with network error',
      build: () {
        when(() => mockRegisterUsecase.call(any())).thenAnswer((_) async => Left(Exception('Network connection failed')));
        return signupViewModel;
      },
      act: (bloc) => bloc.add(SignupRequested(testSignupEntity)),
      expect: () => [
        isA<SignupLoading>(),
        isA<SignupError>(),
      ],
      verify: (_) {
        verify(() => mockRegisterUsecase.call(testSignupEntity)).called(1);
      },
    );
  });
}
