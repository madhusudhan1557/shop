import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/bloc/login/login_cubit.dart';
import 'package:shop/data/models/user.dart';
import 'package:shop/utils/strings.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController _email = TextEditingController();

  final TextEditingController _password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).padding.top),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Card(
                  child: TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Email",
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).padding.top * 0.4),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This Field is Required";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: size.height / 65,
                ),
                Card(
                  child: TextFormField(
                    controller: _password,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Password",
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).padding.top * 0.4),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "This Field is Required";
                      }
                      return null;
                    },
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, registerpage);
                  },
                  child: const Text("Register Here"),
                ),
                SizedBox(
                  height: size.height / 45,
                ),
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginLoading) {
                      BotToast.showLoading();
                    }
                    if (state is LoginCompleted) {
                      BotToast.closeAllLoading();

                      BotToast.showText(
                        text: "Login Successfull",
                        contentColor: Colors.green,
                      );
                    }
                    if (state is LoginFailed) {
                      BotToast.closeAllLoading();
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        UserModel userModel = UserModel();
                        userModel.email = _email.text;
                        userModel.password = _password.text;
                        BlocProvider.of<LoginCubit>(context).signIn(userModel);
                      },
                      child: const Text("Login"),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
