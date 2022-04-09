import 'package:flutter/material.dart';
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
                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This Field is Required";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: size.height / 65,
                ),
                TextFormField(
                  controller: _password,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Password",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This Field is Required";
                    }
                    return null;
                  },
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
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("Login"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
