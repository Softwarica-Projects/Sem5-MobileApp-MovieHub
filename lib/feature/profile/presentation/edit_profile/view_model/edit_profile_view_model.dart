// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviehub/core/bloc/state/bloc_state.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileViewModel extends Bloc<EditProfileEvent, EditProfileState> {
  EditProfileViewModel() : super(EditProfileLoaded());
}
