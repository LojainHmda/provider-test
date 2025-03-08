import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testprovider/core/providers/loclization_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:testprovider/core/providers/theme_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
     var language = Provider.of<LocalizationsProvider>(context);
    var theme = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.lg)),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DropdownButton(
                  dropdownColor: Colors.teal,
                  isExpanded: true,
                  hint: Text(AppLocalizations.of(context)!.selectLg),
                  value: language.language,
                  items: [
                    DropdownMenuItem(
                        value: "ar",
                        child: Row(
                          children: [
                            Text("العربية"),
                            Spacer(),
                            Visibility(
                              visible: language.language == "ar",
                              child: Icon(Icons.check),
                            ),
                          ],
                        ),
                        alignment: Alignment.center),
                    DropdownMenuItem(
                        value: "en",
                        child: Row(
                          children: [
                            Text("English"),
                            Spacer(),
                            Visibility(
                              visible: language.language == "en",
                              child: Icon(Icons.check),
                            ),
                          ],
                        ),
                        alignment: Alignment.center)
                  ],
                  onChanged: (value) {
                    language.changeLanguage(value!);
                  }),
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DropdownButton(
                  dropdownColor: Colors.teal,
                  isExpanded: true,
                  hint: Text(AppLocalizations.of(context)!.theme),
                  value: theme.theme,
                  items: [
                    DropdownMenuItem(
                      value: ThemeMode.dark,
                      child: Row(
                        children: [
                          Text(AppLocalizations.of(context)!.dark),
                          Spacer(),
                          Visibility(
                            visible: theme.theme == ThemeMode.dark,
                            child: Icon(Icons.check),
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                    ),
                    DropdownMenuItem(
                        value: ThemeMode.light,
                        child: Row(children: [
                          Text(AppLocalizations.of(context)!.light),
                          Spacer(),
                          Visibility(
                            visible: theme.theme == ThemeMode.light,
                            child: Icon(Icons.check),
                          ),
                        ]),
                        alignment: Alignment.center)
                  ],
                  onChanged: (value) {
                    theme.changeTheme(value!);
                  }),
            ),
          ],
        ),
      ),
    );

  }
}
