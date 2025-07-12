// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'edit_profile_view_model.dart';

abstract class EditProfileState {}

class EditProfileInitial extends EditProfileState {
  EditProfileInitial();
}

class EditProfileLoaded extends EditProfileState implements LoadedState {
  EditProfileLoaded();
}
