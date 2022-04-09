import 'package:bloc/bloc.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../data/models/user.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  signUp(UserModel userModel) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    CollectionReference users = FirebaseFirestore.instance.collection("users");
    emit(RegisterLoading());
    try {
      await _auth
          .createUserWithEmailAndPassword(
        email: userModel.email!,
        password: userModel.password!,
      )
          .then((register) {
        users.add({
          'fullname': userModel.fullname,
          'email': userModel.email,
          'phone': userModel.phone,
          'address': userModel.address,
        });
      });
      emit(RegisterCompleted());
    } on FirebaseAuthException catch (e) {
      emit(RegisterFailed());
      BotToast.showText(text: e.message!);
    }
  }
}
