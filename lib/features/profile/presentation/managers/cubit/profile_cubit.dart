import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit? get(context) => BlocProvider.of(context);

  TextEditingController olderOfAppController =
      TextEditingController(text: '00');

  TextEditingController olderOfAreaController =
      TextEditingController(text: '00');

  TextEditingController olderOfSpisicController =
      TextEditingController(text: '00');
}
