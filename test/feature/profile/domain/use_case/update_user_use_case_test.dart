import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moviehub/feature/profile/domain/entity/user_entity.dart';
import 'package:moviehub/feature/profile/domain/repository/user_repository.dart';
import 'package:moviehub/feature/profile/domain/use_case/update_user_use_case.dart';

class MockUserRepository extends Mock implements IUserRepository {}

class FakeUserEntity extends Fake implements UserEntity {}

void main() {
  late UpdateUserUseCase updateUserUseCase;
  late MockUserRepository mockUserRepository;

  setUpAll(() {
    registerFallbackValue(FakeUserEntity());
  });

  setUp(() {
    mockUserRepository = MockUserRepository();
    updateUserUseCase = UpdateUserUseCase(mockUserRepository);
  });

  final testUser = UserEntity(
    id: '1',
    name: 'Rishan Shrestha Updated',
    email: 'Rishan@gmail.com',
    imageUrl: 'https://example.com/updated_image.jpg',
  );

  group('UpdateUserUseCase', () {
    test('should return success message when repository call is successful', () async {
      const successMessage = 'User updated successfully';
      when(() => mockUserRepository.updateUser(any())).thenAnswer((_) async => successMessage);

      final result = await updateUserUseCase.call(testUser);

      expect(result, equals(const Right(successMessage)));
      verify(() => mockUserRepository.updateUser(testUser)).called(1);
    });

    test('should return Exception when repository throws an exception', () async {
      const errorMessage = 'Update failed';
      when(() => mockUserRepository.updateUser(any())).thenThrow(Exception(errorMessage));

      final result = await updateUserUseCase.call(testUser);

      expect(result.isLeft(), true);
      result.fold(
        (exception) => expect(exception.toString(), contains(errorMessage)),
        (message) => fail('Should return an exception'),
      );
      verify(() => mockUserRepository.updateUser(testUser)).called(1);
    });

    test('should return Exception when repository throws a generic error', () async {
      const errorMessage = 'Server error';
      when(() => mockUserRepository.updateUser(any())).thenThrow(errorMessage);

      final result = await updateUserUseCase.call(testUser);

      expect(result.isLeft(), true);
      result.fold(
        (exception) => expect(exception.toString(), contains(errorMessage)),
        (message) => fail('Should return an exception'),
      );
      verify(() => mockUserRepository.updateUser(testUser)).called(1);
    });
  });
}
