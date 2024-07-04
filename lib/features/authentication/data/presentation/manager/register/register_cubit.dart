import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit? get(context) => BlocProvider.of(context);

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  var formFirstScreenRegisterKey = GlobalKey<FormState>();
}
