import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testprovider/core/widgets/custom_textfield.dart';
import 'package:testprovider/l10n/app_localizations.dart';

import '../providers/loclization_provider.dart';
import '../utils/app_colors.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var language = Provider.of<LocalizationsProvider>(context);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.welcome_back),
        actions: [
          GestureDetector(
            onTap: () {
              if (language.language == "ar") {
                language.changeLanguage("en");
              } else {
                language.changeLanguage("ar");
              }
            },
            child: CircleAvatar(
              child: Text(
                AppLocalizations.of(context)!.le,
                style: const TextStyle(fontSize: 15),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomTextField(
              controller: emailController,
              hintText: AppLocalizations.of(context)!.enter_email),
          const SizedBox(
            height: 10,
          ),
          CustomTextField(
              controller: passController,
              hintText: AppLocalizations.of(context)!.enter_password),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: AppColors.primaryLight,
            ),
            onPressed: () {},
            child: Text(
              AppLocalizations.of(context)!.login,
              style: const TextStyle(color: AppColors.whiteColor),
            ),
          )
        ]),
      ),
    ));
  }
}
