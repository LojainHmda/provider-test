import 'package:flutter/material.dart';
import 'package:testprovider/core/widgets/custom_textfield.dart';

class AddUser extends StatelessWidget {
  AddUser({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  GlobalKey formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextField(
                      controller: nameController, hintText: "Name"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextField(
                      controller: emailController, hintText: "Email"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextField(
                      controller: passController, hintText: "Password"),
                ),
              ],
            ))
      ],
    )));
  }
}
