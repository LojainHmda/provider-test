import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testprovider/core/features/addEvent.dart';
import 'package:testprovider/core/features/login_page.dart';
import 'package:testprovider/core/features/register.dart';
import 'package:testprovider/core/providers/loclization_provider.dart';
import 'package:testprovider/core/utils/app_theme.dart';

import 'core/features/bottom_nav_bar_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/providers/theme_provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var language = Provider.of<LocalizationsProvider>(context);
    var theme = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: theme.theme,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(language.language),
      initialRoute: "/",
      routes: {
        "/login": (context) => LoginPage(),
        "/": (context) => BottomNavBar(),
        "/addEvent": (context) => AddEvent(),
        "/register": (context) => AddUser(),
      },
    );
  }
}
