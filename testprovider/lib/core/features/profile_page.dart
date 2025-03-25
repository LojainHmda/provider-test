import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testprovider/core/providers/loclization_provider.dart';
import 'package:testprovider/l10n/app_localizations.dart';
import 'package:testprovider/core/providers/theme_provider.dart';
import 'package:testprovider/core/utils/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var language = Provider.of<LocalizationsProvider>(context);
    var theme = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: theme.theme == ThemeMode.dark
          ? AppColors.primaryDark
          : AppColors.primaryLight,
      body: SafeArea(
        child: Container(
          color: AppColors.whiteColor,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(50)),
                  color: theme.theme == ThemeMode.dark
                      ? AppColors.primaryDark
                      : AppColors.primaryLight,
                ),
                height: 200,
                child: const Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: CircleAvatar(
                          maxRadius: 70,
                          backgroundImage:
                              AssetImage("lib/Assets/birthday.png")),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        Text(
                          "Lojain Hamda",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: AppColors.whiteColor),
                        ),
                        Text(
                          "Lojain@gmail.com",
                          style: TextStyle(
                              fontSize: 15, color: AppColors.whiteColor),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        AppLocalizations.of(context)!.lg,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      DropdownButton(
                          isExpanded: true,
                          hint: Text(AppLocalizations.of(context)!.selectLg),
                          value: language.language,
                          items: [
                            DropdownMenuItem(
                              value: "ar",
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  const Text("العربية"),
                                  const Spacer(),
                                  Visibility(
                                    visible: language.language == "ar",
                                    child: const Icon(Icons.check),
                                  ),
                                ],
                              ),
                            ),
                            DropdownMenuItem(
                                value: "en",
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    const Text("English"),
                                    const Spacer(),
                                    Visibility(
                                      visible: language.language == "en",
                                      child: const Icon(Icons.check),
                                    ),
                                  ],
                                ))
                          ],
                          onChanged: (value) {
                            language.changeLanguage(value!);
                          }),
                      const SizedBox(
                        height: 60,
                      ),
                      Text(
                        AppLocalizations.of(context)!.theme,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      DropdownButton(
                          isExpanded: true,
                          hint: Text(AppLocalizations.of(context)!.theme),
                          value: theme.theme,
                          items: [
                            DropdownMenuItem(
                              value: ThemeMode.dark,
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  Text(AppLocalizations.of(context)!.dark),
                                  const Spacer(),
                                  Visibility(
                                    visible: theme.theme == ThemeMode.dark,
                                    child: const Icon(Icons.check),
                                  ),
                                ],
                              ),
                            ),
                            DropdownMenuItem(
                                value: ThemeMode.light,
                                alignment: Alignment.center,
                                child: Row(children: [
                                  Text(AppLocalizations.of(context)!.light),
                                  const Spacer(),
                                  Visibility(
                                    visible: theme.theme == ThemeMode.light,
                                    child: const Icon(Icons.check),
                                  ),
                                ]))
                          ],
                          onChanged: (value) {
                            theme.changeTheme(value!);
                          }),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
