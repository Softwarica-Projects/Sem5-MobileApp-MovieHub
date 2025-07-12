import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:moviehub/feature/profile/domain/entity/user_entity.dart';
import 'package:moviehub/feature/profile/domain/repository/user_repository.dart';
import 'package:moviehub/feature/profile/domain/use_case/get_user_use_case.dart';

class MockUserRepository extends Mock implements IUserRepository {}

void main() {
  late GetUserUseCase getUserUseCase;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    getUserUseCase = GetUserUseCase(mockUserRepository);
  });

  final testUser = UserEntity(
    id: '1',
    name: 'Rishan Shrestha',
    email: 'rishan@gmail.com',
    imageUrl: 'https://example.com/image.jpg',
  );

  group('GetUserUseCase', () {
    test('should return UserEntity when repository call is successful', () async {
      when(() => mockUserRepository.getUserInformation()).thenAnswer((_) async => testUser);

      final result = await getUserUseCase.call();

      expect(result, equals(Right(testUser)));
      verify(() => mockUserRepository.getUserInformation()).called(1);
    });

    test('should return Exception when repository throws an exception', () async {
      const errorMessage = 'Network error';
      when(() => mockUserRepository.getUserInformation()).thenThrow(Exception(errorMessage));

      final result = await getUserUseCase.call();

      expect(result.isLeft(), true);
      result.fold(
        (exception) => expect(exception.toString(), contains(errorMessage)),
        (user) => fail('Should return an exception'),
      );
      verify(() => mockUserRepository.getUserInformation()).called(1);
    });

    test('should return Exception when repository throws a generic error', () async {
      const errorMessage = 'Generic error';
      when(() => mockUserRepository.getUserInformation()).thenThrow(errorMessage);

      final result = await getUserUseCase.call();

      expect(result.isLeft(), true);
      result.fold(
        (exception) => expect(exception.toString(), contains(errorMessage)),
        (user) => fail('Should return an exception'),
      );
      verify(() => mockUserRepository.getUserInformation()).called(1);
    });
  });
}
