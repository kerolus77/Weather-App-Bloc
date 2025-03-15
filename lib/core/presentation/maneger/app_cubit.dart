import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  final TextEditingController language = TextEditingController();

  static AppCubit get(context, {bool listen = false}) =>
      BlocProvider.of<AppCubit>(context, listen: listen);
}
