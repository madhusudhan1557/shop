import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'togglepassword_state.dart';

class TogglepasswordCubit extends Cubit<TogglepasswordState> {
  TogglepasswordCubit() : super(TogglepasswordInitial());
}
