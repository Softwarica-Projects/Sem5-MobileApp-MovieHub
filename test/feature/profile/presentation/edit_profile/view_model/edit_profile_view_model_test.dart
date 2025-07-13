import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moviehub/feature/profile/presentation/edit_profile/view_model/edit_profile_view_model.dart';

void main() {
  late EditProfileViewModel editProfileViewModel;

  setUp(() {
    editProfileViewModel = EditProfileViewModel();
  });

  group('EditProfileViewModel', () {
    test('initial state should be EditProfileLoaded', () {
      expect(editProfileViewModel.state, isA<EditProfileLoaded>());
    });

    blocTest<EditProfileViewModel, EditProfileState>(
      'should maintain state when no events are added',
      build: () => editProfileViewModel,
      expect: () => [],
    );

    blocTest<EditProfileViewModel, EditProfileState>(
      'should handle multiple state checks',
      build: () => editProfileViewModel,
      verify: (bloc) {
        expect(bloc.state, isA<EditProfileLoaded>());
      },
    );
  });
}
