import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moviehub/core/domain/use_case/shake_navigation_use_case.dart';
import 'package:moviehub/feature/profile/domain/entity/user_entity.dart';
import 'package:moviehub/feature/profile/domain/use_case/get_user_use_case.dart';
import 'package:moviehub/feature/profile/domain/use_case/logout_use_case%20copy.dart';
import 'package:moviehub/feature/profile/domain/use_case/update_user_use_case.dart';
import 'package:moviehub/feature/profile/presentation/profile/view_model/user_view_model.dart';

class MockGetUserUseCase extends Mock implements GetUserUseCase {}

class MockUpdateUserUseCase extends Mock implements UpdateUserUseCase {}

class MockLogoutUseCase extends Mock implements LogoutUseCase {}

class MockShakeNavigationUseCase extends Mock implements ShakeNavigationUseCase {}

class FakeUserEntity extends Fake implements UserEntity {}

void main() {
  late UserViewModel userViewModel;
  late MockGetUserUseCase mockGetUserUseCase;
  late MockUpdateUserUseCase mockUpdateUserUseCase;
  late MockLogoutUseCase mockLogoutUseCase;
  late MockShakeNavigationUseCase mockShakeNavigationUseCase;

  setUpAll(() {
    registerFallbackValue(FakeUserEntity());
  });

  setUp(() {
    mockGetUserUseCase = MockGetUserUseCase();
    mockUpdateUserUseCase = MockUpdateUserUseCase();
    mockLogoutUseCase = MockLogoutUseCase();
    mockShakeNavigationUseCase = MockShakeNavigationUseCase();
    userViewModel = UserViewModel(
      mockGetUserUseCase,
      mockUpdateUserUseCase,
      mockLogoutUseCase,
      mockShakeNavigationUseCase,
    );
  });

  final testUser = UserEntity(
    id: '1',
    name: 'Rishan Shrestha',
    email: 'rishan@gmail.com',
    imageUrl: 'https://example.com/image.jpg',
  );

  group('UserViewModel', () {
    test('initial state should be UserInitial', () {
      expect(userViewModel.state, isA<UserInitial>());
    });

    blocTest<UserViewModel, UserState>(
      'should emit [UserLoading, UserLoaded] when FetchUserEvent is successful',
      build: () {
        when(() => mockGetUserUseCase.call()).thenAnswer((_) async => Right(testUser));
        return userViewModel;
      },
      act: (bloc) => bloc.add(FetchUserEvent()),
      expect: () => [
        isA<UserLoading>(),
        isA<UserLoaded>(),
      ],
      verify: (_) {
        verify(() => mockGetUserUseCase.call()).called(1);
      },
    );

    blocTest<UserViewModel, UserState>(
      'should emit [UserLoading, UserError] when FetchUserEvent fails',
      build: () {
        when(() => mockGetUserUseCase.call()).thenAnswer((_) async => Left(Exception('Network error')));
        return userViewModel;
      },
      act: (bloc) => bloc.add(FetchUserEvent()),
      expect: () => [
        isA<UserLoading>(),
        isA<UserError>(),
      ],
      verify: (_) {
        verify(() => mockGetUserUseCase.call()).called(1);
      },
    );

    blocTest<UserViewModel, UserState>(
      'should emit [UpdateUserLoading, UserError] and trigger FetchUserEvent when UpdateUserEvent is called',
      build: () {
        when(() => mockUpdateUserUseCase.call(any())).thenAnswer((_) async => const Right('Success'));
        when(() => mockGetUserUseCase.call()).thenAnswer((_) async => Right(testUser));
        return userViewModel;
      },
      act: (bloc) => bloc.add(UpdateUserEvent(testUser)),
      expect: () => [
        isA<UpdateUserLoading>(),
        isA<UserError>(),
        isA<UserLoading>(),
        isA<UserLoaded>(),
      ],
      verify: (_) {
        verify(() => mockUpdateUserUseCase.call(testUser)).called(1);
        verify(() => mockGetUserUseCase.call()).called(1);
      },
    );
  });
}
