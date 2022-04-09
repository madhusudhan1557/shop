import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/bloc/register/register_cubit.dart';
import 'package:shop/data/models/user.dart';
import 'package:shop/utils/strings.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _address = TextEditingController();

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
                    controller: _fullname,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Full Name",
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
                  height: size.height / 85,
                ),
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
                  height: size.height / 85,
                ),
                Card(
                  child: TextFormField(
                    controller: _phone,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Phone Number",
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
                  height: size.height / 85,
                ),
                Card(
                  child: TextFormField(
                    controller: _address,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Address",
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
                  height: size.height / 85,
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
                    Navigator.pushNamed(context, loginpage);
                  },
                  child: const Text("Login Here"),
                ),
                SizedBox(
                  height: size.height / 45,
                ),
                BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (context, state) {
                    if (state is RegisterLoading) {
                      BotToast.showLoading();
                    }
                    if (state is RegisterCompleted) {
                      BotToast.closeAllLoading();
                      Navigator.of(context).pushNamed(loginpage);
                      BotToast.showText(
                        text: "Registration Completed",
                        contentColor: Colors.green,
                      );
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        UserModel userModel = UserModel();
                        userModel.fullname = _fullname.text;
                        userModel.email = _email.text;
                        userModel.phone = _phone.text;
                        userModel.password = _password.text;
                        userModel.address = _address.text;
                        BlocProvider.of<RegisterCubit>(context)
                            .signUp(userModel);
                      },
                      child: const Text("Register"),
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
