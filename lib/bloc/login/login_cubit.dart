import 'package:bloc/bloc.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../data/models/user.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  signIn(UserModel userModel) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    emit(LoginLoading());
    try {
      await _auth.signInWithEmailAndPassword(
          email: userModel.email!, password: userModel.password!);
      emit(LoginCompleted());
    } on FirebaseAuthException catch (e) {
      emit(LoginFailed());
      BotToast.showText(text: e.message!);
    }
  }
}
