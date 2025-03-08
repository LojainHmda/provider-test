import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testprovider/core/features/home_page.dart';
import 'package:testprovider/core/features/profile_page.dart';
import 'package:testprovider/core/providers/loclization_provider.dart';
import 'package:testprovider/core/utils/app_theme.dart';

import 'core/features/bottom_nav_bar_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'core/features/x.dart';
import 'core/providers/theme_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => LocalizationsProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      )
    ],
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var language = Provider.of<LocalizationsProvider>(context);
    var theme = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      themeMode: theme.theme,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(language.language),
      initialRoute: "/",
      routes: {
        "/": (context) => BottomNavBar(),
      },
    );
  }
}
