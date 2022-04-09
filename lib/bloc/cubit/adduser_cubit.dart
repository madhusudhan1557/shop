import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'adduser_state.dart';

class AdduserCubit extends Cubit<AdduserState> {
  AdduserCubit() : super(AdduserInitial());
}
